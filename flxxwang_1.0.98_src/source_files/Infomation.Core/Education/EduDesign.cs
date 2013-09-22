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
    /// 设计培训.
    /// </summary>
    [Table(Name = "Info_EduDesign")]
    public class EduDesign:EducationBase<EduDesign>
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
        /// 培训方式
        /// </summary>
        public string TrainWay
        {
            get;
            set;
        }
        /// <summary>
        /// 课程时长
        /// </summary>
        public string Duration
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
        #region InfoBase 重写成员.
        private static List<ObjectType> _objectTypeCollection;
        public override List<ObjectType> ObjectTypeCollection
        {
            get
            {
                if (_objectTypeCollection == null)
                {
                    var eduCategory = InfoCategory.GetCategory<EduCategory>();
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduDesign.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="平面设计"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "网页设计"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "建筑设计"
                    //    },

                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "室内设计"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "服装设计"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "模具设计"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "其它设计"
                    //    },
                    //};
                }
                return _objectTypeCollection;
            }
        }
        #endregion
        protected override DataAccess<EduDesign, int> GetProvider()
        {
            return new EduDesignDataAccess();
        }
    }
}
