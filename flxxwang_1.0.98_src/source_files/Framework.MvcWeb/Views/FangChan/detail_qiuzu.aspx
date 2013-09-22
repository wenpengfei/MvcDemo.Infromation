<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/HouseDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var house = ViewTag.Info as HouseHire;
%>
<ul class="info">
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
    <li><i class="z">租金：</i>
        <%
            if (house.Price1 == 0&&house.Price2==0)
            {
                %>
                面议
                <%
            }
            else
            {
                
                %>
                <em class="redfont">
                <%
                    if (house.Price1 == 0 && house.Price2 > 0)
                    {
                        %>
                        <%=house.Price2 %>以下
                        <%
                    }
                    else if (house.Price2 == 0 && house.Price1 > 0)
                    {
                        %>
                        <%=house.Price1%>以上
                        <%
                    }
                    else
                    {   %>
                        <%=house.Price1+"-"+house.Price2%>
                        <%
                    }
                %>
                </em>元/月
                <%
            }
        %>
    </li>
</ul>
</asp:Content>
