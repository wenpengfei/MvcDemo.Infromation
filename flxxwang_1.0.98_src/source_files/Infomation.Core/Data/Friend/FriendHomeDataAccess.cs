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
    public class FriendHomeDataAccess : DataAccess<FriendHome, int>
    {
        //public override FriendHome Insert(FriendHome instance)
        //{
        //    FriendHome home = instance as FriendHome;

        //    string sql = "INSERT INTO " + TableName + " (Title,Sex,Age,HomeProvinceId,HomeCityId,[Content],ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@Sex,@Age,@HomeProvinceId,@HomeCityId,@Content,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, home.Title);
        //    db.AddInParameter(cmd, "@Sex", DbType.Boolean, home.Sex);
        //    db.AddInParameter(cmd, "@Age", DbType.Byte, home.Age);

        //    db.AddInParameter(cmd, "@HomeProvinceId", DbType.Byte, home.HomeProvinceId);
        //    db.AddInParameter(cmd, "@HomeCityId", DbType.Int16, home.HomeCityId);

        //    db.AddInParameter(cmd, "@Content", DbType.String, home.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, home.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, home.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, home.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, home.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, home.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, home.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, home.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, home.Source);

        //    home.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return home;
        //}

        public override List<FriendHome> Insert(List<FriendHome> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,Sex,Age,HomeProvinceId,HomeCityId,[Content],ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@Sex" + i + ",@Age" + i + ",@HomeProvinceId" + i + ",@HomeCityId" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var home = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, home.Title);
                db.AddInParameter(cmd, "@Sex" + i, DbType.Boolean, home.Sex);
                db.AddInParameter(cmd, "@Age" + i, DbType.Byte, home.Age);

                db.AddInParameter(cmd, "@HomeProvinceId" + i, DbType.Byte, home.HomeProvinceId);
                db.AddInParameter(cmd, "@HomeCityId" + i, DbType.Int16, home.HomeCityId);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, home.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, home.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, home.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, home.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, home.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, home.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, home.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, home.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, home.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, home.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, home.TId);
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
