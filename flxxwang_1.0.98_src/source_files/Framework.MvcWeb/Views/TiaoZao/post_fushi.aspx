<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option selected="selected" value="">请选择类别</option>  
    <%--<option value='0' selected> 服装</option>  
    <option value='3' > 配饰</option>  
    <option value='4' > 箱包</option>  
    <option value='7' > 鞋帽</option>  
    <option value='6' > 其他</option>--%>
    <%
        foreach (var item in SaleClothing.Singleton.ObjectTypeCollection)
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
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="430"  />裙子/连衣裙</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="421"  />品牌服装</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="1302"  />童装</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="1313"  />皮鞋</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="1314"  />休闲鞋</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="1316"  />运动鞋</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="1312"  />帽子</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="1917"  />男装</li>
    <li><input name="Tag" id="Tag_8" type="checkbox" value="1918"  />女装</li>
    <li><input name="Tag" id="Tag_9" type="checkbox" value="1922"  />手套</li>
    <li><input name="Tag" id="Tag_10" type="checkbox" value="1923"  />围巾</li>
    <li><input name="Tag" id="Tag_11" type="checkbox" value="3516"  />外贸服装</li>--%>
    <%
        foreach (var item in SaleClothing.Singleton.TagCollection)
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
        var sale = new SaleClothing();
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
            //            $.c.sale.gettag(41, 2996, 'ObjectType', 0, "tagul", "tt");
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
            //$('#infotag_Tip').html('').removeClass();
        };
        //        $.c.sale.gettag(41, 2996, 'ObjectType', 0, "tagul", "tt");
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
</script>
</asp:Content>
