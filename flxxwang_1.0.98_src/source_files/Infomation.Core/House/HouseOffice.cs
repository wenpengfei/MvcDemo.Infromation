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
    /// 写字楼.
    /// </summary>
    [Table(Name = "Info_HouseOffice")]
    public class HouseOffice:HouseBase<HouseOffice>
    {
        /// <summary>
        /// 1:出租,2:求租,3:出售,4:求购
        /// </summary>
        public byte Type
        {
            get;
            set;
        }
        public string Title
        {
            get;
            set;
        }
        /// <summary>
        /// 楼盘名称.出租和出售时使用该属性.
        /// </summary>
        public string BuildingName
        {
            get;
            set;
        }
        public string District1
        {
            get;
            set;
        }
        public string District2
        {
            get;
            set;
        }
        /// <summary>
        /// 类型：写字楼、商务中心或商住公寓.
        /// </summary>
        public byte ObjectType
        {
            get;
            set;
        }
        /// <summary>
        /// 是否可注册公司.
        /// </summary>
        public bool RegCompany
        {
            get;
            set;
        }
        public int Area
        {
            get;
            set;
        }
        /// <summary>
        /// 求租和求购时使用该属性.
        /// </summary>
        public int? Area2
        {
            get;
            set;
        }
        public float Price
        {
            get;
            set;
        }
        /// <summary>
        /// 求租和求购时使用该属性.
        /// </summary>
        public float? Price2
        {
            get;
            set;
        }
        /////// <summary>
        /////// 价格单位.求租和求租时使用该属性.对于出售或求购不需要设置价格单位(总是以万为单位)
        /////// </summary>
        /// <summary>
        /// 1:元/㎡/天,2:元/月,0:万元.
        /// </summary>
        public byte PriceUnit
        {
            get;
            set;
        }

        public string PriceUnitDisplay
        {
            get
            {
                if (this.PriceUnit == 0)
                {
                    return "万元";
                }
                else if (this.PriceUnit == 1)
                {
                    return "元/㎡/天";
                }
                else if (this.PriceUnit == 2)
                {
                    return "元/月";
                }
                return "";
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
                    var houseCategory = InfoCategory.GetCategory<HouseCategory>();
                    var category = houseCategory.Children.FirstOrDefault(item => item.Singleton == HouseOffice.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="写字楼"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id=2,
                    //        Name="商务中心"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id=3,
                    //        Name="商住公寓"
                    //    },
                    //};
                }
                return _objectTypeCollection;
            }
        }
        #endregion

        protected override DataAccess<HouseOffice, int> GetProvider()
        {
            return new HouseOfficeDataAccess();
        }
    }
}
