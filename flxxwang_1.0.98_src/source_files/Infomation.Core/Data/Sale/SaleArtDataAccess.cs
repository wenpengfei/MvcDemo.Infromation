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
    public class SaleArtDataAccess : DataAccess<SaleArt, int>
    {
        //public override SaleArt Insert(SaleArt instance)
        //{
        //    SaleArt art = instance as SaleArt;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag1,Tag2,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District,@ObjectType,@Tag1,@Tag2,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, art.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, art.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, art.District);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, art.ObjectType);
        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, art.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, art.Tag2);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, art.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, art.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, art.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, art.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, art.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, art.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, art.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, art.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, art.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, art.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, art.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, art.Source);

        //    art.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return art;
        //}

        public override List<SaleArt> Insert(List<SaleArt> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag1,Tag2,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@District" + i + ",@ObjectType" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@Price" + i + ",@Pictures" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var art = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, art.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, art.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, art.District);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, art.ObjectType);
                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, art.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, art.Tag2);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, art.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, art.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, art.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, art.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, art.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, art.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, art.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, art.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, art.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, art.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, art.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, art.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, art.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, art.TId);
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
