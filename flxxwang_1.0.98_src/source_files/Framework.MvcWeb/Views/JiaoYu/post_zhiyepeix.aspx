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
    <%--<option value='0' > 会计培训  
    <option value='4' > 报关员培训  
    <option value='5' > 教师培训  
    <option value='7' > 资格认证  
    <option value='9' > 营养师培训  
    <option value='10' > 心理咨询师培训  
    <option value='11' > 导游培训  
    <option value='12' > 汽车维修培训  
    <option value='13' > 策划师培训  
    <option value='14' > 其它培训  
    <option value='15' > 厨师培训  
    <option value='17' > 美容美发  
    <option value='18' > 技能培训  
    <option value='20' > 公务员培训  
    <option value='21' > 摄影培训  
    <option value='22' > 人力资源师--%>
    <%
        foreach (var item in EduProfession.Singleton.ObjectTypeCollection)
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
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="1867"  />注册会计师</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="1868"  />会计电算化</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="1869"  />初级会计师</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="1870"  />中级会计师</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="1871"  />助理会计师</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="1872"  />高级会计师</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="1873"  />电工培训</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="1874"  />调酒师培训</li>
    <li><input name="Tag" id="Tag_8" type="checkbox" value="1875"  />插花培训</li>
    <li><input name="Tag" id="Tag_9" type="checkbox" value="1876"  />美甲培训</li>
    <li><input name="Tag" id="Tag_10" type="checkbox" value="1877"  />美发培训</li>
    <li><input name="Tag" id="Tag_11" type="checkbox" value="1878"  />美容培训</li>--%>
    <%
        foreach (var item in EduProfession.Singleton.TagCollection)
        {
            %>
                <li><input name="Tag" id="Tag_<%=item.Id %>" type="checkbox" value="<%=item.Id %>" t="<%=item.ObjectTypeId %>"/><%=item.Name %></li>
            <%    
        }
    %>
</ul>
</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="Rows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 营业时间： </td> 
    <td> 
        <input class="text2 gray" name="yingyeshijian" type="text" id="yingyeshijian" f="{0}" value='08:00-24:00'  Except='08:00-24:00'  maxLength=11 /> 
        <span id="yingyeshijian_Tip"></span> 
    </td> 
</tr> 
</asp:Content>

<asp:Content ID="Content10" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var edu = new EduProfession();
        FillData(edu);
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
        $('#ObjectType').formValidator({ tipid: 'ObjectType_Tip', onfocus: '' }).functionValidator({ fun: function (val, elem) { return val != ''; }, onerror: '培训种类不能为空' });
        $('#yingyeshijian').formValidator({ tipid: 'yingyeshijian_Tip', onfocus: '请按格式输入，如：08:00-24:00', q2b: true, 'defaultvalue': '08:00-24:00' }).regexValidator({ regexp: "\\d{2,2}:\\d{2,2}-\\d{2,2}:\\d{2,2}", onerror: "请按格式输入，如：08:00-18:00" });
        $('#ObjectType').get(0).onchange = function () {
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
        };
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
    //    function showTag() {
    //        $.c.sale.gettag(14455, 2996, 'ObjectType', 0, "tagul", "tt");
    //        setTimeout($.j.initTagCheck, 1000);
    //    }     
</script>
</asp:Content>
