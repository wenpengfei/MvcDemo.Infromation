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
    public class FriendSexDataAccess : DataAccess<FriendSex, int>
    {
        //public override FriendSex Insert(FriendSex instance)
        //{
        //    FriendSex sex = instance as FriendSex;

        //    string sql = "INSERT INTO " + TableName + " (Purpose,Sex,Age,Constellation,Height,Weight,Marriage,Child,Job,Education,HomeProvinceId,HomeCityId,[Content],ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Purpose,@Sex,@Age,@Constellation,@Height,@Weight,@Marriage,@Child,@Job,@Education,@HomeProvinceId,@HomeCityId,@Content,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Purpose", DbType.String, sex.Purpose);
        //    db.AddInParameter(cmd, "@Sex", DbType.Boolean, sex.Sex);
        //    db.AddInParameter(cmd, "@Age", DbType.Byte, sex.Age);

        //    db.AddInParameter(cmd, "@Constellation", DbType.String, sex.Constellation);
        //    db.AddInParameter(cmd, "@Height", DbType.Byte, sex.Height);
        //    db.AddInParameter(cmd, "@Weight", DbType.Byte, sex.Weight);
        //    db.AddInParameter(cmd, "@Marriage", DbType.String, sex.Marriage);
        //    db.AddInParameter(cmd, "@Child", DbType.String, sex.Child);
        //    db.AddInParameter(cmd, "@Job", DbType.String, sex.Job);
        //    db.AddInParameter(cmd, "@Education", DbType.String, sex.Education);
        //    db.AddInParameter(cmd, "@HomeProvinceId", DbType.Byte, sex.HomeProvinceId);
        //    db.AddInParameter(cmd, "@HomeCityId", DbType.Int16, sex.HomeCityId);

        //    db.AddInParameter(cmd, "@Content", DbType.String, sex.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, sex.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, sex.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, sex.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, sex.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, sex.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, sex.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, sex.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, sex.Source);

        //    sex.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return sex;
        //}

        public override List<FriendSex> Insert(List<FriendSex> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Purpose,Sex,Age,Constellation,Height,Weight,Marriage,Child,Job,Education,HomeProvinceId,HomeCityId,[Content],ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Purpose" + i + ",@Sex" + i + ",@Age" + i + ",@Constellation" + i + ",@Height" + i + ",@Weight" + i + ",@Marriage" + i + ",@Child" + i + ",@Job" + i + ",@Education" + i + ",@HomeProvinceId" + i + ",@HomeCityId" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var sex = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Purpose"+i, DbType.String, sex.Purpose);
                db.AddInParameter(cmd, "@Sex" + i, DbType.Boolean, sex.Sex);
                db.AddInParameter(cmd, "@Age" + i, DbType.Byte, sex.Age);

                db.AddInParameter(cmd, "@Constellation" + i, DbType.String, sex.Constellation);
                db.AddInParameter(cmd, "@Height" + i, DbType.Byte, sex.Height);
                db.AddInParameter(cmd, "@Weight" + i, DbType.Byte, sex.Weight);
                db.AddInParameter(cmd, "@Marriage" + i, DbType.String, sex.Marriage);
                db.AddInParameter(cmd, "@Child" + i, DbType.String, sex.Child);
                db.AddInParameter(cmd, "@Job" + i, DbType.String, sex.Job);
                db.AddInParameter(cmd, "@Education" + i, DbType.String, sex.Education);
                db.AddInParameter(cmd, "@HomeProvinceId" + i, DbType.Byte, sex.HomeProvinceId);
                db.AddInParameter(cmd, "@HomeCityId" + i, DbType.Int16, sex.HomeCityId);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, sex.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, sex.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, sex.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, sex.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, sex.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, sex.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, sex.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, sex.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, sex.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, sex.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, sex.TId);
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
