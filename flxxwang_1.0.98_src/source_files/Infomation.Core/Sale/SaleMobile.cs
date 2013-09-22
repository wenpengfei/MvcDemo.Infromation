using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 二手手机.
    /// </summary>
    [Table(Name = "Info_SaleMobile")]
    public class SaleMobile:SaleBase<SaleMobile>
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
        /// <summary>
        /// 型号.
        /// </summary>
        public byte? Tag
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

        private string _tagName;
        public string TagName
        {
            get
            {
                if (this.Tag!=null&&_tagName == null)
                {
                    var tag = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag);
                    if (tag != null)
                    {
                        _tagName = tag.Name;
                    }
                }
                return _tagName;
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleMobile.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="诺基亚"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "摩托罗拉"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "索尼爱立信"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "三星"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "HTC/多普达"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "手机配件"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "小灵通"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 8,
                    //        Name = "苹果"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 9,
                    //        Name = "其他手机品牌"
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleMobile.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="N97",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="5230",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="5800XM",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="6700s",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="N95",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="C7",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="E7",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="N8",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="其他",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="XT800",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="XT301",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="Miles",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="ME811",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=14,
                    //        Name="XT702",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=15,
                    //        Name="XT720",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=16,
                    //        Name="ME722",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=17,
                    //        Name="ME600",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=18,
                    //        Name="CLIQ",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=19,
                    //        Name="ME525",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=20,
                    //        Name="其他",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=21,
                    //        Name="X10",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=22,
                    //        Name="T70",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=23,
                    //        Name="U10",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=24,
                    //        Name="U1i",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=25,
                    //        Name="U51",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=26,
                    //        Name="U8i",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=27,
                    //        Name="X8",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=28,
                    //        Name="其他",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=29,
                    //        Name="W899",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=30,
                    //        Name="T959",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=31,
                    //        Name="S5830 Gal",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=32,
                    //        Name="I909",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=33,
                    //        Name="I900",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=34,
                    //        Name="I8000",
                    //        ObjectTypeId=4,
                    //    },

                    //    new InfoTag()
                    //    {
                    //        Id=35,
                    //        Name="I5800",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=36,
                    //        Name="I5700",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=37,
                    //        Name="Galaxy Ta",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=38,
                    //        Name="I900",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=39,
                    //        Name="其他",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=40,
                    //        Name="Aria",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=41,
                    //        Name="Wildfire",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=42,
                    //        Name="Legend",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=43,
                    //        Name="Incredible",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=44,
                    //        Name="HD2",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=45,
                    //        Name="Hero",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=46,
                    //        Name="HD7",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=47,
                    //        Name="Desire",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=48,
                    //        Name="Desire Z",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=51,
                    //        Name="Desire HD",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=52,
                    //        Name="其他",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=53,
                    //        Name="iPhone 4",
                    //        ObjectTypeId=8,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=54,
                    //        Name="iPhone 5",
                    //        ObjectTypeId=8,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=55,
                    //        Name="其他",
                    //        ObjectTypeId=8,
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<SaleMobile, int> GetProvider()
        {
            return new SaleMobileDataAccess();
        }
    }
}
