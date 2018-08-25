using AgriSibo.WebApi.EF;
using AgriSibo.WebApi.Utilities;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace AgriSibo.WebApi.Controllers
{
    public class InvestmentController : ApiController
    {
        // GET: api/WorkInvestment
        public IEnumerable<Investment> Get()
        {
            return Data
                .Entities
                .Investments;
        }

        // GET: api/WorkInvestment/5
        public Investment Get(int id)
        {
            return Data
                .Entities
                .Investments
                .FirstOrDefault(investment => investment.id == id);
        }

        //// POST: api/WorkInvestment
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT: api/WorkInvestment/5
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE: api/WorkInvestment/5
        //public void Delete(int id)
        //{
        //}
    }
}
