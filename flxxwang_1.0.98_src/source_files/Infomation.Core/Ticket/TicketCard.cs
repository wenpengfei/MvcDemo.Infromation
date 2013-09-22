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
    /// 卡券.
    /// </summary>
    [Table(Name = "Info_TicketCard")]
    public class TicketCard:TicketBase<TicketCard>
    {
        public string Title
        {
            get;
            set;
        }
        /// <summary>
        /// 1:转让,2:求购.
        /// </summary>
        public byte Type
        {
            get;
            set;
        }
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
        /// <summary>
        /// 有效期.
        /// </summary>
        public DateTime? ExpiryDate
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
        public string TypeName
        {
            get
            {
                if (this.Type == 1)
                {
                    return "转让";
                }
                else if (this.Type == 2)
                {
                    return "求购";
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
                    var ticketCategory = InfoCategory.GetCategory<TicketCategory>();
                    var category = ticketCategory.Children.FirstOrDefault(item => item.Singleton == TicketCard.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="优惠卡"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "消费券"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "健身卡"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "购物卡"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "游泳卡"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "其他"
                    //    },
                    //};
                }
                return _objectTypeCollection;
            }
        }
        #endregion

        protected override DataAccess<TicketCard, int> GetProvider()
        {
            return new TicketCardDataAccess();
        }
    }
}
