<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
<link rel="stylesheet" href="/content/fenlei/ui6/post/post_6.css" type="text/css" media="all" />
<script type="text/javascript" src="/Scripts/jquery-ui-1.9m6/jquery-1.6.2.js"></script>
<%--<script type="text/javascript">    try { var ____json4fe = { catentry: { dispid: '', name: '', listname: '' }, locallist: { dispid: '79', name: '杭州', listname: 'hz' }, modules: 'my', infoid: '8264041159048'} } catch (e) { };</script>--%>
<%--<script type="text/javascript" src="http://pic2.flxxwang.com/js/5_1/comm_js/boot_mypage_version.js"></script>--%>
<%--<script>    document.domain = "flxxwang.com";</script>--%>
<%--<script>
    $(document).ready(function () {
        $(".fx").hover(
	  function () {
	      $(this).addClass("hover");
	  },
	  function () {
	      $(this).removeClass("hover");
	  }
	);
    });
    var infostate = 1; 
</script>--%>
<title>信息发布成功-<%=SiteInfo.Name%></title>
<style>
.tuan sup, .arrow, #minsearch, #myfeet li, #minsearchsearchbtn, #topbar, .msgTips_arrow, .msgTips_close, .msgTips_con, .ntTips_con { background-image:url(/Content/Fenlei/assets/images/topbar.png)!important }/* topbarBg */
#login { float:right; line-height:33px; padding:0 8px; position:relative; top:48px; }
#login span{ margin:0 5px;}
.msgTips { position:absolute; z-index:999; color:#000; top:31px; left:0; _overflow-x:hidden; border:solid 1px #e7d95f; border-radius:2px; -moz-border-radius:2px; -webkit-border-radius:2px; padding:0 1px 1px 1px; background:#fefacc; width:232px }
.msgTips_arrow { position:absolute; top:-7px; left:14px; width:14px; height:8px; z-index:9; background-position:0 -242px }
.msgTips_con { border-top:1px solid #fff; background:url() no-repeat 5px -252px; line-height:20px; padding:5px 20px 5px 25px }
.msgTips .shadow { border-top:none; bottom:-2px; background:#dedede }
.msgTips_close { position:absolute; right:8px; top:11px; width:10px; height:11px; overflow:hidden; background-position:0 -229px; cursor:pointer; z-index:999 }/* nTalker */
.ntTips { right:-84px; width:170px }
.ntTips_con { padding:5px 20px 5px 5px; line-height:20px; background:url() no-repeat 0 -9999px #FFFBCC }
.ntTips_con .num { color:#FD7A0E; font:bold 14px Arial, sans-serif; margin-right:3px }
#topbar .ntTips_con a { color:#00c; text-decoration:none }
</style>

</head>
<body>
<div id="warper">
	<div id="header">
		<a href="<%=Url.Action("Default","Home") %>" id="logo" ><img src="/content/fenlei/assets/images/logo/logo.gif" alt="中文最大生活信息门户"/></a>
		<div id="cityname" class="loginname"><span>免费发布信息</span></div>
		<div id="login"></div>
		<%--<script>
		    fe.business.user.containerid = 'login';
		    fe.business.user.show();
		</script>--%>
		<div id="logintext" style="right:-10px;">
            <a href="<%=Url.Action("Default","Home") %>">返回首页</a>
            <%--|<a href="http://about.flxxwang.com/v5/" target="_blank">帮助</a>--%>
        </div>
	</div>
		<div style="padding-top: 0pt;" class="content">
		<div class="box win560">
				<h1><span class="success-icon"></span>恭喜您，信息发布成功！</h1>
			<ul class="list">
                <%--<li>您已经申请<a href='http://about.flxxwang.com/117.html#b' target="_blank">电话转接</a>功能，请查看手机短信确认开通</li>--%>									
			</ul>
			<div class="clearfix post-btn">
                <a href="/<%=ViewData["InfoUrl"]%>" class="post-btn-a" target="_blank" ><span>查看信息</span></a>
                <a href="<%=Url.Action("Index","My") %>" class="post-btn-a"><span>管理我发布的信息</span></a>
                <em><a href="<%=Url.Action("Index","post") %>" style="color:#0000CC">再发一条</a></em>
            </div>
		</div><!--box-->
		<div class="fix"></div>
		<%--<ul class="share clearfix">
			<li class="line"></li>
			<li class="s">你还可以：</li>
			<li>
				<div class="fx" style="color:#1a1a1a;">
					分享信息
					<div class="hc" id="sharebox">
						<i class="shadow-t"></i>
						<ul class="clearfix">
							<li><a href="#" id='sinawb'>新浪微博</a></li>
							<li><a id='wy163' href="#">网易微博</a></li>
							<li><a href="#" id='sohuwhite'>搜狐白社会</a></li>
							<li><a href="#" id='sohuwb'>搜狐微博</a></li>
							<li><a href="#" id='qzone'>QQ空间</a></li>
							<li><a href="#" id='renren'>人人</a></li>
							<li><a href="#" id='139talk'>139说客</a></li>
							<li><a href="#" id='chouti'>抽屉网</a></li>
							<li><a href="#" id='tqq'>腾讯微博</a></li>
						</ul>
						<i class="shadow-b"></i>
					</div>
                    <script type="text/javascript">
                        var msg = '我在<%=SiteInfo.Name%>刚刚发布了一条：“神舟笔记本电脑”欢迎大家光临查看！ ';
                        var url = 'http://hz.flxxwang.com/diannao/8264041159048x.shtml';
                        var size = 'width=615,height=505';
                        var json = { cate: '二手电脑/配件', infoid: '8264041159048', title: '神舟笔记本电脑', url: url, city: 'hz', dirname: 'diannao', localname: '杭州' };
                        sharewb163('#wy163', url, msg, size, '<%=SiteInfo.Name%>', msg);
                        sharewbSina_define('#sinawb', json);
                        sharesohuwhite('#sohuwhite', url, msg, size, '', '');
                        sharesohuwb('#sohuwb', url, msg, size, '', '', '');
                        shareqq('#qzone', url, msg, '', '', '');
                        sharerenren('#renren', url, msg, 'width=626,height=436', '', '');
                        share139('#139talk', url, msg, 'width=490,height=340', '', '');
                        shareqqwb("#tqq", url, msg);
                        sharechouti("#chouti", url, msg);
                    </script>
				</div>
			</li>
        </ul>--%>
        <!--share-->
		<%--<div class="zd" id='divzhiding'></div>
		<script>
		    function setTopState(infoid, topState, isCanTop) {
		        if (isCanTop) {
		            if (topState == 0) {
		                var str = '<strong>置顶该信息将获得更多关注！</strong><div class="zd-iframe"><iframe frameborder="0" id="frm8264041159048" scrolling="no" src="http://infotopweb.union.vip.flxxwang.com/infotopnet/trytop/8264041159048/2/0" style="width:100%; margin:10px auto 0px; height: 0px; border: 0px;" visible="false"></iframe></div>';
		                $("#divzhiding").html(str);
		            }
		        }
		    }
		    (function () {
		        boot.require('util.js', function (Frame, js) {
		            src1 = 'http://infotopweb.union.vip.flxxwang.com/infotopnet/gettopstatejs?m=setTopState&infoids=8264041159048';
		            js.append(src1, function () { });
		        });
		    })()
		</script>--%>
	</div><!--content-->
	<div id="footer">
	    &copy; flxxwang.com 
        <%--<a id="askicon" target="_blank" title="有问题请与<%=SiteInfo.Name%>客服进行对话" href="http://about.flxxwang.com/v5/">帮助中心</a>--%>
	</div>
</div>
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
