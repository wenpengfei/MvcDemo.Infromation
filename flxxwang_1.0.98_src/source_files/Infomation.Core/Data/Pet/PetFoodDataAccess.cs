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
    public class PetFoodDataAccess : DataAccess<PetFood, int>
    {
        //public override PetFood Insert(PetFood instance)
        //{
        //    PetFood food = instance as PetFood;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,ObjectType,Tag,Quality,Price,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@ObjectType,@Tag,@Quality,@Price,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, food.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, food.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, food.ObjectType);
        //    db.AddInParameter(cmd, "@Tag", DbType.Byte, food.Tag);
        //    db.AddInParameter(cmd, "@Quality", DbType.Byte, food.Quality);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, food.Price);

        //    db.AddInParameter(cmd, "@Content", DbType.String, food.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, food.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, food.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, food.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, food.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, food.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, food.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, food.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, food.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, food.Source);

        //    food.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return food;
        //}

        public override List<PetFood> Insert(List<PetFood> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,ObjectType,Tag,Quality,Price,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@ObjectType" + i + ",@Tag" + i + ",@Quality" + i + ",@Price" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var food = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, food.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, food.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, food.ObjectType);
                db.AddInParameter(cmd, "@Tag" + i, DbType.Byte, food.Tag);
                db.AddInParameter(cmd, "@Quality" + i, DbType.Byte, food.Quality);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, food.Price);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, food.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, food.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, food.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, food.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, food.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, food.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, food.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, food.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, food.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, food.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, food.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, food.TId);
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
