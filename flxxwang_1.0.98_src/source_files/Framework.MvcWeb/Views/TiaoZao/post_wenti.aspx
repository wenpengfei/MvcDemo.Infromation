<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option selected="selected" value="">请选择类别</option>  
    <%--<option value='0' > 户外用品</option>  
    <option value='1' > 健身器材</option>  
    <option value='2' > 文教用品</option>  
    <option value='3' > 球类用品</option>  
    <option value='4' > 乐器</option>  
    <option value='6' > 游泳用品</option>  
    <option value='7' > 瑜伽用品</option>  
    <option value='8' > 钓鱼用具</option>  
    <option value='9' > 各类棋牌</option>  
    <option value='5' > 其他</option>  --%>
    <%
        foreach (var item in SaleAthletics.Singleton.ObjectTypeCollection)
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
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="452"  />钢琴</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="453"  />吉他</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="454"  />古筝</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="455"  />电子琴</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="456"  />游泳用品</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="457"  />足球用品</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="458"  />篮球用品</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="459"  />羽毛球用品</li>
    <li><input name="Tag" id="Tag_8" type="checkbox" value="460"  />乒乓球用品</li>
    <li><input name="Tag" id="Tag_9" type="checkbox" value="462"  />溜冰/滑板</li>
    <li><input name="Tag" id="Tag_10" type="checkbox" value="463"  />台球用品</li>
    <li><input name="Tag" id="Tag_11" type="checkbox" value="465"  />手风琴</li>
    <li><input name="Tag" id="Tag_12" type="checkbox" value="466"  />二胡</li>
    <li><input name="Tag" id="Tag_13" type="checkbox" value="467"  />乐器配件</li>
    <li><input name="Tag" id="Tag_14" type="checkbox" value="1318"  />学生文具</li>
    <li><input name="Tag" id="Tag_15" type="checkbox" value="1319"  />教学用具</li>
    <li><input name="Tag" id="Tag_16" type="checkbox" value="1320"  />提琴</li>
    <li><input name="Tag" id="Tag_17" type="checkbox" value="462"  />溜冰/滑板</li>
    <li><input name="Tag" id="Tag_18" type="checkbox" value="1668"  />踏步机</li>
    <li><input name="Tag" id="Tag_19" type="checkbox" value="1669"  />跑步机</li>
    <li><input name="Tag" id="Tag_20" type="checkbox" value="1670"  />按摩椅</li>
    <li><input name="Tag" id="Tag_21" type="checkbox" value="1671"  />健身车</li>
    <li><input name="Tag" id="Tag_22" type="checkbox" value="1673"  />健腹器</li>
    <li><input name="Tag" id="Tag_23" type="checkbox" value="1676"  />活力板</li>
    <li><input name="Tag" id="Tag_24" type="checkbox" value="1682"  />哑铃</li>
    <li><input name="Tag" id="Tag_25" type="checkbox" value="1687"  />麻将</li>
    <li><input name="Tag" id="Tag_26" type="checkbox" value="1693"  />长笛</li>
    <li><input name="Tag" id="Tag_27" type="checkbox" value="1694"  />单簧管</li>
    <li><input name="Tag" id="Tag_28" type="checkbox" value="1703"  />萨克斯</li>
    <li><input name="Tag" id="Tag_29" type="checkbox" value="1709"  />台球桌</li>
    <li><input name="Tag" id="Tag_30" type="checkbox" value="1710"  />网球用品</li>
    <li><input name="Tag" id="Tag_31" type="checkbox" value="1713"  />高尔夫球用品</li>--%>
    <%
        foreach (var item in SaleAthletics.Singleton.TagCollection)
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
        var sale = new SaleAthletics();
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
            //            $.c.sale.gettag(46, 2996, 'ObjectType', 0, "tagul", "tt");
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
            //$('#infotag_Tip').html('').removeClass();
        };
        //        $.c.sale.gettag(46, 2996, 'ObjectType', 0, "tagul", "tt");
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
</script>
</asp:Content>
