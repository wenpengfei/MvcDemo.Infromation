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
    /// 拼车/顺风车.
    /// </summary>
    [Table(Name = "Info_Carpool")]
    public class Carpool:CarBase<Carpool>
    {
        /// <summary>
        /// 1:有车,2:无车.
        /// </summary>
        public byte Type
        {
            get;
            set;
        }
        /// <summary>
        /// 拼车类型.
        /// </summary>
        public byte ObjectType
        {
            get;
            set;
        }
        /// <summary>
        /// 起点.
        /// </summary>
        public string Startstation
        {
            get;
            set;
        }
        /// <summary>
        /// 终点.
        /// </summary>
        public string EndStation
        {
            get;
            set;
        }
        /// <summary>
        /// 途经地点.
        /// </summary>
        public string Way
        {
            get;
            set;
        }
        /// <summary>
        /// 上下班拼车时使用.
        /// </summary>
        public string Round
        {
            get;
            set;
        }
        /// <summary>
        /// 出发时间.
        /// </summary>
        public DateTime? StartTime
        {
            get;
            set;
        }
        /// <summary>
        /// 车型.
        /// </summary>
        public string Model
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
                    var category = carCategory.Children.FirstOrDefault(item => item.Singleton == Carpool.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="上下班拼车"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "长途拼车"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "拼车自驾游"
                    //    },
                    //    //春节拼车，在春节前后在启用.
                    //    //new ObjectType()
                    //    //{
                    //    //    Id = 4,
                    //    //    Name = "春节拼车"
                    //    //},
                    //};
                }
                return _objectTypeCollection;
            }
        }
        #endregion
        protected override DataAccess<Carpool, int> GetProvider()
        {
            return new CarpoolDataAccess();
        }
    }
}
