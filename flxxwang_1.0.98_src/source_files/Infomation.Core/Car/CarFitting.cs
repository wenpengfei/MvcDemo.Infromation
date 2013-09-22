using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using Infomation.Core.Mvc;
using System.Web.Routing;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 汽车配件.
    /// </summary>
    [Table(Name = "Info_CarFitting")]
    public class CarFitting:CarBase<CarFitting>
    {
        /// <summary>
        /// 1:转让,2:求购.
        /// </summary>
        public byte Type
        {
            get;
            set;
        }
        public byte ObjectType
        {
            get;
            set;
        }
        /// <summary>
        /// 成色
        /// </summary>
        public byte Quality
        {
            get;
            set;
        }
        public int Price
        {
            get;
            set;
        }
        public byte? Tag1
        {
            get;
            set;
        }
        public byte? Tag2
        {
            get;
            set;
        }

        public string TypeName
        {
            get
            {
                return this.Type == 0 ? "转让" : "求购";
            }
        }
        private string _qualityName;
        public string QualityName
        {
            get
            {
                if (_qualityName == null)
                {
                    if (this.Quality == 100)
                    {
                        _qualityName = "全新";
                    }
                    else if (this.Quality.ToString().EndsWith("0"))
                    {
                        _qualityName = this.Quality.ToString().Substring(0, 1);
                    }
                    else
                    {
                        _qualityName = this.Quality.ToString();
                    }
                    _qualityName += "成新";
                }
                return _qualityName;
            }
        }

        #region InfoBase 重写成员.
        private static List<ObjectType> _objectTypeCollection;
        public override List<ObjectType> ObjectTypeCollection
        {
            get
            {
                if (_objectTypeCollection == null)
                {
                    var carCategory = InfoCategory.GetCategory<CarCategory>();
                    var category = carCategory.Children.FirstOrDefault(item => item.Singleton == CarFitting.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="发动机配件"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "汽车底盘"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "车身附件"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "电子电器"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "视听设备"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "养护用品"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "汽车用品"
                    //    },
                    //};
                }
                return _objectTypeCollection;
            }
        }

        private static List<InfoTag> _tagCollection;
        public override List<InfoTag> TagCollection
        {
            get
            {
                if (_tagCollection == null)
                {
                    var carCategory = InfoCategory.GetCategory<CarCategory>();
                    var category = carCategory.Children.FirstOrDefault(item => item.Singleton == CarFitting.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="外部用品",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="发动机",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="制动器",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="汽车饰品",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="车灯",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="安全用品",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="行走系统",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="传动轴",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="维护用品",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="脚垫",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="轮胎",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="汽车贴膜",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="发电机",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=14,
                    //        Name="起动机",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=15,
                    //        Name="节油器",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=16,
                    //        Name="散热器",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=17,
                    //        Name="轮毂",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=18,
                    //        Name="轴承",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=19,
                    //        Name="齿轮",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=20,
                    //        Name="GPS导航",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=21,
                    //        Name="蓄电池",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=22,
                    //        Name="倒车雷达",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=23,
                    //        Name="电磁阀",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=24,
                    //        Name="逆变器",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=25,
                    //        Name="逆变电源",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=26,
                    //        Name="后视镜",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=27,
                    //        Name="喇叭",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=28,
                    //        Name="雨刷",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=29,
                    //        Name="氙气灯",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=30,
                    //        Name="座椅",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=31,
                    //        Name="天线",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=32,
                    //        Name="汽车空调",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=33,
                    //        Name="车载MP3",
                    //        ObjectTypeId=5
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=34,
                    //        Name="车载DVD",
                    //        ObjectTypeId=5
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=35,
                    //        Name="汽车音响",
                    //        ObjectTypeId=5
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=36,
                    //        Name="机油",
                    //        ObjectTypeId=6
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=37,
                    //        Name="润滑油",
                    //        ObjectTypeId=6
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=38,
                    //        Name="防冻液",
                    //        ObjectTypeId=6
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=39,
                    //        Name="玻璃水",
                    //        ObjectTypeId=6
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=40,
                    //        Name="汽车坐垫",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=41,
                    //        Name="车位锁",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=42,
                    //        Name="防盗器",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=43,
                    //        Name="刹车片",
                    //        ObjectTypeId=2
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<CarFitting, int> GetProvider()
        {
            return new CarFittingDataAccess();
        }
    }
}
