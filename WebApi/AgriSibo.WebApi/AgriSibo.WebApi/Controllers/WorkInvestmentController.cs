using AgriSibo.WebApi.EF;
using AgriSibo.WebApi.Utilities;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace AgriSibo.WebApi.Controllers
{
    public class WorkInvestmentController : ApiController
    {
        // GET: api/WorkInvestment
        public IEnumerable<WorkInvestment> Get()
        {
            return Data
                .Entities
                .WorkInvestments;
        }

        // GET: api/WorkInvestment/5
        public WorkInvestment Get(int id)
        {
            return Data
                .Entities
                .WorkInvestments
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
