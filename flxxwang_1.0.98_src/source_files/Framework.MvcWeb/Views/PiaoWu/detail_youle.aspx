<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TicketDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var ticket = ViewTag.Info as TicketPleasure;
%>
<ul class="info">
    <li><i class="z">标签：</i><%=ticket.TagsName%></li>
    <li><i class="z">类型：</i><%=ticket.TypeName%></li>
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
            <%=ticket.Price %>元
            <%
        }
    %>
    </li>
    <%--<li><i class="z">有效期：</i><%=%></li>--%>
    <%--<li><i class="z">交易地点：</i><%=%></li>--%>
</ul>
</asp:Content>
