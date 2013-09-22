using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using Framework.Data;

namespace Framework.Common
{
    public class CountryDataAccess : DataAccess<Country, byte>
    {
        public override Country Insert(Country instance)
        {
            Country country = instance;
            string sql = "INSERT INTO " + TableName + " (Name) VALUES (@Name)";
            sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

            DbCommand cmd = db.GetSqlStringCommand(sql);
            db.AddInParameter(cmd, "@Name", DbType.String, country.Name);

            country.Id = Convert.ToByte(db.ExecuteScalar(cmd));

            return country;

        }

        public override List<Country> Insert(List<Country> instances)
        {
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }
            var collection = new List<Country>();
            foreach (var item in instances)
            {
                var city = this.Insert(item);
                collection.Add(city);
            }
            return collection;
        }
    }
}
