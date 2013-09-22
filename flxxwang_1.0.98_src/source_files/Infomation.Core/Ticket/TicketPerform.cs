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
    /// 演出门票.
    /// </summary>
    [Table(Name = "Info_TicketPerform")]
    public class TicketPerform:TicketBase<TicketPerform>
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
        public DateTime Time
        {
            get;
            set;
        }
        /// <summary>
        /// 场馆.
        /// </summary>
        public string Facility
        {
            get;
            set;
        }
        /// <summary>
        /// 张数.
        /// </summary>
        public int Count
        {
            get;
            set;
        }
        /// <summary>
        /// 是否连座
        /// </summary>
        public bool Series
        {
            get;
            set;
        }
        /// <summary>
        /// 座位.
        /// </summary>
        public string Seat
        {
            get;
            set;
        }
        /// <summary>
        /// 原价.
        /// </summary>
        public int? PriceOriginal
        {
            get;
            set;
        }
        /// <summary>
        /// 现价
        /// </summary>
        public int Price
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
                    var category = ticketCategory.Children.FirstOrDefault(item => item.Singleton == TicketPerform.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="演唱会"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id=2,
                    //        Name="音乐会"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id=3,
                    //        Name="话剧歌剧"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id=4,
                    //        Name="电影票"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id=5,
                    //        Name="少儿剧场"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id=6,
                    //        Name="魔术杂技"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id=7,
                    //        Name="舞蹈芭蕾"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id=8,
                    //        Name="综合演出"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id=9,
                    //        Name="戏曲"
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
                    var ticketCategory = InfoCategory.GetCategory<TicketCategory>();
                    var category = ticketCategory.Children.FirstOrDefault(item => item.Singleton == TicketPerform.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="童话剧",
                    //        ObjectTypeId=5
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion

        protected override DataAccess<TicketPerform, int> GetProvider()
        {
            return new TicketPerformDataAccess();
        }
    }
}
