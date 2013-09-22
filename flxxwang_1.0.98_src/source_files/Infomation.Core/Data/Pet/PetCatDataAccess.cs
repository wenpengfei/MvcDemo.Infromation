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
    public class PetCatDataAccess : DataAccess<PetCat, int>
    {
        //public override PetCat Insert(PetCat instance)
        //{
        //    PetCat cat = instance as PetCat;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,ObjectType,Price,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@ObjectType,@Price,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, cat.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, cat.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, cat.ObjectType);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, cat.Price);

        //    db.AddInParameter(cmd, "@Content", DbType.String, cat.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, cat.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, cat.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, cat.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, cat.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, cat.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, cat.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, cat.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, cat.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, cat.Source);

        //    cat.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return cat;
        //}

        public override List<PetCat> Insert(List<PetCat> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,ObjectType,Price,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@ObjectType" + i + ",@Price" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var cat = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, cat.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, cat.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, cat.ObjectType);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, cat.Price);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, cat.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, cat.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, cat.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, cat.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, cat.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, cat.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, cat.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, cat.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, cat.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, cat.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, cat.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, cat.TId);
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
