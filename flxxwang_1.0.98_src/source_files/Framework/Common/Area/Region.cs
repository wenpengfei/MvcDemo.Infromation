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
    /// 区域.如西湖区、上城区.
    /// </summary>
    [Table(Name = "Fr_Region")]
    [DataContract]
    public class Region : ModelBase<Region, short>
    {
        //经实际运行，发现如果缓存为字符串形式，虽然节药了内存，但是对字行串拆分时相当慢，因为字符串特别长.
        //private static string _regions;
        //private static string Regions
        //{
        //    get
        //    {
        //        if (_regions == null)
        //        {
        //            var collection = SelectAll();
        //            foreach (var item in collection)
        //            {
        //                _regions += ","+item.Id+"|"+item.Name+"|"+item.CityId+"";
        //            }
        //            if (!string.IsNullOrEmpty(_regions))
        //            {
        //                _regions = _regions.Substring(1);
        //            }
        //            else
        //            {
        //                _regions = string.Empty;
        //            }
        //        }
        //        return _regions;
        //    }
        //}

        private static List<Region> _regions;
        private static List<Region> Regions
        {//考虑内存问题，保存为字符串形式可以节省内存.
            get
            {
                if (_regions == null)
                {
                    _regions = SelectAll();
                }
                return _regions;
                //if (_regions == null)
                //{
                //    var collection = SelectAll();
                //    foreach (var item in collection)
                //    {
                //        _regions += "," + item.Id + "|" + item.Name + "|" + item.CityId + "";
                //    }
                //    if (!string.IsNullOrEmpty(_regions))
                //    {
                //        _regions = _regions.Substring(1);
                //    }
                //    else
                //    {
                //        _regions = string.Empty;
                //    }
                //}
                //return _regions;
            }
        }
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
        public short CityId
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
        public City City
        {
            get
            {
               return Framework.Common.City.Cities.FirstOrDefault(city => city.Id == this.CityId);
            }
        }
        public override Region DataSelect(short PrimaryKey)
        {
            return Region.GetRegion(PrimaryKey);
        }

        //public static Region GetRegion(short RegionId)
        public static Region GetRegion(int RegionId)//ajax调用时传的是int
        {
            return Regions.FirstOrDefault(item => item.Id == RegionId);
            
        }

        //public static List<Region> GetRegions(short CityId)
        public static List<Region> GetRegions(int CityId)//ajax调用时传的是int
        {
            return Regions.Where(item => item.CityId == CityId).ToList();//IEnumerable<T>类型不能被系列化.
        }

        private List<Circle> _circles;
        public List<Circle> Circles
        {
            get
            {
                if (_circles == null)
                {
                    _circles=Circle.GetCirclesByRegion(this.Id);
                }
                return _circles;
            }
        }

        protected override DataAccess<Region, short> GetProvider()
        {
            return new RegionDataAccess();
        }
    }
}
