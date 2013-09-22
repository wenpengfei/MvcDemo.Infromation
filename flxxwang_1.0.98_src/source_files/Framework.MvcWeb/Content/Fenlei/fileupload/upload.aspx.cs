using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Framework.MvcWeb.Areas.Fenlei.Content.fileupload
{
    public partial class upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var files = Request.Files;
            string FileName;
            try
            {
                var postFile = files[0];  //在这里可以用一个For循环来进行多文件上传如右 ："for(i = 0; i < files.Count; i ++) "
                //FileName = System.IO.Path.GetFileName(postFile.FileName);//提取上传的文件名以及后缀名
                string UploadFolder = "/UploadFiles/Fenlei/" + DateTime.Now.ToString("yyyMMdd");
                string LocalFolder = System.Web.HttpContext.Current.Request.MapPath(UploadFolder);
                if (!Directory.Exists(LocalFolder))
                {
                    Directory.CreateDirectory(LocalFolder);//经测试正确.
                }
                //postFile.SaveAs(LocalFolder + "/" + FileName); //保存路径，在这里可以去网上找找MapPath
                //string SaveFileName = Guid.NewGuid().ToString() + FileName;
                //注：文件名不要加用户上传图片的文件名，因为用户上传的文件,文件名中可能包括&、=这些特殊符号.
                string SaveFileName = Guid.NewGuid().ToString()+System.IO.Path.GetExtension(postFile.FileName);
                postFile.SaveAs(LocalFolder + "/"+SaveFileName);
                //Response.Write("<script>parent.callback('upload file success')</script>");
                //Response.Write("<script>alert('upload file success')</script>");
                int PicPos = Convert.ToInt32(Request.Form["PicPos"]);

                Response.Write("<script>parent.$info.Uploader.finish(1,'" + UploadFolder + "/" + SaveFileName + "','" + PicPos + "')</script>");
            }
            catch
            {
                //Response.Write("<script>parent.callback('upload file error')</script>");
            }
        }
    }
}