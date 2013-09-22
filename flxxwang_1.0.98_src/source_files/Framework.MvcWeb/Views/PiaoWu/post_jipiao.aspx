<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/TicketMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ITicket>" %>
<%@ Import Namespace="Infomation.Core"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="Rows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 类 别： </td> 
    <td> 
        <select name="ObjectType" id="ObjectType" f="{0}"> 
            <option selected="selected" value="">请选择类别</option>  
            <%--<option value='1' > 国际机票</option>  
            <option value='2' > 国内机票</option>--%>
            <%
                foreach (var item in TicketAirplane.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>'><%=item.Name %></option>
                    <%
                }
             %>  
        </select> <span id="ObjectType_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 详细地址： </td> 
    <td> <input type="text" name="dizhi" id="dizhi" f="{0}" value='' class="text1"  maxLength=50/> <span id="dizhi_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 补充说明： </td> 
    <td> <textarea name="Content" class="textarea2" id="Content"  maxLength=2000></textarea> <span id="Content_Tip"></span> </td> 
</tr> 
<%--<tr id="tt" style="display:none"> 
    <td class="t"> 选择标签： </td> 
    <td> <ul class="tag3" id="tagul"> </ul><span id="infotag_Tip"></span> </td> 
</tr>--%>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var ticket = new TicketAirplane();
        ticket.ObjectType = parseInt($("#ObjectType").val(), 10);
        ticket.Title = $("#Title").val();
        ticket.Address = $("#dizhi").val();
        ticket.Content = $("#Content").val();
        FillData(ticket);
        ticket.Id = -1;
        ticket.DateCreated = new Date().toJson(true);
        ticket.DateModified = ticket.DateCreated;
        ticket.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            post();
//            return false;
//        }
//        });
        $("#ObjectType").formValidator({ tipid: "ObjectType_Tip", onfocus: "" }).functionValidator({ fun: function (val, elem) { return val != ""; }, onerror: "请选择类别" }); $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#dizhi").formValidator({ tipid: "dizhi_Tip", onfocus: "2~30个字，可由数字、字母和汉字组成。", q2b: true }).inputValidator({ onerror: "请输入详细地址" }).regexValidator({ regexp: "\\S+#^(.){2,50}$#^([^\\s]\\s{0,3}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6})))+$#^[\\w\\[\\]\\(\\)\\{\\}\\.\\s,\\-\\*，。（）【】“”—‘’\\u4e00-\\u9fa5]*$", onerror: "请输入详细地址#地址不足2个字#地址里不能填写电话#地址里不能填写特殊字符" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });
    });
</script>
</asp:Content>
