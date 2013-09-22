<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/CarMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ICar>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
15
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b>品牌/车系/车型： </td> 
    <td> 
        <span id="divSelectCar"> 
            <a id="linkSelectCar" class="a_select" href="javascript:void(0);">请选择品牌<i></i></a> 
            <select name="pinpailist" id="sltPinPai" f="{0}" style="display:none;" onchange="getCheXi(this.value)"> 
                <option value="">请选择品牌</option>
                <%
                    foreach (var item in CarSecondHand.BrandCollection)
                    {
                        %>
                        <option value='<%=item.Id %>' ><%=item.Name %></option>
                        <%
                    }
                 %>  
            </select>&nbsp; 
            <select name="xilie" id="sltCheXi" f="{0}" onchange="getCheXing(this.value);" style="display: none" ct="xilie" message="请选择车系" usermsg="pinpailist" tip="请选择车系"> 
                <option value="">请选择车系</option>  
            </select>&nbsp; 
            <select name="chexing" ct="chexing" id="sltCheXing" f="{0}" onchange="sltCheXing_change(this);" style="display: none"> 
                <option value="">请选择</option>  
            </select>&nbsp; 
            <a href="javascript:void(handwriting());" class="line12">&lt;&lt;没有我需要的品牌/车系/车型，手动填写</a> 
            <span id="pinpailist_message"> </span>
            <span id="xilie_message"></span>
        </span>
        <span id="divPinpaiAndChexi" style="display: none;"> 
            <input type="text"  maxLength=20 name="erscpinpai" id="tbxPinpaiAndChexi" value='' class="text2" f="{0}" /> 
            <a href="javascript:void(closeWriting());" class="line12">下拉选择</a>
            <span id="erscpinpai_message"></span>
        </span> 
        </td> 
    </tr> 
    <tr class="pb"> 
        <td class="t"> <b class="red">*</b> 车辆类型： </td> 
        <td> 
            <%--<input id="ObjectType_1" type="radio" f="{0}" name="ObjectType" value='1'  /><span>轿车/跑车</span>&nbsp;&nbsp;
            <input id="ObjectType_2" type="radio" f="{0}" name="ObjectType" value='2'  /><span>越野车/SUV</span>&nbsp;&nbsp;
            <input id="ObjectType_3" type="radio" f="{0}" name="ObjectType" value='3'  /><span>面包车/MPV</span>&nbsp;&nbsp;
            <input id="ObjectType_4" type="radio" f="{0}" name="ObjectType" value='4'  /><span>客车/货车</span>&nbsp;&nbsp;--%>
            <%
                for (int i = 0; i < CarSecondHand.Singleton.ObjectTypeCollection.Count;i++ )
                {
                    var objectType = CarSecondHand.Singleton.ObjectTypeCollection[i];
                    %>
                    <input type="radio" id="ObjectType_<%=i %>" name="ObjectType" value='<%=objectType.Id %>'  /><span><%=objectType.Name%></span>&nbsp;&nbsp;
                    <%
                }
            %> 
            <span id="ObjectType_Tip"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 排 量： </td> 
        <td> 
            <input  maxLength=3 type="text" name="cspailiang" id="cspailiang" f="{0}" value='' class="text3" />升 &nbsp; &nbsp; 
            <b class="red">*</b> 变速器：<input  maxLength=8 type="text" name="biansuqi" id="biansuqi" f="{0}" value='' class="text2" /> <span id="cspailiang_Tip"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 车辆颜色：  </td> 
        <td><select name="cheshenyanse" id="cheshenyanse" f="{0}"> 
            <option value="">请选择</option>  
            <option value='1' > 黑色</option>  
            <option value='2' > 白色</option>  
            <option value='3' > 银灰色</option>  
            <option value='4' > 深灰色</option>  
            <option value='5' > 咖啡色</option>  
            <option value='6' > 红色</option>  
            <option value='7' > 蓝色</option>  
            <option value='8' > 绿色</option> 
            <option value='9' > 黄色</option> 
            <option value='10' > 橙色</option>  
            <option value='11' > 香槟色</option>  
            <option value='12' > 紫色</option> 
            <option value='13' > 多彩色</option>  
            <option value='14' > 其它</option>  
        </select>&nbsp; 
        <input type="text" style="display:none" id="tbxyanse" name="yanse" value='' class='text3' />&nbsp;&nbsp; 
        <b class="red">*</b> 上牌时间： 
        <select   name="buytime" id="buytime" f="{0}"> 
            <option value="">请选择</option>  
            <option value='2010' > 2010年</option>  
            <option value='2009' > 2009年</option>  
            <option value='2008' > 2008年</option>  
            <option value='2007' > 2007年</option>  
            <option value='2006' > 2006年</option>  
            <option value='2005' > 2005年</option>  
            <option value='2004' > 2004年</option>  
            <option value='2003' > 2003年</option>  
            <option value='2002' > 2002年</option>  
            <option value='2001' > 2001年</option>  
            <option value='2000' > 2000年</option>  
            <option value='1999' > 1999年</option>  
            <option value='1998' > 1998年</option>  
            <option value='1997' > 1997年</option>  
            <option value='1996' > 1996年</option>  
            <option value='1995' > 1995年</option>  
            <option value='1994' > 1995年以前</option>  
        </select> &nbsp; &nbsp; 
        <b class="red">*</b> 行驶里程：<input  maxLength=5 type="text" qtb="true" name="rundistance" id="rundistance" f="{0}"  value='' class="text3" tip="" />万公里 <span id="buytime_Tip"></span> </td> 
    </tr> 
    <tr> 
        <td class="t"> 
            <b class="red">*</b> 预售价格： </td> <td> <input type="text"  maxLength=6 id="MinPrice" f="{0}万元" class="text3" value=''  name="MinPrice" />万元 &nbsp;&nbsp; 
            <input checked="checked" type="checkbox" name="chepai" id="chepai" f="{0}" value='1' /><label>带牌销售</label> <span id="MinPrice_Tip"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 标 题： </td> 
        <td> <input  maxLength=25 type="text" name="Title" id="Title" value='' class="text1" /><span id="Title_Tip"></span> </td> 
    </tr>

    <input type="hidden" name="type" value="0" /> 
    <div id="divSelectCarPinPai" style="display:none; position:absolute; top:110px; left:123px;" class="selectdiv"> 
        <em class="close">
            <a href="javascript:void(0);" onclick="$('#divSelectCarPinPai').hide();">关闭</a>
        </em> 
        <div class="selectbox"> 
            <dl class="dlitem"> 
                <dt>A</dt> 
                    <dd>阿斯顿·马丁</dd> 
                    <dd>奥迪</dd> 
                <dt>B</dt> 
                    <dd>宝马</dd> 
                    <dd>奔腾</dd> 
                    <dd>保时捷</dd> 
                    <dd>奔驰</dd> 
                    <dd>标致</dd> 
                    <dd>本田</dd> 
                    <dd>比亚迪</dd> 
                    <dd>别克</dd> 
                    <dd>宾利</dd> 
                    <dd>布嘉迪</dd> 
                <dt>C</dt> <dd>长安</dd> <dd>长城</dd> <dd>昌河</dd> <dd>长丰</dd> <dd>川汽野马</dd> </dl> <dl class="dlitem"> <dt>D</dt> <dd>大众</dd> <dd>道奇</dd> <dd>东风</dd> <dd>东风风神</dd> <dd>东南</dd> <dd>帝豪</dd> <dt>F</dt> <dd>飞碟</dd> <dd>法拉利</dd> <dd>丰田</dd> <dd>菲亚特</dd> <dd>福田</dd> <dd>福特</dd> <dt>G</dt> <dd>GMC</dd> </dl> <dl class="dlitem"> <dt>H</dt> <dd>悍马</dd> <dd>红旗</dd> <dd>华普</dd> <dd>华泰</dd> <dd>哈飞</dd> <dd>海马</dd> <dd>黄海</dd> <dt>J</dt> <dd>吉奥</dd> <dd>吉普Jeep</dd> <dd>江淮</dd> <dd>精灵smart</dd> <dd>捷豹</dd> <dd>金杯</dd> <dd>吉利</dd>  </dl> <dl class="dlitem"> <dt>k</dt> <dd>柯尼赛格</dd> <dd>开瑞</dd> <dd>克莱斯勒</dd> <dd>凯迪拉克</dd> <dt>L</dt> <dd>兰博基尼</dd> <dd>劳斯莱斯</dd> <dd>雷诺</dd> <dd>力帆</dd> <dd>莲花</dd> <dd>雷克萨斯</dd> <dd>莲花汽车</dd> <dd>铃木</dd> <dd>陆风</dd> <dd>路虎</dd> </dl> <dl class="dlitem"> <dt>M</dt> <dd>MG</dd> <dd>迈巴赫</dd> <dd>玛莎拉蒂</dd> <dd>马自达</dd> <dd>迷你MINI</dd> <dt>O</dt> <dd>讴歌</dd> <dd>欧宝</dd> <dt>Q</dt> <dd>奇瑞</dd> <dd>起亚</dd> <dd>全球鹰</dd> </dl> <dl class="dlitem"> <dt>R</dt> <dd>日产</dd> <dd>荣威</dd> <dd>瑞麟</dd> <dt>S</dt> <dd>萨博</dd> <dd>三菱</dd> <dd>双龙</dd> <dd>世爵</dd> <dd>上海英伦</dd> <dd>斯巴鲁</dd> <dd>斯柯达</dd> <dd>双环</dd> <dt>W</dd> <dd>威兹曼</dd> <dd>威麟</dd> <dd>沃尔沃</dd>  </dl> <dl class="dlitem"> <dt>X</dd> <dd>夏利</dd> <dd>现代</dd> <dd>雪铁龙</dd> <dd>雪弗兰</dd> <dt>Y</dt> <dd>一汽</dd> <dd>英菲尼克</dd> <dt>Z</dt> <dd>中华</dd> <dd>中兴</dd> <dd>众泰</dd> </dl> 
        </div> 
        <iframe frameborder="0" style="position:absolute; visibility:inherit; top:0px; left:0px; width:740px; height:300px; z-index:-1; filter='progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)';"></iframe> 
    </div>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var car = new CarSecondHand();
        if ($("#divSelectCar").css("display") != "none") {
            if ($("#sltPinPai").val() != "") {
                car.BrandId = parseInt($("#sltPinPai").val(), 10);
            }
            if ($("#sltCheXi").val() != "" && $("#sltCheXi").val() != undefined) {
                car.SeriesId = parseInt($("#sltCheXi").val(), 10);
            }
            if ($("#sltCheXing").val() != "" && $("#sltCheXing").val() != undefined) {
                car.ModelId = parseInt($("#sltCheXing").val(), 10);
            }
        }
        else {
            car.BrandDescription = $("#tbxPinpaiAndChexi").val();
        }
        car.ObjectType = parseInt(getRadioValue("ObjectType"), 10);
        car.Exhaust = $("#cspailiang").val();
        if (car.Exhaust != "") {
            car.Exhaust = parseFloat(car.Exhaust);
        }
        car.Transmission = $("#biansuqi").val();
        car.Color = $("#cheshenyanse").val();
        car.BuyTime = parseInt($("#buytime").val(), 10);
        car.Rundistance = parseFloat($("#rundistance").val());
        car.Price = parseInt($("#MinPrice").val(), 10);
        car.SaleCarNum = $("#chepai").attr("checked");
        car.Title = $("#Title").val();
        FillData(car);
        car.Id = -1;
        car.DateCreated = new Date().toJson(true);
        car.DateModified = car.DateCreated;
        car.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        //        $.j.asynPhone('37800967', '0', '', '');
        $(':checkbox[name="Tag"]').attr('f', '{0}');
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            //            return sub();
//            post();
//            return false;
//        }
//        });
        $('#tbxPinpaiAndChexi').formValidator({ tipid: 'erscpinpai_message', onfocus: '请先确定下拉选择中没有您的车型再手动填写' }).functionValidator({ fun: function (val, elem) { if ($('#divPinpaiAndChexi:hidden').length == 0) return val != ''; return true; }, onerror: '请填写品牌车系' });
        $(':radio[name="ObjectType"]').formValidator({ tipid: 'ObjectType_Tip', onfocus: '' }).functionValidator({ fun: function (val, elem) { return checkObjectType(); }, onerror: "请选择车辆类型" });
        $('#cspailiang').formValidator({ tipid: 'cspailiang_Tip', onfocus: '排量请填写数字，如1.6', q2b: true }).regexValidator({ regexp: "^\\S+$#^\\d{1,1}(\\.\\d{1,1})?$", onerror: "请输入排量#请正确输入排量，如：1.6" }).groupValidator({ groupName: "v1", nextgroupid: "biansuqi" });
        $('#biansuqi').formValidator({ tipid: 'cspailiang_Tip', onfocus: '请填写变速器，如：5挡自动', q2b: true }).regexValidator({ regexp: "^\\S+$", onerror: "请填写变速器" }).groupValidator({ groupName: "v1", nextgroupid: "cspailiang" });
        $('#cheshenyanse').formValidator({ tipid: 'buytime_Tip', onfocus: '' }).functionValidator({ fun: function (val, elem) { return val != ''; }, onerror: '请选择车辆颜色' }).groupValidator({ groupName: "v2", nextgroupid: "buytime" });
        $('#buytime').formValidator({ tipid: 'buytime_Tip', onfocus: '', q2b: true }).functionValidator({ fun: function (val, elem) { return val != ''; }, onerror: "请选择上牌时间" }).groupValidator({ groupName: "v2", nextgroupid: "rundistance" });
        $('#rundistance').formValidator({ tipid: 'buytime_Tip', onfocus: '里程请填写数字', q2b: true }).regexValidator({ regexp: "^\\S+$#^\\d{1,3}(\\.\\d{1,1})?$", onerror: "请输入里程#里程数最多3位整数和1位小数" }).groupValidator({ groupName: "v2", nextgroupid: "cheshenyanse" });
        $('#MinPrice').formValidator({ tipid: 'MinPrice_Tip', onfocus: '价格请填写数字', q2b: true }).regexValidator({ regexp: "^\\S+$#^(([1-9]{1}(\\d{0,2}\\.\\d{1,2}|\\d{0,2}))|([1-9]{1})|0\\.0[1-9]|0\\.[1-9]\\d?)$", onerror: "请填写价格#价格不能为0，最多3位整数和2位小数" });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" });
        $('#Content').formValidator({ tipid: 'Content_Tip', onfocus: '请输入车辆描述' }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请输入补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { var _r = $.formValidator.checkContent(val); if (typeof _r == "string") return _r; if (_r) { if (val == _contentTip) return '补充说明是必填项'; return true; } } });
        $('#goblianxiren').formValidator({ tipid: 'goblianxiren_Tip', onfocus: '2~6个字，不能填写电话和联系方式', q2b: true }).regexValidator({ regexp: "\\S+#^(.){2,6}$#^[\\w\\d\\s\\u4e00-\\u9fa5]*$", onerror: "请输入联系人#联系人不足2个字#联系人不能填写特殊符号" });
        $('#Phone').formValidator({ tipid: 'Phone_Tip', onfocus: '请正确填写电话号码，分机可以用“-”分开。', q2b: true }).regexValidator({ regexp: "(^(0\\d{2,3})?-?([2-9]\\d{6,7})(-\\d{1,5})?$)|(^((\\(\\d{3}\\))|(\\d{0}))?(13|14|15|18)\\d{9}$)|(^(400|800)\\d{7}(-\\d{1,5})?$)|(^(95013)\\d{6,8}$)", onerror: "电话填写错误。<br/>请参照格式填写：87654321-001或138********" });
        $('#IM').formValidator({ tipid: 'IM_Tip', onfocus: '只能填写一个qq或msn。<br>格式如：123456 或 myname@flxxwang.com', q2b: true, 'empty': true }).regexValidator({ regexp: "(^[1-9]\\d{4,9}$)|(^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$)", onerror: "QQ或MSN输入错误" });
        setTimeout(function () { initTagCheck(1); }, 1000); ;
    });
    $(document).ready(function () {
        //$.c.user.user_unlogin('login', '79'); 
    });
    var _contentTip = '禁止发布走私车，套牌车及不能过户的二手车，禁止跨城市发布信息，否则信息会被删除'; 
    $.j.initContentTip(_contentTip); function initTagCheck(limitNum) { var _num = 2; if (limitNum) { if (!isNaN(limitNum)) { if (parseInt(limitNum) > 0) { _num = parseInt(limitNum); } } } $(':checkbox[name="Tag"]').formValidator({ tipid: 'infotag_Tip', onfocus: '' }).functionValidator({ fun: function (val, elem) { var _c = $(':checkbox[name="Tag"]:checked').length; if (_c == 0) return '请选择一个标签'; if (_c == _num) return true; return '最多只能选择' + _num + '个标签'; } }); $(':checkbox[name="Tag"]').bind('click', function () { var c = $(':checkbox[name="Tag"]:checked').length; if (c == _num) { $.formValidator.setTipState(null, "onCorrect", " ", "infotag_Tip"); } else if (c == 0) { $.formValidator.setTipState(null, "onError", "请选择一个标签", "infotag_Tip"); } else { $.formValidator.setTipState(null, "onError", "最多只能选择" + _num + "个标签", "infotag_Tip"); } }); } function sub() { if (!checkCarData()) return false; clearCarControlInfo(); return true; } chknum = 1; chkTagName = "车型"; </script> <script type="text/javascript">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         $(document).click(function () { if ($('#divSelectCarPinPai:visible').length > 0) { $('#divSelectCarPinPai').hide(); } }); function hideSelectPinpai() { $('#divSelectCarPinPai').hide(); } function changeLinkSelectCar(str) { $('#linkSelectCar').html(str + '<i></i>'); } $(document).ready(function () { $('#divSelectCarPinPai dd').each(function (i, n) { var r = $(n).html(); $(n).html('<a name="pinpai" href="javascript:void(0);">' + r + '</a>'); }); $('#divSelectCarPinPai').click(function (event) { event.stopPropagation(); }); $('#divSelectCarPinPai a[name="pinpai"]').click(function (event) { hideSelectPinpai(); var val = $.trim($(this).html()); $.c.common.setSelectedOption('sltPinPai', null, val); getCheXi($('#sltPinPai').val()); changeLinkSelectCar(val); return false; }); $('#linkSelectCar').click(function (event) { event.stopPropagation(); $('#divSelectCarPinPai').show(); }); }); function getCarTypeIndex(level) { var index = -1; var types = ['微型车，小型车，紧凑型车，中型车，中大型车，豪华车和跑车', '越野车/SUV', '面包车/MPV', '客车/货车']; level = level.toUpperCase(); $(types).each(function (i, n) { if (n.toUpperCase().indexOf(level) != -1) { index = i; return false; } }); return index; } function checkObjectType() { var obj = $(':radio[name="ObjectType"]:checked'); return obj.length > 0; } function getCheXi(brandID) { joinCarTitle(0); var _pinPai = document.getElementById('sltPinPai'); var _chexi = document.getElementById('sltCheXi'); var _chexing = document.getElementById('sltCheXing'); $(_chexi).empty().hide(); $(_chexing).empty().hide(); arrCheXiLevel = []; setCarValue(); if (brandID == 0) return; var url = '/ajax/?action=getchexi&brandID=' + brandID; $.get(url, null, function (data) { var arr = eval(data); getCheXi_callback(arr); }); } var arrCheXiLevel = []; function getCheXi_callback(data) { var _chexi = document.getElementById('sltCheXi'); $(_chexi).show(); addItem(_chexi, '请选择车系', 0); for (var i = 0; i < data.length; i++) { addItem(_chexi, data[i].Name, data[i].ID); arrCheXiLevel.push(data[i].Level); } if (isFirstLoad) { _chexi.selectedIndex = getSelectedIndex(_chexi, v2_car); getCheXing(v2_car); } } function getCheXing(serialID) { joinCarTitle(1); var _pinPai = document.getElementById('sltPinPai'); var _chexi = document.getElementById('sltCheXi'); var _chexing = document.getElementById('sltCheXing'); $(_chexing).empty().hide(); setCarValue(); if (serialID == 0) return; autoSelectCarType(); var url = '/ajax/?action=getchexing&serialID=' + serialID; $.get(url, null, function (data) { var arr = eval(data); getCheXing_callback(arr); }); } function getCheXing_callback(data) { var _chexing = document.getElementById('sltCheXing'); $(_chexing).data("CheXingData", data); $(_chexing).show(); addItem(_chexing, '请选择车型', 0); for (var i = 0; i < data.length; i++) { addItem(_chexing, data[i].Name, data[i].ID); } if (isFirstLoad) { _chexing.selectedIndex = getSelectedIndex(_chexing, v3_car); sltCheXing_change(_chexing); isFirstLoad = false; } } function autoSelectCarType() { if (true) { var _chexi = document.getElementById('sltCheXi'); var index = _chexi.selectedIndex - 1; if (index >= 0) { var level = arrCheXiLevel[index]; index = getCarTypeIndex(level); $(':radio[name="ObjectType"]').get(index).checked = true; } } } function addItem(objSelect, text, value) { var item = document.createElement('option'); item.text = text; item.value = value; if ($.browser.msie) { objSelect.add(item); } else { objSelect.appendChild(item); } } function sltCheXing_change(sender) { var _chexing = document.getElementById('sltCheXing'); joinCarTitle(2); setCarValue(); if (isEditState()) { var _isAuto = $(_chexing).data("IsAuto"); if (_isAuto == null || _isAuto == undefined || _isAuto == 0) { $(_chexing).data("IsAuto", 1); return; } } var gearbox = '', exhaustsize = ''; var index = sender.selectedIndex; if (index > 0) { var data = $(_chexing).data("CheXingData"); if (data != null && data != undefined) { gearbox = data[index - 1].gearbox; exhaustsize = data[index - 1].exhaustsize; } } $('#biansuqi').val(gearbox); $('#cspailiang').val(exhaustsize); } function checkCarData() { var _pinPai = document.getElementById('sltPinPai'); var _chexi = document.getElementById('sltCheXi'); var bShow = $('#divPinpaiAndChexi').get(0).style.display == 'none'; if (bShow) { if (_pinPai.selectedIndex == 0) { alert('品牌是必选项。'); _pinPai.focus(); return false; } } else { var str = $('#tbxPinpaiAndChexi').val(); str = $.trim(str); if (str.length == 0) { alert('车型不能为空。'); $('#tbxPinpaiAndChexi').focus(); return false; } } return true; } function clearCarControlInfo() { var _pinPai = document.getElementById('sltPinPai'); var _chexi = document.getElementById('sltCheXi'); var _chexing = document.getElementById('sltCheXing'); var bShow = $('#divPinpaiAndChexi:hidden').length > 0; if (bShow) { setCarValue(); } else { if (_chexing.options.length > 0) _chexing.selectedIndex = 0; if (_chexi.options.length > 0) _chexi.selectedIndex = 0; if (_pinPai.options.length > 0) _pinPai.selectedIndex = 0; } } function setCarValue() { var id1 = 0; var id2 = 0; var id3 = 0; var both_name = ''; var _pinPai = document.getElementById('sltPinPai'); var _chexi = document.getElementById('sltCheXi'); var _chexing = document.getElementById('sltCheXing'); var bShow = $('#divPinpaiAndChexi').get(0).style.display == 'none'; if (bShow) { if (_pinPai.options.length > 0) id1 = $(_pinPai).val(); if (_chexi.options.length > 0) id2 = $(_chexi).val(); if (_chexing.options.length > 0) { id3 = $(_chexing).val(); } if (id1 > 0) { both_name = _pinPai.options[_pinPai.selectedIndex].text; both_name = formatPinPaiName(both_name); if (id2 > 0) { both_name += _chexi.options[_chexi.selectedIndex].text; } } } else { _pinPai.selectedIndex = 0; getCheXi(0); } both_name = both_name.replace('·', ''); $('#tbxPinpaiAndChexi').val(both_name); }
    function handwriting() { $('#divPinpaiAndChexi').slideDown(); $('#divSelectCar').slideUp(); } function closeWriting() { $('#divPinpaiAndChexi').slideUp(); $('#divSelectCar').slideDown(); } var isFirstLoad = true; var v1_car = ''; var v2_car = ''; var v3_car = ''; var v4_car = ''; function initCar() { resetCarPinPaiInEditState(); var _pinPai = document.getElementById('sltPinPai'); _pinPai.selectedIndex = getSelectedIndex(_pinPai, v1_car); var brandID = $(_pinPai).val(); getCheXi(brandID); initLinkPinPai(); } function initLinkPinPai() { var _pinPai = document.getElementById('sltPinPai'); var _text = _pinPai.options[_pinPai.selectedIndex].text; $('#linkSelectCar').html(_text + '<i></i>'); } $(document).ready(initCar); function formatPinPaiName(name) { var pos = name.indexOf('-'); if (pos != -1) name = name.substring(2); return name; } function getSelectedIndex(objSelect, value) { var index = 0; var items = objSelect.options; $.each(items, function (i, n) { if (n.value == value) { index = i; return false; } }); return index; } function resetCarPinPaiInEditState() { if (isEditState()) { if (v1_car == '') { $('#divPinpaiAndChexi').show(); $('#divSelectCar').hide(); } } } function isEditState() { var url = location.href; var index = url.indexOf('/update/'); return index != -1; } function joinCarTitle(typeID) { if (isFirstLoad) return; var _pinPai = document.getElementById('sltPinPai'); var _chexi = document.getElementById('sltCheXi'); var _chexing = document.getElementById('sltCheXing'); var _title = document.getElementById('Title'); var str = '', v1 = '', v2 = '', v3 = ''; if (_pinPai.selectedIndex > 0) v1 = _pinPai.options[_pinPai.selectedIndex].text; if (typeID >= 1 && _chexi.selectedIndex > 0) v2 = _chexi.options[_chexi.selectedIndex].text; if (typeID >= 2 && _chexing.selectedIndex > 0) v3 = _chexing.options[_chexing.selectedIndex].text; v1 = v1.replace('·', ''); str = v1 + v2 + ' ' + v3; str = formatPinPaiName(str).substr(0, 25); $(_title).val(str); } </script> <script type="text/javascript">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              function cheshenyanse_onchange() { var ddl = $('#cheshenyanse').get(0); var text = ddl.options[ddl.selectedIndex].text; if (text == '其它') { $('#tbxyanse').val('').fadeIn(); } else { $('#tbxyanse').fadeOut().val(text); } } $('#cheshenyanse').change(cheshenyanse_onchange); function isAdd() { return '0' == '0'; } function cheshenyanse_editInit() { if (!isAdd()) { var ddl = $('#cheshenyanse').get(0); var text = ddl.options[ddl.selectedIndex].text; if (text == '其它') $('#tbxyanse').show(); } } cheshenyanse_editInit(); </script>
</asp:Content>
