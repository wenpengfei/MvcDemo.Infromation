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
    public class SaleOtherDataAccess : DataAccess<SaleOther, int>
    {
        //public override SaleOther Insert(SaleOther instance)
        //{
        //    SaleOther other = instance as SaleOther;

        //    string sql = "INSERT INTO " + TableName + " (Type,ObjectType,Title,District,Price,Quality,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@ObjectType,@Title,@District,@Price,@Quality,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, other.Type);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, other.ObjectType);
        //    db.AddInParameter(cmd, "@Title", DbType.String, other.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, other.District);
        //    db.AddInParameter(cmd, "@Quality", DbType.Byte, other.Quality);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, other.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, other.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, other.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, other.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, other.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, other.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, other.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, other.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, other.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, other.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, other.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, other.Source);

        //    other.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return other;
        //}

        public override List<SaleOther> Insert(List<SaleOther> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,ObjectType,Title,District,Price,Quality,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@ObjectType" + i + ",@Title" + i + ",@District" + i + ",@Price" + i + ",@Quality" + i + ",@Pictures" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var other = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, other.Type);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, other.ObjectType);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, other.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, other.District);
                db.AddInParameter(cmd, "@Quality" + i, DbType.Byte, other.Quality);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, other.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, other.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, other.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, other.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, other.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, other.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, other.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, other.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, other.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, other.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, other.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, other.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, other.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, other.TId);
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
