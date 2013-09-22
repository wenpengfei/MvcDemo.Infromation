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
    public class EduSpecialDataAccess : DataAccess<EduSpecial, int>
    {
        //public override EduSpecial Insert(EduSpecial instance)
        //{
        //    EduSpecial special = instance as EduSpecial;

        //    string sql = "INSERT INTO " + TableName + " (Title,ObjectType,Tag1,Tag2,Tag3,Tag4,Tag5,Tag6,Tag7,Tag8,Tag9,Tag10,Tag11,Tag12,TrainWay,BusTime,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@ObjectType,@Tag1,@Tag2,@Tag3,@Tag4,@Tag5,@Tag6,@Tag7,@Tag8,@Tag9,@Tag10,@Tag11,@Tag12,@TrainWay,@BusTime,@Address,@Bus,@Content,@ContactPerson,@Phone,@Phone2,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, special.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, special.ObjectType);

        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, special.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, special.Tag2);
        //    db.AddInParameter(cmd, "@Tag3", DbType.Byte, special.Tag3);
        //    db.AddInParameter(cmd, "@Tag4", DbType.Byte, special.Tag4);
        //    db.AddInParameter(cmd, "@Tag5", DbType.Byte, special.Tag5);
        //    db.AddInParameter(cmd, "@Tag6", DbType.Byte, special.Tag6);
        //    db.AddInParameter(cmd, "@Tag7", DbType.Byte, special.Tag7);
        //    db.AddInParameter(cmd, "@Tag8", DbType.Byte, special.Tag8);
        //    db.AddInParameter(cmd, "@Tag9", DbType.Byte, special.Tag9);
        //    db.AddInParameter(cmd, "@Tag10", DbType.Byte, special.Tag10);
        //    db.AddInParameter(cmd, "@Tag11", DbType.Byte, special.Tag11);
        //    db.AddInParameter(cmd, "@Tag12", DbType.Byte, special.Tag12);
        //    db.AddInParameter(cmd, "@TrainWay", DbType.String, special.TrainWay);
            
        //    db.AddInParameter(cmd, "@BusTime", DbType.String, special.BusTime);
        //    db.AddInParameter(cmd, "@Address", DbType.String, special.Address);
        //    db.AddInParameter(cmd, "@Bus", DbType.String, special.Bus);

        //    db.AddInParameter(cmd, "@Content", DbType.String, special.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, special.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, special.Phone);
        //    db.AddInParameter(cmd, "@Phone2", DbType.String, special.Phone2);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, special.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, special.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, special.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, special.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, special.Source);

        //    special.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return special;
        //}

        public override List<EduSpecial> Insert(List<EduSpecial> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,ObjectType,Tag1,Tag2,Tag3,Tag4,Tag5,Tag6,Tag7,Tag8,Tag9,Tag10,Tag11,Tag12,TrainWay,BusTime,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@ObjectType" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@Tag3_" + i + ",@Tag4_" + i + ",@Tag5_" + i + ",@Tag6_" + i + ",@Tag7_" + i + ",@Tag8_" + i + ",@Tag9_" + i + ",@Tag10_" + i + ",@Tag11_" + i + ",@Tag12_" + i + ",@TrainWay" + i + ",@BusTime" + i + ",@Address" + i + ",@Bus" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Phone2_" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var special = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, special.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, special.ObjectType);

                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, special.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, special.Tag2);
                db.AddInParameter(cmd, "@Tag3_" + i, DbType.Byte, special.Tag3);
                db.AddInParameter(cmd, "@Tag4_" + i, DbType.Byte, special.Tag4);
                db.AddInParameter(cmd, "@Tag5_" + i, DbType.Byte, special.Tag5);
                db.AddInParameter(cmd, "@Tag6_" + i, DbType.Byte, special.Tag6);
                db.AddInParameter(cmd, "@Tag7_" + i, DbType.Byte, special.Tag7);
                db.AddInParameter(cmd, "@Tag8_" + i, DbType.Byte, special.Tag8);
                db.AddInParameter(cmd, "@Tag9_" + i, DbType.Byte, special.Tag9);
                db.AddInParameter(cmd, "@Tag10_" + i, DbType.Byte, special.Tag10);
                db.AddInParameter(cmd, "@Tag11_" + i, DbType.Byte, special.Tag11);
                db.AddInParameter(cmd, "@Tag12_" + i, DbType.Byte, special.Tag12);
                db.AddInParameter(cmd, "@TrainWay" + i, DbType.String, special.TrainWay);

                db.AddInParameter(cmd, "@BusTime" + i, DbType.String, special.BusTime);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, special.Address);
                db.AddInParameter(cmd, "@Bus" + i, DbType.String, special.Bus);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, special.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, special.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, special.Phone);
                db.AddInParameter(cmd, "@Phone2_" + i, DbType.String, special.Phone2);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, special.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, special.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, special.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, special.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, special.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, special.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, special.TId);
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
