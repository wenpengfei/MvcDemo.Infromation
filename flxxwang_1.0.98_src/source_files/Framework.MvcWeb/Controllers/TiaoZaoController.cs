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
    public class TiaoZaoController :InfoController //Controller
    {
        // GET: /Fenlei/TiaoZao/
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
            //ActionInvoker.InvokeAction(this.ControllerContext, "renderlist");
            //ActionInvoker.InvokeAction(this.ControllerContext, "Powerby");
            //return new EmptyResult();
            return View("list");
        }
        public ActionResult bangong()
        {
            return list<SaleOffice>();
        }
        public ActionResult chengren()//不能去掉,会出现打不开页面不能申请广告.
        {
            //return list<SaleSex>();//暂时禁用.
            return list<SaleMobile>();
            //return Content("Sorry,您访问的页面不存在,<a href='/'>请点这里返回主页</a>");
        }
        public ActionResult diannao()
        {
            return list<SaleComputer>();
        }
        public ActionResult ershoujiaju()
        {
            return list<SaleHome>();
        }
        public ActionResult ershoushebei()
        {
            return list<SaleEquipment>();
        }
        public ActionResult fushi()
        {
            return list<SaleClothing>();
        }
        public ActionResult fuwujy()
        {
            return list<SaleService>();
        }
        public ActionResult huanwu()
        {
            return list<SaleSwap>();
        }
        public ActionResult jiadian()
        {
            return list<SaleElectric>();
        }
        public ActionResult meirong()
        {
            return list<SaleFacial>();
        }
        public ActionResult qita()
        {
            return list<SaleOther>();
        }
        public ActionResult shouji()
        {
            return list<SaleMobile>();
        }
        public ActionResult shoujihao()
        {
            return list<SaleMobileNumber>();
        }
        public ActionResult shuma()
        {
            return list<SaleDigital>();
        }
        public ActionResult tongxunyw()
        {
            return list<SaleCommunication>();
        }
        public ActionResult tushu()
        {
            return list<SaleBook>();
        }
        public ActionResult wangyou()
        {
            return list<SaleGame>();
        }
        public ActionResult wenti()
        {
            return list<SaleAthletics>();
        }
        public ActionResult yingyou()
        {
            return list<SaleBaby>();
        }
        public ActionResult yishu()
        {
            return list<SaleArt>();
        }
        #endregion List

        #region Detail
        public ActionResult Detail(string city, string smallcategory, int? region, int? circle)
        {
            if (smallcategory == "chengren")//暂时禁用chengren
            {
                smallcategory = "shouji";
            }
            switch (smallcategory.ToLower())
            {
                case "diannao":
                    base.InitDetail<SaleComputer>();
                    break;
                case "shouji":
                    base.InitDetail<SaleMobile>();
                    break;
                case "shoujihao":
                    base.InitDetail<SaleMobileNumber>();
                    break;
                case "shuma":
                    base.InitDetail<SaleDigital>();
                    break;
                case "tongxunyw":
                    base.InitDetail<SaleCommunication>();
                    break;
                case "bangong":
                    base.InitDetail<SaleOffice>();
                    break;
                case "jiadian":
                    base.InitDetail<SaleElectric>();
                    break;
                case "ershoujiaju":
                    base.InitDetail<SaleHome>();
                    break;
                case "yingyou":
                    base.InitDetail<SaleBaby>();
                    break;
                case "fushi":
                    base.InitDetail<SaleClothing>();
                    break;
                case "meirong":
                    base.InitDetail<SaleFacial>();
                    break;
                case "wenti":
                    base.InitDetail<SaleAthletics>();
                    break;
                case "tushu":
                    base.InitDetail<SaleBook>();
                    break;
                case "yishu":
                    base.InitDetail<SaleArt>();
                    break;
                case "wangyou":
                    base.InitDetail<SaleGame>();
                    break;
                case "ershoushebei":
                    base.InitDetail<SaleEquipment>();
                    break;
                case "chengren"://不能去掉,防止打不开页面不能申请广告.
                    //base.InitDetail<SaleSex>();//暂时禁用
                    base.InitDetail<SaleMobile>();
                    //return Content("Sorry,您访问的页面不存在,<a href='/'>请点这里返回主页</a>");
                    break;
                case "huanwu":
                    base.InitDetail<SaleSwap>();
                    break;
                case "fuwujy":
                    base.InitDetail<SaleService>();
                    break;
                case "wuyuanwupin":
                    //base.InitDetail<>();
                    break;
                case "ershoufree":
                    //base.InitDetail<>();
                    break;
                case "xiaoyuan":
                    //base.InitDetail<>();
                    break;
                case "qita":
                    base.InitDetail<SaleOther>();
                    break;
                default:
                    break;
            }
            return View("detail_" + smallcategory);
            //return View("detail");
        }
        #endregion

        #region Post
        [PostFilter]
        public ActionResult Post(string city, string smallcategory, int? region, int? circle)
        {
            if (smallcategory == "chengren")//暂时禁用chengren
            {
                smallcategory = "shouji";
            }
            switch (smallcategory.ToLower())
            {
                case "diannao":
                    base.InitPost<SaleComputer>();
                    break;
                case "shouji":
                    base.InitPost<SaleMobile>();
                    break;
                case "shoujihao":
                    base.InitPost<SaleMobileNumber>();
                    break;
                case "shuma":
                    base.InitPost<SaleDigital>();
                    break;
                case "tongxunyw":
                    base.InitPost<SaleCommunication>();
                    break;
                case "bangong":
                    base.InitPost<SaleOffice>();
                    break;
                case "jiadian":
                    base.InitPost<SaleElectric>();
                    break;
                case "ershoujiaju":
                    base.InitPost<SaleHome>();
                    break;
                case "yingyou":
                    base.InitPost<SaleBaby>();
                    break;
                case "fushi":
                    base.InitPost<SaleClothing>();
                    break;
                case "meirong":
                    base.InitPost<SaleFacial>();
                    break;
                case "wenti":
                    base.InitPost<SaleAthletics>();
                    break;
                case "tushu":
                    base.InitPost<SaleBook>();
                    break;
                case "yishu":
                    base.InitPost<SaleArt>();
                    break;
                case "wangyou":
                    base.InitPost<SaleGame>();
                    break;
                case "ershoushebei":
                    base.InitPost<SaleEquipment>();
                    break;
                case "chengren"://不能去掉,防止打不开页面不能申请广告.
                    //base.InitPost<SaleSex>();
                    base.InitPost<SaleMobile>();
                    //return Content("Sorry,您访问的页面不存在,<a href='/'>请点这里返回主页</a>");
                    break;
                case "huanwu":
                    base.InitPost<SaleSwap>();
                    break;
                case "fuwujy":
                    base.InitPost<SaleService>();
                    break;
                case "wuyuanwupin":
                    //base.InitPost<>();
                    break;
                case "ershoufree":
                    //base.InitPost<>();
                    break;
                case "xiaoyuan":
                    //base.InitPost<>();
                    break;
                case "qita":
                    base.InitPost<SaleOther>();
                    break;
                default:
                    break;
            }
            return View("post_"+smallcategory);
        }
        #endregion
    }
}
