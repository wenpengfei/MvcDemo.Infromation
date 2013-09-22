using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using Framework.Data;

namespace Framework.Common
{
    public class CityDataAccess : DataAccess<City, short>
    {
        public override City Insert(City instance)
        {
            City city = instance;

            string sql = "INSERT INTO " + TableName + " (Name,ProvinceId,ShortName,Code,Aleph,Sequence)" +
                                        "VALUES (@Name,@ProvinceId,@ShortName,@Code,@Aleph,@Sequence)";
            sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

            DbCommand cmd = db.GetSqlStringCommand(sql);
            db.AddInParameter(cmd, "@Name", DbType.String, city.Name);
            db.AddInParameter(cmd, "@ProvinceId", DbType.Byte, city.ProvinceId);
            db.AddInParameter(cmd, "@ShortName", DbType.String, city.ShortName);
            db.AddInParameter(cmd, "@Code", DbType.String, city.Code);
            db.AddInParameter(cmd, "@Aleph", DbType.String, city.Aleph);
            db.AddInParameter(cmd, "@Sequence", DbType.Int16, city.Sequence);
            city.Id = Convert.ToInt16(db.ExecuteScalar(cmd));

            return city;

        }

        public override List<City> Insert(List<City> instances)
        {
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }
            var collection = new List<City>();
            foreach (var item in instances)
            {
                var city = this.Insert(item);
                collection.Add(city);
            }
            return collection;
        }
    }
}
