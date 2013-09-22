using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;
using Framework.Extensions;

namespace Infomation.Core
{
    /// <summary>
    /// 文体用品.
    /// </summary>
    [Table(Name = "Info_SaleAthletics")]
    public class SaleAthletics:SaleBase<SaleAthletics>
    {
        public string Title
        {
            get;
            set;
        }
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
        /// <summary>
        /// 成色
        /// </summary>
        public byte Quality
        {
            get;
            set;
        }
        /// <summary>
        /// 是否经纪人.
        /// </summary>
        public bool IsBiz
        {
            get;
            set;
        }

        private string _tagsName;
        public string TagsName
        {
            get
            {
                if (_tagsName == null)
                {
                    _tagsName = string.Empty;
                    var tag1 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag1);
                    if (tag1 != null)
                    {
                        _tagsName += "," + tag1.Name;
                    }
                    var tag2 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag2);
                    if (tag2 != null)
                    {
                        _tagsName += "," + tag2.Name;
                    }

                    if (!string.IsNullOrWhiteSpace(_tagsName))
                    {
                        _tagsName = _tagsName.Substring(1);
                    }
                }
                return _tagsName;
            }
        }
        private string _qualityName;
        public string QualityName
        {
            get
            {
                if (_qualityName == null)
                {
                    _qualityName = ToQualityName(this.Quality);
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
                    var saleCategory = InfoCategory.GetCategory<SaleCategory>();
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleAthletics.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id = 1,
                    //        Name = "户外用品"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "健身器材"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "文教用品"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "球类用品"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "乐器"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "游泳用品"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "瑜伽用品"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 8,
                    //        Name = "钓鱼用具"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 9,
                    //        Name = "各类棋牌"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 10,
                    //        Name = "其他"
                    //    }
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
                    var saleCategory = InfoCategory.GetCategory<SaleCategory>();
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleAthletics.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="钢琴",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="吉他",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="古筝",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="电子琴",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="游泳用品",
                    //        ObjectTypeId=6,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="足球用品",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="篮球用品",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="羽毛球用品",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="乒乓球用品",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="溜冰/滑板",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="台球用品",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="手风琴",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="二胡",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=14,
                    //        Name="乐器配件",
                    //        ObjectTypeId=5,
                    //    },


                    //    new InfoTag()
                    //    {
                    //        Id=15,
                    //        Name="学生文具",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=16,
                    //        Name="教学用具",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=17,
                    //        Name="提琴",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=18,
                    //        Name="踏步机",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=19,
                    //        Name="跑步机",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=20,
                    //        Name="按摩椅",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=21,
                    //        Name="健身车",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=22,
                    //        Name="健腹器",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=23,
                    //        Name="活力板",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=24,
                    //        Name="哑铃",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=25,
                    //        Name="麻将",
                    //        ObjectTypeId=9,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=26,
                    //        Name="长笛",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=27,
                    //        Name="单簧管",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=28,
                    //        Name="萨克斯",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=29,
                    //        Name="台球桌",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=30,
                    //        Name="网球用品",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=31,
                    //        Name="高尔夫球用品",
                    //        ObjectTypeId=4,
                    //    },
                        
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<SaleAthletics, int> GetProvider()
        {
            return new SaleAthleticsDataAccess();
        }
    }
}
