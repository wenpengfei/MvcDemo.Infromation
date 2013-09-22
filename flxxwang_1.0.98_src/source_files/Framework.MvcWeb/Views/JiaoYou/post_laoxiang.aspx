<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/FriendMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IFriend>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="Rows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 类 型： </td> 
    <td> 
        <label><input name="pagetype" value="1" type="radio" onclick="tojump(this)" />异性交友</label>&nbsp;&nbsp;&nbsp;&nbsp; 
        <label><input name="pagetype" value="2" type="radio" onclick="tojump(this)" />兴趣交友</label>&nbsp;&nbsp;&nbsp;&nbsp; 
        <label><input name="pagetype" value="3" type="radio" onclick="tojump(this)" checked="checked" />同乡会</label> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 性 别： </td> 
    <td>  
        <label><input id="sex_0" f="{0}" type="radio" name="sex" value='0'  /><span>男</span></label>&nbsp;&nbsp;&nbsp;&nbsp; 
        <label><input id="sex_1" f="{0}" type="radio" name="sex" value='1'  /><span>女</span></label>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 
        年 龄：<input class="text3" type="text" id="Age" name="Age" f="{0}岁" value=''  Except='null'  maxLength=3/> 岁
        <span id="sex_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 家乡： </td> 
    <td> 
        <select name="census" id="census" f="{0}"> 
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
        <input type="hidden" id="census2" name="census2" value='' f="{0}" /> <span id="census_Tip"></span> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var friend = new FriendSex();
        friend.Sex = $("#sex_0").attr("checked");
        friend.Age = parseInt($("#Age").val(), 10);

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
            //            $.j.getCityDataFromXml(document, showCity);
            //            $('#census').bind('change', showCity);
            //            $('#ddlcensus2').bind('change', fillCity);

            $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
            $(":radio[name='sex']").formValidator({ tipid: "sex_Tip", onfocus: "请选择性别" }).inputValidator({ min: 1, onerror: "请选择性别", type: "radio" });
            $("#census").formValidator({ tipid: "census_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择省份" }).groupValidator({ groupName: "lcen", nextgroupid: "ddlcensus2" });
            $("#ddlcensus2").formValidator({ tipid: "census_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择城市" }).groupValidator({ groupName: "lcen", nextgroupid: "census" });
            $("#Age").formValidator({ tipid: "sex_Tip", onfocus: "年龄为2~3位整数", q2b: true, 'empty': true }).inputValidator({ onerror: "请输入年龄" }).regexValidator({ regexp: "^[1-9]\\d{1,2}$", onerror: "年龄为2~3位整数" });

        });

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
