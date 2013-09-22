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
    /// 辅导.
    /// </summary>
    [Table(Name = "Info_EduTutor")]
    public class EduTutor:EducationBase<EduTutor>
    {
        /// <summary>
        /// 1:机构,2个人.
        /// </summary>
        public byte Type
        {
            get;
            set;
        }
        /// <summary>
        /// 科目.
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
        /// 培训方式.
        /// </summary>
        public string TrainWay
        {
            get;
            set;
        }
        /// <summary>
        /// 辅导方式:本人上门/学生上门/网上辅导.个人时使用.
        /// </summary>
        public string TutorWay
        {
            get;
            set;
        }
        /// <summary>
        /// 薪水要求.个人时使用.
        /// </summary>
        public string Salary
        {
            get;
            set;
        }
        /// <summary>
        /// 目前身份.个人时使用.
        /// </summary>
        public string Identity
        {
            get;
            set;
        }
        /// <summary>
        /// 所获证书.个人时使用.
        /// </summary>
        public string Certificate
        {
            get;
            set;
        }
        /// <summary>
        /// 教授课程
        /// </summary>
        public string Course
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
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduTutor.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="小学家教"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "初中家教"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "中考家教"
                    //    },

                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "高中家教"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "高考冲刺"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "素质/特长辅导"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "小升初家教"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 8,
                    //        Name = "奥数"
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
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduTutor.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="初中数学",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="初中语文",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="初中化学",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="初中家教",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="初中物理",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="初中英语",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="全科",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="初中奥数",
                    //        ObjectTypeId=8
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="钢琴辅导",
                    //        ObjectTypeId=6
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="美术家教",
                    //        ObjectTypeId=6
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="小学数学",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="小学奥数",
                    //        ObjectTypeId=8
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="小学语文",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=14,
                    //        Name="小学英语",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=15,
                    //        Name="高中奥数",
                    //        ObjectTypeId=8
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=16,
                    //        Name="高中语文",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=17,
                    //        Name="高中数学",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=18,
                    //        Name="高中英语",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=19,
                    //        Name="高中物理",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=20,
                    //        Name="高中化学",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=21,
                    //        Name="高考语文",
                    //        ObjectTypeId=5
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=22,
                    //        Name="高考数学",
                    //        ObjectTypeId=5
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=23,
                    //        Name="高考英语",
                    //        ObjectTypeId=5
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=24,
                    //        Name="高考物理",
                    //        ObjectTypeId=5
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=25,
                    //        Name="高考化学",
                    //        ObjectTypeId=5
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=26,
                    //        Name="体育辅导",
                    //        ObjectTypeId=6
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=27,
                    //        Name="全科",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=28,
                    //        Name="初中地理",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=29,
                    //        Name="初中政治",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=30,
                    //        Name="初中历史",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=31,
                    //        Name="初中生物",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=32,
                    //        Name="初中全科",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=33,
                    //        Name="高中地理",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=34,
                    //        Name="高中政治",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=35,
                    //        Name="高中历史",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=36,
                    //        Name="高中生物",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=37,
                    //        Name="高中全科",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=38,
                    //        Name="高考地理",
                    //        ObjectTypeId=5
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=39,
                    //        Name="高考政治",
                    //        ObjectTypeId=5
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=40,
                    //        Name="高考历史",
                    //        ObjectTypeId=5
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=41,
                    //        Name="高考生物",
                    //        ObjectTypeId=5
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=42,
                    //        Name="高考全科",
                    //        ObjectTypeId=5
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=43,
                    //        Name="中考语文",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=44,
                    //        Name="中考数学",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=45,
                    //        Name="中考英语",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=46,
                    //        Name="中考物理",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=47,
                    //        Name="中考化学",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=48,
                    //        Name="中考地理",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=49,
                    //        Name="中考政治",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=50,
                    //        Name="中考历史",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=51,
                    //        Name="中考生物",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=52,
                    //        Name="中考全科",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=53,
                    //        Name="英语",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=54,
                    //        Name="数学",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=55,
                    //        Name="语文",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=56,
                    //        Name="全科",
                    //        ObjectTypeId=7
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion

        protected override DataAccess<EduTutor, int> GetProvider()
        {
            return new EduTutorDataAccess();
        }
    }
}
