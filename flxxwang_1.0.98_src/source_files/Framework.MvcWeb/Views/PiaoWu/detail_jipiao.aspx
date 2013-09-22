<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TicketDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var ticket = ViewTag.Info as TicketAirplane;
%>
<ul class="info">
    <li><i class="z">详细地址：</i><%=ticket.Address%></li>
    <%
        var objType = ticket.ObjectTypeCollection.FirstOrDefault(item => item.Id == ticket.ObjectType);
        if (objType != null)
        {
            %>
            <li><i class="z">类别：</i><a href="<%=Url.Action(ticket.Category.Code, ticket.Category.Parent.Code, new { objecttype=objType.Id }) %>"><%=objType.Name %></a></li>
            <%
        }
    %>
</ul>
</asp:Content>
