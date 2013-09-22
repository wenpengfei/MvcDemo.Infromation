<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UserCenter/UserConter.Master" Inherits="System.Web.Mvc.ViewPage<User>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
<script type="text/javascript" src="/Content/Fenlei/Scripts/topbar.js"></script>
<script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/1.js"></script>
<script type="text/javascript" src="/Content/Fenlei/Scripts/7b/3.js"></script>
<script type="text/javascript" src="/Content/Fenlei/Scripts/c8/28.js"></script>

<script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>

<script src="/Scripts/framework/framework.js" type="text/javascript"></script>
<script src="/Scripts/framework/Area/city_debug.js" type="text/javascript"></script>
<script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
<script src="/Scripts/framework/db.js" type="text/javascript"></script>
<script src="/Content/Fenlei/Scripts/post/formValidator.js?v20110101" type="text/javascript"></script>
<script src="/Content/Fenlei/Scripts/post/j.js" type="text/javascript"></script>
<script src="/Content/Fenlei/Scripts/user.js" type="text/javascript"></script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
.mima_a,.mima_b,.mima_c,.mima_d {width:90px; height:6px; border:1px solid #ccc; padding:1px; line-height:1%; font-size:1%;}
.mima_a p,.mima_b p,.mima_c p,.mima_d p {height:6px; padding:0; line-height:1%; font-size:1%;}
.mima_a p {width:25%;background:#FF3300;}
.mima_b p {width:50%; background:#FF9933; }
.mima_c p {width:75%; background:#B8D96A; }
.mima_d p {width:100%; background:#009933;}
.fred {color:#ff0508;} .fgreen {color:#009900;} .fora {color:#FF9933;} .flv {color:#B8D96A;}
</style>
<div class="title clearfix">
	<h2 class="balance-h2">修改密码</h2>
</div><!--title-->
<form id="subform" name="subform" method="post" enctype="multipart/form-data" target="formSubmit">
<div class="uppwd">
	<dl class="clearfix">
		<dt>您的用户名</dt>
		<dd><strong><%=this.Model.UserName %></strong></dd>
	</dl>
	<dl class="clearfix">
		<dt><span class="red">*</span>&nbsp;请输入旧密码</dt>
		<dd>
			<input type="password" class="inw inp" id="txtOldPwd" name="txtOldPwd">
			<span id="txtOldPwd_Tip"></span></dd>
	</dl>
	<dl class="clearfix">
		<dt><span class="red">*</span>&nbsp;请输入新密码</dt>
		<dd>
			<input type="password" class="inw inp"  id="txtNewPwd1" name="txtNewPwd1"><%--onkeyup="$.c.user.reg.CheckPasswordStrength(this)"--%>
			<span id="txtNewPwd1_Tip"> </span></dd>
	</dl>
	<dl class="clearfix">
		<dt><span class="red">*</span>&nbsp;再次输入密码</dt>
		<dd>
			<input type="password"  class="inw inp"  id="txtNewPwd2" name="txtNewPwd2">
			<span id="txtNewPwd2_Tip"> </span></dd>
	</dl>
	<dl class="clearfix">
		<dt>&nbsp;</dt>
		<dd>
		<label class="butt" id="butt">
			<input type="submit" class="btns" value="完成修改" id="btnSubmit" />
		</label>
		</dd>
	</dl>
</div>
</form>
<script type="text/javascript">
    function isContinuousChar(str) {
        var str = str.toLowerCase();
        var flag = 0;
        for (var i = 0; i < str.length; i++) {
            if (str.charCodeAt(i) != flag + 1 && flag != 0)
                return false;
            else
                flag = str.charCodeAt(i);
        }
        return true;
    }

    function isSameChar(str) {
        var str = str.toLowerCase();
        var flag = 0;
        for (var i = 0; i < str.length; i++) {
            if (str.charCodeAt(i) != flag && flag != 0)
                return false;
            else
                flag = str.charCodeAt(i);
        }
        return true;
    }
    $(document).ready(function () {
        $.formValidator.initConfig({ formid: "subform", errorfocus: true, btnid: 'btnSubmit', btnvalue: '完成修改', btnactionvalue: '正在提交....', fun: function () { changePwd(); return false; } });
//        $.formValidator.initConfig({ formid: "subform", errorfocus: true, btnid: 'btnSubmit', fun: function () { alert("ok"); return false; }
//        });
        $("#txtOldPwd").formValidator({ onfocus: "请输入旧的密码" }).inputValidator({ onerror: "请填写密码" });
        $("#txtNewPwd1").formValidator({ onfocus: "密码需由6-16个字符（数字、字母、下划线）组成，区分大小写；不能使用重复、连续的字母、数字或下划线" }).inputValidator({ onerror: "您还没有输入密码" }).regexValidator({ regexp: "^[\\s\\S]{6,}$#^(.){6,16}$", onerror: "密码太短，最少为6位。#密码不应超过16个字符。" }).functionValidator({ fun: function (val, elem) {
            var pwd = val.toLowerCase();
            if ((isContinuousChar(pwd) || isSameChar(pwd)) && pwd.match("^[a-z|A-Z]+$")) {
                return "为了您的账户安全，密码不能为重复字母和连续字母";
            }
            if ((isContinuousChar(pwd) || isSameChar(pwd)) && pwd.match("^[\\d]+$")) {
                return "为了您的账户安全，密码不能为重复数字和连续数字";
            }
            if (pwd.match("^[_]+$")) {
                return "为了您的账户安全，密码不能全为下划线";
            }

            //            var msg = $.c.user.reg.checkpwd(val);
            //            if (msg == "") { return true; }
            //            return msg;
            return true;//by lls
        }
        });

        $("#txtNewPwd2").formValidator({ onfocus: "请填写密码" }).inputValidator({ onerror: "您两次所输入的密码不一致,请检查" }).compareValidator({
            desid: "txtNewPwd1", operateor: "=", onerror: "您两次所输入的密码不一致,请检查", datatype: "string"
        });
    });
</script>
<%--<iframe style="display: none" src="/submit.htm" id="formSubmit" name="formSubmit"></iframe>--%>

<script type="text/javascript">
    var menuid = "xiugaimima";
</script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
<script type="text/javascript">
//    $(function () {
//        $("#btnSubmit").click(function () {
//            
//    });
    function changePwd() {
        if (!$.formValidator.pageIsValid()) {
            return;
        }
        var user =new $info.users.user();
        user.Id=<%=this.Model.Id %>;
        user.InputOldPassword = $("#txtOldPwd").val();
        user.InputNewPassword = $("#txtNewPwd1").val();
        user.changePassword(function (data) {
            if (data == true) {
                $("#txtOldPwd").val("");
                $("#txtNewPwd1").val("");
                $("#txtNewPwd2").val("");
                alert("密码修改成功");
            }
            else{
                alert("密码修改失败");
            }
        }, function () {
            alert("密码修改失败");
        });
    }
</script>
</asp:Content>
