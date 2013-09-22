<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TicketDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var ticket = ViewTag.Info as TicketCard;
%>
<ul class="info">
    <li><i class="z">类型：</i><%=ticket.TypeName%></li>
    <%
        var objType = ticket.ObjectTypeCollection.FirstOrDefault(item => item.Id == ticket.ObjectType);
        if (objType != null)
        {
            %>
            <li><i class="z">类别：</i><a href="<%=Url.Action(ticket.Category.Code, ticket.Category.Parent.Code, new { objecttype=objType.Id }) %>"><%=objType.Name %></a></li>
            <%
        }
    %>
    <li><i class="z">价格：</i>
        <%
            if (ticket.Price == 0)
            {
                %>
                面议
                <%
            }
            else
            {
                %>
                <%=ticket.Price%>元
                <%
            }
        %>
    </li>
    <%--<li><i class="z">有效期：</i><%=%></li>--%>
</ul>
</asp:Content>
