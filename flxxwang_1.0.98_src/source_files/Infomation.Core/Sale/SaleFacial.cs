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
    /// 美容/保健.
    /// </summary>
    [Table(Name = "Info_SaleFacial")]
    public class SaleFacial:SaleBase<SaleFacial>
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
                    _objectTypeCollection = new List<ObjectType>()
                    {
                        new ObjectType()
                        {
                            Id=1,
                            Name="美容"
                        },
                        new ObjectType()
                        {
                            Id = 2,
                            Name = "护肤"
                        },
                        new ObjectType()
                        {
                            Id = 3,
                            Name = "美体"
                        },
                        new ObjectType()
                        {
                            Id = 4,
                            Name = "化妆"
                        },
                        new ObjectType()
                        {
                            Id = 5,
                            Name = "保健品"
                        },


                        new ObjectType()
                        {
                            Id = 6,
                            Name = "美发"
                        },
                        new ObjectType()
                        {
                            Id = 7,
                            Name = "美甲"
                        },
                        new ObjectType()
                        {
                            Id = 8,
                            Name = "香水"
                        },
                        new ObjectType()
                        {
                            Id = 9,
                            Name = "其他用品"
                        },
                    };
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
                    _tagCollection = new List<InfoTag>();
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<SaleFacial, int> GetProvider()
        {
            return new SaleFacialDataAccess();
        }
    }
}
