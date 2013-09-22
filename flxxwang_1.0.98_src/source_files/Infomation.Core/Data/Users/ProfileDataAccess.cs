using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;

namespace Infomation.Core.Data
{
    public class ProfileDataAccess : DataAccess<Profile, int>
    {
        public override Profile Insert(Profile instance)
        {
            Profile profile = instance as Profile;

            //var common = profile.Common.Insert();

            if (profile.Common != null)
            {
                profile.Common.Insert();
            }
            string sql = "INSERT INTO " + TableName + " (UserId,Credit,Point,Auth,TId)" +
                                        "VALUES (@UserId,@Credit,@Point,@Auth,@TId)";
            //sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

            DbCommand cmd = db.GetSqlStringCommand(sql);
            db.AddInParameter(cmd, "@UserId", DbType.Int32, profile.UserId);
            db.AddInParameter(cmd, "@Credit", DbType.Int32, profile.Credit);
            db.AddInParameter(cmd, "@Point", DbType.Int32, profile.Point);
            db.AddInParameter(cmd, "@Auth", DbType.String, profile.Auth);
            db.AddInParameter(cmd, "@TId", DbType.Int32, profile.TId);
            //profile.UserId = Convert.ToInt32(db.ExecuteScalar(cmd));
            if (db.ExecuteNonQuery(cmd) == 1)
            {
                return profile;
            }
            else
            {
                return null;
            }
        }

        public override List<Profile> Insert(List<Profile> instances)
        {
            if (instances == null)
            {
                return null;
            }
            var collection = new List<Profile>();
            foreach (var item in instances)
            {
                var profile = this.Insert(item);
                collection.Add(profile);
            }
            return collection;
        }
    }
}
