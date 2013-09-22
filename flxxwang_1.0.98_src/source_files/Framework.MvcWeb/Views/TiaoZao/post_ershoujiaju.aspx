<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option selected="selected" value="">请选择类别</option>  
    <%--<option value='0' selected> 床/床垫</option>  
    <option value='1' > 柜子</option>  
    <option value='2' > 桌子</option>  
    <option value='3' > 椅子/沙发</option>  
    <option value='6' > 居家用品/家纺</option>  
    <option value='5' > 其他家具/家居</option>--%>
    <%
        foreach (var item in SaleHome.Singleton.ObjectTypeCollection)
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
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="1498"  />双人床</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="1499"  />单人床</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="1500"  />双层床</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="1501"  />童床</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="1502"  />折叠床</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="1503"  />床垫</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="1504"  />衣柜</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="1505"  />床头柜</li>
    <li><input name="Tag" id="Tag_8" type="checkbox" value="1506"  />书柜</li>
    <li><input name="Tag" id="Tag_9" type="checkbox" value="1509"  />电视柜</li>
    <li><input name="Tag" id="Tag_10" type="checkbox" value="1512"  />餐桌</li>
    <li><input name="Tag" id="Tag_11" type="checkbox" value="1513"  />写字桌</li>
    <li><input name="Tag" id="Tag_12" type="checkbox" value="1516"  />折叠桌</li>--%>
    <%
        foreach (var item in SaleHome.Singleton.TagCollection)
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
        var sale = new SaleHome();
        FillData(sale);
        sale.Id = -1;
        sale.DateCreated = new Date().toJson(true);
        sale.DateModified = sale.DateCreated;
        sale.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        var _contentTip = '有多个家具转让，请在对应分类下发布，否则不会被搜索到！';
        $.j.initContentTip(_contentTip);

        $('#ObjectType').get(0).onchange = function () {
            //            $.c.sale.gettag(508, 2996, 'ObjectType', 0, "tagul", "tt");
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
            //$('#infotag_Tip').html('').removeClass();
        };
        //        $.c.sale.gettag(508, 2996, 'ObjectType', 0, "tagul", "tt");
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
</script>
</asp:Content>
