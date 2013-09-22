using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Framework.Utility
{
    public class CookieManager
    {
        /// <summary>
        /// 写cookie值
        /// </summary>
        /// <param name="strName">名称</param>
        /// <param name="strValue">值</param>
        public static void WriteCookie(string strName, string strValue)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies[strName];
            if (cookie == null)
            {
                cookie = new HttpCookie(strName);
            }
            cookie.Value =HttpContext.Current.Server.UrlEncode(strValue);
            HttpContext.Current.Response.AppendCookie(cookie);

        }
        /// <summary>
        /// 写cookie值
        /// </summary>
        /// <param name="strName">名称</param>
        /// <param name="strValue">值</param>
        /// <param name="strValue">过期时间(分钟)</param>
        public static void WriteCookie(string strName, string strValue, string domain, double expireDays, string Path)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies[strName];
            if (cookie == null)
            {
                cookie = new HttpCookie(strName);
            }
            
            cookie.Value =HttpContext.Current.Server.UrlEncode(strValue);
            if (expireDays > 0)
            {
                cookie.Expires = DateTime.Now.AddDays(expireDays);
            }
            if (!(string.IsNullOrEmpty(domain)||string.IsNullOrEmpty(domain.Trim())))
            {
                cookie.Domain = domain;
            }
            if (!(string.IsNullOrEmpty(Path)||string.IsNullOrEmpty(Path.Trim())))
            {
                cookie.Path = Path;
            }
            HttpContext.Current.Response.AppendCookie(cookie);

        }

        
        /// <summary>
        /// 读cookie值
        /// </summary>
        /// <param name="strName">名称</param>
        /// <returns>cookie值</returns>
        public static string GetCookie(string strName)
        {
            if (HttpContext.Current.Request.Cookies != null && HttpContext.Current.Request.Cookies[strName] != null)
            {
                var val= HttpContext.Current.Request.Cookies[strName].Value.ToString();
                var ret=HttpContext.Current.Server.UrlDecode(val);
                if (ret == "undefined")
                {
                    return null;
                }
                return ret;
            }
            return null;
        }
    }
}
