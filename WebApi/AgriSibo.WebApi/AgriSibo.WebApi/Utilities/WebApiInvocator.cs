using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

namespace AgriSibo.WebApi.Utilities
{
    public delegate void UrlRequestInvocationDelegate(string method, string url, IList<KeyValuePair<string, string>> headers, StringBuilder requestBody);
    public delegate void UrlResponseInvocationDelegate(IList<KeyValuePair<string, string>> headers,
        int statusCode, string status,
        StringBuilder responseBody);

    public interface IWebApiInvocator
    {
        UrlRequestInvocationDelegate UrlRequestInvocation { set; }
        UrlResponseInvocationDelegate UrlResponseInvocation { set; }

        Func<string, StringBuilder> RequestDataFormatter { get; set; }
        Func<string, StringBuilder> ResponseDataFormatter { get; set; }

        void InvokeRequest(HttpWebRequest request, StringBuilder requestData);
        void InvokeRequest(HttpWebRequest request, StringBuilder requestData,
            UrlRequestInvocationDelegate urlRequestInvocation,
            UrlResponseInvocationDelegate urlResponseInvocation);
        void InvokeRequest(HttpWebRequest request,
            StringBuilder requestData, Encoding requestDataEncoding,
            UrlRequestInvocationDelegate urlRequestInvocation,
            UrlResponseInvocationDelegate urlResponseInvocation);
        void InvokeRequest(HttpWebRequest request, StringBuilder requestData,
            Encoding requestDataEncoding);
    }

    public class WebApiInvocator : IWebApiInvocator
    {
        private readonly Encoding DEFAULT_ENCODING = Encoding.ASCII;

        private static IWebApiInvocator s_instance = new WebApiInvocator();
        public static IWebApiInvocator GetInstance() { return s_instance; }

        private UrlRequestInvocationDelegate _urlRequestInvocation;
        private UrlResponseInvocationDelegate _urlResponseInvocation;

        public UrlRequestInvocationDelegate UrlRequestInvocation { set => _urlRequestInvocation = value; }
        public UrlResponseInvocationDelegate UrlResponseInvocation { set => _urlResponseInvocation = value; }

        public Func<string, StringBuilder> RequestDataFormatter { get; set; }
        public Func<string, StringBuilder> ResponseDataFormatter { get; set; }

        private WebApiInvocator() { }

        public void InvokeRequest(HttpWebRequest request, StringBuilder requestData)
        {
            InvokeRequest(request, requestData,
                DEFAULT_ENCODING,
                _urlRequestInvocation, _urlResponseInvocation);
        }

        public void InvokeRequest(HttpWebRequest request,
           StringBuilder requestData,
           UrlRequestInvocationDelegate urlRequestInvocation,
           UrlResponseInvocationDelegate urlResponseInvocation)
        {
            InvokeRequest(request, requestData,
                DEFAULT_ENCODING,
                urlRequestInvocation, urlResponseInvocation);
        }

        public void InvokeRequest(HttpWebRequest request, StringBuilder requestData,
            Encoding requestDataEncoding)
        {
            InvokeRequest(request, requestData,
                requestDataEncoding,
                _urlRequestInvocation, _urlResponseInvocation);
        }

        public void InvokeRequest(HttpWebRequest request,
            StringBuilder requestData,
            Encoding requestDataEncoding,
            UrlRequestInvocationDelegate urlRequestInvocation,
            UrlResponseInvocationDelegate urlResponseInvocation)
        {
            if (request == null) return;

            List<KeyValuePair<string, string>> requestHeaders = new List<KeyValuePair<string, string>>();

            requestHeaders.AddRange(GetHeaders(request.Headers));

            if (RequestDataFormatter == null)
                RequestDataFormatter = (data) => { return new StringBuilder(data); };

            if (urlRequestInvocation != null)
            {
                string data = (requestData == null) ? string.Empty : requestData.ToString();

                urlRequestInvocation(request.Method, request.RequestUri.OriginalString, requestHeaders,
                    RequestDataFormatter(data));
            }

            if (requestData != null)
            {
                byte[] contentBytes = requestDataEncoding.GetBytes(requestData.ToString());

                request.ContentLength = contentBytes.Length;

                using (Stream requestWriter = request.GetRequestStream())
                {
                    requestWriter.Write(contentBytes, 0, contentBytes.Length);
                }
            }

            List<KeyValuePair<string, string>> responseHeaders = new List<KeyValuePair<string, string>>();
            StringBuilder responseData = new StringBuilder();
            int statusCode = (int)HttpStatusCode.BadRequest;
            string status = HttpStatusCode.BadRequest.ToString();

            try
            {
                HttpWebResponse response = request.GetResponse() as HttpWebResponse;

                if (response != null)
                {
                    statusCode = (int)response.StatusCode;
                    status = response.StatusDescription;

                    responseHeaders.AddRange(GetHeaders(response.Headers));

                    using (StreamReader responseReader = new StreamReader(response.GetResponseStream()))
                    {
                        responseData.Append(responseReader.ReadToEnd());
                    }
                }
            }
            catch (WebException ex)
            {
                HttpWebResponse response = ex.Response as HttpWebResponse;

                if (response != null)
                {
                    statusCode = (int)response.StatusCode;
                    status = response.StatusDescription;

                    responseHeaders.AddRange(GetHeaders(response.Headers));

                    using (StreamReader responseReader = new StreamReader(response.GetResponseStream()))
                    {
                        responseData.Append(responseReader.ReadToEnd());
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            if (ResponseDataFormatter == null)
                ResponseDataFormatter = (data) => { return new StringBuilder(data); };

            if (urlResponseInvocation != null)
                urlResponseInvocation(responseHeaders,
                    statusCode, status,
                    ResponseDataFormatter(responseData.ToString()));
        }

        IList<KeyValuePair<string, string>> GetHeaders(WebHeaderCollection headerCollection)
        {
            IList<KeyValuePair<string, string>> headers = new List<KeyValuePair<string, string>>();

            if (headerCollection == null) return headers;

            foreach (string key in headerCollection.AllKeys)
            {
                headers.Add(new KeyValuePair<string, string>(key, headerCollection[key]));
            }

            return headers;
        }
    }
}