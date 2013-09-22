using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using Framework.Common;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 同乡会.
    /// </summary>
    [Table(Name = "Info_FriendHome")]
    public class FriendHome:FriendBase<FriendHome>
    {
        public string Title
        {
            get;
            set;
        }
        public bool? Sex
        {
            get;
            set;
        }
        public byte? Age
        {
            get;
            set;
        }
        /// <summary>
        /// 家乡所在省份.
        /// </summary>
        public byte HomeProvinceId
        {
            get;
            set;
        }
        /// <summary>
        /// 家乡所在城市.
        /// </summary>
        public short? HomeCityId
        {
            get;
            set;
        }
        /// <summary>
        /// QQ或MSN
        /// </summary>
        public string QQOrMSN
        {
            get;
            set;
        }
        public string HomeProvinceName
        {
            get
            {
                var province = Province.GetProvince(this.HomeProvinceId);
                if (province != null)
                {
                    return province.ShortName;
                }
                return null;
            }
        }
        public string HomeCityName
        {
            get
            {
                if (this.HomeCityId == null)
                {
                    return null;
                }
                var city = City.GetCity(this.HomeCityId.Value);
                if (city != null)
                {
                    return city.ShortName;
                }
                return null;
            }
        }

        #region InfoBase 重写成员.
        #endregion
        protected override DataAccess<FriendHome, int> GetProvider()
        {
            return new FriendHomeDataAccess();
        }
    }
}
