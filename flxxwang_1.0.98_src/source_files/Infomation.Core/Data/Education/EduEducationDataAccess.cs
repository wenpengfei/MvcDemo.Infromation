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
    public class EduEducationDataAccess : DataAccess<EduEducation, int>
    {
        //public override EduEducation Insert(EduEducation instance)
        //{
        //    EduEducation education = instance as EduEducation;

        //    string sql = "INSERT INTO " + TableName + " (Title,ObjectType,TrainWay,BusTime,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@ObjectType,@TrainWay,@BusTime,@Address,@Bus,@Content,@ContactPerson,@Phone,@Phone2,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, education.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, education.ObjectType);

        //    db.AddInParameter(cmd, "@TrainWay", DbType.String, education.TrainWay);
        //    db.AddInParameter(cmd, "@BusTime", DbType.String, education.BusTime);
        //    db.AddInParameter(cmd, "@Address", DbType.String, education.Address);
        //    db.AddInParameter(cmd, "@Bus", DbType.String, education.Bus);

        //    db.AddInParameter(cmd, "@Content", DbType.String, education.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, education.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, education.Phone);
        //    db.AddInParameter(cmd, "@Phone2", DbType.String, education.Phone2);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, education.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, education.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, education.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, education.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, education.Source);
            

        //    education.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return education;
        //}

        public override List<EduEducation> Insert(List<EduEducation> instances)
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
                var education = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, education.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, education.ObjectType);

                db.AddInParameter(cmd, "@TrainWay" + i, DbType.String, education.TrainWay);
                db.AddInParameter(cmd, "@BusTime" + i, DbType.String, education.BusTime);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, education.Address);
                db.AddInParameter(cmd, "@Bus" + i, DbType.String, education.Bus);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, education.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, education.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, education.Phone);
                db.AddInParameter(cmd, "@Phone2_" + i, DbType.String, education.Phone2);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, education.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, education.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, education.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, education.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, education.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, education.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, education.TId);
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
