<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<JobSeek>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>下发面试邀请</title>
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/ui6/zp/windows.css" />
    <%--<script type="text/javascript" src="/Content/Fenlei/Scripts/5_1/jquery1.3.2.js"></script>--%>
    <script type="text/javascript" src="/Scripts/jquery-ui-1.9m6/jquery-1.6.2.js"></script>
    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>
    <script src="/Scripts/framework/db.js" type="text/javascript"></script>
    <script src="/content/fenlei/scripts/model.js" type="text/javascript"></script>

    <script type="text/javascript" src="/Content/Fenlei/Scripts/qy/formvalidator.js"></script>

    
</head>
<body>
<form>
    <%var company=this.ViewData["Company"] as Company; %>
  	<div class="box"  id="m1">
 	    <div  id="d1">
            <p align="center">
                您可以免费发送<strong class="red"> 2</strong>次面试邀请，
                您已发送<strong class="red">0</strong>次，
                还有<strong class="red">2</strong>次。
            </p>
        </div>
        <p class="font12" align="center">面试邀请会以手机短信、站内信两种方式发送，请先打电话给求职者再发送：</p>

        <table cellpadding="0" cellspacing="0" class="tablestyle">
            <tr>
                <th><b class="red">*</b>面试通知：</th>
                <td>
                    <textarea  name="entInvite"  id="entInvite" ><%=this.Model.Resume.RealName %>你好,请于明日早晨10点带上简历到<%=company.CompanyName %>面试,<%=company.Address %>,<%=company.ContactPerson %>,<%=company.Phone %></textarea>
                    <span id="entInvite_Tip"></span>
                </td>
            </tr>
            <tr><th ></th><td ></td></tr>
            <tr>
                <th></th>
                <td>
                    <input  id="btn_send" type="button"   value="发送"  class="btn-v2" onclick="submitForm(this)"  />
                </td>
            </tr>
        </table>
    <br />
</div>
    <script language="javascript" type="text/javascript">
        //var jq = jQuery.noConflict();
        $(document).ready(function () {
            $.formValidator.initConfig({ formid: "", errorfocus: true, btnid: '' });
            $("#entInvite")
		.formValidator({ onfocus: "请填写面试通知！" })
		.inputValidator({ onerror: "请填写面试通知！" })
		.regexValidator({ regexp: "^.{5,55}$", onerror: "面试通知为5-55个字！" });
        });
        function checkInput() {
            return $.formValidator.pageIsValid();
        }
        function sendinvite(btn) {
            var interview = new Interview();
            interview.Id = -1;
            interview.UserId=<%=company.UserId %>;
            interview.JobSeekId=<%=this.Model.Id %>;
            interview.ResumeId=<%=this.Model.Resume.Id %>;
            interview.ToUserId=<%=this.Model.UserId %>;
            interview.Content=$("#entInvite").val();
            interview.DateCreated=new Date().toJson(true);
            interview.DateModified=new Date().toJson(true);

            interview.Insert(function () {
                btn.value = "发送";
                btn.disabled = "";
                alert("发送成功");
            }, function () {
                alert("发送失败");
            });
        }
        function submitForm(btn) {
            if (checkInput()) {
                btn.disabled = "disabled"; 
                btn.value = "发送中....";
                sendinvite(btn);
            }
        }
</script>
     </form>

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

</body>
</html>
