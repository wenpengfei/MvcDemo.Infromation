<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%var city = ViewData["City"] as City; %>
<title>【<%=city.ShortName %>火车票、演唱会、音乐会、话剧门票信息】 - <%=city.ShortName %><%=SiteInfo.Name%></title>
<meta name="keywords" content="门票,<%=city.ShortName %>门票,<%=city.ShortName %>门票转让,<%=city.ShortName %>演唱会门票,<%=city.ShortName %>演唱会门票信息,火车票,<%=city.ShortName %>火车票" />
<meta name="description" content="flxxwang.com票务转让平台,为您提供<%=city.ShortName %>各种门票信息,其中包括火车票,演唱会,音乐会,歌剧话剧等门票.在这里您可以找到您想要的门票,也是您发布您需要转让的门票信息平台." />
<link type="text/css" rel="stylesheet" href="/Content/Fenlei/ui6/index/categories.css" />  
<script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/boot_toplist_version.js"></script>
<style type="text/css">#searchbar{left:290px}#keyword{width:453px}.tooltip{width:474px;}#hot{float:left}#hot a{margin-left:10px; color:#888;}</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<%var city = ViewData["City"] as City; %>
<div id="header">
    <div id="headerinside">
        <div id="logo">
            <a href="<%=Url.Action("Default","Home") %>" target="_self">
                <img src="/Content/Fenlei/assets/images/logo/logo.gif" alt="中文最大生活信息门户"/>
            </a>
            <span>
                <a href="" target="_self"><b>票务</b></a>
            </span>
        </div>
        <%--<form onsubmit='b_query();return false;'>
            <div id="searchbar" class="catec">
                <i id="key">
                    <input type="text" id="keyword" name="key" class="keyword" fdv="可输入票务相关信息" autocomplete="off" />
                </i>
                <i class="jobbtn">
                    <input  type="submit" name="button" class="btnall" id="searchbtn" value="搜索" onmousemove="this.className='btnal2'" onmouseout="this.className=''" />
                </i>
                <div class="clear"></div>
                <span id="hot"></span>
            </div>
        </form>--%>
        <a href="<%=Url.Action("s2","post",new{values="piaowu"}) %>" id="fabu">免费发布信息</a>
    </div>
</div>

<div class="wrap contop">
	<ul class="sixclass">
    	<li>
            <h2><a href="<%=Url.Action("jipiao")%>">特价机票</a></h2>
            <table class="sort" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="dogclass" style="line-height:20px">
                        <%
                            for (var i = 0; i < TicketAirplane.Singleton.ObjectTypeCollection.Count; i++)
                            {
                                var obj = TicketAirplane.Singleton.ObjectTypeCollection[i];
                                %>
                                <a href="<%=Url.Action("jipiao", new {objecttype=obj.Id })%>"><%=obj.Name %></a>
                                <%
                                if (i < TicketAirplane.Singleton.ObjectTypeCollection.Count - 1)
                                {
                                    %>
                                    <%=i % 6 == 5 ? "<br />" : "<cite>|</cite>"%>
                                    <%
                                }
                            }
                        %>
                        <%--<a href="/guojijp/">国际机票</a><cite>|</cite>
                        <a href="/guoneijp/">国内机票</a>--%>
                    </td>
                </tr>
            </table>
        </li>
        <li>
            <h2><a href="<%=Url.Action("piao")%>">演出门票</a></h2>
            <table class="sort" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="dogclass" style="line-height:20px">
                        <%
                            for (var i = 0; i < TicketPerform.Singleton.ObjectTypeCollection.Count; i++)
                            {
                                var obj = TicketPerform.Singleton.ObjectTypeCollection[i];
                                %>
                                <a href="<%=Url.Action("piao", new {objecttype=obj.Id })%>"><%=obj.Name %></a>
                                <%
                                if (i < TicketPerform.Singleton.ObjectTypeCollection.Count - 1)
                                {
                                    %>
                                    <%=i % 6 == 5 ? "<br />" : "<cite>|</cite>"%>
                                    <%
                                }
                            }
                        %>
                        <%--<a href="/yanchanghui/">演唱会</a><cite>|</cite>
                        <a href="/yinyuehui/">音乐会</a><cite>|</cite>
                        <a href="/geju/" >话剧歌剧</a><cite>|</cite>
                        <a href="/shaoerjuchang/">少儿剧场</a><cite>|</cite>
                        <a href="/moshuzaji/">魔术杂技</a><cite>|</cite>
                        <a href="/wudaobalei/">舞蹈芭蕾</a><br />
                        <a href="/zongheyanchu/">综合演出</a><cite>|</cite>
                        <a href="/xiqu/">戏曲</a><cite>|</cite>
                        <a href="/tiyusaishi/">体育赛事</a>--%>
                    </td>
                </tr>
            </table>
        </li>
        <div class="clear"></div>
        <li style="height:62px; overflow:hidden">
            <h2><a href="<%=Url.Action("kaquan")%>">健身卡/优惠券</a></h2>
            <table class="sort" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="dogclass" style="line-height:20px">
                        <%
                            for (var i = 0; i < TicketCard.Singleton.ObjectTypeCollection.Count; i++)
                            {
                                var obj = TicketCard.Singleton.ObjectTypeCollection[i];
                                %>
                                <a href="<%=Url.Action("kaquan", new {objecttype=obj.Id })%>"><%=obj.Name %></a>
                                <%
                                if (i < TicketCard.Singleton.ObjectTypeCollection.Count - 1)
                                {
                                    %>
                                    <%=i % 6 == 5 ? "<br />" : "<cite>|</cite>"%>
                                    <%
                                }
                            }
                        %>
                        <%--<a href="/youhuika/">优惠券</a><cite>|</cite>
                        <a href="/piaowu/?key=%25u56E2%25u8D2D">团购券</a><cite>|</cite>
                        <a href="/jianshenka/" class="redlink">健身卡</a><cite>|</cite>
                        <a href="/gouwuka/">购物卡</a><cite>|</cite>
                        <a href="/youyongka/">游泳卡</a><cite>|</cite>
                        <a href="/kqqita/">其他优惠卡</a>--%>
                    </td>
                </tr>
            </table>
        </li>
        <li>
            <h2><a href="<%=Url.Action("piao", new {objecttype=4 })%>">电影票</a></h2>
        </li>
        <div class="clear"></div>
		<li>
            <h2><a href="<%=Url.Action("youle")%>">游乐园/景点门票</a></h2>
        </li>
        <li>
            <h2><a href="<%=Url.Action("qtpiaowu")%>">其他票务</a></h2>
        </li>
    </ul>
    <div class="clear"></div>
</div>

<div class="wrap">
    <div class="wrapleft" id="global">
    	<%--<i class="lt"></i>
        <i class="rt"></i>
        <div class="tabs">
            <p>
                <a href="/piao/" target="_self" class='select'><span>全杭州演出门票</span></a>
                <a href='/xihuqu/piao/' target='_blank'>西湖</a><i class="gap">|</i>
                <a href='/gongshu/piao/' target='_blank'>拱墅</a><i class="gap">|</i>
                <a href='/jianggan/piao/' target='_blank'>江干</a><i class="gap">|</i>
                <a href='/xiacheng/piao/' target='_blank'>下城</a><i class="gap">|</i>
                <a href='/hzshangcheng/piao/' target='_blank'>上城</a><i class="gap">|</i>
                <a href='/yuhang/piao/' target='_blank'>余杭</a><i class="gap">|</i>
                <a href='/xiaoshan/piao/' target='_blank'>萧山</a><i class="gap">|</i>
                <a href='/binjiang/piao/' target='_blank'>滨江</a><i class="gap">|</i>
                <a href='/jiandeshi/piao/' target='_blank'>建德</a><i class="gap">|</i>
                <a href="/piao/">全部区域&raquo;</a> 
            </p>
        </div>
        <div class="clear"></div>
        <div class="filterbar">
            <h1>杭州演出门票</h1>
            <div class="clear"></div>
        </div>--%>
		<div class="clear"></div>
        <%--<div id="top_google_ad"></div>--%>
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

        <%--<div id="infolist">
	        <div id="top_google_ad"></div>
            <table class="textlist" cellpadding="0" cellspacing="0">
                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7853041430915x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 5折转让19号移动音乐盛典的门票数张,速度哦··</a>(杭州-拱墅) </td>
                    <td class="center"><b>800</b>元/张</td>
                    <td class="center" >32分钟前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7843384185858x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> SHE当中的HEBE田馥甄杭州歌友会门票</a>(杭州-滨江-滨江周边) </td>
                    <td class="center"><b>400</b>元/张</td>
                    <td class="center" >1小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7772228955524x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 转让五月天杭州演唱会及浙江音乐盛典门票支持淘宝交易</a>(杭州-杭州周边) </td>
                    <td class="center"><b>355</b>元/张</td>
                    <td class="center" >2小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7843402231431x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 2011-11-11Hebe歌友会演出门票</a>(杭州-滨江-滨江周边) </td>
                    <td class="center"><b>500</b>元/张</td>
                    <td class="center" >2小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7852137016068x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 五月天出头天演唱会</a>(杭州-西湖-文三路) </td>
                    <td class="center"><b>1255</b>元/张</td>
                    <td class="center" >3小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7852076709764x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> (转让)11月19日移动跨越五千万演唱会情侣票</a>(杭州-萧山) </td>
                    <td class="center"><b>300</b>元/张</td>
                    <td class="center" >3小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7852032310407x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 转让跨越5千万,音乐盛典门票</a>(杭州) </td>
                    <td class="center">面议</td>
                    <td class="center" >3小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7852016402565x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 转让HEBE 歌友会。门票3张</a>(杭州) </td>
                    <td class="center">面议</td>
                    <td class="center" >3小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7851783868803x.shtml" target="_blank" class="t"><span class='c_g'><求购></span></span> 诚心求购移动音乐盛典280或480位置门票</a>(杭州) </td>
                    <td class="center">面议</td>
                    <td class="center" >3小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7851739744262x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 转跨越五千万演唱会1680两张和2080四张288</a>(杭州-西湖-文三路) </td>
                    <td class="center">面议</td>
                    <td class="center" >3小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7851765829637x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 2011周华健杭州演唱会 门票开始预定了</a>(杭州-西湖-文三路) </td>
                    <td class="center"><b>380</b>元/张</td>
                    <td class="center" >3小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7851522866051x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> HEBE歌友会门票3张  一楼</a>(杭州-滨江-浦沿) </td>
                    <td class="center">面议</td>
                    <td class="center" >4小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7851322453890x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 五月天杭州演唱会票</a>(杭州) </td>
                    <td class="center"><b>290</b>元/张</td>
                    <td class="center" >4小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7851266678786x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 2011周华健杭州演唱会  开始接受预定</a>(杭州-下城-武林) </td>
                    <td class="center">面议</td>
                    <td class="center" >4小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7839015583875x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 杭州大剧院 白先勇青春版《牡丹亭》门票</a>(杭州) </td>
                    <td class="center"><b>280</b>元/张</td>
                    <td class="center" >5小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7851040342661x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 浙江音乐盛典演唱会门票上门取票发布时间:2011-</a>(杭州-拱墅-和睦) </td>
                    <td class="center"><b>550</b>元/张</td>
                    <td class="center" >5小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7850952597383x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 11.19移动跨越五千年音乐盛典880档门票低价转</a>(杭州) </td>
                    <td class="center">面议</td>
                    <td class="center" >5小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7849112591746x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 转让浙江移动杭州跨越5000万音乐盛典门票2张</a>(杭州-西湖) </td>
                    <td class="center"><b>400</b>元/张</td>
                    <td class="center" >6小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7850268329605x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 11.19移动跨越五千年音乐盛典880档门票低价转</a>(杭州-滨江) </td>
                    <td class="center"><b>550</b>元/张</td>
                    <td class="center" >7小时前</td>
                </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
                    <td class="t" style="padding:0 0 0 5px;"><a href="http://hz.flxxwang.com/piao/7850131216898x.shtml" target="_blank" class="t"><span class='c_r'><转让></span></span> 两只狗的生活意见11.25日周五晚380票转让</a>(杭州-西湖-西湖) </td>
                    <td class="center"><b>380</b>元/张</td>
                    <td class="center" >7小时前</td>
                </tr>
            </table>
        </div>--%>

    	<%--<div id="bottom_google_ad"></div>--%>
        <%--广告位置--%>

        <%--<div class="lookmore"><a href="/piao/">更多杭州演出门票信息&raquo;</a></div>--%>
    </div>
    <div class="wrapright" id="rightAdframe" style="display:none;">
        <div id="ad1" class="ads"></div>
        <div id="ad2" class="ads"></div>
    </div>
    <div class="clear"></div>
</div>

<div class="wrap"><h3></h3>
	<p class="tips">
        <%=city.ShortName %>票务频道为你提供最本地火车票、演出门票、电影票、游乐场门票信息。
        <%--我们全心全意服务于您，有任何意见建议请 <a href="http://about.flxxwang.com/" target="_blank">联系客服</a>--%>
    </p>
    <div class="others">
        <ul>
            <li><a href="<%=Url.Action("Index",new{city="bj"}) %>">北京票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="sh"}) %>">上海票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="sz"}) %>">深圳票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="su"}) %>">苏州票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="gz"}) %>">广州票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="wh"}) %>">武汉票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cd"}) %>">成都票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="tj"}) %>">天津票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cc"}) %>">长春票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="sy"}) %>">沈阳票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="qd"}) %>">青岛票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="km"}) %>">昆明票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="fz"}) %>">福州票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="jn"}) %>">济南票务</a></li>    
            <li><a href="<%=Url.Action("Index",new{city="hz"}) %>">杭州票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="wz"}) %>">温州票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cs"}) %>">长沙票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="jl"}) %>">吉林票务</a></li>
            <li><a href="<%=Url.Action("Index",new{city="dl"}) %>">大连票务</a></li>    
            <li><a href="<%=Url.Action("Index",new{city="hrb"}) %>">哈尔滨票务</a></li>
        </ul>
        <div class="clear"></div>
    </div>
    <div class="others">
        <ul class="friendlink">﻿
            <strong>友情链接</strong>:
            <%--<a href='http://lieche.flxxwang.com/' target='_blank'>火车时刻表查询</a>&nbsp;
            <a href='http://lieche.flxxwang.com/checi/dongche.html' target='_blank'>动车时刻表</a>&nbsp;  
            <a href="/link.html" target="_blank">更多...</a>&nbsp;
            <a href="#" target="_blank">自动申请链接</a>--%>
        </ul>
        <div class="clear"></div>
    </div>
</div>

<div id="footer">
    &copy; 2010 flxxwang.com  
    <a href="#">联系客服</a>
</div>
<script type="text/javascript">
    $(function () {
        $("a").attr("target", "_blank");
    });
</script>
</asp:Content>
