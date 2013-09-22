<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>
<%@ Import Namespace="Framework.Extensions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var car = ViewTag.Info as Carpool;
%>
<ul class="info">
    <%
        var objType = car.ObjectTypeCollection.FirstOrDefault(item => item.Id == car.ObjectType);
        if (objType != null)
        {
            %>
            <li><i class="z">类型：</i><a href="#"><%=objType.Name %></a> &nbsp; </li>
            <%
        }
    %>
    <li><i class="z">线路：</i><%=car.Startstation %>→<%=car.EndStation %></li>
    <li><i class="z">途经：</i><%=car.Way %></li>
    <li><i class="z">时间：</i>
        <%
            if (!string.IsNullOrWhiteSpace(car.Round))
            {
                %>
                <%=car.Round %>&nbsp;
                <%
                if (car.StartTime != null)
                {
                    %>
                    <%=car.StartTime.Value.ToString("H:mm") %>
                    <%
                }
            }
            else if (car.StartTime != null)
            {
                %>
                <%=car.StartTime.Value.ToString("yyyy-M-d H:mm") %>
                <%
            }
        %>
    </li>
</ul>
</asp:Content>
