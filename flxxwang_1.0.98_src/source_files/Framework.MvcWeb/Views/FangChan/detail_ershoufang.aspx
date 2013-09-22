<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/HouseDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var house = ViewTag.Info as HouseSecond;
%>
<ul class="info">
    <li><i class="z">价格：</i>
        <%
            if (house.PriceName == "面议")
            {
                %>
                面议
                <%
            }
            else
            {
                %>
                <em class="redfont"><%=house.PriceName%></em>万元
                <%
            }
        %>
    </li>
    <li><i class="z">面积：</i>
    <%
        if (house.Type == 1)//出售
        {
            %>
            <%=house.Area %> ㎡
            <%
        }
        if (house.Type == 2)//求购
        {
            %>
            <%=house.Area+"-"+house.Area2 %>㎡
            <%
        }
    %>
    </li>
    <li><i class="z">产权：</i><%=house.Right %></li>
    <%
        if (house.Type == 1)
        {
            %>
            <li><i class="z">房龄：</i>
                <%=house.Age %>年
                （<%=ViewTag.ObjectType==null?string.Empty:ViewTag.ObjectType.Name %>，<%=house.FitType %>，<%=house.Toward %>）
            </li>
            <%
        }
    %>
    <li><i class="z">户型：</i>
    <%=house.Room %>  室
    <%
        if (house.Type == 1)
        {
            %>
            <%=house.Parlor %>厅 
            <%=house.Toilet %>卫
           （第 <%=house.Floor %> 层， 共 <%=house.FloorTotal %> 层）
            <%
        }
    %> 
    </li>
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
    </li>
    <li><i class="z">地址：</i>
        <span class="address">
            <%=house.Address %>
        </span>
    </li>
</ul>
</asp:Content>
