<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var car = ViewTag.Info as CarAccompany;
%>
<ul class="info">
    <%
        if(car.RegionId!=null)
        {
            %>
            <li>
                <i class="z">区域：</i>
                <a href="<%=Url.Action(routeData.Values["smallcategory"].ToString(), new { region = car.RegionId.Value }) %>"><%=car.RegionName %></a>
            </li>
            <%
        }
    %>
    <%
        var objType=car.ObjectTypeCollection.FirstOrDefault(item=>item.Id==car.ObjectType);
        if(objType!=null)
        {
            %>
            <li><i class="z">类别：</i><a href="<%=Url.Action(car.Category.Code, car.Category.Parent.Code, new { objecttype=objType.Id }) %>"><%=objType.Name %></a></li>
            <%
        }
    %>
    
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
</ul>
</asp:Content>
