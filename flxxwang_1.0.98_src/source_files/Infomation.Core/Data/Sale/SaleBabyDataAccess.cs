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
    public class SaleBabyDataAccess : DataAccess<SaleBaby, int>
    {
        //public override SaleBaby Insert(SaleBaby instance)
        //{
        //    SaleBaby baby = instance as SaleBaby;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag1,Tag2,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District,@ObjectType,@Tag1,@Tag2,@Quality,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, baby.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, baby.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, baby.District);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, baby.ObjectType);
        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, baby.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, baby.Tag2);
        //    db.AddInParameter(cmd, "@Quality", DbType.Byte, baby.Quality);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, baby.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, baby.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, baby.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, baby.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, baby.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, baby.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, baby.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, baby.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, baby.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, baby.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, baby.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, baby.Source);

        //    baby.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return baby;
        //}

        public override List<SaleBaby> Insert(List<SaleBaby> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag1,Tag2,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@District" + i + ",@ObjectType" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@Quality" + i + ",@Price" + i + ",@Pictures" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var baby = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, baby.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, baby.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, baby.District);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, baby.ObjectType);
                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, baby.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, baby.Tag2);
                db.AddInParameter(cmd, "@Quality" + i, DbType.Byte, baby.Quality);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, baby.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, baby.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, baby.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, baby.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, baby.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, baby.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, baby.QQOrMSN);

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
