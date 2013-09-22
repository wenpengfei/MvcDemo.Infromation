<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/FriendMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IFriend>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="Rows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 性 别： </td> 
    <td>  
        <input id="sex_0" f="{0}" type="radio"  name="sex" value='0'  id="sex0" /><span>男</span>  
        <input id="sex_1" f="{0}" type="radio"  name="sex" value='1'  id="sex1" /><span>女</span>  
        <span id="sex_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 年 龄： </td> 
    <td> 
        <input class="text3" type="text" id="Age" name="Age" f="{0}岁" value=''  maxLength=3/> 岁 
        <span id="Age_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 我 会： </td> 
    <td> <input type="text" class="text1" id="MySkill" f="{0}" name="MySkill" value=''  maxLength=15/> <span id="MySkill_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 我想学： </td> 
    <td> <input class="text1" type="text" f="{0}" id="WantSkill" name="WantSkill" value=''  maxLength=15/> <span id="WantSkill_Tip"></span> </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var friend = new FriendSkill();
        friend.Sex = $("#sex_0").attr("checked");
        friend.Age = parseInt($("#Age").val(), 10);
        friend.MySkill = $("#MySkill").val();
        friend.WantSkill = $("#WantSkill").val();

        FillData(friend);
        friend.Id = -1;
        friend.DateCreated = new Date().toJson(true);
        friend.DateModified = friend.DateCreated;
        friend.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#lbBiz").css("display", "");
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $(":radio[name='sex']").formValidator({ tipid: "sex_Tip", onfocus: "请选择性别" }).inputValidator({ min: 1, onerror: "请选择性别", type: "radio" }); $("#Age").formValidator({ tipid: "Age_Tip", onfocus: "只能填写数字。", q2b: true }).inputValidator({ onerror: "请输入年龄" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,2}$", onerror: "请输入年龄#年龄为整数，且不能为0" });
        $("#MySkill").formValidator({ tipid: "MySkill_Tip", onfocus: "2~15个字，多项请用逗号隔开", q2b: true }).inputValidator({ onerror: "请输入掌握的技能" }).regexValidator({ regexp: "\\S+#^(.){2,15}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "请输入掌握的技能#掌握的技能不足2个字#掌握的技能里不能填写电话" });
        $("#WantSkill").formValidator({ tipid: "WantSkill_Tip", onfocus: "2~15个字，多项请用逗号隔开", q2b: true }).inputValidator({ onerror: "请输入想学的技能" }).regexValidator({ regexp: "\\S+#^(.){2,15}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "请输入想学的技能#想学的技能不足2个字#想学的技能里不能输入电话" });
    });
</script>
</asp:Content>
