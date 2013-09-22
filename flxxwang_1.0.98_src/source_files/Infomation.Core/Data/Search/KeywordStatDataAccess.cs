using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Framework;
using System.Data.Common;
using System.Data;

namespace Infomation.Core.Data
{
    public class KeywordStatDataAccess : DataAccess<KeywordStat, int>
    {
        //public override KeywordStat Insert(KeywordStat instance)
        //{
        //    var stat = instance as KeywordStat;

        //    string sql = "INSERT INTO " + TableName + " (KeywordId,CityId,Total)" +
        //                                "VALUES (@KeywordId,@CityId,@Total)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@KeywordId", DbType.Int32, stat.KeywordId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, stat.CityId);
        //    db.AddInParameter(cmd, "@Total", DbType.Int32, stat.Total);

        //    stat.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return stat;
        //}

        public override List<KeywordStat> Insert(List<KeywordStat> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (KeywordId,CityId,Total)" +
                                            "VALUES (@KeywordId" + i + ",@CityId" + i + ",@Total" + i + ")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var stat = instances.ElementAt(i);
                db.AddInParameter(cmd, "@KeywordId"+i, DbType.Int32, stat.KeywordId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, stat.CityId);
                db.AddInParameter(cmd, "@Total" + i, DbType.Int32, stat.Total);
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
