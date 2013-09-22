<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/EduDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>
<%@ Import Namespace="Framework.Extensions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var edu = ViewTag.Info as EduBaby;
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
        var objType = edu.ObjectTypeCollection.FirstOrDefault(item => item.Id == edu.ObjectType);
        if (objType != null)
        {
            %>
            <li><i class="z">教育类型：</i><%=objType.Name %></li>
            <%
        }
    %>
    <li><i class="z">服务类型：</i>
        <%=edu.Tag1 == 1 ? "日托" : ""%>
        <%
            if (edu.Tag2 == 2)
            {
                %>
                &nbsp;全托
                <%
            }
        %>
    </li>
    <%
        if (edu.Kind == 1)
        {
            %>
            <li><i class="z">办学性质：</i>公立</li>
            <%
        }
        else if (edu.Kind == 2)
        {
            %>
            <li><i class="z">办学性质：</i>私立</li>
            <%
        }
    %>
    
    <li><i class="z">入托条件：</i><%=edu.Condition %></li>
    <%
        if (!string.IsNullOrWhiteSpace(edu.BusTime))
        {
            %>
            <li><i class="z">营业时间：</i><%=edu.BusTime %></li>
            <%
        }
    %>
    <%
        if (!string.IsNullOrWhiteSpace(edu.Address))
        {
            %>
            <li><i class="z">地址：</i><%=edu.Address %></li>
            <%
        }
    %>
    <%
        if (!string.IsNullOrWhiteSpace(edu.Bus))
        {
            %>
            <li><i class="z">公交：</i><%=edu.Bus %></li>
            <%
        }
    %>
</ul>
</asp:Content>
