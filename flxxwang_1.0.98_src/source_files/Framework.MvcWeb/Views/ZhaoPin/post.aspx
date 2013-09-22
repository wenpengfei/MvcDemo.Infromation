<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/RecruitMasterPage.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        InsertOrUpdateCompanyInfo(onCompanySuccess, onCompanyFailed);
    }
    function onCompanySuccess(data, textStatus, jqXHR) {
        var zp = new Recruit();
        FillData(zp);
        zp.Id = -1;
        //        zp.CompanyId = data.CompanyId;
        zp.CompanyId = data.Id;
        zp.DateCreated = new Date().toJson(true);
        zp.DateModified = zp.DateCreated;
        zp.Insert(onSuccess, onFailed);
    }
    function onCompanyFailed(jqXHR, textStatus, errorThrown) {
        posted();
        alert(errorThrown);
    }
</script>
</asp:Content>
