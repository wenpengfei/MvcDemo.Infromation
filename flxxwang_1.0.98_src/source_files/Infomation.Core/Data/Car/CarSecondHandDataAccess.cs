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
    public class CarSecondHandDataAccess : DataAccess<CarSecondHand, int>
    {
       
        //public override CarSecondHand Insert(CarSecondHand instance)
        //{
        //    CarSecondHand car = instance as CarSecondHand;

        //    string sql = "INSERT INTO " + TableName + " (BrandId,SeriesId,ModelId,BrandDescription,ObjectType,Exhaust,Transmission,Color,BuyTime,Rundistance,Price,SaleCarNum,Title,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,Pictures,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@BrandId,@SeriesId,@ModelId,@BrandDescription,@ObjectType,@Exhaust,@Transmission,@Color,@BuyTime,@Rundistance,@Price,@SaleCarNum,@Title,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@Pictures,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@BrandId", DbType.Byte, car.BrandId);
        //    db.AddInParameter(cmd, "@SeriesId", DbType.Byte, car.SeriesId);
        //    db.AddInParameter(cmd, "@ModelId", DbType.Byte, car.ModelId);
        //    db.AddInParameter(cmd, "@BrandDescription", DbType.String, car.BrandDescription);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, car.ObjectType);
        //    db.AddInParameter(cmd, "@Exhaust", DbType.Single, car.Exhaust);
        //    db.AddInParameter(cmd, "@Transmission", DbType.String, car.Transmission);
        //    db.AddInParameter(cmd, "@Color", DbType.String, car.Color);
        //    db.AddInParameter(cmd, "@BuyTime", DbType.Int16, car.BuyTime);
        //    db.AddInParameter(cmd, "@Rundistance", DbType.Single, car.Rundistance);
        //    db.AddInParameter(cmd, "@SaleCarNum", DbType.Boolean, car.SaleCarNum);
        //    db.AddInParameter(cmd, "@Title", DbType.String, car.Title);
        //    db.AddInParameter(cmd, "@Price", DbType.Single, car.Price);

        //    db.AddInParameter(cmd, "@Content", DbType.String, car.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, car.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, car.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, car.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, car.QQOrMSN);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, car.Pictures);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, car.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, car.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, car.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, car.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, car.Source);

        //    car.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return car;
        //}

        public override List<CarSecondHand> Insert(List<CarSecondHand> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (BrandId,SeriesId,ModelId,BrandDescription,ObjectType,Exhaust,Transmission,Color,BuyTime,Rundistance,Price,SaleCarNum,Title,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,Pictures,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@BrandId" + i + ",@SeriesId" + i + ",@ModelId" + i + ",@BrandDescription" + i + ",@ObjectType" + i + ",@Exhaust" + i + ",@Transmission" + i + ",@Color" + i + ",@BuyTime" + i + ",@Rundistance" + i + ",@Price" + i + ",@SaleCarNum" + i + ",@Title" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@Pictures" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var car = instances.ElementAt(i);
                db.AddInParameter(cmd, "@BrandId"+i, DbType.Byte, car.BrandId);
                db.AddInParameter(cmd, "@SeriesId" + i, DbType.Byte, car.SeriesId);
                db.AddInParameter(cmd, "@ModelId" + i, DbType.Byte, car.ModelId);
                db.AddInParameter(cmd, "@BrandDescription" + i, DbType.String, car.BrandDescription);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, car.ObjectType);
                db.AddInParameter(cmd, "@Exhaust" + i, DbType.Single, car.Exhaust);
                db.AddInParameter(cmd, "@Transmission" + i, DbType.String, car.Transmission);
                db.AddInParameter(cmd, "@Color" + i, DbType.String, car.Color);
                db.AddInParameter(cmd, "@BuyTime" + i, DbType.Int16, car.BuyTime);
                db.AddInParameter(cmd, "@Rundistance" + i, DbType.Single, car.Rundistance);
                db.AddInParameter(cmd, "@SaleCarNum" + i, DbType.Boolean, car.SaleCarNum);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, car.Title);
                db.AddInParameter(cmd, "@Price" + i, DbType.Single, car.Price);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, car.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, car.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, car.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, car.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, car.QQOrMSN);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, car.Pictures);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, car.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, car.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, car.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, car.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, car.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, car.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, car.TId);
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
