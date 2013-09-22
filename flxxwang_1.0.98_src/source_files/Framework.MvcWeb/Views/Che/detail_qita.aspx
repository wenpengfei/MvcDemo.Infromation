<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var car = ViewTag.Info as CarOther;
%>
<ul class="info">
    <%
        if(car.RegionId!=null)
        {
            %>
            <li><i class="z">区域：</i>
                <a href="<%=Url.Action(routeData.Values["smallcategory"].ToString(), new { region = car.RegionId.Value }) %>"><%=car.RegionName %></a>
                <%
                if (car.CircleId != null)
                {
                    %>
                    &nbsp;<a href="<%=Url.Action(routeData.Values["smallcategory"].ToString(),new{region=car.RegionId.Value,circle=car.CircleId.Value}) %>"><%=car.CircleName %></a>
                    <%
                }
                %>
            </li><%
        }
    %>
    <%--<li><i>详细地址：</i></li>--%>
</ul>
</asp:Content>
