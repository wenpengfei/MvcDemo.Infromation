<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/EduMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IEducation>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="ObjectTypeLabel" runat="server">
科 目
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option value="">请选择</option>  
    <%--<option value='21' > 小学家教  
    <option value='22' > 初中家教  
    <option value='23' > 中考家教  
    <option value='24' > 高中家教  
    <option value='25' > 高考冲刺  
    <option value='26' > 素质/特长辅导  
    <option value='27' > 小升初家教  
    <option value='28' > 奥数--%> 
    <%
        foreach (var item in EduTutor.Singleton.ObjectTypeCollection)
        {
            %>
            <option value='<%=item.Id %>' ><%=item.Name %></option>
            <%
        }
     %> 
</select>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="InfoTag" runat="server">
<ul class="tag3" id="tagul"> 
    <%
        foreach (var item in EduTutor.Singleton.TagCollection)
        {
            %>
                <li><input name="Tag" id="Tag_<%=item.Id %>" type="checkbox" value="<%=item.Id %>" t="<%=item.ObjectTypeId %>"/><%=item.Name %></li>
            <%    
        }
    %>
</ul>
</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="Rows" runat="server">
<tr class="pb"> 
    <td class="t"> <b class="red">*</b> 培训方式： </td> 
    <td> 
        <ul class="tag3">  
            <li> <input name="fuwuleixing" type="checkbox" value='辅导班' id="fuwuleixing_1" f="{0}" name="fuwuleixing"  />辅导班</li> 
            <li> <input name="fuwuleixing" type="checkbox" value='一对一' id="fuwuleixing_2" f="{0}" name="fuwuleixing"  />一对一</li> 
            <li> <input name="fuwuleixing" type="checkbox" value='大学生家教' id="fuwuleixing_3" f="{0}" name="fuwuleixing"  />大学生家教</li> 
            <li> <input name="fuwuleixing" type="checkbox" value='外教' id="fuwuleixing_4" f="{0}" name="fuwuleixing"  />外教</li> 
            <li> <input name="fuwuleixing" type="checkbox" value='陪读' id="fuwuleixing_5" f="{0}" name="fuwuleixing"  />陪读</li> 
        </ul> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 营业时间： </td> 
    <td> 
        <input  Except='08:00-24:00'  maxLength=11 class="text2 gray" name="yingyeshijian" type="text" id="yingyeshijian" f="{0}" value='08:00-24:00' /> 
        <span id="yingyeshijian_Tip"></span> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content10" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var edu = new EduTutor();
        FillData(edu);
        edu.Id = -1;
        edu.DateCreated = new Date().toJson(true);
        edu.DateModified = edu.DateCreated;
        edu.Insert(onSuccess, onFailed);
    }
</script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#trgongjiao").css("display", "none");
            //            showTag();
            //            $('#ObjectType').get(0).onchange = showTag;
            $('#ObjectType').formValidator({ tipid: 'ObjectType_Tip', onfocus: '' }).functionValidator({ fun: function (val, elem) { return val != ''; }, onerror: '科目不能为空' });
            $('#yingyeshijian').formValidator({ tipid: 'yingyeshijian_Tip', onfocus: '请按格式输入，如：08:00-24:00', q2b: true, 'defaultvalue': '08:00-24:00' }).regexValidator({ regexp: "\\d{2,2}:\\d{2,2}-\\d{2,2}:\\d{2,2}", onerror: "请按格式输入，如：08:00-18:00" });
            $('#ObjectType').get(0).onchange = function () {
                //            $.c.sale.gettag(8442, 2996, 'ObjectType', 0, "tagul", "tt");
                $info.gettag("ObjectType", "tt", "tagul");
                setTimeout($.j.initTagCheck, 1000);
            };
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
        });
        //    function showTag() {
        //            $.c.sale.gettag(14286, 2996, 'ObjectType', 0, "tagul", "tt");
        //            setTimeout($.j.initTagCheck, 1000);
        //        }
</script>
</asp:Content>
