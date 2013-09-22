using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    [Table(Name = "Info_TicketOther")]
    public class TicketOther:TicketBase<TicketOther>
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
        protected override DataAccess<TicketOther, int> GetProvider()
        {
            return new TicketOtherDataAccess();
        }
    }
}
