using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Framework.MvcWeb
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");//忽略WebResource.axd、ScriptResource.axd等这些资源文件.
            routes.IgnoreRoute("{resource}.txt");//忽略.txt文件,搜索引擎会访问 /robots.txt文件.如果不忽略则会匹配Fenlei_HomeDefault这条路由.
            //routes.MapRoute(
            //    "AjaxIndex",
            //    "ajax",
            //    new { controller = "Ajax", action = "Index" }
            //);
            routes.MapRoute(
                "Ajax",
                "ajax/{action}",
                new { controller = "Ajax", action = "Index"}
            );

            //routes.MapRoute(
            //    "Fenlei_HomeIndex",
            //    "",
            //    new { controller = "Home", action = "Index" }
            //);
            routes.MapRoute(
                "Fenlei_HomeIndex2",
                "{tid}",
                new { controller = "Home", action = "Index", tid = "t0" },
                new { tid = "t\\d+" }
            );
            //routes.MapRoute(
            //    "Fenlei_HomeIndex3",
            //    "?{tid}",
            //    new { controller = "Home", action = "Index", tid = "t0" },
            //    new { tid = "t\\d+" }
            //);
            routes.MapRoute(
                "Fenlei_My",
                "my/{action}/{tid}",
                new { controller = "My", action = "Index", tid = "t0" }
                , new { tid = "t\\d+" }
                //new string[] { "Framework.MvcWeb.Controllers" }
            );

            //企业
            routes.MapRoute(
                "Fenlei_qyPosition",
                "qy/position/{id}/{type}/{tid}",//id为CompanyId
                new { controller = "qy", action = "position", tid = "t0" }
                , new { tid = "t\\d+" }
                //new string[] { "Framework.MvcWeb.Controllers" }
            );
            routes.MapRoute(
                "Fenlei_qyIndex",
                "qy/{id}/{tid}",//id为CompanyId
                new { controller = "qy", action = "Index", tid = "t0" }
                , new { tid = "t\\d+" }
                //new string[] { "Framework.MvcWeb.Controllers" }
            );
            routes.MapRoute(
                "Fenlei_Jianli",
                "jianli/{action}/{id}/{tid}",
                new { controller = "jianli", tid = "t0" }
                , new { tid = "t\\d+" }
                //new string[] { "Framework.MvcWeb.Controllers" }
            );
            routes.MapRoute(
                "Fenlei_guanli",
                "guanli/{action}/{tid}",
                new { controller = "GuanLi", action = "Index", tid = "t0" }
                , new { tid = "t\\d+" }
                //new string[] { "Framework.MvcWeb.Controllers" }
            );

            routes.MapRoute(
                "Stat",
                "Stat/{action}",
                new { controller = "Stat", action = "Index"}
            );

            routes.MapRoute(
                "Fenlei_HomeDefault",
                "{city}/{tid}",
                new { controller = "Home", action = "Default", tid = "t0" }
                , new { tid = "t\\d+" }
                //new string[] { "Framework.MvcWeb.Controllers" }
            );

            routes.MapRoute(
                "Fenlei_Detail",
                "{city}/{controller}/{smallcategory}/detail/{id}/{tid}",
                new { action = "Detail", tid = "t0" }
                , new { tid = "t\\d+" }
            );

            routes.MapRoute(
                "Fenlei_PostStep",
                "{city}/post/{action}/{tid}/{*values}",
                new { controller = "Post", action = "Index", tid = "t0" },
                new { action = "index|s2|s2_job|s2_jobjz|s3|s4", tid = "t\\d+", values = ".*" }
            );

            routes.MapRoute(
                "Fenlei_post",
                "{city}/post/{controller}/{smallcategory}/{region}/{circle}/{objecttype}/{tid}",
                new { action = "Post", region = 0, circle = 0, objecttype = 0, tid = "t0" },
                new { region = "[1-9]\\d*|0", circle = "[1-9]\\d*|0", tid = "t\\d+" }//controller不能为s2或s3或s4
            );

            //context.MapRoute(
            //    "Fenlei_List",
            //    "Fenlei/{city}/{controller}/{action}/{region}/{circle}/{*values}",
            //    new { action = "Index", region = 0, circle = 0 },
            //    new { region = "[1-9]\\d*|0", circle = "[1-9]\\d*|0" }//注：region和circle不能为p或与p开头的字符串,为了方便,把p当作参数分隔符.
            //);

            routes.MapRoute(
                "Fenlei_List",
                //"Fenlei/{city}/{controller}/{action}/{*values}",
                "{city}/{controller}/{action}/{pageindex}/{region}/{circle}/{biz}/{objecttype}/{tag}/{pic}/{pricerange}/{minprice}/{maxprice}/{days}/{sex}/{xueli}/{minage}/{maxage}/{minyear}/{maxyear}/{wagemin}/{wagemax}/{tid}/{wd}",
                new { action = "Index", pageindex = 1, region = 0, circle = 0, biz = -1, objecttype = 0, tag = 0, pic = -1, pricerange = 0, minprice = -1, maxprice = -1, days = -1, sex = -1, xueli = 0, minage = -1, maxage = -1, minyear = -1, maxyear = -1, wagemin = -1, wagemax = -1, tid = "t0", wd = UrlParameter.Optional }
                //new { action = "Index", pageindex = UrlParameter.Optional, region = UrlParameter.Optional, circle = UrlParameter.Optional, biz = UrlParameter.Optional, objecttype = UrlParameter.Optional, pic = UrlParameter.Optional, pricerange = UrlParameter.Optional, minprice = UrlParameter.Optional, maxprice = UrlParameter.Optional, days = UrlParameter.Optional, wd = UrlParameter.Optional }
                , new { controller = "che|chongwu|fangchan|huangye|jiaoyou|jiaoyu|piaowu|qiuzhi|tiaozao|zhaopin", tid = "t\\d+" }
            );

            routes.MapRoute(
                "Fenlei_Default",
                "{city}/{controller}/{action}/{tid}/{*values}",
                new { action = "Index", tid = "t0" }
                , new { tid = "t\\d+", values = ".*" }
            );

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);

            Infomation.Core.InfoStatistics.Init();
        }
    }
}