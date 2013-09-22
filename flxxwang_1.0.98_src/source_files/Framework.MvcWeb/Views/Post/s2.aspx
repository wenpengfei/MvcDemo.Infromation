<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>
<%@ Import Namespace="Infomation.Core.Extensions" %>

<!DOCTYPE html>

<html>
<head>
    <%
        var city = ViewData["City"] as City;
        var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
        var tid = routeData.Values["tid"];
    %>
    <title>发布二手市场信息-<%=city.ShortName %><%=SiteInfo.Name%></title>
    <script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/1.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.5.1.js"></script>
    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>

    <script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/boot_postpage_version.js"></script>
    <script type="text/javascript">
        var __jsoninfo = { city: '<%=routeData.Values["city"] %>', tid: '<%=routeData.Values["tid"] %>' };
    </script>
    <link rel="shortcut icon" href="/content/fenlei/assets/images/favicon.ico" />
	<link href="/Content/Fenlei/Scripts/comm_js/post_version.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <%var infoCategories = this.ViewData["categories"] as IEnumerable<InfoCategory>; %>
    <div id="header">
	    <a href="<%=Url.Action("Default","Home") %>" id="logo" target="_blank">
            <img src="/Content/Fenlei/assets/images/logo/logo.gif"  title="<%=SiteInfo.Name%>" alt="flxxwang.com" />
        </a>
	    <div class="bar_city"><h2><%=city.ShortName %></h2><span id="ipconfig">[<a target="_self" href="/<%=tid %>?changecity">切换城市</a>]</span></div>
        <div class="post_login">
            <div id="login">
                <a target="_self" href="<%=Url.Action("Login","My") %>">登录</a><span class="gap">|</span>
                <a target="_self" href="<%=Url.Action("Reg","My") %>">注册</a>
            </div>
        </div>
    </div>

    <div class="flow_step_no2"> 
        <!-- s --> 
        <div class="flow_step"> 
            <ol class="cols5">
                <li class="step_1"><div><i>1</i><%=Html.ActionLink(infoCategories.First().Parent.Name, "Index", new { tid = routeData.Values["tid"] })%><span></span></div><em class="f1"></em></li>
                <li class="step_2"><div><i>2</i>选择小类<span></span></div></li>
                <li class="step_3"><div><i>3</i>选择区域<span></span></div></li>
                <li class="step_4"><div><i>4</i>选择商圈<span></span></div></li>
                <li class="step_5"><div><i>5</i>填写信息<span></span></div><em class="f2"></em></li>
            </ol> 
        </div> 
        <!-- e --> 
    </div>

    <div class="minheightout w">
        <div class="c"></div>
        <div class="content minheight">
            <ul class="post2">
            <%
                foreach (var item in infoCategories)
                {
                    %>
                    <li><%=Html.ActionLink(item.Name, "s3", "post", new { values = "" + item.Parent.Code + "/" + item.Code + "", tid = routeData.Values["tid"] }, null)%></li>
                    <%
                }
            %>
            </ul>
            <div class="c"></div>
        </div>
        <div class="hr_s"></div>
        <div id="pre-next">
            <%=Html.ActionLink("«重新选择大类", "Index", new { tid = routeData.Values["tid"] })%>
        </div>
    </div>

<%--<script type="text/javascript" language="javascript">

    var hidCateIds = new Array(14009, 14010);
    var links = document.getElementsByTagName("A");
    for (var j = 0; j < links.length; j++) {
        for (var i = 0; i < hidCateIds.length; i++) {
            var str = "/" + hidCateIds[i] + "/s2";
            var reg = new RegExp(str);
            if (reg.test(links[j].href)) {
                links[j].parentNode.style.display = "none";
            }
        }
    }

    // 跳转至第二步
    function postjump2() {
        $('ul.post2 li a').each(function (i, n) {
            var _text = $(n).html();
            var r = false;
            var arr = ['求租房', '短租房/日租房', '生意/商铺转让', '写字楼', '厂房/仓库/土地'];
            if (jQuery.inArray(_text, arr) != -1) {
                var v1 = $(n).attr('href');
                v1 = v1.replace('/s5', '/s2');
                $(n).attr('href', v1);
            }
        });
    }

    $(document).ready(postjump2);
</script>--%>

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

    <div id="footer">
        &copy; 2010 flxxwang.com 
        <%--<a href="http://about.flxxwang.com/v5/">帮助中心</a>--%>
    </div>
</body>
</html>
