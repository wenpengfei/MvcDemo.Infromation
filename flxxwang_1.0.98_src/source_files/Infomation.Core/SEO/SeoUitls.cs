using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Infomation.Core.Mvc;
using Framework.Seo;
using Framework.Data;
using Framework.WebControls.Mvc;
using Framework.Extensions;

namespace Infomation.Core
{
    public class SeoUitls
    {
        public static string GetSpiderField(SearchEngine se)
        {
            if (se == SearchEngine.None)
            {
                return string.Empty;
            }
            var seField = "OtherSpiderTotal";
            if (se == SearchEngine.Baidu)
            {
                seField = "BaiduSpiderTotal";
            }
            else if (se == SearchEngine.Google)
            {
                seField = "GoogleSpiderTotal";
            }
            else if (se == SearchEngine.Sogou)
            {
                seField = "SogouSpiderTotal";
            }
            return seField;
        }

        public static int AddSpiderTotal<TModel>(TModel info, SearchEngine se)
            where TModel : InfoBase<TModel>, new()
        {
            if (se == SearchEngine.None)
            {
                return 0;
            }
            var seField = GetSpiderField(se);
            //seField = "BaiduSpiderTotal";//测试
            var sql = "update "+info.TableName+" set "+seField+"="+seField+"+1 where Id="+info.Id+"";
            var db = DatabaseManager.CreateDatabase();
            return db.ExecuteNonQuery(db.GetSqlStringCommand(sql));
        }

        public static void SelectPaging_xx<TModel>(ViewTag viewTag, SearchEngine se)
            where TModel : InfoBase<TModel>, new()
        {
            if (se == SearchEngine.None)
            {
                return;
            }
            var Interface = viewTag.Interface as TModel;

            var seField = GetSpiderField(se);
            //seField = "BaiduSpiderTotal";//测试

            if (Interface is YellowPage)
            {
                var yp = Interface as YellowPage;
                //return Interface.DataSelectAll("select top 20 * from " + Interface.TableName + " where YellowPageType=" + (int)yp.YellowPageType + " order by "+seField+"");
                
                var list=Interface.DataSelectPaging("select * from " + Interface.TableName + " where YellowPageType=" + (int)yp.YellowPageType + " and " + seField + "=0 order by id desc",40,viewTag.PageIndex.Value-1);//临时使用,运行一段时间后换成上面这句
                viewTag.PagedList = new PagedList<IInfo>(list.Select(item => item as IInfo), list.CurrentPageIndex, list.PageSize, list.TotalItemCount);
            }
            else if (Interface is Recruit)
            {
                var recruit = Interface as Recruit;
                //return Interface.DataSelectAll("select top 20 * from " + Interface.TableName + " where JobType=" + (int)recruit.JobType + " order by "+seField+"");

                var list= Interface.DataSelectPaging("select * from " + Interface.TableName + " where JobType=" + (int)recruit.JobType + " and " + seField + "=0 order by id desc",40,viewTag.PageIndex.Value-1);//临时使用,运行一段时间后换成上面这句
                viewTag.PagedList = new PagedList<IInfo>(list.Select(item => item as IInfo), list.CurrentPageIndex, list.PageSize, list.TotalItemCount);
            }
            else if (Interface is JobSeek)
            {
                var jobseek = Interface as JobSeek;
                //return Interface.DataSelectAll("select top 20 * from " + Interface.TableName + " where JobType=" + (int)jobseek.JobType + " order by "+seField+"");

                var list= Interface.DataSelectPaging("select * from " + Interface.TableName + " where JobType=" + (int)jobseek.JobType + " and " + seField + "=0 order by id desc",40,viewTag.PageIndex.Value-1);//临时使用,运行一段时间后换成上面这句
                viewTag.PagedList = new PagedList<IInfo>(list.Select(item => item as IInfo), list.CurrentPageIndex, list.PageSize, list.TotalItemCount);
            }
            else
            {
                //return Interface.DataSelectAll("select top 20 * from " + Interface.TableName + " order by "+seField+"");

                if (!Interface.ContainsProperty("IsBiz"))
                {
                    var list = Interface.DataSelectPaging("select * from " + Interface.TableName + " where " + seField + "=0 order by id desc", 40, viewTag.PageIndex.Value-1);//临时使用,运行一段时间后换成上面这句
                    viewTag.PagedList = new PagedList<IInfo>(list.Select(item => item as IInfo), list.CurrentPageIndex, list.PageSize, list.TotalItemCount);
                }
                else
                {
                    int pageSize = viewTag.IsBiz == null ? 20 : 40;
                    if (viewTag.IsBiz == null)
                    {
                        var listBiz = Interface.DataSelectPaging("select * from " + Interface.TableName + " where " + seField + "=0 and IsBiz=1 order by id desc", pageSize, viewTag.PageIndex.Value - 1);
                        viewTag.PagedListBiz = new PagedList<IInfo>(listBiz.Select(item => item as IInfo), listBiz.CurrentPageIndex, listBiz.PageSize, listBiz.TotalItemCount);

                        var listPersonal = Interface.DataSelectPaging("select * from " + Interface.TableName + " where " + seField + "=0 and IsBiz=0 order by id desc", pageSize, viewTag.PageIndex.Value - 1);
                        viewTag.PagedListPersonal = new PagedList<IInfo>(listPersonal.Select(item => item as IInfo), listPersonal.CurrentPageIndex, listPersonal.PageSize, listPersonal.TotalItemCount);
                    }
                    else if (viewTag.IsBiz == true)
                    {
                        var listBiz = Interface.DataSelectPaging("select * from " + Interface.TableName + " where " + seField + "=0 and IsBiz=1 order by id desc", pageSize, viewTag.PageIndex.Value - 1);
                        viewTag.PagedListBiz = new PagedList<IInfo>(listBiz.Select(item => item as IInfo), listBiz.CurrentPageIndex, listBiz.PageSize, listBiz.TotalItemCount);
                    }
                    else
                    {
                        var listPersonal = Interface.DataSelectPaging("select * from " + Interface.TableName + " where " + seField + "=0 and IsBiz=0 order by id desc", pageSize, viewTag.PageIndex.Value - 1);
                        viewTag.PagedListPersonal = new PagedList<IInfo>(listPersonal.Select(item => item as IInfo), listPersonal.CurrentPageIndex, listPersonal.PageSize, listPersonal.TotalItemCount);
                    }
                }

                
            }
        }

        public static IEnumerable<TModel> GetInfoList_xx<TModel>(TModel Interface,SearchEngine se)
            where TModel : InfoBase<TModel>, new()
        {
            if (se == SearchEngine.None)
            {
                return new List<TModel>();
            }
            var seField = GetSpiderField(se);
            //seField = "BaiduSpiderTotal";//测试
            if (Interface is YellowPage)
            {
                var yp = Interface as YellowPage;
                //return Interface.DataSelectAll("select top 20 * from " + Interface.TableName + " where YellowPageType=" + (int)yp.YellowPageType + " order by "+seField+"");

                return Interface.DataSelectAll("select top 20 * from " + Interface.TableName + " where YellowPageType=" + (int)yp.YellowPageType + " and " + seField + "=0 order by id desc");//临时使用,运行一段时间后换成上面这句
            }
            else if (Interface is Recruit)
            {
                var recruit = Interface as Recruit;
                //return Interface.DataSelectAll("select top 20 * from " + Interface.TableName + " where JobType=" + (int)recruit.JobType + " order by "+seField+"");

                return Interface.DataSelectAll("select top 20 * from " + Interface.TableName + " where JobType=" + (int)recruit.JobType + " and " + seField + "=0 order by id desc");//临时使用,运行一段时间后换成上面这句
            }
            else if (Interface is JobSeek)
            {
                var jobseek = Interface as JobSeek;
                //return Interface.DataSelectAll("select top 20 * from " + Interface.TableName + " where JobType=" + (int)jobseek.JobType + " order by "+seField+"");

                return Interface.DataSelectAll("select top 20 * from " + Interface.TableName + " where JobType=" + (int)jobseek.JobType + " and " + seField + "=0 order by id desc");//临时使用,运行一段时间后换成上面这句
            }
            else
            {
                //return Interface.DataSelectAll("select top 20 * from " + Interface.TableName + " order by "+seField+"");

                return Interface.DataSelectAll("select top 20 * from " + Interface.TableName + " where " + seField + "=0 order by id desc");//临时使用,运行一段时间后换成上面这句
            }
        }

        //public static string GetSqlQuery<TModel>(TModel Interface, SearchEngine se)
        //    where TModel : InfoBase<TModel>, new()
        //{

        //}

        //public static IEnumerable<TModel> GetInfoList<TModel>(ViewTag viewTag)
        //    where TModel : InfoBase<TModel>, new()
        //{
        //    var model = viewTag.Interface as TModel;
        //    if (model is YellowPage)
        //    {
        //        var yp = model as YellowPage;
        //        return model.DataSelectAll("select top 20 * from " + model.TableName + " where YellowPageType=" + (int)yp.YellowPageType + " order by id desc");
        //    }
        //    else if (model is Recruit)
        //    {
        //        var recruit = model as Recruit;
        //        return model.DataSelectAll("select top 20 * from " + model.TableName + " where JobType=" + (int)recruit.JobType + " order by id desc");
        //    }
        //    else if (model is JobSeek)
        //    {
        //        var jobseek = model as JobSeek;
        //        return model.DataSelectAll("select top 20 * from " + model.TableName + " where JobType=" + (int)jobseek.JobType + " order by id desc");
        //    }
        //    else
        //    {
        //        return model.DataSelectAll("select top 20 * from " + model.TableName + " order by id desc");
        //    }
        //}

//        public static IEnumerable<TModel> GetInfoList<TModel>(IInfo info)
//            where TModel : InfoBase<TModel>, new()
//        {
//            var model = info as TModel;

//            string sqlQuery = string.Empty;
//            if (model is YellowPage)
//            {
//                var yp = model as YellowPage;
//                sqlQuery = @"select * from $tableName where Id in
//	                            (
//		                            select Id from
//		                            (
//			                            select top 10 Id from $tableName where YellowPageType=$YellowPageType order by Id desc
//		                            ) t0
//		                            union
//		                            select top 5 Id from $tableName where Id>$Id and YellowPageType=$YellowPageType
//		                            union
//		                            select top 5 Id from $tableName where Id<$Id and YellowPageType=$YellowPageType order by id desc
//	                            )";
//                sqlQuery = sqlQuery.Replace("$YellowPageType", Convert.ToInt32(yp.YellowPageType).ToString());
//            }
//            else if (model is Recruit || model is JobSeek)
//            {
//                sqlQuery = @"select * from $tableName where Id in
//	                            (
//		                            select Id from
//		                            (
//			                            select top 10 Id from $tableName where JobType=$JobType order by Id desc
//		                            ) t0
//		                            union
//		                            select top 5 Id from $tableName where Id>$Id and JobType=$JobType
//		                            union
//		                            select top 5 Id from $tableName where Id<$Id and JobType=$JobType order by id desc
//	                            )";
//                JobType jobType;
//                if (model is Recruit)
//                {
//                    var recruit = model as Recruit;
//                    jobType = recruit.JobType;
//                }
//                else
//                {
//                    var jobseek = model as JobSeek;
//                    jobType = jobseek.JobType;
//                }
//                sqlQuery = sqlQuery.Replace("$JobType", Convert.ToInt32(jobType).ToString());
//            }
//            else
//            {
//                sqlQuery = @"select * from $tableName where Id in
//	                            (
//		                            select Id from
//		                            (
//			                            select top 10 Id from $tableName order by Id desc
//		                            ) t0
//		                            union
//		                            select top 5 Id from $tableName where Id>$Id
//		                            union
//		                            select top 5 Id from $tableName where Id<$Id order by id desc
//	                            )";
//            }

//            sqlQuery = sqlQuery.Replace("$Id",info.Id.ToString()).Replace("$tableName", model.TableName);
//            return model.DataSelectAll(sqlQuery).OrderByDescending(item => item.Id).ToList();
//        }
    }

}
