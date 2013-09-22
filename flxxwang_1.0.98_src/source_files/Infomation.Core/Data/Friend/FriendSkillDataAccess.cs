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
    public class FriendSkillDataAccess : DataAccess<FriendSkill, int>
    {
        //public override FriendSkill Insert(FriendSkill instance)
        //{
        //    FriendSkill skill = instance as FriendSkill;

        //    string sql = "INSERT INTO " + TableName + " (Title,Sex,Age,MySkill,WantSkill,IsBiz,[Content],ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@Sex,@Age,@MySkill,@WantSkill,@IsBiz,@Content,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, skill.Title);
        //    db.AddInParameter(cmd, "@Sex", DbType.Boolean, skill.Sex);
        //    db.AddInParameter(cmd, "@Age", DbType.Byte, skill.Age);

        //    db.AddInParameter(cmd, "@MySkill", DbType.String, skill.MySkill);
        //    db.AddInParameter(cmd, "@WantSkill", DbType.String, skill.WantSkill);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, skill.IsBiz);

        //    db.AddInParameter(cmd, "@Content", DbType.String, skill.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, skill.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, skill.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, skill.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, skill.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, skill.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, skill.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, skill.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, skill.Source);

        //    skill.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return skill;
        //}

        public override List<FriendSkill> Insert(List<FriendSkill> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,Sex,Age,MySkill,WantSkill,IsBiz,[Content],ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@Sex" + i + ",@Age" + i + ",@MySkill" + i + ",@WantSkill" + i + ",@IsBiz" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var skill = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, skill.Title);
                db.AddInParameter(cmd, "@Sex" + i, DbType.Boolean, skill.Sex);
                db.AddInParameter(cmd, "@Age" + i, DbType.Byte, skill.Age);

                db.AddInParameter(cmd, "@MySkill" + i, DbType.String, skill.MySkill);
                db.AddInParameter(cmd, "@WantSkill" + i, DbType.String, skill.WantSkill);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, skill.IsBiz);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, skill.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, skill.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, skill.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, skill.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, skill.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, skill.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, skill.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, skill.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, skill.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, skill.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, skill.TId);
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
