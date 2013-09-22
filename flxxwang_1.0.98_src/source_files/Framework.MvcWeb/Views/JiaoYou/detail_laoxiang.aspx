<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FriendDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var friend = ViewTag.Info as FriendHome;
%>
<ul class="info">
    <li><i class="z">性别：</i><%=friend.Sex == null ? "保密" : (friend.Sex.Value ? "男" : "女")%></li>
    <li><i class="z">年龄：</i><%=friend.Age %>岁</li>
    <li><i class="z">现居地：</i>
        <%=friend.CityName %>
        <%
            if (friend.RegionId != null)
            {
                %>
                - <%=friend.RegionName %>
                <%
            }
            if (friend.CircleId != null)
            {
                %>
                - <%=friend.CircleName %>
                <%
            }
        %>
    </li>
    <li><i class="z">家乡：</i><%=friend.HomeProvinceName %>&nbsp;<%=friend.HomeCityName %></li>
</ul>
</asp:Content>
