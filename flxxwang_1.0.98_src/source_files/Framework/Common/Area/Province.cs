using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Framework.Data;
using System.Runtime.Serialization;
using System.Data.Linq.Mapping;

namespace Framework.Common
{
    /// <summary>
    /// 省份管理
    /// </summary>
    [Table(Name = "Fr_Province")]
    [DataContract]
    public class Province : ModelBase<Province, byte>
    {
        private static List<Province> _provinces;
        public static List<Province> Provinces
        {
            get
            {
                if (_provinces == null)
                {
                    _provinces = SelectAll();
                }
                return _provinces;
            }
        }

        [Column(IsPrimaryKey = true)]
        [DataMember]
        public byte Id
        {
            get;
            set;
        }
        [DataMember]
        public string Name
        {
            get;
            set;
        }
        [DataMember]
        public byte CountryId
        {
            get;
            set;
        }
        [DataMember]
        public string ShortName
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
                if (Country.Countries == null)
                {
                    Country.Countries = Country.SelectAll();
                }
                var collection = Country.Countries.Where(country => country.Id == CountryId);
                if (collection.Count() > 0)
                {
                    return collection.ElementAt(0);
                }
                return null;
            }
        }
        public List<City> Cities
        {
            get
            {
                return City.Cities.Where(city => city.ProvinceId == this.Id).ToList();
            }
        }
        public override Province DataSelect(byte PrimaryKey)
        {
            return Province.GetProvince(PrimaryKey);
        }
        public static Province GetProvince(int ProvinceId)//ajax转int
        {
            return Provinces.FirstOrDefault(province => province.Id == ProvinceId);
        }
        public List<Province> DataSelectAllByCountry(int CountryId)//ajax转int
        {
            return base.DataSelectAll(item => item.CountryId == CountryId);
        }
        public static List<Province> SelectAllByCountry(int CountryId)//ajax转int
        {
            return new Province().DataSelectAllByCountry(CountryId);
        }
        protected override DataAccess<Province, byte> GetProvider()
        {
            return new ProvinceDataAccess();
        }
    }
}
