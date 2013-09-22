using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;
using Framework;
using Framework.Extensions;
namespace Infomation.Core.Data
{
    public class RecruitDataAccess : DataAccess<Recruit, int>
    {
        //public override Recruit Insert(Recruit instance)
        //{
        //    Recruit recruit = instance as Recruit;

        //    string sql = "INSERT INTO " + TableName + " (UserId,CompanyId,JobType,WorkType,ObjectType,JobName,RecruitCount,WageMin,WageMax,Education,WorkYearStart,WorkYearEnd,SexRequire,WorkTimes,JobDescription,RecvEmail,ContactPerson,Phone,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@UserId,@CompanyId,@JobType,@WorkType,@ObjectType,@JobName,@RecruitCount,@WageMin,@WageMax,@Education,@WorkYearStart,@WorkYearEnd,@SexRequire,@WorkTimes,@JobDescription,@RecvEmail,@ContactPerson,@Phone,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, recruit.UserId);
        //    db.AddInParameter(cmd, "@CompanyId", DbType.Int32, recruit.CompanyId);
        //    db.AddInParameter(cmd, "@JobType", DbType.Byte, recruit.JobType);
        //    db.AddInParameter(cmd, "@WorkType", DbType.Byte, recruit.WorkType);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, recruit.ObjectType);
        //    db.AddInParameter(cmd, "@JobName", DbType.String, recruit.JobName);
        //    db.AddInParameter(cmd, "@RecruitCount", DbType.Int16, recruit.RecruitCount);

        //    db.AddInParameter(cmd, "@WageMin", DbType.Int32, recruit.WageMin);
        //    db.AddInParameter(cmd, "@WageMax", DbType.Int32, recruit.WageMax);
        //    db.AddInParameter(cmd, "@Education", DbType.Byte, recruit.Education);
        //    db.AddInParameter(cmd, "@WorkYearStart", DbType.Byte, recruit.WorkYearStart);
        //    db.AddInParameter(cmd, "@WorkYearEnd", DbType.Byte, recruit.WorkYearEnd);
            
        //    db.AddInParameter(cmd, "@SexRequire", DbType.Boolean, recruit.SexRequire);
        //    db.AddInParameter(cmd, "@WorkTimes", DbType.String, recruit.WorkTimes);
            
        //    db.AddInParameter(cmd, "@JobDescription", DbType.String, recruit.JobDescription);
        //    db.AddInParameter(cmd, "@RecvEmail", DbType.String, recruit.RecvEmail);

        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, recruit.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, recruit.Phone);

        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, recruit.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, recruit.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, recruit.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, recruit.Source);

        //    recruit.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return recruit;
        //}

        public override List<Recruit> Insert(List<Recruit> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                //var recruit = instances.ElementAt(i);
                //if (recruit.Company==null)
                //{
                //    continue;
                //}
                sql += ";INSERT INTO " + TableName + " (UserId,CompanyId,JobType,WorkType,ObjectType,JobName,RecruitCount,WageMin,WageMax,Education,WorkYearStart,WorkYearEnd,SexRequire,WorkTimes,JobDescription,RecvEmail,ContactPerson,Phone,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@UserId" + i + ",@CompanyId" + i + ",@JobType" + i + ",@WorkType" + i + ",@ObjectType" + i + ",@JobName" + i + ",@RecruitCount" + i + ",@WageMin" + i + ",@WageMax" + i + ",@Education" + i + ",@WorkYearStart" + i + ",@WorkYearEnd" + i + ",@SexRequire" + i + ",@WorkTimes" + i + ",@JobDescription" + i + ",@RecvEmail" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            if (string.IsNullOrWhiteSpace(sql))
            {
                return instances;
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var recruit = instances.ElementAt(i);
                //if (recruit.Company == null)
                //{
                //    continue;
                //}
                db.AddInParameter(cmd, "@UserId"+i, DbType.Int32, recruit.UserId);
                db.AddInParameter(cmd, "@CompanyId" + i, DbType.Int32, recruit.CompanyId);
                db.AddInParameter(cmd, "@JobType" + i, DbType.Byte, recruit.JobType);
                db.AddInParameter(cmd, "@WorkType" + i, DbType.Byte, recruit.WorkType);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, recruit.ObjectType);
                db.AddInParameter(cmd, "@JobName" + i, DbType.String, recruit.JobName);
                db.AddInParameter(cmd, "@RecruitCount" + i, DbType.Int16, recruit.RecruitCount);

                db.AddInParameter(cmd, "@WageMin" + i, DbType.Int32, recruit.WageMin);
                db.AddInParameter(cmd, "@WageMax" + i, DbType.Int32, recruit.WageMax);
                db.AddInParameter(cmd, "@Education" + i, DbType.Byte, recruit.Education);
                db.AddInParameter(cmd, "@WorkYearStart" + i, DbType.Byte, recruit.WorkYearStart);
                db.AddInParameter(cmd, "@WorkYearEnd" + i, DbType.Byte, recruit.WorkYearEnd);

                db.AddInParameter(cmd, "@SexRequire" + i, DbType.Boolean, recruit.SexRequire);
                db.AddInParameter(cmd, "@WorkTimes" + i, DbType.String, recruit.WorkTimes);

                db.AddInParameter(cmd, "@JobDescription" + i, DbType.String, recruit.JobDescription);
                db.AddInParameter(cmd, "@RecvEmail" + i, DbType.String, recruit.RecvEmail);

                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, recruit.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, recruit.Phone);

                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, recruit.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, recruit.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, recruit.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, recruit.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, recruit.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, recruit.TId);
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
