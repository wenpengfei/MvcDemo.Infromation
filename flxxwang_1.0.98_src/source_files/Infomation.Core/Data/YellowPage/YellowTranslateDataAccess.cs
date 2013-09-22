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
    public class YellowTranslateDataAccess : DataAccess<YellowTranslate, int>
    {
        //public override YellowTranslate Insert(YellowTranslate instance)
        //{
        //    YellowTranslate yp = instance as YellowTranslate;

        //    string sql = "INSERT INTO " + TableName + " (Title,ObjectType1,ObjectType2,ObjectType3,ObjectType4,ObjectType5,Tag1,Tag2,Tag3,Tag4,Tag5,Tag6,BusTime,Bus,Address,[Content],ContactPerson,Phone,Phone2,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@ObjectType1,@ObjectType2,@ObjectType3,@ObjectType4,@ObjectType5,@Tag1,@Tag2,@Tag3,@Tag4,@Tag5,@Tag6,@BusTime,@Bus,@Address,@Content,@ContactPerson,@Phone,@Phone2,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, yp.Title);

        //    db.AddInParameter(cmd, "@ObjectType1", DbType.Byte, yp.ObjectType1);
        //    db.AddInParameter(cmd, "@ObjectType2", DbType.Byte, yp.ObjectType2);
        //    db.AddInParameter(cmd, "@ObjectType3", DbType.Byte, yp.ObjectType3);
        //    db.AddInParameter(cmd, "@ObjectType4", DbType.Byte, yp.ObjectType4);
        //    db.AddInParameter(cmd, "@ObjectType5", DbType.Byte, yp.ObjectType5);

        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, yp.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, yp.Tag2);
        //    db.AddInParameter(cmd, "@Tag3", DbType.Byte, yp.Tag3);
        //    db.AddInParameter(cmd, "@Tag4", DbType.Byte, yp.Tag4);
        //    db.AddInParameter(cmd, "@Tag5", DbType.Byte, yp.Tag5);
        //    db.AddInParameter(cmd, "@Tag6", DbType.Byte, yp.Tag6);

        //    db.AddInParameter(cmd, "@BusTime", DbType.String, yp.BusTime);
        //    db.AddInParameter(cmd, "@Address", DbType.String, yp.Address);
        //    db.AddInParameter(cmd, "@Bus", DbType.String, yp.Bus);
            

        //    db.AddInParameter(cmd, "@Content", DbType.String, yp.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, yp.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, yp.Phone);
        //    db.AddInParameter(cmd, "@Phone2", DbType.String, yp.Phone2);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, yp.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, yp.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, yp.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, yp.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, yp.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, yp.Source);

        //    yp.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return yp;
        //}

        public override List<YellowTranslate> Insert(List<YellowTranslate> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,ObjectType1,ObjectType2,ObjectType3,ObjectType4,ObjectType5,Tag1,Tag2,Tag3,Tag4,Tag5,Tag6,BusTime,Bus,Address,[Content],ContactPerson,Phone,Phone2,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@ObjectType1_" + i + ",@ObjectType2_" + i + ",@ObjectType3_" + i + ",@ObjectType4_" + i + ",@ObjectType5_" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@Tag3_" + i + ",@Tag4_" + i + ",@Tag5_" + i + ",@Tag6_" + i + ",@BusTime" + i + ",@Bus" + i + ",@Address" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Phone2_" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var yp = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, yp.Title);

                db.AddInParameter(cmd, "@ObjectType1_" + i, DbType.Byte, yp.ObjectType1);
                db.AddInParameter(cmd, "@ObjectType2_" + i, DbType.Byte, yp.ObjectType2);
                db.AddInParameter(cmd, "@ObjectType3_" + i, DbType.Byte, yp.ObjectType3);
                db.AddInParameter(cmd, "@ObjectType4_" + i, DbType.Byte, yp.ObjectType4);
                db.AddInParameter(cmd, "@ObjectType5_" + i, DbType.Byte, yp.ObjectType5);

                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, yp.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, yp.Tag2);
                db.AddInParameter(cmd, "@Tag3_" + i, DbType.Byte, yp.Tag3);
                db.AddInParameter(cmd, "@Tag4_" + i, DbType.Byte, yp.Tag4);
                db.AddInParameter(cmd, "@Tag5_" + i, DbType.Byte, yp.Tag5);
                db.AddInParameter(cmd, "@Tag6_" + i, DbType.Byte, yp.Tag6);

                db.AddInParameter(cmd, "@BusTime" + i, DbType.String, yp.BusTime);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, yp.Address);
                db.AddInParameter(cmd, "@Bus" + i, DbType.String, yp.Bus);


                db.AddInParameter(cmd, "@Content" + i, DbType.String, yp.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, yp.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, yp.Phone);
                db.AddInParameter(cmd, "@Phone2_" + i, DbType.String, yp.Phone2);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, yp.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, yp.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, yp.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, yp.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, yp.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, yp.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, yp.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, yp.TId);
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
