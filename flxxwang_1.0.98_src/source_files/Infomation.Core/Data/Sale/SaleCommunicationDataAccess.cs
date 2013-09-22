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
    public class SaleCommunicationDataAccess : DataAccess<SaleCommunication, int>
    {
        //public override SaleCommunication Insert(SaleCommunication instance)
        //{
        //    SaleCommunication communication = instance as SaleCommunication;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District,@ObjectType,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, communication.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, communication.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, communication.District);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, communication.ObjectType);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, communication.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, communication.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, communication.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, communication.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, communication.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, communication.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, communication.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, communication.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, communication.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, communication.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, communication.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, communication.Source);

        //    communication.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return communication;
        //}

        public override List<SaleCommunication> Insert(List<SaleCommunication> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@District" + i + ",@ObjectType" + i + ",@Price" + i + ",@Pictures" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var communication = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, communication.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, communication.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, communication.District);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, communication.ObjectType);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, communication.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, communication.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, communication.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, communication.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, communication.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, communication.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, communication.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, communication.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, communication.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, communication.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, communication.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, communication.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, communication.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, communication.TId);
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
