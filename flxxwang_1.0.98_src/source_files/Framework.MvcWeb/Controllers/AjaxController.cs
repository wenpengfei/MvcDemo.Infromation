using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Infomation.Core;
using System.Web.Script.Serialization;
using System.Runtime.Serialization.Json;
using Framework.Web.Script.Serialization;
using System.Web.Security;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Framework.Data;
using System.Data.Common;
using System.Reflection;
using Infomation.Core.Mvc;

namespace Framework.MvcWeb.Controllers
{
    [ExceptionFilter]
    public class AjaxController : Controller
    {
        protected override JsonResult Json(object data, string contentType, System.Text.Encoding contentEncoding, JsonRequestBehavior behavior)
        {
            //参考System.Web.Mvc.Controller编写,解决系列化时出现循环引用、系列化DataTable、系列化DataSet.
            return new Framework.Web.Mvc.JsonResult
            {
                Data = data,
                ContentType = contentType,
                ContentEncoding = contentEncoding,
                JsonRequestBehavior = behavior
            };
        }

        [HttpPost]
        public JsonResult Index()
        {

            var json = Request.Params["json"];
            var method = Request.Params["m"];
            var param = Request.Params["p"];
            var paramArray = JsonHelper.Deserialize<object[]>(param);
            var Instance = JsonHelper.Deserialize(json);
            if (Instance != null)
            {
                Type type = Instance.GetType();
                //设置筛选标志
                BindingFlags bflags = BindingFlags.Public | BindingFlags.Instance | BindingFlags.InvokeMethod | BindingFlags.Static;

                var obj = type.InvokeMember(method, bflags, null, Instance, paramArray);

                //var jsonResult = JsonHelper.Serialize(obj);
                
                return Json(obj);
            }
            return Json("error");
        }
        [HttpPost]
        public ActionResult db()
        {
            string commandText = Request.Params["cmd"];
            string option = Request.Params["option"];
            var t = Membership.Providers;
            //var tt = JsonHelper.Serialize(new object[]{1,2,"a","b"});
            //var bb = JsonHelper.Deserialize<object[]>(tt);
            Database db = DatabaseManager.CreateDatabase();
            DbCommand cmd = db.GetSqlStringCommand(commandText);
            if (option == "1")
            {
                var count = db.ExecuteNonQuery(cmd);
                return Json(count);
            }
            if (option == "2")
            {
                var result = db.ExecuteScalar(cmd);
                return Json(result);
            }
            if (option == "3")
            {
                var dt = db.ExecuteDataSet(cmd).Tables[0];
                //var json = JsonHelper.Serialize(dt);
                return Json(dt);
            }
            if (option == "4")
            {
                var ds = db.ExecuteDataSet(cmd);
                //var json = JsonHelper.Serialize(ds);
                return Json(ds);
            }
            return Json("error");
        }

        public ActionResult test()
        {
            return View();
        }

    }
}
