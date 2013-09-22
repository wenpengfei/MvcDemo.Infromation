<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>
<%@ Import Namespace="Infomation.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option selected="selected" value="">请选择类别</option>  
    <%--<option value='0' selected> 办公设备</option>  
    <option value='1' > 办公耗材</option>  
    <option value='2' > 桌面文具</option>  
    <option value='3' > 办公家具</option>  
    <option value='4' > 其他</option>  --%>
    <%
        foreach (var item in SaleOffice.Singleton.ObjectTypeCollection)
        {
            %>
            <option value='<%=item.Id %>'><%=item.Name %></option>
            <%
        }
     %>
</select>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="RowsAfterObjectType" runat="server">
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="InfoTag" runat="server">
<ul class="tag3" id="tagul"> 
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="375"  />打印机</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="376"  />复印机</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="378"  />传真机</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="379"  />多功能一体机</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="386"  />墨盒/墨水</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="387"  />碳粉/硒鼓</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="390"  />扫描仪</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="379"  />多功能一体机</li>
    <li><input name="Tag" id="Tag_8" type="checkbox" value="378"  />传真机</li>
    <li><input name="Tag" id="Tag_9" type="checkbox" value="377"  />投影仪</li>
    <li><input name="Tag" id="Tag_10" type="checkbox" value="375"  />打印机</li>
    <li><input name="Tag" id="Tag_11" type="checkbox" value="384"  />会议桌</li>
    <li><input name="Tag" id="Tag_12" type="checkbox" value="383"  />文件柜</li>
    <li><input name="Tag" id="Tag_13" type="checkbox" value="382"  />保险柜</li>
    <li><input name="Tag" id="Tag_14" type="checkbox" value="381"  />办公桌</li>
    <li><input name="Tag" id="Tag_15" type="checkbox" value="1738"  />办公椅</li>
    <li><input name="Tag" id="Tag_16" type="checkbox" value="1739"  />沙发/茶几</li>--%>
    <%
        foreach (var item in SaleOffice.Singleton.TagCollection)
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
        var sale = new SaleOffice();
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
            //$.c.sale.gettag(38, 2996, 'ObjectType', 0, "tagul", "tt");
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
            $('#infotag_Tip').html('').removeClass();
        };
        //$.c.sale.gettag(38, 2996, 'ObjectType', 0, "tagul", "tt");
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
</script>
</asp:Content>
