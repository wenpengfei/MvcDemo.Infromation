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
    /// 学历教育.
    /// </summary>
    [Table(Name = "Info_EduEducation")]
    public class EduEducation:EducationBase<EduEducation>
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
        /// 培训方式.
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
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduEducation.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="学历认证"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "二学历"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "在职研究生"
                    //    },

                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "成人教育"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "自考"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "远程教育"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "网络教育"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 8,
                    //        Name = "专升本"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 9,
                    //        Name = "成人高考"
                    //    },
                    //};
                }
                return _objectTypeCollection;
            }
        }
        #endregion
        protected override DataAccess<EduEducation, int> GetProvider()
        {
            return new EduEducationDataAccess();
        }
    }
}
