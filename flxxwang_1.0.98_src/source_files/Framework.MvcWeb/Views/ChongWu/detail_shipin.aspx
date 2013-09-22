<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/PetDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var pet = ViewTag.Info as PetFood;
%>
<ul class="info">
    <li><i class="z">类型：</i><%=pet.TypeName %></li>
    <%
        var objType = pet.ObjectTypeCollection.FirstOrDefault(item => item.Id == pet.ObjectType);
        if (objType != null)
        {
            %>
            <li><i class="z">类别：</i><a href="<%=Url.Action(pet.Category.Code, pet.Category.Parent.Code, new { objecttype=objType.Id }) %>"><%=objType.Name%></a></li>
            <%
        }
    %>
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
    
    <li><i class="z">成色：</i><%=pet.QualityName %></li>
    
</ul>
</asp:Content>
