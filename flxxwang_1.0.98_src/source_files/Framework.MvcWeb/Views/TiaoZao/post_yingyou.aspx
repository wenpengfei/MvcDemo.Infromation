<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option selected="selected" value="">请选择类别</option>  
    <%--<option value='1' > 孕妇用品</option>  
    <option value='2' > 婴幼/儿童用品</option>  
    <option value='3' > 玩具</option>  
    <option value='4' > 其他母婴用品</option>--%>
    <%
        foreach (var item in SaleBaby.Singleton.ObjectTypeCollection)
        {
            %>
            <option value='<%=item.Id %>' ><%=item.Name %></option>
            <%
        }
     %>  
</select>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="RowsAfterObjectType" runat="server">
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="InfoTag" runat="server">
<ul class="tag3" id="tagul"> 
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="1282"  />防辐射服</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="1283"  />孕妇装</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="1284"  />卫生护理</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="1285"  />纸尿裤</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="1286"  />婴儿洗护</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="1287"  />奶粉</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="1288"  />婴儿服饰</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="1289"  />出生纪念品</li>
    <li><input name="Tag" id="Tag_8" type="checkbox" value="1290"  />婴儿车</li>
    <li><input name="Tag" id="Tag_9" type="checkbox" value="1291"  />婴儿床</li>--%>
    <%
        foreach (var item in SaleBaby.Singleton.TagCollection)
        {
            %>
                <li><input name="Tag" id="Tag_<%=item.Id %>" type="checkbox" value="<%=item.Id %>" t="<%=item.ObjectTypeId %>"/><%=item.Name %></li>
            <%    
        }
    %>
</ul>
</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var sale = new SaleBaby();
        FillData(sale);
        sale.Id = -1;
        sale.DateCreated = new Date().toJson(true);
        sale.DateModified = sale.DateCreated;
        sale.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#ObjectType').get(0).onchange = function () {
            //            $.c.sale.gettag(45, 2996, 'ObjectType', 0, "tagul", "tt");
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
            //            $('#infotag_Tip').html('').removeClass();
        };
        //        $.c.sale.gettag(45, 2996, 'ObjectType', 0, "tagul", "tt"); 
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
</script>
</asp:Content>
