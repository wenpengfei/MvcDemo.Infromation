<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option selected="selected" value="">请选择类别</option>  
    <%--<option value='0' selected> 诺基亚</option>  
    <option value='1' > 摩托罗拉</option>  
    <option value='2' > 索尼爱立信</option>  
    <option value='3' > 三星</option>  
    <option value='9' > HTC/多普达</option>  
    <option value='6' > 手机配件</option>  
    <option value='8' > 小灵通</option>  
    <option value='11' > 苹果</option>  
    <option value='10' > 其他手机品牌</option>--%>
    <%
        foreach (var item in SaleMobile.Singleton.ObjectTypeCollection)
        {
            %>
            <option value='<%=item.Id %>' ><%=item.Name %></option>
            <%
        }
     %>  
</select>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="RowsAfterObjectType" runat="server">
<tr> 
    <td class="t"> 型 号： </td> 
    <td> 
        <select name="Model" id="Model"> 
            <option selected="selected" value="">--请选择--</option>    
            <%
                foreach (var item in SaleMobile.Singleton.TagCollection)
                {
                    %>
                        <option value="<%=item.Id %>" t="<%=item.ObjectTypeId %>"><%=item.Name %></option>
                    <%    
                }
            %>
        </select>
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="InfoTag" runat="server">
</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var sale = new SaleMobile();
        if ($("#Model").val() != "") {
            //sale.Model = $("#Model").find("option:selected").text();
            sale.Tag = parseInt($("#Model").val(), 10);
        }
        FillData(sale);
        sale.Id = -1;
        sale.DateCreated = new Date().toJson(true);
        sale.DateModified = sale.DateCreated;
        sale.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#tt").css("display", "none");
    });
</script>
</asp:Content>
