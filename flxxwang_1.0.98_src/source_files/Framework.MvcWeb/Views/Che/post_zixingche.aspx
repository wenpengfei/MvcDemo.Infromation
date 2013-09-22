<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/CarMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ICar>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 供 求： </td> 
    <td class="checkpb">  
        <label> <input id="type_0" f="{0}" type="radio" onclick="change2(this)" name="type" value='0' checked /><span>转让</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input id="type_1" f="{0}" type="radio" onclick="change2(this)" name="type" value='1'  /><span>求购</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <span id="type_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 类 别： </td> 
    <td> 
        <select name="ObjectType" id="ObjectType" f="{0}"> 
            <option selected="selected" value="">请选择</option>  
            <%--<option value='0' selected> 自行车</option>  
            <option value='1' > 电动车</option>  
            <option value='2' > 三轮车</option>  
            <option value='3' > 配件/装备</option>--%>
            <%
                foreach (var item in CarBicycle.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>' ><%=item.Name %></option>
                    <%
                }
             %>  
        </select> &nbsp;&nbsp; 
        <b class="red">*</b> 成色： 
        <select name="oldlevel" id="oldlevel" f="{0}">  
            <option value='100' > 全新</option>  
            <option value='99' > 99成新</option>  
            <option value='95' > 95成新</option>  
            <option value='90' selected> 9成新</option>  
            <option value='80' > 8成新</option>  
            <option value='70' > 7成新</option>  
            <option value='60' > 6成以下</option>  
        </select> &nbsp; &nbsp; 
        <b class="red">*</b> 价 格：<input type="text" class="text3 gray" f="{0}元" id="MinPrice" name="MinPrice" value=''  maxLength=4/>元 <span id="ObjectType_Tip"></span> 
    </td> 
</tr> 
<tr id="tt" style="display: none" class="pb"> 
    <td class="t"> <b class="red">*</b> 类 型： </td> 
    <td> 
        <ul class="tag3" id="tagul"> 
            
            <%
                foreach (var item in CarBicycle.Singleton.TagCollection)
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
    <td class="t"> 品牌： </td> 
    <td> 
        <select name="ddcpinpai" id="ddcpinpai" f="{0}" style="display: none" onchange="changeddc()"> 
            <option value="">请选择</option>
            <%
                foreach (var item in CarBicycle.Singleton.BrandDianDongCollection)
                {
                    %>
                    <option value='<%=item.Id %>'><%=item.Name %></option>
                    <%
                }
            %>  
             
        </select> 
        <select name="zxcpinpai" id="zxcpinpai" onchange="changezxc()" f="{0}"> 
            <option value="">请选择</option>  
            <%
                foreach (var item in CarBicycle.Singleton.BrandZiXingCheCollection)
                {
                    %>
                    <option value='<%=item.Id %>'><%=item.Name %></option>
                    <%
                }
            %> 
        </select> 
        <input type="text" class="text3" id="pinpai" f="{0}" name="pinpai" value=''  /> &nbsp; 
        <span id="chejia">车架尺寸：
        <select name="chicun" id="chicun" f="{0}">
            <option value="">请选择</option>  
            <option value='1' > 6寸</option>  
            <option value='2' > 8寸</option>  
            <option value='3' > 10寸</option>  
            <option value='4' > 12寸</option>  
            <option value='5' > 14寸</option>  
            <option value='6' > 15寸</option>  
            <option value='7' > 16寸</option>  
            <option value='8' > 17寸</option>  
            <option value='9' > 18寸</option>  
            <option value='10' > 19寸</option>  
            <option value='11' > 20寸</option>  
            <option value='12' > 21寸</option>  
            <option value='13' > 22寸</option>  
            <option value='14' > 23寸</option>  
            <option value='15' > 24寸</option>  
            <option value='16' > 26寸</option>  
            <option value='17' > 28寸</option>  
            <option value='18' > 其它尺寸</option>  
            <option value='19' > 不限</option>  
        </select>
        </span>
        <span id="pinpai_Tip"></span> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var car = new CarBicycle();
        car.Type = parseInt(getRadioValue("type"), 10) + 1;
        car.Title = $("#Title").val();
        car.ObjectType = parseInt($("#ObjectType").val(), 10) + 1;

        var Tags = $(':checkbox[name="Tag"]:checked');
        if (Tags.length >= 1) {
            car.Tag1 = parseInt($(Tags[0]).val(), 10);
        }
        if (car.ObjectType == 1) {//自行车
            if ($("#zxcpinpai").val() != "") {
                car.BrandId = parseInt($("#zxcpinpai").val(), 10);
            }
        }
        if (car.ObjectType == 2) {//电动车
            if ($("#ddcpinpai").val() != "") {
                car.BrandId = parseInt($("#ddcpinpai").val(), 10);
            }
        }
        if (car.ObjectType == 3 || car.ObjectType == 4) {
            car.BrandHandWrite = $("#pinpai").val();
        }
        if (car.ObjectType == 1 || car.ObjectType == 2) {
            car.Size = $("#chicun").find("option:selected").text();
        }
        car.Quality = parseInt($("#oldlevel").val(), 10);
        car.Price = $("#MinPrice").val();
        if (car.Price == "" || car.Price == "面议") {
            car.Price = 0;
        }
        else {
            car.Price = parseInt(car.Price, 10);
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
        clearPicValue();
        posting();
        post();
        return false; //阻止表单提交.
    }
    $(document).ready(function () {
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            clearPicValue();
//            post();
//            return false;
//            //            return true;
//        }
//        });
        $("#ObjectType").formValidator({ tipid: "ObjectType_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择类别" }).groupValidator({ groupName: "v2", nextgroupid: "MinPrice" });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#MinPrice").formValidator({ tipid: "ObjectType_Tip", onfocus: "只能填写数字", q2b: true }).inputValidator({ onerror: "请填写价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,3}$", onerror: "请填写价格#价格不能为0，最多4位整数" }).groupValidator({ groupName: "v2", nextgroupid: "ObjectType" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });
        $('#ObjectType').get(0).onchange = function () {
            //            $.c.sale.gettag(240, 2996, 'ObjectType', 0, "tagul", "tt", setTagCheck);
            //            setTimeout(function () { initTagCheck(1); }, 1000);
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout('$.j.initTagCheck(' + 1 + ')', 1000);
            $('#infotag_Tip').html('').removeClass();
        };
        //        $.c.sale.gettag(240, 2996, 'ObjectType', 0, "tagul", "tt", setTagCheck);
        //        setTimeout(function () {
        //            initTagCheck(1);
        //        }, 1000);
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout('$.j.initTagCheck(' + 1 + ')', 1000);
    });
    function initTagCheck(limitNum) {
        var _num = 2; if (limitNum) {
            if (!isNaN(limitNum)) {
                if (parseInt(limitNum) > 0) { _num = parseInt(limitNum); }
            }
        }
        $(':checkbox[name="Tag"]').formValidator({ tipid: 'infotag_Tip', onfocus: '' }).functionValidator({ fun: function (val, elem) {
            var _c = $(':checkbox[name="Tag"]:checked').length; if (_c == 0) return '请选择一个标签';
            if (_c == _num) return true; return '最多只能选择' + _num + '个标签';
        }
        });
        $(':checkbox[name="Tag"]').bind('click', function () {
            var c = $(':checkbox[name="Tag"]:checked').length; if (c == _num) {
                $.formValidator.setTipState("#infotag_Tip", "onCorrect", " ", "infotag_Tip");
            } else if (c == 0) {
                $.formValidator.setTipState("#infotag_Tip", "onError", "请选择一个标签", "infotag_Tip");
            } else {
                $.formValidator.setTipState("#infotag_Tip", "onError", "最多只能选择" + _num + "个标签", "infotag_Tip");
            }
        });
    }
    function setTagCheck() {
        change1();
    }
    function change2(o) {
        var i = $.c.common.getRadioIndex('type');
        if (i == 0) { $("#pdv").css("display", ""); }
        else {
            $("#pdv").css("display", "none");
        }
    }
    function change(o) {
        change1();
    }
    function change1(o) {
        if (!o) {
            o = document.getElementById("ObjectType");
        }
        var ddcpinpai = document.getElementById("ddcpinpai");
        var zxcpinpai = document.getElementById("zxcpinpai"); var pinpai = document.getElementById("pinpai");
        var chejia = document.getElementById("chejia");
        switch (o.value) {
            case "0":
                {
                    $.c.Disabletor.changeState("zxcpinpai", 0, 0); $.c.Disabletor.changeState("ddcpinpai", 1, 0); $.c.Disabletor.changeState("pinpai", 1, 0); $.c.Disabletor.changeState("chejia", 0, 0); break;
                }
            case "1":
            case "2":
                {
                    $.c.Disabletor.changeState("ddcpinpai", 0, 0); $.c.Disabletor.changeState("zxcpinpai", 1, 0); $.c.Disabletor.changeState("pinpai", 1, 0); $.c.Disabletor.changeState("chejia", 0, 0); break;
                }
            case "3":
            case "4":
                {
                    $.c.Disabletor.changeState("ddcpinpai", 1, 0); $.c.Disabletor.changeState("zxcpinpai", 1, 0); $.c.Disabletor.changeState("pinpai", 0, 0); $.c.Disabletor.changeState("chejia", 1, 0); break;
                } default:
                {
                    $.c.Disabletor.changeState("ddcpinpai", 1, 0); $.c.Disabletor.changeState("zxcpinpai", 1, 0); $.c.Disabletor.changeState("pinpai", 0, 0); $.c.Disabletor.changeState("chejia", 0, 0); break;
                }
        }
        changezxc();
        changeddc();
    }
    function changezxc() {
        var o = document.getElementById("zxcpinpai"); changedefault(o);
    }
    function changeddc() {
        var o = document.getElementById("ddcpinpai");
        changedefault(o);
    }
    function changedefault(o) {
        var pinpai = document.getElementById("pinpai"); if (o.style.display == "") {
            if (o.selectedIndex == o.options.length - 1) { $.c.Disabletor.changeState("pinpai", 0, 0); } else {
                $.c.Disabletor.changeState("pinpai", 1, 0);
            }
        }
    }
    change();
    function clearPicValue() {
        var obj = $(':radio[name="type"]:checked'); if (obj.val() == 1) {
            $('#Pic').val(''); $('#PicDesc').val('');
        }
    }
</script>
</asp:Content>
