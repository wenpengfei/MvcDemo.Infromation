using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Infomation.Core;
using Framework.Data;
using System.Data;
using Framework.Seo;
using Framework;

namespace Infomation.Core.Mvc
{
    public class SpiderFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                var request = filterContext.RequestContext.HttpContext.Request;

                //Framework.LogHelper.WriteLog(request.UserAgent);

                //Baidu：Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)
                //Baidu：Baiduspider-image+(+http://www.baidu.com/search/spider.htm)

                //Google:Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)
                //Google:DoCoMo/2.0 N905i(c100;TB;W24H16) (compatible; Googlebot-Mobile/2.1; +http://www.google.com/bot.html)

                //Sogou：Sogou web spider/4.0(+http://www.sogou.com/docs/help/webmasters.htm#07)
                //Sogou:Sogou web spider/4.0(+http://www.sogou.com/docs/help/webmasters.htm#07)

                //Soso:Sosospider+(+http://help.soso.com/webspider.htm)
                //Soso:Mozilla/5.0(compatible; Sosospider/2.0; +http://help.soso.com/webspider.htm)

                //即刻：Mozilla/5.0 (compatible; JikeSpider; +http://shoulu.jike.com/spider.html)

                //Bing:Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)

                //Yodao:Mozilla/5.0 (compatible; YodaoBot/1.0; http://www.yodao.com/help/webmaster/spider/; )

                //YanDex:Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)

                //雅虎 MSN 这些暂时还没发现抓过网站，可以参考：.xici.net/d139467345.htm

                //附：Googlebot-Mobile针对Google的移动索引抓取网页 Googlebot-Image：针对Google的图片索引抓取网页 

                var SearchEngine = Spider.GetSearchEngine(request);

                var WebSite = Framework.Seo.WebSite.Taojen;
                if (request.Url.ToString().IndexOf("flxxwang.com") > 0)
                {
                    WebSite = Framework.Seo.WebSite.Flxxwang;
                }
                var spider = new Spider()
                {
                    Url = request.Url.ToString(),
                    SearchEngine = SearchEngine,
                    UserAgent = request.UserAgent,
                    WebSite = WebSite
                };
                spider.Insert();
                //var sql = "INSERT INTO Info_Spider (Url,SearchEngine,UserAgent,WebSite) values (@Url,@SearchEngine,@UserAgent,@WebSite)";
                //var db = DatabaseManager.CreateDatabase();
                //var cmd = db.GetSqlStringCommand(sql);
                //db.AddInParameter(cmd, "@Url", DbType.String, spider.Url);
                //db.AddInParameter(cmd, "@SearchEngine" , DbType.Byte, spider.SearchEngine);
                //db.AddInParameter(cmd, "@UserAgent", DbType.String, spider.UserAgent);
                //db.AddInParameter(cmd, "@WebSite", DbType.Byte, spider.WebSite);
                //db.BeginExecuteNonQuery(cmd, null, null);//需要在连接字符串中设置“Asynchronous Processing=true”,否则报错.

                //}
            }
            catch (Exception ex)
            {
                LogHelper.WriteLog("SpiderFilter.OnActionExecuting出错.", ex);
            }
            base.OnActionExecuting(filterContext);
        }
    }
}