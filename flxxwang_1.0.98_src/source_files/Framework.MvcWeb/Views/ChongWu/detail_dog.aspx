<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/PetDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var pet = ViewTag.Info as PetDog;
%>
<ul class="info">
    <%
        var tag = pet.TagCollection.FirstOrDefault(item => item.Id == pet.Tag1);
        if (tag != null)
        {
            %>
            <li><i class="z">品种：</i><a href="#"><%=tag.Name %></a></li>
            <%
        }
    %>
    
    <li><i class="z">性别：</i><%=pet.Sex?"公":"母" %></li>
    <li><i class="z">年龄：</i><%=pet.Age %><%=pet.AgeUnit %></li>
    <li><i class="z">疫苗：</i><%=pet.Bacterin %></li>
    <li><i class="z">血统：</i><%=pet.Descent==true?"有":"无" %></li>
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
                <em class="redfont"><%=pet.Price%></em>元/只
                <%
            }
        %>
    </li>
</ul>
</asp:Content>
