<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/YellowPageMasterPage.master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var yp = new YellowPage();
        FillData(yp);
        yp.Id = -1;
        yp.DateCreated = new Date().toJson(true);
        yp.DateModified = yp.DateCreated;
        yp.Insert(onSuccess, onFailed);
    }
</script>
</asp:Content>
