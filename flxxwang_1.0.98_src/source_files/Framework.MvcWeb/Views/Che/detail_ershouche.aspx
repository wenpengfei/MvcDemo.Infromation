<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var car = ViewTag.Info as CarSecondHand;
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
    <li><i class="z">品牌：</i><a href="#"><%=car.BrandName %></a></li>
    <%
        var objType = car.ObjectTypeCollection.FirstOrDefault(item => item.Id == car.ObjectType);
        if (objType != null)
        {
            %>
            <li><i class="z">车型：</i><a href="#"><%=objType.Name %></a> &nbsp; </li>
            <%
        }
    %>
    <li><i class="z">排量：</i><%=car.Exhaust %>升</li>
    <li><i class="z">颜色：</i><%=car.Color %></li>
    <li><i class="z">时间：</i><%=car.BuyTime %>年</li>
</ul>
</asp:Content>
