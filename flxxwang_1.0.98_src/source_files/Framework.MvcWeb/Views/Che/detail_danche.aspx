<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var car = ViewTag.Info as CarMotor;
%>
<ul class="info">
    <li><i class="z">价格：</i>
        <%
            if (car.Price == 0)
            {
                %>
                面议
                <%
            }
            else
            {
                %>
                <em class="redfont"><%=car.Price%></em>元
                <%
            }
        %>
        
    </li>
    <%
        if (car.Brand != null)
        {
            %>
            <li><i class="z">品牌：</i><a href="#"><%=car.Brand.Name %></a></li>
            <%
        }
    %>
    
    <li><i class="z">车型：</i><a href="#"><%=car.TagName %></a></li>
    <li><i class="z">成色：</i><%=car.QualityName %></li>
    <li><i class="z">排量：</i><%=car.Exhaust %></li>
    <li><i class="z">颜色：</i><%=car.Color %></li>
    <li><i class="z">时间：</i><%=car.BuyTime %>年</li>
    <li><i class="z">里程：</i><%=car.Rundistance %>公里</li>
</ul>
</asp:Content>