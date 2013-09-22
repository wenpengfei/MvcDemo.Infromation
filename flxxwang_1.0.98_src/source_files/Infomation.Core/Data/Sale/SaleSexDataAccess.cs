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
    public class SaleSexDataAccess : DataAccess<SaleSex, int>
    {
        public override SaleSex Insert(SaleSex instance)
        {
            SaleSex sex = instance as SaleSex;

            string sql = "INSERT INTO " + TableName + " (Title,District,ObjectType,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
                                        "VALUES (@Title,@District,@ObjectType,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
            sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

            DbCommand cmd = db.GetSqlStringCommand(sql);
            db.AddInParameter(cmd, "@Title", DbType.String, sex.Title);
            db.AddInParameter(cmd, "@District", DbType.String, sex.District);
            db.AddInParameter(cmd, "@ObjectType", DbType.Byte, sex.ObjectType);
            db.AddInParameter(cmd, "@Price", DbType.Int32, sex.Price);
            db.AddInParameter(cmd, "@Pictures", DbType.String, sex.Pictures);

            db.AddInParameter(cmd, "@Content", DbType.String, sex.Content);
            db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, sex.IsBiz);
            db.AddInParameter(cmd, "@ContactPerson", DbType.String, sex.ContactPerson);
            db.AddInParameter(cmd, "@Phone", DbType.String, sex.Phone);
            db.AddInParameter(cmd, "@QQOrMSN", DbType.String, sex.QQOrMSN);

            db.AddInParameter(cmd, "@UserId", DbType.Int32, sex.UserId);
            db.AddInParameter(cmd, "@CityId", DbType.Int16, sex.CityId);
            db.AddInParameter(cmd, "@RegionId", DbType.Int32, sex.RegionId);
            db.AddInParameter(cmd, "@CircleId", DbType.Int32, sex.CircleId);
            db.AddInParameter(cmd, "@Source", DbType.Int64, sex.Source);

            sex.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

            return sex;
        }
    }
}
