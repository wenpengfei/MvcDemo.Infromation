using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Infomation.Core;
using Framework.Common;
using Framework.Extensions;
using Infomation.Core.Mvc;
using Framework.WebControls.Mvc;
using Framework.Data.Linq;
using Framework.Seo;

namespace Framework.MvcWeb.Controllers
{
    /// <summary>
    /// 信息列表页、详细页、Post页的基Controller.
    /// </summary>
    public class InfoController : Controller
    {
        #region Properties
        private City _city;
        protected City City
        {
            get
            {
                if (_city == null)
                {
                    var cityCode = this.RouteData.Values["city"].ToString();
                    _city = City.GetCityByCode(cityCode);
                }
                return _city;
            }
        }

        protected short CityId
        {
            get
            {
                return this.City.Id;
            }
        }
        #endregion

        ViewTag ViewTag = new ViewTag();

        public void InitList<TModel>()
            where TModel : InfoBase<TModel>, new()
        {
            var model=new TModel();

            InitViewTag<TModel>();

            var searchEngine = Spider.GetSearchEngine(Request);
            //if (searchEngine != SearchEngine.None)
            //{
            //    ViewData["SeoInfoList"] = SeoUitls.GetInfoList<TModel>(ViewTag.Interface as TModel, searchEngine);
            //}

            //if (searchEngine == SearchEngine.None)
            //{
                this.SelectPaging<TModel>();
            //}
            //else
            //{
                //    SeoUitls.SelectPaging<TModel>(this.ViewTag, searchEngine);//百度搜site:taojen.com没有记录,可能被K了，所以取消.
            //}

            //SEO数据
            ViewTag.SEO = new SEO();
            if (ViewTag.PagedList != null)
            {
                foreach (var info in ViewTag.PagedList)
                {
                    if (string.IsNullOrEmpty(info.Keywords))
                    {
                        continue;
                    }
                    ViewTag.SEO.Keywords += " "+info.Keywords+"";
                }
            }
            if (ViewTag.PagedListPersonal != null)
            {
                foreach (var info in ViewTag.PagedListPersonal)
                {
                    if (string.IsNullOrEmpty(info.Keywords))
                    {
                        continue;
                    }
                    ViewTag.SEO.Keywords += " "+info.Keywords+"";
                }
            }
            if (ViewTag.PagedListBiz != null)
            {
                foreach (var info in ViewTag.PagedListBiz)
                {
                    if (string.IsNullOrEmpty(info.Keywords))
                    {
                        continue;
                    }
                    ViewTag.SEO.Keywords += " " + info.Keywords + "";
                }
            }
            if (!string.IsNullOrEmpty(ViewTag.SEO.Keywords))
            {
                ViewTag.SEO.Keywords = ViewTag.SEO.Keywords.Substring(1);
            }
            ViewData["ViewTag"] = ViewTag;
        }

        public void InitDetail<TModel>()
            where TModel : InfoBase<TModel>, new()
        {
            var model = new TModel();

            var tableName = model.TableName;

            ViewTag.Interface = model;
            ViewTag.CityId = this.CityId;

            var Id = Convert.ToInt32(this.RouteData.Values["id"]);

            var info = model.DataSelect(Id);
            var searchEngine = Spider.GetSearchEngine(Request);
            if (info == null)//不存在该信息,可能已经被删除.
            {
                if (searchEngine != SearchEngine.None)
                {
                    var spiderField = SeoUitls.GetSpiderField(searchEngine);
                    //spiderField = "BaiduSpiderTotal";//测试
                    var smallcategory = this.RouteData.Values["smallcategory"] as string;
                    if (model is YellowPage)
                    {
                        YellowPageType ypType;

                        if (smallcategory.TryParse<YellowPageType>(true, out ypType))
                        {
                            info = model.DataSelectAll("select top 1 * from " + model.TableName + " where YellowPageType=" + (int)ypType + " order by " + spiderField + "").FirstOrDefault();
                        }
                    }
                    else if (model is Recruit || model is JobSeek)
                    {
                        JobType jobType;
                        if (smallcategory.TryParse<JobType>(true, out jobType))
                        {
                            info = model.DataSelectAll("select top 1 * from " + model.TableName + " where JobType=" + (int)jobType + " order by " + spiderField + "").FirstOrDefault();
                        }
                    }

                    if (info == null)
                    {
                        info = model.DataSelectAll("select top 1 * from " + model.TableName + " order by " + spiderField + "").FirstOrDefault();
                    }
                }
            }

            if (searchEngine != SearchEngine.None)
            {
                //ViewData["SeoInfoList"] = SeoUitls.GetInfoList<TModel>(info, searchEngine);//百度搜site:taojen.com没有记录,可能被K了，所以取消.
                SeoUitls.AddSpiderTotal<TModel>(info, searchEngine);
            }



            ViewTag.Info = info;
            if (model is ICar || model is IHouse || model is ISale)
            {
                ViewTag.RecentOthers = model.RecentOthers(10);
            }
            ViewTag.Interface.CityId = ViewTag.CityId.Value;
            ViewTag.Interface.RegionId = ViewTag.RegionId;
            ViewTag.Interface.CircleId = ViewTag.CircleId;

            if (info.ContainsProperty("ObjectType"))
            {
                var objType = info.GetValue("ObjectType");
                if (objType != null)
                {
                    ViewTag.ObjectTypeId = Convert.ToByte(objType);
                }
            }

            //SEO数据
            ViewTag.SEO = new SEO();
            ViewTag.SEO.Keywords = ViewTag.Info.Keywords;

            ViewData["ViewTag"] = ViewTag;
        }

        public void InitPost<TModel>()
            where TModel : InfoBase<TModel>, new()
        {
            var model = new TModel();
            ViewTag.Interface = model;
            ViewTag.CityId = this.CityId;

            var region = Convert.ToInt16(this.RouteData.Values["region"]);
            var circle = Convert.ToInt16(this.RouteData.Values["circle"]);
            var objecttype = Convert.ToByte(this.RouteData.Values["objecttype"]);
            if (region > 0)
            {
                ViewTag.RegionId = region;
            }
            if (circle > 0)
            {
                ViewTag.CircleId = circle;
            }
            if (objecttype > 0)
            {
                ViewTag.ObjectTypeId = objecttype;
            }

            if (model is JobSeek || model is Recruit)
            {
                var smallcategory = this.RouteData.Values["smallcategory"].ToString();
                JobType jobType;
                if (smallcategory.TryParse<JobType>(true, out jobType))
                {
                    //ViewTag.JobType = jobType;
                    if (model is JobSeek)
                    {
                        var job = model as JobSeek;
                        job.JobType = jobType;
                    }
                    if (model is Recruit)
                    {
                        var recruit = model as Recruit;
                        recruit.JobType = jobType;
                    }
                }
            }
            if (model is YellowPage)
            {
                var smallcategory = this.RouteData.Values["smallcategory"].ToString();
                YellowPageType ypType;
                if (smallcategory.TryParse<YellowPageType>(true, out ypType))
                {
                    //ViewTag.YellowPageType = ypType;
                    var yp = model as YellowPage;
                    yp.YellowPageType = ypType;
                }
            }
            ViewTag.Interface.CityId = ViewTag.CityId.Value;
            ViewTag.Interface.RegionId = ViewTag.RegionId;
            ViewTag.Interface.CircleId = ViewTag.CircleId;

            ViewData["ViewTag"] = ViewTag;
        }

        private void InitViewTag<TModel>()
            where TModel : InfoBase<TModel>, new()
        {
            var model = new TModel();
            ViewTag.Interface = model;
            ViewTag.CityId = this.CityId;

            var action = this.RouteData.Values["action"].ToString();


            var region = Convert.ToInt16(this.RouteData.Values["region"]);
            var circle = Convert.ToInt16(this.RouteData.Values["circle"]);
            var objecttype = Convert.ToByte(this.RouteData.Values["objecttype"]);
            var tag = Convert.ToByte(this.RouteData.Values["tag"]);
            if (region > 0)
            {
                ViewTag.RegionId = region;
            }
            if (circle > 0)
            {
                ViewTag.CircleId = circle;
            }
            if (objecttype > 0)
            {
                ViewTag.ObjectTypeId = objecttype;
            }
            if (tag > 0)
            {
                ViewTag.TagId = tag;
            }

            int PageIndex = Convert.ToInt32(this.RouteData.Values["pageindex"]);
            var biz = Convert.ToInt32(this.RouteData.Values["biz"]);
            var pic = Convert.ToInt32(this.RouteData.Values["pic"]);
            var pricerange = Convert.ToInt32(this.RouteData.Values["pricerange"]);
            var minprice = Convert.ToInt32(this.RouteData.Values["minprice"]);
            var maxprice = Convert.ToInt32(this.RouteData.Values["maxprice"]);
            var days = Convert.ToInt32(this.RouteData.Values["days"]);
            var wd = this.RouteData.Values["wd"] as string;

            ViewTag.PageIndex = PageIndex;
            if (biz == 0)
            {
                ViewTag.IsBiz = false;
            }
            else if (biz == 1)
            {
                ViewTag.IsBiz = true;
            }
            if (pic == 0)
            {
                ViewTag.IsPic = false;
            }
            else if (pic == 1)
            {
                ViewTag.IsPic = true;
            }

            if (pricerange > 0)
            {
                ViewTag.PriceRange = pricerange;
            }
            if (minprice >= 0)
            {
                ViewTag.MinPrice = minprice;
            }

            if (maxprice >= 0)
            {
                ViewTag.MaxPrice = maxprice;
            }

            if (days >= 0)
            {
                ViewTag.Days = days;
            }

            ViewTag.KeyWord = wd;

            if (model is JobSeek || model is Recruit)
            {
                JobType jobType;
                if (action.TryParse<JobType>(true, out jobType))
                {
                    //ViewTag.JobType = jobType;
                    if (model is JobSeek)
                    {
                        var job = model as JobSeek;
                        job.JobType = jobType;
                    }
                    if (model is Recruit)
                    {
                        var recruit = model as Recruit;
                        recruit.JobType = jobType;
                    }
                }
            }
            if (model is YellowPage)
            {
                YellowPageType ypType;
                if (action.TryParse<YellowPageType>(true, out ypType))
                {
                    //ViewTag.YellowPageType = ypType;
                    var yp = model as YellowPage;
                    yp.YellowPageType = ypType;
                }
                
            }
            ViewTag.Interface.CityId = ViewTag.CityId.Value;
            ViewTag.Interface.RegionId = ViewTag.RegionId;
            ViewTag.Interface.CircleId = ViewTag.CircleId;
            
            
        }

        

        private void SelectPaging<TModel>()
            where TModel : InfoBase<TModel>, new()
        {
            
            var model = new TModel();
            if (model is YellowPage//黄页
                || model is JobSeek//求职
                || model is Recruit//招聘
                || model is EduEducation//教育
                || !model.ContainsProperty("IsBiz")//没有商家或个人的概念，如火车票等
                )
            {
                var sqlQuery = GetSqlQuery<TModel>(null);
                var list=model.DataSelectPaging(sqlQuery, 40, ViewTag.PageIndex.Value - 1);
                ViewTag.PagedList = new PagedList<IInfo>(list.Select(item=>item as IInfo), list.CurrentPageIndex, list.PageSize, list.TotalItemCount);
            }
            else
            {
                int PageSize = ViewTag.IsBiz == null ? 20 : 40;
                //int PageSize = ViewTag.IsBiz == null ? 2 : 4;//test
                if (ViewTag.IsBiz == null)
                {
                    var sqlQueryBiz = GetSqlQuery<TModel>(true);
                    var sqlQueryPersonal = GetSqlQuery<TModel>(false);
                    var listBiz = model.DataSelectPaging(sqlQueryBiz, PageSize, ViewTag.PageIndex.Value - 1);
                    var listPersonal = model.DataSelectPaging(sqlQueryPersonal, PageSize, ViewTag.PageIndex.Value - 1);
                    ViewTag.PagedListBiz = new PagedList<IInfo>(listBiz.Select(item => item as IInfo), listBiz.CurrentPageIndex, listBiz.PageSize, listBiz.TotalItemCount);
                    ViewTag.PagedListPersonal = new PagedList<IInfo>(listPersonal.Select(item => item as IInfo), listPersonal.CurrentPageIndex, listPersonal.PageSize, listPersonal.TotalItemCount);
                }
                else
                {
                    var sqlQuery = GetSqlQuery<TModel>(ViewTag.IsBiz);
                    var list = model.DataSelectPaging(sqlQuery, PageSize, ViewTag.PageIndex.Value - 1);
                    if (ViewTag.IsBiz == true)
                    {
                        ViewTag.PagedListBiz = new PagedList<IInfo>(list.Select(item => item as IInfo), list.CurrentPageIndex, list.PageSize, list.TotalItemCount);
                    }
                    else
                    {
                        ViewTag.PagedListPersonal = new PagedList<IInfo>(list.Select(item => item as IInfo), list.CurrentPageIndex, list.PageSize, list.TotalItemCount);
                    }
                }
            }
        }

        [Obsolete("尽量改成使用参数查询，以防sql注入")]
        private string GetSqlQuery<TModel>(bool? isBiz)
            where TModel : InfoBase<TModel>, new()
        {
            var model = new TModel();
            string sqlQuery = "select * from " + model.DataAccess.TableName + "";
            bool bWhere = false;

            if (CityId>0)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " CityId=" + CityId + "";
            }

            if (ViewTag.RegionId != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " RegionId=" + ViewTag.RegionId + "";
            }
            if (ViewTag.CircleId != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " CircleId=" + ViewTag.CircleId + "";
            }
            if (isBiz != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " IsBiz=" + Convert.ToInt32(isBiz) + "";
            }
            if (ViewTag.ObjectTypeId != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " ObjectType=" + Convert.ToInt32(ViewTag.ObjectTypeId) + "";
            }
            if (ViewTag.MinPrice != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " Price>=" + Convert.ToInt32(ViewTag.MinPrice) + "";
            }
            if (ViewTag.MaxPrice != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " Price<=" + Convert.ToInt32(ViewTag.MaxPrice) + "";
            }
            if (ViewTag.KeyWord != null)
            {
                var SearchFields = ViewTag.Interface.KeyWordSearchFields();
                if (SearchFields.Count > 0)
                {
                    string tempSql = string.Empty;
                    foreach (var field in SearchFields)
                    {
                        if (string.IsNullOrEmpty(tempSql))
                        {
                            tempSql += "" + field + " like '%" + ViewTag.KeyWord + "%'";
                        }
                        else
                        {
                            tempSql += " or " + field + " like '%" + ViewTag.KeyWord + "%'";
                        }
                    }
                    tempSql = "(" + tempSql + ")";
                    if (!bWhere)
                    {
                        sqlQuery += " where";
                        bWhere = true;
                    }
                    else
                    {
                        sqlQuery += " and";
                    }
                    sqlQuery += tempSql;
                }

            }
            if (ViewTag.StartTime != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " DateCreated>='" + ViewTag.StartTime + "'";
            }
            if (ViewTag.EndTime != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " DateCreated<='" + ViewTag.EndTime + "'";
            }
            if (ViewTag.IsPic == true)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " (Pictures is not null)";
            }
            if (ViewTag.Interface is JobSeek || ViewTag.Interface is Recruit)
            {
                var jobType = JobType.None;
                if (ViewTag.Interface is JobSeek)
                {
                    jobType = (ViewTag.Interface as JobSeek).JobType;
                }
                if (ViewTag.Interface is Recruit)
                {
                    jobType = (ViewTag.Interface as Recruit).JobType;
                }
                if (jobType != JobType.None)
                {
                    if (!bWhere)
                    {
                        sqlQuery += " where";
                        bWhere = true;
                    }
                    else
                    {
                        sqlQuery += " and";
                    }
                    sqlQuery += " JobType=" + Convert.ToInt32(jobType) + "";
                }
            }

            if (ViewTag.Interface is YellowPage)
            {
                var ypType = (ViewTag.Interface as YellowPage).YellowPageType;
                if (ypType != YellowPageType.None)
                {
                    if (!bWhere)
                    {
                        sqlQuery += " where";
                        bWhere = true;
                    }
                    else
                    {
                        sqlQuery += " and";
                    }
                    sqlQuery += " YellowPageType=" + Convert.ToInt32(ypType) + "";
                }
            }
            if (ViewTag.Interface is JobSeek)
            {
                bool? sex = null;
                int sexParam = Convert.ToInt32(this.RouteData.Values["sex"]);
                if (sexParam == 1)
                {
                    sex = true;
                }
                else if(sexParam==0)
                {
                    sex = false;
                }

                int minAge = Convert.ToInt32(this.RouteData.Values["minage"]);
                int maxAge = Convert.ToInt32(this.RouteData.Values["maxage"]);

                Education edu = (Education)Convert.ToInt32(this.RouteData.Values["xueli"]);

                var minyear = Convert.ToInt32(this.RouteData.Values["minyear"]);
                var maxyear = Convert.ToInt32(this.RouteData.Values["maxyear"]);

                if (sex != null)
                {
                    if (!bWhere)
                    {
                        sqlQuery += " where";
                        bWhere = true;
                    }
                    else
                    {
                        sqlQuery += " and";
                    }
                    sqlQuery += " Sex=" + Convert.ToInt32(sex) + "";
                }

                if (minAge >= 0)
                {
                    if (!bWhere)
                    {
                        sqlQuery += " where";
                        bWhere = true;
                    }
                    else
                    {
                        sqlQuery += " and";
                    }
                    sqlQuery += " Age>=" + minAge + "";
                }
                if (maxAge > 0)
                {
                    if (!bWhere)
                    {
                        sqlQuery += " where";
                        bWhere = true;
                    }
                    else
                    {
                        sqlQuery += " and";
                    }
                    sqlQuery += " Age<=" + maxAge + "";
                }
                if (edu!=Education.None)
                {
                    if (!bWhere)
                    {
                        sqlQuery += " where";
                        bWhere = true;
                    }
                    else
                    {
                        sqlQuery += " and";
                    }
                    sqlQuery += " Education=" + Convert.ToInt32(edu) + "";
                }
                if (minyear >= 0)
                {
                    if (!bWhere)
                    {
                        sqlQuery += " where";
                        bWhere = true;
                    }
                    else
                    {
                        sqlQuery += " and";
                    }
                    //sqlQuery += " WorkYearStart>=" + minyear + "";
                    sqlQuery += " WorkYearEnd>=" + minyear + "";//搜交集
                }
                if (maxyear > 0)
                {
                    if (!bWhere)
                    {
                        sqlQuery += " where";
                        bWhere = true;
                    }
                    else
                    {
                        sqlQuery += " and";
                    }
                    //sqlQuery += " WorkYearEnd<=" + maxyear + "";
                    sqlQuery += " WorkYearStart<=" + maxyear + "";//搜交集
                }
            }
            if (ViewTag.Interface is Recruit)
            {
                int wagemin = Convert.ToInt32(this.RouteData.Values["wagemin"]);
                if (wagemin >= 0)
                {
                    if (!bWhere)
                    {
                        sqlQuery += " where";
                        bWhere = true;
                    }
                    else
                    {
                        sqlQuery += " and";
                    }
                    //sqlQuery += " WageMin>=" + wagemin + "";
                    sqlQuery += " WageMax>=" + wagemin + "";//搜交集
                }

                int wagemax = Convert.ToInt32(this.RouteData.Values["wagemax"]);
                if (wagemax > 0)
                {
                    if (!bWhere)
                    {
                        sqlQuery += " where";
                        bWhere = true;
                    }
                    else
                    {
                        sqlQuery += " and";
                    }
                    //sqlQuery += " WageMax<=" + wagemax + "";
                    sqlQuery += " WageMin<=" + wagemax + "";//搜交集
                }
            }
            if (ViewTag.TagId != null)
            {
                
                var tagTemp = string.Empty;
                if (model.ContainsProperty("Tag"))
                {
                    tagTemp += " or Tag="+ViewTag.TagId+"";
                }
                if (model.ContainsProperty("Tag1"))
                {
                    tagTemp += " or Tag1=" + ViewTag.TagId + "";
                }
                if (model.ContainsProperty("Tag2"))
                {
                    tagTemp += " or Tag2=" + ViewTag.TagId + "";
                }
                if (model.ContainsProperty("Tag3"))
                {
                    tagTemp += " or Tag3=" + ViewTag.TagId + "";
                }
                if (model.ContainsProperty("Tag4"))
                {
                    tagTemp += " or Tag4=" + ViewTag.TagId + "";
                }
                if (model.ContainsProperty("Tag5"))
                {
                    tagTemp += " or Tag5=" + ViewTag.TagId + "";
                }
                if (model.ContainsProperty("Tag6"))
                {
                    tagTemp += " or Tag6=" + ViewTag.TagId + "";
                }
                if (model.ContainsProperty("Tag7"))
                {
                    tagTemp += " or Tag7=" + ViewTag.TagId + "";
                }
                if (model.ContainsProperty("Tag8"))
                {
                    tagTemp += " or Tag8=" + ViewTag.TagId + "";
                }
                if (model.ContainsProperty("Tag9"))
                {
                    tagTemp += " or Tag9=" + ViewTag.TagId + "";
                }
                if (model.ContainsProperty("Tag10"))
                {
                    tagTemp += " or Tag10=" + ViewTag.TagId + "";
                }
                if (model.ContainsProperty("Tag11"))
                {
                    tagTemp += " or Tag11=" + ViewTag.TagId + "";
                }
                if (model.ContainsProperty("Tag12"))
                {
                    tagTemp += " or Tag12=" + ViewTag.TagId + "";
                }
                if (!string.IsNullOrWhiteSpace(tagTemp))
                {
                    tagTemp = tagTemp.Substring(4);
                    if (!bWhere)
                    {
                        sqlQuery += " where";
                        bWhere = true;
                    }
                    else
                    {
                        sqlQuery += " and";
                    }
                    sqlQuery += " ("+tagTemp+")";
                }
            }

            sqlQuery += " order by Sequence asc, [id] desc";
            return sqlQuery;
        }
    }
}