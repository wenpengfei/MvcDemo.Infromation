<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/HouseMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IHouse>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 出租方式： </td> 
    <td> 
        <label> <input class="base" onclick="tojump(this)" value="1" type="radio" name="HireType">整套出租</label>  &nbsp;&nbsp;&nbsp;&nbsp;
        <label> <input onclick="tojump(this)" id="HireType_0" f="{0}" class="base" type="radio" name="HireType" value='2' checked="checked"/>单间出租</label>  &nbsp;&nbsp;&nbsp;&nbsp;
        <label> <input onclick="tojump(this)" id="HireType_1" f="{0}" class="base" type="radio" name="HireType" value='3' />床位</label>  
        <span id="HireType_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25/> <span id="Title_Tip"></span> </td> 
</tr> 
<tr id="fyxq"> 
    <td class="t"> 
        
        <b class="red">*</b> 所在小区： 
    </td> 
    <td> 
        <input class="text4" type="text" id="xiaoqu" value='' maxLength=30/> 
        <span id="xiaoqu_Tip"></span> 
        <input type="hidden" name="xiaoqu" id="hidxiaoqu" value='' />
        <input type="hidden" name="gongjiaoxian" id="gongjiaoxian" value='' />
        <input type="hidden" name="gongjiaozhan" id="gongjiaozhan" value='' />
        <input type="hidden" name="ditiexian" id="ditiexian" value='' />
        <input type="hidden" name="ditiezhan" id="ditiezhan" value='' />
        <input type="hidden" name="daxue" id="daxue" value='' /> 
    </td> 
</tr> 
<tr> 
    <td class="t"> 地址： </td> 
    <td> <input type="text" name="dizhi" id="dizhi" value='' class="text4" /><span id="dizhi_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 整套户型： </td> 
    <td> 
        <span id="f1"> 
            <input type="text" f="{0}居室,{0}居,{0}室" class="text3" id="huxingshi" name="huxingshi" value=''  Except='null'  maxLength=1/> 室 
            <input type="text" id="huxingting" name="huxingting" class="text3" value=''  maxLength=1/> 厅 
            <input type="text" class="text3" id="huxingwei" name="huxingwei" value=''  maxLength=1/> 卫 </span> 
            <span id="lc">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                第 <input f="{0}层,{0}楼" type="text" class="text3" id="Floor" name="Floor" value=''  maxLength=2/> 层，
                共 <input class="text3" type="text" id="zonglouceng" name="zonglouceng" value=''  maxLength=2/> 层 
            </span> 
            <span id="huxingshi_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 房屋类型： </td> 
    <td> 
        <select name="ObjectType" id="ObjectType" f="{0}"> 
            <%--<option selected="selected">房屋类型</option>--%>
            <%
                foreach (var item in HouseRent.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>'><%=item.Name %></option>
                    <%
                }
             %>  
        </select>&nbsp; 
        <select name="FitType" id="FitType" f="{0}"> 
            <option selected="selected" value="">装修情况</option>  
            <option value='1' > 毛坯</option>  
            <option value='2' selected> 简单装修</option>  
            <option value='3' > 中等装修</option>  
            <option value='4' > 精装修</option>  
            <option value='5' > 豪华装修</option>  
        </select>&nbsp; 
    </td> 
</tr> 
<tr id='hzfs'> 
    <td class="t"> 出租间介绍： </td> 
    <td> 
        <select name="woshi" id="woshi" f="{0}">  
            <option value='1' selected> 主卧</option>  
            <option value='2' > 次卧</option>  
            <option value='3' > 隔断间</option>  
        </select><span id="kongge">&nbsp;</span> 
        <select name="Toward" id="Toward"> 
            <option selected="selected" value="">出租间朝向</option>  
            <option value='1' > 东</option>  
            <option value='2' > 南</option>  
            <option value='3' > 西</option>  
            <option value='4' > 北</option>  
            <option value='5' > 南北</option>  
            <option value='6' > 东西</option>  
            <option value='7' > 东南</option>  
            <option value='8' > 西南</option>  
            <option value='9' > 东北</option>  
            <option value='10' > 西北</option>  
        </select>&nbsp; 
        <select name="xianzhi" id="xianzhi" f="{0}">  
            <option value='1' selected> 男女不限</option>  
            <option value='2' > 限女生</option>  
            <option value='3' > 限男生</option>  
            <option value='4' > 限夫妻</option>  
        </select>&nbsp;&nbsp; 
        面积： <input class="text3" type="text" id="area" name="area" value=''  Except='null'  maxLength=4/> 平米  
        <span id="xianzhi_Tip"></span>
        <span id="area_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 租 金： </td> 
    <td> 
        <span id="z1"> <input type="text" class="text3 gray" id="MinPrice" name="MinPrice" value='面议'  Except='面议'  maxLength=5/> 元/月  </span> 
        <%--<input type="hidden" id="hidprice" value='面议' name="MinPrice" />--%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="fukuanfangshi" id="fukuanfangshi"> 
            <option value='1' > 面议</option>  
            <option value='2' selected> 押一付三</option>  
            <option value='3' > 押一付一</option>  
            <option value='4' > 押二付一</option>  
            <option value='5' > 半年付</option>  
            <option value='6' > 年付</option>  
        </select><span id="MinPrice_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> 房屋配置： </td> 
    <td class="checkpb">  
        <label><input type="checkbox" value='1' name="HouseAllocation"  /> 床</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <label><input type="checkbox" value='2' name="HouseAllocation"  /> 热水器</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <label><input type="checkbox" value='3' name="HouseAllocation"  /> 洗衣机</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <label><input type="checkbox" value='4' name="HouseAllocation"  /> 空调</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <label><input type="checkbox" value='5' name="HouseAllocation"  /> 冰箱</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <label><input type="checkbox" value='6' name="HouseAllocation"  /> 电视机</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <label><input type="checkbox" value='7' name="HouseAllocation"  /> 宽带</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <span id="HouseAllocation_Tip"></span> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var house = new HouseShare();
        house.Title = $("#Title").val();
        house.District = $("#xiaoqu").val();
        house.Address = $("#dizhi").val();
        house.Room = $("#huxingshi").val();
        if (house.Room != "") {
            house.Room = parseInt(house.Room, 10);
        }
        house.Parlor = $("#huxingting").val();
        if (house.Parlor != "") {
            house.Parlor = parseInt(house.Parlor, 10);
        }
        house.Toilet = $("#huxingwei").val();
        if (house.Toilet != "") {
            house.Toilet = parseInt(house.Toilet, 10);
        }
        house.Floor = $("#Floor").val();
        house.Floor = parseInt(house.Floor, 10);
        house.FloorTotal = $("#zonglouceng").val();
        house.FloorTotal = parseInt(house.FloorTotal, 10);
        house.Area = $("#area").val();
        if (house.Area != "") {
            house.Area = parseInt(house.Area, 10);
        }
        else {
            house.Area = 0; //面议
        }
        house.ObjectType = parseInt($("#ObjectType").val(), 10);
        if ($("#FitType").val() != "") {
            house.FitType = $("#FitType").find("option:selected").text();
        }
        house.Toward = $("#Toward").find("option:selected").text();
        house.Price = $("#MinPrice").val();
        if (house.Price == "面议") {
            house.Price = 0;
        }
        else {
            house.Price = parseInt(house.Price, 10);
        }
        house.PayWay = $("#fukuanfangshi").find("option:selected").text();
        house.Bed = $(':checkbox[name="HouseAllocation"][value="1"]').attr('checked');
        house.WaterHeater = $(':checkbox[name="HouseAllocation"][value="2"]').attr('checked');
        house.WashingMachine = $(':checkbox[name="HouseAllocation"][value="3"]').attr('checked');
        house.AirConditioner = $(':checkbox[name="HouseAllocation"][value="4"]').attr('checked');
        house.Icebox = $(':checkbox[name="HouseAllocation"][value="5"]').attr('checked');
        house.Television = $(':checkbox[name="HouseAllocation"][value="6"]').attr('checked');
        house.Broadband = $(':checkbox[name="HouseAllocation"][value="7"]').attr('checked');
        house.HireLimit = $("#xianzhi").find("option:selected").text();
//        if (house.HireType == 2) {
            house.Bedroom = $("#woshi").find("option:selected").text();
//        }
        FillData(house);
        house.Id = -1;
        house.DateCreated = new Date().toJson(true);
        house.DateModified = house.DateCreated;
        house.Insert(onSuccess, onFailed);
    }
</script>

<script type="text/javascript">
    function formValidatorSuccess() {
        try {
            setHuXingShi();
            if (!checkHireTypeValue())
                return false;
            //                $.c.Disabletor.initSubValue("z1", "MinPrice2", "MinPrice1", "hidprice", 0);
            //                $.c.Disabletor.initSubValue("RoomCount", "huxingshi", "RoomCount", "hidhuxingshi", 0);
        } catch (ex) { alert(ex); return false; }
        $("#hidxiaoqu").val($("#xiaoqu").val());
        if ($("#xiaoqu").css("display") != 'none' && ($("#hidxiaoqu").val() == "" || $("#hidxiaoqu").val() == undefined) && !document.getElementsByName("type")[1].checked) {
            alert("小区不能为空"); return false;
        }
        $.c.xiaoqu.getLineValue(79, $("#xiaoqu").val());
        posting();
        post();
        return false; //阻止表单提交.
    }
    $(document).ready(function () {
        showBizTip();
        $('#xiaoqu').bind('keyup', function () { $('#dizhi').val(''); });
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            try {
//                setHuXingShi();
//                if (!checkHireTypeValue())
//                    return false;
//                //                $.c.Disabletor.initSubValue("z1", "MinPrice2", "MinPrice1", "hidprice", 0);
//                //                $.c.Disabletor.initSubValue("RoomCount", "huxingshi", "RoomCount", "hidhuxingshi", 0);
//            } catch (ex) { alert(ex); return false; }
//            $("#hidxiaoqu").val($("#xiaoqu").val());
//            if ($("#xiaoqu").css("display") != 'none' && ($("#hidxiaoqu").val() == "" || $("#hidxiaoqu").val() == undefined) && !document.getElementsByName("type")[1].checked) {
//                alert("小区不能为空"); return false;
//            }
//            $.c.xiaoqu.getLineValue(79, $("#xiaoqu").val());
//            post();
//            return false;
//        }
//        });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不允许填写电话和特殊符号<br>例：新华书店附近精装修两居招合租", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#xiaoqu").formValidator({ tipid: "xiaoqu_Tip", onfocus: "1~30个字，不能填写电话和特殊符号", q2b: true }).inputValidator({ onerror: "请输入房源所在小区" }).regexValidator({ regexp: "\\S+#^((?!电话|手机|联系方式|号码).)*$", onerror: "请输入房源所在小区#小区里不能填写电话" }).functionValidator({ fun: function (val, elem) { $('#tooltip1div').hide(); var r = $.formValidator.IsNum(val); return !r; }, onerror: "小区不能为纯数字" });
        $("#xiaoqu").blur(function () { $("#dizhi").blur(); }); $("#dizhi").formValidator({ tipid: "dizhi_Tip", onfocus: "", q2b: true, 'empty': true }).regexValidator({ regexp: "^(.){2,50}$#^([^\\s]\\s{0,3}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6})))+$", onerror: "地址不足2个字#地址里不允许填写电话" });
        $("#huxingshi").formValidator({ tipid: "huxingshi_Tip", onfocus: "填写数字，不能是“0”。", q2b: true, 'empty': true }).inputValidator({ onerror: "请填写户型" }).regexValidator({ regexp: "^[1-9]$", onerror: "户型必须为数字，居室不能填写0" }).groupValidator({ groupName: "l1", nextgroupid: "huxingting" });
        $("#huxingting").formValidator({ tipid: "huxingshi_Tip", onfocus: "填写数字", q2b: true }).inputValidator({ onerror: "请填写户型" }).regexValidator({ regexp: "^\\S+$#^[0-9]$", onerror: "请填写户型#户型必须为数字，居室不能填写0" }).groupValidator({ groupName: "l1", nextgroupid: "huxingwei" });
        $("#huxingwei").formValidator({ tipid: "huxingshi_Tip", onfocus: "填写数字", q2b: true }).inputValidator({ onerror: "请填写户型" }).regexValidator({ regexp: "^\\S+$#^[0-9]$", onerror: "请填写户型#户型必须为数字，居室不能填写0" }).groupValidator({ groupName: "l1", nextgroupid: "Floor" });
        $("#Floor").formValidator({ tipid: "huxingshi_Tip", onfocus: "填写整数，不能是“0”。地下室用负数填写，如-3", q2b: true }).inputValidator({ onerror: "请填写楼层" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,1}$|^-\\d$", onerror: "请填写楼层#楼层必须为数字，不能是“0”。总楼层不能是负数" }).compareValidator({ desid: "zonglouceng", operateor: "<=", onerror: "总楼层不能小于所在楼层", datatype: "number" }).groupValidator({ groupName: "l1", nextgroupid: "zonglouceng" });
        $("#zonglouceng").formValidator({ tipid: "huxingshi_Tip", onfocus: "填写整数，不能是“0”和负数", q2b: true }).inputValidator({ onerror: "请填写楼层" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,1}$", onerror: "请填写楼层#楼层必须为数字，不能是“0”。总楼层不能是负数" }).compareValidator({ desid: "Floor", operateor: ">=", onerror: "总楼层不能小于所在楼层", datatype: "number" }).groupValidator({ groupName: "l1", nextgroupid: "huxingshi" });
        $("#MinPrice").formValidator({ tipid: "MinPrice_Tip", onfocus: "租金只能为整数", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请填写租金" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请填写租金#租金为0以外的整数" });
        $("#area").formValidator({ tipid: "area_Tip", onfocus: "填写整数，不能是“0”", q2b: true, 'empty': true }).regexValidator({ regexp: "^[1-9]\\d{0,3}$", onerror: "面积为0以外的整数" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { var _r = $.formValidator.checkContent(val); if (typeof _r == "string") return _r; if (_r) { if (val == _contentTip) return '请填写补充说明'; return true; } } });

        //    if (!isAdd()) {
        //        $(':radio[name="HireType"][value="2"]').attr('disabled', true);
        //    } 
        //    else {
        //        $(':checkbox[name="HouseAllocation"][value="6"]').attr('checked', true);
        //        $(':checkbox[name="HouseAllocation"][value="8"]').attr('checked', true); 
        //    }
    });
    var _contentTip = '例如对合租房客的要求，出租间的描述，小区及周边介绍等…';
    $.j.initContentTip(_contentTip);
    function tojump(obj) {
        //    if (!isAdd()) return; var url = location.href; url = url.replace(location.search, '');
        //    url = url.TrimEnd('/'); url2 = url.replace('/10/s5', '/8/s5'); if (url != url2) location.href = url2;
        //location.href = "../zufang"
        if(obj.value=="1")
        {
            location.href = "<%=Url.Action("post", new { smallcategory="zufang" })%>";
        }
        if(obj.value=="3")
        {
            location.href = "<%=Url.Action("post", new { smallcategory="bed" })%>";
        }
    };
    String.prototype.TrimEnd = function (c) {
        return this.replace(new RegExp(c + '*$'), '');
    };
//    function isAdd() { return '0' == '0'; }
//    void function () {
//        if (isAdd()) {
//            var typeid = ''; if (typeid != '') {
//                $(':radio[name="HireType"][value="' + typeid + '"]').get(0).checked = true;
//            }
//        } showWoshi();
//    } ();
//    function showWoshi() {
//        var obj = $(':radio[name="HireType"][value="3"]').get(0);
//        if (obj) {
//            if (obj.checked) {
//                $('#woshi').hide(); $('#kongge').hide();
//            }
//            else {
//                $('#woshi').show(); $('#kongge').show();
//            }
//        }
//    }
//    function change() { showWoshi(); }
    function showBizTip() {
        var cbx = $(':checkbox[name="IsBiz"]');
        if (cbx.attr('disabled')) {
            cbx.parent().hide(); cbx.parent().after('<font color="red">经纪人</font>');
        } else {
            $('span[name="biz_shenfen"]').hide();
        } $("#id_agent_tip").hover(function () { $('#agent_tip').css('display', ''); }, function () { $('#agent_tip').css('display', 'none'); });
    }
    function checkHireTypeValue() {
        var obj = $(':radio[name="HireType"]:checked');
        if (obj.length == 0) {
            alert('请选择出租方式');
            return false;
        }
        var _v = obj.val();
        if (_v == 1) {
            alert('错误的出租方式，请重新选择。');
            return false;
        }
        return true;
    }
    function setHuXingShi() {
        var x = 1; var a = $('#huxingshi').val(); if (a != '') {
            if (!isNaN(a)) {
                x = parseInt(a, 10);
            }
            if (x > 5) x = 5;
            if (x < 1) x = 1;
        }
        $('#huxingshi').val(x);
    }
    $(document).ready(loadSavedHuXingShi);
    function loadSavedHuXingShi() {
        var a = $('#huxingshi').val(); if (a == '') {
            $('#huxingshi').val($('#huxingshi').val());
        }
    }  
</script>
</asp:Content>
