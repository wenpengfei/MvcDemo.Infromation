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
    public class FriendInterestDataAccess : DataAccess<FriendInterest, int>
    {
        //public override FriendInterest Insert(FriendInterest instance)
        //{
        //    FriendInterest interest = instance as FriendInterest;

        //    string sql = "INSERT INTO " + TableName + " (Interest,Sex,Age,[Content],ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Interest,@Sex,@Age,@Content,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Interest", DbType.String, interest.Interest);
        //    db.AddInParameter(cmd, "@Sex", DbType.Boolean, interest.Sex);
        //    db.AddInParameter(cmd, "@Age", DbType.Byte, interest.Age);


        //    db.AddInParameter(cmd, "@Content", DbType.String, interest.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, interest.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, interest.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, interest.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, interest.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, interest.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, interest.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, interest.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, interest.Source);

        //    interest.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return interest;
        //}

        public override List<FriendInterest> Insert(List<FriendInterest> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Interest,Sex,Age,[Content],ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Interest" + i + ",@Sex" + i + ",@Age" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var interest = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Interest"+i, DbType.String, interest.Interest);
                db.AddInParameter(cmd, "@Sex" + i, DbType.Boolean, interest.Sex);
                db.AddInParameter(cmd, "@Age" + i, DbType.Byte, interest.Age);


                db.AddInParameter(cmd, "@Content" + i, DbType.String, interest.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, interest.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, interest.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, interest.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, interest.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, interest.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, interest.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, interest.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, interest.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, interest.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, interest.TId);
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
