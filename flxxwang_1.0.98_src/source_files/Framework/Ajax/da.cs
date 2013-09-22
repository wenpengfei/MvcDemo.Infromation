using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using Framework.Web.Script.Serialization;
using System.Web;

namespace Framework.Ajax
{
    /// <summary>
    /// 基于Modelbase的处理.
    /// </summary>
    public class da : IHttpHandler//, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            var json = context.Request["json"];
            var method = context.Request["m"];
            if (method.ToLower().Contains("delete"))//屏蔽掉delete
            {
                return;
            }
            var param = context.Request["p"];
            var paramArray = JsonHelper.Deserialize<object[]>(param);
            var Instance = JsonHelper.Deserialize(json);
            if (Instance != null)
            {
                Type type = Instance.GetType();
                //设置筛选标志
                BindingFlags bflags = BindingFlags.Public | BindingFlags.Instance | BindingFlags.InvokeMethod | BindingFlags.Static;

                var obj = type.InvokeMember(method, bflags, null, Instance, paramArray);

                var jsonResult = JsonHelper.Serialize(obj);
                
                context.Response.Write(jsonResult);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
