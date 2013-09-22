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
    public class TicketPleasureDataAccess : DataAccess<TicketPleasure, int>
    {
        //public override TicketPleasure Insert(TicketPleasure instance)
        //{
        //    TicketPleasure pleasure = instance as TicketPleasure;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,Tag1,Tag2,Price,ExpiryDate,Content,IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@Tag1,@Tag2,@Price,@ExpiryDate,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, pleasure.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, pleasure.Title);
        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, pleasure.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, pleasure.Tag2);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, pleasure.Price);
        //    db.AddInParameter(cmd, "@ExpiryDate", DbType.DateTime, pleasure.ExpiryDate);

        //    db.AddInParameter(cmd, "@Content", DbType.String, pleasure.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, pleasure.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, pleasure.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, pleasure.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, pleasure.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, pleasure.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, pleasure.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, pleasure.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, pleasure.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, pleasure.Source);

        //    pleasure.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return pleasure;
        //}

        public override List<TicketPleasure> Insert(List<TicketPleasure> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,Tag1,Tag2,Price,ExpiryDate,Content,IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@Price" + i + ",@ExpiryDate" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var pleasure = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, pleasure.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, pleasure.Title);
                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, pleasure.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, pleasure.Tag2);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, pleasure.Price);
                db.AddInParameter(cmd, "@ExpiryDate" + i, DbType.DateTime, pleasure.ExpiryDate);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, pleasure.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, pleasure.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, pleasure.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, pleasure.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, pleasure.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, pleasure.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, pleasure.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, pleasure.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, pleasure.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, pleasure.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, pleasure.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, pleasure.TId);
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
