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
    public class SaleMobileNumberDataAccess : DataAccess<SaleMobileNumber, int>
    {
        //public override SaleMobileNumber Insert(SaleMobileNumber instance)
        //{
        //    SaleMobileNumber number = instance as SaleMobileNumber;

        //    string sql = "INSERT INTO " + TableName + " (District,ObjectType,Number,Is3G,Character,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@District,@ObjectType,@Number,@Is3G,@Character,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@District", DbType.String, number.District);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, number.ObjectType);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, number.Price);
        //    db.AddInParameter(cmd, "@Number", DbType.String, number.Number);
        //    db.AddInParameter(cmd, "@Is3G", DbType.Boolean, number.Is3G);
        //    db.AddInParameter(cmd, "@Character", DbType.String, number.Character);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, number.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, number.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, number.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, number.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, number.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, number.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, number.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, number.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, number.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, number.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, number.Source);

        //    number.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return number;
        //}

        public override List<SaleMobileNumber> Insert(List<SaleMobileNumber> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (District,ObjectType,Number,Is3G,Character,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@District" + i + ",@ObjectType" + i + ",@Number" + i + ",@Is3G" + i + ",@Character" + i + ",@Price" + i + ",@Pictures" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var number = instances.ElementAt(i);
                db.AddInParameter(cmd, "@District"+i, DbType.String, number.District);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, number.ObjectType);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, number.Price);
                db.AddInParameter(cmd, "@Number" + i, DbType.String, number.Number);
                db.AddInParameter(cmd, "@Is3G" + i, DbType.Boolean, number.Is3G);
                db.AddInParameter(cmd, "@Character" + i, DbType.String, number.Character);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, number.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, number.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, number.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, number.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, number.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, number.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, number.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, number.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, number.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, number.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, number.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, number.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, number.TId);
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
