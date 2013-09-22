<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Extensions" %>
<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
<%--<link rel="Shortcut Icon" href="http://pic2.flxxwang.com/passport/images/taojen.ico" type="image/x-icon" />--%>
<title>用户登录-<%=SiteInfo.Name%></title>
<script type="text/javascript">
    try {
        var ____json4fe = { catentry: { dispid: '', name: '', listname: '' },
            locallist: { dispid: '', name: '', listname: '' }, modules: 'passport'
        }
    } catch (e) { }; 
</script>
<%--<script src="/Content/Fenlei/Scripts/5_1/jquery1.3.2.js" type="text/javascript"></script>--%>
<script type="text/javascript" src="/Scripts/jquery-ui-1.9m6/jquery-1.6.2.js"></script>
<script src="/Content/Fenlei/Scripts/comm_js/boot_passport_version.js" type="text/javascript"></script>

<script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>

<script type="text/javascript" src="/Scripts/framework/common.js"></script>
<script src="/Scripts/framework/framework.js" type="text/javascript"></script>
<script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
<script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>
<script src="/Scripts/framework/db.js" type="text/javascript"></script>
<script src="/Scripts/framework/user.js" type="text/javascript"></script>
<script src="/Content/Fenlei/Scripts/user.js" type="text/javascript"></script>

<script type="text/javascript">
    function setTab(name, cursel, n, obj) {
        if (obj && obj.className != "hover") {
            $("#tipDiv").attr("class", "hc");
            $("#tipDiv").html("");
        }
        for (i = 1; i <= n; i++) {
            var menu = document.getElementById(name + i);
            menu.className = i == cursel ? "hover" : "";
        }

        if (cursel == 1) {
            document.getElementById("usernametr").style.display = "";
            document.getElementById("username").style.display = "";
            document.getElementById("mobiletr").style.display = "none";
            document.getElementById("mobile").style.display = "none";
            document.getElementById("mobile").className = "inp inw c_ccc";
            if (document.getElementById("mobile").value == "") {
                document.getElementById("mobile").value = "手机号";
            }
        } else {
            document.getElementById("mobiletr").style.display = "";
            document.getElementById("mobile").style.display = "";
            document.getElementById("usernametr").style.display = "none";
            document.getElementById("username").style.display = "none";
            document.getElementById("username").className = "inp inw c_ccc";
            if (document.getElementById("username").value == "") {
                document.getElementById("username").value = "用户名/电子邮箱";
            }
        }
        $("#password").attr("class", "inp inw");
        $("#password").val("");
    }
</script>
<link rel="stylesheet" href="/Content/Fenlei/Ui6/my/css/login_6.css" type="text/css" />

</head>
<body>
    <%
        var cityCode = Framework.Utility.CookieManager.GetCookie("city");
        if (string.IsNullOrWhiteSpace(cityCode))
        {
            cityCode = "bj";
        }
    %>
    <form name="submitForm" id="submitForm" target="formSubmit">
<input type="hidden" name="p1" id="p1" />
<input type="hidden" name="p2" id="p2" />
<input type="hidden" name="timesign" id="timesign" />
<input type="hidden" name="cd" id="cd" value="9571"/>
	<div id="login-header" class="win900">
		<a href="<%=Url.Action("Default","Home",new{city=cityCode}) %>" id="logo" style="left:20px;" >
            <img src="/Content/Fenlei/assets/images/logo/logo.gif" alt="中文最大生活信息门户"/>
        </a>
		<div id="cityname" class="loginname" style="left:208px;"><span>用户登录</span></div>
		<div id="logintext" style="right:-10px;">
            <a href="<%=Url.Action("Default","Home",new{city=cityCode}) %>">返回首页</a>
            <%--|<a href="http://about.flxxwang.com/" target="_blank">帮助</a>--%>
        </div>
	</div>
	<div class="cb win900">
		<div id="conleft">
			<!--图片轮播控件-->
			<div id="ibanner">
				<div id="ibanner_pic">
                    <a>
                        <img src="/Content/Fenlei/Ui6/my/images/sqlogin.jpg" />
                    </a>
                </div>
			</div>
		</div>
		<div id="conright">
			<%--<ul class="login-scrool">
				<li class="hover" onclick="setTab('scrool',1,2,this)" id="scrool1"><em></em>账户登录</li>
				<li onclick="setTab('scrool',2,2,this)" id="scrool2"><em></em>手机登录</li>
			</ul>--%>
            <ul class="login-scrool">
                <li class="hover hc" id="Li1" style="width:315px; cursor:default"><em></em>账户登录</li>
			</ul>
			<div class="scrool-bg">
				<div class="loginbox">
					<div id="tipDiv"></div>
					<table>
						<tr id="usernametr">
							<th>账户名</th>
							<td><input class="inp inw c_ccc" type="text" id="username" name="username" onfocus='if (this.value == "用户名/电子邮箱") this.value = "";this.className = "inp inw";' size="20" value="用户名/电子邮箱" /></td>
						</tr>
						<tr id="mobiletr" style="display:none">
							<th>手机号</th>
							<td><input class="inp inw c_ccc" type="text" id="mobile" name="mobile" onfocus='if (this.value == "手机号") this.value = "";this.className = "inp inw";' size="20" value="手机号" /></td>
						</tr>
						<tr id="passwordtr">
							<th>密　码</th>
							<td style=" padding-bottom:5px;">
								<input class="inp inw" id="password" type="password" style="margin-bottom:7px;" name="password" size="20" onpaste="return false" value=""/>
							</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td style="padding: 0pt;">
								<input type="checkbox" style="vertical-align: middle;" id="coks" value="on" name="remember" />
								<label class="logintip" for="coks">30天内自动登录 (公共场所慎用)</label>
							</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td style="padding:0;">
								<span class="butt" style="line-height:34px;">
								<input type="submit" name="btnSubmit" value="登录" class="btns" accesskey="l" id="btnSubmit" />
								</span><span class="reg-a"><a href="<%=Url.Action("reg","my") %>">免费注册</a>|<a href="#">找回密码</a> </span>
							</td>
						</tr>
					</table>
				</div>
				<div class="link-login">
				   <%--<span class="lots">使用合作网站账号登录：</span>
				   <a href="#" title="新浪微博用户登录" id="lo_sina" class="loico">新浪微博</a>
				   <a href="#" title="QQ用户登录" id="lo_qq" class="loico">QQ</a>
				   <a href="#" title="开心网用户登录" id="lo_kxw" class="loico loico-b">开心网</a>
				   <a href="#" title="人人网用户登录" id="lo_renren" class="loico" style="margin:0;">人人网</a>--%>
				 </div>
			</div><!--scrool bg-->
			<div class="clear"></div>
		</div>
		<div class="c"></div>
	</div>
	<div id="footer" class="win900" >
		<p>
            &copy; flxxwang.com 
            <%--<a class="fduihua" target="_blank" title="有问题请与<%=SiteInfo.Name%>进行对话" href="http://about.flxxwang.com/">与<%=SiteInfo.Name%>对话</a>--%>
        </p>
	</div>
</form>
<script type="text/javascript">
    var timespan = 1317972873635 - new Date().getTime();
    $(function () {
        $.formValidator.initConfig({ formid: "submitForm", errorfocus: false, forcevalid: true, btnid: 'btnSubmit', btnvalue: '登录', btnactionvalue: '登录', fun: function () {
            var wrongTimes = 0;
            if (GetCookieValue('wrongtimes') != null) {
                wrongTimes = parseInt(GetCookieValue('wrongtimes'));
            }
            if (wrongTimes > 4) {
                alert("您密码输入错误次数太多,请过一段时间再试");
                return false;
            }
            var timesign = new Date().getTime() + timespan;
            if (timesign - 1317972873635 > 1800000) {
                alert("页面已过期，请刷新后再提交");
                window.location.href = window.location.href;
                return false;
            }
            $("#timesign").val(timesign);
            $("#p1").val(getm32str($("#password").val(), timesign + ""));
            $("#p2").val(getm16str($("#password").val(), timesign + ""));
//            $("#username").addClass("c_ccc").attr("readonly", "readonly");
//            $("#password").addClass("c_ccc").attr("readonly", "readonly");
            $("#username").addClass("c_ccc");
            $("#password").addClass("c_ccc");
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

            user.login(function(data)
            {
                if(data!=null)
                {
                    var expireDays=0;
                    if($("#coks").attr("checked")){
                        expireDays=30;
                    }
                    $f.cookie.set("userId", data.Id, '', expireDays, "/");
                    $f.cookie.set("userName", data.UserName, '', expireDays, "/");
                    location.href="<%=Url.Action("Index")%>";
                }
                else {
                    alert("用户名或密码不正确");
//                    $("#username").removeClass("c_ccc").attr("readonly", "");
//                    $("#password").val("").removeClass("c_ccc").attr("readonly", "");
                }
            },function(jqXHR, textStatus, errorThrown)
            {
                alert(errorThrown);
            });

            return false; //by lls
            //            return true;
        }, errorclass: "sc", successclass: "hc", focusclass: "hc", tiphtml: '<div class="mid mid-t1"><div class="conn" id=\'errorTip\'>{0}</div></div>'
        });
        $("#username").formValidator({ onfocus: "", tipid: 'tipDiv' }).inputValidator({ onerror: "您还没有输入账户名" });
//        $("#mobile").formValidator({ onfocus: "", tipid: 'tipDiv' }).inputValidator({ onerror: "您还没有输入手机号码" }).regexValidator({ regexp: "^1(3|4|5|8)\\d{9}$", onerror: "手机号码格式错误" });
        $("#password").formValidator({ onfocus: "", tipid: 'tipDiv' }).inputValidator({ onerror: "您还没有输入密码" }).regexValidator({ regexp: "^[\\s\\S]{6,}$#^(.){6,16}$", onerror: "密码太短，最少为6位。#密码不应超过16个字符。" });
        $("#validatecode").formValidator({ onfocus: "", tipid: 'tipDiv' }).inputValidator({ onerror: "请输入验证码" }).regexValidator({ regexp: "^([a-zA-Z0-9]){5}$", onerror: "验证码输入不正确。" });
        $("#validatecode").keyup(function () {
            $(this).val($.formValidator.QtoB(this.value));
        });
    });

    function clearform() {
        $("#username").removeClass("c_ccc").removeAttr("readonly");
        $("#password").val("").removeClass("c_ccc").removeAttr("readonly");
    }

</script>

<%--<script type="text/javascript">
    $("#scrool1").className = "hover";
    $("#scrool2").className = "";
    setTab('scrool', 1, 2);
</script>--%>

<%--<iframe name="formSubmit" id="formSubmit" src="http://passport.flxxwang.com/submit" style="display: none;"></iframe>--%>

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
