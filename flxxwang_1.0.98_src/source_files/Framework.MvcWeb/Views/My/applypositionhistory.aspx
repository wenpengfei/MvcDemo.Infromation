<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<List<JobApply>>" %>
<%@ Import Namespace="Framework.Utility" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <%
        var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
    %>
    <title>简历投递记录</title>
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/ui6/zp/user.css" />
    <%--<script type="text/javascript" src="/Content/Fenlei/Scripts/jianli/jquery.js"></script>--%>
    <script type="text/javascript" src="/Scripts/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="/Content/Fenlei/Scripts/jianli/favoriteinfo.js"></script>

    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>

    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>
    <script src="/Scripts/framework/db.js" type="text/javascript"></script>
    <script src="/content/fenlei/scripts/model.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        var __jsoninfo = { city: '<%=routeData.Values["city"] %>', tid: '<%=routeData.Values["tid"] %>' };
    </script>
</head>
<body>
    <div class="area_b">
        <ul class="area_nav" id="area_nav">
            <li><a href="<%=Url.Action("resuelist")%>">我的简历</a></li>
            <li class="selected"><a href="javascript:void(0);">简历投递记录</a></li>
        </ul>
        <span class="history-tip">最近1天申请 <strong><%=this.Model.Count(item=>item.DateCreated>DateTime.Now.Date) %></strong> 条，共申请<%=this.Model.Count %>条职位</span>
    </div>
    <table class="qz" id="applyList">
	<tbody>
		<tr>
			<th>&nbsp;</th>
			<th>申请的职位</th>
			<th>公司名称</th>
			<th>城市</th>
			<th style="display: none;">申请人数</th>
			<th>申请时间</th>
			<th>操作</th>
		</tr>
        <%
            foreach (var item in this.Model)
            {
                
                %>
                <tr id="apply_<%=item.Id %>">
                    <td><input class="checkqx" type="checkbox" id="cbID" name="cbID" value='<%=item.Id %>' /></td>
                    <td><a href="<%=Url.Action("Detail","ZhaoPin",new{city= CookieManager.GetCookie("city"), smallcategory=item.Recruit.JobType.ToString(),id=item.Recruit.Id}) %>" target='_blank'><%=item.Recruit.JobName %></a></td>
                    <td><a href="<%=Url.Action("Index", "qy", new {id=item.UserId})%>" target="_blank"><%=item.Company.CompanyName %></a></td>
                    <td>杭州</td>
                    <td style="display:none"><%=item.DataSelectAllByRecruitId(item.RecruitId).Count %>人</td>
                    <td><%=item.DateCreated.ToString("yyyy-MM-dd") %></td>
                    <td><a href="javascript:DeleApply(<%=item.Id %>);">删除</a></td>
                </tr>
                <%    
            }
        %>
    </tbody>
    </table>
    <div class="area_cz3">
        <div style="float:right; padding:2px 0;" class="pager" id="pageInfo"></div>
        <input type="checkbox" class="checkqx" onclick="SelectAllCheckBox(this)" value="0" /> 全选
        <input type="button" class="btn-v2" onclick="javascript:DeleteAllApply();" value="删除" />
    </div>
    <div class="c"></div>
    <script type="text/javascript" language="javascript">
        $(".basetb tr").each(function () {
            $(this).hover(function () { $(this).addClass("active") }, function () { $(this).removeClass("active") });
        });
        resizeFrame();
        function resizeFrame() {
            if (parent.document.getElementById("ContainerFrame") != null) {
                parent.document.getElementById("ContainerFrame").style.height = 1000 + "px";
                /*parent.ResizeFrame(parent.document.getElementById("ContainerFrame"));*/
            }
        }
    </script>
    <script type="text/javascript">
        function DeleApply(id) {
            var apply = new JobApply();
            apply._ignoreP = true;
            if (!confirm("确定删除吗?")) {
                return;
            }
            apply.DeleteByPrimaryKey(id, function () {
                $("#apply_" + id).hide();
            }, function () {
                alert("删除失败");
            });
        }
        function DeleteAllApply() {
            var idList = [];
            var items = document.getElementsByTagName("input");
            for (i = 0; i < items.length; i++) {
                if (items[i].id == "cbID" && items[i].checked) {
                    idList.push(parseInt(items[i].value, 10));
                }
            }
            if (idList.length == 0) {
                alert("请选择要删除的信息！");
            } else {
                if (!confirm("要删除选择的简历投递记录吗？")) {
                    return;
                }
                var apply = new JobApply();
                apply.DeleteByPrimaryKeyList(idList, function () {
                    alert("删除成功！");
                    for (i = 0; i < items.length; i++) {
                        if (items[i].id == "cbID" && items[i].checked) {
                            $("#apply_" + items[i].value).hide();
                        }
                    }
                }, function () {
                    alert("删除失败！");
                });
            }
        }
    </script>
</body>
</html>
