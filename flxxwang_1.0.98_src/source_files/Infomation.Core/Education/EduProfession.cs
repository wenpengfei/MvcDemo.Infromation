using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 职业技能培训.
    /// </summary>
    [Table(Name = "Info_EduProfession")]
    public class EduProfession:EducationBase<EduProfession>
    {
        /// <summary>
        /// 服务项目.
        /// </summary>
        public byte ObjectType
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
        /// <summary>
        /// 课程时长.
        /// </summary>
        public string Duration
        {
            get;
            set;
        }
        /// <summary>
        /// 培训方式.
        /// </summary>
        public string TrainWay
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
        #region InfoBase 重写成员.
        private static List<ObjectType> _objectTypeCollection;
        public override List<ObjectType> ObjectTypeCollection
        {
            get
            {
                if (_objectTypeCollection == null)
                {
                    var eduCategory = InfoCategory.GetCategory<EduCategory>();
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduProfession.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="会计培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "报关员培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "教师培训"
                    //    },

                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "资格认证"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "营养师培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "心理咨询师培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "导游培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 8,
                    //        Name = "汽车维修培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 9,
                    //        Name = "策划师培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 10,
                    //        Name = "其它培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 11,
                    //        Name = "厨师培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 12,
                    //        Name = "美容美发"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 13,
                    //        Name = "技能培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 14,
                    //        Name = "公务员培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 15,
                    //        Name = "摄影培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 16,
                    //        Name = "人力资源师"
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
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduProfession.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="注册会计师",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="会计电算化",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="初级会计师",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="中级会计师",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="助理会计师",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="高级会计师",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="电工培训",
                    //        ObjectTypeId=13
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="调酒师培训",
                    //        ObjectTypeId=13
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="插花培训",
                    //        ObjectTypeId=13
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="美甲培训",
                    //        ObjectTypeId=12
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="美发培训",
                    //        ObjectTypeId=12
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="美容培训",
                    //        ObjectTypeId=12
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<EduProfession, int> GetProvider()
        {
            return new EduProfessionDataAccess();
        }
    }
}
