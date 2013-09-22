<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<List<Infomation.Core.Resume>>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>简历中心</title>
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/ui6/zp/user.css" />
    <script src="/Content/Fenlei/Scripts/jianli/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" charset="gb2312" src="/Content/Fenlei/Scripts/5_1/7b/3.js"></script>
    <script src="/Content/Fenlei/Scripts/jianli/resumeinfo.js" type="text/javascript"></script>

    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>

    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>
    <script src="/Scripts/framework/db.js" type="text/javascript"></script>
    <script type="text/javascript" src="/content/fenlei/scripts/model.js"></script>
</head>
<body>
    <div class="area_b">
        <ul class="area_nav" id="area_nav">
            <li class="selected"><a href="javascript:void(0);">我的简历</a></li>
            <li><a href="<%=Url.Action("applypositionhistory") %>">简历投递记录</a></li>
        </ul>
    </div>
    <%if (this.Model.Count > 0)
      { %>
    <table class="qz" id="resumeList">
        <tr>
            <th width="25%">简历名称</th>
            <th>简历属性</th>
            <th>公开程度</th>
            <th>浏览次数</th>
            <th>面试邀请</th>
            <th>更新日期</th>
            <th class="tit_cz" width="25%">操作</th>
        </tr>
        <%
          foreach (var resume in this.Model)
          {
                %>
                <tr class="bg1" resume="<%=resume.Id %>">
                    <td>
                        <span id="no1">
                        <%if (resume.ResumeType == WorkType.Full)
                          { %>
                            <a target="_self" href="<%=Url.Action("myresume") %>"><%=resume.Name%></a>
                            <%}
                          else
                          { %>
                          <a target="_self" href="<%=Url.Action("mypartresume") %>"><%=resume.Name%></a>
                            <%} %>
                        </span>
                    </td>
                    <td><%if (resume.ResumeType == WorkType.Full)
                          {%>全职<%}
                          else
                          { %>兼职<%} %></td>
                    <td>公开</td>
                    <td>3</td>
                    <td>0</td>
                    <td id="updDate"><%=resume.DateModified.ToString("MM-dd-yy")%></td>
                    <td class="cza czav">
                        <a href="#">刷新</a>&nbsp; 
                        <a href="#" target="_blank">预览</a>&nbsp;
                        <a href="#">外发</a> &nbsp; 
                        <%if (resume.ResumeType == WorkType.Full)
                          { %>
                        <a target="_self" href="<%=Url.Action("myresume") %>">修改</a>&nbsp;
                        <%}
                          else
                          { %>
                          <a target="_self" href="<%=Url.Action("mypartresume") %>">修改</a>&nbsp;
                        <%} %>
                        <a href="javascript:void(0);" onclick="delResume(<%=resume.Id %>);return false;">删除</a>
                    </td>
                </tr>
                <%
          }
        %>
    </table>
    <%}
      else
      { %>
      <div class="noresue"><h4>好简历，找好工作，成就好生活！</h4><p>好简历--让更多企业找到你！<br />刷简历--优先让企业看到你！<br />投简历--投递简历越多，面试机会越多！</p>
    <%} %>

    <%if (this.Model.FirstOrDefault(item => item.ResumeType == WorkType.Full) == null)
      { %>
    <input class="btn-v3 mt20" type="button" onclick="javascript:location.href='<%=Url.Action("myresume") %>'" value="填写全职简历" />
    <%} %>

    <%if (this.Model.FirstOrDefault(item => item.ResumeType == WorkType.Part) == null)
      { %>
    <input class="btn-v3 mt20" type="button" onclick="javascript:location.href='<%=Url.Action("mypartresume") %>'" value="填写兼职简历" />
    <%} %>
    <%if (this.Model.Count == 0)
      { %>
    </div>
   <%} %>
    <div class="noteread">
        <p> <b>说明</b></p>
        <p> 1.刷新：刷新简历完全免费，刷新后时间变为最新，企业在搜索简历时会优先显示。</p>
		<p> 2.外发：您可以把简历发到别人的邮箱里，非常方便快捷！</p>
		<p> 3.公开程度：</p>
		<p> a.公开：允许所有企业下载您的简历</p>
		<p> b.对taojen公开：只允许<%=SiteInfo.Name%>认证企业下载您的简历</p>
		<p> c.保密：不允许企业主动下载您的简历，只有您应聘的企业才可查看</p>
    </div>

    <script type="text/javascript">
        function delResume(id) {
            $("#resumeList tr").each(function () {
                var resumeId = $(this).attr("resume");
                if (resumeId != undefined && resumeId != null) {
                    resumeId = parseInt(resumeId, 10);
                    if (resumeId == id) {
                        if (confirm("确定删除吗?")) {
                            var resume = new Resume();
                            resume.Id = id;
                            resume._ignoreP = true;
                            resume.DeleteByPrimaryKey(id, function (data) {
                                $(this).remove();
                                alert("删除成功");
                            },
                            function () {
                                alert("删除失败");
                            }, null, $(this));
                        }
                    }
                }
            });
        }
    </script>
</body>
</html>
