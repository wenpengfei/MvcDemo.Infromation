<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option selected="selected" value="">请选择类别</option>  
    <%--<option value='0' selected> 数码相机</option>  
    <option value='1' > 数码摄像机</option>  
    <option value='2' > MP3/MP4</option>  
    <option value='5' > 口袋数码</option>  
    <option value='6' > 游戏机</option>  
    <option value='4' > 其他数码产品</option>--%>
    <%
        foreach (var item in SaleDigital.Singleton.ObjectTypeCollection)
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
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="370"  />数码相框</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="374"  />相机配件</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="1252"  />奥林巴斯</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="318"  />索尼</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="318"  />索尼</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="363"  />佳能</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="1253"  />JVC</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="310"  />松下</li>
    <li><input name="Tag" id="Tag_8" type="checkbox" value="311"  />三星</li>
    <li><input name="Tag" id="Tag_9" type="checkbox" value="1385"  />PSP</li>
    <li><input name="Tag" id="Tag_10" type="checkbox" value="369"  />爱国者</li>
    <li><input name="Tag" id="Tag_11" type="checkbox" value="367"  />富士</li>
    <li><input name="Tag" id="Tag_12" type="checkbox" value="366"  />柯达</li>
    <li><input name="Tag" id="Tag_13" type="checkbox" value="364"  />尼康</li>
    <li><input name="Tag" id="Tag_14" type="checkbox" value="363"  />佳能</li>
    <li><input name="Tag" id="Tag_15" type="checkbox" value="310"  />松下</li>--%>
    <%
        foreach (var item in SaleDigital.Singleton.TagCollection)
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
        var sale = new SaleDigital();
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
            //            $.c.sale.gettag(37, 2996, 'ObjectType', 0, "tagul", "tt");
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
            //$('#infotag_Tip').html('').removeClass();
        };
        //        $.c.sale.gettag(37, 2996, 'ObjectType', 0, "tagul", "tt");
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
</script>
</asp:Content>
