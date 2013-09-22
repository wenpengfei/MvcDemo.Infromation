using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Infomation.Core;
using Infomation.Core.Mvc;

namespace Framework.MvcWeb.Controllers
{
    [ExceptionFilter]
    [SpiderFilter]
    public class ZhaoPinController :InfoController// Controller
    {
        //
        // GET: /Fenlei/ZhaoPin/

        public ActionResult Index()
        {
            ViewData["City"] = base.City;
            return View();
        }

        #region List
        public ActionResult list()
        {
            base.InitList<Recruit>();
            return View("list");
        }
        public ActionResult caiwushenji()
        {
            return list();
        }
        public ActionResult chaoshishangye()
        {
            return list();
        }
        public ActionResult falvzixun()
        {
            return list();
        }
        public ActionResult fangchanjianzhu()
        {
            return list();
        }
        public ActionResult fanyi()
        {
            return list();
        }
        public ActionResult guanggao()
        {
            return list();
        }
        public ActionResult jianzhicaiwu()
        {
            return list();
        }
        public ActionResult jianzhicanyinfuwu()
        {
            return list();
        }

        public ActionResult jianzhijiagongzhizuo()
        {
            return list();
        }
        public ActionResult jianzhijiaoyupeixun()
        {
            return list();
        }
        public ActionResult jianzhijisuanji()
        {
            return list();
        }
        public ActionResult jianzhikefushichang()
        {
            return list();
        }
        public ActionResult jianzhiliyiyanyi()
        {
            return list();
        }
        public ActionResult jianzhiqita()
        {
            return list();
        }
        public ActionResult jianzhixiaoshoucuxiao()
        {
            return list();
        }
        public ActionResult jianzhixuesheng()
        {
            return list();
        }
        public ActionResult jianzhipingmian()
        {
            return list();
        }
        public ActionResult jianzhiyuyanwenzi()
        {
            return list();
        }
        public ActionResult jiaoyupeixun()
        {
            return list();
        }
        public ActionResult jiazhengbaojie()
        {
            return list();
        }
        public ActionResult jinrongbaoxian()
        {
            return list();
        }
        public ActionResult jinrongtouzi()
        {
            return list();
        }
        public ActionResult jixieyiqi()
        {
            return list();
        }
        public ActionResult kefu()
        {
            return list();
        }
        public ActionResult lvyoujiudian()
        {
            return list();
        }
        public ActionResult meirongjianshen()
        {
            return list();
        }
        public ActionResult qiche()
        {
            return list();
        }
        public ActionResult jisuanji()
        {
            return list();
        }
        public ActionResult qita()
        {
            return list();
        }
        public ActionResult renli()
        {
            return list();
        }
        public ActionResult shangwumaoyi()
        {
            return list();
        }
        public ActionResult shengchankaifa()
        {
            return list();
        }
        public ActionResult shichang()
        {
            return list();
        }
        public ActionResult siji()
        {
            return list();
        }
        public ActionResult tech()
        {
            return list();
        }
        public ActionResult wentiyingshi()
        {
            return list();
        }
        public ActionResult wuliucangchu()
        {
            return list();
        }
        public ActionResult xiezuochuban()
        {
            return list();
        }
        public ActionResult yewu()
        {
            return list();
        }
        public ActionResult yiyuanyiliao()
        {
            return list();
        }
        #endregion

        #region Detail
        public ActionResult Detail(string city, string smallcategory, int? region, int? circle)
        {
            base.InitDetail<Recruit>();
            return View("detail");
            //return View("detail_" + smallcategory);
        }
        #endregion

        #region Post
        [PostFilter]
        public ActionResult Post(string city, string smallcategory, int? region, int? circle)
        {            
            var WorkType = Infomation.Core.WorkType.Full;
            if (smallcategory.StartsWith("jianzhi", StringComparison.OrdinalIgnoreCase))
            {
                WorkType = Infomation.Core.WorkType.Part;
            }
            this.ViewData["WorkType"] = WorkType;

            base.InitPost<Recruit>();
            return View("post");
            //return View("post_"+smallcategory);
        }
        #endregion
    }
}
