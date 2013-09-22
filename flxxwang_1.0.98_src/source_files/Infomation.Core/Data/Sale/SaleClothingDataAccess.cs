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
    public class SaleClothingDataAccess : DataAccess<SaleClothing, int>
    {
        //public override SaleClothing Insert(SaleClothing instance)
        //{
        //    SaleClothing clothing = instance as SaleClothing;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag1,Tag2,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District,@ObjectType,@Tag1,@Tag2,@Quality,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, clothing.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, clothing.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, clothing.District);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, clothing.ObjectType);
        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, clothing.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, clothing.Tag2);
        //    db.AddInParameter(cmd, "@Quality", DbType.Byte, clothing.Quality);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, clothing.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, clothing.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, clothing.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, clothing.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, clothing.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, clothing.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, clothing.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, clothing.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, clothing.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, clothing.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, clothing.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, clothing.Source);

        //    clothing.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return clothing;
        //}

        public override List<SaleClothing> Insert(List<SaleClothing> instances)
        {
             if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag1,Tag2,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@District" + i + ",@ObjectType" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@Quality" + i + ",@Price" + i + ",@Pictures" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var clothing = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, clothing.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, clothing.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, clothing.District);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, clothing.ObjectType);
                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, clothing.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, clothing.Tag2);
                db.AddInParameter(cmd, "@Quality" + i, DbType.Byte, clothing.Quality);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, clothing.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, clothing.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, clothing.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, clothing.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, clothing.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, clothing.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, clothing.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, clothing.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, clothing.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, clothing.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, clothing.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, clothing.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, clothing.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, clothing.TId);
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
