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
    /// 汽车服务/过户.
    /// </summary>
    [Table(Name = "Info_CarService")]
    public class CarService:CarBase<CarService>
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
        #region InfoBase 重写成员.
        private static List<ObjectType> _objectTypeCollection;
        public override List<ObjectType> ObjectTypeCollection
        {
            get
            {
                if (_objectTypeCollection == null)
                {
                    var carCategory = InfoCategory.GetCategory<CarCategory>();
                    var category = carCategory.Children.FirstOrDefault(item => item.Singleton == CarService.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="汽车检修"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "汽车保养"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "4S店/经销商"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "保险理赔过户"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "汽车服务"
                    //    },
                    //};
                }
                return _objectTypeCollection;
            }
        }

        private static List<InfoTag> _tagCollection;
        public override List<InfoTag> TagCollection
        {
            get
            {
                if (_tagCollection == null)
                {
                    var carCategory = InfoCategory.GetCategory<CarCategory>();
                    var category = carCategory.Children.FirstOrDefault(item => item.Singleton == CarService.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="汽车维修",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="汽车检测",
                    //        ObjectTypeId=1
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="汽车装饰",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="洗车",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="汽车打蜡",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="汽车烤漆",
                    //        ObjectTypeId=2
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="货运车",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="吉普车",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="旅行车",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="面包车",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="跑车",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="商务车",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="小轿车",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=14,
                    //        Name="汽车保险",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=15,
                    //        Name="汽车理赔",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=16,
                    //        Name="代办过户",
                    //        ObjectTypeId=4
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=17,
                    //        Name="二手车行",
                    //        ObjectTypeId=3
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=18,
                    //        Name="汽车美容",
                    //        ObjectTypeId=2
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion
        protected override DataAccess<CarService, int> GetProvider()
        {
            return new CarServiceDataAccess();
        }
    }
}
