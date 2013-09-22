<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<List<Resume>>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>简历投递</title>
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/css/detail/job.css" />
    <style type="text/css">
		.viewlist{ margin-bottom:5px;}
		.geshi{color:#999}
		.geshi span{margin:0 7px; font-family:'宋体';color:#bbb;}
		.chakanphone{ width:500px;}
		.redfont{ font-size:12px; font-weight:lighter}
	</style>

    <script src="/Content/Fenlei/Scripts/jianli/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>
    <script src="/Scripts/jquery.query-2.1.7.js" type="text/javascript"></script>
    <script src="/Scripts/framework/db.js" type="text/javascript"></script>
    <script src="/content/fenlei/scripts/model.js" type="text/javascript"></script>

    
    <script type="text/javascript">
        function postResume() {
            var resumeId = $("input[name='rdoResume']:checked").val();
            if (resumeId == undefined || resumeId == 0) {
                alert("请选择用哪份简历投递");
                return false;
            }
            resumeId = parseInt(resumeId, 10);
            var jobApplay = new JobApply();
            jobApplay.Id = -1;
            jobApplay.UserId = parseInt($f.cookie.get("userId"), 10);
            jobApplay.ResumeId = resumeId;
            jobApplay.RecruitId = parent.recruit.Id;
            jobApplay.RecruitUserId = parent.recruit.UserId;
            jobApplay.CompanyId = parent.recruit.CompanyId;
            jobApplay.DateCreated = new Date().toJson(true);
            jobApplay.DateModified = new Date().toJson(true);
            jobApplay.Insert(function () {
                //alert("简历投递成功");
                $("#submitForm").hide(500);
                $("#tipSuccess").show(500);

            }, function () {
                alert("简历投递失败");
            });
        }
    </script>
</head>
<body>
    <form name="submitForm" id="submitForm" method="post" defaultbutton="btn" target="formSubmit">
        <div class="chakanphone">
            <p>请选择您要投递的简历：</p>
            <table class="writecode" style="width:90%" cellpadding="0" cellspacing="0">
                <%
                    foreach (var resume in this.Model)
                    {
                        %>
                        <tr>
                            <td style="20%">
                                <label>
                                    <input type="radio" name="rdoResume" style="vertical-align:middle" value="<%=resume.Id %>" /><%--checked--%>
                                    <%=resume.Name %>
                                </label>
                            </td>
                            <td style="width:10%">
                                <%=resume.ResumeType==WorkType.Full?"全职":"兼职" %>
                            </td>
                            <td><%=resume.JobName %></td>
                            <td style="width:10%">
                                <a href="javascript:location.href='<%=Url.Action("showresume", "jianli", new {id=resume.Id })%>'" target="_blank">预览</a>
                            </td>
                        </tr>
                        <%
                    }
                %>
                
            </table>
            <p style="margin-top:20px;">
                <input style="font-weight: bold; font-size: 14px" type="button"  class="guanbi" value="立即投递" onclick="postResume()" /><%--onclick="onpusher(0)"--%>
            </p>
        </div>
    
    </form>

    <div class="chakanphone" id="tipSuccess" style="display:none;">
        <h2 class="green"><span class="r"></span>恭喜您，简历投递成功！</h2>
        <p><%--今天您共投递了<strong class="red"> 1</strong>份简历。--%><p>
        平均每投递15份简历就可以获得1次面试机会，<br />简历投递越多面试机会越多！</p> 
        
    </div>

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
