using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using Framework.Data;

namespace Framework.Common
{
    public class ProvinceDataAccess : DataAccess<Province, byte>
    {
        public override Province Insert(Province instance)
        {
            Province province = instance;

            string sql = "INSERT INTO " + TableName + " (Name,CountryId,ShortName)" +
                                        "VALUES (@Name,@CountryId,@ShortName)";
            sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

            DbCommand cmd = db.GetSqlStringCommand(sql);
            db.AddInParameter(cmd, "@Name", DbType.String, province.Name);
            db.AddInParameter(cmd, "@CountryId", DbType.Byte, province.CountryId);
            db.AddInParameter(cmd, "@ShortName", DbType.String, province.ShortName);
            province.Id = Convert.ToByte(db.ExecuteScalar(cmd));

            return province;

        }

        public override List<Province> Insert(List<Province> instances)
        {
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }
            var collection = new List<Province>();
            foreach (var item in instances)
            {
                var city = this.Insert(item);
                collection.Add(city);
            }
            return collection;
        }
    }
}
