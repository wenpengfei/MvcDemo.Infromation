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
    /// 手机号码.
    /// </summary>
    [Table(Name = "Info_SaleMobileNumber")]
    public class SaleMobileNumber:SaleBase<SaleMobileNumber>
    {
        public string Title
        {
            get
            {
                var t = this.Number;
                var objType = this.ObjectTypeCollection.FirstOrDefault(item => item.Id == this.ObjectType);
                if (objType != null)
                {
                    t +="，"+ objType.Name;
                }
                if (this.Is3G)
                {
                    t += "，3G";
                }
                return t;
            }
        }
        public byte ObjectType
        {
            get;
            set;
        }
        /// <summary>
        /// 手机号.
        /// </summary>
        public string Number
        {
            get;
            set;
        }
        public bool Is3G
        {
            get;
            set;
        }
        /// <summary>
        /// 号码特征.
        /// </summary>
        public string Character
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
        #region InfoBase 重写成员.
        private static List<ObjectType> _objectTypeCollection;
        public override List<ObjectType> ObjectTypeCollection
        {
            get
            {
                if (_objectTypeCollection == null)
                {
                    var saleCategory = InfoCategory.GetCategory<SaleCategory>();
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleMobileNumber.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="全球通"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "动感地带"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "神州行"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "联通"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "电信"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "铁通"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "小灵通"
                    //    },
                    //};
                }
                return _objectTypeCollection;
            }
        }
        #endregion
        protected override DataAccess<SaleMobileNumber, int> GetProvider()
        {
            return new SaleMobileNumberDataAccess();
        }
    }
}
