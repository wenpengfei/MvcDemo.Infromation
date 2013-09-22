<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/FriendMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IFriend>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="Rows" runat="server">
<tr> 
        <td class="t"> <b class="red">*</b> 类 型： </td> 
        <td> 
            <label><input name="pagetype" value="1" type="radio" onclick="tojump(this)" checked="checked" />异性交友</label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <label><input name="pagetype" value="2" type="radio" onclick="tojump(this)" />兴趣交友</label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <label><input name="pagetype" value="3" type="radio" onclick="tojump(this)" />同乡会</label> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 交友目的： </td> 
        <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=15 /> <span id="Title_Tip"></span> </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 性 别： </td> 
        <td>  
            <label><input id="sex_0" f="{0}" type="radio" name="sex" value='0'  /><span>男</span></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <label><input id="sex_1" f="{0}" type="radio" name="sex" value='1'  /><span>女</span></label>&nbsp;&nbsp;&nbsp;&nbsp; 
            <span id="sex_Tip"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 年 龄： </td> 
        <td> 
            <input class="text3" type="text" id="Age" name="Age" f="{0}岁" value=''  maxLength=3/> 岁 &nbsp;&nbsp;&nbsp;&nbsp;
            <select name="xingzuo" id="xingzuo" f="{0}"> 
                <option selected="selected" value="">星座</option>  
                <option value='1' > 白羊座</option>  
                <option value='2' > 金牛座</option>  
                <option value='3' > 双子座</option>  
                <option value='4' > 巨蟹座</option>  
                <option value='5' > 狮子座</option>  
                <option value='6' > 处女座</option>  
                <option value='7' > 天秤座</option>  
                <option value='8' > 天蝎座</option>  
                <option value='9' > 射手座</option>  
                <option value='10' > 摩羯座</option>  
                <option value='11' > 水瓶座</option>  
                <option value='12' > 双鱼座</option>  
            </select><span id="Age_Tip"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 身高/体重： </td> 
        <td> 
            <input class="text3" type="text" id="higth" name="higth" f="{0}厘米" value=''  maxLength=3/>厘米&nbsp;&nbsp;
            <input class="text3" type="text" id="tizhong" name="tizhong" f="{0}公斤" value=''  maxLength=3/>公斤
            <span id="higth_Tip"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 现 状： </td> 
        <td> 
            <select name="hunyin" id="hunyin" f="{0}" style="width:100px"> 
                <option selected="selected" value="">--婚姻--</option>  
                <option value='0' selected> 未婚</option>  
                <option value='1' > 离异</option>  
                <option value='2' > 丧偶</option>  
            </select>&nbsp;
            <select name="zinv" id="zinv" f="{0}" style="width:100px"> 
                <option selected="selected" value="">--有无子女--</option>  
                <option value='1' selected> 无子女</option>  
                <option value='2' > 有小孩归自己</option>  
                <option value='3' > 有小孩归对方</option>  
            </select>&nbsp;
            <select name="zhiye" id="zhiye" f="{0}" style="width:100px"> 
                <option selected="selected" value="">--职业--</option>  
                <option value='1' selected> 在校学生</option>  
                <option value='2' > 上班族</option>  
                <option value='3' > 高级管理者</option>  
                <option value='4' > 老板</option>  
                <option value='5' > 自由职业</option>  
                <option value='6' > 失业中</option>  
            </select>&nbsp;
            <select name="edugrade" id="edugrade" f="{0}" style="width:100px"> 
                <option selected="selected" value="">--学历--</option>  
                <option value='0' > 高中/中专</option>  
                <option value='1' > 大专</option>  
                <option value='2' > 本科</option>  
                <option value='4' > 双学士</option>  
                <option value='3' > 硕士</option>  
                <option value='5' > 博士</option>  
                <option value='6' > 博士后</option>  
            </select><span id="hunyin_Tip"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> 家 乡： </td> 
        <td> <select name="census" id="census" f="{0}"> 
            <option value="">--省份--</option>  
            <option value='1' > 北京</option>  
            <option value='2' > 天津</option>  
            <option value='3' > 河北</option>  
            <option value='4' > 山西</option>  
            <option value='5' > 内蒙古</option>  
            <option value='6' > 辽宁</option>  
            <option value='7' > 吉林</option>  
            <option value='8' > 黑龙江</option>  
            <option value='9' > 上海</option>  
            <option value='10' > 江苏</option>  
            <option value='11' > 浙江</option>  
            <option value='12' > 安徽</option>  
            <option value='13' > 福建</option>  
            <option value='14' > 江西</option>  
            <option value='15' > 山东</option>  
            <option value='16' > 河南</option>  
            <option value='17' > 湖北</option>  
            <option value='18' > 湖南</option>  
            <option value='19' > 广东</option>  
            <option value='20' > 广西</option>  
            <option value='21' > 海南</option>  
            <option value='22' > 重庆</option>  
            <option value='23' > 四川</option>  
            <option value='24' > 贵州</option>  
            <option value='25' > 云南</option>  
            <option value='26' > 西藏</option>  
            <option value='27' > 陕西</option>  
            <option value='28' > 甘肃</option>  
            <option value='29' > 青海</option>  
            <option value='30' > 宁夏</option>  
            <option value='31' > 新疆</option>  
            <option value='32' > 台湾</option>  
            <option value='33' > 香港</option>  
            <option value='34' > 澳门</option>  
            <option value='35' > 国外</option>  
        </select>&nbsp;
        <select name="ddlcensus2" id="ddlcensus2">
            <option value="">--城市--</option>
        </select>  
        <input type="hidden" id="census2" name="census2" value='' f="{0}" /> 
        <span id="census_Tip"></span> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var friend = new FriendSex();
        friend.Purpose = $("#Title").val();
        friend.Sex = $("#sex_0").attr("checked");
        friend.Age = parseInt($("#Age").val(), 10);
        if ($("#xingzuo").val() != "") {
            friend.Constellation = $("#xingzuo").find("option:selected").text();
        }
        friend.Height = parseInt($("#higth").val(), 10);
        friend.Weight = parseInt($("#tizhong").val(), 10);
        if ($("#hunyin").val() != "") {
            friend.Marriage = $("#hunyin").find("option:selected").text();
        }
        if ($("#zinv").val() != "") {
            friend.Child = $("#zinv").find("option:selected").text();
        }
        if ($("#zhiye").val() != "") {
            friend.Job = $("#zhiye").find("option:selected").text();
        }
        if ($("#edugrade").val() != "") {
            friend.Education = $("#edugrade").find("option:selected").text();
        }
        if ($("#census").val() != "") {
            friend.HomeProvinceId = parseInt($("#census").val(), 10);
        }
        if ($("#ddlcensus2").val() != "") {
            friend.HomeCityId = parseInt($("#ddlcensus2").val(), 10);
        }

        FillData(friend);
        friend.Id = -1;
        friend.DateCreated = new Date().toJson(true);
        friend.DateModified = friend.DateCreated;
        friend.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-15个字，不能填写电话和特殊符号<br>如：找位男生一起看电影", q2b: true }).inputValidator({ onerror: "请输入交友目的" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,15}$", onerror: "请输入标题#标题不足6个字#6-15个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "交友目的太过简单" });
        $(":radio[name='sex']").formValidator({ tipid: "sex_Tip", onfocus: "请选择性别" }).inputValidator({ min: 1, onerror: "请选择性别", type: "radio" });
        $("#Age").formValidator({ tipid: "Age_Tip", onfocus: "年龄为2~3位整数", q2b: true }).inputValidator({ onerror: "请输入年龄" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{1,2}$", onerror: "请输入年龄#年龄为2~3位整数" });
        $("#higth").formValidator({ tipid: "higth_Tip", onfocus: "身高为2~3位整数", q2b: true }).inputValidator({ onerror: "请输入身高" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{1,2}$", onerror: "请输入身高#身高为2~3位整数" }).groupValidator({ groupName: "lhigth", nextgroupid: "tizhong" });
        $("#tizhong").formValidator({ tipid: "higth_Tip", onfocus: "体重为2~3位整数", q2b: true }).inputValidator({ onerror: "请输入体重" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{1,2}$", onerror: "请输入体重#体重为2~3位整数" }).groupValidator({ groupName: "lhigth", nextgroupid: "higth" });
        $("#hunyin").formValidator({ tipid: "hunyin_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择婚姻" });
        $("#zinv").formValidator({ tipid: "hunyin_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择有无子女" });
        $("#zhiye").formValidator({ tipid: "hunyin_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择职业" }); if (!$.c.common.isIE6()) {
            $("#hunyin").groupValidator({ groupName: "lh", nextgroupid: "zinv" }); $("#zinv").groupValidator({ groupName: "lh", nextgroupid: "zhiye" });
            $("#zhiye").groupValidator({ groupName: "lh", nextgroupid: "hunyin" });
        }
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { var _r = $.formValidator.checkContent(val); if (typeof _r == "string") return _r; if (_r) { if (val == _contentTip) return '补充说明是必填项'; return true; } } });
    });
    var _contentTip = '可以说说您对约会异性的要求等。';
    $.j.initContentTip(_contentTip); String.prototype.TrimEnd = function (c) {
        return this.replace(new RegExp(c + '*$'), '');
    };
    function isAdd() {
        return '0' == '0';
    }
</script>

<script type="text/javascript">
    $().ready(function () {
        $('#census').bind('change', showCity);
        $('#ddlcensus2').bind('change', fillCity);
    });
    function fillCity() {
        var ddl = $('#ddlcensus2').get(0); var val = ddl.options[ddl.selectedIndex].value;
        $('#census2').val(val);
    }
    function showCity() {
        var shenName = getShenfenName();
        var arrCity = getCityList(shenName);
        $('#ddlcensus2 option[value!=""]').remove();
        $(arrCity).each(function () { $.c.common.addOptionsToSelect('ddlcensus2', this, this); });
        selectSavedCity();
        fillCity();
    }
    function selectSavedCity() {
        if (!isAdd()) {
            var state = $('#ddlcensus2').data('isFirst');
            if (!state) {
                $('#ddlcensus2').data('isFirst', true); var city = '';
                $.c.common.setSelectedOption('ddlcensus2', null, city);
            }
        }
    }
    function getShenfenName() {
        var ddl = $('#census').get(0);
        return ddl.options[ddl.selectedIndex].text;
    }
    function getCityList(shenfen) {
        var arrCity = []; var arrData = $(document).data('CityData');
        $(arrData).each(function (n, i) {
            if ($(this)[0] == shenfen) {
                for (var i = 1; i < $(this).length; i++) {
                    arrCity.push($(this)[i]);
                } return false;
            }
        }); return arrCity;
    }
     
</script>
</asp:Content>
