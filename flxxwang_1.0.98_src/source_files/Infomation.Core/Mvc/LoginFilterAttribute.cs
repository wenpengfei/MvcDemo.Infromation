using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Framework.Utility;
using Framework.Extensions;

namespace Infomation.Core.Mvc
{
    public class LoginFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //if (!filterContext.HttpContext.User.Identity.IsAuthenticated)
            if (string.IsNullOrWhiteSpace(CookieManager.GetCookie("userId")))
            {
                filterContext.Result = new RedirectToRouteResult("Fenlei_My", new RouteValueDictionary(new { /*controller = "My",*/ action = "Login" }));
            }
            base.OnActionExecuting(filterContext);
        }
    }
    //系统自带有AuthorizeAttribute,但是改不了登陆页面.
    //(附：Attribute放在Controller上则对其中的所有Action有效.)

    
}