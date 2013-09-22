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
    public class PiaoWuController :InfoController //Controller
    {
        //
        // GET: /Fenlei/PiaoWu/

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
        public ActionResult huochepiao()
        {
            return list<TicketTrain>();
        }
        public ActionResult jipiao()
        {
            return list<TicketAirplane>();
        }
        public ActionResult kaquan()
        {
            return list<TicketCard>();
        }
        public ActionResult piao()
        {
            return list<TicketPerform>();
        }
        public ActionResult qtpiaowu()
        {
            return list<TicketOther>();
        }
        public ActionResult youle()
        {
            return list<TicketPleasure>();
        }
        #endregion

        #region Detail

        public ActionResult Detail(string city, string smallcategory, int? region, int? circle)
        {
            switch (smallcategory.ToLower())
            {
                case "huochepiao":
                    base.InitDetail<TicketTrain>();
                    break;
                case "jipiao":
                    base.InitDetail<TicketAirplane>();
                    break;
                //case "":
                //base.InitDetail<>();
                //break;
                //case "":
                //base.InitDetail<>();
                //break;
                case "piao":
                    base.InitDetail<TicketPerform>();
                    break;
                case "kaquan":
                    base.InitDetail<TicketCard>();
                    break;
                case "youle":
                    base.InitDetail<TicketPleasure>();
                    break;
                case "qtpiaowu":
                    base.InitDetail<TicketOther>();
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
                case "huochepiao":
                    base.InitPost<TicketTrain>();
                    break;
                case "jipiao":
                    base.InitPost<TicketAirplane>();
                    break;
                //case "":
                //base.InitPost<>();
                //break;
                //case "":
                //base.InitPost<>();
                //break;
                case "piao":
                    base.InitPost<TicketPerform>();
                    break;
                case "kaquan":
                    base.InitPost<TicketCard>();
                    break;
                case "youle":
                    base.InitPost<TicketPleasure>();
                    break;
                case "qtpiaowu":
                    base.InitPost<TicketOther>();
                    break;
                default:
                    break;
            }
            return View("post_"+smallcategory);
        }
        #endregion
    }
}
