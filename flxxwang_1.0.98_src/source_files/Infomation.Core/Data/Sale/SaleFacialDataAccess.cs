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
    public class SaleFacialDataAccess : DataAccess<SaleFacial, int>
    {
        //public override SaleFacial Insert(SaleFacial instance)
        //{
        //    SaleFacial facial = instance as SaleFacial;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag1,Tag2,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District,@ObjectType,@Tag1,@Tag2,@Quality,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, facial.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, facial.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, facial.District);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, facial.ObjectType);
        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, facial.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, facial.Tag2);
        //    db.AddInParameter(cmd, "@Quality", DbType.Byte, facial.Quality);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, facial.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, facial.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, facial.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, facial.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, facial.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, facial.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, facial.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, facial.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, facial.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, facial.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, facial.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, facial.Source);

        //    facial.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return facial;
        //}

        public override List<SaleFacial> Insert(List<SaleFacial> instances)
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
                var facial = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, facial.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, facial.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, facial.District);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, facial.ObjectType);
                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, facial.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, facial.Tag2);
                db.AddInParameter(cmd, "@Quality" + i, DbType.Byte, facial.Quality);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, facial.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, facial.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, facial.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, facial.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, facial.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, facial.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, facial.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, facial.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, facial.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, facial.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, facial.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, facial.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, facial.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, facial.TId);
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
