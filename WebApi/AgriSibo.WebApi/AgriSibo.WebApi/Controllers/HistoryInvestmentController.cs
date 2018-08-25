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
    public class HistoryInvestmentController : ApiController
    {
        // GET: api/HistoryInvestment
        public IEnumerable<HistoryInvestment> Get()
        {
            return Data
                .Entities
                .HistoryInvestments;
        }

        // GET: api/HistoryInvestment/5
        public HistoryInvestment Get(int id)
        {
            return Data
                .Entities
                .HistoryInvestments
                .FirstOrDefault(investment => investment.id == id);
        }

        //// POST: api/HistoryInvestment
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT: api/HistoryInvestment/5
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE: api/HistoryInvestment/5
        //public void Delete(int id)
        //{
        //}
    }
}
