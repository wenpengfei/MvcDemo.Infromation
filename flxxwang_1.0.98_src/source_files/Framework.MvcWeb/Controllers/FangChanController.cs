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
    public class FangChanController :InfoController //Controller
    {
        //
        // GET: /Fenlei/FangChan/

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
        public ActionResult duanzu()
        {
            return list<HouseShort>();
        }
        public ActionResult ershoufang()
        {
            return list<HouseSecond>();
        }
        public ActionResult zufang()
        {
            return list<HouseRent>();
        }
        public ActionResult hezu()
        {
            return list<HouseShare>();
        }
        public ActionResult bed()
        {
            return list<HouseBed>();
        }
        public ActionResult qita()
        {
            return list<HouseOther>();
        }
        public ActionResult qiuzu()
        {
            return list<HouseHire>();
        }
        public ActionResult shangpu()
        {
            return list<HouseShop>();
        }
        public ActionResult xiezilou()
        {
            return list<HouseOffice>();
        }
        #endregion

        #region Detail
        public ActionResult Detail(string city, string smallcategory, int? region, int? circle)
        {
            switch (smallcategory.ToLower())
            {
                case "zufang":
                    base.InitDetail<HouseRent>();
                    break;
                case "hezu":
                    base.InitDetail<HouseShare>();
                    break;
                case "bed":
                    base.InitDetail<HouseBed>();
                    break;
                case "qiuzu":
                    base.InitDetail<HouseHire>();
                    break;
                case "duanzu":
                    base.InitDetail<HouseShort>();
                    break;
                case "ershoufang":
                    base.InitDetail<HouseSecond>();
                    break;
                case "xiezilou":
                    base.InitDetail<HouseOffice>();
                    break;
                case "shangpu":
                    base.InitDetail<HouseShop>();
                    break;
                case "qita":
                    base.InitDetail<HouseOther>();
                    break;
                case "yws":
                    //base.InitDetail<>();
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
                case "zufang":
                    base.InitPost<HouseRent>();
                    break;
                case "hezu":
                    base.InitPost<HouseShare>();
                    break;
                case "bed":
                    base.InitPost<HouseBed>();
                    break;
                case "qiuzu":
                    base.InitPost<HouseHire>();
                    break;
                case "duanzu":
                    base.InitPost<HouseShort>();
                    break;
                case "ershoufang":
                    base.InitPost<HouseSecond>();
                    break;
                case "xiezilou":
                    base.InitPost<HouseOffice>();
                    break;
                case "shangpu":
                    base.InitPost<HouseShop>();
                    break;
                case "qita":
                    base.InitPost<HouseOther>();
                    break;
                case "yws":
                    //base.InitPost<>();
                    break;
                default:
                    break;
            }
            return View("post_"+smallcategory);
        }
        //public ActionResult post_duanzu()
        //{
        //    return View("post_duanzu");
        //}
        //public ActionResult post_ershoufang()
        //{
        //    return View("post_ershoufang");
        //}
        //public ActionResult post_hezu()
        //{
        //    return View("post_hezu");
        //}
        //public ActionResult post_qita()
        //{
        //    return View("post_qita");
        //}
        //public ActionResult post_qiuzu()
        //{
        //    return View("post_qiuzu");
        //}
        //public ActionResult post_shangpu()
        //{
        //    return View("post_shangpu");
        //}
        //public ActionResult post_xiezilou()
        //{
        //    return View("post_xiezilou");
        //}
        //public ActionResult post_zufang()
        //{
        //    return View("post_zufang");
        //}  
        #endregion
    }
}
