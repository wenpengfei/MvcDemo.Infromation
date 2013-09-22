using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Framework.Utility;
using Framework.Web.Script.Serialization;
using Infomation.Core;
using System.Web.Security;
using Framework.Extensions;
using Infomation.Core.Mvc;


namespace Framework.MvcWeb.Controllers
{
    [ExceptionFilter]
    [SpiderFilter]
    public class MyController : Controller
    {
        //
        // GET: /Fenlei/My/
        [LoginFilter]
        public ActionResult Index()
        {
            var userid = Convert.ToInt32(CookieManager.GetCookie("userId"));
            var user = Infomation.Core.User.Select(userid);
            this.ViewData["User"] = user;
            return View("Index");
        }
        [LoginFilter]
        public ActionResult xinxiguanli()
        {
            return Index();
        }
        [LoginFilter]
        public ActionResult infocheck()
        {
            return Index();
        }
        [LoginFilter]
        public ActionResult infodelete()
        {
            return Index();
        }
        [LoginFilter]
        public ActionResult jianli()
        {
            return View();
        }
        [LoginFilter]
        public ActionResult gongsiziliao()
        {
            return View();
        }
        [LoginFilter]
        public ActionResult fasongmianshi()
        {
            return View();
        }
        [LoginFilter]
        public ActionResult yixiazaijianli()
        {
            return View();
        }
        [LoginFilter]
        public ActionResult mima()//修改密码
        {
            var userid = Convert.ToInt32(CookieManager.GetCookie("userId"));
            var user = Infomation.Core.User.Select(userid);
            return View(user);
        }
        [LoginFilter]
        public ActionResult renzheng()
        {
            return View();
        }
        [LoginFilter]
        public ActionResult xinyong()
        {
            return View();
        }
        [LoginFilter]
        public ActionResult haoyou()
        {
            return View();
        }
        [LoginFilter]
        public ActionResult jifen()
        {
            return View();
        }

        [LoginFilter]
        public ActionResult zhanghuyue()
        {
            return View();
        }
        [LoginFilter]
        public ActionResult yuemingxi()
        {
            return View();
        }
        [LoginFilter]
        public ActionResult yuechongzhi()
        {
            return View();
        }

        #region iframe中显示
        [LoginFilter]
        public ActionResult resuelist()
        {
            var list = new List<Resume>();
            var useridCookie = CookieManager.GetCookie("userId");
            if (!string.IsNullOrWhiteSpace(useridCookie))
            {
                int UserId = Convert.ToInt32(useridCookie);
                list= Resume.SelectAllByUserId(UserId);
            }
            return View(list);
        }
        [LoginFilter]
        public ActionResult myresume()
        {
            Resume resume = null;
            var useridCookie = CookieManager.GetCookie("userId");
            if (!string.IsNullOrWhiteSpace(useridCookie))
            {
                int UserId = Convert.ToInt32(useridCookie);
                var resumes = Resume.SelectAllByUserId(UserId);
                resume = resumes.FirstOrDefault(item => item.ResumeType == WorkType.Full);

                var user = Infomation.Core.User.Select(UserId);
                this.ViewData["User"] = user;
                //this.ViewData["Birthday"] = JsonHelper.Serialize(user.Profile.Common.Birthday);
            }
            return View(resume);
        }
        [LoginFilter]
        public ActionResult mypartresume()
        {
            return View();
        }
        [LoginFilter]
        public ActionResult companyinfo()
        {
            Company company = new Company();
            var userIdCookie = CookieManager.GetCookie("userId");
            if (!string.IsNullOrWhiteSpace(userIdCookie))
            {
                company = Company.Select(item => item.UserId == Convert.ToInt32(userIdCookie));
            }
            if (company == null)
            {
                company = new Company()
                {
                    Id=-1
                };
            }
            return View(company);
        }
        [LoginFilter]
        public ActionResult invitesendedlist()//已发送的面试邀请
        {
            var userid=Convert.ToInt32(CookieManager.GetCookie("userId"));
            var list=Interview.SelectAllByUserId(userid);
            return View(list);
        }
        [LoginFilter]
        public ActionResult favoriteresumelist()//已下载简历
        {
            var userid = Convert.ToInt32(CookieManager.GetCookie("userId"));
            var list = ResumeFavorite.SelectAllByUserId(userid);
            return View(list);
        }
        [LoginFilter]
        public ActionResult applypositionhistory()
        {//简历投递记录.
            var userid = Convert.ToInt32(CookieManager.GetCookie("userId"));
            var jobApplyList = JobApply.SelectAllByUserId(userid);
            return View(jobApplyList);
        }
        #endregion

        public ActionResult reg()
        {
            return View();
        }
        public ActionResult login()
        {
            return View("_login");
        }
        public ActionResult PopLogin()
        {
            return View();
        }
        public ActionResult PopReg()
        {
            return View();
        }
        public ActionResult postedresume()
        {
            return View();
        }
        public ActionResult postedpartresume()
        {
            return View();
        }
        
    }
}
