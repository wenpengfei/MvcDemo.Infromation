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
    public class SaleDigitalDataAccess : DataAccess<SaleDigital, int>
    {
        //public override SaleDigital Insert(SaleDigital instance)
        //{
        //    SaleDigital digital = instance as SaleDigital;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag1,Tag2,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District,@ObjectType,@Tag1,@Tag2,@Quality,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, digital.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, digital.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, digital.District);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, digital.ObjectType);
        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, digital.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, digital.Tag2);
        //    db.AddInParameter(cmd, "@Quality", DbType.Byte, digital.Quality);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, digital.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, digital.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, digital.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, digital.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, digital.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, digital.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, digital.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, digital.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, digital.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, digital.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, digital.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, digital.Source);

        //    digital.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return digital;
        //}

        public override List<SaleDigital> Insert(List<SaleDigital> instances)
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
                var digital = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, digital.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, digital.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, digital.District);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, digital.ObjectType);
                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, digital.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, digital.Tag2);
                db.AddInParameter(cmd, "@Quality" + i, DbType.Byte, digital.Quality);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, digital.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, digital.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, digital.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, digital.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, digital.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, digital.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, digital.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, digital.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, digital.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, digital.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, digital.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, digital.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, digital.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, digital.TId);
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
