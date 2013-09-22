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
    /// 短租/日租
    /// </summary>
    [Table(Name = "Info_HouseShort")]
    public class HouseShort:HouseBase<HouseShort>
    {
        /// <summary>
        /// 1：出租,2：求租
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
        //public string HouseType
        //{
        //    get;
        //    set;
        //}
        public byte ObjectType
        {
            get;
            set;
        }
        /// <summary>
        /// 最短租期.
        /// </summary>
        public byte? Lease
        {
            get;
            set;
        }
        public short Price
        {
            get;
            set;
        }
        /// <summary>
        /// 求租时才使用该属性.
        /// </summary>
        public short Price2
        {
            get;
            set;
        }
        /// <summary>
        /// 价格单位,1:元/天,2:元/月
        /// </summary>
        public byte PriceUnit
        {
            get;
            set;
        }

        public string PriceName
        {
            get
            {
                string name = string.Empty;
                if (this.Type == 1)//出租
                {
                    if (this.Price == 0)
                    {
                        return "面议";
                    }
                    if (this.PriceUnit == 1)
                    {
                        return this.Price + "元/天";
                    }
                    if (this.PriceUnit == 2)
                    {
                        return this.Price + "元/月";
                    }
                }
                if (this.Type == 2)
                {
                    if (this.Price == 0 || this.Price2 == 0)
                    {
                        return "面议";
                    }
                    if (this.PriceUnit == 1)
                    {
                        return this.Price +"-"+this.Price2+ "元/天";
                    }
                    if (this.PriceUnit == 2)
                    {
                        return this.Price + "-" + this.Price2 + "元/月";
                    }
                }
                return null;
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
                    var category = houseCategory.Children.FirstOrDefault(item => item.Singleton == HouseShort.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //    {
                    //        new ObjectType()
                    //        {
                    //            Id=1,
                    //            Name="家庭旅馆"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=2,
                    //            Name="高档公寓"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=3,
                    //            Name="商务酒店"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=4,
                    //            Name="宾馆"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=5,
                    //            Name="招待所"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=6,
                    //            Name="其他"
                    //        },
                    //    };
                }
                return _objectTypeCollection;
            }
        }
        #endregion

        protected override DataAccess<HouseShort, int> GetProvider()
        {
            return new HouseShortDataAccess();
        }
    }
}
