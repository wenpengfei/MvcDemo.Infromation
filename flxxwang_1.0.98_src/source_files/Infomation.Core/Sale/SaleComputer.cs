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
    /// 二手电脑/配件.
    /// </summary>
    [Table(Name = "Info_SaleComputer")]
    public class SaleComputer : SaleBase<SaleComputer>
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleComputer.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id = 1,
                    //        Name = "台式机"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "笔记本"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "服务器"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "硬件"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "外设产品"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleComputer.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="惠普/康柏",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="戴尔",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="富士通",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="东芝",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="华硕",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="宏基",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="三星",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="神舟",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="光驱/刻录",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="音响",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="IBM",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="联想",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="索尼",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=14,
                    //        Name="cpu",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=15,
                    //        Name="主板",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=16,
                    //        Name="显卡",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=17,
                    //        Name="内存条",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=18,
                    //        Name="硬盘",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=19,
                    //        Name="显示器/液晶",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=20,
                    //        Name="网卡/无线网卡",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=21,
                    //        Name="鼠标/键盘",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=22,
                    //        Name="摄像头",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=23,
                    //        Name="掌上电脑",
                    //        ObjectTypeId=6,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=24,
                    //        Name="品牌机",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=25,
                    //        Name="组装机",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=26,
                    //        Name="耳麦",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=27,
                    //        Name="不间断电源",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=28,
                    //        Name="路由器",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=29,
                    //        Name="U盘",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=30,
                    //        Name="闪存卡",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=31,
                    //        Name="移动硬盘",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=32,
                    //        Name="苹果",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=33,
                    //        Name="台式服务器",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=34,
                    //        Name="机架式服务器",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=35,
                    //        Name="机柜式服务器",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=36,
                    //        Name="上网本",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=37,
                    //        Name="平板电脑",
                    //        ObjectTypeId=6,
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion

        protected override DataAccess<SaleComputer, int> GetProvider()
        {
            return new SaleComputerDataAccess();
        }
    }
}
