<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UserCenter/UserConter.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
.bankpay
{
margin-left:0px; 
padding-left:0px;
width:815px;
height:1020px;    
}
.userscore
{
   background-color:#fff;margin-left:0px; padding-left:0px;height:600px;width:815px; 
}
.container1
{
   margin-left:0px; padding-left:0px;height:600px;width:815px; 
}
.container2
{
   margin-left:0px; padding-left:0px;height:770px;width:815px; 
}
</style>
<script type="text/javascript">
    function stateChangeIE(_frame) {
        if (_frame.readyState == "complete") { ResizeFrame(_frame); }
    }
    function ResizeFrame(iframe) {
        try {
            var height = Math.max(iframe.contentWindow.document.body.scrollHeight, iframe.contentWindow.document.documentElement.scrollHeight);
            iframe.style.height = Math.max(height, 800) + "px";
        }
        catch (ex) { }
    }
    
</script>
<iframe id="ContainerFrame" name="ContainerFrame" onreadystatechange="stateChangeIE(this)" onload="ResizeFrame(this)" src="<%=Url.Action("companyinfo")%>" scrolling="no" class="container1" frameborder="0" marginwidth="0" marginheight="0" ></iframe>
<script>
    var menuid = "gongsiziliao";
</script>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
