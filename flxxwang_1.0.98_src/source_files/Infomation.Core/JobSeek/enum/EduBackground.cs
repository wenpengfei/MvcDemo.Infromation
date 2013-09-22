using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Infomation.Core
{
    /// <summary>
    /// 教育背景
    /// </summary>
    public class EduBackground
    {
        public string Id
        {
            get;
            set;
        }
        public string School
        {
            get;
            set;
        }
        public string Profession
        {
            get;
            set;
        }
        public int StartYear
        {
            get;
            set;
        }
        public int StartMonth
        {
            get;
            set;
        }
        public int EndYear
        {
            get;
            set;
        }
        public int EndMonth
        {
            get;
            set;
        }
    }
}
