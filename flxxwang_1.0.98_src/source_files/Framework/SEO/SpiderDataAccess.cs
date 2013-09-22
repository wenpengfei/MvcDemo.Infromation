using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;

namespace Framework.Seo.Data
{
    public class SpiderDataAccess : DataAccess<Spider, int>
    {
        public override List<Spider> Insert(List<Spider> instances)
        {
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Url,SearchEngine,UserAgent,WebSite)" +
                                            "VALUES (@Url" + i + ",@SearchEngine" + i + ",@UserAgent" + i + ",@WebSite" + i + ")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var spider = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Url" + i, DbType.String, spider.Url);
                db.AddInParameter(cmd, "@SearchEngine" + i, DbType.Byte, spider.SearchEngine);
                db.AddInParameter(cmd, "@UserAgent" + i, DbType.String, spider.UserAgent);
                db.AddInParameter(cmd, "@WebSite" + i, DbType.Byte, spider.WebSite);
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
