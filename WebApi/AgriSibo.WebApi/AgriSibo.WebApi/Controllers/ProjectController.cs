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
    public class ProjectController : ApiController
    {
        // GET: api/Project
        public IEnumerable<Project> Get()
        {
            return Data
                 .Entities
                 .Projects;
        }

        // GET: api/Project/5
        public Project Get(int id)
        {
            return Data
               .Entities
               .Projects
               .FirstOrDefault(project => project.Id == id);
        }

        //// POST: api/Project
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT: api/Project/5
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE: api/Project/5
        //public void Delete(int id)
        //{
        //}
    }
}
