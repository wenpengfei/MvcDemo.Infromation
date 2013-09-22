using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;

namespace Infomation.Core.Data
{
    public class StatClickDataAccess : DataAccess<StatClick, int>
    {
        public override List<StatClick> Insert(List<StatClick> instances)
        {
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Url,Text,IP,Address)" +
                                            "VALUES (@Url" + i + ",@Text" + i + ",@IP" + i + ",@Address" + i + ")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var stat = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Url" + i, DbType.String, stat.Url);
                db.AddInParameter(cmd, "@Text" + i, DbType.String, stat.Text);
                db.AddInParameter(cmd, "@IP" + i, DbType.String, stat.IP);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, stat.Address);
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
