using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;
using Framework;

namespace Infomation.Core.Data
{
    public class PetGiveDataAccess : DataAccess<PetGive, int>
    {
        //public override PetGive Insert(PetGive instance)
        //{
        //    PetGive give = instance as PetGive;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, give.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, give.Title);

        //    db.AddInParameter(cmd, "@Content", DbType.String, give.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, give.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, give.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, give.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, give.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, give.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, give.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, give.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, give.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, give.Source);

        //    give.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return give;
        //}

        public override List<PetGive> Insert(List<PetGive> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var give = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, give.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, give.Title);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, give.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, give.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, give.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, give.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, give.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, give.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, give.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, give.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, give.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, give.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, give.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, give.TId);
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
