<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/InfoDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="TopInfoMsg" runat="server">
<div id="topinfomsg">
    <font style="FONT-WEIGHT: normal; LINE-HEIGHT: normal; FONT-STYLE: normal; FONT-VARIANT: normal" face=新宋体 color=#ff0000 size=4>
        <font color=#ff0000 size=4>
            <strong><strong>
            郑重提示：要求先汇款后拿票；或见面拿票,朋友汇款的,一定是骗子！
            <a href="#" target=_blank>常用骗术大曝光</a>
            <a href="#" target=_blank>火车票防骗查询系统</a>
            </strong>
    </font>
    </strong>
    </font>
</div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var ticket = ViewTag.Info as TicketTrain;
%>
<div id="sbar1"></div>
<div class="w">
	<ul class="info">      
        <li><i class="z">线路：</i>
            <a href="#"><%=ticket.StartStation %> → <%=ticket.EndStation %></a>
            <%--<a href="#" target="_blank" style="font-size:12px; text-decoration:underline; margin-left:10px;">手机秒杀火车票</a>--%>
        </li>
        <li><i class="z">车次：</i><a href="#" target="_blank"><%=ticket.Number %></a></li>
        <%
            var objType = ticket.ObjectTypeCollection.FirstOrDefault(item => item.Id == ticket.ObjectType);
            if (objType != null)
            {
                %>
                <li><i class="z">类型：</i><%=objType.Name %></li>
                <%
            }
        %>
        <li><i class="z">张数：</i><%=ticket.Count %>张</li>
        <%
            if (ticket.Time != null)
            {
                %>
                <li><i class="z">发车日期：</i><%=ticket.Time.Value.ToString("M月dd日") %></li>
                <%
            }
        %>
        <%--<li class="operate">
            <div class="caozuo1" style="padding:0;">
                <span class="cz_1"><a id="cz_share" title="求鉴定" href="javascript:void(0)"><i></i>求鉴定</a></span>
                <span class="cz_2"><a id="cz_favorite" title="收藏信息" href="javascript:void(0)"><i></i>收藏</a></span>
                <span class="cz_3"><a title="举报该信息" href="javascript:setbg('举报该信息',380,300,'http://about.flxxwang.com/Complain.aspx?infoid=7771608249218')"><i></i>举报</a></span>
                <span class="cz_4"><a title="把该信息发送到手机" href="javascript:setbg('把该信息发送到手机',400,200,'http://my.taojenjen.com/downloadinfo/inputmobile/7771608249218/')" onclick="_gaq.push(['pageTracker._trackEvent', '58_detail', 'click', 'link_sent_phone']);"><i></i>免费发送到手机</a></span>
            </div>
        </li>--%>
      </ul>
    <div class="user">
    	<div id="newuser"></div>
        <ul class="userinfo"></ul>
        <ul class="vuser nomargin">
            <li class="call_2"><i>联系电话：</i>
                <span class="phone"><%=ticket.Phone %></span>
                <%--<span class="belong">（归属地：杭州）</span>--%>
            </li>
            <li>
                <i></i>
                <span class="f12">
                    <%--<a target="_blank" href="#">查看此电话发帖记录</a>--%>
                </span>
            </li>
        </ul>
        <ul class="userinfo">
            <li><i>QQ/MSN：</i>
                <%--<img src='#' />--%>
                <%=ticket.QQOrMSN %>
            </li>
            <li class="n"><i>&nbsp;</i></li>
        </ul> 
    </div>
    <div class="clear"></div>
</div>

<%--<div class="w content">
	<div class="piaotitle">
    	<span>
            <a href="#">更多 (杭州 → 武昌) 转让票»</a>
        </span>
        <span>
            <a href="#" target="_blank">更多 (<%=ticket.Number %>) 转让票»</a>
        </span>
        <span>
            <a href='#'>11月09日(杭州 → 武昌)全部票转让»</a>
 		</span>        
    </div>
	<div class="mtbox">
        <div class="trainer fl">
            <h3><a href="#" target="_blank"> 杭州 到 武昌火车票转让信息</a></h3>
            <ul class="trainerul">
        	    <li class="w"><span>11-08</span><a href='#'>杭州-武昌 Z47 硬卧1张 发车日期:2011-11-08</a></li>
        	    <li class="w"><span>11-08</span><a href='#'>杭州-武昌 K529 软卧1张 发车日期:2011-10-16</a></li>
        	    <li class="w"><span>11-08</span><a href='#'>杭州-武昌 Z47 站票1张 发车日期:2011-10-06</a></li>
            </ul>
        </div>

        <!--机票-->
        <div class="trainer fr">
            <h3><a href="http://jipiao.flxxwang.com/" target="_blank">特价飞机票</a></h3>
            <ul class="trainerul">
                <li><a href="#" target="_blank"><span><b>297</b>元(1折)</span><em>11-23</em>杭州→沈阳</a></li>
                <li><a href="#" target="_blank"><span><b>250</b>元(2折)</span><em>12-14</em>杭州→深圳</a></li>
                <li><a href="#" target="_blank"><span><b>557</b>元(2折)</span><em>12-05</em>杭州→乌鲁木齐</a></li>
                <li><a href="#" target="_blank"><span><b>212</b>元(2折)</span><em>12-13</em>杭州→广州</a></li>
                <li><a href="#" target="_blank"><span><b>295</b>元(2折)</span><em>12-05</em>杭州→重庆</a></li>
                <li><a href="#" target="_blank"><span><b>260</b>元(2折)</span><em>12-08</em>杭州→太原</a></li>
            </ul>
        </div>
    	<div class="clear"></div>
	</div>
</div>--%>


<div class="w">
    <div class="footad pt20">
        <%--<div id="googlead_list"></div>--%>
        <%--广告位置--%>
    </div>
</div>
<div id="sbar2"></div>
</asp:Content>
