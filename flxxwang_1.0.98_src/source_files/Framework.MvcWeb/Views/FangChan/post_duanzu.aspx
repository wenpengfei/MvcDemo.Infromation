<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/HouseMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IHouse>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
<td class="t"> <b class="red">*</b> 供 求： </td> 
<td>
    <label><input id="type_0" f="{0}" class="base" type="radio" name="type" value='1' checked onclick="change(this)" /><span>出租</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
    <label><input id="type_1" f="{0}" class="base" type="radio" name="type" value='2'  onclick="change(this)" /><span>求租</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
    <span id="type_Tip"></span> 
</td> 
</tr> 
<tr> 
<td class="t"> <b class="red">*</b> 标 题： </td> 
<td><input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr> 
<tr> 
<td class="t"> <b class="red">*</b> 位 置： </td> 
<td> 
    <input class="text2" type="text" id="weizhi" f="{0}" name="weizhi" value=''  maxLength=12 /> 附近的 
    <input class="text2" type="text" id="diduan" f="{0}" name="diduan" value=''  maxLength=12 /> 
    <span id="weizhi_Tip"></span> 
</td> 
</tr> 
<tr> 
<td class="t"> 类 型： </td> 
<td> 
        <select name="ObjectType" id="ObjectType" f="{0}">  
            <%--<option value='1' > 家庭旅馆</option>  
            <option value='2' > 高档公寓</option>  
            <option value='3' > 商务酒店</option>  
            <option value='4' > 宾馆</option>  
            <option value='5' > 招待所</option>  
            <option value='6' > 其他</option>--%>
            <%
                foreach (var item in HouseShort.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>'><%=item.Name %></option>
                    <%
                }
             %>  
        </select> 
        &nbsp; &nbsp;最短租期：
    <input class="text3" type="text" id="ShortestLease" f="{0}天" name="ShortestLease" value=''   /> 天 <span id="ShortestLease_Tip"></span> 
</td> 
</tr>
<tr> 
<td class="t"> 租 金： </td>
<td> 
    <span id="p1"> <input f="{0}" type="text" id="MinPrice1" class="text3 gray" value='面议'  Except='面议'  maxLength=5 /> </span>
    <span id="p2">- <input f="{0}" type="text" id="MinPrice2" class="text3 gray" value=''  Except='面议'  maxLength=5/> </span> 
    <input type="hidden" value="面议" name="MinPrice" id="hidprice" /> 
    <select name="danwei" id="danwei" f="{0}">
        <option value='1' selected> 元/天</option>  
        <option value='2' > 元/月</option>  
    </select> <span id="MinPrice_Tip"></span> 
</td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var house = new HouseShort();
        house.Type = parseInt(getRadioValue("type"), 10);
        house.Title = $("#Title").val();
        house.District1 = $("#weizhi").val();
        house.District2 = $("#diduan").val();
        house.ObjectType = parseInt($("#ObjectType").val(), 10);
        if ($("#ShortestLease").val() != "") {
            house.Lease = parseInt($("#ShortestLease").val(), 10);
        }
        house.Price = $("#MinPrice1").val();
        if (house.Price == "面议") {
            house.Price = 0;
        }
        else {
            house.Price = parseInt(house.Price, 10);
        }
        if (house.Type == 1) {
            house.Price2 = 0;
        }
        else {
            house.Price2 = $("#MinPrice2").val();
            if (house.Price2 == "面议") {
                house.Price2 = 0;
            }
            else {
                house.Price2 = parseInt(house.Price2, 10);
            }
        }
        house.PriceUnit = parseInt($("#danwei").val(), 10);
        FillData(house);
        house.Id = -1;
        house.DateCreated = new Date().toJson(true);
        house.DateModified = house.DateCreated;
        house.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    function formValidatorSuccess() {
        clearPicValue();
        posting();
        post();
        return false; //阻止表单提交.
    }
    $(document).ready(function () {
        showBizTip();
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            //            try {
//            //                $.c.Disabletor.initSubValue("p2", "MinPrice1", "MinPrice2", "hidprice", 1);
//            //            } catch (ex) { }
//            clearPicValue();
//            post();
//            return false;
//            //            return true;
//        }
//        });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br>如：海淀五道口家庭旅馆入住每天80元", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#weizhi").formValidator({ tipid: "weizhi_Tip", onfocus: "2-12个字，不能填写特殊符号", q2b: true }).inputValidator({ onerror: "请输入房源位置" }).regexValidator({ regexp: "\\S+#^(.){2,12}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "请输入房源位置#房源位置不足2个字#房源位置里不能填写电话" });
        $("#diduan").formValidator({ tipid: "weizhi_Tip", onfocus: "2-12个字之间，不能填写特殊符号", q2b: true, empty: true }).regexValidator({ regexp: "\\S+#^(.){2,12}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "请输入房源位置#房源位置不足2个字#房源位置里不能填写电话" });
        $("#ShortestLease").formValidator({ tipid: "ShortestLease_Tip", onfocus: "只能填写整数", q2b: true, empty: true }).regexValidator({ regexp: "", onerror: "" });
        $("#MinPrice1").formValidator({ tipid: "MinPrice_Tip", onfocus: "租金只能为整数", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请填写租金" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请填写租金#租金为0以外的整数" });
        $("#MinPrice2").formValidator({ tipid: "MinPrice_Tip", onfocus: "租金只能为整数", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请填写租金" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请填写租金#租金为0以外的整数" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "补充说明太过简单" });
    });
    function change(o) {
        if (!o) {
            var list = document.getElementsByName("type");
            for (var i = 0; i < list.length; i++) {
                if (list[i].checked) {
                    o = list[i]; break;
                }
            }
        }
        $.c.Disabletor.setdisable([{ v: 1, a: "p2|MinPrice2", t: 2, c: function () { $("#pdv").css("display", ""); } }, { v: 2, a: "", t: 2, c: function () { $("#pdv").css("display", "none"); } }], o.value, 1);
        $.c.Disabletor.initValue("hidprice", "MinPrice1", "MinPrice2", 1, 0);
    }
    try { $.j.initEffectiveDate(); } catch (E) { }
    change();
    function clearPicValue() {
        var obj = $(':radio[name="type"]:checked');
        if (obj.val() == 1) {
            $('#Pic').val(''); $('#PicDesc').val('');
        }
    }
    function showBizTip() {
        var cbx = $(':checkbox[name="IsBiz"]'); if (cbx.attr('disabled')) { cbx.parent().hide(); cbx.parent().after('<font color="red">经纪人</font>'); } else { $('span[name="biz_shenfen"]').hide(); }
        $("#id_agent_tip").hover(function () { $('#agent_tip').css('display', ''); }, function () { $('#agent_tip').css('display', 'none'); });
    }
</script>
</asp:Content>
