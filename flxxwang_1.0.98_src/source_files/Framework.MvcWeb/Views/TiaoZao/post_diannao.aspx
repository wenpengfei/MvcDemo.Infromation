<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option selected="selected" value="">请选择类别</option>  
    <%--<option value='0' > 台式机</option>  
    <option value='1' > 笔记本</option>  
    <option value='2' > 服务器</option>  
    <option value='3' > 硬件</option>  
    <option value='4' > 外设产品</option>  
    <option value='5' > 其他</option>--%>
    <%
        foreach (var item in SaleComputer.Singleton.ObjectTypeCollection)
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
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="304"  />惠普/康柏</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="305"  />戴尔</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="306"  />富士通</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="307"  />东芝</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="308"  />华硕</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="309"  />宏基</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="311"  />三星</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="312"  />神舟</li>
    <li><input name="Tag" id="Tag_8" type="checkbox" value="313"  />光驱/刻录</li>
    <li><input name="Tag" id="Tag_9" type="checkbox" value="314"  />音响</li>
    <li><input name="Tag" id="Tag_10" type="checkbox" value="315"  />IBM</li>
    <li><input name="Tag" id="Tag_11" type="checkbox" value="317"  />联想</li>
    <li><input name="Tag" id="Tag_12" type="checkbox" value="318"  />索尼</li>
    <li><input name="Tag" id="Tag_13" type="checkbox" value="319"  />cpu</li>
    <li><input name="Tag" id="Tag_14" type="checkbox" value="320"  />主板</li>
    <li><input name="Tag" id="Tag_15" type="checkbox" value="321"  />显卡</li>
    <li><input name="Tag" id="Tag_16" type="checkbox" value="322"  />内存条</li>
    <li><input name="Tag" id="Tag_17" type="checkbox" value="323"  />硬盘</li>
    <li><input name="Tag" id="Tag_18" type="checkbox" value="324"  />显示器/液晶</li>
    <li><input name="Tag" id="Tag_19" type="checkbox" value="325"  />网卡/无线网卡</li>
    <li><input name="Tag" id="Tag_20" type="checkbox" value="327"  />鼠标/键盘</li>
    <li><input name="Tag" id="Tag_21" type="checkbox" value="328"  />摄像头</li>
    <li><input name="Tag" id="Tag_22" type="checkbox" value="329"  />掌上电脑</li>
    <li><input name="Tag" id="Tag_23" type="checkbox" value="330"  />品牌机</li>
    <li><input name="Tag" id="Tag_24" type="checkbox" value="331"  />组装机</li>
    <li><input name="Tag" id="Tag_25" type="checkbox" value="333"  />耳麦</li>
    <li><input name="Tag" id="Tag_26" type="checkbox" value="334"  />不间断电源</li>
    <li><input name="Tag" id="Tag_27" type="checkbox" value="335"  />路由器</li>
    <li><input name="Tag" id="Tag_28" type="checkbox" value="356"  />U盘</li>
    <li><input name="Tag" id="Tag_29" type="checkbox" value="357"  />闪存卡</li>
    <li><input name="Tag" id="Tag_30" type="checkbox" value="358"  />移动硬盘</li>
    <li><input name="Tag" id="Tag_31" type="checkbox" value="336"  />苹果</li>
    <li><input name="Tag" id="Tag_32" type="checkbox" value="1214"  />台式服务器</li>
    <li><input name="Tag" id="Tag_33" type="checkbox" value="1215"  />机架式服务器</li>
    <li><input name="Tag" id="Tag_34" type="checkbox" value="1216"  />机柜式服务器</li>
    <li><input name="Tag" id="Tag_35" type="checkbox" value="1913"  />上网本</li>
    <li><input name="Tag" id="Tag_36" type="checkbox" value="3511"  />平板电脑</li>--%>
    <%
        foreach (var item in SaleComputer.Singleton.TagCollection)
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
        var sale = new SaleComputer();
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
            //            $.c.sale.gettag(35, 2996, 'ObjectType', 0, "tagul", "tt");
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
            //$('#infotag_Tip').html('').removeClass();
        };
        //        $.c.sale.gettag(35, 2996, 'ObjectType', 0, "tagul", "tt");
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
</script>
</asp:Content>
