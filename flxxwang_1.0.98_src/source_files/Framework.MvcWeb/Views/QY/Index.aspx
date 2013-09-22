<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Company>" %>
<%@ Import Namespace="Infomation.Core" %>
<%@ Import Namespace="Framework.Extensions" %>
<!DOCTYPE html>

<html>
<head>
    <title>【<%=this.Model.CompanyName %>】-<%=SiteInfo.Name%></title>
    <meta name="Keywords" content="<%=this.Model.CompanyName %>" /> 
    <meta name="Description" content="<%=this.Model.Content %>" /> 
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/ui6/zp/qy20110714.css" />
    <link rel="shortcut icon" href="/content/fenlei/assets/images/favicon.ico" />
    <%--<script type="text/javascript" src="/Content/Fenlei/Scripts/5_1/jquery1.3.2.js"></script>--%>
    <script type="text/javascript" src="/Scripts/jquery-ui-1.9m6/jquery-1.6.2.js"></script>

    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>

    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>

    <%--<script>var ____json4fe = { catentry: { dispid: '', name: '', listname: 'content' }, locallist: [{ dispid: '1', name: '北京', listname: 'bj'}], modules: 'qy' }</script>--%>
    <script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/boot_qy_version.js"></script>
    <script type="text/javascript" src="/Content/Fenlei/Scripts/qy/common.js"></script>
    <script type="text/javascript">
        window.onerror = function () { return true; }
        function dyniframesize(iframename) {
            var pTar = null;
            if (document.getElementById) {
                pTar = document.getElementById(iframename);
            }
            else {
                eval('pTar = ' + iframename + ';');
            }
            if (pTar && !window.opera) {
                if (pTar.contentDocument && pTar.contentDocument.body.scrollHeight) {
                    pTar.height = pTar.contentDocument.body.scrollHeight + 8;
                }
                else if (pTar.Document && pTar.Document.body.scrollHeight) {
                    pTar.height = pTar.Document.body.scrollHeight + 8;
                }
            }
        }
    </script>

</head>
<body>
    <%
        var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
        var cityCode = Framework.Utility.CookieManager.GetCookie("city");
        if (string.IsNullOrWhiteSpace(cityCode))
        {
            cityCode = "bj";
        }
    %>
    <div id="header">
      <div id="headerinside"> 
        <a id="logo" href="<%=Url.Action("Default","Home",new{city=cityCode}) %>">
            <img title="<%=SiteInfo.Name%>首页" alt="flxxwang.com" src="/Content/Fenlei/assets/images/logo/minilogo.gif" />
        </a>
        <div id="navbar">
            <a href="<%=Url.Action("Default","Home",new{city=cityCode}) %>"><%=SiteInfo.Name%>首页</a><span class="gap">|</span>
            <a href="#">房产</a><span class="gap">|</span>
            <a href="#">招聘</a><span class="gap">|</span>
            <a href="#">物品交易</a><span class="gap">|</span>
            <a href="#">二手车买卖</a><span class="gap">|</span>
            <a href="#">生活黄页</a><span class="gap">|</span>
            <a href="#">交友活动</a><span class="gap">|</span>
            <a href="#" class="light">团购<cite></cite></a><span class="gap">|</span>
            <a href="#"><%=SiteInfo.Name%>手机客户端!</a>
        </div>
        <div id="logintext"> 
            &nbsp; <a href="<%=Url.Action("Index","Post",new{city=cityCode}) %>" class="red">免费发布信息</a>
        </div>    
      </div>
    </div>
<div class="content">
	<div class="title">
        <h1><%=this.Model.CompanyName %></h1>
        <span id="zhizhaoicon" class="rz"><cite class="hc" id="yz">营业执照已验证</cite></span>
	</div>
    <div class="menu">
    	<ul class="menucon">
        	<li><a href="javascript:void(0);" class="selected"><span>首页</span></a></li>
            <li><a href="#"><span>公司简介</span></a></li>
            <li><a href="#"><span>招聘职位</span></a></li>
            <li><a href="#"><span>联系方式</span></a></li>
            <li><a href="#"><span>最近访客</span></a></li>
        </ul>
        <span class="c1"></span><span class="c2"></span>
    </div>
    <div class="about fl">
    	<table cellpadding="0" cellspacing="0" class="a_list">
        	<tr>
        		<th>公司规模：</th>
        		<td><%=this.Model.Size.DisplayName%></td>
		    </tr>
            <tr>
            	<th>公司性质：</th>
            	<td><%=this.Model.Type.Name %></td>
            </tr>
            <tr>
            	<th>公司行业：</th>
            	<td><%=this.Model.Trade.Name %></td>
            </tr>
            <tr>
            	<th>联 系&nbsp; 人：</th>
            	<td><%=this.Model.ContactPerson %></td>
            </tr>
            <tr>
            	<th>联系地址：</th>
            	<td><%=this.Model.Address %></td>
            </tr>
        </table>
    </div>
    <div class="some fr">
    	<div class="main">
        	<h2>公司介绍</h2>
            <span class="c3"></span><span class="c4"></span>
        </div>
        <div class="box">
        	<p class="somecon">
                <%=this.Model.Content %>
                <a href="#" class="m_con">更多&raquo;</a>
            </p>
            <%--</p>--%>
        </div>
    </div>
    <div class="clear"></div>
    <div class="main">
		<h2>招聘职位</h2>
        <a href="#" class="more">更多招聘信息&raquo;</a>
		<span class="c3"></span><span class="c4"></span>
	</div>
	<div class="box">
        <iframe width="100%" scrolling="no" style="background-color:White;" id="fJobList" name="fJobList" 
	    	onload="dyniframesize('fJobList')" src="<%=Url.Action("position", "QY", new {id=routeData.Values["id"],type="full" })%>" frameborder="0">
	    </iframe>
        
	</div>
    <div class="footad">
        <%--<div id="googlead_list" style="width:650px;float:left;margin-right:20px;">
        </div>--%>
        <%--<div style="float:left;width:300px;height:250px;padding-top:12px">--%>
        <div style="float:left;padding-top:12px">
            <%--广告位置--%>

            <%
                if (SiteInfo.IsTaojen)
                {
                    %>
                    <%--960*90首页横幅--%>
                    <%=UnionAd.Baidu_960_90.Code %>
                    <%
                }
                else
                {
                    %>
                    <%--728 x 90 - 首页横幅--%>
                    <%=UnionAd.Google_728_90.Code %>
                    <%    
                }
            %>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="footer">
    申明：该信息由用户自行发布，其所涉及内容由用户负责，信息真实性请用户自行辨识。<%--请注意查看用户是否通过<%=SiteInfo.Name%>营业执照验证。--%><br />
    &copy; 2010 flxxwang.com 
    <%--<a target="_blank" href="http://about.flxxwang.com/">帮助中心</a>--%>
</div>

    <script type="text/javascript">
        document.getElementById('zhizhaoicon').onmouseover = function () {
            document.getElementById('yz').className = '';
        };
        document.getElementById('zhizhaoicon').onmouseout = function () {
            document.getElementById('yz').className = 'hc';
        };
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

</body>
</html>
