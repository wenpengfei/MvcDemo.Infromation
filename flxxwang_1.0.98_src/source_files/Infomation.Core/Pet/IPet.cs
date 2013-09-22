using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public interface IPet : IInfo
    {
        /// <summary>
        /// 是否经纪人.
        /// </summary>
        bool IsBiz
        {
            get;
            set;
        }
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
