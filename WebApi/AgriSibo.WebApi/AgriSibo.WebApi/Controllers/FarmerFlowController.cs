using AgriSibo.WebApi.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AgriSibo.WebApi.Controllers
{
    public class FarmerFlowController : ApiController
    {
        [HttpPost, Route("api/AcceptInvestmentApplication")]
        public void AcceptInvestmentApplication(int projectId, int investorId)
        {
            Data.Entities.AcceptInvestmentApplication(projectId, investorId);
        }

        [HttpPost, Route("api/InitiateProject")]
        public void InitiateProject(int projectId)
        {
            Data.Entities.InitiateProject(projectId);
        }

        [HttpPost, Route("api/AddFundsToFarmer")]
        public void AddFundsToFarmer(int farmerId, decimal fundsToAdd)
        {
            Data.Entities.AddFundsToFarmer(farmerId, fundsToAdd);
        }

        [HttpPost, Route("api/CompleteProject")]
        public void CompleteProject(int projectId)
        {
            Data.Entities.CompleteProject(projectId);
        }
    }
}
