<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%var city = ViewData["City"] as City; %>
    <title>【<%=city.ShortName %>房产网】<%=city.ShortName %>房产信息网 - <%=city.ShortName %><%=SiteInfo.Name%></title>
    <meta name="Keywords" content="<%=city.ShortName %>房产网,<%=city.ShortName %>房产信息网" />
    <meta name="Description" content="<%=city.ShortName %>房产网频道为<%=city.ShortName %>网民提供最新、最真实的租房、二手房、合租、短租房、写字楼及厂房仓库等<%=city.ShortName %>房产信息，免费查询或发布<%=city.ShortName %>房产信息，就到<%=SiteInfo.Name%><%=city.ShortName %>房产网。" /> 
    <%--<script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/boot_toplist_version.js"></script>--%>
    <link type="text/css" href="/Content/Fenlei/ui6/fang/class_fang.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <%var city = ViewData["City"] as City; %>
    <div id="header">
        <a href="<%=Url.Action("Default","Home") %>" id="minlogo"><%=city.ShortName %><%=SiteInfo.Name%></a>
        <span id="crumbs">
            <a href="/"><%=city.ShortName %><%=SiteInfo.Name%></a>
            <a href='<%=Url.Action("Index","FangChan") %>'><%=city.ShortName %>房产信息</a>
        </span>
    </div>

    <%--<div class="sorts">
        <div class="sortstop">
            <div id="searchBox">
                <form onsubmit="b_query('final=1&searchtype=6');return false;">
                    <span class="text">
                        <input type="text" para="key" name="b_q" fdv="请输入房产相关信息" value="" id="keyword" autocomplete="off"/>
                    </span>
                    <span class="btn">
                        <input type="submit" onmouseover="this.className='u'" onmouseout="this.className=''" id="searchbtn" value="搜索" />
                    </span>
                </form>
            </div>
            <a href="<%=Url.Action("s2","post",new{values="fangchan"}) %>"  id="fabu">免费发布信息</a>
            <div class="clear"></div>
            <div class="hotnews">
                近期热点： 
                <a href="<%=Url.Action("ershoufang") %>" target="_blank">婚房全攻略</a>
                <a href="<%=Url.Action("shangpu") %>" target="_blank">投资选商铺</a>
                <a href="<%=Url.Action("zufang") %>" target="_blank">考研热租区域</a>
                <a href="<%=Url.Action("duanzu") %>" target="_blank">旅游住宿新主张</a>
                <a href="<%=Url.Action("zufang",new{pricerange=5,minprice=500,maxprice=1500}) %>" target="_blank">青年白领租房</a> 
            </div>
            <div class="clear"></div>
            <div class="numsorts ico_house">
                普通住宅：
                <span><b><a href="<%=Url.Action("zufang") %>">租房</a></b><i>359551</i>条</span>
                <span><b><a href="<%=Url.Action("ershoufang") %>">二手房</a></b><i>106883</i>条</span>
                <span><b><a href="<%=Url.Action("duanzu") %>">短租房</a></b><i>5560</i>条</span>
                <span><b><a href="<%=Url.Action("qiuzu") %>">求租房</a></b><i>6808</i>条</span>
            </div>
            <div class="numsorts ico_building">
                商业地产：
                <span><b><a href="<%=Url.Action("xiezilou") %>">写字楼</a></b><i>21639</i>条</span>
                <span><b><a href="<%=Url.Action("shangpu") %>">生意/商铺</a></b><i>37564</i>条</span>
                <span><b><a href="<%=Url.Action("qita") %>">厂房/仓库/土地</a></b><i>5058</i>条</span>
            </div>
            <div class="clear"></div>
            <div class="xytree">
                <a href="#" target="_blank" title="马上许愿"><b>找房愿望树</b><br />马上许愿&raquo;</a>
            </div>
            <div class="clear"></div>
        </div>
    </div>--%>

    <div id="main">
        <div class="cleft" id="infolist">
            <ul class="uls">
                <li>
                    <h2><a href="<%=Url.Action("zufang") %>"><%=city.ShortName %>租房</a></h2>
                    <p>
                        <a href="<%=Url.Action("zufang") %>">整套出租</a>
                        <a href="<%=Url.Action("hezu") %>">单间出租</a>
                        <a href="<%=Url.Action("bed") %>">床位</a>
                    </p>
                </li>
                <li>
                    <h2><a href="<%=Url.Action("ershoufang")%>">杭州二手房</a></h2>
                    <p>
                        <a href="<%=Url.Action("ershoufang")%>">一室</a>
                        <a href="<%=Url.Action("ershoufang")%>">二室</a>
                        <a href="<%=Url.Action("ershoufang")%>">三室</a>
                        <a href="<%=Url.Action("ershoufang")%>">四室</a>
                        <a href="<%=Url.Action("ershoufang")%>">四室以上</a>
                    </p>
                </li>
                <li class="npad">
                    <h2> <a href="<%=Url.Action("duanzu")%>">短租房/日租房</a></h2>
                    <p>
                        <a href="<%=Url.Action("duanzu", new {objecttype=1})%>">家庭旅馆</a>
                        <a href="<%=Url.Action("duanzu", new {objecttype=2})%>">高档公寓</a>
                        <a href="<%=Url.Action("duanzu", new {objecttype=3})%>">商务酒店</a>
                        <a href="<%=Url.Action("duanzu")%>">更多</a>
                    </p>
                </li>
                <li>
                    <h2><a href="<%=Url.Action("xiezilou")%>">写字楼</a></h2>
                    <p>
                        <a href="<%=Url.Action("xiezilou", new {objecttype=1})%>">写字楼</a>
                        <a href="<%=Url.Action("xiezilou", new {objecttype=2})%>">商务中心</a>
                        <a href="<%=Url.Action("xiezilou", new {objecttype=3})%>">商住公寓</a>
                        <a href="<%=Url.Action("xiezilou")%>">更多</a>
                    </p>
                </li>
                <li>
                    <h2><a href="<%=Url.Action("shangpu")%>">生意/商铺</a></h2>
                    <p>
                        <a href="<%=Url.Action("shangpu", new {objecttype=1})%>">商铺/门面/店面</a>
                        <a href="<%=Url.Action("shangpu", new {objecttype=2})%>">摊位/柜台</a>
                        <a href="<%=Url.Action("shangpu")%>">更多</a>
                    </p>
                </li>
                <li class="npad">
                    <h2><a href="<%=Url.Action("qita")%>">厂房/仓库/土地</a></h2>
                    <p>
                        <a href="<%=Url.Action("qita", new {objecttype=4})%>">厂房</a>
                        <a href="<%=Url.Action("qita", new {objecttype=2})%>">车库</a>
                        <a href="<%=Url.Action("qita", new {objecttype=3})%>">土地</a>
                        <a href="<%=Url.Action("qita", new {objecttype=1})%>">仓库</a>
                        <a href="<%=Url.Action("qita")%>">更多</a>
                    </p>
                </li>
                <div class="clear"></div>
            </ul>
            <%--<div class="bests">
                <div id="filter">
                    <div class="tabs">
                        <a class='select' href="/zufang/"><span>您可能在找</span></a>
                    </div>
                </div>
                <ul>
                    <li>
                        <p class="scrpicimg">
                            <a href='http://hz.flxxwang.com/zufang/7841992256264x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_15101499428370.jpg'/>
                            </a>
                            <img src="http://pic2.flxxwang.com/ui6/fang/images/ico_zu.gif" class="ico15"/>
                        </p>
                        <a href='http://hz.flxxwang.com/zufang/7841992256264x.shtml' target="_blank">一室0厅</a>，面议<br />
                        <a href="/xihujingqu/zufang/">西湖</a>- <a href="/xixi/zufang/">西溪</a>
                    </li>
                    <li>
                        <p class="scrpicimg">
                            <a href='http://hz.flxxwang.com/zufang/7832347022600x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_15082172872210.jpg'/>
                            </a>
                            <img src="http://pic2.flxxwang.com/ui6/fang/images/ico_zu.gif" class="ico15"/>
                        </p>
                        <a href='http://hz.flxxwang.com/zufang/7832347022600x.shtml' target="_blank">两室2厅</a>，<b>1100</b>元<br />
                        <a href="/xiacheng/zufang/">下城</a>- <a href="/dongxin/zufang/">东新</a>
                    </li>
                    <li>
                        <p class="scrpicimg">
                            <a href='http://hz.flxxwang.com/zufang/7711107895555x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_14839754341133.jpg'/>
                            </a>
                            <img src="http://pic2.flxxwang.com/ui6/fang/images/ico_zu.gif" class="ico15"/>
                        </p>
                        <a href='http://hz.flxxwang.com/zufang/7711107895555x.shtml' target="_blank">三室2厅</a>，<b>950</b>元<br />
                        <a href="/jianggan/zufang/">江干</a>- <a href="/sanliting/zufang/">三里亭</a>
                    </li>
                    <li>
                        <p class="scrpicimg">
                            <a href='http://hz.flxxwang.com/zufang/7820318801924x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_15058040363276.jpg'/>
                            </a>
                            <img src="http://pic2.flxxwang.com/ui6/fang/images/ico_zu.gif" class="ico15"/>
                        </p>
                        <a href='http://hz.flxxwang.com/zufang/7820318801924x.shtml' target="_blank">三室2厅</a>，<b>1200</b>元<br />
                        <a href="/jianggan/zufang/">江干</a>- <a href="/zhalongkou/zufang/">闸弄口</a>
                    </li>
                    <li>
                        <p class="scrpicimg">
                            <a href='http://hz.flxxwang.com/zufang/7841675212679x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_15100856937230.jpg'/>
                            </a>
                            <img src="http://pic2.flxxwang.com/ui6/fang/images/ico_zu.gif" class="ico15"/>
                        </p>
                        <a href='http://hz.flxxwang.com/zufang/7841675212679x.shtml' target="_blank">两室1厅</a>，<b>2500</b>元<br />
                        <a href="/xihujingqu/zufang/">西湖</a>- <a href="/wenerlu/zufang/">文二路</a>
                    </li>
                </ul>
                <div class="clear"></div>
            </div>
            <div class="ztad">
                <a href="http://www.flxxwang.com/byj/index.html" title="58房产租房帮" target="_blank">
                    <img src="http://www.flxxwang.com/byj/otherimg/byj830x90.jpg"/>
                </a>
            </div>
            <div class="height10"></div>
            <div id="filter">
                <div class="tabs">
                    <a class='select' href="/zufang/"><span>全杭州</span></a>   
                    <a href='/xihuqu/zufang/' target='_blank'><span>西湖</span></a>
                    <a href='/gongshu/zufang/' target='_blank'><span>拱墅</span></a>
                    <a href='/jianggan/zufang/' target='_blank'><span>江干</span></a>
                    <a href='/xiacheng/zufang/' target='_blank'><span>下城</span></a>
                    <a href='/hzshangcheng/zufang/' target='_blank'><span>上城</span></a>
                    <a href='/yuhang/zufang/' target='_blank'><span>余杭</span></a>
                    <a href='/xiaoshan/zufang/' target='_blank'><span>萧山</span></a>
                    <a href='/binjiang/zufang/' target='_blank'><span>滨江</span></a>
                    <a href='/jiandeshi/zufang/' target='_blank'><span>建德</span></a>
                    <a href="/zufang/"><span>更多区域&raquo;</span></a>  
                </div>
            </div>
    
            <table width="100%" cellpadding="0" cellspacing="0" border="0" class="tblist">
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7842042141064x.shtml" target="_blank" class="t_a">古荡新村    《 房租可月付 》   文三路</a><a href="/xihujingqu/zufang/" class="c_58">西湖</a>- <a href="/gudang/zufang/" class="c_58">古荡</a></td>
                    <td width="20%"><b class='pri'>450</b>元</td>
                    <td width="20%">2分钟前</td>
                </tr>
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7842022538502x.shtml" target="_blank" class="t_a">温馨人家绝对最低价的房子出租</a><a href="/binjiang/zufang/" class="c_58">滨江</a>- <a href="/xixing/zufang/" class="c_58">西兴</a></td>
                    <td width="20%"><b class='pri'>2000</b>元</td>
                    <td width="20%">2分钟前</td>
                </tr>
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7842040013447x.shtml" target="_blank" class="t_a">国都公寓  平安居 凤起路 市中心黄金地段随时入住</a><a href="/xiacheng/zufang/" class="c_58">下城</a>- <a href="/wulin/zufang/" class="c_58">武林</a></td>
                    <td width="20%"><b class='pri'>3500</b>元</td>
                    <td width="20%">2分钟前</td>
                </tr>
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7842015524614x.shtml" target="_blank" class="t_a">闸弄口新村   《 艮山西路 》   秋涛北路</a><a href="/jianggan/zufang/" class="c_58">江干</a>- <a href="/zhalongkou/zufang/" class="c_58">闸弄口</a></td>
                    <td width="20%"><b class='pri'>500</b>元</td>
                    <td width="20%">3分钟前</td>
                </tr>
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7842013474438x.shtml" target="_blank" class="t_a">绿洲花园好房出租,干净整洁,随时入住</a><a href="/zufang/" class="c_58">杭州</a>- <a href="/xiacheng/zufang/" class="c_58">下城</a></td>
                    <td width="20%"><b class='pri'>1600</b>元</td>
                    <td width="20%">3分钟前</td>
                </tr>
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7808875270146x.shtml" target="_blank" class="t_a">采光极佳,看房子有钥匙,简装清爽干净,通风性好</a><a href="/jianggan/zufang/" class="c_58">江干</a>- <a href="/kaixuan/zufang/" class="c_58">凯旋/采荷</a></td>
                    <td width="20%"><b class='pri'>1500</b>元</td>
                    <td width="20%">3分钟前</td>
                </tr>
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7842028849541x.shtml" target="_blank" class="t_a">武林小广场  《 房租可月付 》  杭州大厦边</a><a href="/xiacheng/zufang/" class="c_58">下城</a>- <a href="/wulin/zufang/" class="c_58">武林</a></td>
                    <td width="20%"><b class='pri'>400</b>元</td>
                    <td width="20%">4分钟前</td>
                </tr>
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7842024543880x.shtml" target="_blank" class="t_a">盛元慧谷家电家具全齐，房东诚心出租    绝对超值</a><a href="/binjiang/zufang/" class="c_58">滨江</a>- <a href="/puyan/zufang/" class="c_58">浦沿</a></td>
                    <td width="20%"><b class='pri'>2500</b>元</td>
                    <td width="20%">4分钟前</td>
                </tr>
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7842022046983x.shtml" target="_blank" class="t_a">精装，品牌小区，阳光无遮挡</a><a href="/binjiang/zufang/" class="c_58">滨江</a>- <a href="/puyan/zufang/" class="c_58">浦沿</a></td>
                    <td width="20%"><b class='pri'>3500</b>元</td>
                    <td width="20%">4分钟前</td>
                </tr>
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7842026726664x.shtml" target="_blank" class="t_a">崇化小区中套出租</a><a href="/xiaoshan/zufang/" class="c_58">萧山</a>- <a href="/chengxiang/zufang/" class="c_58">城厢</a></td>
                    <td width="20%"><b class='pri'>1100</b>元</td>
                    <td width="20%">4分钟前</td>
                </tr>
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7842002018566x.shtml" target="_blank" class="t_a">彩虹城，太阳国际，国信嘉园，盛元慧谷</a><a href="/binjiang/zufang/" class="c_58">滨江</a>- <a href="/puyan/zufang/" class="c_58">浦沿</a></td>
                    <td width="20%"><b class='pri'>2800</b>元</td>
                    <td width="20%">5分钟前</td>
                </tr>
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7841999235206x.shtml" target="_blank" class="t_a">采荷小区    《 庆春东路 》    南肖埠</a><a href="/jianggan/zufang/" class="c_58">江干</a>- <a href="/kaixuan/zufang/" class="c_58">凯旋/采荷</a></td>
                    <td width="20%"><b class='pri'>550</b>元</td>
                    <td width="20%">5分钟前</td>
                </tr>
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7842017089283x.shtml" target="_blank" class="t_a">莫干山路登云路口,和睦新村</a><a href="/gongshu/zufang/" class="c_58">拱墅</a>- <a href="/hemu/zufang/" class="c_58">和睦</a></td>
                    <td width="20%"><b class='pri'>1500</b>元</td>
                    <td width="20%">5分钟前</td>
                </tr>
                <tr>
                    <td class="t"><a href="http://hz.flxxwang.com/zufang/7842010471943x.shtml" target="_blank" class="t_a">和睦新村   《 房租可月付 》   莫干山路</a><a href="/gongshu/zufang/" class="c_58">拱墅</a>- <a href="/hemu/zufang/" class="c_58">和睦</a></td>
                    <td width="20%"><b class='pri'>450</b>元</td>
                    <td width="20%">6分钟前</td>
                </tr>
            </table>

            <table width="100%" cellpadding="0" cellspacing="0" border="0" class="tblist">
                <tr>
                    <td colspan="3" class="t">
                        <a href="http://www.taofang.com" target="_blank" class="f14">淘房网</a>
                        <a href="http://www.taofang.com" target="_blank" class="f14">www.taofang.com</a> - “效果导向”的新型网络房产平台，拥有独创的房源分析后台，打造经纪人个人品牌的第一选择!
                    </td>
                </tr>	
            </table>--%>

            <%--<div id="bottom_google_ad"></div>--%>
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
            <%----%>

            
        </div>

        <%--<div class="cright" id="rightframe">
            <div class="sortsright">
                <h2>房不胜房</h2>
                <ul class="item">
                    <li><a href="http://www.flxxwang.com/byj/index.html" target="_blank">毕业合租&报到短租看...</a></li>
                    <li><a href="http://q.flxxwang.com/fangchan/topic_706550.shtml" target="_blank">租房注意事项</a></li>
                    <li><a href="http://q.flxxwang.com/fangchan/topic_703884.shtml" target="_blank">买卖二手房，要规避的...</a></li>
                    <li><a href="http://q.flxxwang.com/fangchan/topic_689037.shtml" target="_blank">二手房交易常出现“跳...</a></li>
                    <li><a href="http://q.flxxwang.com/fangchan/topic_561686.shtml" target="_blank">买房也AA，我和老公的...</a></li>
                </ul>
            </div>
            <div id="ad1" class="crpic" style="display:block;">
                <a href="http://www.zgsydcw.com" target="_blank"><img src="http://pic.flxxwang.com/images/gpic/201110/n_14413783407364.gif" /></a>
            </div>
            <div id="ad2" class="crpic"></div>
        </div>--%>

        <div class="clear"></div>
    </div>
    
    <div class="height10"></div>

    <div id="links">
        <i class="line1"></i>
        <ul class="nearby">
            <li><a href="<%=Url.Action("Index", new {city="bj"})%>">北京房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="sh"})%>">上海房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="gz"})%>">广州房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="sz"})%>">深圳房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="tj"})%>">天津房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="nj"})%>">南京房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="hz"})%>">杭州房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="cd"})%>">成都房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="yt"})%>">烟台房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="sjz"})%>">石家庄房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="wh"})%>">武汉房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="hf"})%>">合肥房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="jinzhou"})%>">锦州房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="jn"})%>">济南房产网</a></li>
            <li><a href="<%=Url.Action("Index", new {city="sy"})%>">沈阳房产网</a></li>
        </ul>
        <i class='line'></i>
        <div class='links'>﻿
            <strong>友情链接</strong>:
            <%--<a href='http://travel.flxxwang.com/7daysinn/' target='_blank'>7天连锁酒店</a>&nbsp;--%>
            <a href='http://www.34g5.cn' target='_blank'>上市顾问网</a>&nbsp;
            <%--<a href='http://hz.flxxwang.com/linanshi/zufang/' target='_blank'>杭州临安租房信息</a>&nbsp;--%>
            <%--<a href='http://hz.flxxwang.com/xiaoshanqu/zufang/' target='_blank'>萧山租房</a>&nbsp;--%>
            <a href='http://zhejiang.e086.cn/' target='_blank'>中华地产网浙江</a>&nbsp;
            <a href='http://www.dgtpa.com/' target='_blank'>东莞信息网</a>&nbsp;
            <a href='http://www.sbhn.cn/' target='_blank'>上榜网</a>&nbsp;
            <a href='http://www.hnzz.cc/' target='_blank'>株洲房产网</a>&nbsp;  
            <%--<a href="/link.html" target="_blank">更多...--%>
            <a href="#" target="_blank">自动申请链接</a>
        </div>
    </div>

    <div id="footer"> 
        &copy; flxxwang.com 
        <%--<a id="askicon" target="_blank" title="有问题请与<%=SiteInfo.Name%>客服进行对话" href="http://about.flxxwang.com/v5/">联系客服</a>--%>
    </div>

    <script type="text/javascript" language="javascript">
        var ad_type = 0; var isopen = false; var ad_json = [];
    </script>

    <script type="text/javascript">
//        boot.require('dom, anim.hover', function (Frame, dom, hover) {
//            var cc = dom.get('infolist'),
//            trs = cc.getElementsByTagName('tr');
//            Frame.each(trs, function (item) {
//                hover.bind(item, 'bg');
//            });
//        });
//        ///////标红////				
//        boot.require('dom, business.highlight', function (Frame, dom, highlight) {
//            try {
//                var key = '',
//                cc = dom.get('infolist'),
//                cs = cc.children,
//                table = cs[cs.length - 1],
//                as = table.getElementsByTagName('a');
//                highlight.init(as, key);
//            } catch (e) { }
//        });

        $(function () {
            $("a").attr("target", "_blank");
        });
    </script>
</asp:Content>
