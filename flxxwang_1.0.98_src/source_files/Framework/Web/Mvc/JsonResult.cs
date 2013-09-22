using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using Framework.Web.Script.Serialization;

namespace Framework.Web.Mvc
{
    public class JsonResult:System.Web.Mvc.JsonResult
    {
        //参考源代码编写.
        public override void ExecuteResult(System.Web.Mvc.ControllerContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException("context");
            }
            if (JsonRequestBehavior ==System.Web.Mvc.JsonRequestBehavior.DenyGet &&
                String.Equals(context.HttpContext.Request.HttpMethod, "GET", StringComparison.OrdinalIgnoreCase))
            {
                throw new InvalidOperationException("This request has been blocked because sensitive information could be disclosed to third party web sites when this is used in a GET request. To allow GET requests, set JsonRequestBehavior to AllowGet.");
            }

            HttpResponseBase response = context.HttpContext.Response;

            if (!String.IsNullOrEmpty(ContentType))
            {
                response.ContentType = ContentType;
            }
            else
            {
                response.ContentType = "application/json";
            }
            if (ContentEncoding != null)
            {
                response.ContentEncoding = ContentEncoding;
            }
            if (Data != null)
            {
                //System.Web.Mvc.JsonResult源代码:
                //JavaScriptSerializer serializer = new JavaScriptSerializer();
                //response.Write(serializer.Serialize(Data));

                //为了解决循环引用，使用下面的代码：
                response.Write(JsonHelper.Serialize(Data));
            }
        }
    }
}
