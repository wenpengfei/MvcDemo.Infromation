using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public class ObjectType
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
        /// <summary>
        /// 自定义任意数据.
        /// </summary>
        public object Tag
        {
            get;
            set;
        }
    }
}
