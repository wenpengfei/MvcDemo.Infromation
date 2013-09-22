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
    public class EduAbroadDataAccess : DataAccess<EduAbroad, int>
    {
        //public override EduAbroad Insert(EduAbroad instance)
        //{
        //    EduAbroad abroad = instance as EduAbroad;

        //    string sql = "INSERT INTO " + TableName + " (Title,ObjectType,Tag1,Tag2,BusTime,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@ObjectType,@Tag1,@Tag2,@BusTime,@Address,@Bus,@Content,@ContactPerson,@Phone,@Phone2,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, abroad.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, abroad.ObjectType);

        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, abroad.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, abroad.Tag2);

        //    db.AddInParameter(cmd, "@BusTime", DbType.String, abroad.BusTime);
        //    db.AddInParameter(cmd, "@Address", DbType.String, abroad.Address);
        //    db.AddInParameter(cmd, "@Bus", DbType.String, abroad.Bus);

        //    db.AddInParameter(cmd, "@Content", DbType.String, abroad.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, abroad.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, abroad.Phone);
        //    db.AddInParameter(cmd, "@Phone2", DbType.String, abroad.Phone2);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, abroad.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, abroad.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, abroad.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, abroad.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, abroad.Source);

        //    abroad.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return abroad;
        //}

        public override List<EduAbroad> Insert(List<EduAbroad> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,ObjectType,Tag1,Tag2,BusTime,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@ObjectType" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@BusTime" + i + ",@Address" + i + ",@Bus" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Phone2_" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var abroad = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, abroad.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, abroad.ObjectType);

                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, abroad.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, abroad.Tag2);

                db.AddInParameter(cmd, "@BusTime" + i, DbType.String, abroad.BusTime);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, abroad.Address);
                db.AddInParameter(cmd, "@Bus" + i, DbType.String, abroad.Bus);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, abroad.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, abroad.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, abroad.Phone);
                db.AddInParameter(cmd, "@Phone2_" + i, DbType.String, abroad.Phone2);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, abroad.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, abroad.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, abroad.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, abroad.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, abroad.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, abroad.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, abroad.TId);
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
