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
    public class SaleHomeDataAccess : DataAccess<SaleHome, int>
    {
        //public override SaleHome Insert(SaleHome instance)
        //{
        //    SaleHome home = instance as SaleHome;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag1,Tag2,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District,@ObjectType,@Tag1,@Tag2,@Quality,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, home.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, home.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, home.District);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, home.ObjectType);
        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, home.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, home.Tag2);
        //    db.AddInParameter(cmd, "@Quality", DbType.Byte, home.Quality);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, home.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, home.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, home.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, home.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, home.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, home.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, home.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, home.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, home.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, home.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, home.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, home.Source);

        //    home.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return home;
        //}

        public override List<SaleHome> Insert(List<SaleHome> instances)
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
                var home = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, home.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, home.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, home.District);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, home.ObjectType);
                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, home.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, home.Tag2);
                db.AddInParameter(cmd, "@Quality" + i, DbType.Byte, home.Quality);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, home.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, home.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, home.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, home.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, home.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, home.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, home.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, home.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, home.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, home.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, home.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, home.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, home.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, home.TId);
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
