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
    public class HouseSecondDataAccess : DataAccess<HouseSecond, int>
    {
        //public override HouseSecond Insert(HouseSecond instance)
        //{
        //    HouseSecond house = instance as HouseSecond;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District,District2,Address,ObjectType,FitType,Toward,Room,Parlor,Toilet,Floor,FloorTotal,[Right],Price,Price2,Area,Area2,Age,[Content],IsBiz,ContactPerson,Phone,Pictures,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District,@District2,@Address,@ObjectType,@FitType,@Toward,@Room,@Parlor,@Toilet,@Floor,@FloorTotal,@Right,@Price,@Price2,@Area,@Area2,@Age,@Content,@IsBiz,@ContactPerson,@Phone,@Pictures,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);

        //    db.AddInParameter(cmd, "@Type", DbType.Byte, house.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, house.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, house.District);
        //    db.AddInParameter(cmd, "@District2", DbType.String, house.District2);
        //    db.AddInParameter(cmd, "@Address", DbType.String, house.Address);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, house.ObjectType);
        //    db.AddInParameter(cmd, "@FitType", DbType.String, house.FitType);
        //    db.AddInParameter(cmd, "@Toward", DbType.String, house.Toward);
        //    db.AddInParameter(cmd, "@Room", DbType.Byte, house.Room);
        //    db.AddInParameter(cmd, "@Parlor", DbType.Byte, house.Parlor);
        //    db.AddInParameter(cmd, "@Toilet", DbType.Byte, house.Toilet);
        //    db.AddInParameter(cmd, "@Floor", DbType.Int16, house.Floor);
        //    db.AddInParameter(cmd, "@FloorTotal", DbType.Byte, house.FloorTotal);
        //    db.AddInParameter(cmd, "@Right", DbType.String, house.Right);
        //    db.AddInParameter(cmd, "@Price", DbType.Single, house.Price);
        //    db.AddInParameter(cmd, "@Price2", DbType.Single, house.Price2);
        //    db.AddInParameter(cmd, "@Area", DbType.Int32, house.Area);
        //    db.AddInParameter(cmd, "@Area2", DbType.Int32, house.Area2);
        //    db.AddInParameter(cmd, "@Age", DbType.Byte, house.Age);

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

        public override List<HouseSecond> Insert(List<HouseSecond> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,District,District2,Address,ObjectType,FitType,Toward,Room,Parlor,Toilet,Floor,FloorTotal,[Right],Price,Price2,Area,Area2,Age,[Content],IsBiz,ContactPerson,Phone,Pictures,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@District" + i + ",@District2_" + i + ",@Address" + i + ",@ObjectType" + i + ",@FitType" + i + ",@Toward" + i + ",@Room" + i + ",@Parlor" + i + ",@Toilet" + i + ",@Floor" + i + ",@FloorTotal" + i + ",@Right" + i + ",@Price" + i + ",@Price2_" + i + ",@Area" + i + ",@Area2_" + i + ",@Age" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Pictures" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var house = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, house.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, house.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, house.District);
                db.AddInParameter(cmd, "@District2_" + i, DbType.String, house.District2);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, house.Address);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, house.ObjectType);
                db.AddInParameter(cmd, "@FitType" + i, DbType.String, house.FitType);
                db.AddInParameter(cmd, "@Toward" + i, DbType.String, house.Toward);
                db.AddInParameter(cmd, "@Room" + i, DbType.Byte, house.Room);
                db.AddInParameter(cmd, "@Parlor" + i, DbType.Byte, house.Parlor);
                db.AddInParameter(cmd, "@Toilet" + i, DbType.Byte, house.Toilet);
                db.AddInParameter(cmd, "@Floor" + i, DbType.Int16, house.Floor);
                db.AddInParameter(cmd, "@FloorTotal" + i, DbType.Byte, house.FloorTotal);
                db.AddInParameter(cmd, "@Right" + i, DbType.String, house.Right);
                db.AddInParameter(cmd, "@Price" + i, DbType.Single, house.Price);
                db.AddInParameter(cmd, "@Price2_" + i, DbType.Single, house.Price2);
                db.AddInParameter(cmd, "@Area" + i, DbType.Int32, house.Area);
                db.AddInParameter(cmd, "@Area2_" + i, DbType.Int32, house.Area2);
                db.AddInParameter(cmd, "@Age" + i, DbType.Byte, house.Age);

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
