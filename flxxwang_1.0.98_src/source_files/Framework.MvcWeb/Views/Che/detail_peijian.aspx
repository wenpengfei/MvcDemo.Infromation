<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CarDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var car = ViewTag.Info as CarFitting;
%>
<ul class="info">
    
    <li><i class="z">标签：</i>
    <%
        if (car.Tag1 != null)
        {
            var tag1 = car.TagCollection.FirstOrDefault(item => item.Id == car.Tag1.Value);
            %>
            <a href="#"><%=tag1!=null?tag1.Name:"" %></a>
            <%
        }
        if (car.Tag2 != null)
        {
            var tag2 = car.TagCollection.FirstOrDefault(item => item.Id == car.Tag2.Value);
            %>
                &nbsp;<a href="#"><%=tag2!=null?tag2.Name:"" %></a>
            <%
        }
    %>
    </li>
    <li><i class="z">类型：</i><%=car.TypeName %></li>
    <%
        var objType = car.ObjectTypeCollection.FirstOrDefault(item => item.Id == car.ObjectType);
        if (objType != null)
        {
            %>
            <li><i class="z">类别：</i><a href="<%=Url.Action(car.Category.Code, car.Category.Parent.Code, new { objecttype=objType.Id }) %>"><%=objType.Name %></a> &nbsp; </li>
            <%
        }
    %>
    <li><i class="z">成色：</i><%=car.QualityName %></li>
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
