using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    [Table(Name = "Info_HouseShop")]
    public class HouseShop:HouseBase<HouseShop>
    {
        /// <summary>
        /// 1:出售,2:求购,3:出租,4:求租,5:转让
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
        public byte ObjectType
        {
            get;
            set;
        }
        public string Management
        {
            get;
            set;
        }
        public float Price
        {
            get;
            set;
        }
        public float? Price2
        {
            get;
            set;
        }
        /// <summary>
        /// 转让费，类型为转让时使用.
        /// </summary>
        public float? PriceTransfer
        {
            get;
            set;
        }
        /// <summary>
        /// 类型为出租或求租时使用,1:元/㎡/天,2:元/月
        /// </summary>
        public byte? PriceUnit
        {
            get;
            set;
        }
        public short Area
        {
            get;
            set;
        }
        public short? Area2
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
                    var houseCategory = InfoCategory.GetCategory<HouseCategory>();
                    var category = houseCategory.Children.FirstOrDefault(item => item.Singleton == HouseShop.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //    {
                    //        new ObjectType()
                    //        {
                    //            Id=1,
                    //            Name="商铺/门面/店面"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=2,
                    //            Name="摊位/柜台"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=3,
                    //            Name="底商"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=4,
                    //            Name="其他"
                    //        },
                    //    };
                }
                return _objectTypeCollection;
            }
        }
        #endregion

        protected override DataAccess<HouseShop, int> GetProvider()
        {
            return new HouseShopDataAccess();
        }
    }
}
