<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%var city = ViewData["City"] as City; %>
<title>【<%=city.ShortName %>二手车网】- <%=city.ShortName %><%=SiteInfo.Name%></title>
<meta name="keywords" content="<%=city.ShortName %>二手车网" />
<meta name="description" content="<%=SiteInfo.Name%><%=city.ShortName %>二手车网频道，拥有海量的二手车交易信息，包含了二手摩托车、二手汽车、拼车、租车等车辆服务信息，是<%=city.ShortName %>买卖二手车最佳的网上服务平台。" />
<link type="text/css" rel="stylesheet" href="/Content/Fenlei/ui6/index/categories.css?201171" />  
<%--<script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/boot_toplist_version.js"></script>--%>
<style type="text/css">.sixclass b{ font-size:14px; padding-bottom:4px; display:inline-block}.filterbar h2{float:left;height:21px; display:inline-block}.filterbar h2{margin-right:10px;font-size:14px; float:left; padding-top:8px}</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<%var city = ViewData["City"] as City; %>
<div id="header">
    <div id="headerinside">
        <div id="logo">
            <a href="<%=Url.Action("Default","Home") %>" target="_self">
                <img src="/Content/Fenlei/assets/images/logo/logo.gif" alt="中文最大生活信息门户"/>
            </a>
            <h1><span><a href="" target="_self"><b><%=city.ShortName %>二手车网</b></a></span></h1>
        </div>
        <%--<form onsubmit='b_query();return false;'>--%>
            <div id="searchbar" class="catec">
                <i id="key">
                    <input type="text" id="keyword" name="key" class="keyword" fdv="可输入品牌或车型" autocomplete="off" />
                </i>
                <i class="jobbtn">
                    <input  type="submit" name="button" class="btnall" id="searchbtn" value="搜索" onmousemove="this.className='btnal2'" onmouseout="this.className=''" />
                </i>
            </div>
        <%--</form>--%>
        <a href="<%=Url.Action("s2","post",new{values="che"}) %>" id="fabu"  rel="nofollow">免费发布信息</a>
    </div>
</div>

<div class="wrap contop">
	<ul class="sixclass">
    	<li>
            <b><a href="<%=Url.Action("ershouche")%>">二手车转让</a></b><br />
            <table class="sort" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="dogclass" style="line-height:20px">
                        <%
                            for (var i = 0; i < CarSecondHand.Singleton.ObjectTypeCollection.Count;i++ )
                            {
                                var item = CarSecondHand.Singleton.ObjectTypeCollection[i];
                                %>
                                <a href="<%=Url.Action("ershouche",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                                <%
                                if (i < CarSecondHand.Singleton.ObjectTypeCollection.Count - 1)
                                {
                                    if (i % 7 == 6)
                                    {
                                        %>
                                        <br />
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <cite>|</cite>
                                        <%
                                    }
                                }    
                            }
                        %>
                        <%--<a href="/jingjijiaoche/">轿车/跑车</a><cite>|</cite>
                        <a href="/yeuyeche/">越野车/SUV</a><cite>|</cite>
                        <a href="/mianbaoche/">面包车/MPV</a><cite>|</cite>
                        <a href="/keche/" class="select" name="b_link" para="cate" pk="ershouche">货车/客车</a>--%>
                    </td>
                </tr>
            </table>
        </li>
		<li>
            <b><a href="<%=Url.Action("ershoucheqg")%>">二手车求购</a></b><br />
        	<table class="sort" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="dogclass" style="line-height:20px">
                        <%
                            for (var i = 0; i < CarBuy.Singleton.TagCollection.Count;i++ )
                            {
                                var item = CarBuy.Singleton.TagCollection[i];
                                %>
                                <a href="<%=Url.Action("ershoucheqg") %>"><%=item.Name %></a>
                                <%
                                if (i < CarBuy.Singleton.TagCollection.Count - 1)
                                {
                                    if (i % 7 == 6)
                                    {
                                        %>
                                        <br />
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <cite>|</cite>
                                        <%
                                    }
                                }    
                            }
                        %>
                        <%--<a href="/jingjijiaocheqg/" >经济轿车</a><cite>|</cite>
                        <a href="/zhongjijiaocheqg/" >中级轿车</a><cite>|</cite>
                        <a href="/gaodangjiaocheqg/" >高档轿车</a><cite>|</cite>
                        <a href="/shangwucheqg/" >商务车</a><cite>|</cite>
                        <a href="/yueyecheqg/" >越野车</a><cite>|</cite>
                        <a href="/mianbaocheqg/" >面包车</a><cite>|</cite>
                        <a href="/kechezhongbaqg/" >客车/中巴</a><br />
                        <a href="/huochepikaqg/" >货车/皮卡 </a><cite>|</cite>
                        <a href="/xiangshihuocheqg/" >厢式货车</a>--%>
                    </td>
                </tr>
            </table>
        </li><div class="clear"></div>
        <li>
            <b><a href="<%=Url.Action("danche")%>">二手摩托车</a></b><br />
            <table class="sort" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="dogclass" style="line-height:20px">
                        <%
                            for (var i = 0; i < CarMotor.Singleton.ObjectTypeCollection.Count; i++)
                            {
                                var item = CarMotor.Singleton.ObjectTypeCollection[i];
                                %>
                                <a href="<%=Url.Action("danche",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                                <%
                                if (i < CarMotor.Singleton.ObjectTypeCollection.Count - 1)
                                {
                                    if (i % 7 == 6)
                                    {
                                        %>
                                        <br />
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <cite>|</cite>
                                        <%
                                    }
                                }    
                            }
                        %>
                    </td>
                </tr>
            </table>
        </li>
        <li style="height:62px; overflow:hidden">
            <b><a href="<%=Url.Action("zixingche")%>">自行车/电动车</a></b><br />
            <table class="sort" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="dogclass" style="line-height:20px">
                        <%
                            for (var i = 0; i < CarBicycle.Singleton.ObjectTypeCollection.Count; i++)
                            {
                                var item = CarBicycle.Singleton.ObjectTypeCollection[i];
                                %>
                                <a href="<%=Url.Action("zixingche",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                                <%
                                if (i < CarBicycle.Singleton.ObjectTypeCollection.Count - 1)
                                {
                                    if (i % 7 == 6)
                                    {
                                        %>
                                        <br />
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <cite>|</cite>
                                        <%
                                    }
                                }    
                            }
                        %>
                        <%--<a href="/fzixingche/" class="redlink">自行车</a><cite>|</cite>
                        <a href="/diandongche/">电动车</a><cite>|</cite>
                        <a href="/sanlunche/">三轮车</a><cite>|</cite>
                        <a href="/peijianzhuangbei/">配件/装备</a>--%>
                    </td>
                </tr>
            </table>
        </li><div class="clear"></div>
        <li>
            <b><a href="<%=Url.Action("zuche","huangye")%>">租车</a></b><br />
        	<table class="sort" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="dogclass" style="line-height:20px">
                        <%
                            var carCategory = InfoCategory.GetCategory(YellowPageType.ZuChe);
                            for (var i = 0; i < carCategory.ObjectTypeCollection.Count; i++)
                            {
                                var item = carCategory.ObjectTypeCollection[i];
                                %>
                                <a href="<%=Url.Action("zuche", "huangye", new { objecttype = item.Id })%>"><%=item.Name %></a>
                                <%
                                if (i < carCategory.ObjectTypeCollection.Count() - 1)
                                {
                                    if (i % 7 == 6)
                                    {
                                        %>
                                        <br />
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <cite>|</cite>
                                        <%
                                    }
                                }
                            }
                           
                        %>
                        <%--<a href="/zuchehang/">租车行</a><cite>|</cite>
                        <a href="/lvyouche/">旅游租车</a><cite>|</cite>
                        <a href="/shangwuzuche/">商务租车</a><cite>|</cite>
                        <a href="/sji/">司机</a>--%>
                    </td>
                </tr>
            </table>
        </li>
        <li>
            <b><a href="<%=Url.Action("pinche")%>">拼车/顺风车</a></b><br />
            <table class="sort" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="dogclass" style="line-height:20px">
                        <%
                            for (var i = 0; i < Carpool.Singleton.ObjectTypeCollection.Count; i++)
                            {
                                var item = Carpool.Singleton.ObjectTypeCollection[i];
                                %>
                                <a href="<%=Url.Action("pinche",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                                <%
                                if (i < Carpool.Singleton.ObjectTypeCollection.Count - 1)
                                {
                                    if (i % 7 == 6)
                                    {
                                        %>
                                        <br />
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <cite>|</cite>
                                        <%
                                    }
                                }    
                            }
                        %>
                        <%--<a href="/sxbpinche/">上下班拼车</a><cite>|</cite>
                        <a href="/changtupinche/">长途拼车</a><cite>|</cite>
                        <a href="/lvyoupinche/">拼车自驾游</a>--%>
                    </td>
                </tr>
            </table>
        </li><div class="clear"></div>
		<li>
            <b><a href="<%=Url.Action("peijia")%>">代驾/陪练/驾校</a></b><br />
        	<table class="sort" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="dogclass" style="line-height:20px">
                        <%
                            for (var i = 0; i < CarAccompany.Singleton.ObjectTypeCollection.Count; i++)
                            {
                                var item = CarAccompany.Singleton.ObjectTypeCollection[i];
                                %>
                                <a href="<%=Url.Action("peijia",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                                <%
                                if (i < CarAccompany.Singleton.ObjectTypeCollection.Count - 1)
                                {
                                    if (i % 7 == 6)
                                    {
                                        %>
                                        <br />
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <cite>|</cite>
                                        <%
                                    }
                                }    
                            }
                        %>
                        <%--<a href="/daijia/" >代驾</a><cite>|</cite>
                        <a href="/peilian/" >陪练</a><cite>|</cite>
                        <a href="/jiaxiaopx/" >驾校</a>--%>
                    </td>
                </tr>
            </table>
        </li>
		<li>
            <b><a href="<%=Url.Action("cheliangfuwu")%>">汽车服务/过户</a></b><br />
        	<table class="sort" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="dogclass" style="line-height:20px">
                        <%
                            for (var i = 0; i < CarService.Singleton.ObjectTypeCollection.Count; i++)
                            {
                                var item = CarService.Singleton.ObjectTypeCollection[i];
                                %>
                                <a href="<%=Url.Action("cheliangfuwu",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                                <%
                                if (i < CarService.Singleton.ObjectTypeCollection.Count - 1)
                                {
                                    if (i % 7 == 6)
                                    {
                                        %>
                                        <br />
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <cite>|</cite>
                                        <%
                                    }
                                }    
                            }
                        %>
                        <%--<a href="/qichejx/" >汽车检修</a><cite>|</cite>
                        <a href="/qixiu/" >汽车保养</a><cite>|</cite>
                        <a href="/maiche/" >4S店/经销商</a><cite>|</cite>
                        <a href="/qcyp/" >汽车服务</a><cite>|</cite>
                        <a href="/qichefuwu/" >保险理赔过户</a>--%>
                    </td>
                </tr>
            </table>
        </li><div class="clear"></div>
        <li>
            <b><a href="<%=Url.Action("peijian")%>">汽车配件</a></b><br />
        	<table class="sort" cellpadding="0" cellspacing="0">
                <tr>
                	<td class="dogclass" style="line-height:20px">
                        <%
                            for (var i = 0; i < CarFitting.Singleton.ObjectTypeCollection.Count; i++)
                            {
                                var item = CarFitting.Singleton.ObjectTypeCollection[i];
                                %>
                                <a href="<%=Url.Action("peijian",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                                <%
                                if (i < CarFitting.Singleton.ObjectTypeCollection.Count - 1)
                                {
                                    if (i % 7 == 6)
                                    {
                                        %>
                                        <br />
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <cite>|</cite>
                                        <%
                                    }
                                }    
                            }
                        %>
                        <%--<a href="/qichepeijian/">发动机配件</a><cite>|</cite>
                        <a href="/qichegaizhuang/">汽车底盘</a><cite>|</cite>
                        <a href="/tongxundaohang/">车身附件</a><cite>|</cite>
                        <a href="/dianzidianqi/">电子电器</a><cite>|</cite>
                        <a href="/shitingshebei/">视听设备</a><cite>|</cite>
                        <a href="/fanghubaoyang/">养护用品</a>--%>
                    </td>
                </tr>
            </table>
        </li>
        <li>
            <b><a href="<%=Url.Action("qita")%>">其他</a></b><br />
        </li>
        <div class="clear"></div>
    </ul>
    <div class="clear"></div>
</div>

<div class="wrap">
    <div class="cbleft" id="global">
    	<%--<i class="lt"></i>
        <i class="rt"></i>
        <div class="tabs">
            <p>
        	    <a href="/ershouche/" target="_self" class='select'><span>全杭州二手车网信息</span></a>
                <a href="/aodi/">奥迪</a><i class="gap">|</i><a href="/aotuo/">奥拓</a><i class="gap">|</i>
                <a href="/baoma/">宝马</a><i class="gap">|</i><a href="/benchi/">奔驰</a><i class="gap">|</i>
                <a href="/bentian/">本田</a><i class="gap">|</i><a href="/bieke/">别克</a><i class="gap">|</i>
                <a href="/biyadi/">比亚迪</a><i class="gap">|</i><a href="/dazhong/">大众</a><i class="gap">|</i>
                <a href="/sangtana/">桑塔纳</a><i class="gap">|</i><a href="/jieda/">捷达</a><i class="gap">|</i>
                <a href="/fengtian/">丰田</a><i class="gap">|</i><a href="/fute/">福特</a><i class="gap">|</i>
                <a href="/jili/">吉利</a><i class="gap">|</i><a href="/mazida/">马自达</a><i class="gap">|</i>
                <a href="/nisang/">尼桑</a><i class="gap">|</i><a href="/qirui/">奇瑞</a><i class="gap">|</i>
                <a href="/xiali/">夏利</a>
            </p>
        </div>
        <div class="clear"></div>
        <div class="filterbar">
            <h2>杭州二手车网信息</h2>
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

        <%--<div id="newc_inof">
	        <div id="top_google_ad"></div>
	        <table class="tbimg" cellpadding="0" cellspacing="0">
                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			        <td class="img">
                        <a href="http://hz.flxxwang.com/ershouche/7843087100165x.shtml" target="_blank" title="便宜出售北汽 212 2002款 BJ2023F1">
                            <img src="http://pic2.flxxwang.com/n/images/none.gif" />
                        </a>
                    </td>
                    <td class="pred"><b>1.8万</b>元</td>
                    <td class="t">
			        	<a href="http://hz.flxxwang.com/ershouche/7843087100165x.shtml" target="_blank" class="t">
                            便宜出售北汽 212 2002款 BJ2023F1
                        </a>
                        (杭州)<br />
                        排量2.2升<span class='slash'>/</span> 手动 <span class='slash'>/</span> 黑色 <span class='slash'>/</span> 购于1999年 <span class='slash'>/</span> 已行驶12万公里公里
                    </td>
                    <td class="pred2" style="width:100px">4分钟前</td>
		        </tr>

                <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			        <td class="img">
                        <a href="http://hz.flxxwang.com/ershouche/7843066520578x.shtml" target="_blank" title="本田 奥德赛 2009款 2.4 自动领秀版">
                            <img src="http://pic.flxxwang.com/p1/small/n_15103663834130.jpg" />
                        </a>
                    </td>
                    <td class="pred"><b>16.9万</b>元</td>
                    <td class="t">
			        	<a href="http://hz.flxxwang.com/ershouche/7843066520578x.shtml" target="_blank" class="t">
                            本田 奥德赛 2009款 2.4 自动领秀版
                        </a>
                        (杭州)<br />
                        排量2.4升<span class='slash'>/</span> 自动 <span class='slash'>/</span> 银灰色 <span class='slash'>/</span> 购于2008年 <span class='slash'>/</span> 已行驶5万公里公里
                    </td>
                    <td class="pred2" style="width:100px">6分钟前</td>
		        </tr>

<tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			    <td class="img"><a href="http://hz.flxxwang.com/ershouche/7843011501573x.shtml" target="_blank" title="城市快运优尼柯8000便宜卖了"><img src="http://pic2.flxxwang.com/n/images/none.gif" /></a>
                </td>
                <td class="pred"><b>0.8万</b>元</td>
                <td class="t">
			        <a href="http://hz.flxxwang.com/ershouche/7843011501573x.shtml" target="_blank" class="t">城市快运优尼柯8000便宜卖了</a>
					(杭州)
						
	            <br />排量<span class='slash'>/</span>  <span class='slash'>/</span> 银灰色 <span class='slash'>/</span> 购于2002年 <span class='slash'>/</span> 已行驶13万公里公里
 
                </td>
                <td class="pred2" style="width:100px">13分钟前</td>
		    </tr>

<tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			    <td class="img"><a href="http://hz.flxxwang.com/ershouche/7842992337539x.shtml" target="_blank" title="吉利 美日之星"><img src="http://pic2.flxxwang.com/n/images/none.gif" /></a>
                </td>
                <td class="pred"><b>1.25万</b>元</td>
                <td class="t">
			        <a href="http://hz.flxxwang.com/ershouche/7842992337539x.shtml" target="_blank" class="t">吉利 美日之星</a>
					(杭州)
						
	            <br />排量<span class='slash'>/</span>  <span class='slash'>/</span> 银灰色 <span class='slash'>/</span> 购于2006年 <span class='slash'>/</span> 已行驶13万公里公里
 
                </td>
                <td class="pred2" style="width:100px">15分钟前</td>
		    </tr>

<tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			    <td class="img"><a href="http://hz.flxxwang.com/ershouche/7842983111432x.shtml" target="_blank" title="本田飞度转让"><img src="http://pic2.flxxwang.com/n/images/none.gif" /></a>
                </td>
                <td class="pred"><b>6.1万</b>元</td>
                <td class="t">
			        <a href="http://hz.flxxwang.com/ershouche/7842983111432x.shtml" target="_blank" class="t">本田飞度转让</a>
					(杭州)
						
	            <br />排量<span class='slash'>/</span>  <span class='slash'>/</span> 蓝色 <span class='slash'>/</span> 购于2006年 <span class='slash'>/</span> 已行驶14万公里公里
 
                </td>
                <td class="pred2" style="width:100px">17分钟前</td>
		    </tr>

            <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			    <td class="img"><a href="http://hz.flxxwang.com/ershouche/7833306587138x.shtml" target="_blank" title="好车丰田转让"><img src="http://pic.flxxwang.com/p1/small/n_15103402673676.jpg" /></a>
                </td>
                <td class="pred"><b>3万</b>元</td>
                <td class="t">
			        <a href="http://hz.flxxwang.com/ershouche/7833306587138x.shtml" target="_blank" class="t">好车丰田转让</a>
					(杭州)
						
	            <br />排量<span class='slash'>/</span>  <span class='slash'>/</span> 黑色 <span class='slash'>/</span> 购于2008年 <span class='slash'>/</span> 已行驶6万公里公里
 
                </td>
                <td class="pred2" style="width:100px">19分钟前</td>
		    </tr>

            <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			    <td class="img"><a href="http://hz.flxxwang.com/ershouche/7476824782340x.shtml" target="_blank" title="大众 途安 2004款 2.0L 5座自舒"><img src="http://pic.flxxwang.com/p1/small/n_15103336028688.jpg" /></a>
                </td>
                <td class="pred"><b>8.58万</b>元</td>
                <td class="t">
			        <a href="http://hz.flxxwang.com/ershouche/7476824782340x.shtml" target="_blank" class="t">大众 途安 2004款 2.0L 5座自舒</a>
					(杭州-萧山-萧山周边)
						
	            <br />排量2.0升<span class='slash'>/</span> 自动 <span class='slash'>/</span> 银灰色 <span class='slash'>/</span> 购于2005年 <span class='slash'>/</span> 已行驶8万公里公里
 
                </td>
                <td class="pred2" style="width:100px">25分钟前</td>
		    </tr>

            <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			    <td class="img"><a href="http://hz.flxxwang.com/ershouche/7842880401031x.shtml" target="_blank" title="雪佛兰 2007款乐驰SPARK"><img src="http://pic2.flxxwang.com/n/images/none.gif" /></a>
                </td>
                <td class="pred"><b>2.78万</b>元</td>
                <td class="t">
			        <a href="http://hz.flxxwang.com/ershouche/7842880401031x.shtml" target="_blank" class="t">雪佛兰 2007款乐驰SPARK</a>
					(杭州)
						
	            <br />排量<span class='slash'>/</span>  <span class='slash'>/</span> 蓝色 <span class='slash'>/</span> 购于2007年 <span class='slash'>/</span> 已行驶5万公里公里
 
                </td>
                <td class="pred2" style="width:100px">30分钟前</td>
		    </tr>

            <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			    <td class="img"><a href="http://hz.flxxwang.com/ershouche/7842766443526x.shtml" target="_blank" title="斯巴鲁 翼豹 2008款 2.0R 两厢自动版"><img src="http://pic.flxxwang.com/p1/small/n_15103276675855.jpg" /></a>
                </td>
                <td class="pred"><b>14.5万</b>元</td>
                <td class="t">
			        <a href="http://hz.flxxwang.com/ershouche/7842766443526x.shtml" target="_blank" class="t">斯巴鲁 翼豹 2008款 2.0R 两厢自动版</a>
					(杭州)
						
	            <br />排量2.0升<span class='slash'>/</span> 自动 <span class='slash'>/</span> 黑色 <span class='slash'>/</span> 购于2008年 <span class='slash'>/</span> 已行驶6.4万公里公里
 
                </td>
                <td class="pred2" style="width:100px">43分钟前</td>
		    </tr>

            <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			    <td class="img"><a href="http://hz.flxxwang.com/ershouche/7842778856067x.shtml" target="_blank" title="大众 新宝来 2011款 1.4T 手动舒适型"><img src="http://pic2.flxxwang.com/n/images/none.gif" /></a>
                </td>
                <td class="pred"><b>6万</b>元</td>
                <td class="t">
			        <a href="http://hz.flxxwang.com/ershouche/7842778856067x.shtml" target="_blank" class="t">大众 新宝来 2011款 1.4T 手动舒适型</a>
					(杭州)
						
	            <br />排量1.4升<span class='slash'>/</span> 手动 <span class='slash'>/</span> 银灰色 <span class='slash'>/</span> 购于2010年 <span class='slash'>/</span> 已行驶3万公里公里
 
                </td>
                <td class="pred2" style="width:100px">43分钟前</td>
		    </tr>

            <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			    <td class="img"><a href="http://hz.flxxwang.com/ershouche/7842720546563x.shtml" target="_blank" title="大众普桑卖了"><img src="http://pic2.flxxwang.com/n/images/none.gif" /></a>
                </td>
                <td class="pred"><b>2.3万</b>元</td>
                <td class="t">
			        <a href="http://hz.flxxwang.com/ershouche/7842720546563x.shtml" target="_blank" class="t">大众普桑卖了</a>
					(杭州)
						
	            <br />排量<span class='slash'>/</span>  <span class='slash'>/</span> 黑色 <span class='slash'>/</span> 购于2003年 <span class='slash'>/</span> 已行驶18万公里公里
 
                </td>
                <td class="pred2" style="width:100px">51分钟前</td>
		    </tr>

            <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			    <td class="img"><a href="http://hz.flxxwang.com/ershouche/7842645003272x.shtml" target="_blank" title="本田 飞度 2006款 1.5 CVT舒适版"><img src="http://pic.flxxwang.com/p1/small/n_15102826991120.jpg" /></a>
                </td>
                <td class="pred"><b>6.58万</b>元</td>
                <td class="t">
			        <a href="http://hz.flxxwang.com/ershouche/7842645003272x.shtml" target="_blank" class="t">本田 飞度 2006款 1.5 CVT舒适版</a>
					(杭州)
						
	            <br />排量1.5升<span class='slash'>/</span> 自动 <span class='slash'>/</span> 红色 <span class='slash'>/</span> 购于2006年 <span class='slash'>/</span> 已行驶7万公里公里
 
                </td>
                <td class="pred2" style="width:100px">1小时前</td>
		    </tr>

            <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			    <td class="img"><a href="http://hz.flxxwang.com/ershouche/7842584456327x.shtml" target="_blank" title="大众 POLO劲取 2006款 1.6L 手自一体"><img src="http://pic2.flxxwang.com/n/images/none.gif" /></a>
                </td>
                <td class="pred"><b>3.98万</b>元</td>
                <td class="t">
			        <a href="http://hz.flxxwang.com/ershouche/7842584456327x.shtml" target="_blank" class="t">大众 POLO劲取 2006款 1.6L 手自一体</a>
					(杭州)
						
	            <br />排量1.6升<span class='slash'>/</span> 自动 <span class='slash'>/</span> 白色 <span class='slash'>/</span> 购于2003年 <span class='slash'>/</span> 已行驶17万公里公里
 
                </td>
                <td class="pred2" style="width:100px">1小时前</td>
		    </tr>

            <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			    <td class="img"><a href="http://hz.flxxwang.com/ershouche/7793844122886x.shtml" target="_blank" title="高防本田CRV的双环3.2万"><img src="http://pic.flxxwang.com/p1/small/n_15005951434769.jpg" /></a>
                </td>
                <td class="pred"><b>3.2万</b>元</td>
                <td class="t">
			        <a href="http://hz.flxxwang.com/ershouche/7793844122886x.shtml" target="_blank" class="t">高防本田CRV的双环3.2万</a>
					(杭州-桐庐)
						
	            <br />排量2.2升<span class='slash'>/</span> 手动 <span class='slash'>/</span> 白色 <span class='slash'>/</span> 购于2005年 <span class='slash'>/</span> 已行驶6万公里公里
 
                </td>
                <td class="pred2" style="width:100px">1小时前</td>
		    </tr>

            <tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'" >
			    <td class="img"><a href="http://hz.flxxwang.com/ershouche/7799654702086x.shtml" target="_blank" title="越野车/SUV)酷视仿宝马X5的越野车4.6万"><img src="http://pic.flxxwang.com/p1/small/n_15016923547154.jpg" /></a>
                </td>
                <td class="pred"><b>4.6万</b>元</td>
                <td class="t">
			        <a href="http://hz.flxxwang.com/ershouche/7799654702086x.shtml" target="_blank" class="t">越野车/SUV)酷视仿宝马X5的越野车4.6万</a>
					(杭州-桐庐)
						
	            <br />排量2.4升<span class='slash'>/</span> 自动 <span class='slash'>/</span> 银灰色 <span class='slash'>/</span> 购于2006年 <span class='slash'>/</span> 已行驶6万公里公里
 
                </td>
                <td class="pred2" style="width:100px">1小时前</td>
		    </tr>
        </table>
        </div>--%>

    	<%--<div id="bottom_google_ad"></div>--%>
        <%--广告位置--%>

        <%--<p class="lookmore"><a href="/ershouche/">更多杭州二手车信息&raquo;</a></p>--%>
    </div>

    <!---right--->
    <div class="cbright" id="rightAdframe" style="display:none;">
    	<div id="ad1" class="crpic"></div>
        <div id="ad2" class="crpic"></div>
    </div>
</div>

<div class="clear"></div>
<div class="wrap">
	<h3></h3>
	<p class="tips">
        <%=city.Name %>二手车网频道为你提供<%=city.Name %>二手车网信息的免费查询及发布服务，每天有数万的<%=city.Name %>二手车网信息。是你查找和选择<%=city.Name %>二手车网信息的最佳平台。
        <%--欢迎 <a href="http://about.flxxwang.com/" target="_blank" style="color:#00c" rel="nofollow">联系客服</a>--%>
    </p>
    <div class="others">
        <ul>
            <li><a href='<%=Url.Action("Index", new {city="bj"})%>'>北京二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="sh"})%>'>上海二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="gz"})%>'>广州二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="sz"})%>'>深圳二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="tj"})%>'>天津二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="hz"})%>'>杭州二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="wh"})%>'>武汉二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="xa"})%>'>西安二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="cd"})%>'>成都二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="zz"})%>'>郑州二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="jn"})%>'>济南二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="sjz"})%>'>石家庄二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="fs"})%>'>佛山二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="cq"})%>'>重庆二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="sy"})%>'>沈阳二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="hrb"})%>'>哈尔滨二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="cs"})%>'>长沙二手车网</a></li>
            <li><a href='<%=Url.Action("Index", new {city="su"})%>'>苏州二手车网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="qd"})%>">青岛二手车网</a></li>  
		    <li><a href="<%=Url.Action("Index", new {city="nb"})%>">宁波二手车网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="nj"})%>">南京二手车网</a></li> 
	    </ul><div class="clear"></div>
    </div>
	<div class="others">
        <ul class="friendlink">
            ﻿<strong>友情链接</strong>:
            <a href='http://auto.eastday.com/' target='_blank'>东方网汽车频道</a>&nbsp;
            <a href='http://www.c571.com' target='_blank'>杭州二手车</a>&nbsp;
            <a href='http://hz.kuche.com/' target='_blank'>杭州二手车网</a>&nbsp;
            <a href='http://hz.kuche.com/ershouche/' target='_blank'>杭州二手车交易网</a>&nbsp;  
            <%--<a href="/link.html" target="_blank">更多...</a>&nbsp;--%>
            <%--<a href="#" target="_blank">自动申请链接</a>--%>
        </ul>
	</div>
</div>

<div id="footer">
    &copy; flxxwang.com <a href="http://about.flxxwang.com/" title="有问题请与<%=SiteInfo.Name%>客服进行对话" id="askicon" rel="nofollow">联系客服</a>
</div>

<script type="text/javascript">
    $(function () {
        $("a").attr("target", "_blank");
    });
</script>
</asp:Content>
