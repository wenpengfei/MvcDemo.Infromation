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
    <link rel="shortcut icon" href="/content/fenlei/assets/images/favicon.ico" />
	<link href="/Content/Fenlei/Scripts/comm_js/post_version.css" type="text/css" rel="stylesheet" />
    <title>免费发布信息-<%=city.ShortName%><%=SiteInfo.Name%></title>
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
                <a target="_self" href="<%=Url.Action("Reg","My") %>">注册</a>
            </div>
        </div>
    </div>

    <div class="flow_step_no1"> 
        <!-- s --> 
        <div class="flow_step">
            <ol class="cols5">
                <li class="step_1"><div><i>1</i>选择大类<span></span></div><em class="f1"></em></li>
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
        <style type="text/css">.current .ym-submnu{display:block;}</style>
        <div class="content minheight" id="ymenu-side">
            <div id="hyts" style="display:none; background:#f7f7f7;  margin:10px 17px 10px 2px; width:936px;">
                <div style="background:#fffed6; width:914px;  padding:5px 10px; border:1px solid #dddddd; position:relative; top:-2px; margin-left:-2px; line-height:26px; font-size:14px; overflow:hidden; color:red;"> 
                    <span style="color:#b66403; font-size:20px; _font-size:13px; _font-weight:bold; font-weight:bold; float:right; display:inline-block; cursor:pointer" onclick="document.getElementById('hyts').style.display='none'">&times;</span>
                    2011年迎春贺喜：凡成功发布信息的用户，均可参与<%=SiteInfo.Name%>“免费送50张机票800张火车票”抽奖活动！                  
                </div>                
            </div>
            <ul class="ym-mainmnu">
                <li class="ym-tab">
                    <%var houseCategory = InfoCategory.GetCategory<HouseCategory>(); %>
                    <%=Html.ActionLink(houseCategory.Name,"s2","post",new{values=houseCategory.Code,tid=routeData.Values["tid"]},null) %>
                    <ul class="ym-submnu">
                        <%
                            foreach (var item in houseCategory.Children)
                            {
                                %>
                                    <li><%=Html.ActionLink(item.Name, "s3", "post", new { values = "" + houseCategory.Code + "/" + item.Code + "", tid = routeData.Values["tid"] }, null)%></li>
                                <%
                            }
                        %>
                    </ul>
                </li>
                <li class="ym-tab"><a class="over">免费招聘</a>
                    <ul class="ym-submnu">
                        <li>
                            <%=Html.ActionLink("全职招聘", "s2", "post", new { values = "zhaopin", tid = routeData.Values["tid"] }, null)%>
                        </li>
                        <li>
                            <%=Html.ActionLink("兼职招聘", "s2", "post", new { values = "zhaopinjz", tid = routeData.Values["tid"] }, null)%>
                        </li>
                        <%--<li>
                            <%=Html.ActionLink("招聘会", "s2", "post", new { values = "zhaopinhui" }, null)%>
                        </li>--%>
                    </ul>
                </li>
                <li class="ym-tab">
                    <% var saleCategory = InfoCategory.GetCategory<SaleCategory>(); %>
                    <%=Html.ActionLink(saleCategory.Name, "s2", "post", new { values = saleCategory.Code, tid = routeData.Values["tid"] }, null)%>
                    <ul class="ym-submnu">
                    <%
                        foreach (var item in saleCategory.Children)
                        {
                            %>
                                <li><%=Html.ActionLink(item.Name, "s3", "post", new { values = "" + saleCategory.Code + "/" + item.Code + "", tid = routeData.Values["tid"] }, null)%></li>
                            <%
                        }
                     %>
                    </ul>
                </li>
                <li class="ym-tab"><a class="over">求职简历</a>
                    <ul class="ym-submnu">
                        <li>
                            <%=Html.ActionLink("全职简历", "s2", "post", new { values = "qiuzhi", tid = routeData.Values["tid"] }, null)%>
                        </li>
                        <li>
                            <%=Html.ActionLink("兼职简历", "s2", "post", new { values = "qiuzhijz", tid = routeData.Values["tid"] }, null)%>
                        </li>
                    </ul>
                </li>
                <li class="ym-tab">
                    <%var carCategory = InfoCategory.GetCategory<CarCategory>(); %>
                    <%=Html.ActionLink(carCategory.Name, "s2", "post", new { values = carCategory.Code, tid = routeData.Values["tid"] }, null)%>
                    <ul class="ym-submnu">
                        <%
                            foreach (var item in carCategory.Children)
                            {
                                %>
                                <li><%=Html.ActionLink(item.Name, "s3", "post", new { values = "" + carCategory.Code + "/" + item.Code + "", tid = routeData.Values["tid"] }, null)%></li>
                                <%
                            }
                         %>
                    </ul>
                </li>
                
                 <li class="ym-tab">
                    <%var shengHuoCategories = InfoCategory.GetCategory(YellowPageBigType.ShengHuo); %>
                    <%=Html.ActionLink(YellowPageBigType.ShengHuo.DisplayName(), "s2", "post", new { values = YellowPageBigType.ShengHuo.ToString(), tid = routeData.Values["tid"] }, null)%>
                    <ul class="ym-submnu">
                        <%
                            foreach (var item in shengHuoCategories)
                            {
                                %>
                                    <li><%=Html.ActionLink(item.Name, "s3", "post", new { values = "" + item.Parent.Code + "/" + item.Code + "", tid = routeData.Values["tid"] }, null)%></li>
                                <%
                            }
                        %>
                    </ul>
                </li>
                
               
                <li class="ym-tab">
                    <%var petCategory = InfoCategory.GetCategory<PetCategory>(); %>
                    <%=Html.ActionLink(petCategory.Name, "s2", "post", new { values = petCategory.Code, tid = routeData.Values["tid"] }, null)%>
                    <ul class="ym-submnu">
                        <%
                            foreach (var item in petCategory.Children)
                            {
                                %>
                                <li><%=Html.ActionLink(item.Name, "s3", "post", new { values = "" + petCategory.Code + "/" + item.Code + "", tid = routeData.Values["tid"] }, null)%></li>
                                <%
                            }
                        %>
                    </ul>
                </li>
                
                  <li class="ym-tab">
                    <%var shangWuCategories = InfoCategory.GetCategory(YellowPageBigType.ShangWu); %>
                    <%=Html.ActionLink(YellowPageBigType.ShangWu.DisplayName(), "s2", "post", new { values = YellowPageBigType.ShangWu.ToString(), tid = routeData.Values["tid"] }, null)%>
                    <ul class="ym-submnu">
                        <%
                            foreach (var item in shangWuCategories)
                            {
                                %>
                                <li><%=Html.ActionLink(item.Name, "s3", "post", new { values = "" + item.Parent.Code + "/" + item.Code + "", tid = routeData.Values["tid"] }, null)%></li>
                                <%
                            }
                        %>
                    </ul>
                </li>
               
                <li class="ym-tab">
                    <%var ticketCategory = InfoCategory.GetCategory<TicketCategory>(); %>
                    <%=Html.ActionLink(ticketCategory.Name, "s2", "post", new { values = ticketCategory.Code, tid = routeData.Values["tid"] }, null)%>
                    <ul class="ym-submnu">
                        <%
                            foreach (var item in ticketCategory.Children)
                            {
                                %>
                                <li><%=Html.ActionLink(item.Name, "s3", "post", new { values = "" + ticketCategory.Code + "/" + item.Code + "", tid = routeData.Values["tid"] }, null)%></li>
                                <%
                            }
                         %>
                    </ul>
                </li>
                <li class="ym-tab">
                    <%var eduCategory = InfoCategory.GetCategory<EduCategory>(); %>
                    <%=Html.ActionLink(eduCategory.Name, "s2", "post", new { values = eduCategory.Code, tid = routeData.Values["tid"] }, null)%>
                    <ul class="ym-submnu">
                        <%
                            foreach (var item in eduCategory.Children)
                            {
                                %>
                                <li><%=Html.ActionLink(item.Name, "s3", "post", new { values = "" + eduCategory.Code + "/" + item.Code + "", tid = routeData.Values["tid"] }, null)%></li>
                                <%
                            }
                        %>
                    </ul>
                </li>
                <li class="ym-tab">
                    <%var friendCategory = InfoCategory.GetCategory<FriendCategory>(); %>
                    <%=Html.ActionLink(friendCategory.Name, "s2", "post", new { values = friendCategory.Code, tid = routeData.Values["tid"] }, null)%>
                    <ul class="ym-submnu">
                        <% 
                            foreach (var item in friendCategory.Children)
                            {
                                %>
                                <li><%=Html.ActionLink(item.Name, "s3", "post", new { values = "" + friendCategory.Code + "/" + item.Code + "", tid = routeData.Values["tid"] }, null)%></li>
                                <%
                            }
                        %>
                    </ul>
                </li>
                <li class="ym-tab">
                    <%var lvYouXiuXianCategories = InfoCategory.GetCategory(YellowPageBigType.LvYouXiuXian); %>
                    <%=Html.ActionLink(YellowPageBigType.LvYouXiuXian.DisplayName(), "s2", "post", new { values = YellowPageBigType.LvYouXiuXian.ToString(), tid = routeData.Values["tid"] }, null)%>
                    <ul  class="ym-submnu">
                        <% 
                            foreach (var item in lvYouXiuXianCategories)
                            {
                                %>
                                <li><%=Html.ActionLink(item.Name, "s3", "post", new { values = "" + item.Parent.Code + "/" + item.Code + "", tid = routeData.Values["tid"] }, null)%></li>
                                <%
                            }
                        %>
                    </ul>
                </li>
                <li class="ym-tab">
                    <%var zhaoShangCategories = InfoCategory.GetCategory(YellowPageBigType.ZhaoShang); %>
                    <%=Html.ActionLink(YellowPageBigType.ZhaoShang.DisplayName(), "s2", "post", new { values = YellowPageBigType.ZhaoShang.ToString(), tid = routeData.Values["tid"] }, null)%>
                    <ul  class="ym-submnu">
                        <%
                            foreach (var item in zhaoShangCategories)
                            {
                                %>
                                <li><%=Html.ActionLink(item.Name, "s3", "post", new { values = "" + item.Parent.Code + "/" + item.Code + "", tid = routeData.Values["tid"] }, null)%></li>
                                <%
                            }
                        %>
                    </ul>
                </li>
            </ul>
            <div class="c"></div>
            <div class="psearch">
                <div class="pshead">
                    <em>搜索栏</em>
                    <input type="text" defaultvalue="请输入关键字查找您要发布的分类" class="pstxt" id="cateKey">
                    <input type="button" value="查找类别"  class="psbtn" id="btn_cateSearch">
                </div>
                <div id="psbox" class="psbox" style="display:none;">
                	<ul></ul>
                </div>
                <div id="cateSearch_cannel" class="pscannel" style="display:none;"><em>取消</em></div>
            </div>
        </div>
        <div class="hr_s"></div>
    </div>
<script type="text/javascript">
    // 获取url参数值
    function getParameter(sProp) {
        var re = new RegExp(sProp + "=([^\&]*)", "i");
        var a = re.exec(document.location.search);
        if (a == null) return null;
        return a[1];
    }

    //    // 是否为测试
    //    function isTesting() {
    //        return getParameter('debug') == 1;
    //    }

    //    // 统计发布历史的点击次数
    //    function statHistory() {
    //        try {
    //            _gaq.push(['pageTracker._trackEvent', 'post', 'click', 'history']);
    //        } catch (e) { };
    //    }
</script>

<script language="javascript" type="text/javascript">

    // 提示用户没有找到
    function showNotFind() {
        var key = $('#cateKey').val();
        $('#psbox ul').append('<li>抱歉，没有找到“<i>' + key + '</i>”相关的类别。您可以<a href="http://about.flxxwang.com/LeaveWord.aspx?categid=6" target="_blank">与<%=SiteInfo.Name%>对话</a>反馈或者换个词试试</li>');
    }

    // 提示用户错误
    function showSearchErr(data) {
        var key = $('#cateKey').val();
        $('#psbox ul').append('<li>抱歉，' + (data == '-1' ? '查询超时' : '服务异常') + '。您可以<a href="http://about.flxxwang.com/LeaveWord.aspx?categid=6" target="_blank">与<%=SiteInfo.Name%>对话</a>反馈或者重新尝试</li>');
    }

    // ------------- 类别搜索 START
    function showSearch(data) {
        $('#psbox').show();
        $('#cateSearch_cannel').slideDown('fast');
        if (data == '') {
            showNotFind();
            return;
        }

        if (data == "-1" || data == "-2") {
            _gaq.push(['pageTracker._trackEvent', '58_post', 's1_search_timeout', $('#cateKey').val()]);
        }

        if (isTesting()) {
            if (data == "-1" || data == "-2") {
                showSearchErr(data);
                return;
            }
        } else {
            if (data == '-1') {
                showNotFind();
                return;
            }
        }

        var arrGroup = data.split('|');
        $('#psbox ul').append('<li>找到与“' + $('#cateKey').val() + '”相关的类别共 <b>' + arrGroup.length + '</b> 个：</li>');
        $(arrGroup).each(function (i, n) {
            var item = n.split(',');
            $('#psbox ul').append('<li><a href="/t/' + item[1] + '">' + item[0] + '</a></li>');
        });
        highlight($('#cateKey').val());
        document.documentElement.scrollTop = document.documentElement.scrollHeight;
    }
    $(document).ready(function () {
        $('#cateKey').bind('keypress', function (evt) {
            if (evt.keyCode == 13) {
                $('#btn_cateSearch').get(0).click();
                return;
            }
        });
        var _querying = false; // 是否正在查询中
        $('#btn_cateSearch').bind('click', function () {
            var key = $('#cateKey').val();
            var defaultVal = $('#cateKey').attr('defaultvalue');
            if (key == '' || key == defaultVal) {
                $('#cateKey').focus();
                return;
            }
            if (_querying) return;
            _querying = true;
            $('#psbox ul').empty();
            $('#psbox ul').append('<li>正在查询中，请稍后……</li>');
            try {
                $.ajax({
                    url: '/ajax/?action=getrelatedword&cityid=' + ____json4fe.locallist.dispid + '&cateKey=' + encodeURIComponent(key),
                    type: 'get',
                    cache: false,
                    success: function (data) {
                        $('#psbox ul').empty();
                        showSearch(data);
                        _querying = false;
                        //统计代码 2010-12-15
                        _gaq.push(['pageTracker._trackEvent', '58_post', 's1_search', $('#cateKey').val()]);
                    },
                    error: function (data) {
                        $('#psbox ul').empty();
                        _querying = false;
                    }
                });
            } catch (e) { }
        });
        // 取消事件
        $('#cateSearch_cannel').bind('click', function () {
            $('#psbox').slideUp('fast');
            $('#cateSearch_cannel').hide();
            $('#cateKey').select();
        });
        // 搜索框
        $('#cateKey').val($('#cateKey').attr('defaultvalue'));
        $('#cateKey').bind('focus', function () {
            var _d = $(this).attr('defaultvalue');
            if (_d == $(this).val()) {
                $(this).val('');
                $(this).attr('style', 'color:black');
            }
        }).bind('blur', function () {
            var _d = $(this).attr('defaultvalue');
            if ($(this).val() == '') {
                $(this).val(_d);
                $(this).removeAttr('style');
            }
        });
    });
    // 标红
    function highlight(key) {
        var item = jQuery("#psbox a:contains('" + key + "')");
        item.each(function () {
            var it = jQuery(this);
            it.html(it.html().replace(key, '<font style="color:red;">' + key + '</font>'));
        });
    }
    // ------------- 类别搜索 END

    var BrowserUtil = { navi: navigator.userAgent.toLowerCase(), isIE: function () { var B = this; return (B.navi.indexOf("msie") != -1) && (B.navi.indexOf("opera") == -1) && (B.navi.indexOf("omniweb") == -1) }, isIE7: function () { var B = this; return (B.navi.indexOf("msie") != -1) && (B.navi.indexOf("msie 7") != -1) && (B.navi.indexOf("opera") == -1) && (B.navi.indexOf("omniweb") == -1) }, isMaxthon: function () { var B = this; return (B.navi.indexOf("msie") != -1) && (B.navi.indexOf("maxthon") != -1) && (B.navi.indexOf("opera") == -1) && (B.navi.indexOf("omniweb") == -1) }, isMaxthon2: function () { var B = this; return (B.navi.indexOf("msie") != -1) && (B.navi.indexOf("maxthon 2") != -1) && (B.navi.indexOf("opera") == -1) && (B.navi.indexOf("omniweb") == -1) }, getBody: function () { return (document.compatMode && document.compatMode != "BackCompat") ? document.documentElement : document.body }, getScrollTop: function () { return this.isIE() ? this.getBody().scrollTop : window.pageYOffset }, getScrollLeft: function () { return this.isIE() ? this.getBody().scrollLeft : window.pageXOffset }, getxy: function (E) { var C = E.offsetTop; var B = E.offsetLeft; var A = E.offsetWidth; var D = E.offsetHeight; while (E = E.offsetParent) { C += E.offsetTop; B += E.offsetLeft } return { x: B, y: C, w: A, h: D} } };
    var topCurrentli;
    function nav_over(D) {
        //        if (topCurrentli != null) {
        //            D.style.top = topCurrentli;
        //        }
        var A = BrowserUtil.getxy(D);
        var L = (D.clientHeight);
        var G = BrowserUtil.getBody().clientHeight;
        var I = G + BrowserUtil.getScrollTop();
        var F = document.getElementById("YMenu-side");
        if ((A.y + L) > I - 10) {
            if (D.style.top > (I - (A.y + L)) - 10) {
                D.style.top = (I - (A.y + L)) - 10 + "px";
            }
        }
    }
    /**
    * 延迟显示插件lazyShow
    */
    (function (a) { a.fn.lazyShow = function (c) { var b = a.extend({ current: "hover", delay: 10 }, c || {}); a.each(this, function () { var f = null, e = null, d = false; a(this).bind("mouseover", function () { if (d) { clearTimeout(e) } else { var g = a(this); f = setTimeout(function () { g.addClass(b.current); nav_over(g.find(".ym-submnu").get(0)); d = true }, b.delay) } }).bind("mouseout", function () { if (d) { var g = a(this); e = setTimeout(function () { g.removeClass(b.current); d = false }, b.delay) } else { clearTimeout(f) } }) }) } })(jQuery);
    // 自动切换超链接
    $(document).ready(function () {
        $("#ymenu-side > .ym-mainmnu > .ym-tab").lazyShow({ current: "current", delay: 120 });
        var _host = location.host;
        var reg = new RegExp('post(\\d+).flxxwang.com');
        if (!reg.test(_host)) return;
        $('#ymenu-side ul li a').each(function (i) {
            var _url = $(this).attr('href');
            if (_url) {
                _url = _url.replace(new RegExp('post.flxxwang.com', 'i'), _host);
                $(this).attr('href', _url);
            }
        });
    });
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
