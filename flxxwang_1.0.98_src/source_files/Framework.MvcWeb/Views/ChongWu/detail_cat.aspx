<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/PetDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var pet = ViewTag.Info as PetCat;
%>
<ul class="info">

    <%--<li><i class="z">标签：</i>
    <%
        var tag1 = pet.TagCollection.FirstOrDefault(item => item.Id == pet.Tag1);
        var tag2 = pet.TagCollection.FirstOrDefault(item => item.Id == pet.Tag2);
        var tag3 = pet.TagCollection.FirstOrDefault(item => item.Id == pet.Tag3);
        var tag4 = pet.TagCollection.FirstOrDefault(item => item.Id == pet.Tag4);
        var tag5 = pet.TagCollection.FirstOrDefault(item => item.Id == pet.Tag5);
        if (tag1 != null)
        {
            %>
            <a href="#"><%=tag1.Name %></a>
            <%
        }
        if (tag2 != null)
        {
            %>
            &nbsp;<a href="#"><%=tag2.Name %></a>
            <%
        }
        if (tag3 != null)
        {
            %>
            &nbsp;<a href="#"><%=tag3.Name %></a>
            <%
        }
        if (tag4 != null)
        {
            %>
            &nbsp;<a href="#"><%=tag4.Name %></a>
            <%
        }
        if (tag5 != null)
        {
            %>
            &nbsp;<a href="#"><%=tag5.Name %></a>
            <%
        }
    %>
    </li>--%>

    
    <li><i class="z">类型：</i><%=pet.TypeName %></li>
    <li><i class="z">价格：</i>
        <%
            if (pet.Price == 0)
            {
                %>
                面议
                <%
            }
            else
            {
                %>
                <em class="redfont"><%=pet.Price%></em>元
                <%
            }
        %>
    </li>    
</ul>
</asp:Content>
