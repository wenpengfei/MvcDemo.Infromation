using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using Infomation.Core.Mvc;

namespace Framework.MvcWeb.Controllers
{
    [ExceptionFilter]
    [SpiderFilter]
    public class SearchController : Controller
    {
        //
        // GET: /Search/

        public ActionResult Index()
        {
            
            return View();
        }

    }
}
