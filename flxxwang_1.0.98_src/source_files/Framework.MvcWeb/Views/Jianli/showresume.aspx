<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Resume>" %>
<%@ Import Namespace="Framework.Extensions" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <%
        var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
    %>
    <title>简历预览</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="/Content/Fenlei/Scripts/jianli/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>
    <script type="text/javascript" charset="gb2312" src="/Content/Fenlei/Scripts/5_1/7b/3.js"></script>
    <script src="/Content/Fenlei/Scripts/resizeimage.js" type="text/javascript"></script>
    <script type="text/javascript">
        var __jsoninfo = { city: '<%=routeData.Values["city"] %>', tid: '<%=routeData.Values["tid"] %>' };
    </script>
    <style type="text/css">
    body{background:#f0f0f0;color:#343434;font-family:"lucida Grande",Verdana;font-size:14px;letter-spacing:1px;}
	*html,*html body{background-image:url(about:blank);background-attachment:fixed;}
    a{color:#3950bf;}a:hover{color:#f00}
    .line{display:inline-block;width:1px;height:12px;background:#c6c6c6;vertical-align:middle;margin:0 10px;}
    p{margin:0;padding:0;line-height:30px;}
    .title{font-size:16px;font-weight:bold;border-bottom:1px solid #ebebeb;margin-top:22px;margin-bottom:10px;}
    .nl{padding:0 18px;}
    .nl div{padding:10px 0 ; border-bottom:1px dashed #ececec;line-height:30px;}
    .imgs {margin: 0;padding:10px 0 0;}
    .imgs li {border: 1px solid #F1F1F1;float: left;height: 320px;margin-right: 25px;margin-bottom: 25px;overflow: hidden;padding: 5px;width: 320px}
    .imgs li span {display: table-cell;height: 320px;text-align: center;vertical-align: middle;width: 320px}
    .imgs li img {border: medium none;vertical-align: middle}
    .clear{ clear:both;height:0;display:block}
    .function{padding-left:165px;padding-top:25px;}
    .function a { background:url(/Content/Fenlei/ui6/zp/button_bg.gif) no-repeat 0 0;color: #000000;display: inline-block; margin-right: 10px; padding-left: 12px;font-size:14px;text-decoration: none;}
    .function a span { background:url(/Content/Fenlei/ui6/zp/button_bg.gif) no-repeat right top; color: #4d4d4d;cursor: pointer;display: inline-block;padding: 3px 12px 8px 0;text-decoration: none;font-weight:bold}
    .function a:hover span{ text-decoration: none;background:url/Content/Fenlei/ui6/zp/button_bg_hover.gif) no-repeat right top;color:#fff;}
    .function a:hover { text-decoration: none;background:url(/Content/Fenlei/ui6/zp/button_bg_hover.gif) no-repeat 0 top;}
    .dianping{padding:30px 0 30px 50px;font-size:12px;line-height:24px;}
    .dianping td{padding:5px;}
    .dianping label{margin-right:10px;}
    .dianping label input{margin:0 3px 0 0;padding:0; vertical-align:middle}
    .lefttd{color:#808080}
    .dianping textarea{width:490px;height:80px;font-size:12px;line-height:20px;margin-top:5px;}
    .button_bg{width:100px;height:30px; background:url(/Content/Fenlei/ui6/zp/button_bg_yellow.gif) no-repeat; border:none;color:#fff;font-weight:bold; cursor:pointer}
    .time{width:80%;border-top:1px solid #ebebeb;border-left:1px solid #ebebeb;margin:10px 0;}
    .time td{text-align:center;border-bottom:1px solid #ebebeb;border-right:1px solid #ebebeb;border-top:1px solid #fff;border-left:1px solid #fff;color:#666;line-height:30px;}
    .time td.tg{background:#f9f9f9;color:#1a1a1a}
    div,td{font-size:14px}
    p,div,td{line-height:30px}
    /* 招聘助手 */
    .history{width:122px;font-size:12px;}
    .history ul{display:block;list-style:none;margin:0;padding:0; letter-spacing:normal;}
    .history li{height:26px;line-height:26px;padding:0 0 0 8px;background:url(/Content/Fenlei/ui6/zp/zpzs85.png) no-repeat 0 -29px;}.history i{font-size:10px;font-style:normal;color:#666;margin-left:3px;}
    .history li.history_title{font-weight:bold;color:#fff;height:28px;background-position:0 0;line-height:25px;padding-left:30px;padding-bottom:5px;}
    .history li.history_bottom{border-top:1px dashed #ECECEC;padding:3px 0 9px 11px;_padding:8px 0 9px 11px; background-position:0 bottom;}
    .history span{display:inline-block;width:15px;height:15px;background:url(/Content/Fenlei/ui6/zp/zpzs85.png) no-repeat;vertical-align:middle;margin-right:7px;}
    .history span.s1{background-position:right 0}
    .history span.s2{background-position:right -24px}
    .history span.s3{background-position:right -49px}
    .history span.s4{background-position:right -84px}
    .history span.s5{background-position:right -118px}
    .gtop{display:block;width:122px;height:30px;background:url(/Content/Fenlei/ui6/zp/zpzs85.png) no-repeat -123px -157px;position:relative;top:-4px;}
    .history li.pb5{padding-bottom:7px;}
    .history li a{text-decoration:none}.history li a:hover{text-decoration:underline}
    </style>
    <style type="text/css" media="print">.history,.gongneng,.cssscore{display:none}</style>
</head>
<body>
<%
    var cityCode = Framework.Utility.CookieManager.GetCookie("city");
    if (string.IsNullOrWhiteSpace(cityCode))
    {
        cityCode = "bj";
    }
%>
<div style="background:#f0f0f0">
    <div style="width:790px;width:789px\9;*width:805px;_width:806px;margin:0 auto">
        <table cellpadding="0" cellspacing="0" align="center" width="806" style="margin-bottom:10px">
	        <tr>
	            <td style="padding:5px 0 10px 9px;">
                    <a href="<%=Url.Action("Default","Home",new{city=cityCode}) %>" target="_blank">
                        <img border="0" src="/Content/Fenlei/ui6/zp/logo.gif" />
                    </a>
                </td>
	            <td align="right" valign="bottom" style="color:#808080;font-size:12px;padding:0 9px 10px 0;">
                    简历编号：<%=this.Model.Id %><span class="line"></span>
                    更新时间：<%=this.Model.DateModified.ToString("yyyy-MM-dd") %>
                </td>
	        </tr>
            <tr><td colspan="2"><img src="/Content/Fenlei/ui6/zp/top_bg.gif" /></td></tr>
            <tr>
                <td colspan="2" background="/Content/Fenlei/ui6/zp/middle_bg.gif">
        	        <div style="padding:25px 36px 36px">
                        <p style="font-size:30px; font-family:'微软雅黑';line-height:30px">
                            <%=this.Model.RealName %><span style="font-size:18px">
                            (<%=this.Model.SexName %>，<%=this.Model.Age %>岁)</span>
                        </p>
                        <p style="padding-top:5px;line-height:30px;font-size:14px">
                            应聘<%=this.Model.JobName %><span class="line"></span>
                            现职位<%=this.Model.CurrentJob!=null?this.Model.CurrentJob.JobName:"无" %><span class="line"></span>
                            <%=this.Model.WorkYears %><span class="line"></span>
                            本科<span class="line"></span>
                            现居住<%=this.Model.NowCity.Name%><%=this.Model.NowRegion!=null?this.Model.NowRegion.Name:""%><%=this.Model.NowCircle!=null?this.Model.NowCircle.Name:""%>
                        </p>
                        <p style="line-height:30px;font-size:14px">
                            电话：<strong><%=this.Model.Phone %></strong> &nbsp; &nbsp; 
                            电子邮件：<strong><%=this.Model.Email %></strong>
                        </p>
                        <div style="background:#f5f5f5;padding:3px 3px 3px 0;margin:23px 0 0 3px;">
                            <div style="background:#fafafa;border:1px solid #e6e6e6;margin:-6px 0 0 -3px;">
                                <div style="border-top:1px solid #fff;padding:12px 17px;font-size:12px;line-height:24px;color:#4d4d4d"><%=this.Model.AboutMe %></div>
                            </div>
                        </div>
                        
                        <%--工作经验--%>
                        <%
                            if (this.Model.WorkExperienceList.Count > 0)
                            {
                                %>
                                <p class="title" style="margin-bottom:0;">工作经验</p>
                                <div class="nl" style="line-height:30px;font-size:14px;width:688px">
                                <%
                                foreach (var item in this.Model.WorkExperienceList)
                                {
                                    %>
                                    <div style="line-height:30px;font-size:14px">
                                        <strong style="color:#4d4d4d"><%=item.CompanyName %></strong><br />
                                        <%=item.StartYear %>年<%=item.StartMonth %>月-<%=item.EndYear %>年<%=item.EndMonth %>月<span class="line"></span>
                                        任职<%=item.JobName %><span class="line"></span>
                                        薪资<%=item.Wage %><br />
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td width="11%" valign="top" style="line-height:30px;font-size:14px">
                                                    工作职责：
                                                </td>
                                                <td style="line-height:30px;font-size:14px"><%=item.WorkContent %></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <%
                                }
                                %>
                                </div>
                                <%
                            }
                        %>
                        
                        <%--教育背景--%>
                        <%
                            if (this.Model.EduBackgroundList.Count > 0)
                            {
                                %>
                                <p class="title">教育经历</p>
                                <div class="nl" style="line-height:30px;font-size:14px">

                                <%
                                foreach (var item in this.Model.EduBackgroundList)
                                {
                                    %>
                                    <p style="line-height:30px;font-size:14px">
                                        <%=item.StartYear %>年<%=item.StartMonth %>月-<%=item.EndYear %>年<%=item.EndMonth %>月<span class="line"></span>
                                        <%=item.School %><span class="line"></span>
                                        <%=item.Profession %>
                                    </p>
                                    <%
                                }
                                %>
                                </div>
                                <%
                            }
                        %>
                        
                        <%--语言技能--%>
                        <%
                            if (this.Model.LanguageSkillList.Count > 0)
                            {
                                %>
                                <p class="title">语言技能</p>
                                <div class="nl">
                                    <p style="line-height:30px;font-size:14px">
                                        <%=this.Model.LanguageSkillList[0].Language%>：<%=this.Model.LanguageSkillList[0].Skill%>
                                        <%
                                            for (var i = 1; i < this.Model.LanguageSkillList.Count; i++)
                                            {
                                                %>
                                                <span class="line"></span><%=this.Model.LanguageSkillList[i].Language%>：<%=this.Model.LanguageSkillList[i].Skill%>
                                                <%
                                            }
                                        %>
                                    </p>
                                </div>
                                <%
                            }
                        %>
                        
                        <%--专业证书--%>
                        <%
                            if (this.Model.CertificateList.Count > 0)
                            {
                                %>
                                <p class="title">专业证书</p>
                                <div class="nl">
                                <%
                                    foreach (var item in this.Model.CertificateList)
                                    {
                                        %>
                                        <p style="line-height:30px;font-size:14px"><%=item.Name %> &nbsp; &nbsp;<%=item.CertYear %>年<%=item.CertMonth %>月由<%=item.CertOrg %>颁发</p>
                                        <%
                                    }
                                %>
                                </div>
                                <%
                            }
                        %>

                        <%--照片/作品--%>
                        <%
                            if (this.Model.PictureList.Count > 0)
                            {
                                %>
                                <p class="title">照片/作品</p>
                                <div class="nl" style="padding-right:0;">
                                    <ul class="imgs">
                                        <%
                                            foreach (var item in this.Model.PictureList)
                                            {
                                                %>
                                                <li>
                                                    <span>
                                                        <a target="_blank" href="<%=item %>">
                                                            <img src="<%=item %>" onload="resizeImage(this,320,320);" />
                                                        </a>
                                                    </span>
                                                </li>
                                                <%
                                            }
                                        %>
                                    </ul>
                                    <span class="clear"></span>
                                </div>
                                <%
                            }
                        %>

                        <%
                            if (this.Model.ResumeType == WorkType.Part)
                            {
                                %>
                                <p class="title">空余时间</p>
                                <div class="nl">
                                    <table cellpadding='0' cellspacing='0' class='time'>
                                        <tr>
                                            <td class='tg'>&nbsp;</td>
                                            <td class='tg'>星期一</td>
                                            <td class='tg'>星期二</td>
                                            <td class='tg'>星期三</td>
                                            <td class='tg'>星期四</td>
                                            <td class='tg'>星期五</td>
                                            <td class='tg'>星期六</td>
                                            <td class='tg'>星期日</td>
                                        </tr>
                                        <tr>
                                            <td class='tg'>上午</td>
                                            <%
                                                foreach (var item in this.Model.FreeTimeList)
                                                {
                                                    %>
                                                    <td><%=item.AM ? "√" : "&nbsp;"%></td>
                                                    <%
                                                }
                                            %>
                                        </tr>
                                        <tr>
                                            <td class='tg'>下午</td>
                                            <%
                                                foreach (var item in this.Model.FreeTimeList)
                                                {
                                                    %>
                                                    <td><%=item.PM ? "√" : "&nbsp;"%></td>
                                                    <%
                                                }
                                            %>
                                        </tr>
                                    </table>
                                </div>
                                <%
                            }
                        %>
        	        </div>
                </td>
            </tr>
            <tr><td colspan="2"><img src="/Content/Fenlei/ui6/zp/bottom_bg.gif" /></td></tr>
        </table>
        
    <p align="center" style="font-size:12px;color:#4d4d4d">该简历来自 <%=SiteInfo.Name%>(www.flxxwang.com)</p>
    </div>
    </div>
    <script type="text/javascript" src="/Content/Fenlei/Scripts/zp/zpzhushou_817.js"></script>
    <div id="zpzs" class="history" style="display:none;position:fixed!important;top/**/:146px;position:absolute;top:expression(offsetParent.scrollTop+146);">
        <script type="text/javascript" >
            //showzpzhushou("http://jianli.flxxwang.com/ajax/zpassistant", 799);
            width = 799;
            var s = '<ul>';
            s+='<li class="history_title">招聘助手</li>'
            s += '<li><span class="s1"></span><a href="<%=Url.Action("yixiazaijianli","my") %>" target="_blank">已下载简历</a></li>';
            //s+='<li><span class="s5"></span><a href="http://my.flxxwang.com/xinxiguanli/?menu=5" target="_blank">收到的简历</a></li>';
            s += '<li><span class="s2"></span><a href="<%=Url.Action("fasongmianshi","my") %>" target="_blank">发送的面试邀请</a></li>';
            s += '<li class="pb5"><span class="s3"></span><a href="<%=Url.Action("s2","post",new{values="zhaopin",city=cityCode}) %>" target="_blank">发布招聘信息</a></li>';
            s += '<li class="history_bottom"><span class="s4"></span><a href="<%=Url.Action("gongsiziliao","my") %>" target="_blank">修改公司信息</a></li>';
            s+='</ul>';
            s+='<a class="gtop" id="gototop" href="javascript:void(0);" onclick="zptop();"></a>';
            callback(s);
        </script>
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

</body>
</html>
