using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using Infomation.Core.Mvc;
using System.Web.Routing;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 代驾/陪练/驾校.
    /// </summary>
    [Table(Name = "Info_CarAccompany")]
    public class CarAccompany:CarBase<CarAccompany>
    {
        
        public byte ObjectType
        {
            get;
            set;
        }
        public int Price
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
                    var carCategory = InfoCategory.GetCategory<CarCategory>();
                    var category = carCategory.Children.FirstOrDefault(item => item.Singleton == CarAccompany.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="代驾"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "陪练"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "驾校"
                    //    },
                    //};
                }
                return _objectTypeCollection;
            }
        }
        #endregion

        protected override DataAccess<CarAccompany, int> GetProvider()
        {
            return new CarAccompanyDataAccess();
        }
    }
}
