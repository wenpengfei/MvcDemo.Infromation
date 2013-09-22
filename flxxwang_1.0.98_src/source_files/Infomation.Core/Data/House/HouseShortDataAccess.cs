﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;
using Framework;

namespace Infomation.Core.Data
{
    public class HouseShortDataAccess : DataAccess<HouseShort, int>
    {
        //public override HouseShort Insert(HouseShort instance)
        //{
        //    HouseShort house = instance as HouseShort;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District1,District2,ObjectType,Lease,Price,Price2,PriceUnit,[Content],IsBiz,ContactPerson,Phone,Pictures,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District1,@District2,@ObjectType,@Lease,@Price,@Price2,@PriceUnit,@Content,@IsBiz,@ContactPerson,@Phone,@Pictures,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, house.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, house.Title);
        //    db.AddInParameter(cmd, "@District1", DbType.String, house.District1);
        //    db.AddInParameter(cmd, "@District2", DbType.String, house.District2);

        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, house.ObjectType);
        //    db.AddInParameter(cmd, "@Lease", DbType.Byte, house.Lease);
        //    db.AddInParameter(cmd, "@Price", DbType.Int16, house.Price);
        //    db.AddInParameter(cmd, "@Price2", DbType.Int16, house.Price2);
        //    db.AddInParameter(cmd, "@PriceUnit", DbType.Byte, house.PriceUnit);

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

        public override List<HouseShort> Insert(List<HouseShort> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,District1,District2,ObjectType,Lease,Price,Price2,PriceUnit,[Content],IsBiz,ContactPerson,Phone,Pictures,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@District1_" + i + ",@District2_" + i + ",@ObjectType" + i + ",@Lease" + i + ",@Price" + i + ",@Price2_" + i + ",@PriceUnit" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Pictures" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var house = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, house.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, house.Title);
                db.AddInParameter(cmd, "@District1_" + i, DbType.String, house.District1);
                db.AddInParameter(cmd, "@District2_" + i, DbType.String, house.District2);

                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, house.ObjectType);
                db.AddInParameter(cmd, "@Lease" + i, DbType.Byte, house.Lease);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int16, house.Price);
                db.AddInParameter(cmd, "@Price2_" + i, DbType.Int16, house.Price2);
                db.AddInParameter(cmd, "@PriceUnit" + i, DbType.Byte, house.PriceUnit);

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
