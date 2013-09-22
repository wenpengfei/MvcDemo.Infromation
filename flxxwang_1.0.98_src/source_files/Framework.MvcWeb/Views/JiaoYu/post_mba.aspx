<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/EduMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IEducation>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="ObjectTypeLabel" runat="server">
培训种类
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option value="">请选择</option>  
    <%--<option value='1' > MBA培训  
    <option value='2' > 企业管理  
    <option value='5' > 项目管理  
    <option value='7' > 财务管理  
    <option value='8' > 行政管理  
    <option value='9' > 酒店管理  
    <option value='10' > 工商管理  
    <option value='11' > 物流管理  
    <option value='12' > 物业管理  
    <option value='13' > 工程管理--%>
    <%
        foreach (var item in EduMBA.Singleton.ObjectTypeCollection)
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
    <td class="t"> 培训模式： </td> 
    <td> 
        <ul class="tag3">  
            <%--<li> <input type="checkbox" value='基础班' id="Checkbox1" f="{0}" name="fuwuleixing"  />基础班</li> 
            <li> <input type="checkbox" value='强化提高班' id="Checkbox2" f="{0}" name="fuwuleixing"  />强化提高班</li> 
            <li> <input type="checkbox" value='模考冲刺班' id="Checkbox3" f="{0}" name="fuwuleixing"  />模考冲刺班</li> 
            <li> <input type="checkbox" value='MBA面试' id="Checkbox4" f="{0}" name="fuwuleixing"  />MBA面试</li> 
            <li> <input type="checkbox" value='在职班' id="Checkbox5" f="{0}" name="fuwuleixing"  />在职班</li> 
            <li> <input type="checkbox" value='长期班' id="Checkbox6" f="{0}" name="fuwuleixing"  />长期班</li> 
            <li> <input type="checkbox" value='精品班' id="Checkbox7" f="{0}" name="fuwuleixing"  />精品班</li>--%>
            <%
                foreach (var item in EduMBA.Singleton.TagCollection)
                {
                    %>
                        <li><input name="Tag" id="Tag_<%=item.Id %>" type="checkbox" value="<%=item.Id %>" name="fuwuleixing"/><%=item.Name %></li>
                    <%    
                }
            %> 
        </ul> 
    </td> 
</tr>
<tr> 
    <td class="t"> <b class="red">*</b> 营业时间： </td> 
    <td> <input class="text2 gray" name="yingyeshijian" type="text" id="yingyeshijian" f="{0}" value='08:00-24:00'  Except='08:00-24:00'  maxLength=11 /> <span id="yingyeshijian_Tip"></span> </td> 
</tr> 
</asp:Content>

<asp:Content ID="Content10" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var edu = new EduMBA();
        FillData(edu);
        edu.Id = -1;
        edu.DateCreated = new Date().toJson(true);
        edu.DateModified = edu.DateCreated;
        edu.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#ObjectType').formValidator({ tipid: 'ObjectType_Tip', onfocus: '请选择培训种类' }).functionValidator({ fun: function (val, elem) { return val != ''; }, onerror: '培训种类不能为空' });
        $('#yingyeshijian').formValidator({ tipid: 'yingyeshijian_Tip', onfocus: '请按格式输入，如：08:00-24:00', q2b: true, 'defaultvalue': '08:00-24:00' }).regexValidator({ regexp: "\\d{2,2}:\\d{2,2}-\\d{2,2}:\\d{2,2}", onerror: "请按格式输入，如：08:00-18:00" });
    });
</script>
</asp:Content>
