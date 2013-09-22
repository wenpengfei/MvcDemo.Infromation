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
    /// 火车票.
    /// </summary>
    [Table(Name = "Info_TicketTrain")]
    public class TicketTrain:TicketBase<TicketTrain>
    {
        private string _title;
        public string Title
        {
            get
            {
                if (_title == null)
                {
                    _title = "转让 "+this.StartStation+" - "+this.EndStation+" "+this.Number+"";

                    var objType = this.ObjectTypeCollection.FirstOrDefault(item => item.Id == this.ObjectType);
                    if (objType != null)
                    {
                        _title += " "+objType.Name+"";
                    }
                    _title += " "+this.Count+"张";
                    if (this.Time != null)
                    {
                        _title += " "+this.Time.Value.ToString("M月d日")+"";
                    }
                }
                return _title;
            }
        }
        /// <summary>
        /// 1:转让,2:求购.
        /// </summary>
        public byte Type
        {
            get;
            set;
        }
        /// <summary>
        /// 坐位类型.
        /// </summary>
        public byte ObjectType
        {
            get;
            set;
        }
        public string StartStation
        {
            get;
            set;
        }
        public string EndStation
        {
            get;
            set;
        }
        /// <summary>
        /// 车次.
        /// </summary>
        public string Number
        {
            get;
            set;
        }
        /// <summary>
        /// 发车日期.(出售时使用)
        /// </summary>
        public DateTime? Time
        {
            get;
            set;
        }
        /// <summary>
        /// 求购时使用.
        /// </summary>
        public DateTime? StartTime
        {
            get;
            set;
        }
        /// <summary>
        /// 求购时使用.
        /// </summary>
        public DateTime? EndTime
        {
            get;
            set;
        }
        
        /// <summary>
        /// 张数.
        /// </summary>
        public short Count
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
                    var category = ticketCategory.Children.FirstOrDefault(item => item.Singleton == TicketTrain.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="硬座"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "软座"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "硬卧"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 4,
                    //        Name = "软卧"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 5,
                    //        Name = "站票"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 6,
                    //        Name = "一等座"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 7,
                    //        Name = "二等座"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 8,
                    //        Name = "座票"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 9,
                    //        Name = "卧铺"
                    //    },
                    //};
                }
                return _objectTypeCollection;
            }
        }
        #endregion

        protected override DataAccess<TicketTrain, int> GetProvider()
        {
            return new TicketTrainDataAccess();
        }
    }
}
