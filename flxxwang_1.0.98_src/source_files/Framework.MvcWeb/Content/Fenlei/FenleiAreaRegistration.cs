//using System.Web.Mvc;

//namespace Framework.MvcWeb.Areas.Fenlei
//{
//    public class FenleiAreaRegistration : AreaRegistration
//    {
//        public override string AreaName
//        {
//            get
//            {
//                return "Fenlei";
//            }
//        }

//        public override void RegisterArea(AreaRegistrationContext context)
//        {
//            //ControllerBuilder.Current.DefaultNamespaces.Add("Framework.MvcWeb.Controllers");

//            context.MapRoute(
//                "Fenlei_HomeIndex",
//                //"Fenlei/{p}",
//                "Fenlei",
//                new { controller = "Home", action = "Index" },//p=UrlParameter.Optional 
//                //new {p="(Index|Default)?"},
//                new string[] { "Framework.MvcWeb.Controllers" }
//            );

//            context.MapRoute(
//                "Fenlei_My",
//                "Fenlei/my/{action}",
//                new { controller = "My", action = "Index" },
//                new string[] { "Framework.MvcWeb.Controllers" }
//            );
            
//            //企业
//            context.MapRoute(
//                "Fenlei_qyPosition",
//                //"Fenlei/{city}/qy/position/{id}/{type}",//id为UserId
//                "Fenlei/qy/position/{id}/{type}",//id为UserId
//                new { controller = "qy", action = "position" },
//                new string[] { "Framework.MvcWeb.Controllers" }
//            );
//            context.MapRoute(
//                "Fenlei_qyIndex",
//                //"Fenlei/{city}/qy/{id}",//id为UserId
//                "Fenlei/qy/{id}",//id为UserId
//                new { controller = "qy", action = "Index" },
//                new string[] { "Framework.MvcWeb.Controllers" }
//            );
//            context.MapRoute(
//                "Fenlei_Jianli",
//                "Fenlei/jianli/{action}/{id}",
//                new { controller = "jianli"},
//                new string[] { "Framework.MvcWeb.Controllers" }
//            );
            
//            context.MapRoute(
//                "Fenlei_HomeDefault",
//                "Fenlei/{city}",
//                new { controller = "Home", action = "Default" },
//                new string[] { "Framework.MvcWeb.Controllers" }
//            );

//            context.MapRoute(
//                "Fenlei_Detail",
//                "Fenlei/{city}/{controller}/{smallcategory}/detail/{id}",
//                new { action = "Detail" }
//            );

//            context.MapRoute(
//                "Fenlei_post",
//                "Fenlei/{city}/post/{controller}/{smallcategory}/{region}/{circle}/{objecttype}",
//                new { action = "Post", region = 0, circle = 0, objecttype = 0 },
//                new { controller = "(s([^2|3|4])*)|([^s].+)|((s[2|3|4]).+)", region = "[1-9]\\d*|0", circle = "[1-9]\\d*|0" }//controller不能为s2或s3或s4
//            );

//            //context.MapRoute(
//            //    "Fenlei_List",
//            //    "Fenlei/{city}/{controller}/{action}/{region}/{circle}/{*values}",
//            //    new { action = "Index", region = 0, circle = 0 },
//            //    new { region = "[1-9]\\d*|0", circle = "[1-9]\\d*|0" }//注：region和circle不能为p或与p开头的字符串,为了方便,把p当作参数分隔符.
//            //);

//            context.MapRoute(
//                "Fenlei_List",
//                //"Fenlei/{city}/{controller}/{action}/{*values}",
//                "Fenlei/{city}/{controller}/{action}/{pageindex}/{region}/{circle}/{biz}/{objecttype}/{pic}/{pricerange}/{minprice}/{maxprice}/{days}/{sex}/{age}/{xueli}/{minage}/{maxage}/{minyear}/{maxyear}/{wagemin}/{wagemax}/{wd}",
//                new { action = "Index", pageindex = 1, region = 0, circle = 0, biz = -1, objecttype = 0, pic = -1, pricerange = 0, minprice = -1, maxprice = -1, days = -1, sex = -1, age = -1, xueli = 0, minage = -1, maxage = -1, minyear = -1, maxyear = -1, wagemin = -1, wagemax = -1, wd = UrlParameter.Optional }
//                //new { action = "Index", pageindex = UrlParameter.Optional, region = UrlParameter.Optional, circle = UrlParameter.Optional, biz = UrlParameter.Optional, objecttype = UrlParameter.Optional, pic = UrlParameter.Optional, pricerange = UrlParameter.Optional, minprice = UrlParameter.Optional, maxprice = UrlParameter.Optional, days = UrlParameter.Optional, wd = UrlParameter.Optional }
//                , new { controller="che|chongwu|fangchan|huangye|jiaoyou|jiaoyu|piaowu|qiuzhi|tiaozao|zhaopin" }
//            );

//            context.MapRoute(
//                "Fenlei_Default",
//                "Fenlei/{city}/{controller}/{action}/{*values}",
//                new { action = "Index"}
//                , new {values=".*" }
//            );


//            //context.MapRoute(
//            //    "Fenlei_default",
//            //    "Fenlei/{city}/{controller}/{action}/{id}",
//            //    new { action = "Index", id = UrlParameter.Optional }
//            //);
//        }
//    }
//}
