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
    /// 文艺/体育.
    /// </summary>
    [Table(Name = "Info_EduSpecial")]
    public class EduSpecial:EducationBase<EduSpecial>
    {
        /// <summary>
        /// 服务项目.
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
        /// 授课方式:一对一/小班/寒暑班
        /// </summary>
        public string TrainWay
        {
            get;
            set;
        }
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
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduSpecial.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="美术培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "dj培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "舞蹈培训"
                    //    },

                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "表演培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "声乐培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "书法培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "其他培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 8,
                    //        Name = "球类培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 9,
                    //        Name = "瑜伽培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 10,
                    //        Name = "棋类培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 11,
                    //        Name = "跆拳道培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 12,
                    //        Name = "武术培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 13,
                    //        Name = "乐器培训"
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
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduSpecial.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="肚皮舞培训",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="拉丁舞培训",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="爵士舞培训",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="钢管舞培训",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="民族舞培训",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="街舞培训",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="少儿舞蹈培训",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="古筝培训",
                    //        ObjectTypeId=13
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="钢琴培训",
                    //        ObjectTypeId=13
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="吉他培训",
                    //        ObjectTypeId=13
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="小提琴培训",
                    //        ObjectTypeId=13
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="二胡培训",
                    //        ObjectTypeId=13
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="萨克斯",
                    //        ObjectTypeId=13
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="电子琴培训",
                    //        ObjectTypeId=13
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=14,
                    //        Name="古琴培训",
                    //        ObjectTypeId=13
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=15,
                    //        Name="琵琶",
                    //        ObjectTypeId=13
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=16,
                    //        Name="笛子",
                    //        ObjectTypeId=13
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=17,
                    //        Name="其它乐器",
                    //        ObjectTypeId=13
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<EduSpecial, int> GetProvider()
        {
            return new EduSpecialDataAccess();
        }
    }
}
