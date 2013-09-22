using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    //(Google广告不允许，暂时禁用)
    /// <summary>
    /// 成人用品.
    /// </summary>
    [Table(Name = "Info_SaleSex")]
    public class SaleSex : SaleBase<SaleSex>
    {
        public string Title
        {
            get;
            set;
        }
        public byte ObjectType
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
                    var category = saleCategory.Children.FirstOrDefault(item => item.Singleton == SaleSex.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                }
                return _objectTypeCollection;
            }
        }

        #endregion
        protected override DataAccess<SaleSex, int> GetProvider()
        {
            return new SaleSexDataAccess();
        }
    }
}
