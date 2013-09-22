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
    class SaleServiceDataAccess : DataAccess<SaleService, int>
    {
        //public override SaleService Insert(SaleService instance)
        //{
        //    SaleService service = instance as SaleService;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District,Price,Tags,Pictures,[Content],ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District,@Price,@Tags,@Pictures,@Content,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, service.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, service.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, service.District);
        //    db.AddInParameter(cmd, "@Tags", DbType.String, service.Tags);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, service.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, service.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, service.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, service.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, service.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, service.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, service.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, service.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, service.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, service.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, service.Source);
        //    service.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return service;
        //}

        public override List<SaleService> Insert(List<SaleService> instances)
        {
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,District,Price,Tags,Pictures,[Content],ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                        "VALUES (@Type" + i + ",@Title" + i + ",@District" + i + ",@Price" + i + ",@Tags" + i + ",@Pictures" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var service = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, service.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, service.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, service.District);
                db.AddInParameter(cmd, "@Tags" + i, DbType.String, service.Tags);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, service.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, service.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, service.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, service.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, service.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, service.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, service.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, service.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, service.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, service.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, service.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, service.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, service.TId);
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
