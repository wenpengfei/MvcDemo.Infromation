using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Framework.MvcWeb.Content.Fenlei.Ajax
{
    /// <summary>
    /// search 的摘要说明
    /// </summary>
    public class search : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            var s = "['aaa','bbb','ccc']";
            context.Response.Write("aaaaa");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}