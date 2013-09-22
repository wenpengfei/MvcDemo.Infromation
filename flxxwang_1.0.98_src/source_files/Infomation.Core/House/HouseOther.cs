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
    /// 厂房/仓库/土地.
    /// </summary>
    [Table(Name = "Info_HouseOther")]
    public class HouseOther:HouseBase<HouseOther>
    {
        /// <summary>
        /// //1:出租,2:求租,3:转让,4:求购,5:出售
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
        public int Area
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
        /// 1:元/㎡/天,2:元/月,0:万元
        /// </summary>
        public byte PriceUnit
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
                    var category = houseCategory.Children.FirstOrDefault(item => item.Singleton == HouseOther.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //    {
                    //        new ObjectType()
                    //        {
                    //            Id=1,
                    //            Name="仓库"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=2,
                    //            Name="车库"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=3,
                    //            Name="土地"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=4,
                    //            Name="厂房"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=5,
                    //            Name="其他"
                    //        },
                    //    };
                }
                return _objectTypeCollection;
            }
        }
        #endregion

        protected override DataAccess<HouseOther, int> GetProvider()
        {
            return new HouseOtherDataAccess();
        }

    }
}
