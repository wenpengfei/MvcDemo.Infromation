﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public interface ICar : IInfo
    {
        string Title
        {
            get;
            set;
        }
        /// <summary>
        /// 补充说明.
        /// </summary>
        string Content
        {
            get;
            set;
        }
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
