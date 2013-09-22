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
    public class EduITDataAccess : DataAccess<EduIT, int>
    {
        //public override EduIT Insert(EduIT instance)
        //{
        //    EduIT it = instance as EduIT;

        //    string sql = "INSERT INTO " + TableName + " (Title,ObjectType,Tag1,Tag2,TrainWay,BusTime,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@ObjectType,@Tag1,@Tag2,@TrainWay,@BusTime,@Address,@Bus,@Content,@ContactPerson,@Phone,@Phone2,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, it.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, it.ObjectType);

        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, it.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, it.Tag2);

        //    db.AddInParameter(cmd, "@TrainWay", DbType.String, it.TrainWay);
        //    db.AddInParameter(cmd, "@BusTime", DbType.String, it.BusTime);
        //    db.AddInParameter(cmd, "@Address", DbType.String, it.Address);
        //    db.AddInParameter(cmd, "@Bus", DbType.String, it.Bus);

        //    db.AddInParameter(cmd, "@Content", DbType.String, it.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, it.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, it.Phone);
        //    db.AddInParameter(cmd, "@Phone2", DbType.String, it.Phone2);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, it.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, it.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, it.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, it.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, it.Source);

        //    it.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return it;
        //}

        public override List<EduIT> Insert(List<EduIT> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,ObjectType,Tag1,Tag2,TrainWay,BusTime,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@ObjectType" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@TrainWay" + i + ",@BusTime" + i + ",@Address" + i + ",@Bus" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Phone2_" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var it = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, it.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, it.ObjectType);

                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, it.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, it.Tag2);

                db.AddInParameter(cmd, "@TrainWay" + i, DbType.String, it.TrainWay);
                db.AddInParameter(cmd, "@BusTime" + i, DbType.String, it.BusTime);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, it.Address);
                db.AddInParameter(cmd, "@Bus" + i, DbType.String, it.Bus);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, it.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, it.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, it.Phone);
                db.AddInParameter(cmd, "@Phone2_" + i, DbType.String, it.Phone2);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, it.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, it.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, it.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, it.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, it.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, it.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, it.TId);
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
