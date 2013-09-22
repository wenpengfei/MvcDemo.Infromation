using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public interface IFriend : IInfo
    {
        /// <summary>
        /// 补充说明.
        /// </summary>
        string Content
        {
            get;
            set;
        }
    }
}
