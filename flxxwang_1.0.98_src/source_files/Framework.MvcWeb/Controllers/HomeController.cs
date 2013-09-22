using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using Framework.Common;
using Framework.Utility;
using Infomation.Core;
using System.IO;
using Framework.Extensions;
using Infomation.Core.Mvc;

namespace Framework.MvcWeb.Controllers
{
    [ExceptionFilter]
    [SpiderFilter]
    public class HomeController : Controller
    {
        //
        // GET: /Fenlei/Home/

        //[OutputCache(Duration = int.MaxValue, Location = OutputCacheLocation.Server)]
        public ActionResult Index()
        {
            //return Content(DateTime.Now.ToString());//测试OutputCache
            ViewData["ChangCity"] = "false";
            if (Request.QueryString.Count>0&&Request.QueryString[0].ToLower() == "changecity")
            {
                ViewData["ChangCity"] = "true";
                return View();
            }

            //下面两种方法都能够获取客户端IP地址
            //var vip = Request.UserHostAddress;
            var vip = Request.ServerVariables["Remote_Addr"];
            
            var ipnow = IP.CIP(vip);

            var ipVCity = IP.AllCityIP.FirstOrDefault(ip => ip.StartIP <= ipnow && ip.EndIP >= ipnow);//访客IP

            City VCity = null;//访客所在的城市.
            if (ipVCity != null)
            {
                VCity = City.Cities.FirstOrDefault(city => city.Id == ipVCity.CityId);
            }

            var cookieCity = CookieManager.GetCookie("city");
            string cityCode = null;
            if (!string.IsNullOrEmpty(cookieCity))
            {
                cityCode = cookieCity;
            }
            else if(VCity!=null)
            {
                cityCode = VCity.Code;
            }
            ViewData["city"] = cityCode;
            if (Request.QueryString.Count == 0)
            {
                if (!string.IsNullOrEmpty(cityCode))
                {
                    tongji();
                    return View();
                    //return RedirectToAction("Default", new {city=cityCode,tid=this.RouteData.Values["tid"] });
                }
            }

            if (Request.QueryString.Count > 0)//根据UrlForwarding.xml配置信息实现跳转.
            {
                var queryString = Request.QueryString[0].ToLower();
                if (UrlForwarding.Forwardings.ContainsKey(queryString))
                {
                    var city = "bj";
                    if (!string.IsNullOrEmpty(cityCode))
                    {
                        city = cityCode;
                    }
                    var url = UrlForwarding.Forwardings[queryString].Replace("{city}", city);
                    if (Request.QueryString.Count > 1)
                    {
                        if (!url.EndsWith("/"))
                        {
                            url += "/";
                        }

                        for (var i = 1; i < Request.QueryString.Count; i++)
                        {
                            if (i == 1)
                            {
                                url += "?";
                            }
                            else
                            {
                                url += "&";
                            }
                            var key = Request.QueryString.AllKeys[i];
                            url += "" + key + "=" + Request.QueryString[key] + "";
                        }
                    }
                    tongji();
                    return Redirect(url);
                }
            }

            return View();
        }

        public ActionResult Default()
        {
            var cityCode = this.RouteData.Values["city"].ToString();
            var city = City.GetCityByCode(cityCode);

            string path = string.Empty;
            path = Url.Action(null, this.RouteData.Values);//或者path= Url.RouteUrl("Fenlei_HomeDefault", this.RouteData.Values);

            ViewData["City"] = city;
            ViewData["tid"] = this.RouteData.Values["tid"];
            return View();
        }

        public ActionResult salelist()
        {
            return View();
        }

        private void tongji()
        {
            
        }
    }
}
