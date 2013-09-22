using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Net;
using System.IO;
using Framework.Extensions;
namespace Framework.WebCatch
{
    public class Utils
    {
        public static void OpenPage(string url)
        {
            WebClient client = new WebClient();
            client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
            try
            {
                client.OpenReadAsync(new Uri(url, UriKind.RelativeOrAbsolute));
            }
            catch (Exception ex)
            {
                Console.WriteLine(url + "--打开出错");
            }
        }
        public static string GetPageHtml(string url)
        {
            WebClient client = new WebClient();
            client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
            Stream data = null;
            StreamReader reader = null;
            string pageHtml = null;
            try
            {
                data = client.OpenRead(url);
                reader = new StreamReader(data);
                pageHtml = reader.ReadToEnd();
            }
            catch(Exception ex)
            {
                return null;
            }
            finally
            {
                if (data != null)
                {
                    data.Close();
                }
                if (reader != null)
                {
                    reader.Close();
                }
            }
            return pageHtml;
        }
        public static string Trim(string str, string start, string end)
        {
            return str.Trim(start, end);

            //if (!string.IsNullOrEmpty(start))
            //{
            //    var startIndex = str.IndexOf(start);
            //    if (startIndex == -1)
            //    {
            //        return null;
            //    }
            //    str = str.Substring(startIndex + start.Length);
            //}
            //if (!string.IsNullOrEmpty(end))
            //{
            //    var endIndex = str.IndexOf(end);
            //    if (endIndex == -1)
            //    {
            //        return null;
            //    }
            //    str = str.Substring(0, endIndex);
            //}
            //return str;
        }
    }
}
