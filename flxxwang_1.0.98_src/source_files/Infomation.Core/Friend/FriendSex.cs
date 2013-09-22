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
    /// 异性交友.
    /// </summary>
    [Table(Name = "Info_FriendSex")]
    public class FriendSex:FriendBase<FriendSex>
    {
        public string Purpose
        {
            get;
            set;
        }
        public bool Sex
        {
            get;
            set;
        }
        public byte Age
        {
            get;
            set;
        }
        /// <summary>
        /// 星座.
        /// </summary>
        public string Constellation
        {
            get;
            set;
        }
        /// <summary>
        /// 身高.(里米)
        /// </summary>
        public byte Height
        {
            get;
            set;
        }
        /// <summary>
        /// 体重.(公斤)
        /// </summary>
        public byte Weight
        {
            get;
            set;
        }
        /// <summary>
        /// 婚姻.
        /// </summary>
        public string Marriage
        {
            get;
            set;
        }
        /// <summary>
        /// 子女.
        /// </summary>
        public string Child
        {
            get;
            set;
        }
        public string Job
        {
            get;
            set;
        }
        /// <summary>
        /// 学历.
        /// </summary>
        public string Education
        {
            get;
            set;
        }
        /// <summary>
        /// 家乡所在省份.
        /// </summary>
        public byte? HomeProvinceId
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
                if (this.HomeProvinceId != null)
                {
                    var province = Province.GetProvince(this.HomeProvinceId.Value);
                    if (province != null)
                    {
                        return province.ShortName;
                    }
                }
                return null;
            }
        }
        public string HomeCityName
        {
            get
            {
                if (this.HomeCityId != null)
                {
                    var city = City.GetCity(this.HomeCityId.Value);
                    if (city != null)
                    {
                        return city.ShortName;
                    }
                }
                return null;
            }
        }
        #region InfoBase 重写成员.
        #endregion

        protected override DataAccess<FriendSex, int> GetProvider()
        {
            return new FriendSexDataAccess();
        }
    }
}
