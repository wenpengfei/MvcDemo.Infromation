using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Runtime.Serialization;
using System.Data.Linq.Mapping;

namespace Framework.Common
{
    /// <summary>
    /// 国家.
    /// </summary>
    [Table(Name = "Fr_Country")]
    [DataContract]
    public class Country:ModelBase<Country,byte>
    {
        public static List<Country> Countries;

        [Column(IsPrimaryKey = true)]
        [DataMember]
        public byte Id
        {
            get;
            set;
        }
        /// <summary>
        /// 国家名称.
        /// </summary>
        [DataMember]
        public string Name
        {
            get;
            set;
        }
        public List<Province> Provinces
        {
            get;
            set;
        }
        public static Country GetCountry(int CountryId)//ajax转int
        {
            return Countries.FirstOrDefault(country => country.Id == CountryId);
        }
        protected override DataAccess<Country, byte> GetProvider()
        {
            return new CountryDataAccess();
        }
    }
}
