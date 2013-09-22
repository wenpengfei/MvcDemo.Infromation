<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/HouseMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IHouse>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
        <td class="t"> <b class="red">*</b> 供 求： </td> 
            <td>  
                <label> <input id="type_0" f="{0}" class="base" type="radio" name="type" value='1' checked onclick="change(this)" />出租</label>&nbsp;&nbsp;&nbsp;&nbsp;  
                <label> <input id="type_1" f="{0}" class="base" type="radio" name="type" value='2'  onclick="change(this)" />求租</label>&nbsp;&nbsp;&nbsp;&nbsp;  
                <label> <input id="type_2" f="{0}" class="base" type="radio" name="type" value='3'  onclick="change(this)" />出售</label>&nbsp;&nbsp;&nbsp;&nbsp;  
                <label> <input id="type_3" f="{0}" class="base" type="radio" name="type" value='4'  onclick="change(this)" />求购</label>&nbsp;&nbsp;&nbsp;&nbsp;  
                <span id="type_message"></span> 
            </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 标 题： </td> 
            <td> 
            <input type="text" name="Title" id="Title" f="{0}" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> 
            </td> 
    </tr> 
    <tr id="xq1"> 
        <td class="t"> <b class="red">*</b> 楼盘名称： </td> 
        <td> <input class="text4" type="text" id="loupan" name="loupan" f="{0}" value=''  maxLength=30/> <span id="loupan_Tip"></span> </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> <span id="dd">地 段</span><span id="qwdd">期望地段</span>： </td> 
        <td> 
            <span id="d1"> <input f="{0}" class="text2" type="text" id="diduan" name="diduan" value=''  maxLength=12/> </span>
            <span id="w1">或</span>  
            <span id="d2"> 
            <input f="{0}" class="text2" type="text" id="diduan2" name="diduan2" value=''  Except='null'  maxLength=12/> </span> 
            <span id="w2">或</span>  <span id="diduan_Tip"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 类 型： </td> 
        <td> 
        <select name="ObjectType" id="ObjectType" f="{0}">  
            <%--<option value='1' selected> 写字楼</option>  
            <option value='2' > 商务中心</option>  
            <option value='3' > 商住公寓</option>--%>
            <%
                foreach (var item in HouseOffice.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>'><%=item.Name %></option>
                    <%
                }
             %>  
        </select>&nbsp; 
        <input id="zhuce_1" class="base" type="checkbox" f="{0}" value='1' name="zhuce"  /><label>可注册公司</label> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        面积： <span id="a1"><input f="{0}" type="text" class="text3" id="area1" value=''  maxLength=7/>平米 </span> 
        <span id="a2">- &nbsp; <input f="{0}" type="text" class="text3" id="area2" value=''  maxLength=7/>平米 </span> 
        <span id="area_Tip"></span> 
        <%--<input type="hidden" value="" name="area" id="hidarea" />--%> 
        </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 价 格： </td> 
    <td> 
    <span id="p1"> <input f="{0}" type="text" id="MinPrice1" class="text3 gray" value='面议'  Except='面议'  maxLength=8/> </span> 
    <span id="p2">- &nbsp; <input f="{0}" type="text" id="MinPrice2" class="text3 gray" value=''  Except='面议'  maxLength=8/> </span> 
    <select name="danwei" id="danwei"> 
        <option value='1' selected="selected">元/㎡/天</option> 
        <option value='2' >元/月</option>  
    </select> 
    <span id="dawei1" style="display: none">万元</span><span id="MinPrice_Tip"></span> 
    <%--<input type="hidden" value="面议" name="MinPrice" id="hidprice" />--%> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var house = new HouseOffice();
        house.Type = parseInt(getRadioValue("type"), 10) + 1;
        house.Title = $("Title").val();
        if (house.Type == 1 || house.Type == 3) {
            house.BuildingName = $("#loupan").val();
        }
        house.District1 = $("#diduan").val();
        house.District2 = $("#diduan2").val();
        house.ObjectType = parseInt($("#ObjectType").val(), 10);
        house.RegCompany = $("#zhuce_1").attr("checked");
        house.Area = parseInt($("#area1").val(), 10);
        if (house.Type == 2 || house.Type == 4) {
            house.Area2 = parseInt($("#area2").val(), 10);
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
        if (house.Type == 1 || house.Type == 2) {
            house.PriceUnit = parseInt($("#danwei").val(), 10);
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
        $.c.Disabletor.initSubValue("a2", "area1", "area2", "hidarea");
        $.c.Disabletor.initSubValue("p2", "MinPrice1", "MinPrice2", "hidprice");
        disabledHiddenControl('danwei');
        posting();
        post();
        return false; //阻止表单提交.
    }
    $(document).ready(function () {
        showBizTip();
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            $.c.Disabletor.initSubValue("a2", "area1", "area2", "hidarea");
//            $.c.Disabletor.initSubValue("p2", "MinPrice1", "MinPrice2", "hidprice");
//            disabledHiddenControl('danwei');
//            //return true;
//            post();
//            return false;
//        }
//        });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br>例：新华书店附近5A级写字楼", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#loupan").formValidator({ tipid: "loupan_Tip", onfocus: "2～30个字，不能填写电话和特殊符号", q2b: true }).inputValidator({ onerror: "请输入楼盘名称" }).regexValidator({ regexp: "\\S+#^(.){2,30}$", onerror: "请输入楼盘名称#楼盘名称不足2个字" });
        $("#diduan").formValidator({ tipid: "diduan_Tip", onfocus: "2-12个字之间，不能填写特殊符号", q2b: true }).inputValidator({ onerror: "请输入房源地段" }).regexValidator({ regexp: "\\S+#^(.){2,12}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "请输入房源地段#房源地段不足2个字#房源地段里不能输入电话" });
        $("#diduan2").formValidator({ tipid: "diduan_Tip", onfocus: "2-12个字之间，不能填写特殊符号", q2b: true, 'empty': true }).regexValidator({ regexp: "^(.){2,12}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "房源地段不足2个字#房源地段里不能输入电话" });
        $("#MinPrice1").formValidator({ tipid: "MinPrice_Tip", onfocus: "只能填数字", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请输入价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,7}(\\.\\d{1,1})?$", onerror: "请输入价格#价格不能为0，允许一位小数" }).groupValidator({ groupName: "linePrice", nextgroupid: "MinPrice2" });
        $("#MinPrice2").formValidator({ tipid: "MinPrice_Tip", onfocus: "只能填数字", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请输入价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,7}(\\.\\d{1,1})?$", onerror: "请输入价格#价格不能为0，允许一位小数" }).groupValidator({ groupName: "linePrice", nextgroupid: "MinPrice1" });
        $("#area1").formValidator({ tipid: "area_Tip", onfocus: "最多可填写6位大于0的整数", q2b: true }).inputValidator({ onerror: "请输入面积" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,6}$", onerror: "请输入面积#面积为0以外的整数" }).groupValidator({ groupName: "lineArea", nextgroupid: "area2" });
        $("#area2").formValidator({ tipid: "area_Tip", onfocus: "最多可填写6位大于0的整数", q2b: true }).inputValidator({ onerror: "请输入面积" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,6}$", onerror: "请输入面积#面积为0以外的整数" }).groupValidator({ groupName: "lineArea", nextgroupid: "area1" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { var _r = $.formValidator.checkContent(val); if (typeof _r == "string") return _r; if (_r) { if (val == _contentTip) return '请填写补充说明'; return true; } } });
    });
    var w1 = document.getElementById("w1");
    var w2 = document.getElementById("w2");
    function change(o) {
        if (!o) {
            var list = document.getElementsByName("type");
            for (var i = 0; i < list.length; i++) {
                if (list[i].checked) { o = list[i]; break; }
            }
        }
        $.c.Disabletor.setdisable([{ v: 0, a: "d3|MinPrice2|p2|a2|area2|dawei1|diduan3|qwdd", t: 1, c: function () {
            w1.innerHTML = '附近的'; w2.innerHTML = '位置';
            $("#pdv").css("display", "");
        }
        }, { v: 1, a: "dawei1|dd|xq1|loupan", t: 1, c: function () {
            w1.innerHTML = '或'; w2.innerHTML = ' ';
            $("#pdv").css("display", "none");
        }
        }, { v: 2, a: "d3|diduan3|a2|area2|p2|MinPrice2|danwei|qwdd", t: 1, c: function () {
            w1.innerHTML = '附近的'; w2.innerHTML = '位置'; $("#pdv").css("display", "");
            //$("#danwei").val("-1");
            $("#danwei").val("1");
        }
        }, { v: 3, a: "danwei|dd|xq1|loupan", t: 1, c: function () {
            w1.innerHTML = '或'; w2.innerHTML = ''; $("#pdv").css("display", "none");
            //$("#danwei").val("-1");
            $("#danwei").val("1");
        }
        }], o.value, 0); $.c.Disabletor.initValue("hidprice", "MinPrice1", "MinPrice2", 1, 0); $.c.Disabletor.initValue("hidarea", "area1", "area2", 1, 0);
    } try { $.j.initEffectiveDate(); } catch (E) { } change(); var _contentTip = '描述配套设施，优惠政策，交通情况等。';
    $.j.initContentTip(_contentTip);
    function showBizTip() {
        var cbx = $(':checkbox[name="IsBiz"]');
        if (cbx.attr('disabled')) {
            cbx.parent().hide(); cbx.parent().after('<font color="red">经纪人</font>');
        }
        else {
            $('span[name="biz_shenfen"]').hide();
        }
        $("#id_agent_tip").hover(function () {
            $('#agent_tip').css('display', '');
        }, function () {
            $('#agent_tip').css('display', 'none');
        });
    }
    function disabledHiddenControl(idString) {
        var arrID = idString.split(',');
        for (var i = 0; i < arrID.length; i++) {
            var _id = $.trim(arrID[i]);
            var _obj = $('#' + _id + ':hidden');
            if (_obj.length > 0) {
                _obj.attr('disabled', 'disabled');
            }
        }
    }
</script>
</asp:Content>
