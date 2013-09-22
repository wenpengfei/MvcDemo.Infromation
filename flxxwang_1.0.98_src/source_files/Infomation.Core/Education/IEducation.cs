using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public interface IEducation : IInfo
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
    }
}
