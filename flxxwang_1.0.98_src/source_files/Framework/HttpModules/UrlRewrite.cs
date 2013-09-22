#region Using

using System;
using System.Text;
using System.Web;
using System.Text.RegularExpressions;
using System.Globalization;
using System.Collections.Generic;

using System.Xml.Linq;

#endregion

namespace Framework.Web.HttpModules
{
	/// <summary>
	/// Handles pretty URL's and redirects them to the permalinks.
	/// </summary>
	public class UrlRewrite : IHttpModule
	{
        XElement Root = null;

		#region IHttpModule Members

		/// <summary>
		/// 
		/// </summary>
		public void Dispose()
		{
			// Nothing to dispose
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="context"></param>
		public void Init(HttpApplication context)
		{//在执一次，所以如果要更新为xml中的内容，需重启IIS或更新Framework程序集。
            //string a = VirtualPathUtility.ToAbsolute("~/");
            string a = HttpContext.Current.Server.MapPath("/UrlRewrite.xml");
            Root = XElement.Load(a);
			context.BeginRequest += new EventHandler(context_BeginRequest);
		}

		#endregion

		/// <summary>
		/// Handles the BeginRequest event of the context control.
		/// </summary>
		/// <param name="sender">The source of the event.</param>
		/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
		private void context_BeginRequest(object sender, EventArgs e)
		{//参考BlogEngine
			HttpContext context = ((HttpApplication)sender).Context;
			string path = context.Request.Path.ToUpperInvariant();
			string url = context.Request.RawUrl.ToUpperInvariant();
            
            string OriginalString = context.Request.Url.OriginalString;

            //throw new Exception("test:" + OriginalString);

            foreach (var obj in Root.Elements())
            {
                Regex regex = new Regex(obj.Attribute("Url").Value, RegexOptions.IgnoreCase | RegexOptions.Compiled);
                if (regex.IsMatch(OriginalString))
                {
                    string RewriteTo = obj.Attribute("RewriteTo").Value;
                    Match match = regex.Match(OriginalString);
                    for (int i = 0; i < match.Groups.Count; i++)
                    {
                        //Regex regexto = new Regex(obj.Attribute("RewriteTo").Value, RegexOptions.IgnoreCase | RegexOptions.Compiled);
                        
                        RewriteTo=RewriteTo.Replace("("+i+")",match.Groups[i].Value);

                        
                    }
                    context.RewritePath(RewriteTo);

                    return;
                }
            }
		}

        //private static readonly Regex YEAR = new Regex("/([0-9][0-9][0-9][0-9])/", RegexOptions.IgnoreCase | RegexOptions.Compiled);
        //private static readonly Regex YEAR_MONTH = new Regex("/([0-9][0-9][0-9][0-9])/([0-1][0-9])/", RegexOptions.IgnoreCase | RegexOptions.Compiled);
        //private static readonly Regex YEAR_MONTH_DAY = new Regex("/([0-9][0-9][0-9][0-9])/([0-1][0-9])/([0-3][0-9])/", RegexOptions.IgnoreCase | RegexOptions.Compiled);

	}
}