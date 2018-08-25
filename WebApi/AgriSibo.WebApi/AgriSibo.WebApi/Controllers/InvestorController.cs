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
    public class InvestorController : ApiController
    {
        // GET: api/Investor
        public IEnumerable<Investor> Get()
        {
            return Data
                .Entities
                .Investors;
        }

        // GET: api/Investor/5
        public Investor Get(int id)
        {
            return Data
               .Entities
               .Investors
               .FirstOrDefault(investor => investor.Id == id);
        }

        //// POST: api/Investor
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT: api/Investor/5
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE: api/Investor/5
        //public void Delete(int id)
        //{
        //}
    }
}
