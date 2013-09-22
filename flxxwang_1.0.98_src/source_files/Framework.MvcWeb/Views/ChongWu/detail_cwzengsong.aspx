<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/PetDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var pet = ViewTag.Info as PetGive;
%>
<ul class="info">
    <li><i class="z">类型：</i><%=pet.TypeName %></li>
</ul>
</asp:Content>
