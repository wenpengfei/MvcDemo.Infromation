using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Runtime.Serialization;
using System.Data.Linq.Mapping;
using Framework.Extensions;

namespace Infomation.Core
{
    /// <summary>
    /// 二手汽车转让.
    /// </summary>
    [Table(Name = "Info_CarSecondHand")]
    public class CarSecondHand:CarBase<CarSecondHand>
    {
        /// <summary>
        /// 品牌
        /// </summary>
        public byte? BrandId
        {
            get;
            set;
        }
        /// <summary>
        /// 车系
        /// </summary>
        public byte? SeriesId
        {
            get;
            set;
        }
        /// <summary>
        /// 车型
        /// </summary>
        public byte? ModelId
        {
            get;
            set;
        }
        /// <summary>
        /// 车牌/车系/车型.(当没有供用户选择的品牌时，供用户手动填写)
        /// </summary>
        public string BrandDescription
        {
            get;
            set;
        }
        /// <summary>
        /// 车辆类型.
        /// </summary>
        public byte ObjectType
        {
            get;
            set;
        }
        /// <summary>
        /// 排量.
        /// </summary>
        public float Exhaust
        {
            get;
            set;
        }
        /// <summary>
        /// 变速器.
        /// </summary>
        public string Transmission
        {
            get;
            set;
        }
        public string Color
        {
            get;
            set;
        }
        /// <summary>
        /// 上牌时间.
        /// </summary>
        public short BuyTime
        {
            get;
            set;
        }
        /// <summary>
        /// 行驶里程.
        /// </summary>
        public float Rundistance
        {
            get;
            set;
        }
        public float Price
        {
            get;
            set;
        }
        /// <summary>
        /// 是否带牌销售.
        /// </summary>
        public bool SaleCarNum
        {
            get;
            set;
        }

        private string _brandName;
        public string BrandName
        {
            get
            {
                if (_brandName == null)
                {
                    if (!string.IsNullOrWhiteSpace(this.BrandDescription))
                    {
                        _brandName = this.BrandDescription;
                    }
                    else
                    {
                        var brand = CarSecondHand.BrandCollection.FirstOrDefault(item => item.Id == this.BrandId);
                        if (brand != null)
                        {
                            _brandName = brand.Name;
                        }
                    }
                    if (_brandName == null)
                    {
                        _brandName = string.Empty;
                    }
                }
                return _brandName;
            }
        }

        private static List<Brand> _brandCollection;
        public static List<Brand> BrandCollection
        {
            get
            {
                if (_brandCollection == null)
                {
                    _brandCollection = new List<Brand>()
                    {
                        new Brand()
                        {
                            Id=1,
                            Name="阿斯顿·马丁"
                        },
                        new Brand()
                        {
                            Id=2,
                            Name="奥迪"
                        },
                        new Brand()
                        {
                            Id=3,
                            Name="宝马"
                        },
                        new Brand()
                        {
                            Id=4,
                            Name="奔腾"
                        },
                        new Brand()
                        {
                            Id=5,
                            Name="保时捷"
                        },
                        new Brand()
                        {
                            Id=6,
                            Name="奔驰"
                        },
                        new Brand()
                        {
                            Id=7,
                            Name="标致"
                        },
                        new Brand()
                        {
                            Id=8,
                            Name="本田"
                        },
                        new Brand()
                        {
                            Id=9,
                            Name="比亚迪"
                        },
                        new Brand()
                        {
                            Id=10,
                            Name="别克"
                        },
                        new Brand()
                        {
                            Id=11,
                            Name="宾利"
                        },
                        new Brand()
                        {
                            Id=12,
                            Name="布嘉迪"
                        },
                        new Brand()
                        {
                            Id=13,
                            Name="长安"
                        },
                        new Brand()
                        {
                            Id=14,
                            Name="长城"
                        },
                        new Brand()
                        {
                            Id=15,
                            Name="昌河"
                        },
                        new Brand()
                        {
                            Id=16,
                            Name="长丰"
                        },
                        new Brand()
                        {
                            Id=17,
                            Name="川汽野马"
                        },
                        new Brand()
                        {
                            Id=18,
                            Name="大众"
                        },
                        new Brand()
                        {
                            Id=19,
                            Name="道奇"
                        },
                        new Brand()
                        {
                            Id=20,
                            Name="东风"
                        },
                        new Brand()
                        {
                            Id=21,
                            Name="东风风神"
                        },
                        new Brand()
                        {
                            Id=22,
                            Name="东南"
                        },
                        new Brand()
                        {
                            Id=23,
                            Name="帝豪"
                        },
                        new Brand()
                        {
                            Id=24,
                            Name="飞碟"
                        },
                        new Brand()
                        {
                            Id=25,
                            Name="法拉利"
                        },
                        new Brand()
                        {
                            Id=26,
                            Name="丰田"
                        },
                        new Brand()
                        {
                            Id=27,
                            Name="菲亚特"
                        },
                        new Brand()
                        {
                            Id=28,
                            Name="福田"
                        },
                        new Brand()
                        {
                            Id=29,
                            Name="福特"
                        },
                        new Brand()
                        {
                            Id=30,
                            Name="GMC"
                        },
                        new Brand()
                        {
                            Id=31,
                            Name="悍马"
                        },
                        new Brand()
                        {
                            Id=32,
                            Name="红旗"
                        },
                        new Brand()
                        {
                            Id=33,
                            Name="华普"
                        },
                        new Brand()
                        {
                            Id=34,
                            Name="华泰"
                        },
                        new Brand()
                        {
                            Id=35,
                            Name="哈飞"
                        },
                        new Brand()
                        {
                            Id=36,
                            Name="海马"
                        },
                        new Brand()
                        {
                            Id=37,
                            Name="黄海"
                        },
                        new Brand()
                        {
                            Id=38,
                            Name="吉奥"
                        },
                        new Brand()
                        {
                            Id=39,
                            Name="吉普Jeep"
                        },
                        new Brand()
                        {
                            Id=40,
                            Name="江淮"
                        },
                        new Brand()
                        {
                            Id=41,
                            Name="精灵smart"
                        },
                        new Brand()
                        {
                            Id=42,
                            Name="捷豹"
                        },
                        new Brand()
                        {
                            Id=43,
                            Name="金杯"
                        },
                        new Brand()
                        {
                            Id=44,
                            Name="吉利"
                        },
                        new Brand()
                        {
                            Id=45,
                            Name="柯尼赛格"
                        },
                        new Brand()
                        {
                            Id=46,
                            Name="开瑞"
                        },
                        new Brand()
                        {
                            Id=47,
                            Name="克莱斯勒"
                        },
                        new Brand()
                        {
                            Id=48,
                            Name="凯迪拉克"
                        },
                        new Brand()
                        {
                            Id=49,
                            Name="兰博基尼"
                        },
                        new Brand()
                        {
                            Id=50,
                            Name="劳斯莱斯"
                        },
                        new Brand()
                        {
                            Id=51,
                            Name="雷诺"
                        },
                        new Brand()
                        {
                            Id=52,
                            Name="力帆"
                        },
                        new Brand()
                        {
                            Id=53,
                            Name="莲花"
                        },
                        new Brand()
                        {
                            Id=54,
                            Name="雷克萨斯"
                        },
                        new Brand()
                        {
                            Id=55,
                            Name="莲花汽车"
                        },
                        new Brand()
                        {
                            Id=56,
                            Name="铃木"
                        },
                        new Brand()
                        {
                            Id=57,
                            Name="陆风"
                        },
                        new Brand()
                        {
                            Id=58,
                            Name="路虎"
                        },
                        new Brand()
                        {
                            Id=59,
                            Name="MG"
                        },
                        new Brand()
                        {
                            Id=60,
                            Name="迈巴赫"
                        },
                        new Brand()
                        {
                            Id=61,
                            Name="玛莎拉蒂"
                        },
                        new Brand()
                        {
                            Id=62,
                            Name="马自达"
                        },
                        new Brand()
                        {
                            Id=63,
                            Name="迷你MINI"
                        },
                        new Brand()
                        {
                            Id=64,
                            Name="讴歌"
                        },
                        new Brand()
                        {
                            Id=65,
                            Name="欧宝"
                        },
                        new Brand()
                        {
                            Id=66,
                            Name="奇瑞"
                        },
                        new Brand()
                        {
                            Id=67,
                            Name="起亚"
                        },
                        new Brand()
                        {
                            Id=68,
                            Name="全球鹰"
                        },
                        new Brand()
                        {
                            Id=69,
                            Name="日产"
                        },
                        new Brand()
                        {
                            Id=70,
                            Name="荣威"
                        },
                        new Brand()
                        {
                            Id=71,
                            Name="瑞麒"
                        },
                        new Brand()
                        {
                            Id=72,
                            Name="萨博"
                        },
                        new Brand()
                        {
                            Id=73,
                            Name="三菱"
                        },
                        new Brand()
                        {
                            Id=74,
                            Name="双龙"
                        },
                        new Brand()
                        {
                            Id=75,
                            Name="世爵"
                        },
                        new Brand()
                        {
                            Id=76,
                            Name="上海英伦"
                        },
                        new Brand()
                        {
                            Id=77,
                            Name="斯巴鲁"
                        },
                        new Brand()
                        {
                            Id=78,
                            Name="斯柯达"
                        },
                        new Brand()
                        {
                            Id=79,
                            Name="双环"
                        },
                        new Brand()
                        {
                            Id=80,
                            Name="威兹曼"
                        },
                        new Brand()
                        {
                            Id=1,
                            Name="威麟"
                        },
                        new Brand()
                        {
                            Id=81,
                            Name="沃尔沃"
                        },
                        new Brand()
                        {
                            Id=82,
                            Name="夏利"
                        },
                        new Brand()
                        {
                            Id=83,
                            Name="现代"
                        },
                        new Brand()
                        {
                            Id=84,
                            Name="雪铁龙"
                        },
                        new Brand()
                        {
                            Id=85,
                            Name="雪佛兰"
                        },
                        new Brand()
                        {
                            Id=86,
                            Name="一汽"
                        },
                        new Brand()
                        {
                            Id=87,
                            Name="英菲尼迪"
                        },
                        new Brand()
                        {
                            Id=88,
                            Name="中华"
                        },
                        new Brand()
                        {
                            Id=89,
                            Name="中兴"
                        },
                        new Brand()
                        {
                            Id=90,
                            Name="众泰"
                        },
                    };
                }
                return _brandCollection;
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
                    var category = carCategory.Children.FirstOrDefault(item => item.Singleton == CarSecondHand.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="轿车/跑车"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id=2,
                    //        Name="越野车/SUV"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "面包车/MPV"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "客车/货车"
                    //    },
                    //};
                }
                return _objectTypeCollection;
            }
        }
        #endregion

        protected override DataAccess<CarSecondHand, int> GetProvider()
        {
            return new CarSecondHandDataAccess();
        }
    }
}
