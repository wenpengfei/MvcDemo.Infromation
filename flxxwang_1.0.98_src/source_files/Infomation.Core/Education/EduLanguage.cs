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
    /// 外语培训.
    /// </summary>
    [Table(Name = "Info_EduLanguage")]
    public class EduLanguage : EducationBase<EduLanguage>
    {
        /// <summary>
        /// 语种.
        /// </summary>
        public byte ObjectType
        {
            get;
            set;
        }

        #region Tag
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
        public byte? Tag3
        {
            get;
            set;
        }
        public byte? Tag4
        {
            get;
            set;
        }
        public byte? Tag5
        {
            get;
            set;
        }
        public byte? Tag6
        {
            get;
            set;
        }
        public byte? Tag7
        {
            get;
            set;
        }
        public byte? Tag8
        {
            get;
            set;
        }
        public byte? Tag9
        {
            get;
            set;
        }
        public byte? Tag10
        {
            get;
            set;
        }
        public byte? Tag11
        {
            get;
            set;
        }
        public byte? Tag12
        {
            get;
            set;
        }
        #endregion

        /// <summary>
        /// 营业时间.
        /// </summary>
        public string BusTime
        {
            get;
            set;
        }
        public string Address
        {
            get;
            set;
        }
        /// <summary>
        /// 公交.
        /// </summary>
        public string Bus
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
                    var tag3 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag3);
                    if (tag3 != null)
                    {
                        _tagsName += "," + tag3.Name;
                    }
                    var tag4 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag4);
                    if (tag4 != null)
                    {
                        _tagsName += "," + tag4.Name;
                    }
                    var tag5 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag5);
                    if (tag5 != null)
                    {
                        _tagsName += "," + tag5.Name;
                    }
                    var tag6 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag6);
                    if (tag6 != null)
                    {
                        _tagsName += "," + tag6.Name;
                    }
                    var tag7 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag7);
                    if (tag7 != null)
                    {
                        _tagsName += "," + tag7.Name;
                    }
                    var tag8 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag8);
                    if (tag8 != null)
                    {
                        _tagsName += "," + tag8.Name;
                    }
                    var tag9 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag9);
                    if (tag9 != null)
                    {
                        _tagsName += "," + tag9.Name;
                    }
                    var tag10 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag10);
                    if (tag10 != null)
                    {
                        _tagsName += "," + tag10.Name;
                    }
                    var tag11 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag11);
                    if (tag11 != null)
                    {
                        _tagsName += "," + tag11.Name;
                    }
                    var tag12 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag12);
                    if (tag12 != null)
                    {
                        _tagsName += "," + tag12.Name;
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
                    var eduCategory = InfoCategory.GetCategory<EduCategory>();
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduLanguage.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="英语培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "英语口语"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "英语听力"
                    //    },

                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "日语"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "韩语"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "法语"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "德语"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 8,
                    //        Name = "俄语"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 9,
                    //        Name = "西班牙语"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 10,
                    //        Name = "意大利语"
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
                    var eduCategory = InfoCategory.GetCategory<EduCategory>();
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduLanguage.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="SAT培训",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="GMAT培训",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="雅思口语",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="商务英语口语",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="少儿英语口语",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="疯狂英语口语",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="托福口语",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="外贸英语口语",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="英语翻译",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="新概念英语",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="雅思培训",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="托福培训",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="少儿英语",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="商务英语",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=14,
                    //        Name="英语自考",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=15,
                    //        Name="四六级",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=16,
                    //        Name="GRE／GMAT",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=17,
                    //        Name="SAT／LSAT",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=18,
                    //        Name="BETS",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=19,
                    //        Name="考研英语",
                    //        ObjectTypeId=1
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<EduLanguage, int> GetProvider()
        {
            return new EduLanguageDataAccess();
        }
    }
}
