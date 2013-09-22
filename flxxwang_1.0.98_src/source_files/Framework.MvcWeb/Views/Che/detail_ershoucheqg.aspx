<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var car = ViewTag.Info as CarBuy;
%>
<ul class="info">
    <li><i class="z">标签：</i>
        <%
            if (car.Tag1 != null)
            {
                var tag1 = car.TagCollection.FirstOrDefault(item => item.Id == car.Tag1.Value);
                %>
                <a href="#"><%=tag1!=null?tag1.Name:"" %></a>
                <%
            }
            if (car.Tag2 != null)
            {
                var tag2 = car.TagCollection.FirstOrDefault(item => item.Id == car.Tag2.Value);
                %>
                 &nbsp;<a href="#"><%=tag2!=null?tag2.Name:"" %></a>
                <%
            }
        %>
        
    </li>
    <li><i class="z">价格：</i><%=car.Price1%>-<%=car.Price2 %>万元</li>
    <li><i class="z">排量：</i><%=car.Exhaust %></li>
    <li><i class="z">变速器：</i><%=car.Transmission %></li>
    <li><i class="z">行程要求：</i><%=car.Rundistance %></li>
</ul>
</asp:Content>
