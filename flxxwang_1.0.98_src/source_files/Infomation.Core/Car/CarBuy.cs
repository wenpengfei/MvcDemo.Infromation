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
    /// 二手车求购.
    /// </summary>
    [Table(Name = "Info_CarBuy")]
    public class CarBuy:CarBase<CarBuy>
    {
        public byte? Tag1
        {
            get;
            set;
        }
        public byte? Tag2
        {
            get;
            set;
        }
        /// <summary>
        /// 变速器.
        /// </summary>
        public string Transmission
        {
            get;
            set;
        }
        /// <summary>
        /// 排量.
        /// </summary>
        public string Exhaust
        {
            get;
            set;
        }
        /// <summary>
        /// 行驶里程.
        /// </summary>
        public string Rundistance
        {
            get;
            set;
        }
        public int Price1
        {
            get;
            set;
        }
        public int Price2
        {
            get;
            set;
        }
        #region InfoBase 重写成员.
        private static List<InfoTag> _tagCollection;
        public override List<InfoTag> TagCollection
        {
            get
            {
                if (_tagCollection == null)
                {
                    var carCategory = InfoCategory.GetCategory<CarCategory>();
                    var category = carCategory.Children.FirstOrDefault(item => item.Singleton == CarBuy.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="经济轿车",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="中级轿车",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="高档轿车",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="商务车",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="越野车",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="面包车",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="客车/中巴",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="货车/皮卡",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="厢式货车",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="其他车型",
                    //        ObjectTypeId=0
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<CarBuy, int> GetProvider()
        {
            return new CarBuyDataAccess();
        }
    }
}
