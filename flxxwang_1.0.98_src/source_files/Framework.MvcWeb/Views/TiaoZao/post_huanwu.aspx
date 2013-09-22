<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleBaseMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Rows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 我 有： </td> 
    <td> <input type="text" name="woyou" id="woyou" value='' class="text1"  maxLength=15 /> <span id="woyou_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 成 色： </td> 
    <td class="checkpb">
        <input type="hidden" name="oldlevel" id='hidlevel' /> 
        <select id="oldlevelselect" f="{0}">
            <option value='1' > 全新 </option>  
            <option value='2' > 99成新 </option>  
            <option value='3' > 95成新 </option>  
            <option value='4' selected> 9成新 </option>  
            <option value='5' > 8成新 </option>  
            <option value='6' > 7成新 </option>  
            <option value='7' > 6成以下 </option>  
        </select> <span id="oldlevel_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 估 价： </td> 
    <td> <input type="text" name="MinPrice" id="MinPrice" value='面议' class="text2"  Except='面议'  maxLength=6 /> <span id="MinPrice_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 想 换： </td> 
    <td> <input type="text" name="xianghuan" id="xianghuan" value='' class="text2"  maxLength=8 /> <span id="xianghuan_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> 所在小区： </td> 
    <td> 
        <input class="text2" type="text" id="xiaoqu" name="quanjuxiaoqu" value='' /> 
        <span id="xiaoqu_Tip"></span> 
        <input type="hidden" name="xiaoqu" id="hidxiaoqu" value='' />
        <input type="hidden" name="dizhi" id="dizhi" value='' class="text1" /> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="OtherRows" runat="server">
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var sale = new SaleSwap();
        sale.Title = $("#woyou").val();
        sale.Want = $("#xianghuan").val();
        sale.Quality = parseInt($("#oldlevelselect").val(), 10);
        sale.District = $("#xiaoqu").val();
        sale.Price = $("#MinPrice").val();
        if (sale.Price == "" || sale.Price == "面议") {
            sale.Price = 0;
        }
        else {
            sale.Price = parseInt(sale.Price, 10);
        }
        BaseFillData(sale);
        sale.Id = -1;
        sale.DateCreated = new Date().toJson(true);
        sale.DateModified = sale.DateCreated;
        sale.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#woyou").formValidator({ tipid: "woyou_Tip", onfocus: "6-15个字，不能填写电话和特殊符号", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^(.){6,15}$#^([^\\s]\\s{0,3}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6})))+$#^[\\w\\[\\]\\(\\)\\{\\}\\.\\s,\\-\\*，。（）【】“”—‘’\\u4e00-\\u9fa5]*$", onerror: "请输入6～15个字#不允许填写电话#不允许填写特殊字符" });
        $("#xianghuan").formValidator({ tipid: "xianghuan_Tip", onfocus: "1-8个字  请填写想换物品名称，不能填写电话和特殊符号", q2b: true }).inputValidator({ onerror: "请填写想换物品" }).regexValidator({ regexp: "^(.){1,8}$#^([^\\s]\\s{0,3}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6})))+$#^[\\w\\[\\]\\(\\)\\{\\}\\.\\s,\\-\\*，。（）【】“”—‘’\\u4e00-\\u9fa5]*$", onerror: "请输入1～8个字#不允许填写电话#不允许填写特殊字符" });
        $("#MinPrice").formValidator({ tipid: "MinPrice_Tip", onfocus: "只能填写数字", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请正确填写价格" }).regexValidator({ regexp: "^(\\d){1,6}$", onerror: "估价为整数" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });
        $("#xiaoqu").formValidator({ tipid: "xiaoqu_Tip", onfocus: "1~30个字，不能填写电话和特殊符号", 'empty': true, q2b: true }).inputValidator({ onerror: "请输入物品所在小区" }).regexValidator({ regexp: "", onerror: "" }).functionValidator({ fun: function (val, elem) { $('#tooltip1div').hide(); var r = $.formValidator.IsNum(val); return !r; }, onerror: "小区不能为纯数字" });
    });
    function joinTitle() {
        var a = $('#woyou').val();
        var b = $('#xianghuan').val();
        var c = '我有' + a + ' - 想换' + b; $('#Title').val(c);
    }
</script>
</asp:Content>
