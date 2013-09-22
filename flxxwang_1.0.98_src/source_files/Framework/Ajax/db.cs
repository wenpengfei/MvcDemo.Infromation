using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Framework.Data;
using System.Data.Common;
using Framework.Web.Script.Serialization;

namespace Framework.Ajax
{
    public class db : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string commandText = context.Request["cmd"];
            string option = context.Request["option"];
            var t = Membership.Providers;
            //var tt = JsonHelper.Serialize(new object[]{1,2,"a","b"});
            //var bb = JsonHelper.Deserialize<object[]>(tt);

            Database db = DatabaseManager.CreateDatabase();
            DbCommand cmd = db.GetSqlStringCommand(commandText);
            if (option == "1")
            {
                var count = db.ExecuteNonQuery(cmd);
                context.Response.Write(count);
                return;
            }
            if (option == "2")
            {
                var result = db.ExecuteScalar(cmd);
                context.Response.Write(result);
                return;
            }
            if (option == "3")
            {
                var dt = db.ExecuteDataSet(cmd).Tables[0];
                var json = JsonHelper.Serialize(dt);
                context.Response.Write(json);
                return;
            }
            if (option == "4")
            {
                var ds = db.ExecuteDataSet(cmd);
                var json = JsonHelper.Serialize(ds);
                context.Response.Write(json);
                return;
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
