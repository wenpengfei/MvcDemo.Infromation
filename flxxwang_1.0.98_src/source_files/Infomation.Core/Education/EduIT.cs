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
    /// IT培训.
    /// </summary>
    [Table(Name = "Info_EduIT")]
    public class EduIT:EducationBase<EduIT>
    {
        /// <summary>
        /// 课程类别.
        /// </summary>
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
        /// 培训模式.
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
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduIT.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="软件工程师"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "网络工程师"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "动漫/游戏"
                    //    },

                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "网络营销"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "电脑维修培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "计算机等级考试"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "数据库培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 8,
                    //        Name = "IT认证"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 9,
                    //        Name = "电子商务"
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
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduIT.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="动画培训",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="网络安全",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="软件测试",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="微软认证",
                    //        ObjectTypeId=8
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="思科认证",
                    //        ObjectTypeId=8
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="国际IT认证",
                    //        ObjectTypeId=8
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="华为认证",
                    //        ObjectTypeId=8
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="游戏设计",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="动漫设计",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="影视动画",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="3DMAX",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="maya",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="SQL Sever",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="Oracle",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=14,
                    //        Name="mysql",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=15,
                    //        Name="access数据库",
                    //        ObjectTypeId=7
                    //    },

                    //    new InfoTag()
                    //    {
                    //        Id=16,
                    //        Name="vb 数据库",
                    //        ObjectTypeId=7
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=17,
                    //        Name="网络技术",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=18,
                    //        Name="操作系统",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=19,
                    //        Name="软件开发",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=20,
                    //        Name="UML",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=21,
                    //        Name="c语言",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=22,
                    //        Name="Java",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=23,
                    //        Name="php培训",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=24,
                    //        Name="asp培训",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=25,
                    //        Name="计算机一级",
                    //        ObjectTypeId=6
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=26,
                    //        Name="计算机二级",
                    //        ObjectTypeId=6
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=27,
                    //        Name="计算机三级",
                    //        ObjectTypeId=6
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=28,
                    //        Name="计算机四级",
                    //        ObjectTypeId=6
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=29,
                    //        Name="全国计算机等级考试",
                    //        ObjectTypeId=6
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=30,
                    //        Name="SEM培训",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=31,
                    //        Name="SEO培训",
                    //        ObjectTypeId=4
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<EduIT, int> GetProvider()
        {
            return new EduITDataAccess();
        }
    }
}
