using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;

namespace Framework
{
    public class LogDataAccess:DataAccess<Log,int>
    {

        public override List<Log> Insert(List<Log> instances)
        {
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Message,StackTrace,Url)" +
                                            "VALUES (@Type" + i + ",@Message" + i + ",@StackTrace" + i + ",@Url" + i + ")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var log = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type" + i, DbType.Byte, log.Type);
                db.AddInParameter(cmd, "@Message" + i, DbType.String, log.Message);
                db.AddInParameter(cmd, "@StackTrace" + i, DbType.String, log.StackTrace);
                db.AddInParameter(cmd, "@Url" + i, DbType.String, log.Url);
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
