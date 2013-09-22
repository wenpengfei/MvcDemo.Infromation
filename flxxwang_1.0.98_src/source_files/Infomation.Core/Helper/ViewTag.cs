using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Common;
using Framework.WebControls.Mvc;

namespace Infomation.Core.Mvc
{
    public class ViewTag
    {
        //public IInfo Singleton;
        public IInfo Interface;
        public IInfo Info;//详细页显示该对象.

        public short? CityId;
        public short? RegionId;
        public short? CircleId;
        public bool? IsBiz;
        public byte? ObjectTypeId;
        public byte? TagId;
        public int? PriceRange;
        public int? MinPrice;
        public int? MaxPrice;
        public string KeyWord;
        public bool? IsPic;
        public int? PageIndex;
        public double? Days = null;

        //public JobType? JobType;//求职、招聘使用

        //public YellowPageBigType? YellowPageBigType;//黄页使用
        //public YellowPageType? YellowPageType;//黄页使用

        public PagedList<IInfo> PagedList;
        public PagedList<IInfo> PagedListBiz;
        public PagedList<IInfo> PagedListPersonal;

        public IEnumerable<IInfo> RecentOthers;//详细页显示最近发布的其他信息.

        private City _city;
        public City City
        {
            get
            {
                if (_city == null && this.CityId != null)
                {
                    _city = City.GetCity(this.CityId.Value);
                }
                return _city;
            }
        }

        private IEnumerable<Region> _regions;
        public IEnumerable<Region> Regions
        {
            get
            {
                if (this.City != null)
                {
                    _regions = Region.GetRegions(this.City.Id);
                }
                else
                {
                    _regions = new List<Region>();
                }
                return _regions;
            }
        }

        private Region _region;
        public Region Region
        {
            get
            {
                if (_region == null && this.RegionId != null)
                {
                    _region = Region.GetRegion(this.RegionId.Value);
                }
                return _region;
            }
        }

        private Circle _circle;
        public Circle Circle
        {
            get
            {
                if (_circle == null && this.CircleId != null)
                {
                    _circle = Circle.GetCircle(this.CircleId.Value);
                }
                return _circle;
            }
        }

        private IEnumerable<Circle> _circles;
        public IEnumerable<Circle> Circles
        {
            get
            {
                if(_circles==null)
                {
                    _circles = Circle.GetCirclesByCity(this.CityId.Value);
                }
                return _circles;
            }
            
        }

        private ObjectType _objectType;
        public ObjectType ObjectType
        {
            get
            {
                if (_objectType == null && this.ObjectTypeId != null)
                {
                    _objectType = Interface.ObjectTypeCollection.FirstOrDefault(item => item.Id == this.ObjectTypeId);
                }
                return _objectType;
            }
        }

        private InfoTag _tag;
        /// <summary>
        /// 标签
        /// </summary>
        public InfoTag Tag
        {
            get
            {
                if (_tag == null && this.TagId != null)
                {
                    _tag = Interface.TagCollection.FirstOrDefault(item => item.Id == this.TagId);
                }
                return _tag;
            }
        }

        private DateTime? _startTime;
        public DateTime? StartTime
        {
            get
            {
                if (Days != null)
                {
                    _startTime = DateTime.Now.AddDays(0 - Days.Value);

                }
                return _startTime;
            }
        }

        private DateTime? _endTime;
        public DateTime? EndTime
        {
            get
            {
                if (Days != null)
                {
                    _endTime = DateTime.Now;
                }
                return _endTime;
            }
        }

        private string _postLinkText;
        public string PostLinkText
        {
            get
            {
                if (_postLinkText == null)
                {
                    _postLinkText = Interface.ListLink.LinkText;
                    if (this.ObjectType != null)
                    {
                        _postLinkText = ObjectType.Name;
                    }
                }
                return _postLinkText;
            }
        }

        public SEO SEO
        {
            get;
            set;
        }
    }
}
