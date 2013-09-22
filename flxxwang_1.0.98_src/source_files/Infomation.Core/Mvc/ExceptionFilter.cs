using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Framework;

namespace Infomation.Core.Mvc
{
    public class ExceptionFilter : ActionFilterAttribute, IExceptionFilter
    {

        #region IExceptionFilter 成员

        public void OnException(ExceptionContext filterContext)
        {
            var Request=filterContext.RequestContext.HttpContext.Request;
            var errMsg = filterContext.Exception.Message;
            errMsg += ",Controller:" + filterContext.RouteData.Values["controller"] + ",Action:" + filterContext.RouteData.Values["action"] + "";
            errMsg += ",url:" + Request.Url + ",UserAgent:"+Request.UserAgent+"";
            LogHelper.WriteLog(errMsg, filterContext.Exception);
            //filterContext.Result = new ContentResult() { Content = "<a href='/'>返回主页</a>" };
            filterContext.Result = new ViewResult() { ViewName = "~/Views/Error/Index.aspx" };
            filterContext.ExceptionHandled = true;
        }
        #endregion
    }
}
