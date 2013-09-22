<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option selected="selected" value="">请选择类别</option>  
    <%--<option value='0' selected> 电视机</option>  
    <option value='1' > 洗衣机</option>  
    <option value='2' > 空调</option>  
    <option value='3' > 冰箱/冰柜</option>  
    <option value='4' > 微波炉</option>  
    <option value='5' > 饮水机</option>  
    <option value='7' > 其他家电</option>  
    <option value='8' > 家电配件</option>  
    <option value='9' > 电暖气</option>--%>
    <%
        foreach (var item in SaleElectric.Singleton.ObjectTypeCollection)
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
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="393"  />热水器</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="394"  />电风扇</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="395"  />榨汁机</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="398"  />电磁炉</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="400"  />DVD机</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="1263"  />等离子彩电</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="1264"  />液晶电视机</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="1265"  />高清电视机</li>
    <li><input name="Tag" id="Tag_8" type="checkbox" value="1267"  />全自动洗衣机</li>
    <li><input name="Tag" id="Tag_9" type="checkbox" value="397"  />滚筒洗衣机</li>
    <li><input name="Tag" id="Tag_10" type="checkbox" value="1268"  />柜式</li>
    <li><input name="Tag" id="Tag_11" type="checkbox" value="1269"  />壁挂式</li>
    <li><input name="Tag" id="Tag_12" type="checkbox" value="3515"  />净水器</li>--%>
    <%
        foreach (var item in SaleElectric.Singleton.TagCollection)
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
        var sale = new SaleElectric();
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
            //            $.c.sale.gettag(39, 2996, 'ObjectType', 0, "tagul", "tt");
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
            //            $('#infotag_Tip').html('').removeClass();
        };
        //        $.c.sale.gettag(39, 2996, 'ObjectType', 0, "tagul", "tt");
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
</script>
</asp:Content>
