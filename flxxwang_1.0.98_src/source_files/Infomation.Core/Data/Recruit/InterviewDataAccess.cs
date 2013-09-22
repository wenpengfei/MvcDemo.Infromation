using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;

namespace Infomation.Core.Data
{
    public class InterviewDataAccess : DataAccess<Interview, int>
    {
        //public override Interview Insert(Interview instance)
        //{
        //    var interview = instance as Interview;

        //    string sql = "INSERT INTO " + TableName + " (UserId,JobSeekId,ResumeId,ToUserId,Content)" +
        //                                "VALUES (@UserId,@JobSeekId,@ResumeId,@ToUserId,@Content)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, interview.UserId);
        //    db.AddInParameter(cmd, "@JobSeekId", DbType.Int32, interview.JobSeekId);
        //    db.AddInParameter(cmd, "@ResumeId", DbType.Int32, interview.ResumeId);
        //    db.AddInParameter(cmd, "@ToUserId", DbType.Int32, interview.ToUserId);
        //    db.AddInParameter(cmd, "@Content", DbType.String, interview.Content);
            
        //    interview.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return interview;
        //}

        public override List<Interview> Insert(List<Interview> instances)
        {
            //var interview = instance as Interview;
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }
            string sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (UserId,JobSeekId,ResumeId,ToUserId,Content)" +
                                            "VALUES (@UserId" + i + ",@JobSeekId" + i + ",@ResumeId" + i + ",@ToUserId" + i + ",@Content" + i + ")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var interview = instances.ElementAt(i);
                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, interview.UserId);
                db.AddInParameter(cmd, "@JobSeekId" + i, DbType.Int32, interview.JobSeekId);
                db.AddInParameter(cmd, "@ResumeId" + i, DbType.Int32, interview.ResumeId);
                db.AddInParameter(cmd, "@ToUserId" + i, DbType.Int32, interview.ToUserId);
                db.AddInParameter(cmd, "@Content" + i, DbType.String, interview.Content);
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
