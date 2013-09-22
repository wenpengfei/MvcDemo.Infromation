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
    public class TicketTrainDataAccess : DataAccess<TicketTrain, int>
    {
        //public override TicketTrain Insert(TicketTrain instance)
        //{
        //    TicketTrain train = instance as TicketTrain;

        //    string sql = "INSERT INTO " + TableName + " (Type,ObjectType,StartStation,EndStation,Number,Time,StartTime,EndTime,Count,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@ObjectType,@StartStation,@EndStation,@Number,@Time,@StartTime,@EndTime,@Count,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, train.Type);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, train.ObjectType);
        //    db.AddInParameter(cmd, "@StartStation", DbType.String, train.StartStation);
        //    db.AddInParameter(cmd, "@EndStation", DbType.String, train.EndStation);
        //    db.AddInParameter(cmd, "@Number", DbType.String, train.Number);
        //    db.AddInParameter(cmd, "@Time", DbType.DateTime, train.Time);
        //    db.AddInParameter(cmd, "@StartTime", DbType.DateTime, train.StartTime);
        //    db.AddInParameter(cmd, "@EndTime", DbType.DateTime, train.EndTime);
        //    db.AddInParameter(cmd, "@Count", DbType.Int16, train.Count);

        //    //db.AddInParameter(cmd, "@Content", DbType.String, computer.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, train.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, train.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, train.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, train.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, train.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, train.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, train.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, train.Source);

        //    train.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return train;
        //}

        public override List<TicketTrain> Insert(List<TicketTrain> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,ObjectType,StartStation,EndStation,Number,Time,StartTime,EndTime,Count,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@ObjectType" + i + ",@StartStation" + i + ",@EndStation" + i + ",@Number" + i + ",@Time" + i + ",@StartTime" + i + ",@EndTime" + i + ",@Count" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var train = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, train.Type);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, train.ObjectType);
                db.AddInParameter(cmd, "@StartStation" + i, DbType.String, train.StartStation);
                db.AddInParameter(cmd, "@EndStation" + i, DbType.String, train.EndStation);
                db.AddInParameter(cmd, "@Number" + i, DbType.String, train.Number);
                db.AddInParameter(cmd, "@Time" + i, DbType.DateTime, train.Time);
                db.AddInParameter(cmd, "@StartTime" + i, DbType.DateTime, train.StartTime);
                db.AddInParameter(cmd, "@EndTime" + i, DbType.DateTime, train.EndTime);
                db.AddInParameter(cmd, "@Count" + i, DbType.Int16, train.Count);

                //db.AddInParameter(cmd, "@Content", DbType.String, computer.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, train.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, train.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, train.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, train.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, train.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, train.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, train.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, train.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, train.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, train.TId);
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
