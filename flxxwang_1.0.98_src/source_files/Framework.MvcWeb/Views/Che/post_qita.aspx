<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/CarMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ICar>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 价 格： </td> 
    <td> <input type="text" class="text3 gray" id="MinPrice" name="MinPrice" f="{0}元" value='面议'  Except='面议'  maxLength=5/> 元 <span id="MinPrice_Tip"></span> </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var car = new CarOther();
        car.Title = $("#Title").val();
        car.Price = $("#MinPrice").val();
        if (car.Price == "" || car.Price == "面议") {
            car.Price = 0;
        }
        else {
            car.Price = parseInt(car.Price, 10);
        }
        FillData(car);
        car.Id = -1;
        car.DateCreated = new Date().toJson(true);
        car.DateModified = car.DateCreated;
        car.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            post();
//            return false;
//        }
//        });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#MinPrice").formValidator({ tipid: "MinPrice_Tip", onfocus: "只能填写数字", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请填写价格" }).regexValidator({ regexp: "\\S+#^[1-9]\\d{0,4}$", onerror: "请输入价格#请正确填写价格，1~5位数字！" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });

    });
</script>
</asp:Content>
