<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/PetMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IPet>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 供 求： </td> <td class="checkpb">  
        <label> <input id="type_0" f="{0}" type="radio" name="type" onclick='uncheckedTag(); change(this)' value='1' checked /><span>转让</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input id="type_3" f="{0}" type="radio" name="type" onclick='uncheckedTag(); change(this)' value='2'  /><span>求购</span></label>&nbsp;&nbsp;&nbsp;&nbsp;<span id="type_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span></td> 
</tr> 
<tr id="tt"> 
    <td class="t"> <b class="red">*</b> 品种： </td> 
    <td> 
        <ul class="tag3" id="tagul"> 
            <%
                foreach (var item in PetDog.Singleton.TagCollection)
                {
                    %>
                        <li><input name="Tag" id="Tag_<%=item.Id %>" type="checkbox" value="<%=item.Id %>"/><%=item.Name %></li>
                    <%    
                }
            %>
        </ul>
        <span id="infotag_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 性 别： </td> 
    <td> 
        <select class="selectDog" name="xingbie" id="xingbie" f="{0}">  
            <option value='1' > 公</option>  
            <option value='2' > 母</option>  
        </select> &nbsp; &nbsp; 
        <span id="span_nianin">年龄： <input type="text" name="nianling" id="nianling" f="{0}" value='' class="text3"  maxLength=2/> 
        <select class="selectDog" name="danwei" id="danwei">  
            <option value='1' > 岁</option>  
            <option value='2' selected> 个月</option>  
            <option value='3' > 周</option>  
            <option value='4' > 天</option>  
        </select> 
        </span> 
        <span id="price">&nbsp;&nbsp;&nbsp;&nbsp;<b class="red">*</b> 价 格： <input class="text3 gray" type="text" id="MinPrice" f="{0}元/只" name="MinPrice" value='面议'  Except='面议'  maxLength=7/> 元/只</span> <span id="nianling_Tip"></span> 
    </td> 
</tr> 
<tr id="tryimiaoqingkuang"> 
    <td class="t"> 疫苗情况： </td> 
    <td> 
        <select class="selectDog" name="yimiaoqingkuang" id="yimiaoqingkuang" f="{0}"> 
            <option value="" selected="selected">请选择</option>  
            <option value='1' > 1针</option>  
            <option value='2' > 2针</option>  
            <option value='3' > 3针</option>  
            <option value='4' > 没打疫苗</option>  
        </select> &nbsp;&nbsp;&nbsp;&nbsp;
        血统证明： 
        <label> <input type="radio" name="xuetongzhengming" id="xuetongzhengming_1" f="{0}" value='1'  /><span>有</span></label>  
        <label> <input type="radio" name="xuetongzhengming" id="xuetongzhengming_2" f="{0}" value='2'  /><span>无</span></label>  
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 补充说明： </td> <td> <textarea name="Content" class="textarea2" id="Content"  maxLength=2000></textarea> <span id="Content_Tip"></span> </td> 
</tr> 
<tr id="pdv"> 
    <td class="t"></td> <td><div id="uploadPic" value=""></div> 
    <script type="text/javascript">
        $info.Uploader.init();
    </script>
    </td>
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var pet = new PetDog();
        if ($("#xingbie").val() == 1) {
            pet.Sex = true;
        }
        else {
            pet.Sex = false;
        }
        FillData(pet);
        if (pet.Type == 4) {
            pet.Type = 2;
        }
        if (pet.Type == 1) {
            pet.Age = parseInt($("#nianling").val(), 10);
            pet.AgeUnit = $("#danwei").find("option:selected").text();
            if ($("#yimiaoqingkuang").val() != "") {
                pet.Bacterin = $("#yimiaoqingkuang").find("option:selected").text();
            }
            pet.Descent = getRadioValue("xuetongzhengming");
            if (pet.Descent == 1) {
                pet.Descent = true;
            }
            else if (pet.Descent == 2) {
                pet.Descent = false;
            }
            else {
                pet.Descent = null;
            }
        }
        if (pet.Type == 2) {
            pet.Price = null;
        }
        pet.ObjectType = undefined;
        pet.Id = -1;
        pet.DateCreated = new Date().toJson(true);
        pet.DateModified = pet.DateCreated;
        pet.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    function formValidatorSuccess() {
        if (checkTagNum_inner(true)) {
            posting();
            post();
        }
        return false; //阻止表单提交.
    }
    $(document).ready(function () {
        checkTagNum();
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            //return checkTagNum_inner(true);
//            if (checkTagNum_inner(true)) {
//                post();
//                return false;
//            }
//        }
//        });
        $("#ObjectType").formValidator({ tipid: "ObjectType_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择类别" });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "标题不能为空" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#nianling").formValidator({ tipid: "nianling_Tip", onfocus: "1~4位数字，例如：2个月、3岁！", q2b: true }).inputValidator({ onerror: "请输入年龄" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,1}$", onerror: "请输入年龄#年龄为整数，且不能为0" }).groupValidator({ groupName: "l1", nextgroupid: "MinPrice" });
        $("#MinPrice").formValidator({ tipid: "nianling_Tip", onfocus: "最多可填写7位大于0的整数", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请正确填写价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,6}$", onerror: "请填写价格#价格为整数，且不能为0" }).groupValidator({ groupName: "l1", nextgroupid: "nianling" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });
    });
    var chknum = 1;
    function checkTag() {
        $.each($(":checkbox[name='Tag']"), function (j1, n1) {
            n1.onclick = function () {
                var l = $(":checkbox[name='Tag'][checked]").length;
                if (l > chknum) {
                    n1.checked = false; alert("只能选择" + chknum + "个品种");
                }
            }
        });
    }
    function uncheckedTag() {
        $.each($(":checkbox[name='Tag']"), function (j1, n1) {
            n1.checked = false;
        });
    }
    function change(o) {
        var nianling_message = document.getElementById("nianling_Tip");
        if (!o) {
            var list = document.getElementsByName("type");
            for (var i = 0; i < list.length; i++) {
                if (list[i].checked) {
                    o = list[i]; break;
                }
            }
        }
        $.c.Disabletor.setdisable([{ v: 0, a: "", t: 1, c: function () {
            chknum = 1;
            $("#pdv").css("display", "");
            $("#tupian").css("display", "");
        }
        },
        {
            v: 1, a: "trnianling|nianling|danwei|tryimiaoqingkuang|yimiaoqingkuang|trxuetongzhengming|span_nianin|nianling", t: 1, c: function () {
                chknum = 3; $("#pdv").css("display", "");
                $("#tupian").css("display", "none"); nianling_message.innerHTML = ""; nianling_message.className = "";
            }
        }, { v: 2, a: "MinPrice|price", t: 1, c: function () { chknum = 1; $("#pdv").css("display", ""); $("#tupian").css("display", ""); } }, { v: 3, a: "trnianling|nianling|danwei|tryimiaoqingkuang|yimiaoqingkuang|trxuetongzhengming|tupian|MinPrice|price|span_nianin|nianling", t: 1, c: function () { $("#pdv").css("display", ""); $("#tupian").css("display", ""); chknum = 3; nianling_message.innerHTML = ""; nianling_message.className = ""; } }], o.value, 0); if ($("#ObjectType").val() == "") { $("#tt").css("display", "none"); } checkTagNum();
    }
    change();
    function checkTagNum() {
        $(':checkbox[name="Tag"]').bind('click', function () { checkTagNum_inner(false) });
    }
    function checkTagNum_inner(fabu) {
        var typeid = getGqTypeIndex();
        var len = $(':checkbox[name="Tag"]:checked').length;
        if (len == 0) {
            $.formValidator.setTipState("#infotag_Tip", "onError", "品种是必选项", "infotag_Tip");
            if (fabu) return false; return;
        }
        if (typeid > -1) {
            if (typeid == 0) {
                if (len != 1) {
                    $.formValidator.setTipState("#infotag_Tip", "onError", "最多只能选择1项", "infotag_Tip");
                    if (fabu) return false; return;
                }
            } else if (typeid == 1) {
                if (len > 2) {
                    $.formValidator.setTipState("#infotag_Tip", "onError", "最多只能选择2项", "infotag_Tip");
                    if (fabu) return false; return;
                }
            }
        }
        $.formValidator.setTipState("#infotag_Tip", "onCorrect", " ", "infotag_Tip"); return true;
    }
    function getGqTypeIndex() {
        var obj = $(':radio[name="type"]');
        for (var i = 0; i < obj.length; i++) {
            if (obj.get(i).checked) return i;
        } return -1;
    }
</script>
</asp:Content>
