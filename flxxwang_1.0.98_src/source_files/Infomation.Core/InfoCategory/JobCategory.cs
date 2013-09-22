using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    /// <summary>
    /// 职位类别.(求职/招聘时用)
    /// </summary>
    public class JobCategory:Infomation.Core.InfoCategory
    {
        public byte Id
        {
            get;
            set;
        }
        public JobType JobType
        {
            get
            {
                return (JobType)Id;
            }
        }
    }
}
