<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ObjectType" runat="server">
<select name="ObjectType" id="ObjectType" f="{0}"> 
    <option selected="selected" value="">请选择类别</option>  
    <%--<option value='0' selected> 化工</option>  
    <option value='1' > 纺织</option>  
    <option value='2' > 印刷</option>  
    <option value='3' > 工程机械</option>  
    <option value='4' > 塑料</option>  
    <option value='5' > 机床</option>  
    <option value='6' > 发电</option>  
    <option value='7' > 仪器仪表</option>  
    <option value='8' > 木工</option>  
    <option value='9' > 农业</option>  
    <option value='10' > 食品加工</option>  
    <option value='11' > 其他</option>  --%>
    <%
        foreach (var item in SaleEquipment.Singleton.ObjectTypeCollection)
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
</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var sale = new SaleEquipment();
        FillData(sale);
        sale.Id = -1;
        sale.DateCreated = new Date().toJson(true);
        sale.DateModified = sale.DateCreated;
        sale.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#tt,#trxiaoqu").css("display", "none");

    });
</script>
</asp:Content>
