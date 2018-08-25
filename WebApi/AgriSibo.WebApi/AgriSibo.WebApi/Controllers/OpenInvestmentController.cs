using AgriSibo.WebApi.EF;
using AgriSibo.WebApi.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AgriSibo.WebApi.Controllers
{
    public class OpenInvestmentController : ApiController
    {
        // GET: api/OpenInvestment
        public IEnumerable<OpenInvestment> Get()
        {
            return Data
                .Entities
                .OpenInvestments;
        }

        // GET: api/OpenInvestment/5
        public OpenInvestment Get(int id)
        {
            return Data
                .Entities
                .OpenInvestments
                .FirstOrDefault(investment => investment.id == id);
        }

        //// POST: api/OpenInvestment
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT: api/OpenInvestment/5
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE: api/OpenInvestment/5
        //public void Delete(int id)
        //{
        //}
    }
}
