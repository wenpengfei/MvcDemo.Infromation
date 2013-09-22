<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option selected="selected" value="">请选择类别</option>  
    <%--<option value='0' selected> 书籍</option>  
    <option value='2' > 影片/电视剧</option>  
    <option value='3' > 音乐</option>  
    <option value='4' > 软件</option>  
    <option value='5' > 其他图书/音像/软件</option>--%>
    <%
        foreach (var item in SaleBook.Singleton.ObjectTypeCollection)
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
    <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="448"  />欧美经典</li>
    <li><input name="Tag" id="Tag_1" type="checkbox" value="449"  />国产老片</li>
    <li><input name="Tag" id="Tag_2" type="checkbox" value="443"  />管理类</li>
    <li><input name="Tag" id="Tag_3" type="checkbox" value="444"  />专业/技术</li>
    <li><input name="Tag" id="Tag_4" type="checkbox" value="442"  />工具书/辅导书</li>
    <li><input name="Tag" id="Tag_5" type="checkbox" value="441"  />考试/教材/论文</li>
    <li><input name="Tag" id="Tag_6" type="checkbox" value="440"  />生活类</li>
    <li><input name="Tag" id="Tag_7" type="checkbox" value="439"  />小说/文学</li>--%>
    <%
        foreach (var item in SaleBook.Singleton.TagCollection)
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
        var sale = new SaleBook();
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
            //            $.c.sale.gettag(43, 2996, 'ObjectType', 0, "tagul", "tt"); 
            $info.gettag("ObjectType", "tt", "tagul");
            setTimeout($.j.initTagCheck, 1000);
            //            $('#infotag_Tip').html('').removeClass();
        };
        //        $.c.sale.gettag(43, 2996, 'ObjectType', 0, "tagul", "tt");
        $info.gettag("ObjectType", "tt", "tagul");
        setTimeout($.j.initTagCheck, 1000);
    });
</script>
</asp:Content>
