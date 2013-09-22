<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleBaseMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="Rows" runat="server">
<tr> 
<td class="t"> 供 求： </td> 
<td>转让 </td> 
    <td class="checkpb" style="display:none">  
        <label> <input class="base" type="radio" name="type" onclick="change(this)" id="type_0" f="{0}" value='0' checked /><span>转让</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input class="base" type="radio" name="type" onclick="change(this)" id="type_1" f="{0}" value='1'  /><span>求购</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  <span id="type_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 类 别： </td> 
    <td> 
        <select name="ObjectType" id="ObjectType" f="{0}"> 
            <option selected="selected" value="">请选择类别</option>  
            <%--<option value='0' selected> 全球通</option>  
            <option value='1' > 动感地带</option>  
            <option value='2' > 神州行</option>  
            <option value='3' > 联通</option>  
            <option value='4' > 电信</option>  
            <option value='9' > 铁通</option>  
            <option value='6' > 小灵通</option>--%>
            <%
                foreach (var item in SaleMobileNumber.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>' ><%=item.Name %></option>
                    <%
                }
             %>  
        </select> 
        <span id="ObjectType_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> <span id="spanPhoneTitle">转让手机号</span>： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text2"  maxLength=25 /> 
        <input class="base" type="checkbox" value="1" id="haomaleixing" name="haomaleixing" />3G 
        <span id="Title_Tip"></span>
        <input type="hidden" name="souhaoma" id="souhaoma" /> 
    </td> 
</tr> 
<%--<tr id="tt" style="display: none" class="pb"> 
    <td class="t"> 选择标签： </td> 
    <td> 
        <ul class="tag3" id="tagul"> </ul>
        <span id="infotag_Tip"></span> 
    </td> 
</tr> --%>

<tr> 
    <td class="t"> 号码特征： </td> 
    <td> <input type="text" name="tezheng" id="tezheng" value='' class="text2"  Except='null'  maxLength=6 /><span id="tezheng_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> 所在小区： </td> 
    <td> <input class="text2" type="text" id="xiaoqu" name="quanjuxiaoqu" value='' maxLength=30/> 
        <span id="xiaoqu_Tip"></span> 
        <input type="hidden" name="xiaoqu" id="hidxiaoqu" value='' />
        <input type="hidden" name="gongjiaoxian" id="gongjiaoxian" value='' />
        <input type="hidden" name="gongjiaozhan" id="gongjiaozhan" value='' />
        <input type="hidden" name="ditiexian" id="ditiexian" value='' />
        <input type="hidden" name="ditiezhan" id="ditiezhan" value='' />
        <input type="hidden" name="daxue" id="daxue" value='' /> 
        <input type="hidden" name="dizhi" id="dizhi" value='' class="text1" /> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 价 格： </td> 
    <td> 
        <input class="text3 gray" type="text" id="MinPrice" f="{0}元" name="MinPrice" value='面议'  Except='面议'  maxLength=5 /> 元
        <span id="MinPrice_Tip"></span> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="OtherRows" runat="server">
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var sale = new SaleMobileNumber();
        sale.ObjectType = parseInt($("#ObjectType").val(), 10);
        sale.Number = $("#Title").val();
        sale.Is3G = $("#haomaleixing").attr("checked");
        sale.Character = $("#tezheng").val();
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
    function formValidatorSuccess() {
        clearPicValue();
        $('#souhaoma').val($('#Title').val());
        $("#hidxiaoqu").val($("#xiaoqu").val());
        if ($("#xiaoqu").css("display") != 'none' && ($("#hidxiaoqu").val() == "" || $("#hidxiaoqu").val() == undefined)) {
            $.c.xiaoqu.getLineValue(79, $("#xiaoqu").val());
            posting();
            post();
        }
        return false; //阻止表单提交.
    }
    $(document).ready(function () {
        $('#xiaoqu').bind('keyup', function () { $('#dizhi').val(''); });
        refreshPhoneBoxLable();
        refresh3G();
        $('#Title').focus(getTitleFocusTip);
        change(null);
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            clearPicValue();
//            $('#souhaoma').val($('#Title').val());
//            $("#hidxiaoqu").val($("#xiaoqu").val());
//            if ($("#xiaoqu").css("display") != 'none' && ($("#hidxiaoqu").val() == "" || $("#hidxiaoqu").val() == undefined)) {
//                return true;
//            }
//            $.c.xiaoqu.getLineValue(79, $("#xiaoqu").val()); 
//            return false;
//        } 
//        });
        $("#ObjectType").formValidator({ tipid: "ObjectType_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择类别" });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: '', q2b: true }).functionValidator({ fun: function (val, elem) { return checkPhoneTitle(); } });
        $('#shoujihaoma').formValidator({ tipid: 'shoujihaoma_Tip', onfocus: '只能填写一个手机号码，请正确填写', q2b: true }).regexValidator({ regexp: "", onerror: "" });
        $("#MinPrice").formValidator({ tipid: "MinPrice_Tip", onfocus: "只能填写数字", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请正确填写价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请正确填写价格#价格为整数，且不能为0" });
        $('#tezheng').formValidator({ tipid: 'tezheng_Tip', onfocus: "", q2b: true, 'empty': true }).regexValidator({ regexp: "^\\S+$#^(.){0,6}$", onerror: "请输入号码特征，不超过6个字#号码特征最多能填写6个字" });
        $("#xiaoqu").formValidator({ tipid: "xiaoqu_Tip", onfocus: "1~30个字，不能填写电话和特殊符号", 'empty': true, q2b: true }).inputValidator({ onerror: "请输入物品所在小区" }).regexValidator({ regexp: "^((?!电话|手机|联系方式|号码).)*$", onerror: "小区里不能填写电话" }).functionValidator({ fun: function (val, elem) { $('#tooltip1div').hide(); var r = $.formValidator.IsNum(val); return !r; }, onerror: "小区不能为纯数字" });
    });
    try {
        $.j.initEffectiveDate();
    } catch (E) {
    }
    function change(obj) {
        refreshPhoneBoxLable(); redrawTitle();
    }
    function getTypeIndex() {
        return $.c.common.getRadioIndex('type');
    }
    function refreshPhoneBoxLable() {
        var _tip, _width; if (getTypeIndex() == 0) {
            _tip = '转让手机号'; _width = '100px';
        }
        else {
            _tip = '标 题'; _width = '300px';
        }
        $('#spanPhoneTitle').html(_tip);
        $('#Title').width(_width);
    }
    function getTitleFocusTip() {
        var str = '';
        if (getTypeIndex() == 0) {
            str = '只能填写一个手机号码，请正确填写';
        }
        else {
            str = '6-25个字，不能填写特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置';
        }
        $.formValidator.setTipState($('#Title').get(0), 'onFocus', str, 'Title_Tip');
    }
    function checkPhoneTitle() {
        var result; var err_empty = ''; var pattern = ''; var err_msg = '';
        if (getTypeIndex() == 0) { err_empty = '号码不能为空'; pattern = '^(13|14|15|18)\\d{9}$'; err_msg = '请正确填写手机号码'; var _lx = $.c.common.getSelectedText('ObjectType'); if (_lx == '小灵通' || _lx == '铁通') { pattern = '^[1-9](\\d{6}|(\\d{7})|(\\d{10}))$'; err_msg = '请正确填写' + _lx + '号码'; } } else {
            err_empty = '标题不能为空'; pattern = '^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$'; err_msg = '请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！';
        }
        var val = $('#Title').val();
        if (val.length == 0) {
            return err_empty;
        }
        var arrPattern = pattern.split('#');
        var arrError = err_msg.split('#');
        for (var i = 0; i < arrPattern.length; i++) {
            if (!val.match(new RegExp(arrPattern[i]))) {
                return arrError[i];
            }
        } return true;
    }
    function redrawTitle() {
        $('#Title').get(0).className = 'text1';
        $('#Title_Tip').html('').removeAttr('class');
    }
    function refresh3G() {
        var _lx = $.c.common.getSelectedText('ObjectType');
        if (_lx == '小灵通' || _lx == '铁通') {
            $('#haomaleixing').attr('disabled', 'disabled');
        }
        else {
            $('#haomaleixing').attr('disabled', '');
        }
    } 
</script>
</asp:Content>
