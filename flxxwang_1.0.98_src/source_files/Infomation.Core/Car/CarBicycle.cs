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
    /// 自行车/电动车.
    /// </summary>
    [Table(Name = "Info_CarBicycle")]
    public class CarBicycle:CarBase<CarBicycle>
    {
        /// <summary>
        /// 1:转让,2:求购
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
        public byte Tag1
        {
            get;
            set;
        }
        /// <summary>
        /// 品牌
        /// </summary>
        public byte? BrandId
        {
            get;
            set;
        }
        /// <summary>
        /// 手动填写品牌.
        /// </summary>
        public string BrandHandWrite
        {
            get;
            set;
        }
        /// <summary>
        /// 车架尺寸.
        /// </summary>
        public string Size
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
                    if (this.ObjectType == 1)//自行车
                    {
                        var brand = this.BrandZiXingCheCollection.FirstOrDefault(item => item.Id == this.BrandId);
                        if (brand != null)
                        {
                            _brandName = brand.Name;
                        }
                    }
                    else if (this.ObjectType == 2)//电动车
                    {
                        var brand = this.BrandDianDongCollection.FirstOrDefault(item => item.Id == this.BrandId);
                        if (brand != null)
                        {
                            _brandName = brand.Name;
                        }
                    }
                    else
                    {
                        _brandName = BrandHandWrite;
                    }
                }
                return _brandName;
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
                    var category = carCategory.Children.FirstOrDefault(item => item.Singleton == CarBicycle.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="自行车"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "电动车"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "三轮车"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "配件/装备"
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
                    var category = carCategory.Children.FirstOrDefault(item => item.Singleton == CarBicycle.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="公路自行车",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="场地自行车",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="山地自行车",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="自行车赛车",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="折叠自行车",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="自行车配件",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="电动车电池",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="电动车配件",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="迷你自行车",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="普通自行车",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="电动自行车",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="电动摩托车",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="折叠电动车",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=14,
                    //        Name="迷你电动车",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=15,
                    //        Name="助动车",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=16,
                    //        Name="电动观光车",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=17,
                    //        Name="脚踏三轮车",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=18,
                    //        Name="电动三轮车",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=19,
                    //        Name="助力三轮车",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=20,
                    //        Name="助动车配件",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=21,
                    //        Name="修车工具",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=22,
                    //        Name="骑行装备",
                    //        ObjectTypeId=4
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }

        private static List<Brand> _brandZiXingCheCollection;
        /// <summary>
        /// 自行车品牌
        /// </summary>
        public List<Brand> BrandZiXingCheCollection
        {
            get
            {
                if (_brandZiXingCheCollection == null)
                {
                    _brandZiXingCheCollection = new List<Brand>()
                    {
                        new Brand()
                        {
                            Id=1,
                            Name="捷安特"
                        },
                        new Brand()
                        {
                            Id=2,
                            Name="美利达"
                        },
                        new Brand()
                        {
                            Id=3,
                            Name="永久"
                        },
                        new Brand()
                        {
                            Id=4,
                            Name="凤凰"
                        },
                        new Brand()
                        {
                            Id=5,
                            Name="阿米尼"
                        },
                        new Brand()
                        {
                            Id=6,
                            Name="宝马"
                        },
                        new Brand()
                        {
                            Id=7,
                            Name="邦德"
                        },
                        new Brand()
                        {
                            Id=8,
                            Name="TREA崔克"
                        },
                        new Brand()
                        {
                            Id=9,
                            Name="飞鸽"
                        },
                        new Brand()
                        {
                            Id=10,
                            Name="捷马"
                        },
                        new Brand()
                        {
                            Id=11,
                            Name="迪卡侬"
                        },
                        new Brand()
                        {
                            Id=12,
                            Name="喜德盛"
                        },
                        new Brand()
                        {
                            Id=13,
                            Name="大行"
                        },
                        new Brand()
                        {
                            Id=14,
                            Name="跑狼"
                        },
                        new Brand()
                        {
                            Id=15,
                            Name="悍马"
                        },
                        new Brand()
                        {
                            Id=16,
                            Name="其它"
                        }

                    };
                }
                return _brandZiXingCheCollection;
            }
        }

        private static List<Brand> _brandDianDongCollection;
        /// <summary>
        /// 电动车品牌
        /// </summary>
        public List<Brand> BrandDianDongCollection
        {
            get
            {
                if (_brandDianDongCollection == null)
                {
                    _brandDianDongCollection = new List<Brand>()
                    {
                        new Brand()
                        {
                            Id=1,
                            Name="绿源"
                        },
                        new Brand()
                        {
                            Id=2,
                            Name="新日"
                        },
                        new Brand()
                        {
                            Id=3,
                            Name="捷安特"
                        },
                        new Brand()
                        {
                            Id=4,
                            Name="雅迪"
                        },
                        new Brand()
                        {
                            Id=5,
                            Name="阿米尼"
                        },
                        new Brand()
                        {
                            Id=6,
                            Name="洪都"
                        },
                        new Brand()
                        {
                            Id=7,
                            Name="雅马哈"
                        },
                        new Brand()
                        {
                            Id=8,
                            Name="邦德"
                        },
                        new Brand()
                        {
                            Id=9,
                            Name="永久"
                        },
                        new Brand()
                        {
                            Id=10,
                            Name="轻骑"
                        },
                        new Brand()
                        {
                            Id=11,
                            Name="大龟王"
                        },
                        new Brand()
                        {
                            Id=12,
                            Name="小帅哥"
                        },
                        new Brand()
                        {
                            Id=13,
                            Name="比德文"
                        },
                        new Brand()
                        {
                            Id=14,
                            Name="富士达"
                        },
                        new Brand()
                        {
                            Id=15,
                            Name="小鸟"
                        },
                        new Brand()
                        {
                            Id=16,
                            Name="爱玛"
                        },
                        new Brand()
                        {
                            Id=17,
                            Name="其它"
                        }
                    };
                }
                return _brandDianDongCollection;
            }
        }
        #endregion
        protected override DataAccess<CarBicycle, int> GetProvider()
        {
            return new CarBicycleDataAccess();
        }
    }
}
