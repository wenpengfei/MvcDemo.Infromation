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
    /// 管理/MBA
    /// </summary>
    [Table(Name = "Info_EduMBA")]
    public class EduMBA:EducationBase<EduMBA>
    {
        /// <summary>
        /// 培训种类.
        /// </summary>
        public byte ObjectType
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
        #region InfoBase 重写成员.
        private static List<ObjectType> _objectTypeCollection;
        public override List<ObjectType> ObjectTypeCollection
        {
            get
            {
                if (_objectTypeCollection == null)
                {
                    var eduCategory = InfoCategory.GetCategory<EduCategory>();
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduMBA.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="MBA培训"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "企业管理"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "项目管理"
                    //    },

                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "财务管理"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "行政管理"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "酒店管理"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "工商管理"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 8,
                    //        Name = "物流管理"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 9,
                    //        Name = "物业管理"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 10,
                    //        Name = "工程管理"
                    //    },
                    //};
                }
                return _objectTypeCollection;
            }
        }

        private static List<InfoTag> _tagCollection;
        /// <summary>
        /// 培训模式.
        /// </summary>
        public override List<InfoTag> TagCollection
        {
            get
            {
                if (_tagCollection == null)
                {
                    var eduCategory = InfoCategory.GetCategory<EduCategory>();
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduMBA.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="基础班",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="强化提高班",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="模考冲刺班",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="MBA面试",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="在职班",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="长期班",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="精品班",
                    //        ObjectTypeId=0
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<EduMBA, int> GetProvider()
        {
            return new EduMBADataAccess();
        }
    }
}
