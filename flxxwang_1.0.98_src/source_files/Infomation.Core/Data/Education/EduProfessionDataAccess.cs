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
    public class EduProfessionDataAccess : DataAccess<EduProfession, int>
    {
        //public override EduProfession Insert(EduProfession instance)
        //{
        //    EduProfession profession = instance as EduProfession;

        //    string sql = "INSERT INTO " + TableName + " (Title,ObjectType,BusTime,Duration,TrainWay,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@ObjectType,@BusTime,@Duration,@TrainWay,@Address,@Bus,@Content,@ContactPerson,@Phone,@Phone2,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, profession.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, profession.ObjectType);

        //    db.AddInParameter(cmd, "@BusTime", DbType.String, profession.BusTime);
        //    db.AddInParameter(cmd, "@Duration", DbType.String, profession.Duration);
        //    db.AddInParameter(cmd, "@TrainWay", DbType.String, profession.TrainWay);
        //    db.AddInParameter(cmd, "@Address", DbType.String, profession.Address);
        //    db.AddInParameter(cmd, "@Bus", DbType.String, profession.Bus);

        //    db.AddInParameter(cmd, "@Content", DbType.String, profession.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, profession.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, profession.Phone);
        //    db.AddInParameter(cmd, "@Phone2", DbType.String, profession.Phone2);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, profession.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, profession.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, profession.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, profession.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, profession.Source);

        //    profession.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return profession;
        //}

        public override List<EduProfession> Insert(List<EduProfession> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,ObjectType,BusTime,Duration,TrainWay,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@ObjectType" + i + ",@BusTime" + i + ",@Duration" + i + ",@TrainWay" + i + ",@Address" + i + ",@Bus" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Phone2_" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var profession = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, profession.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, profession.ObjectType);

                db.AddInParameter(cmd, "@BusTime" + i, DbType.String, profession.BusTime);
                db.AddInParameter(cmd, "@Duration" + i, DbType.String, profession.Duration);
                db.AddInParameter(cmd, "@TrainWay" + i, DbType.String, profession.TrainWay);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, profession.Address);
                db.AddInParameter(cmd, "@Bus" + i, DbType.String, profession.Bus);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, profession.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, profession.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, profession.Phone);
                db.AddInParameter(cmd, "@Phone2_" + i, DbType.String, profession.Phone2);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, profession.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, profession.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, profession.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, profession.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, profession.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, profession.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, profession.TId);
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
