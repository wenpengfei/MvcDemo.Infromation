using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Infomation.Core
{
    public class SiteInfo
    {
        public static bool IsTaojen
        {
            get
            {
                return HttpContext.Current.Request.Url.ToString().IndexOf("taojen.com") > 0;
            }
        }
        public int Id
        {
            get;
            set;
        }
        /// <summary>
        /// 站点名称.
        /// </summary>
        public static string Name
        {
            get
            {
                if (IsTaojen)
                {
                    return "淘金分类信息网";
                }
                else
                {
                    return "分类信息网";
                }
            }
        }
    }
}
