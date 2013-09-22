<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TicketDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var ticket = ViewTag.Info as TicketPerform;
%>
<ul class="info">
    <%
        var objType = ticket.ObjectTypeCollection.FirstOrDefault(item => item.Id == ticket.ObjectType);
        if (objType != null)
        {
            %>
            <li><i class="z">类别：</i><a href="<%=Url.Action(ticket.Category.Code, ticket.Category.Parent.Code, new { objecttype=objType.Id }) %>"><%=objType.Name %></a></li>
            <%
        }
    %>
    <li><i class="z">时间：</i><%=ticket.Time.ToString("yyyy-M-d h:mm")%></li>
    <li><i class="z">场馆：</i>
        <%--<a href="#"><%=ticket.Facility%></a>--%>
        <%=ticket.Facility%>
    </li>
    <%
        if (ticket.PriceOriginal>0)
        {
            %>
            <li><i class="z">原价：</i><%=ticket.PriceOriginal%>元/张</li>
            <%
        }
    %>
    <li><i class="z">现价：</i>
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
            <%=ticket.Price %>元/张
            <%
        }
    %>
    &nbsp;（<%=ticket.Count %>张）
    </li>
</ul>
</asp:Content>
