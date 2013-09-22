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
    /// 二手家具/家居.
    /// </summary>
    [Table(Name = "Info_SaleHome")]
    public class SaleHome:SaleBase<SaleHome>
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleHome.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="床/床垫"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "柜子"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "桌子"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "椅子/沙发"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "居家用品/家纺"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "其他家具/家居"
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleHome.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="双人床",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="单人床",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="双层床",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="童床",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="折叠床",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="床垫",
                    //        ObjectTypeId=1,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="衣柜",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="床头柜",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="书柜",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="电视柜",
                    //        ObjectTypeId=2,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="餐桌",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="写字桌",
                    //        ObjectTypeId=3,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="折叠桌",
                    //        ObjectTypeId=3,
                    //    },
                       
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<SaleHome, int> GetProvider()
        {
            return new SaleHomeDataAccess();
        }
    }
}
