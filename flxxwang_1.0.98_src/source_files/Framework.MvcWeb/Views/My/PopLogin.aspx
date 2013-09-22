<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>用户登陆——<%=SiteInfo.Name%></title>
    <%--<script type="text/javascript">
        window.onerror = function () {
            return true; 
        }
    </script>--%>

    <%--<script src="/Content/Fenlei/Scripts/5_1/jquery1.3.2.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="/Scripts/jquery-ui-1.9m6/jquery-1.6.2.js"></script>
    <script src="/Content/Fenlei/Scripts/comm_js/boot_passport_version.js" type="text/javascript"></script>    
	<%--<script src="/Scripts/jquery-1.5.1.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>
    <script src="/Scripts/framework/db.js" type="text/javascript"></script>
    <script src="/Scripts/framework/user.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/user.js" type="text/javascript"></script>

    <script src="/Content/Fenlei/Scripts/post/formValidator.js?v20110101" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/post/j.js" type="text/javascript"></script>

	
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/Css/detail/login_reg.css" />
    <style type="text/css">
        body,form,div{margin:0;padding:0}
    .mid{background:url/Content/Fenlei/images/grzx/logots.gif) no-repeat 4px 4px #fff2f2;padding:0 10px 0 26px;line-height:26px;margin:0 0 10px 0;width:201px;zoom:1;overflow:hidden; border:solid 1px #ff8080; line-height:24px}    
    </style>
</head>
<body>
    <form id="simSubmitForm" name="simSubmitForm">
<div class="login-reg">
		<input type="hidden" name="type" value="loginclose" />
        <input type="hidden" name="p1" id="p1" />
	<input type="hidden" name="p2" id="p2" />
	<input type="hidden" name="timesign" id="timesign" />
	<input type="hidden" name="cd" id="cd" value="4098"/>
    <div class="change_login_reg" style="margin-bottom:10px"><a class="active" href="#">登录</a><a href="<%=Url.Action("popreg","my") %>">注册</a></div>
    <div style="height:28px;padding-bottom:5px;" id="tipDiv" class="hc"></div>
    <table id="tab1" width="" cellpadding="0" cellspacing="0" class="login-reg-con">
    	<tr>
        	<td class="tt">用户名或邮件：</td>
        	<td><input name="username" type="text" class="width1" id="username" /></td>
        </tr>
        <tr id="passwordtr">
        	<td class="tt">密码：</td>
        	<td><input name="password" class="width1" type="password" id="password" onpaste="return false" /></td>
        </tr>
        <tr>
        	<td class="tt">&nbsp;</td>
        	<td><label><input name="remember" type="checkbox" value="on" />30天内自动登录 </label> <span class="gray">( 公共场所慎用 )</span></td>
        </tr>
        <tr>
        	<td class="tt">&nbsp;</td>
        	<td><input type="submit" name="btnSubmit" value=" 登 录 " class="denglu1" id="btnSubmit"/><%--onclick="doSubmit();"--%>
            <a href='<%=Url.Action("popreg","my") %>' id="Login1_clientRegUrl">注册</a> &nbsp;<a href="/forgetpassword/" target="_blank">找回密码</a></td>
        </tr>
    </table>
</div>
<div style="padding-top: 60px;"></div>
</form>
<%--<iframe name="formSubmit" id="formSubmit" src="http://passport.flxxwang.com/submit" style="display: none;"></iframe>--%>
<script type="text/javascript">
    function login() {
        var user = new $info.users.user();
            var user = new $info.users.user();
            user.UserName = $("#username").val();
            user.InputNewPassword = $("#password").val();
            //避免反序列化出错,以下变量随便赋值即可.
            user.UserId = -1;
            user.CreationDate = "\/Date(" + Date.parse(new Date().toString()) + ")\/";
            user.IsApproved = true;
            user.IsLockedOut = false;
            user.IsOnline = true;
            user.LastActivityDate = "\/Date(" + Date.parse(new Date().toString()) + ")\/";

            user.login(function (data) {
                if (data != null) {
                    $f.cookie.set("userId", data.Id, '', 0, "/");
                    $f.cookie.set("userName", data.UserName, '', 0, "/");
                    //location.href="<%=Url.Action("Index")%>";
                    parent.oWnd.close(true);
                }
                else {
                    alert("用户名或密码不正确");
                    $("#username").removeClass("c_ccc").attr("readonly", "");
                    $("#password").val("").removeClass("c_ccc").attr("readonly", "");
                }
            }, function (jqXHR, textStatus, errorThrown) {
                alert(errorThrown);
            });
    }
    var timespan = 1319424572562 - new Date().getTime();
    $(function () {
        $.formValidator.initConfig({ formid: "simSubmitForm", errorfocus: false, forcevalid: true, fun: function () {
//            $("#timesign").val(timesign);
//            $("#p1").val(getm32str($("#password").val(), timesign + "", $("#cd").val()));
            //            $("#p2").val(getm16str($("#password").val(), timesign + "", $("#cd").val()));
            login();
            $("#username").addClass("c_ccc").attr("readonly", "readonly");
            //            $("#password").val("password").addClass("c_ccc").attr("readonly", "readonly");
            $("#password").addClass("c_ccc").attr("readonly", "readonly");
            return false;
        }, errorclass: "sc", successclass: "hc", focusclass: "hc", tiphtml: '<div class="mid"><div class="conn" id=\'errorTip\'>{0}</div></div>'
        });

        $("#username").formValidator({ onfocus: "", tipid: 'tipDiv' }).inputValidator({ onerror: "请输入您的账户名" });
        $("#password").formValidator({ onfocus: "", tipid: 'tipDiv' }).inputValidator({ onerror: "请输入您的密码" }).regexValidator({ regexp: "^[\\s\\S]{6,}$#^(.){6,16}$", onerror: "密码太短，最少为6位。#密码不应超过16个字符。" });
        $("#validatecode").formValidator({ onfocus: "", tipid: 'tipDiv' }).inputValidator({ onerror: "请输入验证码" }).regexValidator({ regexp: "^([a-zA-Z0-9]){5}$", onerror: "验证码输入不正确。" });
        $("#validatecode").keyup(function () {
            $(this).val($.formValidator.QtoB(this.value));
        });

        setTimeout("clearform()", 20);
    });
    function clearform() {
        $("#username").val("").removeClass("c_ccc").removeAttr("readonly");
        $("#password").val("").removeClass("c_ccc").removeAttr("readonly");
    }
    function showvalidcode() {
        if (!$("#tr_validate") || $("#tr_validate").html() == null) {
            var html = '<tr id="tr_validate"><td class="tt">验证码：</td><td><input type="text" maxlength="5" name="validatecode" id="validatecode" class="yanzhengma"/><img class="yzm" onclick="document.getElementById(\'PicValidateCode\').src=\'/validatecode/?temp=123\'+ (new Date().getTime().toString(36)); return false" name="PicValidateCode" id="PicValidateCode" src="/validatecode/"/><a class="kanbuqing" onclick="document.getElementById(\'PicValidateCode\').src=\'/validatecode/?temp=123\'+ (new Date().getTime().toString(36)); return false" href="javascript:void(0)">看不清？</a>&nbsp;&nbsp;&nbsp;&nbsp;<span id="validatecode_Tip"></span></td></tr>';
            $("#passwordtr").after(html);
        }
    }
</script>
<%--$f.cookie.set("userid", data, '', 0, "/");--%>

<div style="display:none">
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-26929121-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
</div>
</body>
</html>
