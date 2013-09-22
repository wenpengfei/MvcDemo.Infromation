using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;
using Framework;
using Framework.Data.Linq;
using Framework.Extensions;

namespace Infomation.Core.Data
{
    public class JobSeekDataAccess : DataAccess<JobSeek, int>
    {
        //public override JobSeek Insert(JobSeek instance)
        //{
        //    JobSeek job = instance as JobSeek;

        //    //Age,Sex,Education,WorkYearStart,WorkYearEnd这插入的冗余数据,方便查询.
        //    string sql = "INSERT INTO " + TableName + " (UserId,ResumeId,JobType,ObjectType,WorkType,JobName,WageMin,WageMax,AboutMe,Age,Sex,Education,WorkYearStart,WorkYearEnd,CityId,RegionId,CircleId,Source)" +
        //                             "VALUES (@UserId,@ResumeId,@JobType,@ObjectType,@WorkType,@JobName,@WageMin,@WageMax,@AboutMe,@Age,@Sex,@Education,@WorkYearStart,@WorkYearEnd,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, job.UserId);
        //    db.AddInParameter(cmd, "@ResumeId", DbType.Int32, job.ResumeId);
        //    db.AddInParameter(cmd, "@JobType", DbType.Byte, job.JobType);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, job.ObjectType);
        //    db.AddInParameter(cmd, "@WorkType", DbType.Byte, job.WorkType);
        //    db.AddInParameter(cmd, "@JobName", DbType.String, job.JobName);
        //    db.AddInParameter(cmd, "@WageMin", DbType.Int32, job.WageMin);
        //    db.AddInParameter(cmd, "@WageMax", DbType.Int32, job.WageMax);
        //    db.AddInParameter(cmd, "@AboutMe", DbType.String, job.AboutMe);

        //    db.AddInParameter(cmd, "@Age", DbType.Byte, job.Resume.Age);
        //    db.AddInParameter(cmd, "@Sex", DbType.Boolean, job.Resume.Sex);
        //    db.AddInParameter(cmd, "@Education", DbType.Byte,job.Resume.Education);
        //    db.AddInParameter(cmd, "@WorkYearStart", DbType.Byte,job.Resume.WorkYearStart);
        //    db.AddInParameter(cmd, "@WorkYearEnd", DbType.Byte,job.Resume.WorkYearEnd);

        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, job.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, job.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, job.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, job.Source);

        //    job.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return job;
        //}

        public override List<JobSeek> Insert(List<JobSeek> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                //var job = instances.ElementAt(i);
                //if (job.Resume == null)
                //{
                //    continue;
                //}
                //Age,Sex,Education,WorkYearStart,WorkYearEnd这插入的冗余数据,方便查询.
                sql += ";INSERT INTO " + TableName + " (UserId,ResumeId,JobType,ObjectType,WorkType,JobName,WageMin,WageMax,AboutMe,Age,Sex,Education,WorkYearStart,WorkYearEnd,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                         "VALUES (@UserId" + i + ",@ResumeId" + i + ",@JobType" + i + ",@ObjectType" + i + ",@WorkType" + i + ",@JobName" + i + ",@WageMin" + i + ",@WageMax" + i + ",@AboutMe" + i + ",@Age" + i + ",@Sex" + i + ",@Education" + i + ",@WorkYearStart" + i + ",@WorkYearEnd" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            if (string.IsNullOrWhiteSpace(sql))
            {
                return instances;
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            //var resumeCollection = Resume.SelectAll(item=>item.Id.In(instances.Select(job=>job.ResumeId)));
            var ids = string.Empty;
            foreach (var item in instances.Select(job => job.ResumeId))
            {
                ids += "," + item;
            }
            ids = ids.Substring(1);
            var resumeCollection = Resume.SelectAll("select * from Info_Resume where Id in (" + ids + ")");
            for (var i = 0; i < instances.Count(); i++)
            {
                var job = instances.ElementAt(i);
                var resume = resumeCollection.FirstOrDefault(item => item.Id == job.ResumeId);
                //if (job.Resume == null)
                //{
                //    continue;
                //}
                db.AddInParameter(cmd, "@UserId"+i, DbType.Int32, job.UserId);
                db.AddInParameter(cmd, "@ResumeId" + i, DbType.Int32, job.ResumeId);
                db.AddInParameter(cmd, "@JobType" + i, DbType.Byte, job.JobType);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, job.ObjectType);
                db.AddInParameter(cmd, "@WorkType" + i, DbType.Byte, job.WorkType);
                db.AddInParameter(cmd, "@JobName" + i, DbType.String, job.JobName);
                db.AddInParameter(cmd, "@WageMin" + i, DbType.Int32, job.WageMin);
                db.AddInParameter(cmd, "@WageMax" + i, DbType.Int32, job.WageMax);
                db.AddInParameter(cmd, "@AboutMe" + i, DbType.String, job.AboutMe);

                db.AddInParameter(cmd, "@Age" + i, DbType.Byte, resume.Age);
                db.AddInParameter(cmd, "@Sex" + i, DbType.Boolean, resume.Sex);
                db.AddInParameter(cmd, "@Education" + i, DbType.Byte, resume.Education);
                db.AddInParameter(cmd, "@WorkYearStart" + i, DbType.Byte, resume.WorkYearStart);
                db.AddInParameter(cmd, "@WorkYearEnd" + i, DbType.Byte, resume.WorkYearEnd);

                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, job.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, job.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, job.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, job.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, job.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, job.TId);
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
