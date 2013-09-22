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
    public class JiaoYouController :InfoController //Controller
    {
        //
        // GET: /Fenlei/JiaoYou/

        public ActionResult Index()
        {
            ViewData["City"] = base.City;
            return View();
        }

        #region List
        public ActionResult list<TModel>()
            where TModel : InfoBase<TModel>, new()
        {
            base.InitList<TModel>();
            return View("list");
        }
        public ActionResult huodong()
        {
            return list<FriendActivity>();
        }
        public ActionResult jinengjiaohuan()
        {
            return list<FriendSkill>();
        }
        public ActionResult laoxiang()
        {
            return list<FriendHome>();
        }
        public ActionResult nvyou()
        {
            return list<FriendSex>();
        }
        public ActionResult xingqu()
        {
            return list<FriendInterest>();
        }
        #endregion

        #region Detail
        public ActionResult Detail(string city, string smallcategory, int? region, int? circle)
        {
            switch (smallcategory.ToLower())
            {
                case "nvyou":
                    base.InitDetail<FriendSex>();
                    break;
                case "xingqu":
                    base.InitDetail<FriendInterest>();
                    break;
                case "laoxiang":
                    base.InitDetail<FriendHome>();
                    break;
                case "jinengjiaohuan":
                    base.InitDetail<FriendSkill>();
                    break;
                case "huodong":
                    base.InitDetail<FriendActivity>();
                    break;
                default:
                    break;
            }
            //return View("detail");
            return View("detail_" + smallcategory);
        }
        #endregion

        #region Post
        //[LoginFilter]
        [PostFilter]
        public ActionResult Post(string city, string smallcategory, int? region, int? circle)
        {
            switch (smallcategory.ToLower())
            {
                case "nvyou":
                    base.InitPost<FriendSex>();
                    break;
                case "xingqu":
                    base.InitPost<FriendInterest>();
                    break;
                case "laoxiang":
                    base.InitPost<FriendHome>();
                    break;
                case "jinengjiaohuan":
                    base.InitPost<FriendSkill>();
                    break;
                case "huodong":
                    base.InitPost<FriendActivity>();
                    break;
                default:
                    break;
            }
            return View("post_"+smallcategory);
        }
        #endregion
    }
}
