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
    public class EduMBADataAccess : DataAccess<EduMBA, int>
    {
        //public override EduMBA Insert(EduMBA instance)
        //{
        //    EduMBA mba = instance as EduMBA;

        //    string sql = "INSERT INTO " + TableName + " (Title,ObjectType,TrainWay,BusTime,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@ObjectType,@TrainWay,@BusTime,@Address,@Bus,@Content,@ContactPerson,@Phone,@Phone2,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, mba.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, mba.ObjectType);

        //    db.AddInParameter(cmd, "@TrainWay", DbType.String, mba.TrainWay);
        //    db.AddInParameter(cmd, "@BusTime", DbType.String, mba.BusTime);
        //    db.AddInParameter(cmd, "@Address", DbType.String, mba.Address);
        //    db.AddInParameter(cmd, "@Bus", DbType.String, mba.Bus);

        //    db.AddInParameter(cmd, "@Content", DbType.String, mba.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, mba.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, mba.Phone);
        //    db.AddInParameter(cmd, "@Phone2", DbType.String, mba.Phone2);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, mba.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, mba.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, mba.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, mba.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, mba.Source);

        //    mba.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return mba;
        //}

        public override List<EduMBA> Insert(List<EduMBA> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,ObjectType,TrainWay,BusTime,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                             "VALUES (@Title" + i + ",@ObjectType" + i + ",@TrainWay" + i + ",@BusTime" + i + ",@Address" + i + ",@Bus" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Phone2_" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var mba = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, mba.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, mba.ObjectType);

                db.AddInParameter(cmd, "@TrainWay" + i, DbType.String, mba.TrainWay);
                db.AddInParameter(cmd, "@BusTime" + i, DbType.String, mba.BusTime);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, mba.Address);
                db.AddInParameter(cmd, "@Bus" + i, DbType.String, mba.Bus);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, mba.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, mba.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, mba.Phone);
                db.AddInParameter(cmd, "@Phone2_" + i, DbType.String, mba.Phone2);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, mba.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, mba.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, mba.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, mba.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, mba.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, mba.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, mba.TId);
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
