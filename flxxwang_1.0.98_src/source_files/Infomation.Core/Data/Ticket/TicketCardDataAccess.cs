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
    public class TicketCardDataAccess : DataAccess<TicketCard, int>
    {
        //public override TicketCard Insert(TicketCard instance)
        //{
        //    TicketCard card = instance as TicketCard;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,ObjectType,Price,ExpiryDate,Content,IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@ObjectType,@Price,@ExpiryDate,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, card.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, card.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, card.ObjectType);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, card.Price);
        //    db.AddInParameter(cmd, "@ExpiryDate", DbType.DateTime, card.ExpiryDate);

        //    db.AddInParameter(cmd, "@Content", DbType.String, card.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, card.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, card.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, card.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, card.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, card.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, card.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, card.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, card.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, card.Source);

        //    card.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return card;
        //}

        public override List<TicketCard> Insert(List<TicketCard> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,ObjectType,Price,ExpiryDate,Content,IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@ObjectType" + i + ",@Price" + i + ",@ExpiryDate" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var card = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, card.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, card.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, card.ObjectType);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, card.Price);
                db.AddInParameter(cmd, "@ExpiryDate" + i, DbType.DateTime, card.ExpiryDate);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, card.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, card.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, card.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, card.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, card.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, card.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, card.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, card.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, card.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, card.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, card.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, card.TId);
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
