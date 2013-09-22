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
    public class JiaoYuController :InfoController// Controller
    {
        //
        // GET: /Fenlei/JiaoYu/

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
        public ActionResult fudao()
        {
            return list<EduTutor>();
        }
        public ActionResult jisuanji()
        {
            return list<EduIT>();
        }
        public ActionResult liuxue()
        {
            return list<EduAbroad>();
        }
        public ActionResult mba()
        {
            return list<EduMBA>();
        }
        public ActionResult peixunqita()
        {
            return list<EduOther>();
        }
        public ActionResult shejipeixun()
        {
            return list<EduDesign>();
        }
        public ActionResult techang()
        {
            return list<EduSpecial>();
        }
        public ActionResult waiyu()
        {
            return list<EduLanguage>();
        }
        public ActionResult xueli()
        {
            return list<EduEducation>();
        }
        public ActionResult youjiao()
        {
            return list<EduBaby>();
        }
        public ActionResult zhiyepeix()
        {
            return list<EduProfession>();
        }
        #endregion

        #region Detail
        public ActionResult Detail(string city, string smallcategory, int? region, int? circle)
        {
            switch (smallcategory.ToLower())
            {
                case "fudao":
                    base.InitDetail<EduTutor>();
                    break;
                case "liuxue":
                    base.InitDetail<EduAbroad>();
                    break;
                //case "":
                //base.InitDetail<>();
                //break;
                //case "":
                //base.InitDetail<>();
                //break;
                case "youjiao":
                    base.InitDetail<EduBaby>();
                    break;
                case "waiyu":
                    base.InitDetail<EduLanguage>();
                    break;
                case "xueli":
                    base.InitDetail<EduEducation>();
                    break;
                case "zhiyepeix":
                    base.InitDetail<EduProfession>();
                    break;
                case "jisuanji":
                    base.InitDetail<EduIT>();
                    break;
                case "shejipeixun":
                    base.InitDetail<EduDesign>();
                    break;
                case "mba":
                    base.InitDetail<EduMBA>();
                    break;
                case "techang":
                    base.InitDetail<EduSpecial>();
                    break;
                case "peixunqita":
                    base.InitDetail<EduOther>();
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
                case "fudao":
                    base.InitPost<EduTutor>();
                    break;
                case "liuxue":
                    base.InitPost<EduAbroad>();
                    break;
                //case "":
                //base.InitPost<>();
                //break;
                //case "":
                //base.InitPost<>();
                //break;
                case "youjiao":
                    base.InitPost<EduBaby>();
                    break;
                case "waiyu":
                    base.InitPost<EduLanguage>();
                    break;
                case "xueli":
                    base.InitPost<EduEducation>();
                    break;
                case "zhiyepeix":
                    base.InitPost<EduProfession>();
                    break;
                case "jisuanji":
                    base.InitPost<EduIT>();
                    break;
                case "shejipeixun":
                    base.InitPost<EduDesign>();
                    break;
                case "mba":
                    base.InitPost<EduMBA>();
                    break;
                case "techang":
                    base.InitPost<EduSpecial>();
                    break;
                case "peixunqita":
                    base.InitPost<EduOther>();
                    break;
                default:
                    break;
            }
            return View("post_"+smallcategory);
        }
        #endregion
    }
}
