<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<List<Interview>>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>发送面试邀请</title>
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/ui6/zp/user.css" />
     <%--<script type="text/javascript" src="/Content/Fenlei/Scripts/5_1/jquery1.3.2.js"></script>--%>
     <script type="text/javascript" src="/Scripts/jquery-ui-1.9m6/jquery-1.6.2.js"></script>

     <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>

     <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>
     <script type="text/javascript" src="/Content/Fenlei/Scripts/qy/common.js"></script>

     <script src="/Scripts/framework/db.js" type="text/javascript"></script>
    <script src="/content/fenlei/scripts/model.js" type="text/javascript"></script>

</head>
<body>
<form id="form1">
    <div>
        <div class="area_b" id="comShow">
            <ul class="area_nav" id="area_nav">
                <li><a href="<%=Url.Action("companyInfo") %>">公司信息</a></li>
                <li class="selected"><a href="javascript:void(0);">发送的面试邀请</a></li>
                <li><a href="<%=Url.Action("favoriteresumelist") %>">已下载简历</a></li>
            </ul>
        </div>
        <table class="qz">
            <tbody>
                <tr class="tablehead">
                    <th width="2%"></th>
                    <th width="14%">受邀者</th>
                    <th width="17%">邀请职位</th>
                    <th width="17%">现职位</th>
                    <th width="7%">性别</th>
                    <th width="8%">年龄</th>
                    <th width="8%">学历</th>
                    <th width="8%">工作经验</th>
                    <th width="9%">邀请时间</th>
                    <th width="9%">操作</th>
                </tr>
                <%
                    foreach (var item in this.Model)
                    {
                        %>
                        <tr id="invite_<%=item.Id %>" onmouseout="this.style.background='#fff'" onmouseover="this.style.background='#F7F7F7'" style="background: none repeat scroll 0% 0% rgb(255, 255, 255);">
	                        <td class="binp">
	                            <input type="checkbox" id="cbID" name="cbID" value="<%=item.Id %>" />
	                        </td>
	                        <td>
                                <a href="<%=Url.Action("showresume", "jianli", new {id=item.ResumeId })%>" target="_blank"><%=item.Resume.RealName %></a>
                            </td>
	                        <td><%=item.JobSeek!=null?item.JobSeek.JobName:"" %></td>
	                        <td><%=item.Resume.CurrentJob!=null?item.Resume.CurrentJob.JobName:"无" %></td>
	                        <td><%=item.Resume.SexName %></td>
	                        <td><%=item.Resume.Age %></td>
	                        <td><%=item.Resume.EducationName %></td>
	                        <td><%=item.Resume.WorkYears %></td>
	                        <td><%=item.DateCreated.ToString("yy-MM-dd") %></td>
	                        <td class="cz2"><a href="javascript:delInvite(<%=item.Id %>)">  删除</a></td>
	                    </tr>
                        <%   
                    }
                %>
                

            </tbody>
        </table>
        <div class="area_cz4">
            <div id="pageInfo" class="pager" style="float: right; padding: 2px 0;">
            <script type="text/javascript">
                seperatePage("pageInfo", "/invite/sendedlist", 0, 1);
            </script>
            </div>
            <input type="checkbox" onclick="SelectAllCheckBox(this)" class="checkqx" />全选
            <input type="button" class="btn-v2" value="删除" onclick="delMultiInvite();return false;" />
            &nbsp;<span style="color: Red;" id="spanTipForReflash"></span>
            <span id="ctl00_cphMain_InfoFL1List1_UPager1"></span>
        </div>
    </div>
    </form>
<script type="text/javascript">
    function delInvite(id) {
        if (!confirm("要删除面试邀请吗？")) {
            return;
        }
        var interview = new Interview();
        interview._ignoreP = true;
        interview.DeleteByPrimaryKey(id, function () {
            alert("删除成功！");
            $("#invite_" + id).hide();
        }, function () {
            alert("删除失败！");
        });
    }
    function delMultiInvite() {
        var idList = [];
        var items = document.getElementsByTagName("input");
        for (i = 0; i < items.length; i++) {
            if (items[i].id == "cbID" && items[i].checked) {
                idList.push(parseInt(items[i].value,10));
            }
        }
        if (idList.length == 0) {
            alert("请选择要删除的信息！");
        } else {
            if (!confirm("要删除选择的面试邀请吗？")) {
                return;
            }
            var interview = new Interview();
            interview.DeleteByPrimaryKeyList(idList, function () {
                alert("删除成功！");
                for (i = 0; i < items.length; i++) {
                    if (items[i].id == "cbID" && items[i].checked) {
                        $("#invite_" + items[i].value).hide();
                    }
                }
            }, function () {
                alert("删除失败！");
            });
        }
    }
</script>

<script type="text/javascript">
    var SelectAllCheckBox = function (obj) {
        var items = document.getElementsByTagName("input");
        for (i = 0; i < items.length; i++) {
            if (items[i].id == "cbID") {
                items[i].checked = obj.checked;
            }
        }
    }
</script>
<script type="text/javascript">
    window.onload = function () {
        setTimeout("resizeFrame()", 500);
    }
    function resizeFrame() {
        if (parent.document.getElementById("ContainerFrame") != null) {
            var hh = parent.document.getElementById("ContainerFrame").contentWindow.document.body.scrollHeight;
            parent.document.getElementById("ContainerFrame").style.height = hh + 20 + "px";
        }
    }
</script>

</body>
</html>
