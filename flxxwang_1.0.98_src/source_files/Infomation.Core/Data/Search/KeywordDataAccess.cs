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
    public class SearchDataAccess : DataAccess<Keyword, int>
    {
        //public override Keyword Insert(Keyword instance)
        //{
        //    var keyword = instance as Keyword;

        //    string sql = "INSERT INTO " + TableName + " ([Key],Code,ParentCode,ObjType,Tag)" +
        //                                "VALUES (@Key,@Code,@ParentCode,@ObjType,@Tag)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Key", DbType.String, keyword.Key);
        //    db.AddInParameter(cmd, "@Code", DbType.String, keyword.Code);
        //    db.AddInParameter(cmd, "@ParentCode", DbType.String, keyword.ParentCode);
        //    db.AddInParameter(cmd, "@ObjType", DbType.Byte, keyword.ObjType);
        //    db.AddInParameter(cmd, "@Tag", DbType.Byte, keyword.Tag);
        //    //db.AddInParameter(cmd, "@Total", DbType.String, keyword.Total);

        //    keyword.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return keyword;
        //}

        public override List<Keyword> Insert(List<Keyword> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " ([Key],Code,ParentCode,ObjType,Tag)" +
                                            "VALUES (@Key" + i + ",@Code" + i + ",@ParentCode" + i + ",@ObjType" + i + ",@Tag" + i + ")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var keyword = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Key"+i, DbType.String, keyword.Key);
                db.AddInParameter(cmd, "@Code" + i, DbType.String, keyword.Code);
                db.AddInParameter(cmd, "@ParentCode" + i, DbType.String, keyword.ParentCode);
                db.AddInParameter(cmd, "@ObjType" + i, DbType.Byte, keyword.ObjType);
                db.AddInParameter(cmd, "@Tag" + i, DbType.Byte, keyword.Tag);
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
