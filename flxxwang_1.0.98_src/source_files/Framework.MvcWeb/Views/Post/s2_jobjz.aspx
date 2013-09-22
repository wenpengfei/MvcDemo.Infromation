<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>

<!DOCTYPE html>

<html>
<head>
    <%
        var city = ViewData["City"] as City;
        var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
        var tid = routeData.Values["tid"];
    %>
    <title>发布兼职招聘信息-<%=city.ShortName %><%=SiteInfo.Name%></title>
    <script type="text/javascript">
        var userid = 'login';
        try {
            var ____json4fe = {
                catentry: [
                { oid: '577', dispid: '13941', name: '兼职招聘', listname: 'jianzhi' },
                { oid: '577', dispid: '13941', name: '兼职招聘', listname: 'jianzhi' },
                { dispid: '', name: '', listname: 'post' }
                ],
                locallist: { dispid: '79', name: '杭州', listname: 'hz' },
                modules: 'postpage'
            } 
        } catch (e) { }; </script>
 <script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/1.js"></script>
 <script type="text/javascript" src="/Scripts/jquery-1.5.1.js"></script>
 <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
 <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
<script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
<script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>

 <script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/boot_postpage_version.js"> </script>
 <script type="text/javascript">
     var __jsoninfo = { city: '<%=routeData.Values["city"] %>', tid: '<%=routeData.Values["tid"] %>' };
 </script>
    <link rel="shortcut icon" href="/content/fenlei/assets/images/favicon.ico" />
    <link href="/Content/Fenlei/Scripts/comm_js/post_version.css" type="text/css" rel="stylesheet" />

</head>
<body>
    <%var jobCategories = this.ViewData["categories"] as IEnumerable<JobCategory>; %>
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

<div class="flow_step_no2">
    <!-- s -->
    <div class="flow_step">
        <ol class="cols5">
            <li class="step_1"><div><i>1</i><a href='<%=Url.Action("Index",new{tid=routeData.Values["tid"]}) %>'>兼职招聘</a><span></span></div><em class="f1"></em></li>
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
<div class="job_c_list">
    <%
        foreach (var job in jobCategories)
        {
            %>
                <dl>
                    <dt><%=job.Name %>：</dt>
                    <dd>
                        <%
                            foreach (var item in job.ObjectTypeCollection)
                            {
                                %>
                                    <%=Html.ActionLink(item.Name, "Post", this.ViewData["ParentCode"].ToString(), new { smallcategory = job.Code, objecttype = item.Id, tid = routeData.Values["tid"] }, null)%>
                                <%
                            }
                        %>
                    </dd>
                </dl>
            <%
        }
    %>
</div>
<div class="c"></div>
<div class="otherzw">如果没有找到您想要的职位，请将信息发布在 “<a para="13951,13609,1">其他兼职工作</a>” 里。</div>
</div><div class="hr_s"></div>
<script type="text/javascript">
    // 修改链接
    $(document).ready(updateLink);
    function updateLink() {
        try {
            var index = getCateidIndex();
            if (index > -1) {
                $('a[para]').each(function (i, n) {
                    var v1 = $(this).attr('para');
                    if (!!v1) {
                        var arr = v1.split(',');
                        if (arr.length == 3) {
                            var url = '/79/' + $.trim(arr[index]) + '/s5/?para=' + $.trim(arr[2]);
                            $(this).attr('href', url);
                        }
                    }
                });
            }
        } catch (e) { };
    }

    // 获取类别索引
    function getCateidIndex() {
        var index = -1;
        var name = ____json4fe.catentry[0].name;
        if (name == '全职招聘' || name == '兼职招聘') {
            index = 0;
        } else if (name == '求职信息' || name == "找兼职") {
            index = 1;
        }
        return index;
    }
</script>

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
