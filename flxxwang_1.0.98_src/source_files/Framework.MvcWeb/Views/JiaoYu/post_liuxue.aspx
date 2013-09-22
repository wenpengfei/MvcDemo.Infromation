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
    <%--<option value='0' > 移民  
    <option value='2' > 其它留学  
    <option value='4' > 出国劳务  
    <option value='5' > 美国留学  
    <option value='6' > 加拿大留学  
    <option value='7' > 新加坡留学  
    <option value='8' > 日本留学  
    <option value='9' > 澳洲留学  
    <option value='10' > 新西兰留学  
    <option value='11' > 英国留学  
    <option value='12' > 韩国留学  
    <option value='13' > 德国留学  
    <option value='14' > 法国留学  
    <option value='15' > 西班牙留学  
    <option value='16' > 留学/移民签证--%>
    <%
        foreach (var item in EduAbroad.Singleton.ObjectTypeCollection)
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
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="1759"  />加拿大移民</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="1760"  />马来西亚留学</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="1761"  />俄罗斯留学</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="1762"  />荷兰留学</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="1763"  />新加坡签证</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="1764"  />越南签证</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="1765"  />韩国签证</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="1766"  />新西兰签证</li>
    <li><input name="Tag" id="Tag_8" type="checkbox" value="1767"  />技术移民</li>
    <li><input name="Tag" id="Tag_9" type="checkbox" value="1768"  />投资移民</li>
    <li><input name="Tag" id="Tag_10" type="checkbox" value="1769"  />美国移民</li>
    <li><input name="Tag" id="Tag_11" type="checkbox" value="1770"  />澳大利亚移民</li>
    <li><input name="Tag" id="Tag_12" type="checkbox" value="1771"  />新加坡移民</li>
    <li><input name="Tag" id="Tag_13" type="checkbox" value="1772"  />新西兰移民</li>
    <li><input name="Tag" id="Tag_14" type="checkbox" value="1773"  />澳洲移民</li>
    <li><input name="Tag" id="Tag_15" type="checkbox" value="1774"  />高考移民</li>--%>
    <%
        foreach (var item in EduAbroad.Singleton.TagCollection)
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
    <td> <input class="text2 gray" name="yingyeshijian" type="text" id="yingyeshijian" f="{0}" value='08:00-24:00'  Except='08:00-24:00'  maxLength=11 /> <span id="yingyeshijian_Tip"></span> </td> 
</tr>
</asp:Content>

<asp:Content ID="Content10" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var edu = new EduAbroad();
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
        $('#ObjectType').formValidator({ tipid: 'ObjectType_Tip', onfocus: '' }).functionValidator({ fun: function (val, elem) { return val != ''; }, onerror: '服务项目不能为空' });
        $('#yingyeshijian').formValidator({ tipid: 'yingyeshijian_Tip', onfocus: '请按格式输入，如：08:00-24:00', q2b: true, 'defaultvalue': '08:00-24:00' }).regexValidator({ regexp: "\\d{2,2}:\\d{2,2}-\\d{2,2}:\\d{2,2}", onerror: "请按格式输入，如：08:00-18:00" });
        $('#ObjectType').get(0).onchange = function () {
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
        };
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
    //    function showTag() {
    //        $.c.sale.gettag(14255, 2996, 'ObjectType', 0, "tagul", "tt");
    //        setTimeout($.j.initTagCheck, 1000);
    //    }     
</script>
</asp:Content>
