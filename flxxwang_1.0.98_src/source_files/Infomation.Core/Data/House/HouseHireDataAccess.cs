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
    public class HouseHireDataAccess : DataAccess<HouseHire, int>
    {
        //public override HouseHire Insert(HouseHire instance)
        //{
        //    HouseHire house = instance as HouseHire;

        //    string sql = "INSERT INTO " + TableName + " (Title,District1,District2,HouseType1,HouseType2,HouseType3,HouseType4,HouseType5,Room1,Room2,Room3,Room4,Room5,FitType1,FitType2,FitType3,FitType4,Price1,Price2,PayWay,Bed,WaterHeater,WashingMachine,AirConditioner,Icebox,Television,Broadband,[Content],IsBiz,ContactPerson,Phone,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@District1,@District2,@HouseType1,@HouseType2,@HouseType3,@HouseType4,@HouseType5,@Room1,@Room2,@Room3,@Room4,@Room5,@FitType1,@FitType2,@FitType3,@FitType4,@Price1,@Price2,@PayWay,@Bed,@WaterHeater,@WashingMachine,@AirConditioner,@Icebox,@Television,@Broadband,@Content,@IsBiz,@ContactPerson,@Phone,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, house.Title);
        //    db.AddInParameter(cmd, "@District1", DbType.String, house.District1);
        //    db.AddInParameter(cmd, "@District2", DbType.String, house.District2);

        //    db.AddInParameter(cmd, "@HouseType1", DbType.Boolean, house.HouseType1);
        //    db.AddInParameter(cmd, "@HouseType2", DbType.Boolean, house.HouseType2);
        //    db.AddInParameter(cmd, "@HouseType3", DbType.Boolean, house.HouseType3);
        //    db.AddInParameter(cmd, "@HouseType4", DbType.Boolean, house.HouseType4);
        //    db.AddInParameter(cmd, "@HouseType5", DbType.Boolean, house.HouseType5);

        //    db.AddInParameter(cmd, "@Room1", DbType.Boolean, house.Room1);
        //    db.AddInParameter(cmd, "@Room2", DbType.Boolean, house.Room2);
        //    db.AddInParameter(cmd, "@Room3", DbType.Boolean, house.Room3);
        //    db.AddInParameter(cmd, "@Room4", DbType.Boolean, house.Room4);
        //    db.AddInParameter(cmd, "@Room5", DbType.Boolean, house.Room5);

        //    db.AddInParameter(cmd, "@FitType1", DbType.Boolean, house.FitType1);
        //    db.AddInParameter(cmd, "@FitType2", DbType.Boolean, house.FitType2);
        //    db.AddInParameter(cmd, "@FitType3", DbType.Boolean, house.FitType3);
        //    db.AddInParameter(cmd, "@FitType4", DbType.Boolean, house.FitType4);

        //    db.AddInParameter(cmd, "@Price1", DbType.Int32, house.Price1);
        //    db.AddInParameter(cmd, "@Price2", DbType.Int32, house.Price2);
        //    db.AddInParameter(cmd, "@PayWay", DbType.String, house.PayWay);
        //    db.AddInParameter(cmd, "@Bed", DbType.Boolean, house.Bed);
        //    db.AddInParameter(cmd, "@WaterHeater", DbType.Boolean, house.WaterHeater);
        //    db.AddInParameter(cmd, "@WashingMachine", DbType.Boolean, house.WashingMachine);
        //    db.AddInParameter(cmd, "@AirConditioner", DbType.Boolean, house.AirConditioner);
        //    db.AddInParameter(cmd, "@Icebox", DbType.Boolean, house.Icebox);
        //    db.AddInParameter(cmd, "@Television", DbType.Boolean, house.Television);
        //    db.AddInParameter(cmd, "@Broadband", DbType.Boolean, house.Broadband);

        //    db.AddInParameter(cmd, "@Content", DbType.String, house.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, house.IsBiz);

        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, house.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, house.Phone);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, house.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, house.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, house.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, house.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, house.Source);

        //    house.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return house;
        //}

        public override List<HouseHire> Insert(List<HouseHire> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,District1,District2,HouseType1,HouseType2,HouseType3,HouseType4,HouseType5,Room1,Room2,Room3,Room4,Room5,FitType1,FitType2,FitType3,FitType4,Price1,Price2,PayWay,Bed,WaterHeater,WashingMachine,AirConditioner,Icebox,Television,Broadband,[Content],IsBiz,ContactPerson,Phone,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@District1_" + i + ",@District2_" + i + ",@HouseType1_" + i + ",@HouseType2_" + i + ",@HouseType3_" + i + ",@HouseType4_" + i + ",@HouseType5_" + i + ",@Room1_" + i + ",@Room2_" + i + ",@Room3_" + i + ",@Room4_" + i + ",@Room5_" + i + ",@FitType1_" + i + ",@FitType2_" + i + ",@FitType3_" + i + ",@FitType4_" + i + ",@Price1_" + i + ",@Price2_" + i + ",@PayWay" + i + ",@Bed" + i + ",@WaterHeater" + i + ",@WashingMachine" + i + ",@AirConditioner" + i + ",@Icebox" + i + ",@Television" + i + ",@Broadband" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var house = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, house.Title);
                db.AddInParameter(cmd, "@District1_" + i, DbType.String, house.District1);
                db.AddInParameter(cmd, "@District2_" + i, DbType.String, house.District2);

                db.AddInParameter(cmd, "@HouseType1_" + i, DbType.Boolean, house.HouseType1);
                db.AddInParameter(cmd, "@HouseType2_" + i, DbType.Boolean, house.HouseType2);
                db.AddInParameter(cmd, "@HouseType3_" + i, DbType.Boolean, house.HouseType3);
                db.AddInParameter(cmd, "@HouseType4_" + i, DbType.Boolean, house.HouseType4);
                db.AddInParameter(cmd, "@HouseType5_" + i, DbType.Boolean, house.HouseType5);

                db.AddInParameter(cmd, "@Room1_" + i, DbType.Boolean, house.Room1);
                db.AddInParameter(cmd, "@Room2_" + i, DbType.Boolean, house.Room2);
                db.AddInParameter(cmd, "@Room3_" + i, DbType.Boolean, house.Room3);
                db.AddInParameter(cmd, "@Room4_" + i, DbType.Boolean, house.Room4);
                db.AddInParameter(cmd, "@Room5_" + i, DbType.Boolean, house.Room5);

                db.AddInParameter(cmd, "@FitType1_" + i, DbType.Boolean, house.FitType1);
                db.AddInParameter(cmd, "@FitType2_" + i, DbType.Boolean, house.FitType2);
                db.AddInParameter(cmd, "@FitType3_" + i, DbType.Boolean, house.FitType3);
                db.AddInParameter(cmd, "@FitType4_" + i, DbType.Boolean, house.FitType4);

                db.AddInParameter(cmd, "@Price1_" + i, DbType.Int32, house.Price1);
                db.AddInParameter(cmd, "@Price2_" + i, DbType.Int32, house.Price2);
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
