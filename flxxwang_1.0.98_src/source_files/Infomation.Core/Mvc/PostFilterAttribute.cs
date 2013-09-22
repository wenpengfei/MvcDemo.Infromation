using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Infomation.Core;
using Framework.Common;
using Framework.Extensions;

namespace Infomation.Core.Mvc
{
    public class PostFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var parentCode = filterContext.RouteData.Values["controller"].ToString().ToLower();
            var childCode = filterContext.RouteData.Values["smallcategory"].ToString().ToLower();
            if (childCode == "chengren")//暂时禁用chengren
            {
                childCode = "shouji";
            }
            string region = null;
            if (filterContext.RouteData.Values.ContainsKey("region"))
            {
                region=filterContext.RouteData.Values["region"].ToString().ToLower();
            }

            string circle = null;
            if (filterContext.RouteData.Values.ContainsKey("circle"))
            {
                circle = filterContext.RouteData.Values["circle"].ToString().ToLower();
            }

            YellowPageBigType BigType;
            //if (Enum.TryParse<YellowPageBigType>(parentCode, true, out BigType))//黄页
            if (parentCode.TryParse<YellowPageBigType>(true, out BigType))//黄页
            {
                YellowPageType SmallType = (YellowPageType)Enum.Parse(typeof(YellowPageType), childCode, true);
                filterContext.Controller.ViewData["category"] = InfoCategory.GetCategory(SmallType);
            }
            else if (parentCode == "zhaopin"//全职招聘
                //|| parentCode == "jianli"//全职简历
                || parentCode == "qiuzhi"//全职简历
                || parentCode == "zhaopinjz"//兼职招聘
                || parentCode == "qiuzhijz"//兼职简历
                )
            {
                JobType jobType = (JobType)Enum.Parse(typeof(JobType), childCode, true);
                filterContext.Controller.ViewData["category"] = InfoCategory.GetCategory(jobType);
            }
            else if (parentCode == "zhaopinhui")//招聘会
            {

            }
            else
            {

                InfoCategory parentCategory = null;
                foreach (var category in InfoCategory.Categories)
                {
                    if (category.Code != null && category.Code.ToLower() == parentCode)
                    {
                        parentCategory = category;
                        break;
                    }
                }
                var categories = parentCategory.Children;
                filterContext.Controller.ViewData["category"] = categories.First(item => item.Code != null && item.Code.ToLower() == childCode);
            }

            if (region != null)
            {
                filterContext.Controller.ViewData["Region"] = Region.GetRegion(Convert.ToInt16(region));
            }
            else
            {
                filterContext.Controller.ViewData["Region"] = null;
            }
            filterContext.Controller.ViewData["ParentCode"] = parentCode;
            filterContext.Controller.ViewData["ChildCode"] = childCode;
            if (circle != null)
            {
                filterContext.Controller.ViewData["Circle"] = Circle.GetCircle(Convert.ToInt16(circle));
            }
            base.OnActionExecuting(filterContext);
        }
    }
}