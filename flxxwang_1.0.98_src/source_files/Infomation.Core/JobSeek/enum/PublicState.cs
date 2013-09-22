using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    /// <summary>
    /// 公开状态
    /// </summary>
    public enum PublicState
    {
        /// <summary>
        /// 允许所有企业下载您的简历
        /// </summary>
        Public=1,
        /// <summary>
        /// 只允许58同城认证企业下载您的简历
        /// </summary>
        Internal=2,
        /// <summary>
        /// 不允许企业主动下载您的简历，只有您应聘的企业才可查看
        /// </summary>
        Private=3,
        
    }
}
