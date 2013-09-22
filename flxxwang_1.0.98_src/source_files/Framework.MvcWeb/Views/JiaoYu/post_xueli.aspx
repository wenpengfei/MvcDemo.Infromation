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
    <%--<option value='0' > 学历认证  
    <option value='1' > 二学历  
    <option value='2' > 在职研究生  
    <option value='3' > 成人教育  
    <option value='4' > 自考  
    <option value='5' > 远程教育  
    <option value='6' > 网络教育  
    <option value='7' > 专升本  
    <option value='8' > 成人高考--%>
    <%
        foreach (var item in EduEducation.Singleton.ObjectTypeCollection)
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
    <td class="t"> 培训方式： </td> 
    <td> 
        <ul class="tag3">  
            <li> <input type="checkbox" value='辅导班' id="fuwuleixing_1" f="{0}" name="fuwuleixing"  />辅导班</li> 
            <li> <input type="checkbox" value='一对一' id="fuwuleixing_2" f="{0}" name="fuwuleixing"  />一对一</li> 
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
        var edu = new EduEducation();
        FillData(edu);
        edu.Id = -1;
        edu.DateCreated = new Date().toJson(true);
        edu.DateModified = edu.DateCreated;
        edu.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $().ready(function () {
        $('#ObjectType').formValidator({ tipid: 'ObjectType_Tip', onfocus: '请选择服务项目' }).functionValidator({ fun: function (val, elem) { return val != ''; }, onerror: '服务项目不能为空' });
        $('#yingyeshijian').formValidator({ tipid: 'yingyeshijian_Tip', onfocus: '请按格式输入，如：08:00-24:00', q2b: true, 'defaultvalue': '08:00-24:00' }).regexValidator({ regexp: "\\d{2,2}:\\d{2,2}-\\d{2,2}:\\d{2,2}", onerror: "请按格式输入，如：08:00-18:00" });
    });
</script>
</asp:Content>
