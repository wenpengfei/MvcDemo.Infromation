using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Infomation.Core;
using Framework.Common;
using Infomation.Core.Mvc;
using Framework.Seo;

namespace Framework.MvcWeb.Controllers
{
    [ExceptionFilter]
    [SpiderFilter]
    public class JianliController : Controller
    {
        //
        // GET: /Fenlei/Jianli/

        public ActionResult Index()
        {
            var cityCode = this.RouteData.Values["city"].ToString();
            var city = City.GetCityByCode(cityCode);
            ViewData["City"] = city;
            return View();
        }
        public ActionResult showresume(int Id)
        {
            var model = new Resume();
            var resume = model.DataSelect(Id);
            if (resume == null)
            {
                var se = Spider.GetSearchEngine(Request);
                if (se != SearchEngine.None)
                {
                    var spiderField = SeoUitls.GetSpiderField(se);
                    resume = model.DataSelectAll("select top 1 * from " + model.TableName + " order by " + spiderField + "").FirstOrDefault();
                }
            }

            return View(resume);
        }
    }
}
