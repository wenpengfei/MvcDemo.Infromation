<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/UserCenter/UserConter.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
    var menuid = "inbo";
    function tongjihis(obj) {
        if (obj) {
            if (obj.href) {
                _gaq.push(['pageTracker._trackEvent', 'taojen_my', 'zuijinfangwen', obj.href]);
            }
        }
    }
    function ConfirmInfo(v, m) {
        if (!window.confirm(m)) {
            if (document.all)
                window.event.returnValue = false;
            else
                arguments.callee.caller.arguments[0].preventDefault();
        }
    }
    function ConfirmUpdateInfo(v) {
        ConfirmInfo(v, '信息置顶或委托中，若修改了地区和类别，则原地区和类别的置顶及委托自动结束，余额或积分不予返还！');
    }
    function closeinfo1(infoid, istop, isdingxiang) {
        var m = '';
        if (istop == 'true') {
            m = '删除后将自动结束置顶及委托，结束置顶不返还余额或积分。是否继续？';
        }
        else if (isdingxiang) {
            m = "删除后将自动结束定向推广状态，且不返还余额。是否继续？";
        }
        else { m = '您确定删除本条信息吗?'; }
        if (!confirm(m))
            return;
        $.c.info.SubInfo(infoid, "close", null);
    }
    function reflashinfo(totalScore, reflashcount, allID, userMoney) {
        var url = "/popresult/?type=REFLASHINFOPOP&op=";
        var higth = 100;
        if (allID == "") {
            url += "nonesel";
            setbg('帖子刷新提示', 474, higth, url);
        }
        else {
            if (navigator.userAgent.indexOf("MSIE") == -1) {
                higth += 20;
            }
            var freeFlag = "1";
            $.post("/ajax/checkreflashfree?ids=" + allID + "&reflashcount=" + reflashcount, null, function (xml) {
                if (xml.toString().length > 0) freeFlag = xml;
                url += "sel&totalScore=" + totalScore + "&reflashcount=" + reflashcount + "&allID=" + allID + "&freeFlag=" + freeFlag + "&userMoney=" + userMoney;
                setbg('帖子刷新提示', 474, higth, url);
            });
        }

    }
    function showmore() {
        var d = "c=true";
        $.j.callajax("clearinfo", d, function (text) {
            window.location.href = '/xinxiguanli/?more=true';
        });
    }
    function chgTopIcon(infoid, cls, tit, show) {
        var sp = $("#ding_" + infoid);
        sp.attr("class", cls);
        sp.attr("title", tit);
        if (show) sp.show();
        else sp.hide();
    }
    function chgTopAndReflashBtn(infoid) {
        $.get("/ajax/getinfotopstate/?infoid=" + infoid + "&t=" + new Date(), function (data) {
            switch (data) {
                case "1":
                    chgTopIcon(infoid, "ico ding", "置顶中", 1);
                    chgTopBtn(infoid, "置顶管理");
                    chgReflashBtn(infoid, 0);
                    break;
                case "2":
                    chgTopIcon(infoid, "ico-w ding-w", "委托置顶中", 1);
                    chgTopBtn(infoid, "置顶管理");
                    chgReflashBtn(infoid, 1);
                    break;
                default:
                    chgTopIcon(infoid, "", "", 0);
                    chgTopBtn(infoid, "置顶");
                    chgReflashBtn(infoid, 1);
                    break;
            }
        });
    }
    function chgTopBtn(infoid, str) {
        $("#topspan" + infoid).html("<span id='topspan" + infoid + "'><a href='javascript:$.c.info.InfoTop(\"" + infoid + "\");'>" + str + "</a></span>");
    }
    function chgTopTab(infoid, istop) {
        var _iframearea = $("#frm" + infoid)[0];
        var doc = _iframearea.contentWindow.document;
        var id = istop == 1 ? "menu1_title0" : "menu1_title1";
        doc.getElementById(id).onclick();
    }
    function operationFaild() {
        alert("操作失败");
    }
    function topSuccess(infoid, state, localid) {
        var msg = "";
        chgTopAndReflashBtn(infoid);
        if (state == 0) {
            chgTopTab(infoid, 1);
            msg = "置顶成功";
        }
        else {
            chgTopTab(infoid, 0);
            msg = "委托任务提交成功";
        }
        alert(msg);
    }
    function cancelReserveSucess(infoid) {
        chgTopAndReflashBtn(infoid);
        chgTopTab(infoid, 0);
        alert("取消委托成功");
    }
    function cancelTopSuccess(infoid) {
        chgTopAndReflashBtn(infoid);
        chgTopTab(infoid, 1);
        alert("结束置顶成功");
    }
    function gratissuccess(infoid) {
        chgTopAndReflashBtn(infoid);
        chgTopTab(infoid, 1);
        alert("您已使用一次免费置顶机会，置顶成功");
    }
    function chgReflashBtn(infoid, showReflash) {
        $.get("/ajax/getreflashcount/", function (data) {
            if (showReflash) {
                var score = GetCookieValue("UserScore");
                $("#reflashspan" + infoid).html("<a href=\"javascript:void(0);\" onclick=\"reflashinfo(" + score + "," + data + ",'" + infoid + "');return false\" title=\"刷新后信息靠前显示，相当于新发一条。\">刷新</a>");
            } else {
                $("#reflashspan" + infoid).html("&nbsp;&nbsp;刷新&nbsp;");
            }
        });
    }
    function showjobcount(list) {
        if (list) {
            for (var i = 0; i < list.length; i++) {
                var info = list[i];
                if (info && info.id && info.count != 0) {
                    $("#jobcount" + info.id).html("(" + info.count + ")");
                    $("#jobcount" + info.id).attr("class", "red");
                }
            }
        }
    }
    function checkShowInfoTip() {
        var have = fe.cookie.get('dontshowtip37800967');
        if (have) {
            $("#details-tips").hide();
        }
    }
    function closeShowInfoTip() {
        $("#details-tips").hide();
        var now = new Date;
        var d = new Date(now.getFullYear(), now.getMonth() + 3, now.getUTCDate());
        fe.cookie.set('dontshowtip37800967', 1, d, "/", "my.flxxwang.com");
    }
    function showDingXiangSrc(infoid) {
        var dirFrm = $("#dirFrm" + infoid);
        if (dirFrm.attr("visible").toString() == "false") {
            $("iframe").css("visible", false);
            $("iframe").css("height", "0px");
            var s = "http://direction.union.vip.flxxwang.com/directioninfoweb/trydir/" + infoid + "/1/0";
            dirFrm.attr("src", s);
            dirFrm.attr("visible", true);
        } else {
            dirFrm.attr("visible", false);
            dirFrm.css("height", "0px");
            dirFrm.attr("src", "");
        }
    }
    function dirResetState(infoid, state) {
        var img = $("#imgdingxiang" + infoid);
        if (state == 0) {
            img.attr("class", "");
            img.hide();
        }
        if (state == 1) {
            img.attr("class", "ico dx");
            img.show();
        }
    }
</script>
<%
    var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
    Infomation.Core.User user = this.ViewData["User"] as Infomation.Core.User;
%>
<div id="topinfomsg">
    <strong></strong><%=SiteInfo.Name%>交友隆重推出，聊天、交友、分享照片并享受快乐吧！
    <a href="http://flxxwang.com/jiaoyou" target="_blank">立即加入>></a>
    <span class="btn-q" onclick="document.getElementById('topinfomsg').style.display='none';">×</span>
</div>
<div class="top_info clearfix">
	<div class="infol">
		<p><span class="tx"><img src="/Content/Fenlei/Images/user/default_b.jpg"></span></p>
		<a href="#">修改个人资料</a>
    </div>
	<div class="xqxinfo">
		<table>
			<tr>
				<th>用户账号：</th>
				<td><p class="yhzh_p"><strong> <a target="_blank" href="#" title="<%=user.UserName %>"><%=user.UserName %></a></strong></p></td>
				<td><span class="mr20 f14">余额：</span><span class="red"><a href="#">0元</a></span><span class="jf">&nbsp;</span><span class="pay">(<a href="#">充值</a>)</span> <span class="mr20 f14">积分：</span><span class="red"><a href="#">0</a></span></td>
			</tr>
			<tr>
				<th>信用等级：</th>
				<td> <a href="#" target="_blank">
                    <img title="信用60" src="/Content/Fenlei/Images/2.gif" alt="信用"></a>
                </td>
				<td><span class="mr20 f14 left">用户认证：</span><div class="clearfix" id="sfyz"> <a href="#" title="已邮件验证"><span class="sjyz"></span></a><a href="#" title="手机未验证"><span class="maileyzw"></span></a><a href="#" title="实名未验证"><span class="nameyzw"></span> </a><a title="" href="#" id="biza"><span class="" id="bizicon"></span></a>
					<script>
						function showbiz(b) {
						    var biz = document.getElementById("bizicon");
						    var biza = document.getElementById("biza");
						    biz.className = b == '1' ? "zzyz" : "zzyzw";
						    biza.title = b == '1' ? "已经通过营业执照验证" : "营业执照未验证";
						}
						showbiz('0');
                    </script>
					</div></td>
			</tr>
			<tr>
				<th>最近访问：</th>
				<td class="last-fw" colspan="2" id='histd'></td>
			</tr>
		</table>
	</div>
</div>
<%string action = routeData.Values["action"].ToString().ToLower(); %>
<div class="xinxi-guanli">
	<div class="xinxi-title">
		<ul id="details-ul" class="clearfix">
		    <li <%=action=="index"?"class=\"hover\"":"" %>><a href="<%=action=="index"?"javascript:void(0);":Url.Action("index","my") %>">最新信息</a></li>
			<li <%=action=="xinxiguanli"?"class=\"hover\"":"" %>><a href="<%=action=="xinxiguanli"?"javascript:void(0);":Url.Action("xinxiguanli","my") %>">显示中的信息</a></li>
			<li <%=action=="infocheck"?"class=\"hover\"":"" %>><a href="<%=action=="infocheck"?"javascript:void(0);":Url.Action("infocheck","my") %>">审核中的信息</a></li>
			<li <%=action=="infodelete"?"class=\"hover\"":"" %>><a href="<%=action=="infodelete"?"javascript:void(0);":Url.Action("infodelete","my") %>">已删除的信息</a></li>
		</ul>
		<div class="xinxi-msg"><a class="w-email-a" href='/msgrev/0/0/'>站内信</a><a class="favorites-a" href="/shoucangjianli/">收藏的信息</a></div>
	</div>

    <%--显示信息列表,保留.
    <div class="xinxi-guanli-box" id="details-con-1">
    <%
        if (action == "index")
        {
            %>
            <table class="basetb">
		        <tr id="tablehead">
			        <th width="58%"> 标题  </th>
			        <th width="20%" class="tit_cz"> 管理 </th>
			        <th class="tit_cz" width="20%"> 推广 </th>
		        </tr>
                <tr id="tr7509383629445">
		            <td>
                        <div> 
			                <a target='_blank' href='#'>网页设计/制作</a>
			                <span class="titletd">
			                </span>
                            <span style='display:none;' id='imgdingxiang7509383629445'></span>
                            &nbsp;&nbsp;<b class='red'>审核中</b>
                            <span style='display:none;' class='ico-w ding-w' title='委托置顶中' id="ding_7509383629445"></span><br>
			                <p class="titletd tc58">
                                更新时间:11-10-15 16:23 <cite>|</cite> 
                                编号:7509383629445&nbsp;<cite>|</cite>
                                <span>
                                    <a href="#">应聘简历</a>
                                    <span id='jobcount7509383629445'></span>
                                </span>
                                &nbsp;&nbsp;&nbsp;
                            </p>
                            <span class='red'></span>
                        </div>
			        </td>
                    <td class="cza czav">
                        <a href='#' target="_blank">修改</a>
                        <a href="#">删除</a>
                    </td>
                    <td class="cza czav">
                        <span id='topspan7509383629445'>
                            <a href='#'>置顶</a>
                        </span>&nbsp;
                        <a href="#">定向推广</a>&nbsp;
                        <span id='reflashspan7509383629445'>
                            <a title='刷新后信息靠前显示，相当于新发一条。' onclick="reflashinfo(0,0,'7509383629445','0');return false" href='javascript:void(0);' >刷新</a>
                        </span>
			        </td>
		        </tr>
                
                <tr id="tr7434216808323">
                    <td>
                        <div> 
			                <span style='font-size:14px;'>销售代表</span>
                            <span class="titletd"></span>
                            <span style='display:none;' id='imgdingxiang7434216808323'></span>
                            &nbsp;&nbsp;<b>已删除</b>
                            <span style='display:none;' class='ico-w ding-w' title='委托置顶中' id="ding_7434216808323"></span><br>
			                <p class="titletd tc58">
                                更新时间:11-10-08 21:16 <cite>|</cite> 
                                编号:7434216808323&nbsp;<cite>|</cite> 
                                <span>
                                    <a href="#">面试邀请</a>
                                </span>&nbsp;&nbsp;&nbsp;
                            </p>
                            <span class='red'></span>
                        </div>
			        </td>
                    <td class="cza czav"></td>
                    <td class="cza czav"></td>
		        </tr>
	        </table>
            <%
        }
        if (action == "xinxiguanli")
        {
            %>
             <table class="basetb">
		        <tr id="tablehead">
			        <th width="28">&nbsp; </th>
			        <th width="58%"> 标题 
			        &nbsp;&nbsp;&nbsp;&nbsp;<a href='#' target='_blank'>置顶让信息被更多人看到！</a> 
			        </th>
			        <th width="20%" class="tit_cz"> 管理 </th>
			        <th class="tit_cz" width="20%"> 推广 </th>
		        </tr>
		
                    <tr id="tr2">
			            <td class="binp"><input type="checkbox" value="7509383629445" name="cbID" id="cbID"></td>
			            <td><div> <a target="_blank" href="#">网页设计/制作</a> 
			            <span class="titletd"  >
			    
			             ( <a target="_blank" href="#">杭州</a>
			            <a target='_blank' href='#'>全职招聘</a>-<a target='_blank' href='#'>计算机/互联网/通信</a> )
			    
			            </span>
			    
			            <span style='display:none;' id='Span1'></span>
			             <span style='display:none;' class='ico-w ding-w' title='委托置顶中' id="Span2"></span><br>
					            <p class="titletd tc58"> 更新时间:11-10-15 16:23 <cite>|</cite> 编号:7509383629445&nbsp;<cite>|</cite> <span><a href="#">应聘简历</a><span id='Span3'></span></span>&nbsp;&nbsp;&nbsp;</p>
					            <span class='red'></span> </div></td>
			            <td class="cza czav"><a href='#'  target="_blank">修改</a> <a href="#">删除</a>                                
                        </td>
			            <td class="cza czav">
			            <span id='Span4'><a href='#'>置顶</a></span>&nbsp;<a href="#">定向推广</a>&nbsp;<span id='Span5'><a title='刷新后信息靠前显示，相当于新发一条。' onclick="reflashinfo(0,0,'7509383629445','0');return false" href='javascript:void(0);' >刷新</a></span>
			            </td>
		            </tr>
		            <tr class="infotdno">
			            <td colspan="4"><iframe frameborder="0" scrolling="no" visible="false" style="width: 100%; height: 0px; border: 0px none;" src="" id="frm7509383629445"></iframe>
			            <iframe frameborder="0" scrolling="no" visible="false" style="width: 100%; height: 0px; border: 0px none;" src="" id="dirFrm7509383629445"></iframe>
			            </td>
		            </tr>		
                </table>
            <%
        }
        if (action == "infocheck")
        {
            %>
            <table class="basetb">
	            <tbody>
		            <tr id="tablehead">
			            <th width="68%"> 标题 </th>
			            <th width="20%"> 更新时间 </th>
			            <th class="tit_cz"></th>
		            </tr>
		
                        <tr>
			            <td><div> <a target="_blank" href="#">网页设计/制作</a>
			
					            <p class="titletd"> 编号:7656809053446
					             | <a target='_blank' href='#'>杭州</a> |  <a target='_blank' href='#'>全职招聘</a>-<a target='_blank' href='#'>计算机/互联网/通信</a>
                                  </p>
				            </div></td>
			            <td> 11-10-29 00:22 <br>
				            <span class="red"></span></td>
			            <td><div class="cza"></div></td>
		            </tr>
	            </tbody>
            </table>
            <%
        }
        if (action == "infodelete")
        {
            %>
            <table class="basetb">
	            <tbody>
		            <tr id="tablehead">
			            <th width="65%">标题</th>
			            <th width="20%">更新时间</th>
			            <th class="tit_cz">操作</th>
		            </tr>
		
                        <tr>
			            <td><div>
			            <span style='font-size:14px;'>销售代表</span>
            
                        <span style="margin-left:5px;color:#666666;"></span>
					            <p class="titletd">编号:7434216808323&nbsp;
					             | &nbsp;<a href='#' target='_blank'>北京</a>&nbsp; | &nbsp;<a target='_blank' href='#'>求职信息</a>-<a target='_blank' href='#'>销售</a>
                                &nbsp;<cite>|</cite> <span><a href="#">面试邀请</a></span></p>
                    
				            </div></td>
			            <td> 11-10-08 21:16<br /><span class="red"></span></td>
			            <td><div class="cza">
			
			
			            </div></td>
		                </tr>
            		
	            </tbody>
            </table>
            <%    
        }
    %>
	</div>--%>
	<%--<div style="text-align:center; padding:50px 30px">暂时还没有信息</div>--%><%--没有信息时显示这个div--%>
</div>

<div id="page" ></div>
                				
<div class="noteread">
	<p> <b>说明：</b></p>
	<p> 1、刷新：将您的信息靠前显示，相当于新发一条。每刷新一条信息需要3个积分，每天刷新第一条信息免费。</p>
	<p> 2、置顶：将您的信息固定排在页面最顶部，不会被其他信息挤下去。<%--<a target="_blank" href="#">查看展示效果</a>--%></p>
	<p> 3、待审核：待审核中的信息除了您自己外，其他人无法看到，不能修改或删除，工作人员会在24小时内为您审核。 </p>
	<p> 4、已删除：删除后别人就无法看到信息了。自己删除后可恢复，管理员删除的无法恢复，但有些信息可修改合规后再发布。<a href='#' target="_blank">详细</a> </p>
</div>

<%--<form name="submitform" id="submitform" target="formSubmit" method="post"><input type="hidden" name="ids" id="ids" /></form>
<iframe style="display: none" src="/submit.htm" id="formSubmit" name="formSubmit"></iframe>--%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
