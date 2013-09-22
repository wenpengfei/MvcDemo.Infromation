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
    /// 艺术品/收藏品.
    /// </summary>
    [Table(Name = "Info_SaleArt")]
    public class SaleArt:SaleBase<SaleArt>
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

        #region InfoBase 重写成员.
        private static List<ObjectType> _objectTypeCollection;
        public override List<ObjectType> ObjectTypeCollection
        {
            get
            {
                if (_objectTypeCollection == null)
                {
                    var saleCategory = InfoCategory.GetCategory<SaleCategory>();
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleArt.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id = 1,
                    //        Name = "古董古玩"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "书法绘画"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "珠宝玉器"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "纪念品"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "工艺品"
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleArt.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="十字绣",
                    //        ObjectTypeId=5,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="珠宝首饰",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="玉器",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="贵金属首饰",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="书法",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="山水画",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="人物画",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="花鸟画",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="装饰画",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="奥运纪念品",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="世博会纪念品",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="邮票邮品",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="钱币",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=14,
                    //        Name="雕品",
                    //        ObjectTypeId=5,
                    //    },
                    //};

                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<SaleArt, int> GetProvider()
        {
            return new SaleArtDataAccess();
        }
    }
}
