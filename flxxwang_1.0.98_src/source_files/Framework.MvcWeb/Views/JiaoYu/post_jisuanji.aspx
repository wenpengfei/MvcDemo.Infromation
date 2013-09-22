<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/EduMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IEducation>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="ObjectTypeLabel" runat="server">
课程类别
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option value="">请选择</option>  
    <%--<option value='0' > 软件工程师  
    <option value='1' > 网络工程师  
    <option value='3' > 动漫/游戏  
    <option value='5' > 网络营销  
    <option value='7' > 电脑维修培训  
    <option value='10' > 计算机等级考试  
    <option value='11' > 数据库培训  
    <option value='12' > IT认证  
    <option value='14' > 电子商务--%>
    <%
        foreach (var item in EduIT.Singleton.ObjectTypeCollection)
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
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="1815"  />动画培训</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="1816"  />网络安全</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="1817"  />软件测试</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="1818"  />微软认证</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="1819"  />思科认证</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="1820"  />国际IT认证</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="1821"  />华为认证</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="1822"  />游戏设计</li>
    <li><input name="Tag" id="Tag_8" type="checkbox" value="1823"  />动漫设计</li>
    <li><input name="Tag" id="Tag_9" type="checkbox" value="1824"  />影视动画</li>
    <li><input name="Tag" id="Tag_10" type="checkbox" value="1825"  />3DMAX</li>
    <li><input name="Tag" id="Tag_11" type="checkbox" value="1826"  />maya</li>
    <li><input name="Tag" id="Tag_12" type="checkbox" value="1827"  />SQL Sever</li>
    <li><input name="Tag" id="Tag_13" type="checkbox" value="1828"  />Oracle</li>
    <li><input name="Tag" id="Tag_14" type="checkbox" value="1829"  />mysql</li>
    <li><input name="Tag" id="Tag_15" type="checkbox" value="1830"  />access数据库</li>
    <li><input name="Tag" id="Tag_16" type="checkbox" value="1831"  />vb 数据库</li>
    <li><input name="Tag" id="Tag_17" type="checkbox" value="1832"  />网络技术</li>
    <li><input name="Tag" id="Tag_18" type="checkbox" value="1833"  />操作系统</li>
    <li><input name="Tag" id="Tag_19" type="checkbox" value="1834"  />软件开发</li>
    <li><input name="Tag" id="Tag_20" type="checkbox" value="1835"  />UML</li>
    <li><input name="Tag" id="Tag_21" type="checkbox" value="1836"  />c语言</li>
    <li><input name="Tag" id="Tag_22" type="checkbox" value="1837"  />Java</li>
    <li><input name="Tag" id="Tag_23" type="checkbox" value="1838"  />php培训</li>
    <li><input name="Tag" id="Tag_24" type="checkbox" value="1839"  />asp培训</li>
    <li><input name="Tag" id="Tag_25" type="checkbox" value="1840"  />计算机一级</li>
    <li><input name="Tag" id="Tag_26" type="checkbox" value="1841"  />计算机二级</li>
    <li><input name="Tag" id="Tag_27" type="checkbox" value="1842"  />计算机三级</li>
    <li><input name="Tag" id="Tag_28" type="checkbox" value="1843"  />计算机四级</li>
    <li><input name="Tag" id="Tag_29" type="checkbox" value="1844"  />全国计算机等级考试</li>
    <li><input name="Tag" id="Tag_30" type="checkbox" value="3508"  />SEM培训</li>
    <li><input name="Tag" id="Tag_31" type="checkbox" value="3520"  />SEO培训</li>--%>
    <%
        foreach (var item in EduIT.Singleton.TagCollection)
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
    <td class="t"> 培训模式： </td> 
    <td> 
        <ul class="tag3">  
            <li> <input type="checkbox" value='脱产班' id="fuwuleixing_1" f="{0}" name="fuwuleixing"  />脱产班</li> 
            <li> <input type="checkbox" value='业余班' id="fuwuleixing_2" f="{0}" name="fuwuleixing"  />业余班</li> 
            <li> <input type="checkbox" value='企业培训' id="fuwuleixing_3" f="{0}" name="fuwuleixing"  />企业培训</li> 
            <li> <input type="checkbox" value='远程培训' id="fuwuleixing_4" f="{0}" name="fuwuleixing"  />远程培训</li> 
        </ul> 
    </td> 
</tr>
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
        var edu = new EduIT();
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
        $('#ObjectType').formValidator({ tipid: 'ObjectType_Tip', onfocus: '' }).functionValidator({ fun: function (val, elem) { return val != ''; }, onerror: '课程类别不能为空' });
        $('#yingyeshijian').formValidator({ tipid: 'yingyeshijian_Tip', onfocus: '请按格式输入，如：08:00-24:00', q2b: true, 'defaultvalue': '08:00-24:00' }).regexValidator({ regexp: "\\d{2,2}:\\d{2,2}-\\d{2,2}:\\d{2,2}", onerror: "请按格式输入，如：08:00-18:00" });
        $('#ObjectType').get(0).onchange = function () {
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
        };
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
    //    function showTag() {
    //        $.c.sale.gettag(14379, 2996, 'ObjectType', 0, "tagul", "tt");
    //        setTimeout($.j.initTagCheck, 1000);
    //    } 
</script>
</asp:Content>
