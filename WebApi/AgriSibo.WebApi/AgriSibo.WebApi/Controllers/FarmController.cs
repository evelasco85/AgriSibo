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
    public class FarmController : ApiController
    {
        // GET: api/Farm
        public IEnumerable<Farm> Get()
        {
            return Data
                .Entities
                .Farms;
        }

        public IEnumerable<Farm> GetByFarmerId(int farmerId)
        {
            return Get()
                .Where(farm => farm.FarmerId == farmerId);
        }

        // GET: api/Farm/5
        public Farm Get(int id)
        {
            return Data
                .Entities
                .Farms
                .FirstOrDefault(farm => farm.Id == id);
        }

        //// POST: api/Farm
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT: api/Farm/5
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE: api/Farm/5
        //public void Delete(int id)
        //{
        //}
    }
}
