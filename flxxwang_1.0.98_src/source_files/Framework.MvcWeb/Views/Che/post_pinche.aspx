<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/CarMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ICar>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--<script src="/Content/Fenlei/Scripts/gettooltip.js" type="text/javascript"></script>--%>
<script src="/Content/Fenlei/Scripts/11.js" type="text/javascript"></script>
</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 发布人： </td> 
    <td class="checkpb">  
        <label><input type="radio" onclick="change(this)" name="type" value='0' checked />我是车主</label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label><input type="radio" onclick="change(this)" name="type" value='1'  />我是乘客</label>&nbsp;&nbsp;&nbsp;&nbsp; 
        <span id="type_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 拼车类型： </td> 
    <td>  
        <%--<label> <input type="radio" onclick="change1(this)" name="ObjectType" value='0'  />上下班拼车</label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input type="radio" onclick="change1(this)" name="ObjectType" value='1' checked />春节拼车</label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input type="radio" onclick="change1(this)" name="ObjectType" value='2'  />拼车自驾游</label>&nbsp;&nbsp;&nbsp;&nbsp; --%>
        <%
            foreach (var item in Carpool.Singleton.ObjectTypeCollection)
            {
                %>
                    <label> <input type="radio" onclick="change1(this)" name="ObjectType" value='<%=item.Id %>' <%=item.Name == "长途拼车" ? "checked='checked'" : ""%>/><%=item.Name %></label>&nbsp;&nbsp;&nbsp;&nbsp;
                <%
            }
        %> 
        <span id="ObjectType_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 起 点： </td> 
    <td><input autocomplete="off" type="text" class="text2" id="Startstation" name="Startstation" onkeyup="showlocalTip(event,1);" value=''  maxLength=10/>&nbsp;&nbsp;&nbsp;&nbsp; 
    终点：<input autocomplete="off" type="text" class="text2" id="EndStation" name="EndStation" f="{0}" onkeyup="showlocalTip(event,2);" value=''  maxLength=10/> 
    <span id="Startstation_Tip"></span> 
    </td> 
</tr> 
<tr id="siteq"> 
    <td class="t"> 途经地点： </td> 
    <td> <input class="text1" type="text" id="site" name="site" f="{0}" value=''  Except='null'  maxLength=30/> 
        <span id="site_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 出发时间： </td> 
    <td>
        <select name="round" id="round"> 
            <option value='1' selected> 工作日</option>  
            <option value='3' > 每天</option>  
            <option value='4' > 周末</option>  
            <option value='6' > 其他</option>  
        </select> 
        <input maxlength="8" class="text2" type="text" id="zidingyi" name="zidingyi" value=''   /> 
        <input class="text5" readonly="readonly" type="text" id="StartTime" name="StartTime" value=''   onclick="Gca.IniCal(this); $.j.CalClickAfter(this);" /> 
        <select name="hour" id="hour">  
            <option value='6' selected> 6</option>  
            <option value='7' > 7</option>  
            <option value='8' > 8</option>  
            <option value='9' > 9</option>  
            <option value='10' > 10</option>  
            <option value='11' > 11</option>  
            <option value='12' > 12</option>  
            <option value='13' > 13</option>  
            <option value='14' > 14</option>  
            <option value='15' > 15</option>  
            <option value='16' > 16</option>  
            <option value='17' > 17</option>  
            <option value='18' > 18</option>  
            <option value='19' > 19</option>  
            <option value='20' > 20</option>  
            <option value='21' > 21</option>  
            <option value='22' > 22</option>  
            <option value='23' > 23</option>  
            <option value='0' > 0</option>  
            <option value='1' > 1</option>  
            <option value='2' > 2</option>  
            <option value='3' > 3</option>  
            <option value='4' > 4</option>  
            <option value='5' > 5</option>  
        </select> ： 
        <select name="minute" id="minute">  
            <option value='0' selected> 00</option>  
            <option value='10' > 10</option>  
            <option value='20' > 20</option>  
            <option value='30' > 30</option>  
            <option value='40' > 40</option>  
            <option value='50' > 50</option>  
        </select> 
        <span id="StartTime_Tip"></span> 
    </td> 
</tr> 
<tr id="chexingq"> 
    <td class="t"> 车型： </td> 
    <td> 
        <select name="chexing" id="chexing"> 
            <option value='1' selected> 小轿车</option>  
            <option value='2' > 商务车</option>  
            <option value='3' > 面包车</option>  
            <option value='4' > 越野车</option>  
            <option value='5' > 客车</option>  
            <option value='6' > 其他</option>  
        </select> 
        <span id="chexing_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var car = new Carpool();
        car.Type = parseInt(getRadioValue("type"), 10) + 1;
        car.ObjectType = parseInt(getRadioValue("ObjectType"), 10);
        if (car.ObjectType != 1) {
            car.Round = $("#round").find("option:selected").text();
        }
        car.Startstation = $("#Startstation").val();
        car.EndStation = $("#EndStation").val();
        if (car.Type == 1) {
            car.Way = $("#site").val();
        }
        
        var d = new Date();
        var s = $("#StartTime").val();
        d.setHours(0, 0, 0, 0);
        d.setYear(parseInt(s.split("-")[0], 10));
        d.setMonth(parseInt(s.split("-")[1] - 1, 10));
        d.setDate(parseInt(s.split("-")[2], 10));
        d.setHours(parseInt($("#hour").val(), 10), parseInt($("#minute").val(), 10), 0, 0);
        car.StartTime = d.toJson(true);
        car.Model = $("#chexing").find("option:selected").text();
        car.Title = $("#Title").val();
        FillData(car);
        car.Id = -1;
        car.DateCreated = new Date().toJson(true);
        car.DateModified = car.DateCreated;
        car.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    Gca = new CalendarClass();
    Gca.obj = "Gca"; 
</script>
<script type="text/javascript">
    function showTimeInput() {
        var lx = $(':radio[name="ObjectType"][value="0"]:checked');
        if (lx.length == 1) {
            var zq = $('#round').val(); if (zq == 6) { $('#zidingyi').show(); return; }
        }
        $('#zidingyi').hide();
    }
    $(document).ready(function () {
        showTimeInput(); $('#round').bind('change', showTimeInput);
        $("#Startstation").bind('blur', function () {
            $('#tooltip1div').hide();
        });
        $("#EndStation").bind('blur', function () {
            $('#tooltip2div').hide();
        });
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            post();
//            return false;
//        }
//        });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#StartTime").formValidator({ tipid: "StartTime_Tip", onfocus: "请选择出发日期", q2b: true }).inputValidator({ onerror: "请选择出发日期" }).regexValidator({ regexp: "^\\S+$", onerror: "请输入启程日期" }).functionValidator({ fun: function (val, elem) { $('#tooltip1div').hide(); $('#tooltip2div').hide(); return true; }, onerror: ''
        });
        $("#Startstation").formValidator({ tipid: "Startstation_Tip", onfocus: "2-10个字，不能填写电话和特殊符号。", q2b: true }).inputValidator({ onerror: "请输入出发地" }).regexValidator({ regexp: "^\\S+$#^(.){2,10}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "请输入出发地#出发地不足2个字#出发地里不允许填写电话" }).groupValidator({ groupName: "l1", nextgroupid: "EndStation" });
        $("#EndStation").formValidator({ tipid: "Startstation_Tip", onfocus: "2-10个字，不能填写电话和特殊符号。", q2b: true }).inputValidator({ onerror: "请输入目的地" }).regexValidator({ regexp: "^\\S+$#^(.){2,10}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "请输入目的地#目的地不足2个字#目的地里不允许输入电话" }).groupValidator({ groupName: "l1", nextgroupid: "Startstation" });
        $("#site").formValidator({ tipid: "site_Tip", onfocus: "不同地点请用“，”隔开", q2b: true, 'empty': true }).regexValidator({ regexp: "^(.){2,30}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "途径地点不足2个字#途径地点里不能填写电话" });

        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });

    });
    function change(o) {
        if (!o) { var list = document.getElementsByName("type"); for (var i = 0; i < list.length; i++) { if (list[i].checked) { o = list[i]; break; } } } switch (o.value) {
            case "0":
                {
                    $("#pdv").css("display", "");
                    $("#siteq").css("display", ""); $("#site").css("display", "");
                    $("#chexingq").css("display", ""); $("#chexing").css("display", "");
                    break;
                } case "1":
                {
                    $("#pdv").css("display", "none");
                    $("#siteq").css("display", "none");
                    $("#site").css("display", "none");
                    $("#chexingq").css("display", "none");
                    $("#chexing").css("display", "none");
                    break;
                }
        }
    }
    change();
    function change1(o) {
        setStartstationValue();
        $("#GGS_cal").hide();
        $("#GGS_cal_ibg").hide();
        if (!o) {
            var list = document.getElementsByName("ObjectType");
            for (var i = 0; i < list.length; i++) {
                if (list[i].checked) { o = list[i]; break; }
            }
        }
        switch (o.value) {
            case "1":
                {
                    $("#round").css("display", "");
                    $("#StartTime").css("display", "none");
                    $("#zidingyi").css("display", "");
                    $("#StartTime_Tip").css("display", "none");
                    break;
                } case "2":
                {
                    $("#round").css("display", "none");
                    $("#StartTime").css("display", "");
                    $("#zidingyi").css("display", "none");
                    $("#StartTime_Tip").css("display", "");
                    break;
                } case "3":
                {
                    $("#round").css("display", "none");
                    $("#StartTime").css("display", "");
                    $("#zidingyi").css("display", "none");
                    $("#StartTime_Tip").css("display", "");
                    break;
                }
        }
        showTimeInput();
    }
    change1();
    function setStartstationValue() {
        var infoid = '0'; if (infoid == '0') {
            var index = $.c.common.getRadioIndex('ObjectType');
            var local = ''; 
            var qy = '';
            if (qy.indexOf(local) == 0) {
                local = qy;
            }
            else
            { local += qy; }
            var objStartstation = $('#Startstation');
            if (index == 1) {
                if (objStartstation.val() == '') {
                    objStartstation.val(local);
                }
            }
            else {
                objStartstation.val('');
            }
        }
    } 
</script>
</asp:Content>
