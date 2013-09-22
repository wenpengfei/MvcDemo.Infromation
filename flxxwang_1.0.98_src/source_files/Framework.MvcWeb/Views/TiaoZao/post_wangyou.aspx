<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleBaseMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Rows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 供 求： </td> 
    <td class="checkpb">  
        <label> <input class="base" onclick="change1(this)" type="radio" name="type" id="type_0" f="{0}" value='0' checked /><span>转让</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input class="base" onclick="change1(this)" type="radio" name="type" id="type_1" f="{0}" value='1'  /><span>求购</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <span id="type_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> 所在小区： </td> 
    <td> 
        <input class="text2" type="text" id="xiaoqu" name="quanjuxiaoqu" value=''  Except='null'  maxLength=30/>
        <span id="xiaoqu_Tip"></span> 
        <input type="hidden" name="xiaoqu" id="hidxiaoqu" value='' />
        <input type="hidden" name="gongjiaoxian" id="gongjiaoxian" value='' />
        <input type="hidden" name="gongjiaozhan" id="gongjiaozhan" value='' />
        <input type="hidden" name="ditiexian" id="ditiexian" value='' />
        <input type="hidden" name="ditiezhan" id="ditiezhan" value='' />
        <input type="hidden" name="daxue" id="daxue" value='' /> 
        <input type="hidden" name="dizhi" id="dizhi" value='' class="text1" /> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 类 别： </td> 
    <td> 
        <select name="ObjectType" id="ObjectType" f="{0}"> 
            <option selected="selected" value="">请选择类别</option>  
            <%--<option value='0' selected> 网游点卡</option>  
            <option value='1' > 装备</option>  
            <option value='2' > 金币</option>  
            <option value='3' > 帐号</option>  
            <option value='4' > 其他</option>--%>  
            <%
                foreach (var item in SaleGame.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>' ><%=item.Name %></option>
                    <%
                }
             %>
        </select> <span id="ObjectType_Tip"></span> 
    </td> 
</tr> 
<tr id="tt" style="display: none" class="pb"> 
    <td class="t"> 选择标签： </td> 
    <td> 
        <ul class="tag3" id="tagul"> 
            <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="470"  />魔兽世界</li>
            <li><input name="Tag" id="Tag_1" type="checkbox" value="473"  />天龙八部</li>
            <li><input name="Tag" id="Tag_2" type="checkbox" value="474"  />梦幻西游</li>
            <li><input name="Tag" id="Tag_3" type="checkbox" value="477"  />完美国际</li>
            <li><input name="Tag" id="Tag_4" type="checkbox" value="482"  />地下城与勇士</li>
            <li><input name="Tag" id="Tag_5" type="checkbox" value="484"  />诛仙</li>
            <li><input name="Tag" id="Tag_6" type="checkbox" value="489"  />挑战</li>--%>
            <%
                foreach (var item in SaleGame.Singleton.TagCollection)
                {
                    %>
                        <li><input name="Tag" id="Tag_<%=item.Id %>" type="checkbox" value="<%=item.Id %>" t="<%=item.ObjectTypeId %>"/><%=item.Name %></li>
                    <%    
                }
            %>
        </ul> <span id="infotag_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 价 格： </td> 
    <td> <input class="text3 gray" type="text" id="MinPrice" f="{0}元" name="MinPrice" value='面议'  Except='面议'  maxLength=5/> 元<span id="MinPrice_Tip"></span> </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="OtherRows" runat="server">
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var sale = new SaleGame();
        sale.Type = parseInt(getRadioValue("type"), 10) + 1;
        sale.Title = $("#Title").val();
        sale.District = $("#xiaoqu").val();
        sale.ObjectType = $("#ObjectType").val();
        if (sale.ObjectType == "") {
            alert("请选择类别");
            return;
        }
        sale.ObjectType = parseInt(sale.ObjectType, 10);

        var Tags = $(':checkbox[name="Tag"]:checked');
        if (Tags.length >= 1) {
            sale.Tag1 = parseInt($(Tags[0]).val(), 10);
        }
        if (Tags.length >= 2) {
            sale.Tag2 = parseInt($(Tags[1]).val(), 10);
        }

        sale.Price = $("#MinPrice").val();
        if (sale.Price == "" || sale.Price == "面议") {
            sale.Price = 0;
        }
        else {
            sale.Price = parseInt(sale.Price, 10);
        }
        BaseFillData(sale);
        sale.Id = -1;
        sale.DateCreated = new Date().toJson(true);
        sale.DateModified = sale.DateCreated;
        sale.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#xiaoqu').bind('keyup', function () { $('#dizhi').val(''); });
        $("#ObjectType").formValidator({ tipid: "ObjectType_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择类别" });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#MinPrice").formValidator({ tipid: "MinPrice_Tip", onfocus: "只能填写数字", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请正确填写价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请正确填写价格#价格为整数，且不能为0" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });
        $("#xiaoqu").formValidator({ tipid: "xiaoqu_Tip", onfocus: "1~30个字，不能填写电话和特殊符号", 'empty': true, q2b: true, 'empty': true }).inputValidator({ onerror: "请输入物品所在小区" }).regexValidator({ regexp: "^((?!电话|手机|联系方式|号码).)*$", onerror: "小区里不能填写电话" }).functionValidator({ fun: function (val, elem) { $('#tooltip1div').hide(); var r = $.formValidator.IsNum(val); return !r; }, onerror: "小区不能为纯数字" });

        $('#ObjectType').get(0).onchange = function () {
            //            $.c.sale.gettag(48,2996,'ObjectType',0,"tagul","tt");
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
        };
        //        $.c.sale.gettag(48,2996,'ObjectType',0,"tagul","tt"); 
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
</script>
</asp:Content>
