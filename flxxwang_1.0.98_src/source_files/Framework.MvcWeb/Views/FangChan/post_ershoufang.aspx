<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/HouseMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IHouse>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
        <td class="t"> <b class="red">*</b> 供 求： </td> 
        <td>  
            <label> <input id="type_0" f="{0}" class="base" type="radio" name="type" value='0' checked onclick="change(this)" />出售</label>&nbsp;&nbsp;&nbsp;&nbsp;  
            <label> <input id="type_1" f="{0}" class="base" type="radio" name="type" value='1'  onclick="change(this)" />求购</label>&nbsp;&nbsp;&nbsp;&nbsp;  
            <span id="type_message"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 标 题： </td> 
        <td> <input type="text" name="Title" id="Title" f="{0}" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
    </tr>
    <tr id="xq1"> 
        <td class="t"> <b class="red">*</b> 所在小区： </td> 
        <td> 
            <input class="text4" type="text" id="xiaoqu" f="{0}" value=''  
            maxLength=30/> 
            <span id="xiaoqu_Tip"></span> 
            <input type="hidden" name="xiaoqu" id="hidxiaoqu" value='' />
            <input type="hidden" name="gongjiaoxian" id="gongjiaoxian" value='' />
            <input type="hidden" name="gongjiaozhan" id="gongjiaozhan" value='' />
            <input type="hidden" name="ditiexian" id="ditiexian" value='' />
            <input type="hidden" name="ditiezhan" id="ditiezhan" value='' />
            <input type="hidden" name="daxue" id="daxue" value='' /> 
        </td> 
    </tr> 
    <tr id="trDizhi"> 
        <td class="t"> 地址： </td> 
        <td> <input type="text" name="dizhi" id="dizhi" value='' class="text4" /><span id="dizhi_Tip"></span> </td> 
    </tr> 
    <tr id='xq3'> 
        <td class="t"> <b class="red">*</b> 求购地区： </td> 
        <td> <input type="text" class="text2" id="diduan" name="diduan" value=''  maxLength=12/> 或 <input type="text" class="text2" id="diduan2" name="diduan2" value=''  Except='null'  maxLength=12/> <span id="diduan_Tip"></span> </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> <span id="fx">户 型</span><span id="qwfx">期望户型</span>： </td> 
        <td> 
            <span id="obj2"> 
                <select id="o1" f="{0}">  
                    <%--<option value='1' > 地下室</option>  
                    <option value='2' > 平房</option>  
                    <option value='3' selected> 普通住宅</option>  
                    <option value='7' > 商住两用</option>  
                    <option value='4' > 公寓</option>  
                    <option value='5' > 别墅</option>  
                    <option value='6' > 其他</option>--%>
                    <%
                        foreach (var item in HouseSecond.Singleton.ObjectTypeCollection)
                        {
                            %>
                            <option value='<%=item.Id %>'><%=item.Name %></option>
                            <%
                        }
                     %>  
                </select>&nbsp; 
                <select id="huxingshi2" f="{0}">  
                    <option value='1' > 一室</option>  
                    <option value='2' > 二室</option>  
                    <option value='3' > 三室</option>  
                    <option value='4' > 四室</option>  
                    <option value='5' > 四室以上</option>  
                </select> 
            </span> 
            <span id="h1"> 
                <input type="text" f="{0}居室,{0}居,{0}室" class="text3" id="jushishuru" value=''  Except='null'  maxLength=1/>室 
                <input class="text3" type="text" name="huxingting" id="huxingting"  value=''  maxLength=1/>厅 
                <input class="text3" type="text" name="huxingwei" id="huxingwei" value=''  maxLength=1/>卫  
            </span> 
            <span id="l2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                第<input f="{0}层,{0}楼" type="text" class="text3" id="Floor" name="Floor" value=''  maxLength=2/>层，
                共 <input class="text3" type="text" id="zonglouceng" name="zonglouceng" value=''  maxLength=2 />层  
            </span> <span id="huxingshi_Tip"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> <span id="sj">售 价</span><span id="qwsj">期望价格</span>： </td> 
        <td> 
            <span id="p1"><input f="{0}" type="text" id="MinPrice1" class="text3 gray" value='面议'  Except='面议'  maxLength=6/></span> 
            <span id="p2">- &nbsp; <input f="{0}" type="text" id="MinPrice2" class="text3 gray" value=''  Except='面议'  maxLength=6/> </span>万元 
            <input type="hidden" value="面议" name="MinPrice" id="hidprice" /> &nbsp;&nbsp;&nbsp;&nbsp; 
            <span id="jz">建筑</span><span id="qwmj">期望</span>面积： 
            <span id="a1"> <input f="{0}平米" type="text" class="text3" id="area1" value=''  maxLength=5/> </span>平米  
            <span id="a2">- &nbsp; <input f="{0}平米" type="text" id="area2" class="text3" value=''  maxLength=5/>平米 </span> 
            <span  id="MinPrice_Tip"></span> 
            <input type="hidden" value="" name="area" id="hidarea" />
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <span id="chanquan">期望产权</span><span id="fanglin">房龄</span>： </td> 
        <td> <span  id="l1"><input class="text3" type="text" id="BuildingEra" name="BuildingEra" value=''  Except='null'  maxLength=2/>年 &nbsp;&nbsp;&nbsp;&nbsp;</span> 
        <select name="chanquan" id="chanquan" f="{0}">
            <option value='10'  > 商品房</option>
            <option value='20' > 经济适用房</option>
            <option value='30' > 公房</option>
            <option value='40' > 使用权</option>
        </select>&nbsp; 
        <select id="o2" f="{0}">
            <%--<option value='1' > 地下室</option>
            <option value='2' > 平房</option>
            <option value='3' selected> 普通住宅</option>
            <option value='4' > 商住两用</option>
            <option value='5' > 公寓</option>
            <option value='6' > 别墅</option>
            <option value='7' > 其他</option>--%>
            <%
                foreach (var item in HouseSecond.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>'><%=item.Name %></option>
                    <%
                }
             %>
        </select>
        <input type="hidden" id="hidobjtype" name="ObjectType" value='3' /> &nbsp;
        <select name="fittype" id="fittype" f="{0}">
            <option value='1' > 毛坯</option>  
            <option value='2' selected> 简单装修</option>
            <option value='3' > 中等装修</option>
            <option value='4' > 精装修</option>
            <option value='5' > 豪华装修</option>
        </select> &nbsp;
        <select name="Toward" id="Toward" f="{0}">
            <option selected="selected" value="">选择朝向</option>
            <option value='1' > 东</option>
            <option value='2' > 南</option>
            <option value='3' > 西</option>
            <option value='4' > 北</option>
            <option value='6' > 南北</option>
            <option value='5' > 东西</option>
            <option value='7' > 东南</option>
            <option value='8' > 西南</option>
            <option value='9' > 东北</option>
            <option value='10' > 西北</option>
        </select> <span id="BuildingEra_Tip"></span> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var house = new HouseSecond();
        house.Type = parseInt(getRadioValue("type"), 10) + 1;
        house.Title = $("#Title").val();
        if (house.Type == 1) {
            house.District = $("#xiaoqu").val();
        }
        else {
            house.District = $("#diduan").val();
            house.District2 = $("#diduan2").val();
        }
        if (house.Type == 1) {
            house.Address = $("#dizhi").val();
        }
        if (house.Type == 1) {
            house.Room = $("#jushishuru").val();
            if (house.Room == "") {
                house.Room = 0;
            }
            else {
                house.Room = parseInt(house.Room, 10);
            }
            house.Parlor = parseInt($("#huxingting").val(), 10);
            house.Toilet = parseInt($("#huxingwei").val(), 10);
            house.Floor = parseInt($("#Floor").val(), 10);
            house.FloorTotal = parseInt($("#zonglouceng").val(), 10);
        }
        else {
            house.Room = parseInt($("#huxingshi2").val(), 10);
        }
        house.Price = $("#MinPrice1").val();
        if (house.Price == "" || house.Price == "面议") {
            house.Price = 0;
        }
        else {
            house.Price = parseInt(house.Price, 10);
        }
        if (house.Type == 2) {
            house.Price2 = $("#MinPrice2").val();
            if (house.Price2 == "" || house.Price2 == "面议") {
                house.Price2 = 0;
            }
            else {
                house.Price2 = parseInt(house.Price2, 10);
            }
        }
        house.Area = parseInt($("#area1").val(), 10);
        if (house.Type == 2) {
            house.Area2 = parseInt($("#area2").val(), 10);
        }
        if (house.Type == 1) {
            house.Age = parseInt($("#BuildingEra").val(), 10);
            house.ObjectType = parseInt($("#o2").val(), 10);
            house.FitType = $("#fittype").find("option:selected").text();
            if ($("#Toward").val() != "") {
                house.Toward = $("#Toward").find("option:selected").text();
            }
        }
        house.Right = $('select[name="chanquan"]').find("option:selected").text(); ;

        FillData(house);
        house.Id = -1;
        house.DateCreated = new Date().toJson(true);
        house.DateModified = house.DateCreated;
        house.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        showBizTip();
        $('#xiaoqu').bind('keyup', function () { $('#dizhi').val(''); });
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            //            try {
//            //                $.c.Disabletor.initSubValue("a2", "area1", "area2", "hidarea");
//            //                $.c.Disabletor.initSubValue("p2", "MinPrice1", "MinPrice2", "hidprice");
//            //                $.c.Disabletor.initSubValue("huxingshi2", "jushishuru", "huxingshi2", "hidjushishuru", 0);
//            //                $.c.Disabletor.initSubValue("o1", "o2", "o1", "hidobjtype", 0); setHuXingShi(); clearPicValue();
//            //                var index = $.c.common.getRadioIndex('type');
//            //                if (index == 0) {
//            //                    $.c.xiaoqu.getLineValue(79, $("#xiaoqu").val());
//            //                    return false;
//            //                }
//            //                else {
//            //                    return true; 
//            //                }
//            //            }
//            //            catch (ex) { }
//            //            $("#hidxiaoqu").val($("#xiaoqu").val());
//            //            if ($("#xiaoqu").css("display") != 'none' && ($("#hidxiaoqu").val() == "" || $("#hidxiaoqu").val() == undefined)) {
//            //                alert("小区不能为空");
//            //                return false;
//            //            }
//            //            var index = $.c.common.getRadioIndex('type');
//            //            if (index == 0) {
//            //                $.c.xiaoqu.getLineValue(79, $("#xiaoqu").val());
//            //                return false;
//            //            }
//            //            else {
//            //                return true; 
//            //            }
//            post();
//            return false;
//        }
//        });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br>例：出售新华书店附近精装修两室一厅", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#xiaoqu").formValidator({ tipid: "xiaoqu_Tip", onfocus: "1~30个字，不能填写电话和特殊符号", q2b: true }).inputValidator({ onerror: "请输入房源所在小区" }).regexValidator({ regexp: "\\S+#^((?!电话|手机|联系方式|号码).)*$", onerror: "请输入房源所在小区#小区里不能填写电话" }).functionValidator({ fun: function (val, elem) {
            $('#tooltip1div').hide(); var r = $.formValidator.IsNum(val); return !r;
        }, onerror: "小区不能为纯数字"
        });
        $("#diduan").formValidator({ tipid: "diduan_Tip", onfocus: "请输入求购地段", q2b: true }).inputValidator({ onerror: "请输入求购地段" }).regexValidator({ regexp: "\\S+#^(.){2,12}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "请输入求购地段#求购地段不足2个字#求购地段里不能填写电话" });
        $("#diduan2").formValidator({ tipid: "diduan_Tip", onfocus: "请输入求购地段", q2b: true, 'empty': true }).regexValidator({ regexp: "^(.){2,12}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "求购地段不足2个字#求购地段里不能填写电话" });
        $("#xiaoqu").blur(function () { $("#dizhi").blur(); });
        $("#dizhi").formValidator({ tipid: "dizhi_Tip", onfocus: "", q2b: true, 'empty': true }).regexValidator({ regexp: "^(.){2,50}$#^([^\\s]\\s{0,3}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6})))+$", onerror: "地址不足2个字#地址里不允许填写电话" });
        $("#BuildingEra").formValidator({ tipid: "BuildingEra_Tip", onfocus: "", q2b: true, 'empty': true }).regexValidator({ regexp: "^(\\d){0,2}$", onerror: "房龄请填写0～2位数字" });
        $("#jushishuru").formValidator({ tipid: "huxingshi_Tip", onfocus: "填写数字，不能是“0”。", q2b: true, 'empty': true }).inputValidator({ onerror: "请填写户型" }).regexValidator({ regexp: "^[1-9]$", onerror: "户型必须为数字，居室不能填写0" }).groupValidator({ groupName: "l1", nextgroupid: "huxingting" });
        $("#huxingting").formValidator({ tipid: "huxingshi_Tip", onfocus: "填写数字", q2b: true }).inputValidator({ onerror: "请填写户型" }).regexValidator({ regexp: "^\\S+$#^[0-9]$", onerror: "请填写户型#户型必须为数字，居室不能填写0" }).groupValidator({ groupName: "l1", nextgroupid: "huxingwei" });
        $("#huxingwei").formValidator({ tipid: "huxingshi_Tip", onfocus: "填写数字", q2b: true }).inputValidator({ onerror: "请填写户型" }).regexValidator({ regexp: "^\\S+$#^[0-9]$", onerror: "请填写户型#户型必须为数字，居室不能填写0" }).groupValidator({ groupName: "l1", nextgroupid: "Floor" });
        $("#Floor").formValidator({ tipid: "huxingshi_Tip", onfocus: "填写整数，不能是“0”。地下室用负数填写，如-3", q2b: true }).inputValidator({ onerror: "请填写楼层" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,1}$|^-\\d$", onerror: "请填写楼层#楼层必须为数字，不能是“0”。总楼层不能是负数" }).compareValidator({ desid: "zonglouceng", operateor: "<=", onerror: "总楼层不能小于所在楼层", datatype: "number" }).groupValidator({ groupName: "l1", nextgroupid: "zonglouceng" });
        $("#zonglouceng").formValidator({ tipid: "huxingshi_Tip", onfocus: "填写整数，不能是“0”和负数", q2b: true }).inputValidator({ onerror: "请填写楼层" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,1}$", onerror: "请填写楼层#楼层必须为数字，不能是“0”。总楼层不能是负数" }).compareValidator({ desid: "Floor", operateor: ">=", onerror: "总楼层不能小于所在楼层", datatype: "number" }).groupValidator({ groupName: "l1", nextgroupid: "jushishuru" });
        $("#MinPrice1").formValidator({ tipid: "MinPrice_Tip", onfocus: "只能填写数字、支持1位小数", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请输入房源出售价" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,5}(\\.\\d{1,1})?$", onerror: "请输入房源出售价#售价不能为0，允许一位小数" }).groupValidator({ groupName: "l2", nextgroupid: "MinPrice2" });
        $("#MinPrice2").formValidator({ tipid: "MinPrice_Tip", onfocus: "只能填写数字、支持1位小数", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请输入房源出售价" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,5}(\\.\\d{1,1})?$", onerror: "请输入房源出售价#售价不能为0，允许一位小数" }).groupValidator({ groupName: "l2", nextgroupid: "area1" });
        $("#area1").formValidator({ tipid: "MinPrice_Tip", onfocus: "最多可填写6位大于0的整数", q2b: true }).inputValidator({ onerror: "请输入面积" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请输入面积#面积为0以外的整数" }).groupValidator({ groupName: "l2", nextgroupid: "area2" });
        $("#area2").formValidator({ tipid: "MinPrice_Tip", onfocus: "最多可填写6位大于0的整数", q2b: true }).inputValidator({ onerror: "请输入面积" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请输入面积#面积为0以外的整数" }).groupValidator({ groupName: "l2", nextgroupid: "MinPrice1" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { var _r = $.formValidator.checkContent(val); if (typeof _r == "string") return _r; if (_r) { if (val == _contentTip) return '请填写补充说明'; return true; } } });
    });
    function change(o) {
        if (!o) {
            var list = document.getElementsByName("type");
            for (var i = 0; i < list.length; i++) { if (list[i].checked) { o = list[i]; break; } }
        }
        $.c.Disabletor.setdisable([{ v: 0, a: "o1|area2|MinPrice2|a2|p2|xq3|huxingshi2|diduan|diduan2|obj2|chanquan|qwfx|qwsj|qwmj", t: 1, c: function () { $("#pdv").css("display", ""); } }, { v: 1, a: "o1|area2|area1|MinPrice1|MinPrice2|a1|a2|p1|p2|huxingshi2|xq3|diduan|diduan2|obj2|fabu|Phone|codeText|goblianxiren|chanquan|qwfx|qwsj|qwmj|danwei|id_agent_tip", t: 0, c: function () {
            $("#pdv").css("display", "none");
        }
        }], o.value, 0);
        $.c.Disabletor.initValue("hidprice", "MinPrice1", "MinPrice2", 1, 0);
        $.c.Disabletor.initValue("hidarea", "area1", "area2", 1, 0);
    } change(); var _contentTip = '例如对房屋的整体描述，小区以及小区周边的介绍，附近交通信息等…';
    $.j.initContentTip(_contentTip); function clearPicValue() { var obj = $(':radio[name="type"]:checked'); if (obj.val() == 1) { $('#Pic').val(''); $('#PicDesc').val(''); } }
    function showBizTip() {
        var cbx = $(':checkbox[name="IsBiz"]');
        if (cbx.attr('disabled')) { cbx.parent().hide(); cbx.parent().after('<font color="red">经纪人</font>'); }
        else { $('span[name="biz_shenfen"]').hide(); }
        $("#id_agent_tip").hover(function () { $('#agent_tip').css('display', ''); },
               function () { $('#agent_tip').css('display', 'none'); });
    }
    function setHuXingShi() {
        var x = 1; var a = $('#hidjushishuru').val(); if (a != '') {
            if (!isNaN(a)) { x = parseInt(a, 10); } if (x > 5) x = 5; if (x < 1) x = 1;
        }
        $('#huxingshi').val(x);
    } $(document).ready(loadSavedHuXingShi); function loadSavedHuXingShi() {
        var index = $.c.common.getRadioIndex('type');
        if (index == 0) { var a = $('#jushishuru').val(); if (a == '') { $('#jushishuru').val($('#huxingshi').val()); } }
    }
</script>
</asp:Content>
