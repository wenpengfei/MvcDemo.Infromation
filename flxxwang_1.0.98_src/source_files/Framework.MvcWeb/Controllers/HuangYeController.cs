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
    public class HuangYeController :InfoController //Controller
    {
        //
        // GET: /Fenlei/HuangYe/

        public ActionResult Index()
        {
            ViewData["City"] = base.City;
            return View("Index");
        }
        #region 显示大类页面
        public ActionResult shenghuo()
        {
            ViewData["City"] = base.City;
            return View("shenghuo");//生活服务
        }
        public ActionResult shangwu()
        {
            ViewData["City"] = base.City;
            return View("shangwu");//商务服务
        }
        public ActionResult lvyouxiuxian()
        {
            ViewData["City"] = base.City;
            return View("lvyouxiuxian");//旅游/住宿
        }
        public ActionResult zhaoshang()
        {
            ViewData["City"] = base.City;
            return View("zhaoshang");//招商加盟
        }
        //public ActionResult weixiuzhuangziu()
        //{
        //    ViewData["City"] = base.City;
        //    return View("weixiuzhuangziu");//维修/装修
        //}
        #endregion

        #region List
        public ActionResult list()
        {
            base.InitList<YellowPage>();
            return View("list");
        }
        public ActionResult banjia()
        {
            return list();
            //return View("banjia");
        }
        public ActionResult baojie()
        {
            return list();
            //return View("baojie");
        }
        public ActionResult bgsbwx()
        {
            return list();
            //return View("bgsbwx");
        }
        public ActionResult caishui()
        {
            return list();
            //return View("caishui");
        }
        public ActionResult canyin()
        {
            return list();
            //return View("canyin");
        }
        public ActionResult chuanmei()
        {
            return list();
            //return View("chuanmei");
        }
        public ActionResult danbaobaoxiantouzi()
        {
            return list();
            //return View("danbaobaoxiantouzi");
        }
        public ActionResult jiadianweixiu()
        {
            return list();
            //return View("jiadianweixiu");
        }
        public ActionResult diannaoweixiu()
        {
            return list();
            //return View("diannaoweixiu");
        }
        public ActionResult dujia()
        {
            return list();
            //return View("dujia");
        }
        public ActionResult fangweixiu()
        {
            return list();
            //return View("fangweixiu");
        }
        public ActionResult fanyi()
        {
            return list();
            //return View("fanyi");
        }
        public ActionResult gangaotaiyou()
        {
            return list();
            //return View("gangaotaiyou");
        }
        public ActionResult chuguolvyou()
        {
            return list();
        }
        public ActionResult huishou()
        {
            return list();
            //return View("huishou");
        }
        public ActionResult hunqing()
        {
            return list();
            //return View("hunqing");
        }
        public ActionResult huoyun()
        {
            return list();
            //return View("huoyun");
        }
        public ActionResult huwaiyundong()
        {
            return list();
            //return View("huwaiyundong");
        }
        public ActionResult jdyd()
        {
            return list();
            //return View("jdyd");
        }
        public ActionResult jiajuweixiu()
        {
            return list();
            //return View("jiajuweixiu");
        }
        public ActionResult jiancai()
        {
            return list();
            //return View("jiancai");
        }
        public ActionResult yundongjianshen()
        {
            return list();
            //return View("yundongjianshen");
        }
        public ActionResult jiazheng()
        {
            return list();
            //return View("jiazheng");
        }
        public ActionResult kuaidi()
        {
            return list();
            //return View("kuaidi");
        }
        public ActionResult lipinxianhua()
        {
            return list();
            //return View("lipinxianhua");
        }
        public ActionResult lvshi()
        {
            return list();
            //return View("lvshi");
        }
        public ActionResult lvxingshe()
        {
            return list();
            //return View("lvxingshe");
        }
        public ActionResult guoneilvyou()
        {
            return list();
            //return View("guoneilvyou");
        }
        public ActionResult meifameiti()
        {
            return list();
            //return View("meifameiti");
        }
        public ActionResult penhui()
        {
            return list();
            //return View("penhui");
        }
        public ActionResult shejicehua()
        {
            return list();
            //return View("shejicehua");
        }
        public ActionResult qingdian()
        {
            return list();
            //return View("qingdian");
        }
        public ActionResult qitashenghuofuwu()
        {
            return list();
            //return View("qitashenghuofuwu");
        }
        public ActionResult shangbiaozhuanli()
        {
            return list();
            //return View("shangbiaozhuanli");
        }
        public ActionResult sheying()
        {
            return list();
            //return View("sheying");
        }
        public ActionResult shipin()
        {
            return list();
            //return View("shipin");
        }
        public ActionResult shutong()
        {
            return list();
            //return View("shutong");
        }
        public ActionResult shenghuopeisong()
        {
            return list();
            //return View("shenghuopeisong");
        }
        public ActionResult visa()
        {
            return list();
            //return View("visa");
        }
        public ActionResult wangzhan()
        {
            return list();
            //return View("wangzhan");
        }
        public ActionResult wuliu()
        {
            return list();
            //return View("wuliu");
        }
        public ActionResult wangluoweihu()
        {
            return list();
            //return View("wangluoweihu");
        }

        public ActionResult kouqiangmenzhen()
        {
            return list();
            //return View("yiliaobaojian_kouqiangmenzhen");
        }
        public ActionResult yankeyiyuan()
        {
            return list();
            //return View("yiliaobaojian_yankeyiyuan");
        }
        public ActionResult yiyuan()
        {
            return list();
            //return View("yiliaobaojian_yiyuan");
        }
        public ActionResult zhengxingmr()
        {
            return list();
            //return View("yiliaobaojian_zhengxingmr");
        }
        public ActionResult zhuankeyiyuan()
        {
            return list();
            //return View("yiliaobaojian_zhuankeyiyuan");
        }
        public ActionResult yinshua()
        {
            return list();
            //return View("yinshua");
        }
        public ActionResult yulexiuxian()
        {
            return list();
            //return View("yulexiuxian");
        }
        public ActionResult canyinjia()
        {
            return list();
            //return View("zhaoshang_canyinjia");
        }
        public ActionResult fuzhuangjia()
        {
            return list();
            //return View("zhaoshang_fuzhuangjia");
        }
        public ActionResult ganxijm()
        {
            return list();
            //return View("zhaoshang_ganxijm");
        }
        public ActionResult jiajuhuanbao()
        {
            return list();
            //return View("zhaoshang_jiajuhuanbao");
        }
        public ActionResult jiancaijm()
        {
            return list();
            //return View("zhaoshang_jiancaijm");
        }
        public ActionResult jiaoyujm()
        {
            return list();
            //return View("zhaoshang_jiaoyujm");
        }
        public ActionResult jixiejiagong()
        {
            return list();
            //return View("zhaoshang_jixiejiagong");
        }
        public ActionResult lipinshipin()
        {
            return list();
            //return View("zhaoshang_lipinshipin");
        }
        public ActionResult meirongbaojian()
        {
            return list();
            //return View("zhaoshang_meirongbaojian");
        }
        public ActionResult qitajiameng()
        {
            return list();
            //return View("zhaoshang_qitajiameng");
        }
        public ActionResult xiejm()
        {
            return list();
            //return View("zhaoshang_xiejm");
        }
        public ActionResult zhika()
        {
            return list();
            //return View("zhika");
        }
        public ActionResult zhoubianyou()
        {
            return list();
            //return View("zhoubianyou");
        }
        public ActionResult zhuangxiu()
        {
            return list();
            //return View("zhuangxiu");
        }
        public ActionResult zhuce()
        {
            return list();
            //return View("zhuce");
        }
        public ActionResult zixunfuwu()
        {
            return list();
            //return View("zixunfuwu");
        }
        public ActionResult zuche()
        {
            return list();
            //return View("zuche");
        }
        public ActionResult zulin()
        {
            return list();
            //return View("zulin");
        }
        public ActionResult bianmin()
        {
            return list();
        }
        #endregion

        #region Detail
        public ActionResult Detail(string city, string smallcategory, int? region, int? circle)
        {
            //string viewName = "detail_";
            //if (smallcategory == "kouqiangmenzhen"
            //    || smallcategory == "yankeyiyuan"
            //    || smallcategory == "yiyuan"
            //|| smallcategory == "zhengxingmr"
            //    || smallcategory == "zhuankeyiyuan"
            //    )
            //{
            //    viewName += "yiliaobaojian_";//医疗保健
            //}

            //if (smallcategory == "canyinjia"
            //    || smallcategory == "fuzhuangjia"
            //    || smallcategory == "ganxijm"
            //    || smallcategory == "jiajuhuanbao"
            //    || smallcategory == "jiancaijm"
            //    || smallcategory == "jiaoyuertong"
            //    || smallcategory == "jixiejiagong"
            //    || smallcategory == "lipinshipin"
            //    || smallcategory == "meirongbaojian"
            //    || smallcategory == "qitajiameng"
            //    || smallcategory == "xiejm")
            //{
            //    viewName += "zhaoshang_";//招商加盟
            //}
            //viewName += smallcategory;

            base.InitDetail<YellowPage>();
            return View("detail");
            //return View(viewName);
            
        }
        #endregion

        #region Post
        //[LoginFilter]
        [PostFilter]
        public ActionResult Post(string city, string smallcategory, int? region, int? circle)
        {
            //string viewName = "post_";
            //if (smallcategory == "kouqiangmenzhen"
            //    || smallcategory == "yankeyiyuan"
            //    || smallcategory == "yiyuan"
            //|| smallcategory == "zhengxingmr"
            //    || smallcategory == "zhuankeyiyuan"
            //    )
            //{
            //    viewName += "yiliaobaojian_";//医疗保健
            //}

            //if (smallcategory == "canyinjia"
            //    || smallcategory == "fuzhuangjia"
            //    || smallcategory == "ganxijm"
            //    || smallcategory == "jiajuhuanbao"
            //    || smallcategory == "jiancaijm"
            //    || smallcategory == "jiaoyuertong"
            //    || smallcategory == "jixiejiagong"
            //    || smallcategory == "lipinshipin"
            //    || smallcategory == "meirongbaojian"
            //    || smallcategory == "qitajiameng"
            //    || smallcategory == "xiejm")
            //{
            //    viewName += "zhaoshang_";//招商加盟
            //}
            //viewName += smallcategory;

            var viewName = "post";
            switch (smallcategory.ToLower())
            {
                case "fanyi":
                    viewName = "post_fanyi";
                    break;
                case "huoyun":
                    viewName = "post_huoyun";
                    break;
                case "zuche":
                    viewName = "post_zuche";
                    break;
                default:
                    break;
            }
            base.InitPost<YellowPage>();
            return View(viewName);
        }
        #endregion

        public ActionResult gsinfo(int Id)
        {
            return View();
        }
    }
}
