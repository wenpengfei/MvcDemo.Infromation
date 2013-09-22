using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;

namespace Infomation.Core.Data
{
    public class JobApplyDataAccess : DataAccess<JobApply, int>
    {
        public override JobApply Insert(JobApply instance)
        {
            JobApply apply = instance as JobApply;
            var exist = JobApply.Select(apply.UserId, apply.RecruitId);
            if (exist != null)
            {
                exist.ResumeId = apply.ResumeId;
                exist.DateModified = DateTime.Now;
                exist.Update();
                return exist;
            }
            string sql = "INSERT INTO " + TableName + " (UserId,ResumeId,RecruitId,RecruitUserId,CompanyId)" +
                                     "VALUES (@UserId,@ResumeId,@RecruitId,@RecruitUserId,@CompanyId)";
            sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

            DbCommand cmd = db.GetSqlStringCommand(sql);
            db.AddInParameter(cmd, "@UserId", DbType.Int32, apply.UserId);
            db.AddInParameter(cmd, "@ResumeId", DbType.Int32, apply.ResumeId);
            db.AddInParameter(cmd, "@RecruitId", DbType.Int32, apply.RecruitId);
            db.AddInParameter(cmd, "@RecruitUserId", DbType.Int32, apply.RecruitUserId);
            db.AddInParameter(cmd, "@CompanyId", DbType.Int32, apply.CompanyId);

            apply.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            return apply;
        }

        public override List<JobApply> Insert(List<JobApply> instances)
        {
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }
            var collection = new List<JobApply>();
            foreach (var item in instances)
            {
                var jobApply = this.Insert(item);
                collection.Add(jobApply);
            }
            return collection;
        }
    }
}
