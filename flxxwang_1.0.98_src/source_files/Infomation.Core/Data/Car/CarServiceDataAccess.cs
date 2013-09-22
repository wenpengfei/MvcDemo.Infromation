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
    public class CarServiceDataAccess : DataAccess<CarService, int>
    {
      
        //public override CarService Insert(CarService instance)
        //{
        //    CarService car = instance as CarService;

        //    string sql = "INSERT INTO " + TableName + " (Title,ObjectType,Price,Tag1,Tag2,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,Pictures,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@ObjectType,@Price,@Tag1,@Tag2,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@Pictures,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, car.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, car.ObjectType);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, car.Price);
        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, car.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, car.Tag2);

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

        public override List<CarService> Insert(List<CarService> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,ObjectType,Price,Tag1,Tag2,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,Pictures,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@ObjectType" + i + ",@Price" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@Pictures" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var car = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, car.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, car.ObjectType);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, car.Price);
                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, car.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, car.Tag2);

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
