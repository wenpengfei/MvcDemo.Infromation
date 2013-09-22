using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Web;

namespace Infomation.Core
{
    public class Utils
    {
        #region Url
        private static string _RelativeWebRoot;
        /// <summary>
        /// Gets the relative root of the website.
        /// </summary>
        /// <value>A string that ends with a '/'.</value>
        public static string RelativeWebRoot
        {
            get
            {
                if (_RelativeWebRoot == null)
                    _RelativeWebRoot = VirtualPathUtility.ToAbsolute(ConfigurationManager.AppSettings["Info.VirtualPath"]);

                return _RelativeWebRoot;
            }
        }

        //private static Uri _AbsoluteWebRoot;

        /// <summary>
        /// Gets the absolute root of the website.
        /// </summary>
        /// <value>A string that ends with a '/'.</value>
        public static Uri AbsoluteWebRoot
        {
            get
            {
                //if (_AbsoluteWebRoot == null)
                //{
                HttpContext context = HttpContext.Current;
                if (context == null)
                    throw new System.Net.WebException("The current HttpContext is null");

                if (context.Items["absoluteurl"] == null)
                    context.Items["absoluteurl"] = new Uri(context.Request.Url.GetLeftPart(UriPartial.Authority) + RelativeWebRoot);

                return context.Items["absoluteurl"] as Uri;
                //_AbsoluteWebRoot = new Uri(context.Request.Url.GetLeftPart(UriPartial.Authority) + RelativeWebRoot);// new Uri(context.Request.Url.Scheme + "://" + context.Request.Url.Authority + RelativeWebRoot);
                //}
                //return _AbsoluteWebRoot;
            }
        }

        /// <summary>
        /// Converts a relative URL to an absolute one.
        /// </summary>
        public static Uri ConvertToAbsolute(Uri relativeUri)
        {
            return ConvertToAbsolute(relativeUri.ToString()); ;
        }

        /// <summary>
        /// Converts a relative URL to an absolute one.
        /// </summary>
        public static Uri ConvertToAbsolute(string relativeUri)
        {
            if (String.IsNullOrEmpty(relativeUri))
                throw new ArgumentNullException("relativeUri");

            string absolute = AbsoluteWebRoot.ToString();
            int index = absolute.LastIndexOf(RelativeWebRoot.ToString());

            return new Uri(absolute.Substring(0, index) + relativeUri);
        }

        /// Retrieves the subdomain from the specified URL.
        /// </summary>
        /// <param name="url">The URL from which to retrieve the subdomain.</param>
        /// <returns>The subdomain if it exist, otherwise null.</returns>
        public static string GetSubDomain(Uri url)
        {
            if (url.HostNameType == UriHostNameType.Dns)
            {
                string host = url.Host;
                if (host.Split('.').Length > 2)
                {
                    int lastIndex = host.LastIndexOf(".");
                    int index = host.LastIndexOf(".", lastIndex - 1);
                    return host.Substring(0, index);
                }
            }

            return null;
        }
        #endregion

        #region Cookie
        private static string _cookiePath;
        public static string CookiePath
        {
            get
            {
                if (_cookiePath == null)
                {
                    string path = ConfigurationManager.AppSettings["Info.VirtualPath"];
                    if (path != null)
                    {
                        if (path.StartsWith("~"))
                        {
                            path = path.Substring(1);
                        }
                    }
                    _cookiePath = path;
                }
                return _cookiePath;
            }
        }
        #endregion
    }
}
