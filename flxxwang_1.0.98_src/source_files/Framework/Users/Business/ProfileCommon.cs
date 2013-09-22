using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Common;
using System.Web.Security;
using Framework.Data;
using System.Data.Linq.Mapping;

namespace Framework.Users
{
    /// <summary>
    /// 提供Profile的共有属性的实现.
    /// </summary>
    [Table(Name = "Fr_Profile")]
    public class ProfileCommon :ProfileBase<ProfileCommon>// ModelBase<ProfileCommon, int>
    {//为了便于扩展,各平台共有的部分保存在此类,各平台Profile保存该类的一个对象.(使用组合达到扩展.)
        //各平台可以建立一张Profile数据库表作为扩展.
        //public int UserId
        //{
        //    get;
        //    set;
        //}
        /// <summary>
        /// 真实姓名
        /// </summary>
        public string RealName
        {
            get;
            set;
        }
        /// <summary>
        /// 性别.True:男,False:女,保密:null.
        /// </summary>
        public bool? Sex
        {
            get;
            set;
        }
        /// <summary>
        /// 昵称
        /// </summary>
        public string Nickname
        {
            get;
            set;
        }
        private DateTime? _Birthday;
        /// <summary>
        /// 生日
        /// </summary>
        public DateTime? Birthday
        {
            get { return _Birthday; }
            set
            {
                _Birthday = value;
            }
        }

        private string _PhotoUrl;
        public string PhotoURL
        {
            get { return _PhotoUrl; }
            set
            {
                _PhotoUrl = value;
            }
        }

        /// <summary>
        /// 地址.
        /// </summary>
        public string Address
        {
            get;
            set;
        }

        /// <summary>
        /// 国家Id.
        /// </summary>
        public int? CountryId
        {
            get;
            set;
        }
        /// <summary>
        /// 国家.
        /// </summary>
        public Country Country
        {
            get
            {
                if (!CountryId.HasValue)
                {
                    return null;
                }
                if (Country.Countries == null)
                {
                    Country.Countries = Country.SelectAll();
                }
                var collection = Country.Countries.Where(country => country.Id == CountryId.Value);
                if (collection.Count() > 0)
                {
                    return collection.ElementAt(0);
                }
                return null;
            }
        }
        /// <summary>
        /// 国家名称.
        /// </summary>
        public string CountryName
        {
            get
            {
                if (Country == null)
                {
                    return string.Empty;
                }
                return Country.Name;
            }
        }
        /// <summary>
        /// 省份Id.
        /// </summary>
        public int? ProvinceId
        {
            get;
            set;
        }
        /// <summary>
        /// 省份.
        /// </summary>
        public Province Province
        {
            get
            {
                if (!ProvinceId.HasValue)
                {
                    return null;
                }
                //if (Province.Provinces == null)
                //{
                //    Province.Provinces = Province.SelectAll();
                //}
                var collection = Province.Provinces.Where(province => province.Id == ProvinceId);
                if (collection.Count() > 0)
                {
                    return collection.ElementAt(0);
                }
                return null;
            }
        }
        /// <summary>
        /// 省份名称.
        /// </summary>
        public string ProvinceName
        {
            get
            {
                if (Province == null)
                {
                    return string.Empty;
                }
                return Province.Name;
            }
        }
        /// <summary>
        /// 城市Id.
        /// </summary>
        public int? CityId
        {
            get;
            set;
        }
        /// <summary>
        /// 城市.
        /// </summary>
        public City City
        {
            get
            {
                if (!CityId.HasValue)
                {
                    return null;
                }
                //if (City.Cities == null)
                //{
                //    City.Cities = City.SelectAll();
                //}
                var collection = City.Cities.Where(city => city.Id == CityId.Value);
                if (collection.Count() > 0)
                {
                    return collection.ElementAt(0);
                }
                return null;
            }
        }
        /// <summary>
        /// 城市名称.
        /// </summary>
        public string CityName
        {
            get
            {
                if (City == null)
                {
                    return string.Empty;
                }
                return City.Name;
            }
        }
        private string _PhoneMain;
        /// <summary>
        /// 常用电话.
        /// </summary>
        public string PhoneMain
        {
            get { return _PhoneMain; }
            set
            {
                _PhoneMain = value;
            }
        }

        private string _PhoneFax;
        /// <summary>
        /// 传真.
        /// </summary>
        public string PhoneFax
        {
            get { return _PhoneFax; }
            set
            {
                _PhoneFax = value;
            }
        }

        private string _PhoneMobile;
        /// <summary>
        /// 手机.
        /// </summary>
        public string PhoneMobile
        {
            get { return _PhoneMobile; }
            set
            {
                _PhoneMobile = value;
            }
        }

        //private string _EmailAddress;
        //public string EmailAddress
        //{
        //    get { return _EmailAddress; }
        //    set
        //    {
        //        _EmailAddress = value;
        //    }
        //}

        //private string _Company;
        //public string Company
        //{
        //    get { return _Company; }
        //    set
        //    {
        //        _Company = value;
        //    }
        //}


        private string _AboutMe;
        /// <summary>
        /// 关于我.
        /// </summary>
        public string AboutMe
        {
            get { return _AboutMe; }
            set
            {
                _AboutMe = value;
            }
        }
        public string PostCode
        {
            get;
            set;
        }
        public string WebSite
        {
            get;
            set;
        }
        public string QQ
        {
            get;
            set;
        }
        public string IP
        {
            get;
            set;
        }
        public DateTime DateCreated
        {
            get;
            set;
        }
        public DateTime DateModified
        {
            get;
            set;
        }
        public static ProfileCommon GetProfile(string username)
        {
            MembershipUser user=Membership.GetUser(username);
            if(user==null)
            {
                return null;
            }
            int UserId = Convert.ToInt32(user.ProviderUserKey);
            return Select(UserId);
        }
        protected override DataAccess<ProfileCommon, int> GetProvider()
        {
            return new ProfileCommonDataAccess();
        }
    }
}
