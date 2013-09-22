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
    /// 市.
    /// </summary>
    [Table(Name = "Fr_City")]
    [DataContract]
    public class City : ModelBase<City, short>
    {
        [Column(IsPrimaryKey = true)]
        [DataMember]
        public short Id
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
        public byte ProvinceId
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
        [DataMember]
        public string Code
        {
            get;
            set;
        }
        [DataMember]
        public string Aleph
        {
            get;
            set;
        }
        [DataMember]
        public short Sequence
        {
            get;
            set;
        }
        private List<Region> _regions;
        public List<Region> Regions
        {
            get
            {
                if (_regions == null)
                {
                    _regions = Region.GetRegions(this.Id);
                }
                return _regions;
            }
        }
        private static List<City> _cities;
        public static List<City> Cities
        {
            get
            {
                if (_cities == null)
                {
                    _cities = SelectAll();
                }
                return _cities;
            }
        }

        public static IEnumerable<City> GetCities(int ProvinceId)//ajax转int
        {
            return Cities.Where(item => item.ProvinceId == ProvinceId);
        }

        public static City GetCity(int CityId)//ajax转int
        {
            return Cities.FirstOrDefault(city => city.Id == CityId);
        }

        public Province Province
        {
            get
            {
                return Province.Provinces.FirstOrDefault(province => province.Id == ProvinceId);
            }
        }

        public byte CountryId
        {
            get
            {
                return Province.CountryId;
            }
        }

        public Country Country
        {
            get
            {
                return Province.Country;
            }
        }

        public List<City> DataSelectAllByProvince(int ProvinceId)//ajax转int
        {
            return base.DataSelectAll(item => item.ProvinceId == ProvinceId);
        }
        public static List<City> SelectAllByProvince(int ProvinceId)//ajax转int
        {
            return new City().DataSelectAllByProvince(ProvinceId);
        }

        public override City DataSelect(short PrimaryKey)
        {
            return City.GetCity(PrimaryKey);
        }
        public static City GetCityByCode(string cityCode)
        {
            return City.Cities.FirstOrDefault(item => item.Code != null && item.Code.ToLower() == cityCode.ToLower());
        }
        protected override DataAccess<City, short> GetProvider()
        {
            return new CityDataAccess();
        }
    }
}
