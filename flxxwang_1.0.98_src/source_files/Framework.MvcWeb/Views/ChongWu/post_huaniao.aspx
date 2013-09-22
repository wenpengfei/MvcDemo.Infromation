<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/PetMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IPet>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 供 求： </td> 
    <td class="checkpb">  
        <label> <input id="type_0" f="{0}" type="radio" name="type" onclick='change(this)' value='1' checked /><span>转让</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input id="type_1" f="{0}" type="radio" name="type" onclick='change(this)' value='2'  /><span>求购</span></label>&nbsp;&nbsp;&nbsp;&nbsp;
        <span id="type_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 类 型： </td> 
    <td> 
        <select name="ObjectType" id="ObjectType" f="{0}"> 
            <option selected="selected" value="">请选择类型</option>  
            <%--<option value='1' > 观赏鱼</option>  
            <option value='2' > 玩赏鸟</option>  
            <option value='3' > 奇石盆景</option>  
            <option value='4' > 其他小宠</option>--%>
            <%
                foreach (var item in PetBird.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>'><%=item.Name %></option>
                    <%
                }
             %>  
        </select>&nbsp;&nbsp;
        <b class="red">*</b> 价 格：<input class="text3 gray" type="text" id="MinPrice" f="{0}元" name="MinPrice" value='面议'  Except='面议'  maxLength=7/> 元 <span id="ObjectType_Tip"></span> 
    </td> 
</tr> 
<tr id="tt" style="display:none"> 
    <td class="t"> 选择标签： </td> 
    <td> 
        <ul class="tag3" id="tagul"> 
            <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="102"  />盆景</li>
            <li><input name="Tag" id="Tag_1" type="checkbox" value="1589"  />锦鲤</li>
            <li><input name="Tag" id="Tag_2" type="checkbox" value="1590"  />七彩神仙</li>
            <li><input name="Tag" id="Tag_3" type="checkbox" value="1591"  />接吻鱼</li>
            <li><input name="Tag" id="Tag_4" type="checkbox" value="1592"  />罗汉鱼</li>
            <li><input name="Tag" id="Tag_5" type="checkbox" value="1593"  />孔雀鱼</li>
            <li><input name="Tag" id="Tag_6" type="checkbox" value="1594"  />龙鱼</li>
            <li><input name="Tag" id="Tag_7" type="checkbox" value="1595"  />红鲫鱼</li>
            <li><input name="Tag" id="Tag_8" type="checkbox" value="1596"  />中国金鱼</li>
            <li><input name="Tag" id="Tag_9" type="checkbox" value="1597"  />鹦鹉</li>
            <li><input name="Tag" id="Tag_10" type="checkbox" value="1598"  />八哥</li>
            <li><input name="Tag" id="Tag_11" type="checkbox" value="1599"  />文鸟</li>
            <li><input name="Tag" id="Tag_12" type="checkbox" value="1600"  />白玉鸟</li>
            <li><input name="Tag" id="Tag_13" type="checkbox" value="1601"  />珍珠鸟</li>
            <li><input name="Tag" id="Tag_14" type="checkbox" value="1602"  />奇石</li>
            <li><input name="Tag" id="Tag_15" type="checkbox" value="1603"  />根雕</li>
            <li><input name="Tag" id="Tag_16" type="checkbox" value="1604"  />兔子</li>
            <li><input name="Tag" id="Tag_17" type="checkbox" value="1605"  />龟</li>
            <li><input name="Tag" id="Tag_18" type="checkbox" value="1606"  />仓鼠</li>
            <li><input name="Tag" id="Tag_19" type="checkbox" value="1607"  />荷兰猪</li>
            <li><input name="Tag" id="Tag_20" type="checkbox" value="3394"  />龙猫</li>
            <li><input name="Tag" id="Tag_21" type="checkbox" value="3461"  />花卉</li>--%>
            <%
                foreach (var item in PetBird.Singleton.TagCollection)
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
<tr id="pdv">
    <td class="t"> </td> 
    <td>
        <div id="uploadPic" value=""></div> 
        <script type="text/javascript">
            $info.Uploader.init();
        </script>
    </td>
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var pet = new PetBird();
        FillData(pet);
        pet.Id = -1;
        pet.DateCreated = new Date().toJson(true);
        pet.DateModified = pet.DateCreated;
        pet.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            post();
//            return false;
//        }
//        });
        $("#ObjectType").formValidator({ tipid: "ObjectType_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择类型" });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#MinPrice").formValidator({ tipid: "ObjectType_Tip", onfocus: "最多可填写7位大于0的整数", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请正确填写价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,6}$", onerror: "请输入价格#价格为整数，且不能为0" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });
        $('#ObjectType').get(0).onchange = function () {
            //            $.c.sale.gettag(19, 2996, 'ObjectType', 0, "tagul", "tt");
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
        };
        //        $.c.sale.gettag(19, 2996, 'ObjectType', 0, "tagul", "tt");
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
    function change(o) {
        if (!o) {
            var list = document.getElementsByName("type");
            for (var i = 0; i < list.length; i++) {
                if (list[i].checked) {
                    o = list[i];
                    break;
                }
            }
        }
        switch (o.value) {
            case "0":
                {
                    $("#pdv").css("display", ""); break;
                }
            case "1":
                {
                    $("#pdv").css("display", "none"); break;
                }
            case "2":
                {
                    $("#pdv").css("display", ""); break;
                }
            case "3":
                {
                    $("#pdv").css("display", "none"); break;
                }
        }
    }
    change();
</script>
</asp:Content>
