using AgriSibo.WebApi.Utilities;
using System.Web.Http;

namespace AgriSibo.WebApi.Controllers
{
    public class InvestorFlowController : ApiController
    {
        [HttpPost, Route("api/SubmitInvestmentApplication")]
        public void SubmitInvestmentApplication(int investorId, int projectId, decimal investedAmount, decimal expectedReturnRate, decimal expectedReturnAmount)
        {
            Data.Entities.SubmitInvestmentApplication(investorId, projectId, investedAmount, expectedReturnRate, expectedReturnAmount);
        }
    }
}
