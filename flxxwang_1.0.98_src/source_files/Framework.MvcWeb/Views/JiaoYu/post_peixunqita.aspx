<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/EduMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IEducation>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="ObjectTypeLabel" runat="server">
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="ObjectType" runat="server">
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="InfoTag" runat="server">
</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="Rows" runat="server">
</asp:Content>

<asp:Content ID="Content10" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var edu = new EduOther();
        FillData(edu);
        edu.ObjectType = undefined;
        edu.Id = -1;
        edu.DateCreated = new Date().toJson(true);
        edu.DateModified = edu.DateCreated;
        edu.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $().ready(function () {
        $("#trobjecttype").css("display", "none");
        $("#trgongjiao").css("display", "none");
        $("#trdizhi b:eq(0)").text("");
        $('#dizhi').formValidator({ tipid: 'dizhi_Tip', onfocus: '请填写详细地址', q2b: true, 'empty': true }).regexValidator({ regexp: "^(.){2,50}$#^([^\\s]\\s{0,3}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6})))+$#^[\\w\\[\\]\\(\\)\\{\\}\\.\\s,\\-\\*，。（）【】“”—‘’\\u4e00-\\u9fa5]*$", onerror: "地址不足2个字#地址里不能填写电话#地址里不能输入特殊字符" });
    });
</script>
</asp:Content>
