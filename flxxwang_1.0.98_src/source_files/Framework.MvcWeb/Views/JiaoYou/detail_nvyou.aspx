<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FriendDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var friend = ViewTag.Info as FriendSex;
%>
<ul class="info">
    <li><i class="z">交友目的：</i><%=friend.Purpose %></li>
    <li><i class="z">性别：</i><%=friend.Sex?"男":"女" %></li>
    <li><i class="z">年龄：</i><%=friend.Age %>岁</li>
    <li><i class="z">星座：</i><%=friend.Constellation %></li>
    <li><i class="z">身高/体重：</i><%=friend.Height %>厘米/<%=friend.Weight %>公斤</li>
    <li><i class="z">现状：</i><%=friend.Marriage%>&nbsp;<%=friend.Child%>&nbsp;<%=friend.Job %>&nbsp;<%=friend.Education %></li>
    <li><i class="z">家乡：</i><%=friend.HomeProvinceName %>&nbsp;<%=friend.HomeCityName %></li>
</ul>
</asp:Content>
