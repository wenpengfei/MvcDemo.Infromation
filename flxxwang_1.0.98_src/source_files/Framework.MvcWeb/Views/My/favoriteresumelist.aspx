<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<List<ResumeFavorite>>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>已下载简历</title>
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/ui6/zp/user.css" />
    <script type="text/javascript" src="/Content/Fenlei/Scripts/jianli/jquery.js"></script>
    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>
    <script type="text/javascript" src="/Content/Fenlei/Scripts/jianli/favoriteinfo.js"></script>

    <script src="/Scripts/framework/db.js" type="text/javascript"></script>
    <script src="/content/fenlei/scripts/model.js" type="text/javascript"></script>

</head>
<body>
    <div class="area_b" id="comShow">
        <ul class="area_nav" id="area_nav">
            <li><a href="<%=Url.Action("companyInfo") %>">公司信息</a></li>
            <li><a href="<%=Url.Action("invitesendedlist") %>">发送的面试邀请</a></li>
            <li class="selected"><a href="javascript:void(0);">已下载简历</a></li>
        </ul>
    </div>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="qz">
        <tbody>
        <tr class="tablehead">
            <th width="4%"></th>
			<th width="12%"> 姓名</th>
			<th width="17%">应聘职位</th>
			<th width="17%">现职位</th>
			<th width="7%">性别</th>
			<th width="8%">年龄</th>
			<th width="9%">学历</th>
			<th width="9%">工作经验</th>
			<th width="12%">下载时间</th>
			<th width="9%">操作</th>
        </tr>
        <%
            foreach (var item in this.Model)
            {
                %>
                <tr id="favorite_<%=item.Id %>" onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#F7F7F7'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
                    <td class="binp"><input type="checkbox" id="cbID" class="checkqx" name="cbID" value='<%=item.Id %>' /></td>
                    <td><a href="<%=Url.Action("showresume", "jianli", new {id=item.ResumeId})%>" target="_blank"><%=item.Resume.RealName %></a></td>
                    <td><%=item.Resume.JobName %></td>
                    <td><%=item.Resume.CurrentJob!=null?item.Resume.CurrentJob.JobName:"无" %></td>
                    <td><%=item.Resume.SexName %></td>
                    <td><%=item.Resume.Age %>岁</td>
                    <td><%=item.Resume.EducationName %></td>
                    <td><%=item.Resume.WorkYears %></td>
                    <td><%=item.DateCreated.ToString("yyyy-M-d") %></td>
                    <td><a href="javascript:delFavorite(<%=item.Id %>)">删除</a></td>
                </tr>
                <%
            }
        %>

        </tbody>
    </table>
    <div class="area_cz4">
        <div class="pager" style="float:right; padding:2px 0;"></div>
        <input type="checkbox" onclick="SelectAllCheckBox(this)" class="checkqx" value="0" />全选
        <input type="button" value="删除" class="btn-v2" onclick="javascript:delAllFavorite()" />
    </div>
    <script type="text/javascript" language="javascript">
        window.onload = function () {
            setTimeout("resizeFrame()", 500);
        }
        function resizeFrame() {
            if (parent.document.getElementById("ContainerFrame") != null) {
                var hh = parent.document.getElementById("ContainerFrame").contentWindow.document.body.scrollHeight;
                parent.document.getElementById("ContainerFrame").style.height = hh + "px";
            }
        }
    </script>
    <script type="text/javascript">
        function delFavorite(id) {
            if (!confirm("您确定要删除该信息吗？")) {
                return;
            }
            var favorite = new ResumeFavorite();
            favorite._ignoreP = true;
            favorite.DeleteByPrimaryKey(id, function () {
                alert("删除成功！");
                $("#favorite_" + id).hide();
            }, function () {
                alert("删除失败！");
            });
        }
        function delAllFavorite() {
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
                if (!confirm("要删除选择的信息吗？")) {
                    return;
                }
                var favorite = new ResumeFavorite();
                favorite.DeleteByPrimaryKeyList(idList, function () {
                    alert("删除成功！");
                    for (i = 0; i < items.length; i++) {
                        if (items[i].id == "cbID" && items[i].checked) {
                            $("#favorite_" + items[i].value).hide();
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
