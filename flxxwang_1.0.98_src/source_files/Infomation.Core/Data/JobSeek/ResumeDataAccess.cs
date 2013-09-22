using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;

namespace Infomation.Core.Data
{
    public class ResumeDataAccess : DataAccess<Resume, int>
    {
        //public override Resume Insert(Resume instance)
        //{
        //    var resume = instance as Resume;
        //    string sql = "INSERT INTO " + TableName + " (UserId,ResumeType,[Name],JobType,ObjectType,JobName,WageMin,WageMax,AboutMe,RealName,Sex,BirthDay,Education,WorkYearStart,WorkYearEnd,Phone,Email,NowCityId,NowRegionId,NowCircleId,PublicState,EduBackgrounds,WorkExperiences,Certificates,LanguageSkills,FreeTimes,IsStudent,Pictures,Source)" +
        //                                "VALUES (@UserId,@ResumeType,@Name,@JobType,@ObjectType,@JobName,@WageMin,@WageMax,@AboutMe,@RealName,@Sex,@BirthDay,@Education,@WorkYearStart,@WorkYearEnd,@Phone,@Email,@NowCityId,@NowRegionId,@NowCircleId,@PublicState,@EduBackgrounds,@WorkExperiences,@Certificates,@LanguageSkills,@FreeTimes,@IsStudent,@Pictures,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, resume.UserId);
        //    db.AddInParameter(cmd, "@ResumeType", DbType.Byte, resume.ResumeType);
        //    db.AddInParameter(cmd, "@Name", DbType.String, resume.Name);
        //    db.AddInParameter(cmd, "@JobType", DbType.Byte, resume.JobType);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, resume.ObjectType);
        //    db.AddInParameter(cmd, "@JobName", DbType.String, resume.JobName);
        //    db.AddInParameter(cmd, "@WageMin", DbType.Int32, resume.WageMin);
        //    db.AddInParameter(cmd, "@WageMax", DbType.Int32, resume.WageMax);
        //    db.AddInParameter(cmd, "@AboutMe", DbType.String, resume.AboutMe);
        //    db.AddInParameter(cmd, "@RealName", DbType.String, resume.RealName);
        //    db.AddInParameter(cmd, "@Sex", DbType.Boolean, resume.Sex);
        //    db.AddInParameter(cmd, "@BirthDay", DbType.DateTime, resume.BirthDay);
        //    db.AddInParameter(cmd, "@Education", DbType.Byte, resume.Education);
        //    db.AddInParameter(cmd, "@WorkYearStart", DbType.Byte, resume.WorkYearStart);
        //    db.AddInParameter(cmd, "@WorkYearEnd", DbType.Byte, resume.WorkYearEnd);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, resume.Phone);
        //    db.AddInParameter(cmd, "@Email", DbType.String, resume.Email);
        //    db.AddInParameter(cmd, "@NowCityId", DbType.Int16, resume.NowCityId);
        //    db.AddInParameter(cmd, "@NowRegionId", DbType.Int16, resume.NowRegionId);
        //    db.AddInParameter(cmd, "@NowCircleId", DbType.Int16, resume.NowCircleId);
        //    db.AddInParameter(cmd, "@PublicState", DbType.Byte, resume.PublicState);
        //    db.AddInParameter(cmd, "@EduBackgrounds", DbType.String, resume.EduBackgrounds);
        //    db.AddInParameter(cmd, "@WorkExperiences", DbType.String, resume.WorkExperiences);
        //    db.AddInParameter(cmd, "@Certificates", DbType.String, resume.Certificates);
        //    db.AddInParameter(cmd, "@LanguageSkills", DbType.String, resume.LanguageSkills);
        //    db.AddInParameter(cmd, "@FreeTimes", DbType.String, resume.FreeTimes);
        //    db.AddInParameter(cmd, "@IsStudent", DbType.Boolean, resume.IsStudent);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, resume.Pictures);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, resume.Source);
        //    resume.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return resume;
        //}

        public override List<Resume> Insert(List<Resume> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (UserId,ResumeType,[Name],JobType,ObjectType,JobName,WageMin,WageMax,AboutMe,RealName,Sex,BirthDay,Education,WorkYearStart,WorkYearEnd,Phone,Email,NowCityId,NowRegionId,NowCircleId,PublicState,EduBackgrounds,WorkExperiences,Certificates,LanguageSkills,FreeTimes,IsStudent,Pictures,Source)" +
                                        "VALUES (@UserId" + i + ",@ResumeType" + i + ",@Name" + i + ",@JobType" + i + ",@ObjectType" + i + ",@JobName" + i + ",@WageMin" + i + ",@WageMax" + i + ",@AboutMe" + i + ",@RealName" + i + ",@Sex" + i + ",@BirthDay" + i + ",@Education" + i + ",@WorkYearStart" + i + ",@WorkYearEnd" + i + ",@Phone" + i + ",@Email" + i + ",@NowCityId" + i + ",@NowRegionId" + i + ",@NowCircleId" + i + ",@PublicState" + i + ",@EduBackgrounds" + i + ",@WorkExperiences" + i + ",@Certificates" + i + ",@LanguageSkills" + i + ",@FreeTimes" + i + ",@IsStudent" + i + ",@Pictures" + i + ",@Source" + i + ")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var resume = instances.ElementAt(i);
                db.AddInParameter(cmd, "@UserId"+i, DbType.Int32, resume.UserId);
                db.AddInParameter(cmd, "@ResumeType" + i, DbType.Byte, resume.ResumeType);
                db.AddInParameter(cmd, "@Name" + i, DbType.String, resume.Name);
                db.AddInParameter(cmd, "@JobType" + i, DbType.Byte, resume.JobType);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, resume.ObjectType);
                db.AddInParameter(cmd, "@JobName" + i, DbType.String, resume.JobName);
                db.AddInParameter(cmd, "@WageMin" + i, DbType.Int32, resume.WageMin);
                db.AddInParameter(cmd, "@WageMax" + i, DbType.Int32, resume.WageMax);
                db.AddInParameter(cmd, "@AboutMe" + i, DbType.String, resume.AboutMe);
                db.AddInParameter(cmd, "@RealName" + i, DbType.String, resume.RealName);
                db.AddInParameter(cmd, "@Sex" + i, DbType.Boolean, resume.Sex);
                db.AddInParameter(cmd, "@BirthDay" + i, DbType.DateTime, resume.BirthDay);
                db.AddInParameter(cmd, "@Education" + i, DbType.Byte, resume.Education);
                db.AddInParameter(cmd, "@WorkYearStart" + i, DbType.Byte, resume.WorkYearStart);
                db.AddInParameter(cmd, "@WorkYearEnd" + i, DbType.Byte, resume.WorkYearEnd);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, resume.Phone);
                db.AddInParameter(cmd, "@Email" + i, DbType.String, resume.Email);
                db.AddInParameter(cmd, "@NowCityId" + i, DbType.Int16, resume.NowCityId);
                db.AddInParameter(cmd, "@NowRegionId" + i, DbType.Int16, resume.NowRegionId);
                db.AddInParameter(cmd, "@NowCircleId" + i, DbType.Int16, resume.NowCircleId);
                db.AddInParameter(cmd, "@PublicState" + i, DbType.Byte, resume.PublicState);
                db.AddInParameter(cmd, "@EduBackgrounds" + i, DbType.String, resume.EduBackgrounds);
                db.AddInParameter(cmd, "@WorkExperiences" + i, DbType.String, resume.WorkExperiences);
                db.AddInParameter(cmd, "@Certificates" + i, DbType.String, resume.Certificates);
                db.AddInParameter(cmd, "@LanguageSkills" + i, DbType.String, resume.LanguageSkills);
                db.AddInParameter(cmd, "@FreeTimes" + i, DbType.String, resume.FreeTimes);
                db.AddInParameter(cmd, "@IsStudent" + i, DbType.Boolean, resume.IsStudent);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, resume.Pictures);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, resume.Source);
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
