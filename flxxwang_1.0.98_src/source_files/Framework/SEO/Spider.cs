using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework;
using Framework.Data;
using System.Data.Linq.Mapping;
using Framework.Seo.Data;
using System.Web;

namespace Framework.Seo
{
    [Table(Name = "Info_Spider")]
    public class Spider : ModelBase<Spider, int>
    {
        [Column(IsPrimaryKey = true)]
        public int Id
        {
            get;
            set;
        }
        public string Url
        {
            get;
            set;
        }
        public SearchEngine SearchEngine
        {
            get;
            set;
        }
        public string UserAgent
        {
            get;
            set;
        }
        public WebSite WebSite
        {
            get;
            set;
        }
        public static SearchEngine GetSearchEngine(HttpRequestBase request)
        {
            var SearchEngine = Framework.Seo.SearchEngine.None;

            var UserAgentLower = request.UserAgent.ToLower();

            //if (UserAgentLower.Contains("http") || UserAgentLower.Contains("spider") || UserAgentLower.Contains("bot"))  //运行一段时间再启用这段代码,也许有些搜索引擎request.UserAgent中没有包含http
            //if((UserAgentLower.Contains("http")||UserAgentLower.Contains("spider"))
            //    &&!UserAgentLower.Contains("http://www.checkprivacy.or.kr")//http://www.checkprivacy.or.kr:6600/RS/PRIVACY_ENFAQ.jsp
            //    &&!UserAgentLower.Contains("http://name911.com")//Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.1) (http://name911.com)
            //    && UserAgentLower.Contains("http://www.site-shot.com")//Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) Site-Shot/2.1 (http://www.site-shot.com/) Safari/534.34
            //    )

            //{
            //    SearchEngine = Framework.Seo.SearchEngine.Unknown;

                if (UserAgentLower.Contains("baiduspider"))
                {
                    SearchEngine = Framework.Seo.SearchEngine.Baidu;//百度
                }
                else if (UserAgentLower.Contains("googlebot"))
                {
                    SearchEngine = Framework.Seo.SearchEngine.Google;//Google
                }
                else if (UserAgentLower.Contains("sogou") && UserAgentLower.Contains("spider"))
                {
                    SearchEngine = Framework.Seo.SearchEngine.Sogou;//Sogou
                }
                else if (UserAgentLower.Contains("sosospider"))
                {
                    SearchEngine = Framework.Seo.SearchEngine.Soso;//Soso
                }
                else if (UserAgentLower.Contains("jikespider"))
                {
                    SearchEngine = Framework.Seo.SearchEngine.Jike;//Jike
                }
                else if (UserAgentLower.Contains("bingbot"))
                {
                    SearchEngine = Framework.Seo.SearchEngine.Bing;//Bing
                }
                /*这些搜索引擎现在不用考虑
                else if (UserAgentLower.Contains("yandexbot"))
                {
                    SearchEngine = Framework.Seo.SearchEngine.YanDex;//YanDex
                }
                else if (UserAgentLower.Contains("yodaobot") || UserAgentLower.Contains("youdaobot"))
                {
                    SearchEngine = Framework.Seo.SearchEngine.Yodao;//Yodao
                }
                else if (UserAgentLower.Contains("easouspider"))
                {
                    SearchEngine = Framework.Seo.SearchEngine.Easou;//Easou
                }
                else if (UserAgentLower.Contains("ahrefsbot"))
                {
                    SearchEngine = Framework.Seo.SearchEngine.Ahrefs;//Ahrefs
                }
                else if (UserAgentLower.Contains("careerbot"))
                {
                    SearchEngine = Framework.Seo.SearchEngine.Career;//Career
                }
                else if (UserAgentLower.Contains("ezooms"))
                {
                    SearchEngine = Framework.Seo.SearchEngine.Ezooms;//Ezooms
                }
                else if (UserAgentLower.Contains("msnbot"))
                {
                    SearchEngine = Framework.Seo.SearchEngine.Msn;
                }*/
            //}
            return SearchEngine;

        }
        protected override DataAccess<Spider, int> GetProvider()
        {
            return new SpiderDataAccess();
        }
    }
}
