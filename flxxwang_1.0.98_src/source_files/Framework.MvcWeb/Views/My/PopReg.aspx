<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>用户注册-<%=SiteInfo.Name%></title>
	<script src="/Scripts/jquery-1.5.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>
    <script src="/Scripts/framework/db.js" type="text/javascript"></script>
    <script src="/Scripts/framework/user.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/user.js" type="text/javascript"></script>
	<%--<script src="http://pic2.flxxwang.com/js/5_1/comm_js/boot_passport_version.js" type="text/javascript"></script>--%>
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/Css/detail/login_reg.css" />    
    <style type="text/css">
        body
        {
            margin: 0;
            padding: 0;
        }
        #pwdStrength
        {
            font-size: 12px;
            height: 15px;
            width: 150px;
            color: gray;
        }
        .w234{ width:234px;}
		#reg-keyword{ border:#7f9db9 1px solid; width:170px;}
		#reg-keyword a{ display:block; color:#000; padding:2px 10px;}
		#reg-keyword a:hover{ background-color:#f97d03; color:#fff; text-decoration:none;}
		#reg-keyword p{ padding:5px 10px; color:#666; margin:0;} 
    </style>
</head>
<body>
    <form id="submitForm" name="submitForm">
    <div class="login-reg">
        <div class="change_login_reg"><a href="<%=Url.Action("poplogin","my") %>">登录</a><a href="#" class="active">注册</a></div>
        <table id="tab2" width="" cellpadding="0" cellspacing="0" class="login-reg-con">

            <tr>
                <td class="tt">
                    用户名：
                </td>
                <td>
                    <input type="text" class="width1" id="nickName" name="nickName" size="20" value=""/>
                     <span id="nickName_Tip"></span>
                </td>
            </tr>
 			<tr>
                <td class="tt">
                    电子邮件：
                </td>
                <td>
                    <input type="text" class="width1" id="txtemail" name="txtemail" size="20" value=""/>
                    <span id="txtemail_Tip"></span>

                </td>
            </tr>
            <tr>
                <td class="tt">
                    密码：
                </td>
                <td>
                    <input type="password" onpaste="return false" onkeyup="$.c.user.reg.CheckPasswordStrength(this)" class="width1" id="password" name="password" size="30" />
                    <span id="password_Tip"></span>
                    <br />
                    <label id="pwdStrength" style="color: Gray; vertical-align: top">

                    </label>
                </td>
            </tr>
            <tr id="cpp">
                <td class="tt">
                    确认密码：
                </td>
                <td>
                    <input type="password" onpaste="return false" class="width1" id="cpassword" name="cpassword" size="30" />                  
                    <span id="cpassword_Tip"></span>

                </td>
            </tr>
                        <tr>
                <td class="tt">
                    &nbsp;
                </td>
                <td>
                    <input type="submit" name="btnSubmit" id="btnSubmit" class="denglu2" value="同意以下协议并注册" id="btnSubmit" />

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="xiy">
                        <%=SiteInfo.Name%>使用协议：
                        <br />
                        <textarea readonly="readonly" cols="" rows="" class="tarea">
    欢迎您使用<%=SiteInfo.Name%>。<%=SiteInfo.Name%>致力于为您提供最优质、最便捷的服务。在访问<%=SiteInfo.Name%>的同时，也请您仔细阅读我们的协议条款。您需要完全接受本协议才能注册成为我们的用户。一经注册，您需要遵守该协议的所有条款。北京五八信息技术有限公司作为<%=SiteInfo.Name%>的管理者有权随时单方面修改本协议，修改后的协议经用户阅览同意后生效。如果您是我们的老用户，您需要经常查看本协议以便知晓相关修订。如果您不同意其中的任何条款或者任何修订，您唯一的解决办法是立刻停止使用服务。<%=SiteInfo.Name%>有权利通过包括但不限于删帖，终止账户，屏蔽IP地址、关键字、联系方式，或法律诉讼等方式执行本用户协议。使用本服务前，您理解并认可本服务提供的分类信息，其中包含的文字，图片，链接等内容均由用户自主、免费发布，并由用户承担全部责任。
	
    一、<%=SiteInfo.Name%>服务内容
        <%=SiteInfo.Name%>定位于本地社区及免费分类信息服务，通过为个人用户和商家提供资源丰富、信用度高、交互性强的分类信息平台来帮助人们解决生活和工作所遇到的难题。其服务覆盖生活的各个领域，提供房屋租售、餐饮娱乐、招聘求职、二手买卖、汽车租售、宠物票务、旅游交友等多种生活信息，覆盖中国所有大中城市。
		
    二、用户使用规则
        1、本公司的服务仅向18岁以上有完全民事行为能力的人提供，如果您未满18岁，您需要在您的监护人的指导下使用。
        2、您需要按照<%=SiteInfo.Name%>的注册、登陆程序和相应规则进行注册、登陆，注册信息应真实可靠，如果您的注册信息发生变动，请及时更新。
        3、您需要在适当的栏目或地区发布信息，您所发布的信息内容应当真实、可靠并且不得违反<%=SiteInfo.Name%>对信息发布的禁止性规定。您需要对您自行发表、上传或者转载的所有信息承担全部责任。
        4、在使用本公司服务时，您需要遵守中华人民共和国的相关法律法规。包括但不限于《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》、《最高人民法院关于审理涉及计算机网络著作权纠纷案件适用法律若干问题的解释(法释[2004]1号)》、《全国人大常委会关于维护互联网安全的决定》、《互联网电子公告服务管理规定》、《互联网新闻信息服务管理规定》、《互联网著作权行政保护办法》和《信息网络传播权保护条例》等有关计算机互联网规定和知识产权的法律和法规、实施办法。
        5、您承诺：对您发表或者上传于<%=SiteInfo.Name%>的所有信息均享有完整的知识产权，或已经得到相关权利人的合法授权，并保证该信息不侵犯到任何第三人的合法权益；如用户违反本条规定造成<%=SiteInfo.Name%>被第三人索赔的，用户应全额补偿本社区一切费用(包括但不限于各种赔偿费、诉讼代理费及为此支出的其它合理费用)。
        6、您同意在发现本网站任何内容不符合法律规定，或不符合本用户协议规定的，您有义务及时向<%=SiteInfo.Name%>进行汇报。如果您发现您的个人信息被盗用，或者您的版权或者其他权利被侵害，请将此情况告知<%=SiteInfo.Name%>并同时提供如下信息和材料：  
        6.1侵犯您权利的信息的网址，编号或其他可以找到该信息的细节；您保证您是所述的
        6.2版权或个人信息的合法拥有者的声明；
        6.3您的联系方式，包括联系人姓名，地址，电话号码和电子邮件； 
        6.4您的身份证复印件、营业执照等。
        经审查得到证实的，我们将于1个工作日内删除相关信息。我们仅接受邮寄、电子邮件或传真方式的书面侵权通知。情况紧急的，您可以通过客服电话先行告知，在接到您的告知提醒后，我们会对相关信息进行暂时的屏蔽。在收到您提供的书面材料后，我们经审查证实的，将立即删除该信息。
        7、您保证不利用<%=SiteInfo.Name%>实施任何危害或可能对互联网的正常运转造成不利影响的行为；不进行任何危害<%=SiteInfo.Name%>的行为。
        8、您应确保您自己账号和密码的安全，因您自己的过失导致损害发生的，<%=SiteInfo.Name%>不承担任何责任。
        9、您同意<%=SiteInfo.Name%>以邮件、手机短信等形式向您告知<%=SiteInfo.Name%>的相关动态信息。
		   
    三、隐私保护
        1、<%=SiteInfo.Name%>向您保证不对外公开或向第三方提供您的注册资料及您在使用本网站服务时存储在本网站的非公开内容，但下列情况除外：1.事先获得您的明确授权的；2.根据有关的法律法规要求，我们必须提供的；3.按照相关政府主管部门的要求，我们必须提供的；4，您先行违反本协议内容导致<%=SiteInfo.Name%>或第三方或者社会公共利益受损或者受到威胁的，我们有权向相关当事人提供您的相关信息。
        2、你知悉并认可：<%=SiteInfo.Name%>可能会与第三方合作向用户提供相关的网络服务，在此情况下，如该第三方同意承担与本网站同等的保护用户隐私的责任，则<%=SiteInfo.Name%>有权将用户的注册资料等提供给该第三方。另外，在不透露单个用户隐私资料的前提下，<%=SiteInfo.Name%>有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。
			
    四、免责条款
        1、由于<%=SiteInfo.Name%>网上大多数的内容系用户自主、免费发布，本公司不保证这些信息和用户联络方式的准确性、以及其所提供内容的质量、安全性或合法性。对此，您同意：
        1.1不就其他用户发布的内容或所作所为追究本公司的责任。本公司对于您由于使用<%=SiteInfo.Name%>网而造成的任何金钱、商誉、名誉的损失，或任何特殊的、间接的、或结果性的损失都不负任何责任。
        1.2您同意您就您自身行为之合法性单独承担责任，<%=SiteInfo.Name%>和<%=SiteInfo.Name%>的所有关联公司和相关实体对本公司用户的行为的合法性不承担责任。
        2、除<%=SiteInfo.Name%>注明之服务条款外，其他一切因使用<%=SiteInfo.Name%>发布系统而引致之任何意外、疏忽、合约毁坏、诽谤、版权或知识产权侵犯及其所造成损失的（包括因下载而感染电脑病毒），<%=SiteInfo.Name%>不承担任何法律责任
        3、任何通过<%=SiteInfo.Name%>的网页而链接及得到的资讯、产品或服务均系网站用户自行发布，引起纠纷的，<%=SiteInfo.Name%>不承担任何法律责任。 
        4、根据法律规定、相关协议约定，<%=SiteInfo.Name%>不承担责任的其他情形
		
    五、一般规定
		
        本协议在所有方面均受中华人民共和国法律管辖。本网站所有用户均不可撤销地受中华人民共和国北京市的法院的管辖。本协议的规定是可分割的，如本协议的任何规定被裁定为无效或不可执行，该规定可被删除而其余条款继续有效并应予以执行。您同意，在发生并购，本协议和所有纳入的协议可由<%=SiteInfo.Name%>按本公司自行酌情决定向第三方自动转让。本公司未就您或其他方的违约采取行动并不等于本公司放弃就随后或类似的违约采取行动的权利。
		
    <%=SiteInfo.Name%>再次慎重申明：用户发布之内容并不反映任何<%=SiteInfo.Name%>之意见。             
		</textarea>
                    </div>

                </td>
            </tr>
        </table>
    </div>
    </form>

    <script id="postScript" type="text/javascript">
        var showSugTime;
        var timespan = 1319426036300 - new Date().getTime();
        $(document).ready(function () {
            $.formValidator.initConfig({ formid: "submitForm", errorfocus: true, btnid: 'btnSubmit', btnvalue: '同意以下协议，并注册', btnactionvalue: '注册中....', fun: function () {
                return true;
            }
            , errorclass: "v_false", focusclass: "action", tiphtml: '{0}'
            });
            $("#nickName").formValidator({ onfocus: "不超过10个汉字，或20个字符(数字，字母和下划线)。" }).inputValidator({ onerror: "请填写用户名。" }).functionValidator({ fun: function (val, elem) {
                if (val.match("^[\\d]+$")) {
                    return "用户名不能全为数字";
                }

                var msg = $.c.user.reg.checknickname(val);
                if (msg == "") { return true; }
                return msg;
            },
                onerror: "请填写用户名"
            });
            //            .ajaxValidator({ checkfun: function (val, elem, fun) {
            //                $.c.user.reg.checknameexist(val, fun);
            //            }
            //            });
            $("#password").formValidator({ onfocus: "6～16个字符(数字，字母和下划线组成)。" }).inputValidator({ onerror: "请填写密码。" }).functionValidator({ fun: function (val, elem) {
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

                var msg = $.c.user.reg.checkpwd(val);
                if (msg == "") { return true; }
                return msg;
            }
            });
            $("#cpassword").formValidator({ onfocus: "" }).inputValidator({ onerror: "输入的密码不一致" }).functionValidator({ fun: function (val, elem) {

            }
            }).compareValidator({
                desid: "password", operateor: "=", onerror: "输入的密码不一致", datatype: "string"
            });
            $("#txtemail").formValidator({ onfocus: "&nbsp;&nbsp;没有电子邮件？推荐搜狐闪电邮箱 ！" }).inputValidator({ onerror: "&nbsp;&nbsp;请填写电子邮箱。" }).functionValidator({ fun: function (val, elem) {
                var msg = $.c.user.reg.checkemail(val);
                if (msg == "") { return true; }
                return msg;
            },
                onerror: "请填写用户名"
            });
            //            .ajaxValidator({ checkfun: function (val, elem, fun) {
            //                $.c.user.reg.checkemailexist(val, fun);
            //            }
            //            });
            $("#mobile").formValidator({ onfocus: "请填写手机号码" }).inputValidator({ onerror: "请填写手机号码" }).functionValidator({ fun: function (val, elem) {
                if (validMobileFormat(val)) {
                    return true;
                } else {
                    return '手机号码格式错误';
                }
            },
                onerror: "手机号码格式错误"
            });
            $("#mobilecode").formValidator({ onfocus: "输入手机确认码" }).inputValidator({ onerror: "输入手机确认码" });
            var resendtime = 0;
            if (resendtime >= 0) {
                countresent(resendtime);
            }
            $("#txtemail").val("");
            $("#password").val("");
            $("body").click(function () {
                if (new Date().getTime() - showSugTime > 1000) {
                    clearSug();
                }
            });
        });

        function countresent(resendtime) {
            var sel = setInterval(function () {
                if (resendtime == 0) {
                    $("#resendbtn").attr("disabled", false);
                    $("#resendbtn").val("获取手机确认码");
                    clearInterval(sel);
                    return;
                }
                $("#resendbtn").attr("disabled", "disabled");
                $("#resendbtn").val(resendtime + " 重新手机确认码");
                resendtime--;
            }, 1000);
        }

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

        var showSug = function (arr, textid) {
            if (!arr || arr.length < 1) {
                return;
            }
            var isUserName = textid == "nickName";
            var obj = $("#" + textid);
            var left = obj.offset().left;
            var top = obj.offset().top + obj.height();

            var content = '<div class="w234" id="reg-keyword" style="background:#FFFFFF ;position: absolute; z-index: 999; top: ' + top + 'px; left: ' + left + 'px;"><p>' + (isUserName ? '选择推荐用户名' : '请选择您的邮箱类型') + '：</p>';
            $.each(arr, function (i, n) {
                content += '<a href="javascript:void(0);" onclick="fillText(\'' + textid + '\',this)">' + n + '</a>';
            });
            content += '</div>';
            $(content).insertAfter("form");
            showSugTime = new Date().getTime();
        }

        function fillText(textId, selectObj) {
            $(selectObj).parent().remove();
            $("#" + textId).val(selectObj.innerHTML);
            $("#" + textId).focus();
        }

        function clearSug() {
            $("#reg-keyword").remove();
        }

        function validMobileFormat(mobile) {
            var numberRegStr = /^\d{11}$/;
            var regNum = new RegExp(numberRegStr);
            if (regNum.test(mobile)) {
                var telRegStr = /^(13|14|18|15)\d{9}$/;
                var reg = new RegExp(telRegStr);
                if (reg.test(mobile)) {
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                return false;
            }
        }

        function resendcode() {
            var timesign = new Date().getTime() + timespan;
            var mobile = $("#mobile").val();
            if (mobile == null || mobile.length == 0) {
                $.formValidator.setTipState(null, "onError", '请填写手机号码', 'mobile_Tip');
                return;
            }
            if (!validMobileFormat(mobile)) {
                $.formValidator.setTipState(null, "onError", '手机号码格式错误', 'mobile_Tip');
                return;
            }
            $.get("/sendregmobilecode",
    				{
    				    "mobile": mobile,
    				    "timesign": timesign,
    				    "p": getm32str(mobile, timesign + "")
    				},
    				function (result) {
    				    if (result == "1") {
    				        $("#resendcode_Tip").addClass("chenggong");
    				        $("#resendcode_Tip").html("确认码短信已发送到您的手机，请查收");
    				        resendtime = 180;
    				        countresent(resendtime);
    				    } else {
    				        $("#resendcode_Tip").removeClass("chenggong");
    				        $("#resendcode_Tip").html("");
    				        if (result == "5") {
    				            $.formValidator.setTipState(null, "onError", '该手机号码已被注册', 'mobile_Tip');
    				        } else {
    				            $.formValidator.setTipState(null, "onError", '手机号码格式错误', 'mobile_Tip');
    				        }
    				    }
    				}, "html");
        }
        
    </script>
    <%--<iframe style="display: none" src="http://passport.flxxwang.com/submit" id="formSubmit" name="formSubmit"></iframe>--%>
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
