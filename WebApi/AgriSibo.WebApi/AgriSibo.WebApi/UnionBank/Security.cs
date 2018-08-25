using AgriSibo.WebApi.EF;
using AgriSibo.WebApi.Utilities;
using System.Linq;

namespace AgriSibo.WebApi.UnionBank
{
    public static class Security
    {
        public static string GetFarmerToken(int entityId)
        {
            ApiSecurity record = Data
                .Entities
                .ApiSecurities
                .FirstOrDefault(security => security.FarmerId == entityId);

            if (record == null) return string.Empty;

            return string.Empty;
        }

        public static string GetInvestorToken(int entityId)
        {
            ApiSecurity record = Data
                .Entities
                .ApiSecurities
                .FirstOrDefault(security => security.InvestorId == entityId);

            if (record == null) return string.Empty;

            return string.Empty;
        }
    }
}