using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using Framework.Data;

namespace Framework.Common
{
    [Table(Name = "Fr_IP")]
    public class IP:ModelBase<IP,int>
    {
        [Column(IsPrimaryKey = true)]
        public int Id
        {
            get;
            set;
        }
        public long StartIP
        {
            get;
            set;
        }
        public long EndIP
        {
            get;
            set;
        }
        public string Address
        {
            get;
            set;
        }
        public short? CityId
        {
            get;
            set;
        }
        private static List<IP> _allCityIP;
        public static List<IP> AllCityIP
        {
            get
            {
                if (_allCityIP == null)
                {
                    _allCityIP = IP.Entities.Where(ip => ip.CityId != null).ToList();
                }
                return _allCityIP;
            }
        }
        public static long CIP(string sip)
        {
            if (sip == "::1")
            {
                sip = "127.0.0.1";
            }
            var array = sip.Split(new char[] { '.' });
            var sip1 = Convert.ToInt64(array[0]);
            var sip2 = Convert.ToInt64(array[1]);
            var sip3 = Convert.ToInt64(array[2]);
            var sip4 = Convert.ToInt64(array[3]);
            return sip1 * 256 * 256 * 256 + sip2 * 256 * 256 + sip3 * 256 + sip4;//sip1、sip2、sip3、sip4转成long型,返回值才是long型,如果是int型返回值是int型则可能溢出返回结果为负数.
        }
        protected override DataAccess<IP, int> GetProvider()
        {
            return new IPDataAccess();
        }
    }
}
