using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;

namespace Infomation.Core.Data
{
    public class PicPhoneDataAccess : DataAccess<PicPhone, int>
    {
        public override List<PicPhone> Insert(List<PicPhone> instances)
        {
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Pic,Phone) VALUES (@Pic" + i + ",@Phone" + i + ")";
                sql += ";SELECT SCOPE_IDENTITY() as newIDValue";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var picphone = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Pic" + i, DbType.String, picphone.Pic);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, picphone.Phone);

            }
            var ds = db.ExecuteDataSet(cmd);
            for (var i = 0; i < instances.Count(); i++)
            {
                var instance = instances.ElementAt(i);
                instance.Id = Convert.ToInt32(ds.Tables[i].Rows[0][0]);
            }
            return instances;
        }

        //public override List<PicPhone> Insert(List<PicPhone> instances)
        //{
        //    if (instances == null || instances.Count() == 0)
        //    {
        //        return instances;
        //    }
        //    var sql = string.Empty;
        //    sql = "declare @id int;";
        //    for (var i = 0; i < instances.Count(); i++)
        //    {
        //        sql += "set @id=null;";
        //        sql += "select @id=id from " + TableName + " where Pic=@Pic" + i + ";";
        //        sql += "if @id is null begin ";
        //        sql += " INSERT INTO " + TableName + " (Pic,Phone) VALUES (@Pic" + i + ",@Phone" + i + ");";
        //        sql += " SELECT SCOPE_IDENTITY() as newIDValue;";
        //        sql += "end else begin select @id as newIDValue; end;";
        //    }
        //    //sql = sql.Substring(1);

        //    DbCommand cmd = db.GetSqlStringCommand(sql);

        //    for (var i = 0; i < instances.Count(); i++)
        //    {
        //        var picphone = instances.ElementAt(i);
        //        db.AddInParameter(cmd, "@Pic" + i, DbType.String, picphone.Pic);
        //        db.AddInParameter(cmd, "@Phone" + i, DbType.String, picphone.Phone);
                
        //    }
        //    var ds = db.ExecuteDataSet(cmd);
        //    for (var i = 0; i < instances.Count(); i++)
        //    {
        //        var instance = instances.ElementAt(i);
        //        instance.Id = Convert.ToInt32(ds.Tables[i].Rows[0][0]);
        //    }
        //    return instances;
        //}
    }
}
