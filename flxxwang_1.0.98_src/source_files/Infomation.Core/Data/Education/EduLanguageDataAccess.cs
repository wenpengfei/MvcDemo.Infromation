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
    public class EduLanguageDataAccess : DataAccess<EduLanguage, int>
    {
        //public override EduLanguage Insert(EduLanguage instance)
        //{
        //    EduLanguage language = instance as EduLanguage;

        //    string sql = "INSERT INTO " + TableName + " (Title,ObjectType,Tag1,Tag2,Tag3,Tag4,Tag5,Tag6,Tag7,Tag8,Tag9,Tag10,Tag11,Tag12,BusTime,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@ObjectType,@Tag1,@Tag2,@Tag3,@Tag4,@Tag5,@Tag6,@Tag7,@Tag8,@Tag9,@Tag10,@Tag11,@Tag12,@BusTime,@Address,@Bus,@Content,@ContactPerson,@Phone,@Phone2,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, language.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, language.ObjectType);

        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, language.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, language.Tag2);
        //    db.AddInParameter(cmd, "@Tag3", DbType.Byte, language.Tag3);
        //    db.AddInParameter(cmd, "@Tag4", DbType.Byte, language.Tag4);
        //    db.AddInParameter(cmd, "@Tag5", DbType.Byte, language.Tag5);
        //    db.AddInParameter(cmd, "@Tag6", DbType.Byte, language.Tag6);
        //    db.AddInParameter(cmd, "@Tag7", DbType.Byte, language.Tag7);
        //    db.AddInParameter(cmd, "@Tag8", DbType.Byte, language.Tag8);
        //    db.AddInParameter(cmd, "@Tag9", DbType.Byte, language.Tag9);
        //    db.AddInParameter(cmd, "@Tag10", DbType.Byte, language.Tag10);
        //    db.AddInParameter(cmd, "@Tag11", DbType.Byte, language.Tag11);
        //    db.AddInParameter(cmd, "@Tag12", DbType.Byte, language.Tag12);

        //    db.AddInParameter(cmd, "@BusTime", DbType.String, language.BusTime);
        //    db.AddInParameter(cmd, "@Address", DbType.String, language.Address);
        //    db.AddInParameter(cmd, "@Bus", DbType.String, language.Bus);

        //    db.AddInParameter(cmd, "@Content", DbType.String, language.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, language.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, language.Phone);
        //    db.AddInParameter(cmd, "@Phone2", DbType.String, language.Phone2);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, language.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, language.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, language.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, language.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, language.Source);

        //    language.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return language;
        //}

        public override List<EduLanguage> Insert(List<EduLanguage> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,ObjectType,Tag1,Tag2,Tag3,Tag4,Tag5,Tag6,Tag7,Tag8,Tag9,Tag10,Tag11,Tag12,BusTime,Address,Bus,[Content],ContactPerson,Phone,Phone2,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@ObjectType" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@Tag3_" + i + ",@Tag4_" + i + ",@Tag5_" + i + ",@Tag6_" + i + ",@Tag7_" + i + ",@Tag8_" + i + ",@Tag9_" + i + ",@Tag10_" + i + ",@Tag11_" + i + ",@Tag12_" + i + ",@BusTime" + i + ",@Address" + i + ",@Bus" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Phone2_" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var language = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, language.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, language.ObjectType);

                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, language.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, language.Tag2);
                db.AddInParameter(cmd, "@Tag3_" + i, DbType.Byte, language.Tag3);
                db.AddInParameter(cmd, "@Tag4_" + i, DbType.Byte, language.Tag4);
                db.AddInParameter(cmd, "@Tag5_" + i, DbType.Byte, language.Tag5);
                db.AddInParameter(cmd, "@Tag6_" + i, DbType.Byte, language.Tag6);
                db.AddInParameter(cmd, "@Tag7_" + i, DbType.Byte, language.Tag7);
                db.AddInParameter(cmd, "@Tag8_" + i, DbType.Byte, language.Tag8);
                db.AddInParameter(cmd, "@Tag9_" + i, DbType.Byte, language.Tag9);
                db.AddInParameter(cmd, "@Tag10_" + i, DbType.Byte, language.Tag10);
                db.AddInParameter(cmd, "@Tag11_" + i, DbType.Byte, language.Tag11);
                db.AddInParameter(cmd, "@Tag12_" + i, DbType.Byte, language.Tag12);

                db.AddInParameter(cmd, "@BusTime" + i, DbType.String, language.BusTime);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, language.Address);
                db.AddInParameter(cmd, "@Bus" + i, DbType.String, language.Bus);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, language.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, language.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, language.Phone);
                db.AddInParameter(cmd, "@Phone2_" + i, DbType.String, language.Phone2);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, language.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, language.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, language.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, language.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, language.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, language.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, language.TId);
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
