<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>
<%@ Import Namespace="Infomation.Core.Extensions" %>

<!DOCTYPE html>

<html>
<head>
    <%
        var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
        var city = ViewData["City"] as City;
        var infoCategory = this.ViewData["category"] as InfoCategory;
        var tid = routeData.Values["tid"];
    %>
    <title>发布<%=infoCategory.Name %>信息-<%=city.ShortName %><%=SiteInfo.Name%></title>
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
    
    <div id="header">
	    <a href="<%=Url.Action("Default","Home") %>" id="logo" target="_blank">
            <img src="/Content/Fenlei/assets/images/logo/logo.gif"  title="<%=SiteInfo.Name%>" alt="flxxwang.com" />
        </a>
	    <div class="bar_city"><h2><%=city.ShortName %></h2><span id="ipconfig">[<a target="_self" href="/<%=tid %>?changecity">切换城市</a>]</span></div>
        <div class="post_login">
      	    <div id="login">
                <a target="_self" href="<%=Url.Action("Login","My") %>">登录</a><span class="gap">|</span>
                <a target="_self" href="<%=Url.Action("Reg","My") %>">注册</a></div>
        </div>
    </div>

    <div class="flow_step_no3"> 
    <!-- s --> 
        <div class="flow_step"> 
            <ol class="cols5"> 
                <li class="step_1"><div><i>1</i><%=Html.ActionLink(infoCategory.Parent.Name, "Index", new {tid = routeData.Values["tid"] })%><span></span></div><em class="f1"></em></li>
                <li class="step_2"><div><i>2</i><%=Html.ActionLink(infoCategory.Name, "s2", new { values = this.ViewData["ParentCode"], tid = routeData.Values["tid"] })%><span></span></div></li>
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
            <ul class="post3">
                <%
                  foreach (var region in (this.ViewData["Regions"] as List<Framework.Common.Region>))
                  {
                      if (region.Circles.Count == 0)
                      {
                          %>
                          <li><%=Html.ActionLink(region.Name, "Post", this.ViewData["ParentCode"].ToString(), new { smallcategory = this.ViewData["ChildCode"], region = region.Id, tid = routeData.Values["tid"] }, null)%></li>
                          <%
                      }
                      else
                      {
                          %>
                            <li><%=Html.ActionLink(region.Name, "s4", new { values = this.ViewData["p"].ToString() + "/" + region.Id, tid = routeData.Values["tid"] })%></li>
                          <%
                      }
                   } 
                %>
            </ul>
            <div class="c"></div>
        </div>
        <div class="hr_s"></div>
        <div id="pre-next">
            <%=Html.ActionLink("«重新选择小类", "s2", new { values = this.ViewData["ParentCode"], tid = routeData.Values["tid"] })%>
            <%=Html.ActionLink("跳过，将信息发布到全"+city.ShortName+"»", "Post", this.ViewData["ParentCode"].ToString(), new { smallcategory = this.ViewData["ChildCode"], tid = routeData.Values["tid"] }, null)%>
        </div>
    </div>

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
