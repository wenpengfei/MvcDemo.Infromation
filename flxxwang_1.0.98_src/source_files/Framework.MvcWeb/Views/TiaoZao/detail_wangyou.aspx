<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/SaleDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>
<%@ Import Namespace="Framework.Extensions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var sale = ViewTag.Info as SaleGame;
%>
<ul class="info">
    <%
        var objType = sale.ObjectTypeCollection.FirstOrDefault(item => item.Id == sale.ObjectType);
        if (objType != null)
        {
            %>
            <li><i class="z">类别：</i><a href="<%=Url.Action(sale.Category.Code, sale.Category.Parent.Code, new { objecttype=objType.Id }) %>"><%=objType.Name %></a> &nbsp; </li>
            <%
        }
    %>
    <%
        if (!string.IsNullOrWhiteSpace(sale.TagsName))
        {
            %>
            <li><i class="z">标签：</i><%=sale.TagsName %></li>
            <%
        }
    %>
    <li><i class="z">价格：</i>
        <%
            if (sale.Price == 0)
            {
                %>
                面议
                <%
            }
            else
            {
                %>
                <em class="redfont"><%=sale.Price%></em>元
                <%
            }
        %>
    </li>
    
    <li><i class="z">区域：</i>
        <%
            if (sale.RegionId != null)
            {
                %>
                <a href="<%=Url.Action(routeData.Values["smallcategory"].ToString(), new { region = sale.RegionId.Value }) %>"><%=sale.RegionName%></a>&nbsp;
                <%
            }
            if (sale.CircleId != null)
            {
                %>
                <a href="<%=Url.Action(routeData.Values["smallcategory"].ToString(),new{region=sale.RegionId.Value,circle=sale.CircleId.Value}) %>"><%=sale.CircleName%></a>&nbsp;
                <%
            }
        %>
    </li>
    <%
        if (!string.IsNullOrWhiteSpace(sale.District))
        {
            %>
            <li><i class="z">小区：</i><%=sale.District %></li>
            <%
        }
    %>
</ul>
</asp:Content>
