using AgriSibo.WebApi.EF;
using AgriSibo.WebApi.UnionBank;
using AgriSibo.WebApi.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AgriSibo.WebApi.Controllers
{
    public class FarmerController : ApiController
    {
        // GET: api/Farmer
        public IEnumerable<Farmer> Get()
        {
            return Data
                .Entities
                .Farmers;
        }

        // GET: api/Farmer/5
        public Farmer Get(int id)
        {
            return Data
                .Entities
                .Farmers
                .FirstOrDefault(farmer => farmer.id == id);
        }

        //// POST: api/Farmer
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT: api/Farmer/5
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE: api/Farmer/5
        //public void Delete(int id)
        //{
        //}
    }
}
