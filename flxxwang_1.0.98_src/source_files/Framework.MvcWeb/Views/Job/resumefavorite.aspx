<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Resume>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>应聘简历</title>
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/css/detail/job.css" />
    <script type="text/javascript" src="/Content/Fenlei/Scripts/jianli/jquery.js"></script>
    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>
    <script src="/Scripts/framework/db.js" type="text/javascript"></script>
    <script src="/content/fenlei/scripts/model.js" type="text/javascript"></script>

</head>
<body>

 <div class="chakanphone" id="divchak" style="width:530px;padding:20px 20px;">
    <%
        var userid = Convert.ToInt32(Framework.Utility.CookieManager.GetCookie("userId"));
        var company = Company.Select(item => item.UserId == userid);
        if (company != null)
        {
            %>
                <p>对已下载简历进行点评，每天可以获得<strong class="red">15</strong>份免费简历。</p><br />
                <p>
                    <input type="submit" class="btn" value="确定下载" onclick="userdown();">
                </p>
            <%
        }
        else
        {
            %>
            <p align="center">
                <strong>您好，请先填写公司信息</strong>
            </p>
            <p align="left">
                &nbsp;&nbsp;&nbsp;&nbsp;填写公司信息后，不仅可以免费下载简历，还可以免费发布招聘信息。只需一分钟即可完成，
                <a href="<%=Url.Action("gongsiziliao","my") %>" onclick="window.parent.oWnd.close();" target="_blank">马上填写</a>
            </p>
            <%
        }
    %>
</div>

<div class="chakanphone" id="divSuccess" style="width:530px;padding:20px 20px; display:none;">
    <p><span class="r"></span>下载成功！该简历已存入您的<a href="<%=Url.Action("yixiazaijianli","my") %>" target="_blank">“<strong class="red">已下载简历</strong>“</a>中.</p><br />
    <p>
        <input type="button" class="btn" value="关闭" onclick="closeWnd();">
    </p>
</div>

<script type="text/javascript">
    function userdown() {
        var favorite = new ResumeFavorite();
        favorite.Id = -1;
        favorite.UserId =parseInt($f.cookie.get("userId"),10);
        favorite.ResumeId=<%=this.Model.Id %>;
        favorite.ToUserId=<%=this.Model.UserId %>;
        favorite.DateCreated=new Date().toJson(true);
        favorite.DateModified=new Date().toJson(true);

        favorite.Insert(function () {
            //alert("下载成功");
            $("#divchak").hide(500);
            $("#divSuccess").show(500);
            
        }, function () {
            alert("下载失败");
        });
    }
    function closeWnd()
    {
        parent.window.location.reload();
    }
</script>

<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-26929121-1']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
</script>

</body>
</html>
