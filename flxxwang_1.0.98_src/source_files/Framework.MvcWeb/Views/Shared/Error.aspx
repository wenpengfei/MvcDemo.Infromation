<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="Framework" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
</head>
<body>
    <h2>
        Sorry, an error occurred while processing your request.
        <%
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
        %>
    </h2>
</body>
</html>