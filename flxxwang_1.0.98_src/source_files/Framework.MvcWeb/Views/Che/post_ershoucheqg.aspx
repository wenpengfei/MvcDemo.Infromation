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
<tr class="pb"> 
    <td class="t"> <b class="red">*</b> 求购类型： </td> 
    <td> 
        <ul class="tag3" id="tagul"> 
            <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="168"  />经济轿车</li>
            <li><input name="Tag" id="Tag_1" type="checkbox" value="169"  />中级轿车</li>
            <li><input name="Tag" id="Tag_2" type="checkbox" value="170"  />高档轿车</li>
            <li><input name="Tag" id="Tag_3" type="checkbox" value="171"  />商务车</li>
            <li><input name="Tag" id="Tag_4" type="checkbox" value="172"  />越野车</li>
            <li><input name="Tag" id="Tag_5" type="checkbox" value="173"  />面包车</li>
            <li><input name="Tag" id="Tag_6" type="checkbox" value="174"  />客车/中巴</li>
            <li><input name="Tag" id="Tag_7" type="checkbox" value="175"  />货车/皮卡</li>
            <li><input name="Tag" id="Tag_8" type="checkbox" value="951"  />厢式货车</li>
            <li><input name="Tag" id="Tag_9" type="checkbox" value="290"  />其他车型</li>--%>
            <%
                foreach (var item in CarBuy.Singleton.TagCollection)
                {
                    %>
                        <li><input name="Tag" id="Tag_<%=item.Id %>" type="checkbox" value="<%=item.Id %>" t="<%=item.ObjectTypeId %>"/><%=item.Name %></li>
                    <%    
                }
            %>
        </ul> <span id="infotag_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 变速器： </td> 
    <td> 
        <select name="biansuqi" id="biansuqi"> 
            <option value="">请选择</option>  
            <option value='1' > 手动</option>  
            <option value='2' > 全自动</option>  
            <option value='3' > 手自一体</option>  
            <option value='4' > CVT</option>  
            <option value='5' > 不限</option>  
        </select>&nbsp;&nbsp;&nbsp; 
        <b class="red">*</b> 排量范围： 
        <select name="pailiang" id="pailiang"> 
            <option value="">请选择</option>  
            <option value='1' > 1.0升以下</option>  
            <option value='2' > 1.0-1.6升</option>  
            <option value='3' > 1.6-2.2升</option>  
            <option value='6' > 2.2-2.8升</option>  
            <option value='4' > 2.8-4.0升</option>  
            <option value='5' > 4.0升以上</option>  
        </select> <span id="biansuqi_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 里程要求： </td> 
    <td> 
        <select name="licheng" id="licheng"> 
            <option value="">请选择</option>  
            <option value='1' > 1万公里内</option>  
            <option value='2' > 3万公里内</option>  
            <option value='3' > 5万公里内</option>  
            <option value='4' > 8万公里内</option>  
            <option value='5' > 10万公里内</option>  
            <option value='6' > 15万公里内</option>  
            <option value='10' > 20万公里内</option>  
            <option value='7' > 25万公里内</option>  
            <option value='8' > 30万公里内</option>  
            <option value='9' > 不限里程</option>  
        </select>&nbsp;&nbsp;&nbsp; 
        <b class="red">*</b> 期望价格： 
        <select name="jiage" id="jiage"> 
            <option value="">请选择</option>  
            <option value='0-1' > 1万元以内</option>  
            <option value='1-2' > 1-2万元</option>  
            <option value='2-3' > 2-3万元</option>  
            <option value='3-5' > 3-5万元</option>  
            <option value='5-8' > 5-8万元</option>  
            <option value='8-12' > 8-12万元</option>  
            <option value='12-18' > 12-18万元</option>  
            <option value='18-25' > 18-25万元</option>  
            <option value='25-40' > 25-40万元</option>  
            <option value='40-99999999' > 40万元以上</option>  
        </select> <span id="licheng_Tip"></span> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var car = new CarBuy();
        car.Title = $("#Title").val();
        var Tags = $(':checkbox[name="Tag"]:checked');
        if (Tags.length >= 1) {
            car.Tag1 = parseInt($(Tags[0]).val(), 10);
        }
        if (Tags.length >= 2) {
            car.Tag2 = parseInt($(Tags[1]).val(), 10);
        }
        car.Transmission = $("#biansuqi").find("option:selected").text();
        car.Exhaust = $("#pailiang").find("option:selected").text();
        car.Rundistance = $("#licheng").find("option:selected").text();

        var strPrice = $("#jiage").find("option:selected").text();
        car.Price1 = parseInt(strPrice.split("-")[0], 10);
        car.Price2 = parseInt(strPrice.split("-")[1], 10);

        FillData(car);
        car.Id = -1;
        car.DateCreated = new Date().toJson(true);
        car.DateModified = car.DateCreated;
        car.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $.j.asynPhone('37800967', '0', '', '');
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            //            return sub();
//            post();
//            return false;
//        }
//        });
        //$("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" }); 
        $("#qgpinpai").formValidator({ tipid: "qgpinpai_Tip", onfocus: "请输入求购的汽车品牌", q2b: true }).inputValidator({ onerror: "请输入求购品牌" }).regexValidator({ regexp: "^\\S+$#^(.){2,12}$", onerror: "请输入求购品牌#求购品牌不足2个字" }); $("#biansuqi").formValidator({ tipid: "biansuqi_Tip", onfocus: "" }).inputValidator({ min: 1, onerror: "请选择变速器", type: "radio" });
        $("#pailiang").formValidator({ tipid: "biansuqi_Tip", onfocus: "" }).inputValidator({ min: 1, onerror: "请选择排量", type: "radio" });
        $("#licheng").formValidator({ tipid: "licheng_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择里程要求" });
        $("#jiage").formValidator({ tipid: "licheng_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择价格范围" });
        //$("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });
        //$('#goblianxiren').formValidator({ tipid: 'goblianxiren_Tip', onfocus: '2~6个字，不能填写电话和联系方式', q2b: true }).regexValidator({ regexp: "\\S+#^(.){2,6}$#^[\\w\\d\\s\\u4e00-\\u9fa5]*$", onerror: "请输入联系人#联系人不足2个字#联系人不能填写特殊符号" });
        //$("#Phone").formValidator({ tipid: "Phone_Tip", onfocus: "请正确填写电话号码，分机可以用“-”分开", q2b: true }).inputValidator({ onerror: "请填写电话号码" }).regexValidator({ regexp: "(^(0\\d{2,3})?-?([2-9]\\d{6,7})(-\\d{1,5})?$)|(^((\\(\\d{3}\\))|(\\d{0}))?(13|14|15|18)\\d{9}$)|(^(400|800)\\d{7}(-\\d{1,5})?$)|(^(95013)\\d{6,8}$)", onerror: "电话填写错误。<br/>请参照格式填写：87654321-001或138********" });
        //$('#IM').formValidator({ tipid: 'IM_Tip', onfocus: '只能填写一个qq或msn。<br>格式如：123456 或 myname@flxxwang.com', q2b: true, 'empty': true }).regexValidator({ regexp: "(^[1-9]\\d{4,9}$)|(^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$)", onerror: "QQ或MSN输入错误" }); 
        setTimeout(function () { initTagCheck(2); }, 1000);
    });
    $(document).ready(function () {
        //$.c.user.user_unlogin('login', '79');
    });
    try {
        $.j.initEffectiveDate();
    } catch (E) { }
    function initTagCheck(limitNum) {
        var _num = 2; if (limitNum) {
            if (!isNaN(limitNum)) {
                if (parseInt(limitNum) > 0)
                { _num = parseInt(limitNum); }
            }
        }
        $(':checkbox[name="Tag"]').formValidator({ tipid: 'infotag_Tip', onfocus: '' }).functionValidator({ fun: function (val, elem) { var _c = $(':checkbox[name="Tag"]:checked').length; if (_c == 0) return '请至少选择一个标签'; if (_c <= _num) return true; return '最多只能选择' + _num + '个标签'; } });
        $(':checkbox[name="Tag"]').bind('click', function () { var c = $(':checkbox[name="Tag"]:checked').length; if (c == 0) { $.formValidator.setTipState("#infotag_Tip", "onError", "请至少选择一个标签", "infotag_Tip"); } else if (c <= _num) { $.formValidator.setTipState("#infotag_Tip", "onCorrect", " ", "infotag_Tip"); } else { $.formValidator.setTipState("#infotag_Tip", "onError", "最多只能选择" + _num + "个标签", "infotag_Tip"); } });
    } 
</script>
</asp:Content>
