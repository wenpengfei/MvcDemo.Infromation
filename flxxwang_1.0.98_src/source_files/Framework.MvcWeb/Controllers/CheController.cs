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
    public class CheController :InfoController //Controller
    {
        //
        // GET: /Fenlei/Che/

        public ActionResult Index()
        {
            ViewData["City"] = base.City;
            return View("Index");
        }

        #region List
        public ActionResult list<TModel>()
            where TModel : InfoBase<TModel>, new()
        {
            base.InitList<TModel>();
            return View("list");
        }
        public ActionResult cheliangfuwu()
        {
            return list<CarService>();
        }
        public ActionResult danche()
        {
            return list<CarMotor>();
        }
        public ActionResult ershouche()
        {
            return list<CarSecondHand>();
        }
        public ActionResult ershoucheqg()
        {
            return list<CarBuy>();
        }
        public ActionResult peijia()
        {
            return list<CarAccompany>();
        }
        public ActionResult peijian()
        {
            return list<CarFitting>();
        }
        public ActionResult pinche()
        {
            return list<Carpool>();
        }
        public ActionResult qita()
        {
            return list<CarOther>();
        }
        public ActionResult zixingche()
        {
            return list<CarBicycle>();
        }
        //public ActionResult zuche()//租车已放入黄页中.
        //{
        //    return list<CarRent>();
        //}
        #endregion

        #region Detail
        public ActionResult Detail(string city, string smallcategory, int? region, int? circle)
        {
            switch (smallcategory.ToLower())
            {
                case "ershouche":
                    base.InitDetail<CarSecondHand>();
                    break;
                case "ershoucheqg":
                    base.InitDetail<CarBuy>();
                    break;
                case "pinche":
                    base.InitDetail<Carpool>();
                    break;
                case "danche":
                    base.InitDetail<CarMotor>();
                    break;
                case "zixingche":
                    base.InitDetail<CarBicycle>();
                    break;
                case "peijian":
                    base.InitDetail<CarFitting>();
                    break;
                case "cheliangfuwu":
                    base.InitDetail<CarService>();
                    break;
                //case "zuche"://租车已移到黄页
                //    base.InitDetail<CarRent>();
                //    break;
                case "peijia":
                    base.InitDetail<CarAccompany>();
                    break;
                case "qita":
                    base.InitDetail<CarOther>();
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
                case "ershouche":
                    base.InitPost<CarSecondHand>();
                    break;
                case "ershoucheqg":
                    base.InitPost<CarBuy>();
                    break;
                case "pinche":
                    base.InitPost<Carpool>();
                    break;
                case "danche":
                    base.InitPost<CarMotor>();
                    break;
                case "zixingche":
                    base.InitPost<CarBicycle>();
                    break;
                case "peijian":
                    base.InitPost<CarFitting>();
                    break;
                case "cheliangfuwu":
                    base.InitPost<CarService>();
                    break;
                //case "zuche"://租车已放入黄页中
                //    base.InitPost<CarRent>();
                //    break;
                case "peijia":
                    base.InitPost<CarAccompany>();
                    break;
                case "qita":
                    base.InitPost<CarOther>();
                    break;
                default:
                    break;
            }
            return View("post_" + smallcategory);
        }
        #endregion
    }
}
