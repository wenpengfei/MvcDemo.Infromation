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
    public class FriendActivityDataAccess : DataAccess<FriendActivity, int>
    {
        //public override FriendActivity Insert(FriendActivity instance)
        //{
        //    FriendActivity activity = instance as FriendActivity;

        //    string sql = "INSERT INTO " + TableName + " (Title,ObjectType,Address,StartTime,EndTime,Tag1,Tag2,IsBiz,[Content],ContactPerson,Phone,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@ObjectType,@Address,@StartTime,@EndTime,@Tag1,@Tag2,@IsBiz,@Content,@ContactPerson,@Phone,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, activity.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, activity.ObjectType);
        //    db.AddInParameter(cmd, "@Address", DbType.String, activity.Address);

        //    db.AddInParameter(cmd, "@StartTime", DbType.DateTime, activity.StartTime);
        //    db.AddInParameter(cmd, "@EndTime", DbType.DateTime, activity.EndTime);
        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, activity.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, activity.Tag2);

        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, activity.IsBiz);

        //    db.AddInParameter(cmd, "@Content", DbType.String, activity.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, activity.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, activity.Phone);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, activity.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, activity.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, activity.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, activity.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, activity.Source);

        //    activity.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return activity;
        //}

        public override List<FriendActivity> Insert(List<FriendActivity> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,ObjectType,Address,StartTime,EndTime,Tag1,Tag2,IsBiz,[Content],ContactPerson,Phone,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@ObjectType" + i + ",@Address" + i + ",@StartTime" + i + ",@EndTime" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@IsBiz" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var activity = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, activity.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, activity.ObjectType);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, activity.Address);

                db.AddInParameter(cmd, "@StartTime" + i, DbType.DateTime, activity.StartTime);
                db.AddInParameter(cmd, "@EndTime" + i, DbType.DateTime, activity.EndTime);
                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, activity.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, activity.Tag2);

                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, activity.IsBiz);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, activity.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, activity.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, activity.Phone);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, activity.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, activity.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, activity.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, activity.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, activity.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, activity.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, activity.TId);
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
