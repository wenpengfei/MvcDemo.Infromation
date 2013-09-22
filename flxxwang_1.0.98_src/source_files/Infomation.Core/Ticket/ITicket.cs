using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public interface ITicket : IInfo
    {
        /// <summary>
        /// QQ或MSN
        /// </summary>
        string QQOrMSN
        {
            get;
            set;
        }
    }
}
