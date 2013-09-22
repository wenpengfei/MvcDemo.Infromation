using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace Framework.Extensions
{
    public static class StringExtensions
    {
        private static readonly Regex STRIP_HTML = new Regex("<[^>]*>", RegexOptions.Compiled);

        public static string Left(this string Str,int Length,string EndString=null)
        {
            if (string.IsNullOrEmpty(Str))
            {
                return Str;
            }
            if (Str.Length <= Length)
            {
                return Str;
            }
            return Str.Substring(0, Length)+EndString;
        }
        public static string Trim(this string str, string start, string end)
        {
            if (!string.IsNullOrEmpty(start))
            {
                var startIndex = str.IndexOf(start);
                if (startIndex == -1)
                {
                    return null;
                }
                str = str.Substring(startIndex + start.Length);
            }
            if (!string.IsNullOrEmpty(end))
            {
                var endIndex = str.IndexOf(end);
                if (endIndex == -1)
                {
                    return null;
                }
                str = str.Substring(0, endIndex);
            }
            return str;
        }

        /// <summary>
        /// Strips all HTML tags from the specified string.
        /// </summary>
        /// <param name="html">The string containing HTML</param>
        /// <returns>A string without HTML tags</returns>
        public static string RemoveHtml(this string html)
        {
            if (string.IsNullOrEmpty(html))//参数可以传null
                return string.Empty;

            return STRIP_HTML.Replace(html, string.Empty);
        }

        public static string RemoveHref(this string str)//移除超连接标记并保留连接文本.
        {
            Regex regex = new Regex("<a.*?>|</a>");
            string ret = regex.Replace(str, "");
            return ret;
        }
    }
}
