using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Framework.Utility;
using Infomation.Core;
using Infomation.Core.Mvc;


namespace Framework.MvcWeb.Controllers
{
    [ExceptionFilter]
    [SpiderFilter]
    public class JobController : Controller
    {
        //
        // GET: /Fenlei/Job/

        //public ActionResult Index()
        //{
        //    return View();
        //}
        [LoginFilter]
        public ActionResult xuanzejianli()//发送求职申请时选择简历
        {
            var userid = Convert.ToInt32(CookieManager.GetCookie("userId"));
            var resumes = Resume.SelectAllByUserId(userid);
            return View(resumes);
        }
        [LoginFilter]
        public ActionResult sendinvite(object values)//发送面试邀请
        {
            var jobSeekId = Convert.ToInt32(values);
            var job = JobSeek.Select(jobSeekId);
            var userid=Convert.ToInt32(CookieManager.GetCookie("userId"));
            this.ViewData["Company"] = Company.Select(item=>item.UserId==userid);
            return View(job);
        }
        [LoginFilter]
        public ActionResult resumefavorite(object values)
        {
            var resumeId = Convert.ToInt32(values);
            var resume = Resume.Select(resumeId);
            return View(resume);
        }
    }
}
