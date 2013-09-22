using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Common;
using Framework.Extensions;
using System.Web.Routing;

using Infomation.Core.Extensions;
using System.Web.Mvc;

namespace Infomation.Core.Mvc
{
    public class InfoBaseViewMasterPage : System.Web.Mvc.ViewMasterPage
    {
        protected string PictureListToDisplay(object Instance)
        {
            var val = Instance.GetValue("PictureList");
            if (val == null)
            {
                return null;
            }
            var list = val as IEnumerable<string>;
            if (list.Count() > 0)
            {
                return "";
            }
            return "none";
        }

        protected string BizToDisplay(object Instance)
        {
            var properties = Instance.GetType().GetProperties().Where(p => p.Name == "IsBiz");
            if (properties.Count() > 0)
            {
                var p = properties.ElementAt(0);
                var val = p.GetValue(Instance, null);
                if (val == null)
                {
                    return "none";
                }
                bool IsBiz = System.Convert.ToBoolean(val);
                if (IsBiz)
                {
                    return "";
                }
                else
                {
                    return "none";
                }
            }
            throw new Exception("没有IsBiz属性.");
        }

        protected string ArearLink(object Instance)
        {
            var info = Instance as IInfo;
            if (info == null)
            {
                return null;
            }
            string links = string.Empty;
            for (int i = 0; i < info.SameCircleLinks.Count; i++)
            {
                var link = info.SameCircleLinks[i];
                if (i > 0)
                {
                    links += "-";
                }
                links += "<a href='" + link.Url(base.Url) + "' target='_blank'>" + link.LinkText + "</a>";
            }
            return links;
        }

        protected string PriceToString(object Instance)
        {
            return Instance.PriceToString();
        }

        protected string DateCreated(object Instance, string format)
        {
            var Info = Instance as IInfo;
            if (Info == null)
            {
                return null;
            }
            if (Info.DateCreated > new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day))
            {
                return "今天";
            }
            return Info.DateCreated.ToString(format);
        }

        protected string InfoUrl(object Instance, UrlHelper url)
        {
            var info = Instance as IInfo;
            if (info == null)
            {
                return null;
            }
            if (url == null)
            {
                return null;
            }
            //info.Link.RouteValues["id"] = info.Id;
            return info.Link.Url(url);
        }

        protected override void OnLoad(EventArgs e)
        {
            this.DataBind();//绑定页面上的Repater等控件.
            base.OnLoad(e);
        }
    }
}
