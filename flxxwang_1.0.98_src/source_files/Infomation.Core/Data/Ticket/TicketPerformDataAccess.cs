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
    public class TicketPerformDataAccess : DataAccess<TicketPerform, int>
    {
        //public override TicketPerform Insert(TicketPerform instance)
        //{
        //    TicketPerform perform = instance as TicketPerform;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,ObjectType,Time,Facility,Count,Seat,PriceOriginal,Price,Content,IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@ObjectType,@Time,@Facility,@Count,@Seat,@PriceOriginal,@Price,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, perform.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, perform.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, perform.ObjectType);
        //    db.AddInParameter(cmd, "@Time", DbType.DateTime, perform.Time);
        //    db.AddInParameter(cmd, "@Facility", DbType.String, perform.Facility);
        //    db.AddInParameter(cmd, "@Count", DbType.Int32, perform.Count);
        //    db.AddInParameter(cmd, "@Seat", DbType.String, perform.Seat);
        //    db.AddInParameter(cmd, "@PriceOriginal", DbType.Int32, perform.PriceOriginal);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, perform.Price);

        //    db.AddInParameter(cmd, "@Content", DbType.String, perform.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, perform.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, perform.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, perform.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, perform.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, perform.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, perform.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, perform.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, perform.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, perform.Source);

        //    perform.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return perform;
        //}

        public override List<TicketPerform> Insert(List<TicketPerform> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,ObjectType,Time,Facility,Count,Seat,PriceOriginal,Price,Content,IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@ObjectType" + i + ",@Time" + i + ",@Facility" + i + ",@Count" + i + ",@Seat" + i + ",@PriceOriginal" + i + ",@Price" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var perform = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, perform.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, perform.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, perform.ObjectType);
                db.AddInParameter(cmd, "@Time" + i, DbType.DateTime, perform.Time);
                db.AddInParameter(cmd, "@Facility" + i, DbType.String, perform.Facility);
                db.AddInParameter(cmd, "@Count" + i, DbType.Int32, perform.Count);
                db.AddInParameter(cmd, "@Seat" + i, DbType.String, perform.Seat);
                db.AddInParameter(cmd, "@PriceOriginal" + i, DbType.Int32, perform.PriceOriginal);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, perform.Price);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, perform.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, perform.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, perform.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, perform.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, perform.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, perform.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, perform.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, perform.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, perform.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, perform.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, perform.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, perform.TId);
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
