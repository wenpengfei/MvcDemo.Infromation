<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/CarMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ICar>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 供 求： </td> 
    <td class="checkpb">  
        <label> <input id="typ_0" f="{0}" onclick='change(this)' type="radio" name="type" value='0' checked /><span>转让</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input id="typ_1" f="{0}" onclick='change(this)' type="radio" name="type" value='1'  /><span>求购</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <span id="type_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25/> <span id="Title_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 成 色： </td> 
    <td class="checkpb"> 
        <select name="oldlevel" id="oldlevel" f="{0}">  
            <option value='100' > 全新</option>  
            <option value='99' > 99成新</option>  
            <option value='95' > 95成新</option>  
            <option value='90' selected> 9成新</option>  
            <option value='80' > 8成新</option>  
            <option value='70' > 7成新</option>  
            <option value='60' > 6成以下</option>  
        </select>&nbsp;&nbsp;&nbsp;&nbsp; 
        <b class="red">*</b> 价格：<input class="text3 gray" type="text" f="{0}元" id="MinPrice" name="MinPrice" value=''  maxLength=5/> 元  <span id="MinPrice_Tip"></span> 
    </td> 
</tr> 
<tr class="pb"> 
    <td class="t"> <b class="red">*</b> 款 式： </td> 
    <td> 
        <ul class="tag3" id="tagul"> 
            <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="291"  />弯梁车</li>
            <li><input name="Tag" id="Tag_1" type="checkbox" value="292"  />踏板车</li>
            <li><input name="Tag" id="Tag_2" type="checkbox" value="293"  />骑式车</li>
            <li><input name="Tag" id="Tag_3" type="checkbox" value="294"  />太子车</li>
            <li><input name="Tag" id="Tag_4" type="checkbox" value="295"  />迷你车</li>
            <li><input name="Tag" id="Tag_5" type="checkbox" value="296"  />越野摩托</li>
            <li><input name="Tag" id="Tag_6" type="checkbox" value="297"  />沙滩车</li>
            <li><input name="Tag" id="Tag_7" type="checkbox" value="298"  />大排量</li>
            <li><input name="Tag" id="Tag_8" type="checkbox" value="299"  />公路赛车</li>
            <li><input name="Tag" id="Tag_9" type="checkbox" value="1610"  />三轮摩托</li>--%>
            <%
                foreach (var item in CarMotor.Singleton.TagCollection)
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
    <td class="t"> <b class="red">*</b> 品 牌： </td> 
    <td> 
        <select name="pinpai" id="pinpai" f="{0}"> 
            <option value="">请选择</option>  
            <%
                foreach (var item in CarMotor.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>' ><%=item.Name %></option>
                    <%
                }
             %>  
        </select> &nbsp; 
        <b class="red">*</b> 排量：
        <select name="pailiang" id="pailiang" f="{0}"> 
            <option value="">请选择</option>  
            <option value='1' > 50cc以下</option>  
            <option value='2' > 50cc-100cc</option>  
            <option value='3' > 100cc-150cc</option>  
            <option value='4' > 150cc-250cc</option>  
            <option value='5' > 250cc-400cc</option>  
            <option value='6' > 400cc-600cc</option>  
            <option value='7' > 600cc以上</option>  
        </select> &nbsp; 
        <b class="red">*</b> 车身颜色：
        <select name="yanse" id="yanse" f="{0}">
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
            <option value='15' > 不限</option>  
        </select> 
        <span id="pinpai_Tip"></span> 
    </td> 
</tr> 
<tr id="three"> 
    <td class="t"> <b class="red">*</b> 购车时间： </td> 
    <td> 
        <select name="cheling" id="cheling" f="{0}年"> 
            <option value="">请选择</option>  
            <option value='2010' > 2010</option>  
            <option value='2009' > 2009</option>  
            <option value='2008' > 2008</option>  
            <option value='2007' > 2007</option>  
            <option value='2006' > 2006</option>  
            <option value='2005' > 2005</option>  
            <option value='2004' > 2004</option>  
            <option value='2003' > 2003</option>  
            <option value='2002' > 2002</option>  
            <option value='2001' > 2001</option>  
            <option value='2000' > 2000</option>  
            <option value='1999' > 1999</option>  
            <option value='1998' > 1998</option>  
            <option value='1997' > 1997</option>  
            <option value='1996' > 1996</option>  
            <option value='1995' > 1995</option>  
        </select> 年 
        <span id="cheling_Tip"></span> 
    </td> 
</tr> 
<tr id="trLicheng"> 
    <td class="t"> 行驶里程： </td> 
    <td> 
        <select name="licheng" id="licheng" f="{0}公里">
            <option value="">请选择</option>  
            <option value='1' > 1000</option>  
            <option value='3' > 3000</option>  
            <option value='5' > 5000</option>  
            <option value='10' > 1万</option>  
            <option value='20' > 2万</option>  
            <option value='30' > 3万</option>  
            <option value='40' > 4万</option>  
            <option value='50' > 5万</option>  
            <option value='60' > 6万</option>  
            <option value='70' > 7万</option>  
            <option value='80' > 8万</option>  
            <option value='90' > 9万</option>  
            <option value='100' > 10万</option>  
            <option value='1000' > 大于10万</option>  
        </select> 公里 
        <span id="licheng_Tip"></span> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var car = new CarMotor();
        car.Type = parseInt(getRadioValue("type"), 10) + 1;
        car.Title = $("#Title").val();
        car.Quality = parseInt($("#oldlevel").val(), 10) + 1;
        car.Price = $("#MinPrice").val();
        if (car.Price == "" || car.Price == "面议") {
            car.Price = 0;
        }
        else {
            car.Price = parseInt(car.Price, 10);
        }

        var Tags = $(':checkbox[name="Tag"]:checked');
        if (Tags.length >= 1) {
            car.Tag1 = parseInt($(Tags[0]).val(), 10);
        }
        car.ObjectType = parseInt($("#pinpai").val(), 10);
        car.Exhaust = $("#pailiang").find("option:selected").text();
        car.Color = $("#yanse").val();
        if (car.Type == 1) {
            car.BuyTime = parseInt($("#cheling").val(), 10);
            car.Rundistance = parseInt($("#licheng").val(), 10);
        }
        FillData(car);
        car.Id = -1;
        car.DateCreated = new Date().toJson(true);
        car.DateModified = car.DateCreated;
        car.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    function formValidatorSuccess() {
        disabledHiddenControl('cheling,licheng');
        posting();
        post();
        return false; //阻止表单提交.
    }
    $(document).ready(function () {
        $('#oldlevel').bind('change', oldlevel_change);
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            disabledHiddenControl('cheling,licheng');
//            post();
//            return false;
//            //return true;
//        }
//        });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#pinpai").formValidator({ tipid: "pinpai_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择品牌" }).groupValidator({ groupName: "l1", nextgroupid: "pailiang" });
        $("#pailiang").formValidator({ tipid: "pinpai_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择排量" }).groupValidator({ groupName: "l1", nextgroupid: "yanse" });
        $("#yanse").formValidator({ tipid: "pinpai_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择颜色" }).groupValidator({ groupName: "l1", nextgroupid: "pinpai" });
        $("#cheling").formValidator({ tipid: "cheling_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择购车时间" });
        $("#MinPrice").formValidator({ tipid: "MinPrice_Tip", onfocus: "只能填写数字", q2b: true }).inputValidator({ onerror: "请填写价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请填写价格#价格不能为0，最多5位整数" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });
        setTimeout(function () {
            initTagCheck(1);
        }, 1000);
    });
    function oldlevel_change() {
        var _type = getRadioValue('type');
        if (_type != 0) return;
        var _ddl = $('#oldlevel').get(0);
        var _val = _ddl.options[_ddl.selectedIndex].text; if (_val == '全新') {
            $('#three').hide();
            $('#cheling').hide(); $('#trLicheng').hide(); $('#licheng').hide();
        } else {
            $('#three').show();
            $('#cheling').show(); $('#trLicheng').show(); $('#licheng').show();
        }
    }
    function initTagCheck(limitNum) {
        var _num = 2; if (limitNum) {
            if (!isNaN(limitNum)) {
                if (parseInt(limitNum) > 0) {
                    _num = parseInt(limitNum);
                }
            }
        }
        $(':checkbox[name="Tag"]').formValidator({ tipid: 'infotag_Tip', onfocus: '' }).functionValidator({ fun: function (val, elem) {
            var _c = $(':checkbox[name="Tag"]:checked').length;
            if (_c == 0) return '请选择一个标签'; if (_c == _num)
                return true;
            return '最多只能选择' + _num + '个标签';
        }
        });
        $(':checkbox[name="Tag"]').bind('click', function () {
            var c = $(':checkbox[name="Tag"]:checked').length; if (c == _num) {
                $.formValidator.setTipState("#infotag_Tip", "onCorrect", " ", "infotag_Tip");
            } else if (c == 0) {
                $.formValidator.setTipState(null, "onError", "请选择一个标签", "infotag_Tip");
            } else { $.formValidator.setTipState("#infotag_Tip", "onError", "最多只能选择" + _num + "个标签", "infotag_Tip"); }
        });
    }
    function change(o) {
        if (!o) {
            var list = document.getElementsByName("type");
            for (var i = 0; i < list.length; i++) {
                if (list[i].checked) {
                    o = list[i]; break;
                }
            }
        }
        var o1;
        if (!o1) {
            var list1 = document.getElementsByName("type");
            for (var i = 0; i < list1.length; i++) {
                if (list1[i].checked) {
                    o1 = list1[i]; break;
                }
            }
        }
        switch (o.value) {
            case "0":
                {
                    if (o1.value != "1") {
                        $.c.Disabletor.disable([], "", 1, 0);
                    } $("#pdv").css("display", ""); break;
                } case "1":
                {
                    if (o1.value == "2") {
                        $.c.Disabletor.disable([], "three|paizhao|cheling|trLicheng|licheng", 1, 0);
                    }
                    else {
                        $.c.Disabletor.disable([], "three|paizhao|oldlevel1|cheling|trLicheng|licheng", 1, 0);
                    } $("#pdv").css("display", "none"); break;
                }
        } oldlevel_change();
    }
    change();
    function disabledHiddenControl(idString) {
        var arrID = idString.split(','); for (var i = 0; i < arrID.length; i++) {
            var _id = $.trim(arrID[i]); var _obj = $('#' + _id + ':hidden'); if (_obj.length > 0) {
                _obj.attr('disabled', 'disabled');
            }
        }
    }
</script>
</asp:Content>
