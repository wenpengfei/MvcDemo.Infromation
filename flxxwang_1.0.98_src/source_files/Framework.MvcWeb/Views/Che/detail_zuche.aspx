<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Fenlei/Views/Shared/CarDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var car = ViewTag.Info as CarRent;
%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Rows" runat="server">
</asp:Content>
