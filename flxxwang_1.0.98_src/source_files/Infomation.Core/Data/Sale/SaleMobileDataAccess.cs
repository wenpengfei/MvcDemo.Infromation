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
    public class SaleMobileDataAccess : DataAccess<SaleMobile, int>
    {
        //public override SaleMobile Insert(SaleMobile instance)
        //{
        //    SaleMobile mobile = instance as SaleMobile;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District,@ObjectType,@Tag,@Quality,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, mobile.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, mobile.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, mobile.District);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, mobile.ObjectType);
        //    db.AddInParameter(cmd, "@Tag", DbType.Byte, mobile.Tag);
        //    db.AddInParameter(cmd, "@Quality", DbType.Byte, mobile.Quality);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, mobile.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, mobile.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, mobile.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, mobile.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, mobile.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, mobile.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, mobile.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, mobile.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, mobile.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int16, mobile.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int16, mobile.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, mobile.Source);

        //    mobile.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return mobile;
        //}

        public override List<SaleMobile> Insert(List<SaleMobile> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@District" + i + ",@ObjectType" + i + ",@Tag" + i + ",@Quality" + i + ",@Price" + i + ",@Pictures" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var mobile = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, mobile.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, mobile.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, mobile.District);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, mobile.ObjectType);
                db.AddInParameter(cmd, "@Tag" + i, DbType.Byte, mobile.Tag);
                db.AddInParameter(cmd, "@Quality" + i, DbType.Byte, mobile.Quality);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, mobile.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, mobile.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, mobile.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, mobile.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, mobile.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, mobile.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, mobile.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, mobile.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, mobile.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int16, mobile.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int16, mobile.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, mobile.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, mobile.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, mobile.TId);
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
