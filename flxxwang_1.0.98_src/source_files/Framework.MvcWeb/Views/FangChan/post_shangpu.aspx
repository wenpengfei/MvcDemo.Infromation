<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/HouseMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IHouse>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 供 求： </td> <td>  <label> 
        <input id="type_0" f="{0}" class="base" type="radio" name="type" value='1' checked onclick="change(this)" /><span>出售</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input id="type_1" f="{0}" class="base" type="radio" name="type" value='2'  onclick="change(this)" /><span>求购</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input id="type_2" f="{0}" class="base" type="radio" name="type" value='3'  onclick="change(this)" /><span>出租</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input id="type_3" f="{0}" class="base" type="radio" name="type" value='4'  onclick="change(this)" /><span>求租</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input id="type_4" f="{0}" class="base" type="radio" name="type" value='5'  onclick="change(this)" /><span>转让</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <span id="type_Tip"></span> 
    </td> 
    </tr> 
    <tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25/> <span id="Title_Tip"></span> </td> 
    </tr> 
    <tr> 
    <td class="t"> <b class="red">*</b> <span id="qiwangdiduan">期望</span>地段： </td> <td> 
    <input class="text2" type="text" id="diduan" f="{0}" name="diduan" value=''  maxLength=12/> <span id="w1">或</span> 
    <input class="text2" type="text" id="diduan2" f="{0}" name="diduan2" value=''  Except='null'  maxLength=12/> <span id="w2">或</span>  <span id="diduan_Tip"></span> 
    </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 基本情况： </td> 
        <td> 
        <select name="ObjectType" id="ObjectType" f="{0}">  
            <%--<option value='1' selected> 商铺/门面/店面</option>  
            <option value='2' > 摊位/柜台</option>  
            <option value='3' > 底商</option>  
            <option value='4' > 其他</option>--%>
            <%
                foreach (var item in HouseShop.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>'><%=item.Name %></option>
                    <%
                }
             %>  
        </select> 
        <span id="jy">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;打算经营：<input type="text" id="jingying" class="text2" name="jingying" value=''  Except='null'  maxLength=10/></span> 
        <span id='lishi'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历史经营项目：<input class="text2" type="text" id="lishijingying" name="lishijingying" value=''  maxLength=12/></span>  
        <span id="lishijingying_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> <span id="qiwangzujin">期望</span><span id="mn">租金</span>： </td> 
    <td> 
    <span id="p1"><input f="{0}" type="text" id="MinPrice1" class="text3 gray" value='面议'  Except='面议'  maxLength=7/></span> 
    <span id="p2"> - &nbsp;<input f="{0}" type="text" id="MinPrice2" class="text3 gray" value=''  Except='面议'  maxLength=7/></span> 
    <span id="md"></span> 
    <select name="danwei" id="danwei">  
        <option value='1' > 元/㎡/天</option>  
        <option value='2' > 元/月</option>  
    </select> <span id="zrf">  &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    转让费：<input type="text" class="text3 gray" id="zhuanrangfei" name="zhuanrangfei" value='面议'  Except='面议'  maxLength=6/>万元 
    <span id="zrf_chk">  <input class="base" type="checkbox" value='1' name="zhuanrang"  />能接受转让费 </span> </span> <span id="MinPrice_Tip"></span> 
    <input type="hidden" value="面议" name="MinPrice" id="hidprice" /> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> <span id="qiwangmianji">期望</span>面积： </td> 
    <td> 
        <span id="a1"><input f="{0}平米" type="text" class="text3" id="area1" value=''  maxLength=5/></span>平米 
        <span id="a2"> -<input f="{0}平米" type="text" class="text3" id="area2" value=''  maxLength=5/>平米</span>  
        <span id="dawei1" style="display: none"></span><span id="area_Tip"></span> 
        <%--<input type="hidden" value="" name="area" id="hidarea" />--%> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var house = new HouseShop();
        house.Type = parseInt(getRadioValue("type"), 10);
        house.Title = $("#Title").val();
        house.District1 = $("#diduan").val();
        house.District2 = $("#diduan2").val();
        house.ObjectType = parseInt($("#ObjectType").val(), 10);
        if (house.Type == 1 || house.Type == 3 || house.Type == 5) {
            house.Management = $("#lishijingying").val();
        }
        else {
            house.Management = $("#jingying").val();
        }
        house.Price = $("#MinPrice1").val();
        if (house.Price == "" || house.Price == "面议") {
            house.Price = 0;
        }
        else {
            house.Price = parseInt(house.Price, 10);
        }
        if (house.Type == 2 || house.Type == 4) {
            house.Price2 = $("#MinPrice2").val();
            if (house.Price2 == "" || house.Price2 == "面议") {
                house.Price2 = 0;
            }
            else {
                house.Price2 = parseInt(house.Price2, 10);
            }
        }
        if (house.Type == 3) {
            house.PriceUnit = parseInt($("#danwei").val(), 10);
        }
        if (house.Type == 5) {
            house.PriceTransfer = $("#zhuanrangfei").val();
            if (house.PriceTransfer == "" || house.PriceTransfer == "面议") {
                house.PriceTransfer = 0;
            }
            else {
                house.PriceTransfer = parseInt(house.PriceTransfer, 10);
            }
        }
        house.Area = parseInt($("#area1").val(), 10);
        if (house.Type == 2 || house.Type == 4) {
            house.Area2 = parseInt($("#area2").val(), 10);
        }
        FillData(house);
        house.Id = -1;
        house.DateCreated = new Date().toJson(true);
        house.DateModified = house.DateCreated;
        house.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    function formValidatorSuccess() {
        disabledHiddenControl('danwei');
        posting();
        post();
        return false; //阻止表单提交.
    }
    $(document).ready(function () {
        showBizTip();
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            //$.c.Disabletor.initSubValue("p2", "MinPrice1", "MinPrice2", "hidprice");
//            //$.c.Disabletor.initSubValue("a2", "area1", "area2", "hidarea");
//            disabledHiddenControl('danwei');
//            post();
//            return false;
//            //return true;
//        }
//        });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" }); $("#diduan").formValidator({ tipid: "diduan_Tip", onfocus: "2-12个字之间，不能填写特殊符号", q2b: true }).inputValidator({ onerror: "请输入房源地段" }).regexValidator({ regexp: "\\S+#^(.){2,12}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "请输入房源地段#房源地段不足2个字#房源地段里不能输入电话" });
        $("#diduan2").formValidator({ tipid: "diduan_Tip", onfocus: "2-12个字之间，不能填写特殊符号", q2b: true, 'empty': true }).regexValidator({ regexp: "^(.){2,12}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "房源地段不足2个字#房源地段里不能输入电话" });
        $("#jingying").formValidator({ tipid: "lishijingying_Tip", onfocus: "2-12个字之间，不能填写特殊符号", q2b: true, 'empty': true }).regexValidator({ regexp: "^(.){2,10}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "经营项目不足2个字#经营项目里不能填写电话" });
        $("#lishijingying").formValidator({ tipid: "lishijingying_Tip", onfocus: "2-12个字之间，不能填写特殊符号", q2b: true }).regexValidator({ regexp: "\\S+#^(.){2,12}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "请输入历史经营项目#经营项目不足2个字#经营项目里不能填写电话" });
        $("#MinPrice1").formValidator({ tipid: "MinPrice_Tip", onfocus: "租金只能为整数", q2b: true, 'defaultvalue': '面议' }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,6}(\\.\\d{1,1})?$", onerror: "请填写租金#金额不能为0，允许一位小数" }); $("#MinPrice2").formValidator({ tipid: "MinPrice_Tip", onfocus: "租金只能为整数", q2b: true, 'defaultvalue': '面议' }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,6}(\\.\\d{1,1})?$", onerror: "请填写租金#金额不能为0，允许一位小数" });
        $("#zhuanrangfei").formValidator({ tipid: "MinPrice_Tip", onfocus: "转让费，允许一位小数", q2b: true, 'defaultvalue': '面议' }).regexValidator({ regexp: "^\\S+$#^\\d{1,4}(\\.\\d{1,1})?$", onerror: "请填写转让价格#请正确输入转让费，允许一位小数" }); $("#area1").formValidator({ tipid: "area_Tip", onfocus: "面积只能填写5位以下数字", q2b: true }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请填写面积#面积为0以外的整数" });
        $("#area2").formValidator({ tipid: "area_Tip", onfocus: "面积只能填写5位以下数字", q2b: true }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请填写面积#面积为0以外的整数" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "补充说明太过简单" });
    });
    var w1 = document.getElementById("w1"); var w2 = document.getElementById("w2"); var mn = document.getElementById("mn"); var md = document.getElementById("md"); function change(o) {
        if (!o) { var list = document.getElementsByName("type"); for (var i = 0; i < list.length; i++) { if (list[i].checked) { o = list[i]; break; } } } $.c.Disabletor.setdisable([{ v: 2, a: "d3|diduan3|a2|area2|p2|MinPrice2|danwei1|zrf_chk|zrf|zhuanrangfei|jy|jingying|qiwangmianji|qiwangdiduan|qiwangzujin", t: 1, c: function () {
            w1.innerHTML = '邻近'; w2.innerHTML = '位置'; mn.innerHTML = '租 金'; md.innerHTML = '';
            $("#pdv").css("display", "");
        }
        }, { v: 3, a: "danwei1|lishi|lishijingying|bilin|zrf|danwei", t: 1, c: function () {
            w1.innerHTML = '或'; w2.innerHTML = ' '; mn.innerHTML = '租金'; md.innerHTML = '元/月';
            $("#spanNewUpload").css("display", "none"); $("#spanOldUpload").css("display", "none");
            $("#btnUploadpic").css("display", "none"); $("#pdv").css("display", "none");
        }
        }, { v: 4, a: "d3|diduan3|a2|area2|p2|MinPrice2|danwei1|zrf_chk|jy|jingying|danwei|qiwangmianji|qiwangdiduan|qiwangzujin", t: 1,
            c: function () {
                w1.innerHTML = '邻近'; w2.innerHTML = '位置'; mn.innerHTML = '租 金'; md.innerHTML = '元/月';
                $("#pdv").css("display", "");
            }
        }, {
            v: 0, a: "d3|diduan3|a2|area2|p2|MinPrice2|danwei1|zrf_chk|zrf|zhuanrangfei|jy|jingying|fukuanfangshi|danwei|qiwangmianji|qiwangdiduan|qiwangzujin", t: 1,
            c: function () {
                w1.innerHTML = '邻近'; w2.innerHTML = '位置'; mn.innerHTML = '售 价'; md.innerHTML = '万元'; $("#pdv").css("display", "");
            }
        }, { v: 1, a: "danwei|zrf_chk|zrf|lishi|lishijingying|bilin|fukuanfangshi|zhuanrangfei|danwei", t: 1,
            c: function () {
                w1.innerHTML = '或'; w2.innerHTML = ' '; mn.innerHTML = '售价'; md.innerHTML = '万元'; $("#pdv").css("display", "none");
            }
        }], o.value, 0);
        $.c.Disabletor.initValue("hidprice", "MinPrice1", "MinPrice2", 1, 0); $.c.Disabletor.initValue("hidarea", "area1", "area2", 1, 0);
    } try {
        $.j.initEffectiveDate();
    } catch (E) {
    } change();
    function showBizTip() {
        var cbx = $(':checkbox[name="IsBiz"]'); if (cbx.attr('disabled')) {
            cbx.parent().hide(); cbx.parent().after('<font color="red">经纪人</font>');
        }
        else {
            $('span[name="biz_shenfen"]').hide();
        }
        $("#id_agent_tip").hover(function () {
            $('#agent_tip').css('display', '');
        }, function () { $('#agent_tip').css('display', 'none'); });
    } function disabledHiddenControl(idString) {
        var arrID = idString.split(',');
        for (var i = 0; i < arrID.length; i++) {
            var _id = $.trim(arrID[i]);
            var _obj = $('#' + _id + ':hidden'); if (_obj.length > 0) { _obj.attr('disabled', 'disabled'); }
        }
    }
</script>
</asp:Content>
