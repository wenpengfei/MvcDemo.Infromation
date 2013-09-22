<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/HouseMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IHouse>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
        <td class="t"> <b class="red">*</b> 供 求： </td> 
        <td>  
            <label> <input id="type_0" f="{0}" class="base" type="radio" name="type" value='1' checked onclick="change(this)" /><span>出租</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
            <label> <input id="type_1" f="{0}" class="base" type="radio" name="type" value='2'  onclick="change(this)" /><span>求租</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
            <label> <input id="type_2" f="{0}" class="base" type="radio" name="type" value='3'  onclick="change(this)" /><span>转让</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
            <label> <input id="type_3" f="{0}" class="base" type="radio" name="type" value='4'  onclick="change(this)" /><span>求购</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
            <label> <input id="type_4" f="{0}" class="base" type="radio" name="type" value='5'  onclick="change(this)" /><span>出售</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
            <span id="type_message"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 标 题： </td> 
        <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /><span id="Title_Tip"></span></td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b><span id="qiwangweizhi">期望</span>位置： </td> 
        <td> 
            <input type="text" f="{0}" class="text2" id="diduan" name="diduan" value=''  maxLength=12 /> 
            <span id="w1">或 </span>&nbsp; <input type="text" id="diduan2" f="{0}" class="text2" name="diduan2" value=''  Except='null'  maxLength=12 /> 
            <span id="w2">或 </span><span id="diduan_Tip"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> <span id="qiwangleixing">期望</span>类型： </td> 
        <td> 
        <select name="ObjectType" id="ObjectType" f="{0}">  
            <%--<option value='1' > 仓库</option>  
            <option value='2' > 车库</option>  
            <option value='3' > 土地</option>  
            <option value='4' > 厂房</option>  
            <option value='5' > 其他</option> --%>
            <%
                foreach (var item in HouseOther.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>'><%=item.Name %></option>
                    <%
                }
             %> 
        </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <span id="qiwangmianji">期望</span>面积：<input class="text3" type="text" id="area" f="{0}平米" name="area" value=''  maxLength=7 />平米 
        <span id="area_Tip"> </span> 
    </td>
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> <span id="qiwangjiage">期望</span><span id="mn">价格</span>： </td> 
    <td> 
        <input type="text" class="text3 gray" id="minPrice" f="{0}" value='面议'  Except='面议'  maxLength=8 /> 
        <span id="sp1">- &nbsp; <input type="text" id="MinPrice2" f="{0}" class="text3 gray" value=''  Except='面议'  maxLength=8 /> 
        </span><span id="danwei1">万元</span> 
        <select name="danwei" id="danwei">  
            <option value='1' selected> 元/㎡/天</option>  
            <option value='2' > 元/月</option>  
        </select> 
        <span id="zr" style="display: none">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        转让费： <input type="text" id="zhuanrangfei" class="text3" name="zhuanrangfei" value=''  maxLength=6 />万元 </span>
        <span id="minPrice_Tip"></span> 
        <%--<input type="hidden" value='面议' name='minPrice' id='hidprice' /> --%>
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var house = new HouseOther();
        house.Type = parseInt(getRadioValue("type"), 10);
        house.Title = $("#Title").val();
        house.District1 = $("#diduan").val();
        house.District2 = $("#diduan2").val();
        house.ObjectType = parseInt($("#ObjectType").val(), 10);
        house.Area = parseInt($("#area").val(), 10);
        house.Price = $("#minPrice").val();
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
            house.PriceTransfer = $("#zhuanrangfei").val();
            if (house.PriceTransfer == "" || house.PriceTransfer == "面议") {
                house.PriceTransfer = 0;
            }
            else {
                house.PriceTransfer = parseInt(house.PriceTransfer, 10);
            }
        }
        if (house.Type == 1 || house.Type == 2 || house.Type == 3) {
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
        disabledHiddenControl('danwei');
        posting();
        post();
        return false; //阻止表单提交.
    }
    $(document).ready(function () {
        showBizTip();
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu',
//            fun: function () {
//                //                $.c.Disabletor.initSubValue("sp1", "minPrice", "MinPrice2", "hidprice");
//                disabledHiddenControl('danwei');
//                post();
//                return false;
//                //                return true;
//            }
//        });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#diduan").formValidator({ tipid: "diduan_Tip", onfocus: "2-12个字之间，不能填写特殊符号", q2b: true }).inputValidator({ onerror: "请输入房源位置" }).regexValidator({ regexp: "\\S+#^(.){2,12}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "请输入房源位置#位置不足2个字#房源位置里不能填写电话" });
        $("#diduan2").formValidator({ tipid: "diduan_Tip", onfocus: "2-12个字之间，不能填写特殊符号", q2b: true, 'empty': true }).regexValidator({ regexp: "^(.){2,12}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "房源位置不足2个字#房源位置里不能填写电话" });
        $("#area").formValidator({ tipid: "area_Tip", onfocus: "面积只能填写7位以下数字", q2b: true }).inputValidator({ onerror: "请输入面积" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,6}$", onerror: "请填写面积#面积为0以外的整数" });
        $("#minPrice").formValidator({ tipid: "minPrice_Tip", onfocus: "只能填数字", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请输入价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,7}(\\.\\d{1,1})?$", onerror: "请填写价格#价格不能为0，允许一位小数" }).groupValidator({ groupName: "l2", nextgroupid: "MinPrice2" });
        $("#MinPrice2").formValidator({ tipid: "minPrice_Tip", onfocus: "只能填数字", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请输入价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,7}(\\.\\d{1,1})?$", onerror: "请填写价格#价格不能为0，允许一位小数" }).groupValidator({ groupName: "l2", nextgroupid: "zhuanrangfei" }); $("#zhuanrangfei").formValidator({ tipid: "minPrice_Tip", onfocus: "只能填数字", q2b: true }).inputValidator({ onerror: "请填写转让价格" }).regexValidator({ regexp: "^\\S+$#^\\d{1,4}(\\.\\d{1,1})?$", onerror: "请填写转让价格#请正确输入转让费，允许一位小数" }).groupValidator({ groupName: "l2", nextgroupid: "minPrice" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "补充说明太过简单" });
    });
    var w1 = document.getElementById("w1");
    var w2 = document.getElementById("w2");
    var mn = document.getElementById("mn");
    function change(o) {
        if (!o) {
            var list = document.getElementsByName("type");
            for (var i = 0; i < list.length; i++) {
                if (list[i].checked) {
                    o = list[i]; break;
                }
            }
        }
        $.c.Disabletor.setdisable([{ v: 0, a: "sp1|MinPrice2|zr|diduan3|danwei1|zhuanrangfei|qiwangweizhi|qiwangleixing|qiwangmianji|qiwangjiage", t: 1,
            c: function () { w1.innerHTML = "邻近"; w2.innerHTML = '位置'; mn.innerHTML = '价 格'; $("#pdv").css("display", ""); }
        }, { v: 1, a: "zr|danwei1|zhuanrangfei", t: 1,
            c: function () { w1.innerHTML = "或"; w2.innerHTML = ' '; mn.innerHTML = '价格'; $("#pdv").css("display", "none"); }
        }, { v: 2, a: "sp1|MinPrice2|diduan3|danwei1|qiwangweizhi|qiwangleixing|qiwangmianji|qiwangjiage", t: 1,
            c: function () { w1.innerHTML = "邻近"; w2.innerHTML = '位置'; mn.innerHTML = '历史租金'; $("#pdv").css("display", ""); }
        }, { v: 4, a: "sp1|MinPrice2|danwei|fukuanfangshi|zr|diduan3|zhuanrangfei|qiwangweizhi|qiwangleixing|qiwangmianji|qiwangjiage", t: 1,
            c: function () { w1.innerHTML = "邻近"; w2.innerHTML = '位置'; mn.innerHTML = '价 格'; $("#pdv").css("display", ""); }
        }, { v: 3, a: "zr|danwei|fukuanfangshi|zhuanrangfei", t: 1,
            c: function () { w1.innerHTML = "或"; w2.innerHTML = ' '; mn.innerHTML = '价格'; $("#pdv").css("display", "none"); }
        }], o.value, 0); $.c.Disabletor.initValue("hidprice", "minPrice", "MinPrice2", 1, 0);
    } try { $.j.initEffectiveDate(); } catch (E) { } change();
    function showBizTip() {
        var cbx = $(':checkbox[name="IsBiz"]');
        if (cbx.attr('disabled')) {
            cbx.parent().hide(); cbx.parent().after('<font color="red">经纪人</font>');
        } else {
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
