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
    public class ChongWuController :InfoController //Controller
    {
        //
        // GET: /Fenlei/ChongWu/

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
        public ActionResult cat()
        {
            return list<PetCat>();
        }
        public ActionResult cwhuwu()
        {
            return list<PetService>();
        }
        public ActionResult cwzengsong()
        {
            return list<PetGive>();
        }
        public ActionResult dog()
        {
            return list<PetDog>();
        }
        public ActionResult huaniao()
        {
            return list<PetBird>();
        }
        public ActionResult shipin()
        {
            return list<PetFood>();
        }
        #endregion

        #region Detail
        public ActionResult Detail(string city, string smallcategory, int? region, int? circle)
        {
            switch (smallcategory.ToLower())
            {
                case "dog":
                    base.InitDetail<PetDog>();
                    break;
                case "cat":
                    base.InitDetail<PetCat>();
                    break;
                case "huaniao":
                    base.InitDetail<PetBird>();
                    break;
                case "shipin":
                    base.InitDetail<PetFood>();
                    break;
                case "cwhuwu":
                    base.InitDetail<PetService>();
                    break;
                case "cwzengsong":
                    base.InitDetail<PetGive>();
                    break;
                default:
                    break;
            }
            return View("detail_" + smallcategory);
            //return View("detail");
        }
        public ActionResult detail_cat()
        {
            return View("detail_cat");
        }
        public ActionResult detail_cwhuwu()
        {
            return View("detail_cwhuwu");
        }
        public ActionResult detail_cwzengsong()
        {
            return View("detail_cwzengsong");
        }
        public ActionResult detail_dog()
        {
            return View("detail_dog");
        }
        public ActionResult detail_huaniao()
        {
            return View("detail_huaniao");
        }
        public ActionResult detail_shipin()
        {
            return View("detail_shipin");
        }
        #endregion

        #region Post
        //[LoginFilter]
        [PostFilter]
        public ActionResult Post(string city, string smallcategory, int? region, int? circle)
        {
            switch (smallcategory.ToLower())
            {
                case "dog":
                    base.InitPost<PetDog>();
                    break;
                case "cat":
                    base.InitPost<PetCat>();
                    break;
                case "huaniao":
                    base.InitPost<PetBird>();
                    break;
                case "shipin":
                    base.InitPost<PetFood>();
                    break;
                case "cwhuwu":
                    base.InitPost<PetService>();
                    break;
                case "cwzengsong":
                    base.InitPost<PetGive>();
                    break;
                default:
                    break;
            }
            return View("post_"+smallcategory);
        }
        #endregion
    }
}
