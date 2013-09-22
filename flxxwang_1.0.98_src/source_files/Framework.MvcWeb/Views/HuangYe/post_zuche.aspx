<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/YellowPageMasterPage.master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="AfterInfoTagRow" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 价 格： </td> 
    <td> <input type="text" class="text3 gray" id="MinPrice" name="MinPrice" f="{0}元" value='面议'  Except='面议'  maxLength=5/> 元 <span id="MinPrice_Tip"></span> </td> 
</tr>
</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var yp = new YellowPage();
        yp.Price = $("#MinPrice").val();
        if (yp.Price == "" || yp.Price == "面议") {
            yp.Price = 0;
        }
        else {
            yp.Price = parseInt(yp.Price, 10);
        }
        FillData(yp);
        yp.Id = -1;
        yp.DateCreated = new Date().toJson(true);
        yp.DateModified = yp.DateCreated;
        yp.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $().ready(function () {
        $("#MinPrice").formValidator({ tipid: "MinPrice_Tip", onfocus: "只能填写数字", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请填写价格" }).regexValidator({ regexp: "\\S+#^[1-9]\\d{0,4}$", onerror: "请输入价格#请正确填写价格，1~5位数字！" });
    });
</script>
</asp:Content>
