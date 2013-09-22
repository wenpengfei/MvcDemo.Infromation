<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/HouseDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var house = ViewTag.Info as HouseRent;
%>
<ul class="info">
    <li><i class="z">租金：</i>
        <%
            if (house.Price == 0)
            {
                %>
                面议
                <%
            }
            else
            {
                %>
                <em class="redfont"><%=house.Price%></em>元/月
                <%
            }
        %>
        (<%=house.PayWay %>)
    </li>
    <li><i class="z">整套户型：</i><%=house.Room %> 室 <%=house.Parlor %>厅<%=house.Toilet %>卫 （<%=house.Area %> ㎡） </li>
    <li><i class="z">基本情况：</i>
    <%=ViewTag.ObjectType==null?string.Empty:ViewTag.ObjectType.Name%>，
    <%=house.FitType %>，
    朝向<%=house.Toward %>
    (第<%=house.Floor %>层 ，共<%=house.FloorTotal %>层)
    </li>
    <li><i class="z">配置：</i><%=house.HouseAllocation %></li>
    <li><i class="z">区域：</i>
        <%
            if (house.RegionId != null)
            {
                %>
                <a href="<%=Url.Action(routeData.Values["smallcategory"].ToString(), new { region = house.RegionId.Value }) %>"><%=house.RegionName %></a>&nbsp;
                <%
            }
            if (house.CircleId != null)
            {
                %>
                <a href="<%=Url.Action(routeData.Values["smallcategory"].ToString(),new{region=house.RegionId.Value,circle=house.CircleId.Value}) %>"><%=house.CircleName %></a>&nbsp;
                <%
            }
        %>
    </li>
    <li><i class="z">小区：</i>
        <%=house.District %>
        <%--<a href="#">九莲新村</a>--%>
        <%--<span class="f12">
            ( <a href="#" target="_blank">租房信息757条</a> )
        </span>--%>
    </li>
    <li><i class="z">地址：</i>
        <span class="address">
            <%=house.Address %>
            <%--<span class="f12"> 
                ( <a href="#" target="_blank">查看交通地图</a> )
            </span>--%>
        </span>
    </li>
</ul>
</asp:Content>
