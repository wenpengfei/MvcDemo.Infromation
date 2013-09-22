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
    <title>发布全职招聘信息-<%=city.ShortName %><%=SiteInfo.Name%></title>
     <script type="text/javascript">
         var userid = 'login';
         try {
             var ____json4fe = {
                 catentry: [
                 { oid: '574', dispid: '9224', name: '全职招聘', listname: 'job' },
                 { oid: '574', dispid: '9224', name: '全职招聘', listname: 'job' },
                 { dispid: '', name: '', listname: 'post' }
                ],
                 locallist: { dispid: '79', name: '杭州', listname: 'hz' },
                 modules: 'postpage'
             } 
            } catch (e) { }; 
     </script>
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
                <a target="_self" href="<%=Url.Action("Reg","My") %>">注册</a>
            </div>
      </div>
</div>

<div class="flow_step_no2">
    <!-- s --> 
    <div class="flow_step">
        <ol class="cols5">
            <li class="step_1"><div><i>1</i><a href='<%=Url.Action("Index",new{tid=routeData.Values["tid"]}) %>'>全职招聘</a><span></span></div><em class="f1"></em></li>
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
<style type="text/css">
		.content{padding-left:0;}
		.post_q{background:#f7f7f7;height:112px;margin:3px 0 0 3px;_height:115px;}
		.content .post_q a{font-size:12px;}
		.post_q_title{width:26px;height:112px;float:left;background:url(/Content/Fenlei/Ui6/zp/post_q.gif) no-repeat;margin:-3px 0 3px -3px;_margin:0 0 0 0;}
		.post_q_con{float:left;border:1px solid #e5e5e5;border-left:none;background:#fdfdfd;width:950px;height:110px;margin:-3px 0;_width:947px;_margin:0 0;}
		.post_q_con li{float:left;line-height:24px;border-right:1px dashed #eaeaea;padding-right:13px;margin:8px 0 0 13px;}
		.post_q_con li.no{border:none;padding:0;}
		.job_c_list td{line-height:32px;padding:8px 0 9px; border-bottom:1px solid #ededed;border-top:1px solid #fff;}
		.job_c_list td.t{font-size:14px;color:#4d4d4d;width:15.5%;text-align:left;vertical-align:top;font-weight:bold;text-indent:5px;}
		.job_c_list td a{display:inline-block;margin-right:30px;}
		.trg{background:#F9F9F9}
		.fix{position:fixed;bottom:auto;top:0px;}
		*html,*html body{background-image:url(about:blank);background-attachment:fixed;}
		*html .fix{position:absolute;bottom:auto;top:expression(eval(document.documentElement.scrollTop-113));}
		.se{background:#fff8ce}
	</style>
    
    <div id="bigcat"><div class="post_q">
    	<div class="post_q_title"></div>
        <div class="post_q_con">
        	<ul>
                <%
                    for (int i = 0; i < jobCategories.Count();i++ )
                    {
                        if(i%4==0)
                        {
                            %>
                            <li>
                            <%
                        }
                        %>
                            <a href="javascript:gotoline(<%=i %>)"><%=jobCategories.ElementAt(i).Name %></a>
                        <%
                        if (i % 4 < 3)
                        {
                            %>
                            <br />
                            <%
                        }
                        if (i % 4 == 3)
                        {
                            %>
                            </li>
                            <%
                        }
                    }
                %>
            </ul>
        </div>
        <div class="c"></div>
        
    </div></div>
	<div id="bigcat1" style="display:none;height:112px;"></div>
    

<div class="job_c_list">
	<table width="" cellpadding="0" cellspacing="0" id="allcat">
    
    <%
        foreach (var job in jobCategories)
        {
            %>
                <tr>
                    <td class="t"><%=job.Name %></td>
                    <td>
                        <%
                            foreach (var item in job.ObjectTypeCollection)
                            {
                                %>
                                    <%=Html.ActionLink(item.Name, "Post", this.ViewData["ParentCode"].ToString(), new { smallcategory = job.Code, objecttype = item.Id, tid = routeData.Values["tid"] }, null)%>
                                <%
                            }
                        %>
                    </td>
                </tr>
            <%
        }
    %>
    </table>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $(".job_c_list tr").hover(function () {
            $(this).addClass("trg");
        }, function () {
            $(this).removeClass("trg");
        })
    });
    var div1 = fe.dom.get('bigcat');
    var topLine = div1.offsetTop;
    var tttstatus = false;
    window.onscroll = function () {
        if ((document.body.scrollTop || document.documentElement.scrollTop) > topLine) {
            if (tttstatus == false) {
                div1.className = 'fix';
                $("#bigcat1").show();
                //document.body.scrollTop -= div1.offsetHeight;
                //document.documentElement.scrollTop -= div1.offsetHeight;
                tttstatus = true;
            }
        } else {
            if (tttstatus == true) {
                div1.className = '';
                $("#bigcat1").hide();
                //document.body.scrollTop -= div1.offsetHeight;
                //document.documentElement.scrollTop -= div1.offsetHeight;
                tttstatus = false;
            }
        }
    };
    function gotoline(index) {
        boot.require('dom, util.offset', function (Frame, dom, offset) {
            var trs = dom.get("allcat").getElementsByTagName('tr'), el = trs[index];
            offset.scroll(0, offset.getXY(el).y - dom.get('bigcat').offsetHeight);
            for (var i = 0, leni = trs.length; i < leni; i++) {
                dom.removeClass(trs[i], 'se');
            }
            dom.addClass(el, 'se');
        });
    }
    gotoline();
	</script>
<div class="c"></div>
<div class="otherzw">如果没有找到您想要的职位，请将信息发布在 “<a para="13961,13149,1">其他职位</a>” 里。</div>
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
