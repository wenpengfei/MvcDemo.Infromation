/*
 ASP.NET MvcPager 分页组件
 Copyright:2009-2011 陕西省延安市吴起县 杨涛\Webdiyer (http://www.webdiyer.com)
 Source code released under Ms-PL license
 */
namespace Framework.WebControls.Mvc
{
    public class PagerItem
    {
        public PagerItem(string text, int pageIndex, bool disabled, PagerItemType type)
        {
            Text = text;
            PageIndex = pageIndex;
            Disabled = disabled;
            Type = type;
        }

        internal string Text { get; set; }//这个属性可以不要了.
        public string Url { get; internal set; }//lls
        public bool IsCurentIndex { get; internal set; }//lls
        public int PageIndex { get;internal set; }
        public bool Disabled { get;internal set; }
        public PagerItemType Type { get;internal set; }
    }

    public enum PagerItemType:byte
    {
        FirstPage,
        NextPage,
        PrevPage,
        LastPage,
        MorePage,
        NumericPage
    }
}
