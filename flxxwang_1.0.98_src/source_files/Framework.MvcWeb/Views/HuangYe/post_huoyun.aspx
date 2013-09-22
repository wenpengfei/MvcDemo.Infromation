<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/YellowPageMasterPage.master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="ObjectTypePlaceHolder" runat="server">
<%var ViewTag = ViewData["ViewTag"] as ViewTag;%>
<%--<label> <input type="radio" name="ObjectType" id='ObjectType_1' value='1'  />国内货运专线</label>&nbsp;&nbsp;&nbsp;&nbsp;  
<label> <input type="radio" name="ObjectType" id='ObjectType_2' value='2'  />国际货运专线</label>&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%
    foreach (var item in ViewTag.Interface.ObjectTypeCollection)
    {
        %>
        <label><input type="radio" name="ObjectType" id="ObjectType_<%=item.Id %>" value='<%=item.Id %>'  /><%=item.Name %></label>&nbsp;&nbsp;&nbsp;&nbsp;
                <%--input的id不能省,否则表单验证会报错--%>
        <%
    }
%>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="AfterInfoTagRow" runat="server">
</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var yp = new YellowPage();
        FillData(yp);
        yp.ObjectType = parseInt(getRadioValue("ObjectType"), 10);
        yp.Id = -1;
        yp.DateCreated = new Date().toJson(true);
        yp.DateModified = yp.DateCreated;
        yp.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(function () {
        $(":radio[name='ObjectType']").formValidator({ tipid: "ObjectType_Tip", onfocus: "" }).inputValidator({ min: 1, onerror: "请选择运送范围", type: "radio" });
    });
    
</script>
</asp:Content>
