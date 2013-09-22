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
    public class TicketAirplaneDataAccess : DataAccess<TicketAirplane, int>
    {
        //public override TicketAirplane Insert(TicketAirplane instance)
        //{
        //    TicketAirplane plane = instance as TicketAirplane;

        //    string sql = "INSERT INTO " + TableName + " (Title,ObjectType,Address,Content,IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@ObjectType,@Address,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, plane.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, plane.ObjectType);
        //    db.AddInParameter(cmd, "@Address", DbType.String, plane.Address);

        //    db.AddInParameter(cmd, "@Content", DbType.String, plane.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, plane.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, plane.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, plane.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, plane.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, plane.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, plane.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, plane.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, plane.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, plane.Source);

        //    plane.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return plane;
        //}

        public override List<TicketAirplane> Insert(List<TicketAirplane> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,ObjectType,Address,Content,IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@ObjectType" + i + ",@Address" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var plane = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, plane.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, plane.ObjectType);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, plane.Address);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, plane.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, plane.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, plane.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, plane.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, plane.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, plane.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, plane.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, plane.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, plane.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, plane.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, plane.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, plane.TId);
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
