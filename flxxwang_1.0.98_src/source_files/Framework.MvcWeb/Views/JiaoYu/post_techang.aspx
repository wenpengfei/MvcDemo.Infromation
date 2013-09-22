<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/EduMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IEducation>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="ObjectTypeLabel" runat="server">
服务项目
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" relationid="tagul" ct="ObjectType" message="请选择服务项目" usermsg="ObjectType" tip="请选择服务项目" relationid="tagul" ischeck="" id="ObjectType" f="{0}"> 
    <option value="">请选择</option>  
    <%--<option value='0' > 美术培训  
    <option value='1' > dj培训  
    <option value='2' > 舞蹈培训  
    <option value='5' > 表演培训  
    <option value='6' > 声乐培训  
    <option value='7' > 书法培训  
    <option value='16' > 其他培训  
    <option value='19' > 球类培训  
    <option value='9' > 瑜伽培训  
    <option value='13' > 棋类培训  
    <option value='14' > 跆拳道培训  
    <option value='15' > 武术培训  
    <option value='20' > 乐器培训--%> 
    <%
        foreach (var item in EduSpecial.Singleton.ObjectTypeCollection)
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
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="1808"  />肚皮舞培训</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="1809"  />拉丁舞培训</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="1810"  />爵士舞培训</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="1811"  />钢管舞培训</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="1812"  />民族舞培训</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="1813"  />街舞培训</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="1814"  />少儿舞蹈培训</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="3521"  />古筝培训</li>
    <li><input name="Tag" id="Tag_8" type="checkbox" value="3522"  />钢琴培训</li>
    <li><input name="Tag" id="Tag_9" type="checkbox" value="3523"  />吉他培训</li>
    <li><input name="Tag" id="Tag_10" type="checkbox" value="3524"  />小提琴培训</li>
    <li><input name="Tag" id="Tag_11" type="checkbox" value="3525"  />二胡培训</li>
    <li><input name="Tag" id="Tag_12" type="checkbox" value="1703"  />萨克斯</li>
    <li><input name="Tag" id="Tag_13" type="checkbox" value="3526"  />电子琴培训</li>
    <li><input name="Tag" id="Tag_14" type="checkbox" value="3527"  />古琴培训</li>
    <li><input name="Tag" id="Tag_15" type="checkbox" value="3528"  />琵琶</li>
    <li><input name="Tag" id="Tag_16" type="checkbox" value="3529"  />笛子</li>
    <li><input name="Tag" id="Tag_17" type="checkbox" value="3530"  />其它乐器</li>--%>
    <%
        foreach (var item in EduSpecial.Singleton.TagCollection)
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
        var edu = new EduSpecial();
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
    //        $.c.sale.gettag(14326, 2996, 'ObjectType', 0, "tagul", "tt"); 
    //        setTimeout($.j.initTagCheck, 1000);
    //    }     
</script>
</asp:Content>
