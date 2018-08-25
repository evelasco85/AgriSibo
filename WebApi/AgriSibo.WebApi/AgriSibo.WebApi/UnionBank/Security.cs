using AgriSibo.WebApi.EF;
using AgriSibo.WebApi.Utilities;
using System.Linq;

namespace AgriSibo.WebApi.UnionBank
{
    public static class Security
    {
        public static string GetToken(int entityId)
        {
            ApiSecurity record = Data
                .Entities
                .ApiSecurities
                .FirstOrDefault(security => security.entityId == entityId);

            if (record == null) return string.Empty;

            return string.Empty;
        }
    }
}