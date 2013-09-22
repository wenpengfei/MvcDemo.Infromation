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
    public class SaleEquipmentDataAccess : DataAccess<SaleEquipment, int>
    {
        //public override SaleEquipment Insert(SaleEquipment instance)
        //{
        //    SaleEquipment equipment = instance as SaleEquipment;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District,@ObjectType,@Quality,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, equipment.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, equipment.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, equipment.District);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, equipment.ObjectType);
        //    db.AddInParameter(cmd, "@Quality", DbType.Byte, equipment.Quality);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, equipment.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, equipment.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, equipment.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, equipment.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, equipment.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, equipment.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, equipment.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, equipment.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, equipment.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, equipment.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, equipment.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, equipment.Source);

        //    equipment.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return equipment;
        //}

        public override List<SaleEquipment> Insert(List<SaleEquipment> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@District" + i + ",@ObjectType" + i + ",@Quality" + i + ",@Price" + i + ",@Pictures" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var equipment = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, equipment.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, equipment.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, equipment.District);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, equipment.ObjectType);
                db.AddInParameter(cmd, "@Quality" + i, DbType.Byte, equipment.Quality);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, equipment.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, equipment.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, equipment.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, equipment.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, equipment.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, equipment.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, equipment.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, equipment.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, equipment.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, equipment.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, equipment.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, equipment.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, equipment.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, equipment.TId);
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
