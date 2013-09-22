<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/FriendMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IFriend>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="Rows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 类 型： </td> 
    <td> 
        <label><input name="pagetype" value="1" type="radio" onclick="tojump(this)" />异性交友</label>&nbsp;&nbsp;&nbsp;&nbsp; 
        <label><input name="pagetype" value="2" type="radio" onclick="tojump(this)" checked="checked" />兴趣交友</label>&nbsp;&nbsp;&nbsp;&nbsp; 
        <label><input name="pagetype" value="3" type="radio" onclick="tojump(this)" />同乡会</label> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 兴 趣： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 性 别： </td> 
    <td>  
        <label><input id="sex_0" f="{0}" type="radio" name="sex" value='0'  /><span>男</span></label>&nbsp;&nbsp;&nbsp;&nbsp; 
        <label><input id="sex_1" f="{0}" type="radio" name="sex" value='1'  /><span>女</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <b class="red">*</b> 年 龄：<input class="text3" type="text" id="Age" name="Age" f="{0}岁" value=''  maxLength=3/> 岁 
        <span id="sex_Tip"></span> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var friend = new FriendInterest();
        friend.Interest = $("#Title").val();
        friend.Sex = $("#sex_0").attr("checked");
        friend.Age = parseInt($("#Age").val(), 10);
        FillData(friend);
        friend.Id = -1;
        friend.DateCreated = new Date().toJson(true);
        friend.DateModified = friend.DateCreated;
        friend.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入兴趣" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "兴趣太过简单" });
        $(":radio[name='sex']").formValidator({ tipid: "sex_Tip", onfocus: "请选择性别" }).inputValidator({ min: 1, onerror: "请选择性别", type: "radio" });
        $("#Age").formValidator({ tipid: "sex_Tip", onfocus: "年龄为2~3位整数", q2b: true }).inputValidator({ onerror: "请输入年龄" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{1,2}$", onerror: "请输入年龄#年龄为2~3位整数" });
    });
</script>
</asp:Content>
