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
    public class SaleSwapDataAccess : DataAccess<SaleSwap, int>
    {
        //public override SaleSwap Insert(SaleSwap instance)
        //{
        //    SaleSwap swap = instance as SaleSwap;

        //    string sql = "INSERT INTO " + TableName + " (Title,Want,District,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@Want,@District,@Quality,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, swap.Title);//我有
        //    db.AddInParameter(cmd, "@Want", DbType.String, swap.Want);//想换
        //    db.AddInParameter(cmd, "@District", DbType.String, swap.District);
        //    db.AddInParameter(cmd, "@Quality", DbType.Byte, swap.Quality);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, swap.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, swap.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, swap.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, swap.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, swap.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, swap.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, swap.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, swap.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, swap.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, swap.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, swap.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, swap.Source);

        //    swap.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return swap;
        //}

        public override List<SaleSwap> Insert(List<SaleSwap> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,Want,District,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@Want" + i + ",@District" + i + ",@Quality" + i + ",@Price" + i + ",@Pictures" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var swap = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, swap.Title);//我有
                db.AddInParameter(cmd, "@Want" + i, DbType.String, swap.Want);//想换
                db.AddInParameter(cmd, "@District" + i, DbType.String, swap.District);
                db.AddInParameter(cmd, "@Quality" + i, DbType.Byte, swap.Quality);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, swap.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, swap.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, swap.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, swap.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, swap.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, swap.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, swap.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, swap.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, swap.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, swap.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, swap.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, swap.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, swap.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, swap.TId);
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
