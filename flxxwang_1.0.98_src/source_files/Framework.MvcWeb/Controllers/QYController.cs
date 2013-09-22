using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Infomation.Core;
using Infomation.Core.Mvc;
using Framework.Seo;

namespace Framework.MvcWeb.Controllers
{
    [ExceptionFilter]
    [SpiderFilter]
    public class QYController : Controller
    {
        //
        // GET: /Fenlei/QY/

        public ActionResult Index(int Id)
        {
            var model=new Company();
            var company = model.DataSelect(Id);
            if (company == null)
            {
                var se = Spider.GetSearchEngine(Request);
                if (se != SearchEngine.None)
                {
                    var spiderField = SeoUitls.GetSpiderField(se);
                    company = model.DataSelectAll("select top 1 * from " + model.TableName + " order by " + spiderField + "").FirstOrDefault();
                }
                
            }
            return View(company);
        }
        public ActionResult position(int id,string type)
        {
            //var recruitList = Recruit.SelectAll(new {CompanyId=id });
            var recruitList = Recruit.SelectAll(item=>item.CompanyId==id);
            this.ViewData["type"] = type;
            return View(recruitList);
        }
    }
}
