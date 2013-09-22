using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 其他培训.
    /// </summary>
    [Table(Name = "Info_EduOther")]
    public class EduOther:EducationBase<EduOther>
    {
        public string Address
        {
            get;
            set;
        }
        protected override DataAccess<EduOther, int> GetProvider()
        {
            return new EduOtherDataAccess();
        }
    }
}
