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
    public class FarmersCropController : ApiController
    {
        // GET: api/FarmersCrop
        public IEnumerable<FarmersCrop> Get()
        {
            return Data
                .Entities
                .FarmersCrops;
        }

        // GET: api/FarmersCrop/5
        public FarmersCrop Get(int id)
        {
            return Data
                .Entities
                .FarmersCrops
                .FirstOrDefault(farmersCrop => farmersCrop.Id == id);
        }

        //// POST: api/FarmersCrop
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT: api/FarmersCrop/5
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE: api/FarmersCrop/5
        //public void Delete(int id)
        //{
        //}
    }
}
