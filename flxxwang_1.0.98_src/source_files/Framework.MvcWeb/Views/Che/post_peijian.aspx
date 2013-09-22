<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/CarMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ICar>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="FormRows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 供 求： </td> 
    <td class="checkpb">  
        <label> <input id="type_0" f="{0}" type="radio" onclick="change1(this)" name="type" value='0' checked /><span>转让</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input id="type_1" f="{0}" type="radio" onclick="change1(this)" name="type" value='1'  /><span>求购</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <span id="type_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 类 别： </td> 
    <td> 
        <select name="ObjectType" id="ObjectType" f="{0}"> 
            <option selected="selected" value="">请选择</option>  
            <%--<option value='1' > 发动机配件</option>  
            <option value='2' > 汽车底盘</option>  
            <option value='3' > 车身附件</option>  
            <option value='4' > 电子电器</option>  
            <option value='5' > 视听设备</option>  
            <option value='6' > 养护用品</option>  
            <option value='7' > 汽车用品</option>--%>
            <%
                foreach (var item in CarFitting.Singleton.ObjectTypeCollection)
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
        </select> &nbsp;&nbsp;
        <b class="red">*</b> 价 格：<input type="text" class="text3 gray" id="MinPrice" f="{0}元" name="MinPrice" value='面议'  Except='面议'  maxLength=5/> 元  <span id="ObjectType_Tip"></span> 
    </td> 
</tr> 
<tr id="tt"> 
    <td class="t"> 选择标签： </td> 
    <td> 
        <ul class="tag3" id="tagul"> 
            <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="567"  />外部用品</li>
            <li><input name="Tag" id="Tag_1" type="checkbox" value="568"  />发动机</li>
            <li><input name="Tag" id="Tag_2" type="checkbox" value="569"  />制动器</li>
            <li><input name="Tag" id="Tag_3" type="checkbox" value="570"  />汽车饰品</li>
            <li><input name="Tag" id="Tag_4" type="checkbox" value="571"  />车灯</li>
            <li><input name="Tag" id="Tag_5" type="checkbox" value="572"  />安全用品</li>
            <li><input name="Tag" id="Tag_6" type="checkbox" value="573"  />行走系统</li>
            <li><input name="Tag" id="Tag_7" type="checkbox" value="574"  />传动轴</li>
            <li><input name="Tag" id="Tag_8" type="checkbox" value="575"  />维护用品</li>
            <li><input name="Tag" id="Tag_9" type="checkbox" value="1339"  />脚垫</li>
            <li><input name="Tag" id="Tag_10" type="checkbox" value="1340"  />轮胎</li>
            <li><input name="Tag" id="Tag_11" type="checkbox" value="1342"  />汽车贴膜</li>
            <li><input name="Tag" id="Tag_12" type="checkbox" value="3426"  />发电机</li>
            <li><input name="Tag" id="Tag_13" type="checkbox" value="3427"  />起动机</li>
            <li><input name="Tag" id="Tag_14" type="checkbox" value="3428"  />节油器</li>
            <li><input name="Tag" id="Tag_15" type="checkbox" value="3429"  />散热器</li>
            <li><input name="Tag" id="Tag_16" type="checkbox" value="3430"  />轮毂</li>
            <li><input name="Tag" id="Tag_17" type="checkbox" value="3431"  />轴承</li>
            <li><input name="Tag" id="Tag_18" type="checkbox" value="3436"  />齿轮</li>
            <li><input name="Tag" id="Tag_19" type="checkbox" value="3437"  />GPS导航</li>
            <li><input name="Tag" id="Tag_20" type="checkbox" value="3438"  />蓄电池</li>
            <li><input name="Tag" id="Tag_21" type="checkbox" value="3439"  />倒车雷达</li>
            <li><input name="Tag" id="Tag_22" type="checkbox" value="3440"  />电磁阀</li>
            <li><input name="Tag" id="Tag_23" type="checkbox" value="3441"  />逆变器</li>
            <li><input name="Tag" id="Tag_24" type="checkbox" value="3442"  />逆变电源</li>
            <li><input name="Tag" id="Tag_25" type="checkbox" value="3443"  />后视镜</li>
            <li><input name="Tag" id="Tag_26" type="checkbox" value="3444"  />喇叭</li>
            <li><input name="Tag" id="Tag_27" type="checkbox" value="3445"  />雨刷</li>
            <li><input name="Tag" id="Tag_28" type="checkbox" value="3446"  />氙气灯</li>
            <li><input name="Tag" id="Tag_29" type="checkbox" value="3447"  />座椅</li>
            <li><input name="Tag" id="Tag_30" type="checkbox" value="3448"  />天线</li>
            <li><input name="Tag" id="Tag_31" type="checkbox" value="3449"  />汽车空调</li>
            <li><input name="Tag" id="Tag_32" type="checkbox" value="3450"  />车载MP3</li>
            <li><input name="Tag" id="Tag_33" type="checkbox" value="3451"  />车载DVD</li>
            <li><input name="Tag" id="Tag_34" type="checkbox" value="3452"  />汽车音响</li>
            <li><input name="Tag" id="Tag_35" type="checkbox" value="3453"  />机油</li>
            <li><input name="Tag" id="Tag_36" type="checkbox" value="3454"  />润滑油</li>
            <li><input name="Tag" id="Tag_37" type="checkbox" value="3455"  />防冻液</li>
            <li><input name="Tag" id="Tag_38" type="checkbox" value="3456"  />玻璃水</li>
            <li><input name="Tag" id="Tag_39" type="checkbox" value="3457"  />汽车坐垫</li>
            <li><input name="Tag" id="Tag_40" type="checkbox" value="3458"  />车位锁</li>
            <li><input name="Tag" id="Tag_41" type="checkbox" value="3459"  />防盗器</li>
            <li><input name="Tag" id="Tag_42" type="checkbox" value="3460"  />刹车片</li>--%>
            <%
                foreach (var item in CarFitting.Singleton.TagCollection)
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
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var car = new CarFitting();
        car.Type = parseInt(getRadioValue("type"), 10) + 1;
        car.Title = $("#Title").val();
        car.ObjectType = parseInt($("#ObjectType").val(), 10);
        var Tags = $(':checkbox[name="Tag"]:checked');
        if (Tags.length >= 1) {
            car.Tag1 = parseInt($(Tags[0]).val(), 10);
        }
        if (Tags.length >= 2) {
            car.Tag2 = parseInt($(Tags[1]).val(), 10);
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
    $(document).ready(function () {
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            post();
//            return false;
//        }
//        });
        $("#ObjectType").formValidator({ tipid: "ObjectType_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择类别" });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#MinPrice").formValidator({ tipid: "ObjectType_Tip", onfocus: "只能填写数字", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请填写价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请填写价格#价格为整数，且不能为0" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });
        $('#ObjectType').get(0).onchange = function () {
            //            $.c.sale.gettag(239, 2996, 'ObjectType', 0, "tagul", "tt");
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
            $('#infotag_Tip').html('').removeClass();
        };
        //        $.c.sale.gettag(239, 2996, 'ObjectType', 0, "tagul", "tt");
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
    function change1(o) {
        if (!o) {
            var list = document.getElementsByName("type");
            for (var i = 0; i < list.length; i++) {
                if (list[i].checked) {
                    o = list[i]; break;
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
        }
    }
    function change(o) {
        if (!o) {
            var list = document.getElementsByName("chengse");
            for (var i = 0; i < list.length; i++) {
                if (list[i].checked) {
                    o = list[i]; break;
                }
            }
        }
        switch (o.value) {
            case "1":
                {
                    $("#oldlevel1").css("display", "none"); break;
                }
            case "2":
                {
                    $("#oldlevel1").css("display", ""); break;
                }
        }
    }
    change1();
</script>
</asp:Content>
