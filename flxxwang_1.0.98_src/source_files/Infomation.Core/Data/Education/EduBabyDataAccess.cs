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
    public class EduBabyDataAccess : DataAccess<EduBaby, int>
    {
        //public override EduBaby Insert(EduBaby instance)
        //{
        //    EduBaby baby = instance as EduBaby;

        //    string sql = "INSERT INTO " + TableName + " (Title,ObjectType,Tag1,Tag2,Kind,Condition,BusTime,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@ObjectType,@Tag1,@Tag2,@Kind,@Condition,@BusTime,@Address,@Bus,@Content,@ContactPerson,@Phone,@Phone2,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, baby.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, baby.ObjectType);

        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, baby.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, baby.Tag2);

        //    db.AddInParameter(cmd, "@Kind", DbType.Byte, baby.Kind);
        //    db.AddInParameter(cmd, "@Condition", DbType.String, baby.Condition);
        //    db.AddInParameter(cmd, "@BusTime", DbType.String, baby.BusTime);
        //    db.AddInParameter(cmd, "@Address", DbType.String, baby.Address);
        //    db.AddInParameter(cmd, "@Bus", DbType.String, baby.Bus);

        //    db.AddInParameter(cmd, "@Content", DbType.String, baby.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, baby.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, baby.Phone);
        //    db.AddInParameter(cmd, "@Phone2", DbType.String, baby.Phone2);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, baby.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, baby.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, baby.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, baby.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, baby.Source);
            
        //    baby.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return baby;
        //}

        public override List<EduBaby> Insert(List<EduBaby> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,ObjectType,Tag1,Tag2,Kind,Condition,BusTime,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@ObjectType" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@Kind" + i + ",@Condition" + i + ",@BusTime" + i + ",@Address" + i + ",@Bus" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Phone2_" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var baby = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, baby.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, baby.ObjectType);

                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, baby.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, baby.Tag2);

                db.AddInParameter(cmd, "@Kind" + i, DbType.Byte, baby.Kind);
                db.AddInParameter(cmd, "@Condition" + i, DbType.String, baby.Condition);
                db.AddInParameter(cmd, "@BusTime" + i, DbType.String, baby.BusTime);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, baby.Address);
                db.AddInParameter(cmd, "@Bus" + i, DbType.String, baby.Bus);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, baby.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, baby.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, baby.Phone);
                db.AddInParameter(cmd, "@Phone2_" + i, DbType.String, baby.Phone2);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, baby.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, baby.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, baby.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, baby.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, baby.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, baby.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, baby.TId);
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
