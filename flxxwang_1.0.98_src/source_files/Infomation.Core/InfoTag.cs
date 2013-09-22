using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    /// <summary>
    /// 书签.
    /// </summary>
    public class InfoTag
    {
        public byte Id
        {
            get;
            set;
        }
        public string Name
        {
            get;
            set;
        }
        public byte? ObjectTypeId
        {
            get;
            set;
        }
        /// <summary>
        /// 自定义的任意对象值.
        /// </summary>
        public object Tag
        {
            get;
            set;
        }
    }
}
