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
    /// 服装/鞋帽/箱包.
    /// </summary>
    [Table(Name = "Info_SaleClothing")]
    public class SaleClothing:SaleBase<SaleClothing>
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleClothing.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id = 1,
                    //        Name = "服装"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "配饰"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "箱包"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "鞋帽"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleClothing.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="裙子/连衣裙",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="品牌服装",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="童装",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="皮鞋",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="休闲鞋",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="运动鞋",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="帽子",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="男装",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="女装",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="手套",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="围巾",
                    //        ObjectTypeId=4,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="外贸服装",
                    //        ObjectTypeId=1,
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<SaleClothing, int> GetProvider()
        {
            return new SaleClothingDataAccess();
        }
    }
}
