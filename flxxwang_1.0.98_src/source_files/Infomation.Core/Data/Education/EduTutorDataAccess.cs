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
    public class EduTutorDataAccess : DataAccess<EduTutor, int>
    {
        //public override EduTutor Insert(EduTutor instance)
        //{
        //    EduTutor tutor = instance as EduTutor;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,ObjectType,Tag1,Tag2,Tag3,Tag4,Tag5,Tag6,Tag7,Tag8,Tag9,Tag10,Tag11,Tag12,TrainWay,BusTime,Address,TutorWay,Salary,[Identity],Certificate,Course,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@ObjectType,@Tag1,@Tag2,@Tag3,@Tag4,@Tag5,@Tag6,@Tag7,@Tag8,@Tag9,@Tag10,@Tag11,@Tag12,@TrainWay,@BusTime,@Address,@TutorWay,@Salary,@Identity,@Certificate,@Course,@Content,@ContactPerson,@Phone,@Phone2,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, tutor.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, tutor.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, tutor.ObjectType);

        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, tutor.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, tutor.Tag2);
        //    db.AddInParameter(cmd, "@Tag3", DbType.Byte, tutor.Tag3);
        //    db.AddInParameter(cmd, "@Tag4", DbType.Byte, tutor.Tag4);
        //    db.AddInParameter(cmd, "@Tag5", DbType.Byte, tutor.Tag5);
        //    db.AddInParameter(cmd, "@Tag6", DbType.Byte, tutor.Tag6);
        //    db.AddInParameter(cmd, "@Tag7", DbType.Byte, tutor.Tag7);
        //    db.AddInParameter(cmd, "@Tag8", DbType.Byte, tutor.Tag8);
        //    db.AddInParameter(cmd, "@Tag9", DbType.Byte, tutor.Tag9);
        //    db.AddInParameter(cmd, "@Tag10", DbType.Byte, tutor.Tag10);
        //    db.AddInParameter(cmd, "@Tag11", DbType.Byte, tutor.Tag11);
        //    db.AddInParameter(cmd, "@Tag12", DbType.Byte, tutor.Tag12);

        //    db.AddInParameter(cmd, "@TrainWay", DbType.String, tutor.TrainWay);
        //    db.AddInParameter(cmd, "@BusTime", DbType.String, tutor.BusTime);
        //    db.AddInParameter(cmd, "@Address", DbType.String, tutor.Address);
        //    db.AddInParameter(cmd, "@TutorWay", DbType.String, tutor.TutorWay);
        //    db.AddInParameter(cmd, "@Salary", DbType.String, tutor.Salary);
        //    db.AddInParameter(cmd, "@Identity", DbType.String, tutor.Identity);
        //    db.AddInParameter(cmd, "@Certificate", DbType.String, tutor.Certificate);
        //    db.AddInParameter(cmd, "@Course", DbType.String, tutor.Course);

        //    db.AddInParameter(cmd, "@Content", DbType.String, tutor.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, tutor.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, tutor.Phone);
        //    db.AddInParameter(cmd, "@Phone2", DbType.String, tutor.Phone2);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, tutor.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, tutor.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, tutor.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, tutor.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, tutor.Source);

        //    tutor.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return tutor;
        //}

        public override List<EduTutor> Insert(List<EduTutor> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,ObjectType,Tag1,Tag2,Tag3,Tag4,Tag5,Tag6,Tag7,Tag8,Tag9,Tag10,Tag11,Tag12,TrainWay,BusTime,Address,TutorWay,Salary,[Identity],Certificate,Course,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@ObjectType" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@Tag3_" + i + ",@Tag4_" + i + ",@Tag5_" + i + ",@Tag6_" + i + ",@Tag7_" + i + ",@Tag8_" + i + ",@Tag9_" + i + ",@Tag10_" + i + ",@Tag11_" + i + ",@Tag12_" + i + ",@TrainWay" + i + ",@BusTime" + i + ",@Address" + i + ",@TutorWay" + i + ",@Salary" + i + ",@Identity" + i + ",@Certificate" + i + ",@Course" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Phone2_" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var tutor = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, tutor.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, tutor.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, tutor.ObjectType);

                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, tutor.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, tutor.Tag2);
                db.AddInParameter(cmd, "@Tag3_" + i, DbType.Byte, tutor.Tag3);
                db.AddInParameter(cmd, "@Tag4_" + i, DbType.Byte, tutor.Tag4);
                db.AddInParameter(cmd, "@Tag5_" + i, DbType.Byte, tutor.Tag5);
                db.AddInParameter(cmd, "@Tag6_" + i, DbType.Byte, tutor.Tag6);
                db.AddInParameter(cmd, "@Tag7_" + i, DbType.Byte, tutor.Tag7);
                db.AddInParameter(cmd, "@Tag8_" + i, DbType.Byte, tutor.Tag8);
                db.AddInParameter(cmd, "@Tag9_" + i, DbType.Byte, tutor.Tag9);
                db.AddInParameter(cmd, "@Tag10_" + i, DbType.Byte, tutor.Tag10);
                db.AddInParameter(cmd, "@Tag11_" + i, DbType.Byte, tutor.Tag11);
                db.AddInParameter(cmd, "@Tag12_" + i, DbType.Byte, tutor.Tag12);

                db.AddInParameter(cmd, "@TrainWay" + i, DbType.String, tutor.TrainWay);
                db.AddInParameter(cmd, "@BusTime" + i, DbType.String, tutor.BusTime);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, tutor.Address);
                db.AddInParameter(cmd, "@TutorWay" + i, DbType.String, tutor.TutorWay);
                db.AddInParameter(cmd, "@Salary" + i, DbType.String, tutor.Salary);
                db.AddInParameter(cmd, "@Identity" + i, DbType.String, tutor.Identity);
                db.AddInParameter(cmd, "@Certificate" + i, DbType.String, tutor.Certificate);
                db.AddInParameter(cmd, "@Course" + i, DbType.String, tutor.Course);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, tutor.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, tutor.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, tutor.Phone);
                db.AddInParameter(cmd, "@Phone2_" + i, DbType.String, tutor.Phone2);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, tutor.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, tutor.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, tutor.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, tutor.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, tutor.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, tutor.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, tutor.TId);
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
