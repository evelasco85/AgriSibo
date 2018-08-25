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
    public class CropController : ApiController
    {
        // GET: api/Crop
        public IEnumerable<Crop> Get()
        {
            return Data
                .Entities
                .Crops;
        }

        // GET: api/Crop/5
        public Crop Get(int id)
        {
            return Data
               .Entities
               .Crops
               .FirstOrDefault(crop => crop.Id == id);
        }

        //// POST: api/Crop
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT: api/Crop/5
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE: api/Crop/5
        //public void Delete(int id)
        //{
        //}
    }
}
