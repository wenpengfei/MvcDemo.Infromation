<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var car = ViewTag.Info as CarBicycle;
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
        var objType = car.ObjectTypeCollection.FirstOrDefault(item => item.Id == car.ObjectType);
        if (objType != null)
        {
            %>
            <li><i class="z">类别：</i><a href="<%=Url.Action(car.Category.Code, car.Category.Parent.Code, new { objecttype=objType.Id }) %>"><%=objType.Name %></a> &nbsp; </li>
            <%
        }
    %>
    <%
        var tag = car.TagCollection.FirstOrDefault(item => item.Id == car.Tag1);
        if (tag != null)
        {
            %>
            <li><i class="z">类型：</i><a href="#"><%=tag.Name %></a></li>
            <%
        }
    %>
    
    <li><i class="z">品牌：</i><a href="#"><%=car.BrandName %></a></li>
    <li><i class="z">成色：</i><%=car.QualityName %></li>
</ul>
</asp:Content>
