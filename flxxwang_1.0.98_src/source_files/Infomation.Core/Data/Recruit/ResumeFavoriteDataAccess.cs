using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;

namespace Infomation.Core.Data
{
    public class ResumeFavoriteDataAccess : DataAccess<ResumeFavorite, int>
    {
        public override ResumeFavorite Insert(ResumeFavorite instance)
        {
            var favorite = instance;
            var exist = ResumeFavorite.Select(favorite.UserId, favorite.ResumeId);
            if (exist != null)
            {
                return exist;
            }
            string sql = "INSERT INTO " + TableName + " (UserId,ResumeId)" +
                                        "VALUES (@UserId,@ResumeId)";
            sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

            DbCommand cmd = db.GetSqlStringCommand(sql);
            db.AddInParameter(cmd, "@UserId", DbType.Int32, favorite.UserId);
            db.AddInParameter(cmd, "@ResumeId", DbType.Int32, favorite.ResumeId);

            favorite.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

            return favorite;
        }

        public override List<ResumeFavorite> Insert(List<ResumeFavorite> instances)
        {
            if (instances == null)
            {
                return null;
            }
            var collection = new List<ResumeFavorite>();
            foreach (var item in instances)
            {
                var favorite = this.Insert(item);
                collection.Add(favorite);
            }
            return collection;
        }
    }
}
