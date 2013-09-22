using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Framework.Common;
using Infomation.Core;
using Framework.Utility;
using Framework.Extensions;
using Infomation.Core.Mvc;


namespace Framework.MvcWeb.Controllers
{
    [ExceptionFilter]
    [SpiderFilter]
    public class QiuZhiController :InfoController //Controller
    {
        //
        // GET: /Fenlei/QiuZhi/

        public ActionResult Index()
        {
            ViewData["City"] = base.City;
            return View();
        }
        public ActionResult jianzhi()
        {
            ViewData["City"] = base.City;
            return View();
        }


        #region List
        public ActionResult list()
        {
            base.InitList<JobSeek>();
            return View("list");
        }

        public ActionResult caiwushenji()
        {
            return list();
            //return View("caiwushenji");
        }
        public ActionResult chaoshishangye()
        {
            return list();
            //return View("chaoshishangye");
        }
        public ActionResult falvzixun()
        {
            return list();
            //return View("falvzixun");
        }
        public ActionResult fangchanjianzhu()
        {
            return list();
            //return View("fangchanjianzhu");
        }
        public ActionResult fanyi()
        {
            return list();
            //return View("fanyi");
        }
        public ActionResult guanggao()
        {
            return list();
            //return View("guanggao");
        }
        public ActionResult jianzhicaiwu()
        {
            return list();
            //return View("jianzhicaiwu");
        }
        public ActionResult jianzhicanyinfuwu()
        {
            return list();
            //return View("jianzhicanyinfuwu");
        }

        public ActionResult jianzhijiagongzhizuo()
        {
            return list();
            //return View("jianzhijiagongzhizuo");
        }
        public ActionResult jianzhijiaoyupeixun()
        {
            return list();
            //return View("jianzhijiaoyupeixun");
        }
        public ActionResult jianzhijisuanji()
        {
            return list();
            //return View("jianzhijisuanji");
        }
        public ActionResult jianzhikefushichang()
        {
            return list();
            //return View("jianzhikefushichang");
        }
        public ActionResult jianzhiliyiyanyi()
        {
            return list();
            //return View("jianzhiliyiyanyi");
        }
        public ActionResult jianzhiqita()
        {
            return list();
            //return View("jianzhiqita");
        }
        public ActionResult jianzhixiaoshoucuxiao()
        {
            return list();
            //return View("jianzhixiaoshoucuxiao");
        }
        public ActionResult jianzhixuesheng()
        {
            return list();
            //return View("jianzhixuesheng");
        }
        public ActionResult jianzhiyuyanwenzi()
        {
            return list();
            //return View("jianzhiyuyanwenzi");
        }
        public ActionResult jiaoyupeixun()
        {
            return list();
            //return View("jiaoyupeixun");
        }
        public ActionResult jiazhengbaojie()
        {
            return list();
            //return View("jiazhengbaojie");
        }
        public ActionResult jinrongbaoxian()
        {
            return list();
            //return View("jinrongbaoxian");
        }
        public ActionResult jinrongtouzi()
        {
            return list();
            //return View("jinrongtouzi");
        }
        public ActionResult jixieyiqi()
        {
            return list();
            //return View("jixieyiqi");
        }
        public ActionResult kefu()
        {
            return list();
            //return View("kefu");
        }
        public ActionResult lvyoujiudian()
        {
            return list();
            //return View("lvyoujiudian");
        }
        public ActionResult meirongjianshen()
        {
            return list();
            //return View("meirongjianshen");
        }
        public ActionResult qiche()
        {
            return list();
            //return View("qiche");
        }
        public ActionResult jisuanji()
        {
            return list();
        }
        public ActionResult qita()
        {
            return list();
            //return View("qita");
        }
        public ActionResult renli()
        {
            return list();
            //return View("renli");
        }
        public ActionResult shangwumaoyi()
        {
            return list();
            //return View("shangwumaoyi");
        }
        public ActionResult shengchankaifa()
        {
            return list();
            //return View("shengchankaifa");
        }
        public ActionResult shichang()
        {
            return list();
            //return View("shichang");
        }
        public ActionResult siji()
        {
            return list();
            //return View("siji");
        }
        public ActionResult tech()
        {
            return list();
            //return View("tech");
        }
        public ActionResult wentiyingshi()
        {
            return list();
            //return View("wentiyingshi");
        }
        public ActionResult wuliucangchu()
        {
            return list();
            //return View("wuliucangchu");
        }
        public ActionResult xiezuochuban()
        {
            return list();
            //return View("xiezuochuban");
        }
        public ActionResult yewu()
        {
            return list();
            //return View("yewu");
        }
        public ActionResult yiyuanyiliao()
        {
            return list();
            //return View("yiyuanyiliao");
        }
        #endregion

        #region Detail
        public ActionResult Detail(string city, string smallcategory, int? region, int? circle)
        {
            bool ShowContactInfo = false;
            var strUserId = CookieManager.GetCookie("userId");
            if (!string.IsNullOrWhiteSpace(strUserId))
            {
                var UserId=Convert.ToInt32(strUserId);
                var jobSeekId =Convert.ToInt32(this.RouteData.Values["Id"]);
                var job = JobSeek.Select(jobSeekId);
                var favorite = ResumeFavorite.SelectAllByUserId(UserId).FirstOrDefault(item=>item.ResumeId==job.Resume.Id);
                if (favorite != null)//如果用户已下载该简历，则显示联系方式.
                {
                    ShowContactInfo = true;
                }
            }
            this.ViewData["Favorite"] = ShowContactInfo;
            base.InitDetail<JobSeek>();
            return View("detail");
            //return View("detail_" + smallcategory);
        }
        
        #endregion

        #region Post
        //[LoginFilter]
        [PostFilter]
        public ActionResult Post(string city, string smallcategory, int? region, int? circle)
        {
            var WorkType = Infomation.Core.WorkType.Full;
            if (smallcategory.StartsWith("jianzhi",StringComparison.OrdinalIgnoreCase))
            {
                WorkType = Infomation.Core.WorkType.Part;
            }
            this.ViewData["WorkType"] = WorkType;

            base.InitPost<JobSeek>();
            return View("post");
            //return View("post_" + smallcategory);
        }
        #endregion
    }
}
