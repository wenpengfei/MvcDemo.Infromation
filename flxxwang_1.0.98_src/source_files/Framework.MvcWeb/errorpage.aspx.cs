using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Framework.MvcWeb
{
    public partial class errorpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    var ex = Server.GetLastError();
                    var log = new Log()
                    {
                        Type = LogType.Exception,
                        Message = ex.Message,
                        StackTrace = ex.StackTrace,
                        Url = Request.Url.ToString()
                    };
                    log.Insert();
                }
                catch (Exception ex)
                {
                    try
                    {
                        var log = new Log()
                        {
                            Type = LogType.Exception,
                            Message = "errorpage写入错误日志时发生错误:" + ex.Message,
                            StackTrace = ex.StackTrace,
                        };
                        log.Insert();
                    }
                    catch
                    {

                    }
                }
            }
        }
    }
}