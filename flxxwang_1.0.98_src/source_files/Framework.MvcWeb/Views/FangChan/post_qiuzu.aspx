<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/HouseMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IHouse>" %>

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
    <td class="t"> <b class="red">*</b> 求租地区： </td> 
    <td> 
        <input type="text" id="diduan" f="{0}" class="text2" name="diduan" value=''  maxLength=12 /> 或 
        <input class="text2" type="text" id="diduan2" f="{0}" name="diduan2" value=''  Except='null'  maxLength=12 /> 附近 <span id="diduan_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 房屋类型： </td> 
    <td class="checkpb">  
        <input f="{0}" type="checkbox" value='1' name="ObjectType" id="ObjectType1"  /> <label>地下室</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <input f="{0}" type="checkbox" value='2' name="ObjectType" id="ObjectType2"  /> <label>平房</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <input f="{0}" type="checkbox" value='3' name="ObjectType" id="ObjectType3" checked /> <label>普通住宅</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <input f="{0}" type="checkbox" value='4' name="ObjectType" id="ObjectType4"  /> <label>公寓</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <input f="{0}" type="checkbox" value='5' name="ObjectType" id="ObjectType5"  /> <label>别墅</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <span id="ObjectType_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 居 室： </td> 
    <td class="checkpb">  
        <input f="{0}" type="checkbox" value='1' name="RoomCount" id="RoomCount1"  /> <label>一居室</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <input f="{0}" type="checkbox" value='2' name="RoomCount" id="RoomCount2" checked /> <label>两居室</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <input f="{0}" type="checkbox" value='3' name="RoomCount" id="RoomCount3"  /> <label>三居室</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <input f="{0}" type="checkbox" value='4' name="RoomCount" id="RoomCount4"  /> <label>四居室</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <input f="{0}" type="checkbox" value='5' name="RoomCount" id="RoomCount5"  /> <label>四居以上</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <span id="RoomCount_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 装修情况： </td> 
    <td class="checkpb">  
        <input f="{0}" type="checkbox" value='1' name="FitType" id="FitType1"  /> <label>简装</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <input f="{0}" type="checkbox" value='2' name="FitType" id="FitType2" checked /> <label>中等装修</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <input f="{0}" type="checkbox" value='3' name="FitType" id="FitType3"  /> <label>精装修</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <input f="{0}" type="checkbox" value='4' name="FitType" id="FitType4"  /> <label>豪华装修</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <span id="FitType_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 租 金： </td> 
    <td> 
        <select name="MinPrice" id="MinPrice" f="{0}元/月">  
            <option value='0-500' > 500元以下</option>  
            <option value='500-1000' > 500-1000元</option>  
            <option value='1000-1500' > 1000-1500元</option>  
            <option value='1500-2000' > 1500-2000元</option>  
            <option value='2000-3000' > 2000-3000元</option>  
            <option value='3000-4500' > 3000-4500元</option>  
            <option value='4500-0' > 4500元以上</option>  
        </select> 元/月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <select name="fukuanfangshi" id="fukuanfangshi">  
            <option value='1' selected> 可季付</option>  
            <option value='2' > 可半年付</option>  
            <option value='3' > 可年付</option>  
        </select> <span id="MinPrice_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> 房屋配置： </td> 
    <td class="checkpb">  
        <input id="HouseAllocation_6" f="{0}" type="checkbox" value='1' name="HouseAllocation"  /> <label>床</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input id="HouseAllocation_8" f="{0}" type="checkbox" value='2' name="HouseAllocation"  /> <label>热水器</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input id="HouseAllocation_9" f="{0}" type="checkbox" value='3' name="HouseAllocation"  /> <label>洗衣机</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input id="HouseAllocation_10" f="{0}" type="checkbox" value='4' name="HouseAllocation"  /> <label>空调</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input id="HouseAllocation_11" f="{0}" type="checkbox" value='5' name="HouseAllocation"  /> <label>冰箱</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input id="HouseAllocation_12" f="{0}" type="checkbox" value='6' name="HouseAllocation"  /> <label>电视机</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input id="HouseAllocation_13" f="{0}" type="checkbox" value='7' name="HouseAllocation"  /> <label>宽带</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <span id="HouseAllocation_Tip"></span> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var house = new HouseHire();
        house.Title = $("#Title").val();
        house.District1 = $("#diduan").val();
        house.District2 = $("#diduan2").val();
        house.HouseType1 = $(':checkbox[name="ObjectType"][value="1"]').attr('checked');
        house.HouseType2 = $(':checkbox[name="ObjectType"][value="2"]').attr('checked');
        house.HouseType3 = $(':checkbox[name="ObjectType"][value="3"]').attr('checked');
        house.HouseType4 = $(':checkbox[name="ObjectType"][value="4"]').attr('checked');
        house.HouseType5 = $(':checkbox[name="ObjectType"][value="5"]').attr('checked');
        house.Room1 = $(':checkbox[name="RoomCount"][value="1"]').attr('checked');
        house.Room2 = $(':checkbox[name="RoomCount"][value="2"]').attr('checked');
        house.Room3 = $(':checkbox[name="RoomCount"][value="3"]').attr('checked');
        house.Room4 = $(':checkbox[name="RoomCount"][value="4"]').attr('checked');
        house.Room5 = $(':checkbox[name="RoomCount"][value="5"]').attr('checked');
        house.FitType1 = $(':checkbox[name="FitType"][value="1"]').attr('checked');
        house.FitType2 = $(':checkbox[name="FitType"][value="2"]').attr('checked');
        house.FitType3 = $(':checkbox[name="FitType"][value="3"]').attr('checked');
        house.FitType4 = $(':checkbox[name="FitType"][value="4"]').attr('checked');
        house.Price1 = parseInt($("#MinPrice").val().split("-")[0], 10);
        house.Price2 = parseInt($("#MinPrice").val().split("-")[1], 10);
        house.PayWay = $("#fukuanfangshi").find("option:selected").text();
        house.Bed = $(':checkbox[name="HouseAllocation"][value="1"]').attr('checked');
        house.WaterHeater = $(':checkbox[name="HouseAllocation"][value="2"]').attr('checked');
        house.WashingMachine = $(':checkbox[name="HouseAllocation"][value="3"]').attr('checked');
        house.AirConditioner = $(':checkbox[name="HouseAllocation"][value="4"]').attr('checked');
        house.Icebox = $(':checkbox[name="HouseAllocation"][value="5"]').attr('checked');
        house.Television = $(':checkbox[name="HouseAllocation"][value="6"]').attr('checked');
        house.Broadband = $(':checkbox[name="HouseAllocation"][value="7"]').attr('checked');
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
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            post();
//            return false;
//        }
//        });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br>如：个人求租天通苑两居", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#diduan").formValidator({ tipid: "diduan_Tip", onfocus: "2-12个字之间，禁止特殊字符", q2b: true }).inputValidator({ onerror: "请输入求租地区" }).regexValidator({ regexp: "\\S+#^(.){2,12}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "请输入求租地区#求租地区不足2个字#求租地区里不能填写电话" });
        $("#diduan2").formValidator({ tipid: "diduan_Tip", onfocus: "2-12个字之间，禁止特殊字符", q2b: true, 'empty': true }).regexValidator({ regexp: "^(.){0,12}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "求租地区不足2个字#求租地区里不能填写电话" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { var _r = $.formValidator.checkContent(val); if (typeof _r == "string") return _r; if (_r) { if (val == _contentTip) return '请填写补充说明'; return true; } } });
        $(":checkbox[name='ObjectType']").formValidator({ tipid: "ObjectType_Tip", onfocus: "请选择房屋类型" }).inputValidator({ min: 1, onerror: "请选择房屋类型", type: "checkbox" });
        $(":checkbox[name='RoomCount']").formValidator({ tipid: "RoomCount_Tip", onfocus: "请选择居室" }).inputValidator({ min: 1, onerror: "请选择居室", type: "checkbox" });
        $(":checkbox[name='FitType']").formValidator({ tipid: "FitType_Tip", onfocus: "请选择装修情况" }).inputValidator({ min: 1, onerror: "请选择装修情况", type: "checkbox" });
        //        if (isAdd()) {
        //            $(':checkbox[name="HouseAllocation"][value="6"]').attr('checked', true);
        //            $(':checkbox[name="HouseAllocation"][value="8"]').attr('checked', true); 
        //        }
    });
    try {
        $.j.initEffectiveDate();
    } catch (E) { }
    var _contentTip = '例如对房子内部的家电要求、对自己情况的描述等…';
    $.j.initContentTip(_contentTip); function isAdd() { return '0' == '0'; }
    function showBizTip() {
        var cbx = $(':checkbox[name="IsBiz"]'); if (cbx.attr('disabled')) {
            cbx.parent().hide(); cbx.parent().after('<font color="red">经纪人</font>');
        } else {
            $('span[name="biz_shenfen"]').hide();
        }
        $("#id_agent_tip").hover(function () { $('#agent_tip').css('display', ''); }, function () { $('#agent_tip').css('display', 'none'); });
    } 
</script>
<script type="text/javascript">
    $(function () {
        $("#pdv").hide();
    });
</script>
</asp:Content>
