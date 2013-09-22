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
    /// 整套出租.
    /// </summary>
    [Table(Name = "Info_HouseRent")]
    public class HouseRent : HouseBase<HouseRent>
    {
        public string Title
        {
            get;
            set;
        }
        
        /// <summary>
        /// 小区.
        /// </summary>
        public string District
        {
            get;
            set;
        }
        public string Address
        {
            get;
            set;
        }
        public byte Room
        {
            get;
            set;
        }
        /// <summary>
        /// 厅
        /// </summary>
        public byte Parlor
        {
            get;
            set;
        }
        public byte Toilet
        {
            get;
            set;
        }
        public short Floor
        {
            get;
            set;
        }
        public byte FloorTotal
        {
            get;
            set;
        }
        public short Area
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
        /// 装修情况，如简单装修.
        /// </summary>
        public string FitType
        {
            get;
            set;
        }
        /// <summary>
        /// 朝向,如东
        /// </summary>
        public string Toward
        {
            get;
            set;
        }
        public int Price
        {
            get;
            set;
        }
        /// <summary>
        /// 付款方式，如押一付三.
        /// </summary>
        public string PayWay
        {
            get;
            set;
        }

        /// <summary>
        /// 是否有床.
        /// </summary>
        public bool Bed
        {
            get;
            set;
        }
        /// <summary>
        /// 是否有热水器.
        /// </summary>
        public bool WaterHeater
        {
            get;
            set;
        }
        /// <summary>
        /// 是否有洗衣机.
        /// </summary>
        public bool WashingMachine
        {
            get;
            set;
        }
        /// <summary>
        /// 是否有空调.
        /// </summary>
        public bool AirConditioner
        {
            get;
            set;
        }
        /// <summary>
        /// 是否有电冰箱.
        /// </summary>
        public bool Icebox
        {
            get;
            set;
        }
        /// <summary>
        /// 是否有电视.
        /// </summary>
        public bool Television
        {
            get;
            set;
        }
        /// <summary>
        /// 是否有宽带.
        /// </summary>
        public bool Broadband
        {
            get;
            set;
        }
        ///// <summary>
        ///// 单间出租时使用(主卧、次卧、隔断间)
        ///// </summary>
        //public string Bedroom
        //{
        //    get;
        //    set;
        //}
        ///// <summary>
        ///// 合租(单间或床位)时使用(男女不限,限女生,限男生,限夫妻)
        ///// </summary>
        //public string HireLimit
        //{
        //    get;
        //    set;
        //}

        public string HouseAllocation
        {
            get
            {
                string Allocation = string.Empty;
                if (this.Bed)
                {
                    Allocation += ",床";
                }
                if (this.WaterHeater)
                {
                    Allocation += ",热水器";
                }
                if (this.WashingMachine)
                {
                    Allocation += ",洗衣机";
                }
                if (this.AirConditioner)
                {
                    Allocation += ",空调";
                }
                if (this.Icebox)
                {
                    Allocation += ",电冰箱";
                }
                if (this.Television)
                {
                    Allocation += ",电视机";
                }
                if (this.Broadband)
                {
                    Allocation += ",宽带";
                }
                if(!string.IsNullOrEmpty(Allocation))
                {
                    Allocation = Allocation.Substring(1);
                }
                return Allocation;
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
                    var category=houseCategory.Children.First(item => item.Singleton == HouseRent.Singleton);
                    if(category!=null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                   
                    //_objectTypeCollection = new List<ObjectType>()
                    //    {
                    //        new ObjectType()
                    //        {
                    //            Id=1,
                    //            Name="平房"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=2,
                    //            Name="普通住宅"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=3,
                    //            Name="商住两用"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=4,
                    //            Name="公寓"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=5,
                    //            Name="别墅"
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

        protected override DataAccess<HouseRent, int> GetProvider()
        {
            return new HouseRentDataAccess();
        }
        
    }
}
