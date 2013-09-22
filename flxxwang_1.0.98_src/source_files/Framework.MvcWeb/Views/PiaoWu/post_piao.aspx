<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/TicketMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ITicket>" %>
<%@ Import Namespace="Infomation.Core"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="Rows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 供 求： </td> 
    <td class="checkpb">  
        <label><input id="type_0" f="{0}" type="radio" name="type" onclick='change(this)' value='0' checked /><span>转让</span></label>&nbsp;&nbsp;&nbsp;&nbsp; 
        <label><input id="type_1" f="{0}" type="radio" name="type" onclick='change(this)' value='1'  /><span>求购</span></label>&nbsp;&nbsp;&nbsp;&nbsp; 
        <span id="type_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 演出类型： </td> 
    <td> 
        <select name="ObjectType" id="ObjectType" f="{0}"> 
            <option selected="selected" value="">请选择类别</option>  
            <%--<option value='4' > 演唱会</option>  
            <option value='2' > 音乐会</option>  
            <option value='1' > 话剧歌剧</option>  
            <option value='5' > 电影票</option>  
            <option value='9' > 少儿剧场</option>  
            <option value='7' > 魔术杂技</option>  
            <option value='8' > 舞蹈芭蕾</option>  
            <option value='10' > 综合演出</option>  
            <option value='6' > 戏曲</option>--%>
            <%
                foreach (var item in TicketPerform.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>'><%=item.Name %></option>
                    <%
                }
             %>  
        </select> <span id="ObjectType_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 日 期： </td> 
    <td> 
        <input class="text5" type="text" readonly="readonly" id="Time" name="Time" f="{0}" value=''  maxLength=1/>&nbsp;
        <span id="shijian">
            <select name="xiaoshi1" id="xiaoshi1" f="{0}时" onclick="changeShijian(this)"> 
                <option value='18' > 18</option>  
                <option value='19' > 19</option>  
                <option value='20' > 20</option>  
                <option value='21' > 21</option>  
                <option value='22' > 22</option>  
                <option value='23' > 23</option>  
                <option value='00' > 00</option>  
                <option value='1' > 1</option>  
                <option value='2' > 2</option>  
                <option value='3' > 3</option>  
                <option value='4' > 4</option>  
                <option value='5' > 5</option>  
                <option value='6' > 6</option>  
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
            </select> 时&nbsp; 
            <select name="fenzhong1" id="fenzhong1" onclick="changeShijian(this)" f="{0}分">  
                <option value='00' > 00</option>  
                <option value='05' > 05</option>  
                <option value='10' > 10</option>  
                <option value='15' > 15</option>  
                <option value='20' > 20</option>  
                <option value='25' > 25</option>  
                <option value='30' > 30</option>  
                <option value='35' > 35</option>  
                <option value='40' > 40</option>  
                <option value='45' > 45</option>  
                <option value='50' > 50</option>  
                <option value='55' > 55</option>  
            </select> 分 
        </span> 
        <script type="text/javascript" src="/content/fenlei/scripts/datepick/datepick.js"></script> 
        <link type="text/css" rel="stylesheet" href="/content/fenlei/scripts/datepick/redmond.datepick.css" /> 
        <script type="text/javascript">
            $(function () {
                var now = new Date();
                $('#Time').datepick({ monthsToShow: 1, monthsToStep: 1, showOnFocus: true, yearRange: "-0:+1", minDate: now, onSelect: function () { $(this).focus(); } });
                $('#Time').bind('mousedown', function () { $(this).focus(); });
            }); 
         </script> 
        <input type="hidden" id="xiaoshi" name="xiaoshi" /> 
        <input type="hidden" id="fenzhong" name="fenzhong" /> &nbsp;&nbsp;
        <span id="cg">
            <b class="red">*</b> 场馆： 
            <input type="text" autocomplete="off" class="text2" id="Facility" f="{0}" name="Facility" value=''  maxLength=30/> 
        </span>  
        <span id="cg1">场馆： <input type="text" autocomplete="off" class="text2" id="changguan" f="{0}" name="changguan" value=''  Except='null'  maxLength=10/> </span> 
        <span id="Time_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> 张 数： </td> 
    <td> 
        <select name="zhangshu" onchange="change1(this)" id="zhangshu" f="{0}">  
            <option value='1' selected> 1张</option>  
            <option value='2' > 2张</option>  
            <option value='3' > 3张</option>  
            <option value='4' > 4张</option>  
            <option value='5' > 多张</option>  
        </select> 
        <span id="lz" style="display: none"> <input type="checkbox" name="lianzuo" id="lianzuo" />是否连座</span>  &nbsp;&nbsp;
        <span id="zw"> 座位：<input f="{0}" type="text" class="text2" id="qu" name="qu" value=''  Except='null'  maxLength=10/> </span> 
        <span id="zhangshu_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 
        <span id="pj">原价</span>
        <span id="qgj" style="display: none">求购价</span>： 
    </td> 
    <td> 
        <span id="zrj"> 
            <input type="text" class="text3 gray" id="piaojia" f="票价{0}元/张" name="piaojia" value=''  maxLength=4/> 元/张 &nbsp;&nbsp;<b class="red">*</b> 
            现价：
        </span>
        <input type="text" class="text3 gray" id="MinPrice" f="转让价{0}元/张" name="MinPrice" value='面议'  Except='面议'  maxLength=4/>元/张
        <span id="MinPrice_Tip"></span> 
    </td> 
</tr> 
<tr id="tt" style="display: none;"> 
    <td class="t"> 选择标签： </td> 
    <td> 
        <ul class="tag3" id="tagul"> 
            <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="602"  />童话剧</li>--%>
            <%
                foreach (var item in TicketPerform.Singleton.TagCollection)
                {
                    %>
                        <li><input name="Tag" id="Tag_<%=item.Id %>" type="checkbox" value="<%=item.Id %>" t="<%=item.ObjectTypeId %>"/><%=item.Name %></li>
                    <%    
                }
            %>
        </ul>
        <span id="infotag_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 补充说明： </td> 
    <td> <textarea name="Content" class="textarea2" id="Content"  maxLength=2000></textarea> <span id="Content_Tip"></span> </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var ticket = new TicketPerform();
        ticket.Title = $("#Title").val();
        ticket.Type = parseInt(getRadioValue("type"), 10) + 1;
        ticket.ObjectType = parseInt($("#ObjectType").val(), 10);
        var d = new Date();
        d.setHours(0, 0, 0, 0);
        var s = $("#Time").val();
        d.setYear(parseInt(s.slice(0, 4), 10));
        d.setMonth(parseInt(s.slice(5, 7) - 1, 10));
        d.setDate(parseInt(s.slice(8, 10), 10));
        if (ticket.Type == 1) {
            d.setHours(parseInt($("#xiaoshi1").val(), 10), parseInt($("#fenzhong1").val(), 10), 0, 0);
        }
        ticket.Time = d.toJson(true);
        if (ticket.Type == 1) {
            ticket.Facility = $("#Facility").val();
        }
        else {
            ticket.Facility = $("#changguan").val();
        }
        ticket.Count = parseInt($("#zhangshu").val());
        if (ticket.Type == 1) {
            ticket.Seat = $("#qu").val();
        }
        ticket.Series = $("#lianzuo").attr("checked");

        ticket.Content = $("#Content").val();

        if (ticket.Type == 1) {
            ticket.PriceOriginal = $("#piaojia").val();
            if (ticket.PriceOriginal == "" || ticket.PriceOriginal == "面议") {
                ticket.PriceOriginal = 0;
            }
            else {
                ticket.PriceOriginal = parseInt(ticket.PriceOriginal, 10);
            }
        }

        ticket.Price = $("#MinPrice").val();
        if (ticket.Price == "" || ticket.Price == "面议") {
            ticket.Price = 0;
        }
        else {
            ticket.Price = parseInt(ticket.Price, 10);
        }

        FillData(ticket);
        ticket.Id = -1;
        ticket.DateCreated = new Date().toJson(true);
        ticket.DateModified = ticket.DateCreated;
        ticket.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            post();
//            return false;
//        }
//        });
        $("#ObjectType").formValidator({ tipid: "ObjectType_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择类别" }); $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#yanyuanyiren").formValidator({ tipid: "ObjectType_Tip", onfocus: "请填写演员或艺人的名字", q2b: true }).inputValidator({ onerror: "请填写演员或艺人名字" }).regexValidator({ regexp: "^\\S+$#^((\\d|[\\u4e00-\\u9fa5]|[a-zA-Z]|[,，。. ()（）\"\"、|])){2,20}$", onerror: "请填写演员或艺人名字#请输入2~20个字，不允许输入特殊符号" }).groupValidator({ groupName: "l1", nextgroupid: "ObjectType" });
        $("#Time").formValidator({ tipid: "Time_Tip", onfocus: "请选择演出日期", q2b: true }).inputValidator({ onerror: "请选择演出日期" }).regexValidator({ regexp: "^\\S+$", onerror: "请输入日期" }).groupValidator({ groupName: "l2", nextgroupid: "Facility" });
        $("#Facility").formValidator({ tipid: "Time_Tip", onfocus: "请填写演出场馆", q2b: true }).inputValidator({ onerror: "请输入场馆名" }).regexValidator({ regexp: "\\S+#^([\\s\\S]){2,30}$", onerror: "请输入场馆名#场馆名不足2个字" }).groupValidator({ groupName: "l2", nextgroupid: "Time" }).functionValidator({ fun: function (val, elem) { $('#tooltip1div').hide(); return true; }, onerror: "" });
        $("#qu").formValidator({ tipid: "zhangshu_Tip", onfocus: "只能填写1~10个字，例如：一层楼座3排12号", q2b: true, 'empty': true }).inputValidator({ onerror: "请输入座位区" }).regexValidator({ regexp: "^(\\S){1,10}$", onerror: "座位区域为1~10个字" }).groupValidator({ groupName: "l3", nextgroupid: "qu" });
        $("#MinPrice").formValidator({ tipid: "MinPrice_Tip", onfocus: "请填写您交易时的价格！", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请正确填写价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请正确填写价格#价格为整数，且不能为0" }).groupValidator({ groupName: "l4", nextgroupid: "piaojia" });
        $("#piaojia").formValidator({ tipid: "MinPrice_Tip", onfocus: "请填写门票原价！", q2b: true }).inputValidator({ onerror: "请输入票价" }).regexValidator({ regexp: "^\\S+$#^([1-9]{1}|[1-9]{1}\\d{1,4}|\\d{1}\\.{1}\\d{1,3}|\\d{2}\\.{1}\\d{1,2}|\\d{3}\\.{1}\\d{1})$", onerror: "请输入票价#请正确输入票价！" }).groupValidator({ groupName: "l4", nextgroupid: "MinPrice" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });
        //        $('#ObjectType').get(0).onchange = function () {
        //            $.c.sale.gettag(248, 2996, 'ObjectType', 0, "tagul", "tt");
        //            setTimeout($.j.initTagCheck, 1000);
        //        }; $.c.sale.gettag(248, 2996, 'ObjectType', 0, "tagul", "tt");
        //        setTimeout($.j.initTagCheck, 1000);
        $('#ObjectType').get(0).onchange = function () {
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
        };
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
    function change(o) {
        $("#xiaoshi").val($("#xiaoshi1").val());
        $("#fenzhong").val($("#fenzhong1").val());
        if (!o) {
            var list = document.getElementsByName("type");
            for (var i = 0; i < list.length; i++) { if (list[i].checked) { o = list[i]; break; } }
        } switch (o.value) {
            case "0":
                {
                    $("#qgj").css("display", "none"); $("#cg1").css("display", "none"); break;
                }
            case "1":
                {
                    $("#shijian").css("display", "none");
                    $("#cg").css("display", "none");
                    $("#zw").css("display", "none");
                    $("#zrj").css("display", "none");
                    $("#pj").css("display", "none");
                    $("#lz").css("display", "none"); $("#qu").css("display", "none");
                    $("#pai").css("display", "none");
                    $("#zuo").css("display", "none");
                    $("#piaojia").css("display", "none");
                    $("#Facility").css("display", "none");
                    $("#xiaoshi").css("display", "none");
                    $("#fenzhong").css("display", "none");
                    $("#xiaoshi").val("");
                    $("#fenzhong").val("");
                    break;
                }
        }
        changeObject();
    }
    function change1(o) {
        if (!o) { o = document.getElementById("zhangshu"); } var o1;
        if (o.value == "1") {
            $("#lianzuo").attr("checked", false); $("#lz").css("display", "none");
        } else {
            $("#lz").css("display", "");
        }
    }
    function changeShijian(o) {
        var t; if (o.id == "xiaoshi1") {
            t = $("#xiaoshi");
        }
        if (o.id == "fenzhong1") {
            t = $("#fenzhong"); ;
        }
        t.val(o.value);
    }
    function changeObject(val) {
        if (!val) {
            val = $("#ObjectType").val();
        }
        if (val == "请选择") {
            return;
        }
        var types = document.getElementsByName("type");
        var changguan = "contentSpan|Facility|cg|pj|xiaoshi|fenzhong|shijian|zrj|piaojia|zw|qu|pai|zuo";
        if (types[0].checked) {
            changguan = "contentSpan|changguan|cg1|qgj";
        } else {
            $("#xiaoshi").val(""); $("#fenzhong").val("");
        }
        switch (val) {
            case "5": $.c.Disabletor.disable([], "yanyuanyiren|shijian|yiren|zw|qu|pai|zuo|zrj|piaojia|" + changguan, 1, 0);
                $("#xiaoshi").val("");
                $("#fenzhong").val("");
                break;
            default:
                $.c.Disabletor.disable([], changguan, 1, 0);
                break;
        }
        change1();
        if (!types[0].checked) {
            $("#xiaoshi").val(""); $("#fenzhong").val("");
        }
    }
    change();
</script>
</asp:Content>
