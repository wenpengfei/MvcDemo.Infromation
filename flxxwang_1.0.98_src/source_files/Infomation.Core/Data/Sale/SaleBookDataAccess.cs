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
    public class SaleBookDataAccess : DataAccess<SaleBook, int>
    {
        //public override SaleBook Insert(SaleBook instance)
        //{
        //    SaleBook book = instance as SaleBook;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag1,Tag2,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District,@ObjectType,@Tag1,@Tag2,@Quality,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, book.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, book.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, book.District);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, book.ObjectType);
        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, book.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, book.Tag2);
        //    db.AddInParameter(cmd, "@Quality", DbType.Byte, book.Quality);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, book.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, book.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, book.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, book.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, book.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, book.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, book.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, book.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, book.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, book.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, book.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, book.Source);

        //    book.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return book;
        //}

        public override List<SaleBook> Insert(List<SaleBook> instances)
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
                var book = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, book.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, book.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, book.District);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, book.ObjectType);
                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, book.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, book.Tag2);
                db.AddInParameter(cmd, "@Quality" + i, DbType.Byte, book.Quality);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, book.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, book.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, book.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, book.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, book.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, book.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, book.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, book.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, book.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, book.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, book.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, book.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, book.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, book.TId);
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
