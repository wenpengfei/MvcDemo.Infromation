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
    /// 
    /// </summary>
    [Table(Name = "Info_TicketAirplane")]
    public class TicketAirplane:TicketBase<TicketAirplane>
    {
        public byte ObjectType
        {
            get;
            set;
        }
        public string Title
        {
            get;
            set;
        }
        public string Address
        {
            get;
            set;
        }
        public string Content
        {
            get;
            set;
        }
        /// <summary>
        /// 是否经纪人.
        /// </summary>
        public bool IsBiz
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
                    var ticketCategory = InfoCategory.GetCategory<TicketCategory>();
                    var category = ticketCategory.Children.FirstOrDefault(item => item.Singleton == TicketAirplane.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="国际机票"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "国内机票"
                    //    },
                    //};
                }
                return _objectTypeCollection;
            }
        }
        #endregion

        protected override DataAccess<TicketAirplane, int> GetProvider()
        {
            return new TicketAirplaneDataAccess();
        }
    }
}
