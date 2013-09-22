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
    /// 婴幼儿教育.
    /// </summary>
    [Table(Name = "Info_EduBaby")]
    public class EduBaby : EducationBase<EduBaby>
    {
        /// <summary>
        /// 教育类别.
        /// </summary>
        public byte ObjectType
        {
            get;
            set;
        }
        /// <summary>
        /// 服务类型.
        /// </summary>
        public byte? Tag1
        {
            get;
            set;
        }
        /// <summary>
        /// 服务类型.
        /// </summary>
        public byte? Tag2
        {
            get;
            set;
        }

        /// <summary>
        /// 入托条件.
        /// </summary>
        public string Condition
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
        /// 办学性质,1:公立,2:私立.
        /// </summary>
        public byte? Kind
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
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduBaby.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="学前教育"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "亲子教育"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "幼儿园"
                    //    },

                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "胎教"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "智力开发"
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
                    var category = eduCategory.Children.FirstOrDefault(item => item.Singleton == EduBaby.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<EduBaby, int> GetProvider()
        {
            return new EduBabyDataAccess();
        }
    }
}
