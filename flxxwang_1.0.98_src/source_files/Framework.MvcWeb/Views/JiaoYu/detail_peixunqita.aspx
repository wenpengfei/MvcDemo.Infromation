<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/EduDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>
<%@ Import Namespace="Framework.Extensions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var edu = ViewTag.Info as EduOther;
%>
<ul class="info">
    <li><i class="z">区域：</i>
        <%
            if (edu.RegionId != null)
            {
                %>
                <a href="<%=Url.Action(routeData.Values["smallcategory"].ToString(), new { region = edu.RegionId.Value }) %>"><%=edu.RegionName%></a>&nbsp;
                <%
            }
                    if (edu.CircleId != null)
                    {
                        %>
                        <a href="<%=Url.Action(routeData.Values["smallcategory"].ToString(),new{region=edu.RegionId.Value,circle=edu.CircleId.Value}) %>"><%=edu.CircleName%></a>&nbsp;
                        <%
                    }
        %>
    </li>
    <%
        if (!string.IsNullOrWhiteSpace(edu.Address))
        {
            %>
            <li><i class="z">详细地址：</i><%=edu.Address %></li>
            <%
        }
    %>
</ul>
</asp:Content>
