using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using Framework.Data;

namespace Framework.Users
{
    public class ProfileCommonDataAccess : DataAccess<ProfileCommon, int>
    {
        public override ProfileCommon Insert(ProfileCommon instance)
        {
            ProfileCommon pc = instance;

            string sql = "INSERT INTO " + TableName +
                        "(UserId, RealName,Sex, Nickname, " +
                        "PhotoURL, Birthday,PhoneMain,PhoneFax,PhoneMobile,AboutMe,Address,CountryId,ProvinceId,CityId,PostCode,WebSite,QQ,IP)" +
                        "VALUES (@UserId, @RealName,@Sex, @Nickname, " +
                        "@PhotoURL, @Birthday,@PhoneMain,@PhoneFax,@PhoneMobile,@AboutMe,@Address,@CountryId,@ProvinceId,@CityId,@PostCode,@WebSite,@QQ,@IP)";

            DbCommand cmd = db.GetSqlStringCommand(sql);

            db.AddInParameter(cmd, "@UserId", DbType.Int32, pc.UserId);
            db.AddInParameter(cmd, "@RealName", DbType.String, pc.RealName);
            db.AddInParameter(cmd, "@Sex", DbType.String, pc.Sex);
            db.AddInParameter(cmd, "@Nickname", DbType.String, pc.Nickname);
            db.AddInParameter(cmd, "@PhotoURL", DbType.String, pc.PhotoURL);
            db.AddInParameter(cmd, "@Birthday", DbType.String, pc.Birthday);

            db.AddInParameter(cmd, "@PhoneMain", DbType.String, pc.PhoneMain);
            db.AddInParameter(cmd, "@PhoneFax", DbType.String, pc.PhoneFax);
            db.AddInParameter(cmd, "@PhoneMobile", DbType.String, pc.PhoneMobile);


            db.AddInParameter(cmd, "@AboutMe", DbType.String, pc.AboutMe);
            db.AddInParameter(cmd, "@Address", DbType.String, pc.Address);
            db.AddInParameter(cmd, "@CountryId", DbType.String, pc.CountryId);
            db.AddInParameter(cmd, "@ProvinceId", DbType.String, pc.ProvinceId);
            db.AddInParameter(cmd, "@CityId", DbType.String, pc.CityId);

            db.AddInParameter(cmd, "@PostCode", DbType.String, pc.PostCode);
            db.AddInParameter(cmd, "@WebSite", DbType.String, pc.WebSite);
            db.AddInParameter(cmd, "@QQ", DbType.String, pc.QQ);
            db.AddInParameter(cmd, "@IP", DbType.String, pc.IP);
            if (pc.DataSelect(pc.UserId) == null)
            {
                if (db.ExecuteNonQuery(cmd) == 1)
                {
                    pc.DateCreated = DateTime.Now;
                    pc.DateModified = DateTime.Now;
                    return pc;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return pc.Update();
            }
        }

        public override List<ProfileCommon> Insert(List<ProfileCommon> instances)
        {
            if (instances == null)
            {
                return null;
            }
            var collection = new List<ProfileCommon>();
            foreach (var item in instances)
            {
                var profile = this.Insert(item);
                collection.Add(profile);
            }
            return collection;
        }
    }
}
