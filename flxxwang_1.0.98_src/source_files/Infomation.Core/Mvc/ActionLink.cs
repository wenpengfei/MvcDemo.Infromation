using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Routing;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace Infomation.Core.Mvc
{
    public class ActionLink
    {
        public string LinkText;
        public string ControllerName;
        public string ActionName;
        //public object RouteValues;
        public RouteValueDictionary RouteValues;
        public string Url(UrlHelper urlHelper)
        {
            //if (this.RouteValues == null)
            //{
            //    this.RouteValues = new RouteValueDictionary();
            //}
            //if (!this.RouteValues.ContainsKey("region")
            //    || this.RouteValues["region"] == null 
            //    ||string.IsNullOrWhiteSpace(this.RouteValues["region"].ToString()))
            //{
            //    //this.RouteValues["region"] = "$region$";
            //    this.RouteValues["region"] = 0;
            //}

            //if (!this.RouteValues.ContainsKey("circle")
            //    || this.RouteValues["circle"] == null
            //    || string.IsNullOrWhiteSpace(this.RouteValues["circle"].ToString()))
            //{
            //    //this.RouteValues["circle"] = "$circle$";
            //    this.RouteValues["region"] = 0;
            //}
            var url = urlHelper.Action(ActionName, ControllerName, RouteValues);
            //if (url == null)
            //{
            //    return null;
            //}
            //return url.Replace("?region=%24region%24", "").Replace("?circle=%24circle%24", "").Replace("&region=%24region%24", "").Replace("&circle=%24circle%24", "").Replace("/%24region%24", "").Replace("/%24circle%24", "");
            return url;
        }
        public string Link(HtmlHelper htmlHelper)
        {
            //if (this.RouteValues == null)
            //{
            //    this.RouteValues = new RouteValueDictionary();
            //}
            //if (!this.RouteValues.ContainsKey("region")
            //    || this.RouteValues["region"] == null
            //    || string.IsNullOrWhiteSpace(this.RouteValues["region"].ToString()))
            //{
            //    //this.RouteValues["region"] = "$region$";
            //    this.RouteValues["region"] = 0;
            //}

            //if (!this.RouteValues.ContainsKey("circle")
            //    || this.RouteValues["circle"] == null
            //    || string.IsNullOrWhiteSpace(this.RouteValues["circle"].ToString()))
            //{
            //    //this.RouteValues["circle"] = "$circle$";
            //    this.RouteValues["circle"] = 0;
            //}
            var html=htmlHelper.ActionLink(LinkText, ActionName, ControllerName, RouteValues,null).ToHtmlString();
            //if (html == null)
            //{
            //    return null;
            //}
            //return html.Replace("?region=%24region%24", "").Replace("?circle=%24circle%24", "").Replace("&region=%24region%24", "").Replace("&circle=%24circle%24", "").Replace("/%24region%24", "").Replace("/%24circle%24", "");
            return html;
        }
        public string Link(HtmlHelper htmlHelper, object htmlAttributes)
        {
            //if (this.RouteValues == null)
            //{
            //    this.RouteValues = new RouteValueDictionary();
            //}
            //if (!this.RouteValues.ContainsKey("region")
            //    || this.RouteValues["region"] == null
            //    || string.IsNullOrWhiteSpace(this.RouteValues["region"].ToString()))
            //{
            //    //this.RouteValues["region"] = "$region$";
            //    this.RouteValues["region"] = 0;
            //}

            //if (!this.RouteValues.ContainsKey("circle")
            //    || this.RouteValues["circle"] == null
            //    || string.IsNullOrWhiteSpace(this.RouteValues["circle"].ToString()))
            //{
            //    //this.RouteValues["circle"] = "$circle$";
            //    this.RouteValues["circle"] = 0;
            //}
            var html=htmlHelper.ActionLink(LinkText, ActionName, ControllerName, RouteValues, htmlAttributes).ToHtmlString();
            //if (html == null)
            //{
            //    return null;
            //}
            //return html.Replace("?region=%24region%24", "").Replace("?circle=%24circle%24", "").Replace("&region=%24region%24", "").Replace("&circle=%24circle%24", "").Replace("/%24region%24", "").Replace("/%24circle%24", "");
            return html;
        }
        public string Link(HtmlHelper htmlHelper, IDictionary<string, object> htmlAttributes)
        {
            //if (this.RouteValues == null)
            //{
            //    this.RouteValues = new RouteValueDictionary();
            //}
            //if (!this.RouteValues.ContainsKey("region")
            //    || this.RouteValues["region"] == null
            //    || string.IsNullOrWhiteSpace(this.RouteValues["region"].ToString()))
            //{
            //    //this.RouteValues["region"] = "$region$";
            //    this.RouteValues["region"] = 0;
            //}

            //if (!this.RouteValues.ContainsKey("circle")
            //    || this.RouteValues["circle"] == null
            //    || string.IsNullOrWhiteSpace(this.RouteValues["circle"].ToString()))
            //{
            //    //this.RouteValues["circle"] = "$circle$";
            //    this.RouteValues["circle"] = 0;
            //}
            var html=htmlHelper.ActionLink(LinkText, ActionName, ControllerName, RouteValues, htmlAttributes).ToHtmlString();
            //if (html == null)
            //{
            //    return null;
            //}
            //return html.Replace("?region=%24region%24", "").Replace("?circle=%24circle%24", "").Replace("&region=%24region%24", "").Replace("&circle=%24circle%24", "").Replace("/%24region%24", "").Replace("/%24circle%24", "");
            return html;
        }
        //Url.Action()与Html.ActionLink()返回值为null的问题:
        //原因：如果是带区域(Area)的,则所有可选参数(UrlParameter.Optional)必须要传值(必须有值,不能为null或空字符串),否则返回值就会为null.
    }
}
