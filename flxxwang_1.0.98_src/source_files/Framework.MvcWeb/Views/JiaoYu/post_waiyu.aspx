<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/EduMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IEducation>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="ObjectTypeLabel" runat="server">
语 种
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option value="">请选择</option>  
    <%--<option value='0' > 英语培训  
    <option value='16' > 英语口语  
    <option value='17' > 英语听力  
    <option value='30' > 日语  
    <option value='31' > 韩语  
    <option value='32' > 法语  
    <option value='33' > 德语  
    <option value='34' > 俄语  
    <option value='35' > 西班牙语  
    <option value='36' > 意大利语--%>
    <%
        foreach (var item in EduLanguage.Singleton.ObjectTypeCollection)
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
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="1845"  />SAT培训</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="1847"  />GMAT培训</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="1857"  />雅思口语</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="1858"  />商务英语口语</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="1859"  />少儿英语口语</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="1860"  />疯狂英语口语</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="1861"  />托福口语</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="1862"  />外贸英语口语</li>
    <li><input name="Tag" id="Tag_8" type="checkbox" value="1032"  />英语翻译</li>
    <li><input name="Tag" id="Tag_9" type="checkbox" value="3531"  />新概念英语</li>
    <li><input name="Tag" id="Tag_10" type="checkbox" value="3532"  />雅思培训</li>
    <li><input name="Tag" id="Tag_11" type="checkbox" value="3533"  />托福培训</li>
    <li><input name="Tag" id="Tag_12" type="checkbox" value="3534"  />少儿英语</li>
    <li><input name="Tag" id="Tag_13" type="checkbox" value="3535"  />商务英语</li>
    <li><input name="Tag" id="Tag_14" type="checkbox" value="3536"  />英语自考</li>
    <li><input name="Tag" id="Tag_15" type="checkbox" value="3537"  />四六级</li>
    <li><input name="Tag" id="Tag_16" type="checkbox" value="3538"  />GRE／GMAT</li>
    <li><input name="Tag" id="Tag_17" type="checkbox" value="3539"  />SAT／LSAT</li>
    <li><input name="Tag" id="Tag_18" type="checkbox" value="3540"  />BETS</li>
    <li><input name="Tag" id="Tag_19" type="checkbox" value="3541"  />考研英语</li>--%>
    <%
        foreach (var item in EduLanguage.Singleton.TagCollection)
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
        var edu = new EduLanguage();
        FillData(edu);
        edu.Id = -1;
        edu.DateCreated = new Date().toJson(true);
        edu.DateModified = edu.DateCreated;
        edu.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $().ready(function () {
        $("#ContentLabel").text("学校介绍");
        //        showTag();
        //        $('#ObjectType').get(0).onchange = showTag;
        $('#ObjectType').formValidator({ tipid: 'ObjectType_Tip', onfocus: '' }).functionValidator({ fun: function (val, elem) { return val != ''; }, onerror: '语种不能为空' });
        $('#yingyeshijian').formValidator({ tipid: 'yingyeshijian_Tip', onfocus: '请按格式输入，如：08:00-24:00', q2b: true, 'defaultvalue': '08:00-24:00' }).regexValidator({ regexp: "\\d{2,2}:\\d{2,2}-\\d{2,2}:\\d{2,2}", onerror: "请按格式输入，如：08:00-24:00" });
        $('#ObjectType').get(0).onchange = function () {
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
        };
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
    //    function showTag() {
    //        $.c.sale.gettag(14419, 2996, 'ObjectType', 0, "tagul", "tt");
    //        setTimeout($.j.initTagCheck, 1000);
    //    } 
</script>
</asp:Content>
