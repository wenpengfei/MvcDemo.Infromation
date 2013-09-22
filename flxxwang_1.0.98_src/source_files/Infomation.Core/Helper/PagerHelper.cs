using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Framework.WebControls.Mvc;

namespace Infomation.Core
{
    public static class PagerHelper
    {
        public static MvcHtmlString RenderPager(this HtmlHelper Html, IEnumerable<PagerItem> pagerItems)
        {
            var pagerHtml=string.Empty;
            //<strong><span>1</span></strong><a href="/banjia/pn2/"><span>2</span></a><a href="/banjia/pn3/"><span>3</span></a><a href="/banjia/pn4/"><span>4</span></a><a href="/banjia/pn5/"><span>5</span></a><a href="/banjia/pn6/"><span>6</span></a><a href="/banjia/pn7/"><span>7</span></a><a href="/banjia/pn8/"><span>8</span></a><a href="/banjia/pn9/"><span>9</span></a><a href="/banjia/pn10/"><span>10</span></a><a href="/banjia/pn11/"><span>11</span></a><a href="/banjia/pn12/"><span>12</span></a><a class="next" href="/banjia/pn2/"><span>下一页</span></a>
            //上一页
            var prevItem = pagerItems.FirstOrDefault(item => item.Type == PagerItemType.PrevPage&&!item.Disabled);
            if (prevItem != null)
            {
                pagerHtml += "<a class=\"prv\" href=\"" + prevItem.Url + "\"><span>上一页</span></a>";
            }

            var numericItems = pagerItems.Where(item => item.Type == PagerItemType.NumericPage);
            foreach (var item in numericItems)
            {
                if (item.IsCurentIndex)
                {
                    pagerHtml += "<strong><span>"+item.PageIndex+"</span></strong>";
                }
                else
                {
                    pagerHtml += "<a href=\"" + item.Url + "\"><span>" + item.PageIndex + "</span></a>";
                }
            }

            //下一页
            var nextItem = pagerItems.FirstOrDefault(item => item.Type == PagerItemType.NextPage && !item.Disabled);
            if (nextItem != null)
            {
                pagerHtml += "<a class=\"next\" href=\""+nextItem.Url+"\"><span>下一页</span></a>";
            }
            return MvcHtmlString.Create(pagerHtml);
        }
    }
}
