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
    //public class ResumeDataAccessX : DataAccess<Resume, int>
    //{
    //    public override string TableName
    //    {
    //        get { return "Info_Resume"; }
    //    }

    //    public override string PrimaryKeyName
    //    {
    //        get { return "Id"; }
    //    }

    //    public override Resume Insert(ModelBase<Resume, int> instance)
    //    {
    //        Resume resume = instance as Resume;

    //        string sql = "INSERT INTO " + TableName + " (UserId,WorkType,[Name],ObjectType,JobName,WageMin,WageMax,RecentJobType,RecentJobName,RecentWageMin,RecentWageMax,AboutMe,RealName,Sex,Education,WorkYearStart,WorkYearEnd,BirthDay,Email,NowCityId,NowRegionId,NowCircleId,Phone)" +
    //                                    "VALUES (@UserId,@WorkType,@Name,@ObjectType,@JobName,@WageMin,@WageMax,@RecentJobType,@RecentJobName,@RecentWageMin,@RecentWageMax,@AboutMe,@RealName,@Sex,@Education,@WorkYearStart,@WorkYearEnd,@BirthDay,@Email,@NowCityId,@NowRegionId,@NowCircleId,@Phone)";
    //        sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

    //        DbCommand cmd = db.GetSqlStringCommand(sql);
    //        db.AddInParameter(cmd, "@UserId", DbType.Int32, resume.UserId);
    //        db.AddInParameter(cmd, "@WorkType", DbType.Int32, resume.WorkType);
    //        db.AddInParameter(cmd, "@Name", DbType.String, resume.Name);
    //        db.AddInParameter(cmd, "@ObjectType", DbType.Int32, resume.ObjectType);
    //        db.AddInParameter(cmd, "@JobName", DbType.String, resume.JobName);
    //        db.AddInParameter(cmd, "@WageMin", DbType.Int32, resume.WageMin);
    //        db.AddInParameter(cmd, "@WageMax", DbType.Int32, resume.WageMax);

    //        db.AddInParameter(cmd, "@RecentJobType", DbType.Int32, resume.RecentJobType);
    //        db.AddInParameter(cmd, "@RecentJobName", DbType.String, resume.RecentJobName);
    //        db.AddInParameter(cmd, "@RecentWageMin", DbType.Int32, resume.RecentWageMin);
    //        db.AddInParameter(cmd, "@RecentWageMax", DbType.Int32, resume.RecentWageMax);
    //        db.AddInParameter(cmd, "@AboutMe", DbType.String, resume.AboutMe);
    //        db.AddInParameter(cmd, "@RealName", DbType.String, resume.RealName);
            
    //        db.AddInParameter(cmd, "@Sex", DbType.Boolean, resume.Sex);
    //        db.AddInParameter(cmd, "@Education", DbType.Int32, resume.Education);

    //        db.AddInParameter(cmd, "@WorkYearStart", DbType.Int32, resume.WorkYearStart);
    //        db.AddInParameter(cmd, "@WorkYearEnd", DbType.Int32, resume.WorkYearEnd);

    //        db.AddInParameter(cmd, "@BirthDay", DbType.DateTime, resume.BirthDay);
    //        db.AddInParameter(cmd, "@Email", DbType.String, resume.Email);
    //        db.AddInParameter(cmd, "@NowCityId", DbType.Int32, resume.NowCityId);
    //        db.AddInParameter(cmd, "@NowRegionId", DbType.String, resume.NowRegionId);
    //        db.AddInParameter(cmd, "@NowCircleId", DbType.String, resume.NowCircleId);

    //        db.AddInParameter(cmd, "@Phone", DbType.String, resume.Phone);

    //        resume.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

    //        return resume;
    //    }
    //}
}
