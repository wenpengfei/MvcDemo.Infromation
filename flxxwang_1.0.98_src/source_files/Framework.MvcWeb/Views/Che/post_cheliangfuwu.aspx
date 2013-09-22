<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/CarMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ICar>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 类 别： </td> 
    <td> 
        <select name="ObjectType" id="ObjectType" f="{0}"> 
            <option selected="selected" value="">请选择</option>  
            <%--<option value='1' > 汽车检修</option>  
            <option value='2' > 汽车保养</option>  
            <option value='3' > 4S店/经销商</option>  
            <option value='4' > 保险理赔过户</option>  
            <option value='5' > 汽车服务</option>--%>
            <%
                foreach (var item in CarService.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>' ><%=item.Name %></option>
                    <%
                }
             %>  
        </select>
        <span id="ObjectType_Tip"></span> 
    </td> 
</tr> 
<tr id="tt" style="display:none"> 
    <td class="t"> 选择标签： </td> 
    <td> 
        <ul class="tag3" id="tagul"> 
            <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="1193"  />汽车维修</li>
            <li><input name="Tag" id="Tag_1" type="checkbox" value="1343"  />汽车检测</li>
            <li><input name="Tag" id="Tag_2" type="checkbox" value="1345"  />汽车装饰</li>
            <li><input name="Tag" id="Tag_3" type="checkbox" value="1346"  />洗车</li>
            <li><input name="Tag" id="Tag_4" type="checkbox" value="1347"  />汽车打蜡</li>
            <li><input name="Tag" id="Tag_5" type="checkbox" value="1348"  />汽车烤漆</li>
            <li><input name="Tag" id="Tag_6" type="checkbox" value="1349"  />货运车</li>
            <li><input name="Tag" id="Tag_7" type="checkbox" value="1350"  />吉普车</li>
            <li><input name="Tag" id="Tag_8" type="checkbox" value="1351"  />旅行车</li>
            <li><input name="Tag" id="Tag_9" type="checkbox" value="173"  />面包车</li>
            <li><input name="Tag" id="Tag_10" type="checkbox" value="1352"  />跑车</li>
            <li><input name="Tag" id="Tag_11" type="checkbox" value="171"  />商务车</li>
            <li><input name="Tag" id="Tag_12" type="checkbox" value="1353"  />小轿车</li>
            <li><input name="Tag" id="Tag_13" type="checkbox" value="1177"  />汽车保险</li>
            <li><input name="Tag" id="Tag_14" type="checkbox" value="1354"  />汽车理赔</li>
            <li><input name="Tag" id="Tag_15" type="checkbox" value="1355"  />代办过户</li>
            <li><input name="Tag" id="Tag_16" type="checkbox" value="1381"  />二手车行</li>
            <li><input name="Tag" id="Tag_17" type="checkbox" value="1201"  />汽车美容</li>--%>
            <%
                foreach (var item in CarService.Singleton.TagCollection)
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
    <td class="t"> <b class="red">*</b> 价 格： </td> 
    <td> <input type="text" class="text3 gray" id="MinPrice" name="MinPrice" f="{0}元" value='面议'  Except='面议'  maxLength=7/> 元 <span id="MinPrice_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var car = new CarService();
        car.Title = $("#Title").val();
        car.ObjectType = parseInt($("#ObjectType").val(), 10);
        var Tags = $(':checkbox[name="Tag"]:checked');
        if (Tags.length >= 1) {
            car.Tag1 = parseInt($(Tags[0]).val(), 10);
        }
        if (Tags.length >= 2) {
            car.Tag2 = parseInt($(Tags[1]).val(), 10);
        }
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
    $(document).ready(function () {
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            post();
//            return false;
//        }
//        });
        $("#ObjectType").formValidator({ tipid: "ObjectType_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择类别" });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#MinPrice").formValidator({ tipid: "MinPrice_Tip", onfocus: "只能填写数字", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请填写价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,6}$", onerror: "请填写价格#价格不能为0，最多7位整数" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });
        $('#ObjectType').get(0).onchange = function () {
            //            $.c.sale.gettag(8442, 2996, 'ObjectType', 0, "tagul", "tt");
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
            //            $('#infotag_Tip').html('').removeClass();
        };
        //        $.c.sale.gettag(8442, 2996, 'ObjectType', 0, "tagul", "tt");
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
</script>
</asp:Content>
