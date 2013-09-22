using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Framework.Common;
using Infomation.Core;
using Framework.Extensions;
using Infomation.Core.Mvc;

namespace Framework.MvcWeb.Controllers
{
    [ExceptionFilter]
    //[LoginFilter]
    [SpiderFilter]
    public class PostController :Controller
    {
        //
        // GET: /Fenlei/Post/

        public ActionResult Index()
        {
            var cityCode = this.RouteData.Values["city"].ToString();
            var city = City.GetCityByCode(cityCode);
            ViewData["City"] = city;
            return View();
        }
        public ActionResult s2()
        {
            var cityCode = this.RouteData.Values["city"].ToString();
            var city = City.GetCityByCode(cityCode);
            ViewData["City"] = city;

            var Code = this.RouteData.Values["values"].ToString().ToLower();
            YellowPageBigType BigType;
            if (Code.TryParse<YellowPageBigType>(true, out BigType))//黄页
            {
                var categories = InfoCategory.GetCategory(BigType);
                this.ViewData["categories"] = categories;
            }
            else if (Code == "zhaopin"//全职招聘
                || Code == "qiuzhi"//全职简历
                )
            {
                //var jobCategories = InfoCategory.GetCategory<JobCategory>().Children as IEnumerable<JobCategory>;//.net 3.5不能这样做.
                var jobCategories = InfoCategory.GetCategory<JobCategory>().Children.Select(item=>item as JobCategory);
                var categories = jobCategories.Where(item => !item.JobType.ToString().ToLower().StartsWith("jianzhi"));
                this.ViewData["categories"] = categories;
                this.ViewData["ParentCode"] = Code;
                return View("s2_job");
            }
            else if (Code == "zhaopinjz"//兼职招聘
                || Code == "qiuzhijz"//兼职简历
                )
            {
                //var jobCategories = InfoCategory.GetCategory<JobCategory>().Children as IEnumerable<JobCategory>;//.net 3.5不能这样做.
                var jobCategories = InfoCategory.GetCategory<JobCategory>().Children.Select(item=>item as JobCategory);
                var categories = jobCategories.Where(item => item.JobType.ToString().ToLower().StartsWith("jianzhi"));
                this.ViewData["categories"] = categories;
                if (Code == "zhaopinjz")
                {
                    this.ViewData["ParentCode"] = "zhaopin";
                }
                else
                {
                    this.ViewData["ParentCode"] = "qiuzhi";
                }
                return View("s2_jobjz");
            }
            else if (Code == "zhaopinhui")//招聘会
            {

            }
            else
            {
                InfoCategory parentCategory = null;
                foreach (var category in InfoCategory.Categories)
                {
                    if (category.Code != null && category.Code.ToLower() == Code)
                    {
                        parentCategory = category;
                        break;
                    }
                }
                var categories = parentCategory.Children;
                this.ViewData["categories"] = categories;
            }

            return View();
        }

        public ActionResult s3()
        {
            var values = this.RouteData.Values["values"].ToString();
            var array = values.Split(new char[] { '/' });
            var parentCode = array[0].ToLower();
            var childCode = array[1].ToLower();
            if (childCode == "chengren")//暂时禁用chengren
            {
                childCode = "shouji";
            }

            YellowPageBigType BigType;
            if (parentCode.TryParse<YellowPageBigType>(true, out BigType))//黄页
            {
                YellowPageType SmallType = (YellowPageType)Enum.Parse(typeof(YellowPageType), childCode, true);
                this.ViewData["category"] = InfoCategory.GetCategory(SmallType);
            }
            else if (parentCode == "zhaopin"//全职招聘
                || parentCode == "qiuzhi"//全职简历
                || parentCode == "zhaopinjz"//兼职招聘
                || parentCode == "qiuzhijz"//兼职简历
                )
            {
                JobType jobType = (JobType)Enum.Parse(typeof(JobType), childCode, true);
                this.ViewData["category"] = InfoCategory.GetCategory(jobType);
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
                this.ViewData["category"] = categories.First(item => item.Code != null && item.Code.ToLower() == childCode);
            }

            this.ViewData["p"] = parentCode + "/" + childCode;
            this.ViewData["ParentCode"] = parentCode;
            this.ViewData["ChildCode"] = childCode;
            var cityCode = this.RouteData.Values["city"].ToString();
            var city = City.GetCityByCode(cityCode);
            if (city != null)
            {
                this.ViewData["Regions"] = Region.GetRegions(city.Id);
            }
            else
            {
                this.ViewData["Regions"] = new List<Region>();
            }
            ViewData["City"] = city;

            return View();

        }
        
        public ActionResult s4()
        {
            var values = this.RouteData.Values["values"].ToString();
            var array = values.Split(new char[] { '/' });
            var parentCode = array[0].ToLower();
            var childCode = array[1].ToLower();
            if (childCode == "chengren")//暂时禁用chengren
            {
                childCode = "shouji";
            }
            var region = array[2].ToLower();

            YellowPageBigType BigType;
            if (parentCode.TryParse<YellowPageBigType>(true, out BigType))//黄页
            {
                YellowPageType SmallType = (YellowPageType)Enum.Parse(typeof(YellowPageType), childCode, true);
                this.ViewData["category"] = InfoCategory.GetCategory(SmallType);
            }
            else if (parentCode == "zhaopin"//全职招聘
                || parentCode == "qiuzhi"//全职简历
                || parentCode == "zhaopinjz"//兼职招聘
                || parentCode == "qiuzhijz"//兼职简历
                )
            {
                JobType jobType = (JobType)Enum.Parse(typeof(JobType), childCode, true);
                this.ViewData["category"] = InfoCategory.GetCategory(jobType);
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
                this.ViewData["category"] = categories.First(item => item.Code != null && item.Code.ToLower() == childCode);
            }

            //this.ViewData["p"] = parentCode + "/" + childCode + "/" + region;
            this.ViewData["Region"] = Region.GetRegion(Convert.ToInt16(region));
            this.ViewData["ParentCode"] = parentCode;
            this.ViewData["ChildCode"] = childCode;
            this.ViewData["Circles"] = Circle.GetCirclesByRegion(Convert.ToInt16(region));

            var cityCode = this.RouteData.Values["city"].ToString();
            var city = City.GetCityByCode(cityCode);
            ViewData["City"] = city;
            return View();
        }

        public ActionResult success(object values)
        {
            ViewData["InfoUrl"]=values;
            return View();
        }
    }
}
