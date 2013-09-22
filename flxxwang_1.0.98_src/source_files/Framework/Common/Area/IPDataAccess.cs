using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;

namespace Framework.Common
{
    public class IPDataAccess:DataAccess<IP,int>
    {
        public override List<IP> Insert(List<IP> instances)
        {
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (StartIP,EndIP,Address,CityId)" +
                                            "VALUES (@StartIP_" + i + ",@EndIP_" + i + ",@Address_" + i + ",@CityId_" + i + ")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var ip = instances.ElementAt(i);
                db.AddInParameter(cmd, "@StartIP_" + i, DbType.Int64, ip.StartIP);
                db.AddInParameter(cmd, "@EndIP_" + i, DbType.Int64, ip.EndIP);
                db.AddInParameter(cmd, "@Address_" + i, DbType.String, ip.Address);

                db.AddInParameter(cmd, "@CityId_" + i, DbType.String, ip.CityId);
            }
            var ds = db.ExecuteDataSet(cmd);
            for (var i = 0; i < instances.Count(); i++)
            {
                var instance = instances.ElementAt(i);
                instance.Id = Convert.ToInt32(ds.Tables[i].Rows[0][0]);
            }
            return instances;
        }
        
    }
}
