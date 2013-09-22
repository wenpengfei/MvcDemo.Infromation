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
    public class HouseRentDataAccess : DataAccess<HouseRent, int>
    {

        //public override HouseRent Insert(HouseRent instance)
        //{
        //    HouseRent house = instance as HouseRent;

        //    string sql = "INSERT INTO " + TableName + " (Title,District,Address,Room,Parlor,Toilet,Floor,FloorTotal,Area,ObjectType,FitType,Toward,Price,PayWay,Bed,WaterHeater,WashingMachine,AirConditioner,Icebox,Television,Broadband,[Content],IsBiz,ContactPerson,Phone,Pictures,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@District,@Address,@Room,@Parlor,@Toilet,@Floor,@FloorTotal,@Area,@ObjectType,@FitType,@Toward,@Price,@PayWay,@Bed,@WaterHeater,@WashingMachine,@AirConditioner,@Icebox,@Television,@Broadband,@Content,@IsBiz,@ContactPerson,@Phone,@Pictures,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, house.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, house.District);
        //    db.AddInParameter(cmd, "@Address", DbType.String, house.Address);
        //    db.AddInParameter(cmd, "@Room", DbType.Byte, house.Room);
        //    db.AddInParameter(cmd, "@Parlor", DbType.Byte, house.Parlor);
        //    db.AddInParameter(cmd, "@Toilet", DbType.Byte, house.Toilet);
        //    db.AddInParameter(cmd, "@Floor", DbType.Int16, house.Floor);
        //    db.AddInParameter(cmd, "@FloorTotal", DbType.Byte, house.FloorTotal);
        //    db.AddInParameter(cmd, "@Area", DbType.Int16, house.Area);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, house.ObjectType);
        //    db.AddInParameter(cmd, "@FitType", DbType.String, house.FitType);
        //    db.AddInParameter(cmd, "@Toward", DbType.String, house.Toward);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, house.Price);
        //    db.AddInParameter(cmd, "@PayWay", DbType.String, house.PayWay);
        //    db.AddInParameter(cmd, "@Bed", DbType.Boolean, house.Bed);
        //    db.AddInParameter(cmd, "@WaterHeater", DbType.Boolean, house.WaterHeater);
        //    db.AddInParameter(cmd, "@WashingMachine", DbType.Boolean, house.WashingMachine);
        //    db.AddInParameter(cmd, "@AirConditioner", DbType.Boolean, house.AirConditioner);
        //    db.AddInParameter(cmd, "@Icebox", DbType.Boolean, house.Icebox);
        //    db.AddInParameter(cmd, "@Television", DbType.Boolean, house.Television);
        //    db.AddInParameter(cmd, "@Broadband", DbType.Boolean, house.Broadband);
            
        //    //db.AddInParameter(cmd, "@Bedroom", DbType.String, house.Bedroom);
        //    //db.AddInParameter(cmd, "@HireLimit", DbType.String, house.HireLimit);

        //    db.AddInParameter(cmd, "@Content", DbType.String, house.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, house.IsBiz);

        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, house.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, house.Phone);

        //    db.AddInParameter(cmd, "@Pictures", DbType.String, house.Pictures);
        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, house.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, house.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, house.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, house.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, house.Source);

        //    house.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return house;
        //}

        public override List<HouseRent> Insert(List<HouseRent> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,District,Address,Room,Parlor,Toilet,Floor,FloorTotal,Area,ObjectType,FitType,Toward,Price,PayWay,Bed,WaterHeater,WashingMachine,AirConditioner,Icebox,Television,Broadband,[Content],IsBiz,ContactPerson,Phone,Pictures,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@District" + i + ",@Address" + i + ",@Room" + i + ",@Parlor" + i + ",@Toilet" + i + ",@Floor" + i + ",@FloorTotal" + i + ",@Area" + i + ",@ObjectType" + i + ",@FitType" + i + ",@Toward" + i + ",@Price" + i + ",@PayWay" + i + ",@Bed" + i + ",@WaterHeater" + i + ",@WashingMachine" + i + ",@AirConditioner" + i + ",@Icebox" + i + ",@Television" + i + ",@Broadband" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Pictures" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var house = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, house.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, house.District);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, house.Address);
                db.AddInParameter(cmd, "@Room" + i, DbType.Byte, house.Room);
                db.AddInParameter(cmd, "@Parlor" + i, DbType.Byte, house.Parlor);
                db.AddInParameter(cmd, "@Toilet" + i, DbType.Byte, house.Toilet);
                db.AddInParameter(cmd, "@Floor" + i, DbType.Int16, house.Floor);
                db.AddInParameter(cmd, "@FloorTotal" + i, DbType.Byte, house.FloorTotal);
                db.AddInParameter(cmd, "@Area" + i, DbType.Int16, house.Area);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, house.ObjectType);
                db.AddInParameter(cmd, "@FitType" + i, DbType.String, house.FitType);
                db.AddInParameter(cmd, "@Toward" + i, DbType.String, house.Toward);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, house.Price);
                db.AddInParameter(cmd, "@PayWay" + i, DbType.String, house.PayWay);
                db.AddInParameter(cmd, "@Bed" + i, DbType.Boolean, house.Bed);
                db.AddInParameter(cmd, "@WaterHeater" + i, DbType.Boolean, house.WaterHeater);
                db.AddInParameter(cmd, "@WashingMachine" + i, DbType.Boolean, house.WashingMachine);
                db.AddInParameter(cmd, "@AirConditioner" + i, DbType.Boolean, house.AirConditioner);
                db.AddInParameter(cmd, "@Icebox" + i, DbType.Boolean, house.Icebox);
                db.AddInParameter(cmd, "@Television" + i, DbType.Boolean, house.Television);
                db.AddInParameter(cmd, "@Broadband" + i, DbType.Boolean, house.Broadband);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, house.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, house.IsBiz);

                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, house.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, house.Phone);

                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, house.Pictures);
                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, house.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, house.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, house.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, house.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, house.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, house.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, house.TId);
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
