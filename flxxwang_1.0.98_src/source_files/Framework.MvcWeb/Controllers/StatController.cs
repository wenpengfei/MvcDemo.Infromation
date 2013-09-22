using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Framework.Data;
using Infomation.Core;
using Infomation.Core.Mvc;

namespace Framework.MvcWeb.Controllers
{
    [ExceptionFilter]
    public class StatController : Controller
    {
        public JsonResult AddClickTotal()
        {
            string Url = Request.Form["_url"];//Url是关键字，Request.Form["Url"]是值是这样的：/bj/fangchan/qiuzu,/stat/AddClickTotal
            string Text = Request.Form["_text"];


            var IP = Request.UserHostAddress;
            var CIP =Framework.Common.IP.CIP(IP);
            var ipInfo = Framework.Common.IP.Entities.FirstOrDefault(ip => ip.StartIP <= CIP && ip.EndIP >= CIP);
            string Address = null;
            if (ipInfo != null)
            {
                Address = ipInfo.Address;
            }


            var db= DatabaseManager.CreateDatabase();

//            var sql = @"declare @id int;
//                        set @id=null;
//                        select @id=id from Info_Stat_Click where Url=@Url;
//                        if @id is null
//                        begin
//                            insert into Info_Stat_Click(Url,Text,IP,Address,ClickTotal) values (@Url,@Text,@IP,@Address,1);
//                        end
//                        else
//                        begin
//                            update Info_Stat_Click set ClickTotal=ClickTotal+1 where Url=@Url;
//                        end;
//                        ";

            var sql = "insert into Info_Stat_Click(Url,Text,IP,Address) values (@Url,@Text,@IP,@Address)";

            var cmd = db.GetSqlStringCommand(sql);
            db.AddInParameter(cmd,"@Url",System.Data.DbType.String,Url);
            db.AddInParameter(cmd,"@Text",System.Data.DbType.String,Text);
            db.AddInParameter(cmd, "@IP", System.Data.DbType.String, IP);
            db.AddInParameter(cmd, "@Address", System.Data.DbType.String, Address);
            return Json(db.ExecuteNonQuery(cmd));
        }
    }
}
