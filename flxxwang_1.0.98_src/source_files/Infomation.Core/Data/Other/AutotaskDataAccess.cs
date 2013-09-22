using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;

namespace Infomation.Core.Data
{
    public class AutotaskDataAccess:DataAccess<Autotask,int>
    {
        public override List<Autotask> Insert(List<Autotask> instances)
        {
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Action,State,Content,DealStart) VALUES (@Action" + i + ",@State" + i + ",@Content" + i + ",@DealStart" + i + ")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var task = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Action" + i, DbType.Byte, task.Action);
                db.AddInParameter(cmd, "@State" + i, DbType.Byte, task.State);
                db.AddInParameter(cmd, "@Content" + i, DbType.String, task.Content);
                db.AddInParameter(cmd, "@DealStart" + i, DbType.DateTime, task.DealStart);
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
