<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FriendDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var friend = ViewTag.Info as FriendSkill;
%>
<ul class="info">
    <li><i class="z">我会：</i><%=friend.MySkill %></li>
    <li><i class="z">我想学：</i><%=friend.WantSkill %></li>
    <li><i class="z">性别：</i><%=friend.Sex?"男":"女" %></li>
    <li><i class="z">年龄：</i><%=friend.Age %>岁</li>
</ul>
</asp:Content>
