<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/TicketMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ITicket>" %>
<%@ Import Namespace="Infomation.Core"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="Rows" runat="server">
<tr> 
    <td class="t"> 我要： </td> 
    <td class="checkpb">  
        <label> <input type="radio" name="type" onclick='change(this)' value='0' checked />转让</label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input type="radio" name="type" onclick='change(this)' value='1'  />求购</label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <span id="type_message"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 出发站： </td> 
    <td> 
        <input class="text5" type="text" id="StartStation" name="StartStation" value=''  maxLength=5/> 
        <span id="StartStation_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 到达站： </td> 
    <td>
        <input class="text5" type="text" id="EndStation" name="EndStation" value=''  maxLength=5/> 
        <span id="EndStation_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 车次： </td> 
    <td> 
        <input class="text5" type="text" id="Num" name="Num" value='不限'  Except='不限'  maxLength=10/> 
        <span class="gray" id="qgcheci">多个车次请用逗号隔开 例如：T103,T4565</span> 
        <span id="Num_Tip"></span> 
    </td> 
</tr> 
<tr style="display: none"> 
    <td class="t"> <input type="hidden" name="Title" id="Title" value='' class="text1" /> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 发车日期： </td> 
    <td> 
        <script type="text/javascript" src="/Content/Fenlei/Scripts/datepick/datepick.js"></script> 
        <link type="text/css" rel="stylesheet" href="/Content/Fenlei/Scripts/datepick/redmond.datepick.css" /> 
        <script type="text/javascript">
            $(function () {
                var now = new Date();
                var lastdate = new Date(new Date().setDate(now.getDate() + 20));
                $('#StartTime').datepick({ monthsToShow: 2, monthsToStep: 1, showOnFocus: true, yearRange: "-0:+1", minDate: now, maxDate: lastdate, onSelect: function () { $(this).blur(); } }); $('#EndTime').datepick({ monthsToShow: 2, monthsToStep: 1, showOnFocus: true, yearRange: "-0:+1", minDate: now, maxDate: lastdate, onSelect: function () { $(this).blur(); } });
            }); 
        </script> 
        <input type="text" id="StartTime" name="StartTime" class="text5" value=''  maxLength=10 readonly="readonly" />
        <span id="qgdate"> 至 
        <input type="text" id="EndTime" name="EndTime" class="text5" value=''   readonly="readonly" />
        </span> 
        <input type="hidden" name="preDayAllow" id="preDayAllow" value="false" /> <span id="StartTime_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> 类型： </td> 
    <td> 
        <select id="zr_ObjectType" style="display:none"></select>
        <select id="qg_ObjectType" style="display:none"></select> 
        <select name="ObjectType" id="ObjectType">  
            <%--<option value='1' selected> 硬座</option>  
            <option value='4' > 软座</option>  
            <option value='3' > 硬卧</option>  
            <option value='2' > 软卧</option>  
            <option value='0' > 站票</option>  
            <option value='5' > 一等座</option>  
            <option value='6' > 二等座</option>  
            <option value='7' > 座票</option>  
            <option value='8' > 卧铺</option>--%>
            <%
                foreach (var item in TicketTrain.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>'><%=item.Name %></option>
                    <%
                }
             %>  
        </select>
        <span id="ObjectType_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> 张数： </td> 
    <td><input class="text3" type="text" id="count" name="count" value='1'  Except='1'  maxLength=1/> 张 <span id="count_Tip"></span> </td> 
</tr> 
<%--<tr id="price1" style="display:none"> 
    <td class="t"> 价 格： </td> 
    <td class="checkpb">  
        <label> <input type="radio" name="MinPrice" value='1'  />原价转让</label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label><input type="radio" name="MinPrice" value='2' checked />原价+5元手续费</label>&nbsp;&nbsp;&nbsp;&nbsp;  <span id="MinPrice_Tip"></span> 
    </td> 
</tr> 
<tr style="display: none"> 
    <td class="t"> <b class="red">*</b> 补充说明： </td> 
    <td> <textarea name="Content" class="textarea2"  Except='null'  maxLength=2000 id="Content"></textarea> <span id="Content_Tip"></span> </td> 
</tr>--%>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var ticket = new TicketTrain();
        ticket.Type = parseInt(getRadioValue("type"), 10) + 1;
        ticket.StartStation = $("#StartStation").val();
        ticket.EndStation = $("#EndStation").val();
        ticket.Number = $("#Num").val();
        if (ticket.Type == 1) {
            var d = new Date();
            var s = $("#StartTime").val();
            d.setYear(parseInt(s.slice(0, 4), 10));
            d.setMonth(parseInt(s.slice(5, 7) - 1, 10));
            d.setDate(parseInt(s.slice(8, 10), 10));
            d.setHours(0, 0, 0, 0);
            ticket.Time =d.toJson(true);
        }
        else {
            var d = new Date();
            d.setHours(0, 0, 0, 0);

            var s = $("#StartTime").val();
            d.setYear(parseInt(s.slice(0, 4), 10));
            d.setMonth(parseInt(s.slice(5, 7) - 1, 10));
            d.setDate(parseInt(s.slice(8, 10), 10));

            ticket.StartTime =d.toJson(true);

            s = $("#EndTime").val();
            d.setYear(parseInt(s.slice(0, 4), 10));
            d.setMonth(parseInt(s.slice(5, 7) - 1, 10));
            d.setDate(parseInt(s.slice(8, 10), 10));

            ticket.EndTime =d.toJson(true);
        }
        ticket.ObjectType = parseInt($("#ObjectType").val(), 10);
        ticket.Count = parseInt($("#count").val(), 10);
        FillData(ticket);
        ticket.Id = -1;
        ticket.DateCreated = new Date().toJson(true);
        ticket.DateModified = ticket.DateCreated;
        ticket.Insert(onSuccess, onFailed);
    }
</script>

<script id="postScript" type="text/javascript">
    function formValidatorSuccess() {
        setValueToObjectType();
        $.j.appendvalue();
        $('#Title').val(clearEmptyChar($('#Title').val()));
        posting();
        post();
        return false; //阻止表单提交.
    }
    $(document).ready(function () {
        $("#lbBiz").css("display", "none");
        //        $.j.asynPhone('37800967', '0', '', '');
        //        $.c.user.unlogin("login"); 
        refreshNumText();
        SetEffectiveDate();
        $('#Num').blur(function () {
            var v = $(this).val();
            $(this).val(v.toUpperCase()); refreshNumText();
        }).focus(function () {
            if (getTypeIndex() == 1) {
                if ($(this).val() == $(this).attr('except')) {
                    $(this).val('');
                }
            }
        });
        initTwoObjectType();
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            setValueToObjectType();
//            $.j.appendvalue();
//            $('#Title').val(clearEmptyChar($('#Title').val()));
//            post();
//            return false;
//            //return true;
//        }
//        });
        $("#StartStation").formValidator({ tipid: "StartStation_Tip", onfocus: "", q2b: true, fun: function () { $.j.appendvalue(); } }).inputValidator({ onerror: "请输入起点" }).regexValidator({ regexp: "^\\S+$#^([\\u4e00-\\u9fa5]){2,5}$", onerror: "请输入起点#出发站名只能输入汉字" });
        $("#EndStation").formValidator({ tipid: "EndStation_Tip", onfocus: "", q2b: true, fun: function () { $.j.appendvalue(); } }).inputValidator({ onerror: "请输入终点" }).regexValidator({ regexp: "^\\S+$#^([\\u4e00-\\u9fa5]){2,5}$", onerror: "请输入终点#到达站只能输入汉字" });
        $("#Num").formValidator({ tipid: "Num_Tip", onfocus: "", q2b: true, fun: function () { $.j.appendvalue(); } }).inputValidator({ onerror: "请输入车次" }).functionValidator({ fun: function (val, elem) { return regCheckNum(); } });
        $("#count").formValidator({ tipid: "count_Tip", onfocus: "", q2b: true, 'defaultvalue': '1', fun: function () { $.j.appendvalue(); } }).inputValidator({ onerror: "请输入车次" }).regexValidator({ regexp: "^\\S+$#^[1-3]$", onerror: "请输入张数#张数请控制在1~3之间" });
        //    $('#IM').formValidator({ tipid: 'IM_Tip', onfocus: '只能填写一个qq或msn。<br>格式如：123456 或 myname@flxxwang.com', q2b: true, 'empty': true }).regexValidator({ regexp: "(^[1-9]\\d{4,9}$)|(^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$)", onerror: "QQ或MSN输入错误" });
        $("#StartTime").formValidator({ tipid: "StartTime_Tip", onfocus: "", q2b: true }).inputValidator({ onerror: "请输入发车时间" }).regexValidator({ regexp: "^\\S+$", onerror: "请输入发车时间" }).groupValidator({ groupName: "lineDate", nextgroupid: "EndTime" });
        $('#EndTime').formValidator({ tipid: 'StartTime_Tip', onfocus: '' }).functionValidator({ fun: function (val, elem) { return checkTwoDate(); } }).groupValidator({ groupName: "lineDate", nextgroupid: "StartTime" });
        //    $("#Phone").formValidator({ tipid: "Phone_Tip", onfocus: "请正确填写电话号码，分机可以用“-”分开", q2b: true }).inputValidator({ onerror: "请填写电话号码" }).regexValidator({ regexp: "(^(0\\d{2,3})?-?([2-9]\\d{6,7})(-\\d{1,5})?$)|(^((\\(\\d{3}\\))|(\\d{0}))?(13|14|15|18)\\d{9}$)|(^(400|800)\\d{7}(-\\d{1,5})?$)|(^(95013)\\d{6,8}$)", onerror: "电话填写错误。<br/>请参照格式填写：87654321-001或138********" });
        //    $('#goblianxiren').formValidator({ tipid: 'goblianxiren_Tip', onfocus: '2~6个字，不能填写电话和联系方式', q2b: true }).regexValidator({ regexp: "\\S+#^(.){2,6}$#^[\\w\\d\\s\\u4e00-\\u9fa5]*$", onerror: "请输入联系人#联系人不足2个字#联系人不能填写特殊符号" });
    });
    function change(o) {
        refreshNumText();
        redrawNumTip();
        redrawGoDate();
        showObjectType();
        if (!o) {
            var list = document.getElementsByName("type");
            for (var i = 0; i < list.length; i++) {
                if (list[i].checked) { o = list[i]; break; }
            }
        }
        switch (o.value) {
            case "0":
                {
                    $("#qgcheci").css("display", "none");
                    $("#qgdate").css("display", "none"); break;
                } case "1":
                {
                    $("#qgcheci").css("display", "");
                    $("#qgdate").css("display", ""); break;
                }
        }
    }
    var cityids = []; for (var i = 0; i < cityids.length; i++) {
        if (cityid == cityids[i]) {
            var msg = '<p style="text-indent:2em;">为极响应铁道部及公安信息安全中心严厉打击高价倒卖火车票、利用代购实名制火车票诈骗等行动：</p>' + '<p style="text-indent:2em;"><%=SiteInfo.Name%>深圳火车票频道从即日起暂时关闭火车票信息服务，并对由此给网友带来的不便深感歉意。' + '购买火车票请到火车站或正规售票点，接受他人转让车票一定要慎重，谨防被骗！</p>';
            var json = { 't': 'FORBIDDEN', 'Order': '0', 'msg': msg, 'user': null };
            $.c.Error.S_Message(json); break;
        }
    }
    try { change(); } catch (e) { }
    function SetEffectiveDate() {
        var r = ''; var a = $('#StartTime').val();
        var b = $('#EndTime').val();
        r = b != '' ? b : a; if (r != '')
            $('#EffectiveDate').val(r);
    }
    function getTypeIndex() {
        return $.c.common.getRadioIndex('type');
    }
    function refreshNumText() {
        var _o = $('#Num'); var _v = _o.val();
        var _d = _o.attr('except'); var index = getTypeIndex();
        if (index == 0) {
            if (_v == _d || _v == '') _o.val('');
        }
        else {
            if (_v == '') _o.val(_d);
        }
    }
    function redrawNumTip() {
        $('#Num').get(0).className = 'text5';
        $('#Num_Tip').html('').removeAttr('class');
    }
    function redrawGoDate() {
        $('#StartTime').get(0).className = 'text5';
        $('#EndTime').get(0).className = 'text5';
        $('#StartTime_Tip').html('').removeAttr('class');
    }
    function regCheckNum() { var obj = $('#Num'); var val = obj.val(); var _d = obj.attr('except'); var index = getTypeIndex(); if (val == _d && index == 1) { return true; } var ck = { regexp: "^\\S+$#^((\\d|[a-zA-Z]|[,，/])){2,10}$", onerror: "请输入车次#车次只能输入字母或数字" }; var arrPattern = ck.regexp.split('#'); var arrMessage = ck.onerror.split('#'); for (var i = 0; i < arrPattern.length; i++) { if (!val.match(new RegExp(arrPattern[i]))) { return arrMessage[i]; } } if (index == 0) { if (val.indexOf(',') != -1 || val.indexOf('/') != -1) { return '转让类型不允许输入多个车次'; } } return true; }
    function initTwoObjectType() {
        $('#ObjectType').hide();
        var zr = $('#zr_ObjectType');
        var qg = $('#qg_ObjectType');
        $.c.common.addOptionsToSelect(qg.get(0).id, "", "不限");
        $('#ObjectType option').each(function (index, elem) {
            if (elem.text == '座票' || elem.text == '卧铺') {
                $.c.common.addOptionsToSelect(qg.get(0).id, elem.value, elem.text);
            }
            else {
                $.c.common.addOptionsToSelect(zr.get(0).id, elem.value, elem.text);
            }
        });
        if (isEditState()) {
            var index = getTypeIndex();
            var typeval = $('#ObjectType').val();
            if (index == 0) {
                $.c.common.setSelectedOption('zr_ObjectType', typeval, null);
            }
            else {
                $.c.common.setSelectedOption('qg_ObjectType', typeval, null);
            }
        }
    }
    function showObjectType() {
        var index = getTypeIndex(); var zr = $('#zr_ObjectType');
        var qg = $('#qg_ObjectType'); zr.hide(); qg.hide();
        if (index == 0) {
            zr.show();
        }
        else {
            qg.show();
        }
    }
    function setValueToObjectType() {
        var zr = $('#zr_ObjectType');
        var qg = $('#qg_ObjectType');
        var index = getTypeIndex(); $('#ObjectType').removeAttr('disabled');
        if (index == 0) {
            $.c.common.setSelectedOption('ObjectType', zr.val(), null);
        }
        else {
            if (qg.val() == '') {
                $('#ObjectType').attr('disabled', 'true');
            }
            else {
                $.c.common.setSelectedOption('ObjectType', qg.val(), null);
            }
        }
    }
    function clearEmptyChar(str) {
        return str.replace(new RegExp("(\\s){2,}", 'g'), ' ');
    }
    function isEditState() {
        var infoID = '0'; return infoID != '0';
    }
    function checkTwoDate() {
        var objs = $('#StartTime');
        var obje = $('#EndTime');
        var index = getTypeIndex();
        if (index == 1) {
            var _start = objs.val();
            var _end = obje.val();
            if (_start != '' && _end != '') {
                var iStart = parseInt(_start.replace(new RegExp('-', 'g'), ''));
                var iEnd = parseInt(_end.replace(new RegExp('-', 'g'), ''));
                if (iStart > iEnd) {
                    return '开始日期不能大于结束日期';
                }
            }
        } return true;
    } 
</script>
</asp:Content>
