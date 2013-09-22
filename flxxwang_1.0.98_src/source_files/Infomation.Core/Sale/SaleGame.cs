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
    /// 网游/虚拟物品.
    /// </summary>
    [Table(Name = "Info_SaleGame")]
    public class SaleGame:SaleBase<SaleGame>
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleGame.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="网游点卡"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "装备"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "金币"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "帐号"
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleGame.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="魔兽世界",
                    //        ObjectTypeId=0,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="天龙八部",
                    //        ObjectTypeId=0,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="梦幻西游",
                    //        ObjectTypeId=0,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="完美国际",
                    //        ObjectTypeId=0,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="地下城与勇士",
                    //        ObjectTypeId=0,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="诛仙",
                    //        ObjectTypeId=0,
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="挑战",
                    //        ObjectTypeId=0,
                    //    },
                        
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<SaleGame, int> GetProvider()
        {
            return new SaleGameDataAccess();
        }
    }
}
