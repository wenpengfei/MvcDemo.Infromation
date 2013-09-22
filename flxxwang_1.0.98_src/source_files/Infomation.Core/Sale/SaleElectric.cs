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
    /// 二手家电.
    /// </summary>
    [Table(Name = "Info_SaleElectric")]
    public class SaleElectric:SaleBase<SaleElectric>
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleElectric.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="电视机"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "洗衣机"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "空调"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "冰箱/冰柜"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "微波炉"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "饮水机"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "其他家电"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 8,
                    //        Name = "家电配件"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 9,
                    //        Name = "电暖气"
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleElectric.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="热水器",
                    //        ObjectTypeId=7,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="电风扇",
                    //        ObjectTypeId=7,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="榨汁机",
                    //        ObjectTypeId=7,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="电磁炉",
                    //        ObjectTypeId=7,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="DVD机",
                    //        ObjectTypeId=7,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="等离子彩电",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="液晶电视机",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="高清电视机",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="全自动洗衣机",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="滚筒洗衣机",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="柜式",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="壁挂式",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="净水器",
                    //        ObjectTypeId=7,
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<SaleElectric, int> GetProvider()
        {
            return new SaleElectricDataAccess();
        }
    }
}
