<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/EduMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IEducation>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="ObjectTypeLabel" runat="server">
服务项目
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option value="">请选择</option>  
    <%--<option value='0' > 学前教育  
    <option value='1' > 亲子教育  
    <option value='3' > 幼儿园  
    <option value='4' > 胎教  
    <option value='5' > 智力开发--%> 
    <%
        foreach (var item in EduBaby.Singleton.ObjectTypeCollection)
        {
            %>
            <option value='<%=item.Id %>' ><%=item.Name %></option>
            <%
        }
     %> 
</select>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="InfoTag" runat="server">
</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="Rows" runat="server">
<tr class="pb"> 
    <td class="t"> <b class="red">*</b> 服务类型： </td> 
    <td> 
        <ul class="tag3">  
            <li> <input id="fuwuleixing_1" type="checkbox" value='1' id="fuwuleixing_1" f="{0}" name="fuwuleixing"  />日托</li> 
            <li> <input id="fuwuleixing_2" type="checkbox" value='2' id="fuwuleixing_2" f="{0}" name="fuwuleixing"  />全托</li> 
        </ul> <span id="fuwuleixing_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 公/私立： </td> 
    <td class="checkpb">  
        <input id="fuwuduixiang_1" type="radio" name="fuwuduixiang" value='1'  />公立  
        <input id="fuwuduixiang_2" type="radio" name="fuwuduixiang" value='2'  />私立  
        <span id="fuwuduixiang_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> 入托条件： </td> 
    <td> <input class="text1" type="text" id="rutuotiaojian" name="rutuotiaojian" value=''   /> <span id="rutuotiaojian_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 营业时间： </td> 
    <td> <input class="text2 gray" name="yingyeshijian" type="text" id="yingyeshijian" f="{0}" value='08:00-24:00'  Except='08:00-24:00'  maxLength=11 /> <span id="yingyeshijian_Tip"></span> </td> 
</tr>
</asp:Content>

<asp:Content ID="Content10" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var edu = new EduBaby();
        edu.Condition = $("#rutuotiaojian").val();
        FillData(edu);
        var Tags = $(':checkbox[name="fuwuleixing"]:checked');
        if (Tags.length >= 1) {
            edu.Tag1 = parseInt($(Tags[0]).val(), 10);
        }
        if (Tags.length >= 2) {
            edu.Tag2 = parseInt($(Tags[1]).val(), 10);
        }
        edu.Kind =parseInt(getRadioValue("fuwuduixiang"),10);
        edu.Id = -1;
        edu.DateCreated = new Date().toJson(true);
        edu.DateModified = edu.DateCreated;
        edu.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $().ready(function () {
        //        showTag();
        //        $('#ObjectType').get(0).onchange = showTag;
        $('#ObjectType').formValidator({ tipid: 'ObjectType_Tip', onfocus: '' }).functionValidator({ fun: function (val, elem) { return val != ''; }, onerror: '服务项目不能为空' });
        $(':checkbox[name="fuwuleixing"]').formValidator({ tipid: 'fuwuleixing_Tip' }).functionValidator({ fun: function () { return $(':checkbox[name="fuwuleixing"]:checked').length > 0 }, onerror: '请选择服务类型' });
        $(':radio[name="fuwuduixiang"]').formValidator({ tipid: 'fuwuduixiang_Tip' }).functionValidator({ fun: function () { return $(':radio[name="fuwuduixiang"]:checked').length > 0 }, onerror: '请选择公/私立' });
        $('#yingyeshijian').formValidator({ tipid: 'yingyeshijian_Tip', onfocus: '请按格式输入，如：08:00-24:00', q2b: true, 'defaultvalue': '08:00-24:00' }).regexValidator({ regexp: "\\d{2,2}:\\d{2,2}-\\d{2,2}:\\d{2,2}", onerror: "请按格式输入，如：08:00-18:00" });
        $('#ObjectType').get(0).onchange = function () {
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
        };
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
    //    function showTag() {
    //        $.c.sale.gettag(14354, 2996, 'ObjectType', 0, "tagul", "tt");
    //        setTimeout($.j.initTagCheck, 1000);
    //    } 
</script>
</asp:Content>
