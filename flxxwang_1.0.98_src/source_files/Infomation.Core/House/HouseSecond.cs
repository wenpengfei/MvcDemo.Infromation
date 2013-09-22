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
    /// 二手房.
    /// </summary>
    [Table(Name = "Info_HouseSecond")]
    public class HouseSecond:HouseBase<HouseSecond>
    {
        /// <summary>
        /// 1:出售,2:求购.
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
        public string District
        {
            get;
            set;
        }
        /// <summary>
        /// 求购时使用.
        /// </summary>
        public string District2
        {
            get;
            set;
        }
        /// <summary>
        /// 出售时使用.
        /// </summary>
        public string Address
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
        public string FitType
        {
            get;
            set;
        }
        public string Toward
        {
            get;
            set;
        }
        /// <summary>
        /// 产权
        /// </summary>
        public string Right
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
        /// 出售时使用.
        /// </summary>
        public byte? Parlor
        {
            get;
            set;
        }
        /// <summary>
        /// 出售时使用.
        /// </summary>
        public byte? Toilet
        {
            get;
            set;
        }
        /// <summary>
        /// 出售时使用.
        /// </summary>
        public short? Floor
        {
            get;
            set;
        }
        /// <summary>
        /// 出售时使用.
        /// </summary>
        public byte? FloorTotal
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
        /// 求购时使用.
        /// </summary>
        public float? Price2
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
        /// 求购时使用.
        /// </summary>
        public int? Area2
        {
            get;
            set;
        }
        /// <summary>
        /// 出售时使用.
        /// </summary>
        public byte? Age
        {
            get;
            set;
        }

        public string PriceName
        {
            get
            {
                string name = string.Empty;
                if (this.Type == 1)//出售
                {
                    if (this.Price == 0)
                    {
                        return "面议";
                    }

                        return this.Price.ToString();

                }
                if (this.Type == 2)//求购
                {
                    if (this.Price == 0 || this.Price2 == 0)
                    {
                        return "面议";
                    }
                        return this.Price + "-" + this.Price2;
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
                    var category = houseCategory.Children.FirstOrDefault(item => item.Singleton == HouseSecond.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //    {
                    //        new ObjectType()
                    //        {
                    //            Id=1,
                    //            Name="地下室"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=2,
                    //            Name="平房"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=3,
                    //            Name="普通住宅"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=4,
                    //            Name="商住两用"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=5,
                    //            Name="公寓"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=6,
                    //            Name="别墅"
                    //        },
                    //        new ObjectType()
                    //        {
                    //            Id=7,
                    //            Name="其他"
                    //        },

                    //    };
                }
                return _objectTypeCollection;
            }
        }
        #endregion

        protected override DataAccess<HouseSecond, int> GetProvider()
        {
            return new HouseSecondDataAccess();
        }
    }
}
