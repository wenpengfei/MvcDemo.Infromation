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
    /// 圈子,如文一路.
    /// </summary>
    [DataContract]
    [Table(Name = "Fr_Circle")]
    public class Circle : ModelBase<Circle, short>
    {
        //经实际运行，发现如果缓存为字符串形式，虽然节药了内存，但是对字行串拆分时相当慢，因为字符串特别长.
        //private static string _circles;
        //private static string Circles
        //{
        //    get
        //    {
        //        if (_circles == null)
        //        {
        //            var collection = SelectAll();
        //            foreach (var item in collection)
        //            {
        //                _circles += "," + item.Id + "|" + item.Name + "|" + item.RegionId + "";
        //            }
        //            if (!string.IsNullOrEmpty(_circles))
        //            {
        //                _circles = _circles.Substring(1);
        //            }
        //            else
        //            {
        //                _circles = string.Empty;
        //            }
        //        }
        //        return _circles;
        //    }
        //}

        private static List<Circle> _circles;
        public static List<Circle> Circles
        {
            get
            {
                if (_circles == null)
                {
                    _circles = SelectAll();
                }
                return _circles;
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
        public short RegionId
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
        public Region Region
        {
            get
            {
                return Region.GetRegion(this.RegionId);
            }
        }
        public override Circle DataSelect(short PrimaryKey)
        {
            return Circle.GetCircle(PrimaryKey);
        }

        //public static Circle GetCircle(short CircleId)
        public static Circle GetCircle(int CircleId)//ajax转int
        {
            return Circles.FirstOrDefault(item => item.Id == CircleId);
        }
        //public static List<Circle> GetCirclesByRegion(short RegionId)
        public static List<Circle> GetCirclesByRegion(int RegionId)//ajax转int
        {
            return Circles.Where(item => item.RegionId == RegionId).ToList();//IEnumerable<T>类型不能被系列化.
        }
        //public static List<Circle> GetCirclesByCity(short CityId)
        public static List<Circle> GetCirclesByCity(int CityId)//ajax转int
        {
            return Circles.Where(item => item.Region.CityId == CityId).ToList();//IEnumerable<T>类型不能被系列化.
        }

        protected override DataAccess<Circle, short> GetProvider()
        {
            return new CircleDataAccess();
        }
    }
}
