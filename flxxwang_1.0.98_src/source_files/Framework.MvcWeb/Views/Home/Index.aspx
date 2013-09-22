<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Extensions" %>

<!DOCTYPE html>

<html>
<head>
    <%
        var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
        var tid = routeData.Values["tid"];
        if (tid == "t0")
        {
            tid = null;
        }
    %>
    <title><%=SiteInfo.Name%> - 中国第一<%=SiteInfo.Name%>站|免费发布信息</title>
    <meta name="keywords" content="分类信息,免费发布信息" />
    <meta name="description" content="<%=SiteInfo.Name%>是中国第一中文<%=SiteInfo.Name%>站，涵盖房产、车辆、招工、兼职、黄页等海量的生活分类信息，满足您不同的查询需求。同时也是您最好的免费发布信息网站。" />
    <link rel="shortcut icon" href="/content/fenlei/assets/images/favicon.ico" />
    <link href="/Content/Fenlei/assets/css/index.css" type="text/css" rel="Stylesheet" />
    <script type="text/javascript" src="/Scripts/jquery-ui-1.9m6/jquery-1.6.2.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-ui-1.9m6/ui/jquery.effects.core.js"></script>
    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
    <script type="text/javascript" src="/Scripts/framework/common.js"></script>
    <script type="text/javascript" src="/Scripts/framework/framework.js?v20110101"></script>
    <script type="text/javascript" src="/Scripts/framework/cookie.js"></script>
    <script type="text/javascript" src="/Scripts/framework/Area/city_debug.js"></script>
    <script type="text/javascript">
        var __jsoninfo = { tid: '<%=routeData.Values["tid"] %>' };$.is
    </script>
    <script type="text/javascript">
        var changeCity=<%=ViewData["ChangCity"] %>
        if (!changeCity) {
            //var city = $f.cookie.get("city");
            var city=<%=ViewData["city"]==null?"null":"\""+ViewData["city"]+"\"" %>;
            if (city != null) {
                location.href = "/" + city+"/<%=tid %>";
            }
        }
    </script>
</head>
<body>
<%
    var WebRoot = Url.Action("Index", "Home");
    if (WebRoot == "/")
    {
        WebRoot = "";
    }
    var city = Framework.Utility.CookieManager.GetCookie("city");
    if (string.IsNullOrWhiteSpace(city))
    {
        city = "bj";
    }
%>
<div id="header" 
        style="background-image:url('/content/fenlei/assets/images/bkg_header.gif'); background-repeat: repeat-x;"><%--style="background-color:#CCCCFF;"--%>
    <div id="headerinside">
        <a href="<%=Url.Action("Default","Home",new{city=city}) %>">
            <img src="/Content/Fenlei/assets/images/logo/logo.gif" id="logo" alt="<%=SiteInfo.Name%> -- taojen.com" />
        </a>
	    <div id="postgg">
            免费发布/查询 租房、 二手房、招聘求职、二手车、二手家电、<br />
            宠物买卖、 家政保洁、今日团购 等本地生活信息。
        </div>
        <%--<span id="qianm"></span>--%>
        <%--<div id="flashimga">
            <img src="http://pic2.flxxwang.com/ui6/www/1.gif"/>
            <img src="http://pic2.flxxwang.com/ui6/www/2.gif"/>
        </div>--%>
    </div>
</div>

<div class="topcity">
	<div class="index_bo">
        <a href="<%=WebRoot %>/bj/<%=tid %>" class="co16" onclick="go('bj')"><b>进入北京站&raquo;</b></a>
        <span class="gray ml">热门城市：</span>
        <a href="<%=WebRoot %>/bj/<%=tid %>" onclick="go('bj')"><b>北京</b></a>
        <a href="<%=WebRoot %>/sh/<%=tid %>" onclick="go('sh')"><b>上海</b></a>
        <a href="<%=WebRoot %>/gz/<%=tid %>" onclick="go('gz')"><b>广州</b></a>
        <a href="<%=WebRoot %>/sz/<%=tid %>" onclick="go('sz')"><b>深圳</b></a>
        <a href="<%=WebRoot %>/hz/<%=tid %>" onclick="go('hz')"><b>杭州</b></a>
        <a href="<%=WebRoot %>/nj/<%=tid %>" onclick="go('nj')"><b>南京</b></a>
        <a href="<%=WebRoot %>/tj/<%=tid %>" onclick="go('tj')"><b>天津</b></a>
        <a href="<%=WebRoot %>/wh/<%=tid %>" onclick="go('wh')"><b>武汉</b></a>
        <div class="c"></div>
        <div id="citysear">
            按省份选择城市： 
            <select id="province" name="province"></select>
            <select id="city" name="city"></select>
            <input type="button" value="确定" onclick="btnOk();" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;或直接输入
                <input type="text" id="_cityinput" fdv="请输入城市拼音" value="" class="cityinput" />
                <input type="button" value="确定" id="_citybtn" onclick="goCity();" />
        </div>
    </div>
</div>

<div id="alephNav">
    <div style="width:100px;"><a href="javascript:moveNav()">全部</a></div>
    <div><a href="javascript:moveNav('A')">A</a></div>
    <div><a href="javascript:moveNav('B')">B</a></div>
    <div><a href="javascript:moveNav('C')">C</a></div>
    <div><a href="javascript:moveNav('D')">D</a></div>
    <div><a href="javascript:moveNav('E')">E</a></div>
    <div><a href="javascript:moveNav('F')">F</a></div>
    <div><a href="javascript:moveNav('G')">G</a></div>
    <div><a href="javascript:moveNav('H')">H</a></div>
    <!--<div><a href="javascript:moveNav('I')">I</a></div>-->
    <div><a href="javascript:moveNav('J')">J</a></div>
    <div><a href="javascript:moveNav('K')">K</a></div>
    <div><a href="javascript:moveNav('L')">L</a></div>
    <div><a href="javascript:moveNav('M')">M</a></div>
    <div><a href="javascript:moveNav('N')">N</a></div>
    <!--<div><a href="javascript:moveNav('O')">O</a></div>-->
    <div><a href="javascript:moveNav('P')">P</a></div>
    <div><a href="javascript:moveNav('Q')">Q</a></div>
    <div><a href="javascript:moveNav('R')">R</a></div>
    <div><a href="javascript:moveNav('S')">S</a></div>
    <div><a href="javascript:moveNav('T')">T</a></div>
    <!--<div><a href="javascript:moveNav('U')">U</a></div>-->
    <!--<div><a href="javascript:moveNav('V')">V</a></div>-->
    <div><a href="javascript:moveNav('W')">W</a></div>
    <div><a href="javascript:moveNav('X')">X</a></div>
    <div><a href="javascript:moveNav('Y')">Y</a></div>
    <div><a href="javascript:moveNav('Z')">Z</a></div>
</div>

<div id="nav">
    <div id="div_list">
        <dl id="cityList" class="cityList">
        <dt>A.</dt>
        <dd>
	        <a href="<%=WebRoot %>/as/<%=tid %>" onclick="go('as')">鞍山</a>
	        <a href="<%=WebRoot %>/ay/<%=tid %>" onclick="go('ay')">安阳</a>
	        <a href="<%=WebRoot %>/anqing/<%=tid %>" onclick="go('anqing')">安庆</a>
	        <a href="<%=WebRoot %>/ankang/<%=tid %>" onclick="go('ankang')">安康</a>
	        <a href="<%=WebRoot %>/am/<%=tid %>" onclick="go('am')">澳门</a>
	        <a href="<%=WebRoot %>/aks/<%=tid %>" onclick="go('aks')">阿克苏</a>
	        <a href="<%=WebRoot %>/ale/<%=tid %>" onclick="go('ale')">阿拉尔</a>
	        <a href="<%=WebRoot %>/al/<%=tid %>" onclick="go('al')">阿里</a>
	        <a href="<%=WebRoot %>/ab/<%=tid %>" onclick="go('ab')">阿坝</a>
	        <a href="<%=WebRoot %>/alsm/<%=tid %>" onclick="go('alsm')">阿拉善盟</a>
	        <a href="<%=WebRoot %>/anshun/<%=tid %>" onclick="go('anshun')">安顺</a>
        </dd>
        <dt>B.</dt>
        <dd>
	        <a href="<%=WebRoot %>/bj/<%=tid %>" class="lr" onclick="go('bj')">北京</a>
	        <a href="<%=WebRoot %>/bd/<%=tid %>" onclick="go('bd')">保定</a>
	        <a href="<%=WebRoot %>/bt/<%=tid %>" onclick="go('bt')">包头</a>
	        <a href="<%=WebRoot %>/bz/<%=tid %>" onclick="go('bz')">滨州</a>
	        <a href="<%=WebRoot %>/baoji/<%=tid %>" onclick="go('baoji')">宝鸡</a>
	        <a href="<%=WebRoot %>/bengbu/<%=tid %>" onclick="go('bengbu')">蚌埠</a>
	        <a href="<%=WebRoot %>/benxi/<%=tid %>" onclick="go('benxi')">本溪</a>
	        <a href="<%=WebRoot %>/bc/<%=tid %>" onclick="go('bc')">白城</a>
	        <a href="<%=WebRoot %>/bozhou/<%=tid %>" onclick="go('bozhou')">亳州</a>
	        <a href="<%=WebRoot %>/bs/<%=tid %>" onclick="go('bs')">保山</a>
	        <a href="<%=WebRoot %>/bygl/<%=tid %>" onclick="go('bygl')">巴音郭楞</a>
	        <a href="<%=WebRoot %>/betl/<%=tid %>" onclick="go('betl')">博尔塔拉</a>
	        <a href="<%=WebRoot %>/bazhong/<%=tid %>" onclick="go('bazhong')">巴中</a>
	        <a href="<%=WebRoot %>/bycem/<%=tid %>" onclick="go('bycem')">巴彦淖尔盟</a>
	        <a href="<%=WebRoot %>/baishan/<%=tid %>" onclick="go('baishan')">白山</a>
	        <a href="<%=WebRoot %>/by/<%=tid %>" onclick="go('by')">白银</a>
	        <a href="<%=WebRoot %>/baise/<%=tid %>" onclick="go('baise')">百色</a>
	        <a href="<%=WebRoot %>/bh/<%=tid %>" onclick="go('bh')">北海</a>
	        <a href="<%=WebRoot %>/bijie/<%=tid %>" onclick="go('bijie')">毕节</a>
        </dd>
        <dt>C.</dt>
        <dd>
	        <a href="<%=WebRoot %>/cd/<%=tid %>" class="lr" onclick="go('cd')">成都</a>
	        <a href="<%=WebRoot %>/cs/<%=tid %>" class="lr" onclick="go('cs')">长沙</a>
	        <a href="<%=WebRoot %>/cq/<%=tid %>" onclick="go('cq')">重庆</a>
	        <a href="<%=WebRoot %>/cc/<%=tid %>" onclick="go('cc')">长春</a>
	        <a href="<%=WebRoot %>/cz/<%=tid %>" onclick="go('cz')">常州</a>
	        <a href="<%=WebRoot %>/cangzhou/<%=tid %>" onclick="go('cangzhou')">沧州</a>
	        <a href="<%=WebRoot %>/changde/<%=tid %>" onclick="go('changde')">常德</a>
	        <a href="<%=WebRoot %>/chenzhou/<%=tid %>" onclick="go('chenzhou')">郴州</a>
	        <a href="<%=WebRoot %>/chifeng/<%=tid %>" onclick="go('chifeng')">赤峰</a>
	        <a href="<%=WebRoot %>/chengde/<%=tid %>" onclick="go('chengde')">承德</a>
	        <a href="<%=WebRoot %>/changzhi/<%=tid %>" onclick="go('changzhi')">长治</a>
	        <a href="<%=WebRoot %>/cx/<%=tid %>" onclick="go('cx')">楚雄</a>
	        <a href="<%=WebRoot %>/changji/<%=tid %>" onclick="go('changji')">昌吉</a>
	        <a href="<%=WebRoot %>/changge/<%=tid %>" onclick="go('changge')">长葛</a>
	        <a href="<%=WebRoot %>/changdu/<%=tid %>" onclick="go('changdu')">昌都</a>
	        <a href="<%=WebRoot %>/cy/<%=tid %>" onclick="go('cy')">朝阳</a>
	        <a href="<%=WebRoot %>/ch/<%=tid %>" onclick="go('ch')">巢湖</a>
	        <a href="<%=WebRoot %>/chizhou/<%=tid %>" onclick="go('chizhou')">池州</a>
	        <a href="<%=WebRoot %>/chuzhou/<%=tid %>" onclick="go('chuzhou')">滁州</a>
	        <a href="<%=WebRoot %>/chaozhou/<%=tid %>" onclick="go('chaozhou')">潮州</a>
	        <a href="<%=WebRoot %>/chongzuo/<%=tid %>" onclick="go('chongzuo')">崇左</a>
        </dd>
        <dt>D.</dt>
        <dd>
	        <a href="<%=WebRoot %>/dg/<%=tid %>" onclick="go('dg')">东莞</a>
	        <a href="<%=WebRoot %>/dl/<%=tid %>" onclick="go('dl')">大连</a>
	        <a href="<%=WebRoot %>/dz/<%=tid %>" onclick="go('dz')">德州</a>
	        <a href="<%=WebRoot %>/dy/<%=tid %>" onclick="go('dy')">东营</a>
	        <a href="<%=WebRoot %>/dq/<%=tid %>" onclick="go('dq')">大庆</a>
	        <a href="<%=WebRoot %>/dandong/<%=tid %>" onclick="go('dandong')">丹东</a>
	        <a href="<%=WebRoot %>/dt/<%=tid %>" onclick="go('dt')">大同</a>
	        <a href="<%=WebRoot %>/dali/<%=tid %>" onclick="go('dali')">大理</a>
	        <a href="<%=WebRoot %>/dingzhou/<%=tid %>" onclick="go('dingzhou')">定州</a>
	        <a href="<%=WebRoot %>/deyang/<%=tid %>" onclick="go('deyang')">德阳</a>
	        <a href="<%=WebRoot %>/diqing/<%=tid %>" onclick="go('diqing')">迪庆</a>
	        <a href="<%=WebRoot %>/dh/<%=tid %>" onclick="go('dh')">德宏</a>
	        <a href="<%=WebRoot %>/dazhou/<%=tid %>" onclick="go('dazhou')">达州</a>
	        <a href="<%=WebRoot %>/dx/<%=tid %>" onclick="go('dx')">定西</a>
	        <a href="<%=WebRoot %>/dxal/<%=tid %>" onclick="go('dxal')">大兴安岭</a>
	        <a href="<%=WebRoot %>/dafeng/<%=tid %>" onclick="go('dafeng')">大丰</a>
        </dd>
        <dt>E.</dt>
        <dd>
	        <a href="<%=WebRoot %>/erds/<%=tid %>" onclick="go('erds')">鄂尔多斯</a>
	        <a href="<%=WebRoot %>/es/<%=tid %>" onclick="go('es')">恩施</a>
	        <a href="<%=WebRoot %>/ez/<%=tid %>" onclick="go('ez')">鄂州</a>
        </dd>
        <dt>F.</dt>
        <dd>
	        <a href="<%=WebRoot %>/fz/<%=tid %>" onclick="go('fz')">福州</a>
	        <a href="<%=WebRoot %>/fs/<%=tid %>" onclick="go('fs')">佛山</a>
	        <a href="<%=WebRoot %>/fushun/<%=tid %>" onclick="go('fushun')">抚顺</a>
	        <a href="<%=WebRoot %>/fy/<%=tid %>" onclick="go('fy')">阜阳</a>
	        <a href="<%=WebRoot %>/fx/<%=tid %>" onclick="go('fx')">阜新</a>
	        <a href="<%=WebRoot %>/fuzhou/<%=tid %>" onclick="go('fuzhou')">抚州</a>
	        <a href="<%=WebRoot %>/fcg/<%=tid %>" onclick="go('fcg')">防城港</a>
        </dd>
        <dt>G.</dt>
        <dd>
	        <a href="<%=WebRoot %>/gz/<%=tid %>" class="lr" onclick="go('gz')">广州</a>
	        <a href="<%=WebRoot %>/gy/<%=tid %>" onclick="go('gy')">贵阳</a>
	        <a href="<%=WebRoot %>/gl/<%=tid %>" onclick="go('gl')">桂林</a>
	        <a href="<%=WebRoot %>/gg/<%=tid %>" onclick="go('gg')">贵港</a>
	        <a href="<%=WebRoot %>/guyuan/<%=tid %>" onclick="go('guyuan')">固原</a>
	        <a href="<%=WebRoot %>/ganzhou/<%=tid %>" onclick="go('ganzhou')">赣州</a>
	        <a href="<%=WebRoot %>/gt/<%=tid %>" onclick="go('gt')">馆陶</a>
	        <a href="<%=WebRoot %>/ga/<%=tid %>" onclick="go('ga')">广安</a>
	        <a href="<%=WebRoot %>/guangyuan/<%=tid %>" onclick="go('guangyuan')">广元</a>
	        <a href="<%=WebRoot %>/ganzi/<%=tid %>" onclick="go('ganzi')">甘孜</a>
	        <a href="<%=WebRoot %>/guoluo/<%=tid %>" onclick="go('guoluo')">果洛</a>
	        <a href="<%=WebRoot %>/gn/<%=tid %>" onclick="go('gn')">甘南</a>
        </dd>
        <dt>H.</dt>
        <dd>
	        <a href="<%=WebRoot %>/hz/<%=tid %>" class="lr" onclick="go('hz')">杭州</a>
	        <a href="<%=WebRoot %>/hrb/<%=tid %>" onclick="go('hrb')">哈尔滨</a>
	        <a href="<%=WebRoot %>/haikou/<%=tid %>" onclick="go('haikou')">海口</a>
	        <a href="<%=WebRoot %>/hf/<%=tid %>" onclick="go('hf')">合肥</a>
	        <a href="<%=WebRoot %>/hu/<%=tid %>" onclick="go('hu')">呼和浩特</a>
	        <a href="<%=WebRoot %>/huizhou/<%=tid %>" onclick="go('huizhou')">惠州</a>
	        <a href="<%=WebRoot %>/hy/<%=tid %>" onclick="go('hy')">衡阳</a>
	        <a href="<%=WebRoot %>/hd/<%=tid %>" onclick="go('hd')">邯郸</a>
	        <a href="<%=WebRoot %>/huzhou/<%=tid %>" onclick="go('huzhou')">湖州</a>
	        <a href="<%=WebRoot %>/hs/<%=tid %>" onclick="go('hs')">衡水</a>
	        <a href="<%=WebRoot %>/hanzhong/<%=tid %>" onclick="go('hanzhong')">汉中</a>
	        <a href="<%=WebRoot %>/ha/<%=tid %>" onclick="go('ha')">淮安</a>
	        <a href="<%=WebRoot %>/hshi/<%=tid %>" onclick="go('hshi')">黄石</a>
	        <a href="<%=WebRoot %>/hlr/<%=tid %>" onclick="go('hlr')">海拉尔</a>
	        <a href="<%=WebRoot %>/heze/<%=tid %>" onclick="go('heze')">菏泽</a>
	        <a href="<%=WebRoot %>/hh/<%=tid %>" onclick="go('hh')">怀化</a>
	        <a href="<%=WebRoot %>/hg/<%=tid %>" onclick="go('hg')">黄冈</a>
	        <a href="<%=WebRoot %>/hc/<%=tid %>" onclick="go('hc')">河池</a>
	        <a href="<%=WebRoot %>/hami/<%=tid %>" onclick="go('hami')">哈密</a>
	        <a href="<%=WebRoot %>/honghe/<%=tid %>" onclick="go('honghe')">红河</a>
	        <a href="<%=WebRoot %>/hegang/<%=tid %>" onclick="go('hegang')">鹤岗</a>
	        <a href="<%=WebRoot %>/hb/<%=tid %>" onclick="go('hb')">鹤壁</a>
	        <a href="<%=WebRoot %>/hn/<%=tid %>" onclick="go('hn')">淮南</a>
	        <a href="<%=WebRoot %>/huaibei/<%=tid %>" onclick="go('huaibei')">淮北</a>
	        <a href="<%=WebRoot %>/huangshan/<%=tid %>" onclick="go('huangshan')">黄山</a>
	        <a href="<%=WebRoot %>/ht/<%=tid %>" onclick="go('ht')">和田</a>
	        <a href="<%=WebRoot %>/hlbe/<%=tid %>" onclick="go('hlbe')">呼伦贝尔</a>
	        <a href="<%=WebRoot %>/huangna/<%=tid %>" onclick="go('huangna')">黄南</a>
	        <a href="<%=WebRoot %>/hx/<%=tid %>" onclick="go('hx')">海西</a>
	        <a href="<%=WebRoot %>/hainan/<%=tid %>" onclick="go('hainan')">海南</a>
	        <a href="<%=WebRoot %>/haidong/<%=tid %>" onclick="go('haidong')">海东</a>
	        <a href="<%=WebRoot %>/haibei/<%=tid %>" onclick="go('haibei')">海北</a>
	        <a href="<%=WebRoot %>/hld/<%=tid %>" onclick="go('hld')">葫芦岛</a>
	        <a href="<%=WebRoot %>/heyuan/<%=tid %>" onclick="go('heyuan')">河源</a>
	        <a href="<%=WebRoot %>/hezhou/<%=tid %>" onclick="go('hezhou')">贺州</a>
	        <a href="<%=WebRoot %>/heihe/<%=tid %>" onclick="go('heihe')">黑河</a>
	        <a href="<%=WebRoot %>/hexian/<%=tid %>" onclick="go('hexian')">和县</a>
	        <a href="<%=WebRoot %>/hq/<%=tid %>" onclick="go('hq')">霍邱</a>
        </dd>
        <dt>J.</dt>
        <dd>
	        <a href="<%=WebRoot %>/jn/<%=tid %>" class="lr" onclick="go('jn')">济南</a>
	        <a href="<%=WebRoot %>/jining/<%=tid %>" onclick="go('jining')">济宁</a>
	        <a href="<%=WebRoot %>/jx/<%=tid %>" onclick="go('jx')">嘉兴</a>
	        <a href="<%=WebRoot %>/jm/<%=tid %>" onclick="go('jm')">江门</a>
	        <a href="<%=WebRoot %>/jh/<%=tid %>" onclick="go('jh')">金华</a>
	        <a href="<%=WebRoot %>/jl/<%=tid %>" onclick="go('jl')">吉林</a>
	        <a href="<%=WebRoot %>/jy/<%=tid %>" onclick="go('jy')">揭阳</a>
	        <a href="<%=WebRoot %>/jj/<%=tid %>" onclick="go('jj')">九江</a>
	        <a href="<%=WebRoot %>/jiaozuo/<%=tid %>" onclick="go('jiaozuo')">焦作</a>
	        <a href="<%=WebRoot %>/jincheng/<%=tid %>" onclick="go('jincheng')">晋城</a>
	        <a href="<%=WebRoot %>/jingzhou/<%=tid %>" onclick="go('jingzhou')">荆州</a>
	        <a href="<%=WebRoot %>/jms/<%=tid %>" onclick="go('jms')">佳木斯</a>
	        <a href="<%=WebRoot %>/jixi/<%=tid %>" onclick="go('jixi')">鸡西</a>
	        <a href="<%=WebRoot %>/ja/<%=tid %>" onclick="go('ja')">吉安</a>
	        <a href="<%=WebRoot %>/jinchang/<%=tid %>" onclick="go('jinchang')">金昌</a>
	        <a href="<%=WebRoot %>/jz/<%=tid %>" onclick="go('jz')">晋中</a>
	        <a href="<%=WebRoot %>/jinzhou/<%=tid %>" onclick="go('jinzhou')">锦州</a>
	        <a href="<%=WebRoot %>/jdz/<%=tid %>" onclick="go('jdz')">景德镇</a>
	        <a href="<%=WebRoot %>/jingmen/<%=tid %>" onclick="go('jingmen')">荆门</a>
	        <a href="<%=WebRoot %>/jyg/<%=tid %>" onclick="go('jyg')">嘉峪关</a>
	        <a href="<%=WebRoot %>/jq/<%=tid %>" onclick="go('jq')">酒泉</a>
	        <a href="<%=WebRoot %>/jiyuan/<%=tid %>" onclick="go('jiyuan')">济源</a>
        </dd>
        <dt>K.</dt>
        <dd>
	        <a href="<%=WebRoot %>/km/<%=tid %>" onclick="go('km')">昆明</a>
	        <a href="<%=WebRoot %>/klmy/<%=tid %>" onclick="go('klmy')">克拉玛依</a>
	        <a href="<%=WebRoot %>/kel/<%=tid %>" onclick="go('kel')">库尔勒</a>
	        <a href="<%=WebRoot %>/kaifeng/<%=tid %>" onclick="go('kaifeng')">开封</a>
	        <a href="<%=WebRoot %>/ks/<%=tid %>" onclick="go('ks')">喀什</a>
	        <a href="<%=WebRoot %>/kzls/<%=tid %>" onclick="go('kzls')">克孜勒苏</a>
	        <a href="<%=WebRoot %>/kl/<%=tid %>" onclick="go('kl')">垦利</a>
        </dd>
        <dt>L.</dt>
        <dd>
	        <a href="<%=WebRoot %>/lz/<%=tid %>" onclick="go('lz')">兰州</a>
	        <a href="<%=WebRoot %>/luoyang/<%=tid %>" onclick="go('luoyang')">洛阳</a>
	        <a href="<%=WebRoot %>/lf/<%=tid %>" onclick="go('lf')">廊坊</a>
	        <a href="<%=WebRoot %>/linyi/<%=tid %>" onclick="go('linyi')">临沂</a>
	        <a href="<%=WebRoot %>/lc/<%=tid %>" onclick="go('lc')">聊城</a>
	        <a href="<%=WebRoot %>/lyg/<%=tid %>" onclick="go('lyg')">连云港</a>
	        <a href="<%=WebRoot %>/lvliang/<%=tid %>" onclick="go('lvliang')">吕梁</a>
	        <a href="<%=WebRoot %>/ls/<%=tid %>" onclick="go('ls')">乐山</a>
	        <a href="<%=WebRoot %>/liaoyang/<%=tid %>" onclick="go('liaoyang')">辽阳</a>
	        <a href="<%=WebRoot %>/liaoyuan/<%=tid %>" onclick="go('liaoyuan')">辽源</a>
	        <a href="<%=WebRoot %>/lasa/<%=tid %>" onclick="go('lasa')">拉萨</a>
	        <a href="<%=WebRoot %>/linfen/<%=tid %>" onclick="go('linfen')">临汾</a>
	        <a href="<%=WebRoot %>/ly/<%=tid %>" onclick="go('ly')">龙岩</a>
	        <a href="<%=WebRoot %>/linxia/<%=tid %>" onclick="go('linxia')">临夏</a>
	        <a href="<%=WebRoot %>/liuzhou/<%=tid %>" onclick="go('liuzhou')">柳州</a>
	        <a href="<%=WebRoot %>/luohe/<%=tid %>" onclick="go('luohe')">漯河</a>
	        <a href="<%=WebRoot %>/luzhou/<%=tid %>" onclick="go('luzhou')">泸州</a>
	        <a href="<%=WebRoot %>/lishui/<%=tid %>" onclick="go('lishui')">丽水</a>
	        <a href="<%=WebRoot %>/lj/<%=tid %>" onclick="go('lj')">丽江</a>
	        <a href="<%=WebRoot %>/la/<%=tid %>" onclick="go('la')">六安</a>
	        <a href="<%=WebRoot %>/lw/<%=tid %>" onclick="go('lw')">莱芜</a>
	        <a href="<%=WebRoot %>/linyixian/<%=tid %>" onclick="go('linyixian')">临猗</a>
	        <a href="<%=WebRoot %>/lincang/<%=tid %>" onclick="go('lincang')">临沧</a>
	        <a href="<%=WebRoot %>/linzhi/<%=tid %>" onclick="go('linzhi')">林芝</a>
	        <a href="<%=WebRoot %>/liangshan/<%=tid %>" onclick="go('liangshan')">凉山</a>
	        <a href="<%=WebRoot %>/ld/<%=tid %>" onclick="go('ld')">娄底</a>
	        <a href="<%=WebRoot %>/ln/<%=tid %>" onclick="go('ln')">陇南</a>
	        <a href="<%=WebRoot %>/lb/<%=tid %>" onclick="go('lb')">来宾</a>
	        <a href="<%=WebRoot %>/lps/<%=tid %>" onclick="go('lps')">六盘水</a>
        </dd>
        <dt>M.</dt>
        <dd>
	        <a href="<%=WebRoot %>/mianyang/<%=tid %>" onclick="go('mianyang')">绵阳</a>
	        <a href="<%=WebRoot %>/mm/<%=tid %>" onclick="go('mm')">茂名</a>
	        <a href="<%=WebRoot %>/mas/<%=tid %>" onclick="go('mas')">马鞍山</a>
	        <a href="<%=WebRoot %>/mdj/<%=tid %>" onclick="go('mdj')">牡丹江</a>
	        <a href="<%=WebRoot %>/mg/<%=tid %>" onclick="go('mg')">明港</a>
	        <a href="<%=WebRoot %>/mz/<%=tid %>" onclick="go('mz')">梅州</a>
	        <a href="<%=WebRoot %>/ms/<%=tid %>" onclick="go('ms')">眉山</a>
        </dd>
        <dt>N.</dt>
        <dd>
	        <a href="<%=WebRoot %>/nj/<%=tid %>" onclick="go('nj')">南京</a>
	        <a href="<%=WebRoot %>/nc/<%=tid %>" onclick="go('nc')">南昌</a>
	        <a href="<%=WebRoot %>/nb/<%=tid %>" onclick="go('nb')">宁波</a>
	        <a href="<%=WebRoot %>/nn/<%=tid %>" onclick="go('nn')">南宁</a>
	        <a href="<%=WebRoot %>/ny/<%=tid %>" onclick="go('ny')">南阳</a>
	        <a href="<%=WebRoot %>/nt/<%=tid %>" onclick="go('nt')">南通</a>
	        <a href="<%=WebRoot %>/scnj/<%=tid %>" onclick="go('scnj')">内江</a>
	        <a href="<%=WebRoot %>/nd/<%=tid %>" onclick="go('nd')">宁德</a>
	        <a href="<%=WebRoot %>/nanchong/<%=tid %>" onclick="go('nanchong')">南充</a>
	        <a href="<%=WebRoot %>/nujiang/<%=tid %>" onclick="go('nujiang')">怒江</a>
	        <a href="<%=WebRoot %>/nq/<%=tid %>" onclick="go('nq')">那曲</a>
	        <a href="<%=WebRoot %>/np/<%=tid %>" onclick="go('np')">南平</a>
        </dd>
        <dt>P.</dt>
        <dd>
	        <a href="<%=WebRoot %>/pds/<%=tid %>" onclick="go('pds')">平顶山</a>
	        <a href="<%=WebRoot %>/pj/<%=tid %>" onclick="go('pj')">盘锦</a>
	        <a href="<%=WebRoot %>/px/<%=tid %>" onclick="go('px')">萍乡</a>
	        <a href="<%=WebRoot %>/pl/<%=tid %>" onclick="go('pl')">平凉</a>
	        <a href="<%=WebRoot %>/puyang/<%=tid %>" onclick="go('puyang')">濮阳</a>
	        <a href="<%=WebRoot %>/panzhihua/<%=tid %>" onclick="go('panzhihua')">攀枝花</a>
	        <a href="<%=WebRoot %>/pt/<%=tid %>" onclick="go('pt')">莆田</a>
	        <a href="<%=WebRoot %>/pe/<%=tid %>" onclick="go('pe')">普洱</a>
        </dd>
        <dt>Q.</dt>
        <dd>
	        <a href="<%=WebRoot %>/qd/<%=tid %>" onclick="go('qd')">青岛</a>
	        <a href="<%=WebRoot %>/qz/<%=tid %>" onclick="go('qz')">泉州</a>
	        <a href="<%=WebRoot %>/qhd/<%=tid %>" onclick="go('qhd')">秦皇岛</a>
	        <a href="<%=WebRoot %>/cn/<%=tid %>" onclick="go('cn')">其他</a>
	        <a href="<%=WebRoot %>/qqhr/<%=tid %>" onclick="go('qqhr')">齐齐哈尔</a>
	        <a href="<%=WebRoot %>/quzhou/<%=tid %>" onclick="go('quzhou')">衢州</a>
	        <a href="<%=WebRoot %>/qingyuan/<%=tid %>" onclick="go('qingyuan')">清远</a>
	        <a href="<%=WebRoot %>/qinzhou/<%=tid %>" onclick="go('qinzhou')">钦州</a>
	        <a href="<%=WebRoot %>/qj/<%=tid %>" onclick="go('qj')">曲靖</a>
	        <a href="<%=WebRoot %>/qdn/<%=tid %>" onclick="go('qdn')">黔东南</a>
	        <a href="<%=WebRoot %>/qingyang/<%=tid %>" onclick="go('qingyang')">庆阳</a>
	        <a href="<%=WebRoot %>/qn/<%=tid %>" onclick="go('qn')">黔南</a>
	        <a href="<%=WebRoot %>/qxn/<%=tid %>" onclick="go('qxn')">黔西南</a>
	        <a href="<%=WebRoot %>/qth/<%=tid %>" onclick="go('qth')">七台河</a>
	        <a href="<%=WebRoot %>/qianjiang/<%=tid %>" onclick="go('qianjiang')">潜江</a>
	        <a href="<%=WebRoot %>/qingxu/<%=tid %>" onclick="go('qingxu')">清徐</a>
        </dd>
        <dt>R.</dt>
        <dd>
	        <a href="<%=WebRoot %>/rizhao/<%=tid %>" onclick="go('rizhao')">日照</a>
	        <a href="<%=WebRoot %>/rkz/<%=tid %>" onclick="go('rkz')">日喀则</a>
        </dd>
        <dt>S.</dt>
        <dd>
	        <a href="<%=WebRoot %>/sh/<%=tid %>" class="lr" onclick="go('sh')">上海</a>
	        <a href="<%=WebRoot %>/sz/<%=tid %>" class="lr" onclick="go('sz')">深圳</a>
	        <a href="<%=WebRoot %>/su/<%=tid %>" class="lr" onclick="go('su')">苏州</a>
	        <a href="<%=WebRoot %>/sjz/<%=tid %>" onclick="go('sjz')">石家庄</a>
	        <a href="<%=WebRoot %>/sy/<%=tid %>" onclick="go('sy')">沈阳</a>
	        <a href="<%=WebRoot %>/st/<%=tid %>" onclick="go('st')">汕头</a>
	        <a href="<%=WebRoot %>/suzhou/<%=tid %>" onclick="go('suzhou')">宿州</a>
	        <a href="<%=WebRoot %>/sx/<%=tid %>" onclick="go('sx')">绍兴</a>
	        <a href="<%=WebRoot %>/shiyan/<%=tid %>" onclick="go('shiyan')">十堰</a>
	        <a href="<%=WebRoot %>/sm/<%=tid %>" onclick="go('sm')">三明</a>
	        <a href="<%=WebRoot %>/sg/<%=tid %>" onclick="go('sg')">韶关</a>
	        <a href="<%=WebRoot %>/sq/<%=tid %>" onclick="go('sq')">商丘</a>
	        <a href="<%=WebRoot %>/shuyang/<%=tid %>" onclick="go('shuyang')">沭阳</a>
	        <a href="<%=WebRoot %>/suqian/<%=tid %>" onclick="go('suqian')">宿迁</a>
	        <a href="<%=WebRoot %>/suihua/<%=tid %>" onclick="go('suihua')">绥化</a>
	        <a href="<%=WebRoot %>/shaoyang/<%=tid %>" onclick="go('shaoyang')">邵阳</a>
	        <a href="<%=WebRoot %>/sanya/<%=tid %>" onclick="go('sanya')">三亚</a>
	        <a href="<%=WebRoot %>/sd/<%=tid %>" onclick="go('sd')">顺德</a>
	        <a href="<%=WebRoot %>/songyuan/<%=tid %>" onclick="go('songyuan')">松原</a>
	        <a href="<%=WebRoot %>/smx/<%=tid %>" onclick="go('smx')">三门峡</a>
	        <a href="<%=WebRoot %>/sw/<%=tid %>" onclick="go('sw')">汕尾</a>
	        <a href="<%=WebRoot %>/suizhou/<%=tid %>" onclick="go('suizhou')">随州</a>
	        <a href="<%=WebRoot %>/shz/<%=tid %>" onclick="go('shz')">石河子</a>
	        <a href="<%=WebRoot %>/sn/<%=tid %>" onclick="go('sn')">山南</a>
	        <a href="<%=WebRoot %>/suining/<%=tid %>" onclick="go('suining')">遂宁</a>
	        <a href="<%=WebRoot %>/sl/<%=tid %>" onclick="go('sl')">商洛</a>
	        <a href="<%=WebRoot %>/shuozhou/<%=tid %>" onclick="go('shuozhou')">朔州</a>
	        <a href="<%=WebRoot %>/szs/<%=tid %>" onclick="go('szs')">石嘴山</a>
	        <a href="<%=WebRoot %>/sr/<%=tid %>" onclick="go('sr')">上饶</a>
	        <a href="<%=WebRoot %>/sp/<%=tid %>" onclick="go('sp')">四平</a>
	        <a href="<%=WebRoot %>/sys/<%=tid %>" onclick="go('sys')">双鸭山</a>
	        <a href="<%=WebRoot %>/snj/<%=tid %>" onclick="go('snj')">神农架</a>
        </dd>
        <dt>T.</dt>
        <dd>
	        <a href="<%=WebRoot %>/tj/<%=tid %>" class="lr" onclick="go('tj')">天津</a>
	        <a href="<%=WebRoot %>/ty/<%=tid %>" onclick="go('ty')">太原</a>
	        <a href="<%=WebRoot %>/ts/<%=tid %>" onclick="go('ts')">唐山</a>
	        <a href="<%=WebRoot %>/ta/<%=tid %>" onclick="go('ta')">泰安</a>
	        <a href="<%=WebRoot %>/tz/<%=tid %>" onclick="go('tz')">台州</a>
	        <a href="<%=WebRoot %>/taizhou/<%=tid %>" onclick="go('taizhou')">泰州</a>
	        <a href="<%=WebRoot %>/tw/<%=tid %>" onclick="go('tw')">台湾</a>
	        <a href="<%=WebRoot %>/tl/<%=tid %>" onclick="go('tl')">铁岭</a>
	        <a href="<%=WebRoot %>/tianshui/<%=tid %>" onclick="go('tianshui')">天水</a>
	        <a href="<%=WebRoot %>/tlf/<%=tid %>" onclick="go('tlf')">吐鲁番</a>
	        <a href="<%=WebRoot %>/tmsk/<%=tid %>" onclick="go('tmsk')">图木舒克</a>
	        <a href="<%=WebRoot %>/tc/<%=tid %>" onclick="go('tc')">铜川</a>
	        <a href="<%=WebRoot %>/tongliao/<%=tid %>" onclick="go('tongliao')">通辽</a>
	        <a href="<%=WebRoot %>/th/<%=tid %>" onclick="go('th')">通化</a>
	        <a href="<%=WebRoot %>/tongling/<%=tid %>" onclick="go('tongling')">铜陵</a>
	        <a href="<%=WebRoot %>/tr/<%=tid %>" onclick="go('tr')">铜仁</a>
	        <a href="<%=WebRoot %>/tm/<%=tid %>" onclick="go('tm')">天门</a>
	        <a href="<%=WebRoot %>/taishan/<%=tid %>" onclick="go('taishan')">台山</a>
	        <a href="<%=WebRoot %>/tongcheng/<%=tid %>" onclick="go('tongcheng')">桐城</a>
        </dd>
        <dt>W.</dt>
        <dd>
	        <a href="<%=WebRoot %>/wh/<%=tid %>" class="lr" onclick="go('wh')">武汉</a>
	        <a href="<%=WebRoot %>/wx/<%=tid %>" onclick="go('wx')">无锡</a>
	        <a href="<%=WebRoot %>/wf/<%=tid %>" onclick="go('wf')">潍坊</a>
	        <a href="<%=WebRoot %>/xj/<%=tid %>" onclick="go('xj')">乌鲁木齐</a>
	        <a href="<%=WebRoot %>/wz/<%=tid %>" onclick="go('wz')">温州</a>
	        <a href="<%=WebRoot %>/weihai/<%=tid %>" onclick="go('weihai')">威海</a>
	        <a href="<%=WebRoot %>/wuhu/<%=tid %>" onclick="go('wuhu')">芜湖</a>
	        <a href="<%=WebRoot %>/wuzhou/<%=tid %>" onclick="go('wuzhou')">梧州</a>
	        <a href="<%=WebRoot %>/wfd/<%=tid %>" onclick="go('wfd')">瓦房店</a>
	        <a href="<%=WebRoot %>/wn/<%=tid %>" onclick="go('wn')">渭南</a>
	        <a href="<%=WebRoot %>/ws/<%=tid %>" onclick="go('ws')">文山</a>
	        <a href="<%=WebRoot %>/wuhai/<%=tid %>" onclick="go('wuhai')">乌海</a>
	        <a href="<%=WebRoot %>/wjq/<%=tid %>" onclick="go('wjq')">五家渠</a>
	        <a href="<%=WebRoot %>/wuzhong/<%=tid %>" onclick="go('wuzhong')">吴忠</a>
	        <a href="<%=WebRoot %>/wlcb/<%=tid %>" onclick="go('wlcb')">乌兰察布</a>
	        <a href="<%=WebRoot %>/wuwei/<%=tid %>" onclick="go('wuwei')">武威</a>
	        <a href="<%=WebRoot %>/wzs/<%=tid %>" onclick="go('wzs')">五指山</a>
	        <a href="<%=WebRoot %>/wuyishan/<%=tid %>" onclick="go('wuyishan')">武夷山</a>
        </dd>
        <dt>X.</dt>
        <dd>
	        <a href="<%=WebRoot %>/xa/<%=tid %>" onclick="go('xa')">西安</a>
	        <a href="<%=WebRoot %>/xm/<%=tid %>" onclick="go('xm')">厦门</a>
	        <a href="<%=WebRoot %>/xz/<%=tid %>" onclick="go('xz')">徐州</a>
	        <a href="<%=WebRoot %>/xiangtan/<%=tid %>" onclick="go('xiangtan')">湘潭</a>
	        <a href="<%=WebRoot %>/xf/<%=tid %>" onclick="go('xf')">襄阳</a>
	        <a href="<%=WebRoot %>/xx/<%=tid %>" onclick="go('xx')">新乡</a>
	        <a href="<%=WebRoot %>/xt/<%=tid %>" onclick="go('xt')">邢台</a>
	        <a href="<%=WebRoot %>/xiaogan/<%=tid %>" onclick="go('xiaogan')">孝感</a>
	        <a href="<%=WebRoot %>/xn/<%=tid %>" onclick="go('xn')">西宁</a>
	        <a href="<%=WebRoot %>/xc/<%=tid %>" onclick="go('xc')">许昌</a>
	        <a href="<%=WebRoot %>/hk/<%=tid %>" onclick="go('hk')">香港</a>
	        <a href="<%=WebRoot %>/xinzhou/<%=tid %>" onclick="go('xinzhou')">忻州</a>
	        <a href="<%=WebRoot %>/xuancheng/<%=tid %>" onclick="go('xuancheng')">宣城</a>
	        <a href="<%=WebRoot %>/bn/<%=tid %>" onclick="go('bn')">西双版纳</a>
	        <a href="<%=WebRoot %>/xl/<%=tid %>" onclick="go('xl')">锡林</a>
	        <a href="<%=WebRoot %>/xianyang/<%=tid %>" onclick="go('xianyang')">咸阳</a>
	        <a href="<%=WebRoot %>/xy/<%=tid %>" onclick="go('xy')">信阳</a>
	        <a href="<%=WebRoot %>/xam/<%=tid %>" onclick="go('xam')">兴安盟</a>
	        <a href="<%=WebRoot %>/xinyu/<%=tid %>" onclick="go('xinyu')">新余</a>
	        <a href="<%=WebRoot %>/xiangxi/<%=tid %>" onclick="go('xiangxi')">湘西</a>
	        <a href="<%=WebRoot %>/xiantao/<%=tid %>" onclick="go('xiantao')">仙桃</a>
	        <a href="<%=WebRoot %>/xianning/<%=tid %>" onclick="go('xianning')">咸宁</a>
        </dd>
        <dt>Y.</dt>
        <dd>
	        <a href="<%=WebRoot %>/yt/<%=tid %>" onclick="go('yt')">烟台</a>
	        <a href="<%=WebRoot %>/yanan/<%=tid %>" onclick="go('yanan')">延安</a>
	        <a href="<%=WebRoot %>/yz/<%=tid %>" onclick="go('yz')">扬州</a>
	        <a href="<%=WebRoot %>/yc/<%=tid %>" onclick="go('yc')">宜昌</a>
	        <a href="<%=WebRoot %>/yancheng/<%=tid %>" onclick="go('yancheng')">盐城</a>
	        <a href="<%=WebRoot %>/yy/<%=tid %>" onclick="go('yy')">岳阳</a>
	        <a href="<%=WebRoot %>/yinchuan/<%=tid %>" onclick="go('yinchuan')">银川</a>
	        <a href="<%=WebRoot %>/yanbian/<%=tid %>" onclick="go('yanbian')">延边</a>
	        <a href="<%=WebRoot %>/yingtan/<%=tid %>" onclick="go('yingtan')">鹰潭</a>
	        <a href="<%=WebRoot %>/yx/<%=tid %>" onclick="go('yx')">玉溪</a>
	        <a href="<%=WebRoot %>/yuncheng/<%=tid %>" onclick="go('yuncheng')">运城</a>
	        <a href="<%=WebRoot %>/yichun/<%=tid %>" onclick="go('yichun')">宜春</a>
	        <a href="<%=WebRoot %>/yk/<%=tid %>" onclick="go('yk')">营口</a>
	        <a href="<%=WebRoot %>/yl/<%=tid %>" onclick="go('yl')">榆林</a>
	        <a href="<%=WebRoot %>/yb/<%=tid %>" onclick="go('yb')">宜宾</a>
	        <a href="<%=WebRoot %>/yongzhou/<%=tid %>" onclick="go('yongzhou')">永州</a>
	        <a href="<%=WebRoot %>/yj/<%=tid %>" onclick="go('yj')">阳江</a>
	        <a href="<%=WebRoot %>/yangchun/<%=tid %>" onclick="go('yangchun')">阳春</a>
	        <a href="<%=WebRoot %>/yq/<%=tid %>" onclick="go('yq')">阳泉</a>
	        <a href="<%=WebRoot %>/yuzhou/<%=tid %>" onclick="go('yuzhou')">禹州</a>
	        <a href="<%=WebRoot %>/yanling/<%=tid %>" onclick="go('yanling')">鄢陵</a>
	        <a href="<%=WebRoot %>/yulin/<%=tid %>" onclick="go('yulin')">玉林</a>
	        <a href="<%=WebRoot %>/yili/<%=tid %>" onclick="go('yili')">伊犁</a>
	        <a href="<%=WebRoot %>/ya/<%=tid %>" onclick="go('ya')">雅安</a>
	        <a href="<%=WebRoot %>/ys/<%=tid %>" onclick="go('ys')">玉树</a>
	        <a href="<%=WebRoot %>/yiyang/<%=tid %>" onclick="go('yiyang')">益阳</a>
	        <a href="<%=WebRoot %>/yf/<%=tid %>" onclick="go('yf')">云浮</a>
	        <a href="<%=WebRoot %>/yich/<%=tid %>" onclick="go('yich')">伊春</a>
	        <a href="<%=WebRoot %>/yxx/<%=tid %>" onclick="go('yxx')">永新</a>
	        <a href="<%=WebRoot %>/yiwu/<%=tid %>" onclick="go('yiwu')">义乌</a>
        </dd>
        <dt>Z.</dt>
        <dd>
	        <a href="<%=WebRoot %>/zz/<%=tid %>" onclick="go('zz')">郑州</a>
	        <a href="<%=WebRoot %>/zh/<%=tid %>" onclick="go('zh')">珠海</a>
	        <a href="<%=WebRoot %>/zjk/<%=tid %>" onclick="go('zjk')">张家口</a>
	        <a href="<%=WebRoot %>/zs/<%=tid %>" onclick="go('zs')">中山</a>
	        <a href="<%=WebRoot %>/zb/<%=tid %>" onclick="go('zb')">淄博</a>
	        <a href="<%=WebRoot %>/zhuzhou/<%=tid %>" onclick="go('zhuzhou')">株洲</a>
	        <a href="<%=WebRoot %>/zhangzhou/<%=tid %>" onclick="go('zhangzhou')">漳州</a>
	        <a href="<%=WebRoot %>/zhanjiang/<%=tid %>" onclick="go('zhanjiang')">湛江</a>
	        <a href="<%=WebRoot %>/zq/<%=tid %>" onclick="go('zq')">肇庆</a>
	        <a href="<%=WebRoot %>/zaozhuang/<%=tid %>" onclick="go('zaozhuang')">枣庄</a>
	        <a href="<%=WebRoot %>/zj/<%=tid %>" onclick="go('zj')">镇江</a>
	        <a href="<%=WebRoot %>/zk/<%=tid %>" onclick="go('zk')">周口</a>
	        <a href="<%=WebRoot %>/zd/<%=tid %>" onclick="go('zd')">正定</a>
	        <a href="<%=WebRoot %>/zmd/<%=tid %>" onclick="go('zmd')">驻马店</a>
	        <a href="<%=WebRoot %>/zg/<%=tid %>" onclick="go('zg')">自贡</a>
	        <a href="<%=WebRoot %>/zjj/<%=tid %>" onclick="go('zjj')">张家界</a>
	        <a href="<%=WebRoot %>/zy/<%=tid %>" onclick="go('zy')">资阳</a>
	        <a href="<%=WebRoot %>/zunyi/<%=tid %>" onclick="go('zunyi')">遵义</a>
	        <a href="<%=WebRoot %>/zhoushan/<%=tid %>" onclick="go('zhoushan')">舟山</a>
	        <a href="<%=WebRoot %>/zhangqiu/<%=tid %>" onclick="go('zhangqiu')">章丘</a>
	        <a href="<%=WebRoot %>/zx/<%=tid %>" onclick="go('zx')">赵县</a>
	        <a href="<%=WebRoot %>/zc/<%=tid %>" onclick="go('zc')">诸城</a>
	        <a href="<%=WebRoot %>/zt/<%=tid %>" onclick="go('zt')">昭通</a>
	        <a href="<%=WebRoot %>/zw/<%=tid %>" onclick="go('zw')">中卫</a>
	        <a href="<%=WebRoot %>/zhangye/<%=tid %>" onclick="go('zhangye')">张掖</a>
	        <a href="<%=WebRoot %>/zhangbei/<%=tid %>" onclick="go('zhangbei')">张北</a>
	        <a href="<%=WebRoot %>/pld/<%=tid %>" onclick="go('pld')">庄河</a>
        </dd>
    </dl>
    </div>

</div>

<div class="footer">
    <%--北京市公安局朝阳分局备案编号:xxxxxxxxxx &nbsp; &nbsp; --%>
    &copy; flxxwang.com <br />
    <a href="http://www.miibeian.gov.cn/">浙ICP备09071137号-4</a>
    <%--<a href='http://www.flxxwang.com/about/'>与<%=SiteInfo.Name%>对话</a>--%>
</div>

<script type="text/javascript">
    var alephArray = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', /*'I'*/'J', 'K', 'L', 'M', 'N', /*'O',*/'P', 'Q', 'R', 'S', 'T', /*'U','V',*/'W', 'X', 'Y', 'Z'];
    var navObj = null;
    var lastShowDiv = "div_list";
    $(function () {
        var navHTML = $("#nav").html();
        var html = $("#cityList")[0].outerHTML;
        for (var i = 0; i < alephArray.length; i++) {
            var sep1 = "<dt>" + alephArray[i] + ".</dt>";
            var sep2 = "</dl>";
            if (i < alephArray.length - 1) {
                sep2 = "<dt>" + alephArray[i + 1] + ".</dt>";
            }
            var startIndex = html.indexOf(sep1);
            if (startIndex == -1) {
                continue;
            }
            var str = html.substr(startIndex + sep1.length, html.indexOf(sep2) - (startIndex + sep1.length));
            //$("#nav div").last().after("<div id='div_" + alephArray[i] + "' style='vertical-align:top;'><dl class='cityList' style='margin-top:20px;'><dt></dt>" + str + "</dl></div>");
            navHTML += "<div id='div_" + alephArray[i] + "' style='vertical-align:top;'><dl class='cityList' style='margin-top:20px;'><dt></dt>" + str + "</dl></div>";
        }
        navObj = $(navHTML);
        $("#nav div").last().after("<div></div>");
    });
    var _width = 965;
    var duration = 1000;
    //var easing = "easeInOutQuad"; //"easeOutQuad";
    var easing = "easeInOutCubic";
    function moveNav(aleph) {
        if (aleph == null && lastShowDiv == "div_list") {
            return;
        }
        if ("div_" + aleph == lastShowDiv) {
            return;
        }
        if (lastShowDiv == aleph) {
            return;
        }
        if (aleph == null) {
            var html = getDivHTML("div_list") + getDivHTML(lastShowDiv);
            $("#nav").html(html);
            $("#nav").scrollLeft(_width);
            $("#nav").animate({ scrollLeft: 0 }, { duration: duration, easing: easing });
        }
        else {
            if (lastShowDiv == "div_list") {
                var html = getDivHTML("div_list") + getDivHTML("div_"+aleph);
                $("#nav").html(html);
                $("#nav").scrollLeft(0);
                $("#nav").animate({ scrollLeft: _width }, { duration: duration, easing: easing });
            }
            else {
                var lastAlephIndex = alephArray.indexOf(lastShowDiv.substr(4, 1));
                var alephIndex = alephArray.indexOf(aleph);
                if (alephIndex > lastAlephIndex) {
                    var html = getDivHTML(lastShowDiv) + getDivHTML("div_" + aleph);
                    $("#nav").html(html);
                    $("#nav").scrollLeft(0);
                    $("#nav").animate({ scrollLeft: _width }, { duration: duration, easing: easing });
                }
                else {
                    var html = getDivHTML("div_" + aleph) + getDivHTML(lastShowDiv);
                    $("#nav").html(html);
                    $("#nav").scrollLeft(_width);
                    $("#nav").animate({ scrollLeft: 0 }, { duration: duration, easing: easing });
                }
            }
        }
        if (aleph == null) {
            lastShowDiv = "div_list";
        }
        else {
            lastShowDiv = "div_" + aleph;
        }
    }
    function getDivHTML(id) {
        for (var i = 0; i < navObj.length; i++) {
            if (navObj[i].id == id) {
                return navObj[i].outerHTML;
            }
        }
        return null;
    }
</script>

<script type="text/javascript">
    function go(code) {
        if (location.href.endWith("/")) {
            location.href = location.href + code+"/<%=tid %>";
        }
        else {
            location.href = location.href + "/" + code + "/<%=tid %>";
        }
    }
</script>

<script type="text/javascript">
    $(function () {
        var ddlProvince = $("#province");
        var provinces = $f.area.getProvinces();
        for (var i = 0; i < provinces.length; i++) {
            var p = provinces[i];
            var option = $("<option>").text(p.ShortName).val(p.Id);
            ddlProvince.append(option);
        }
        resetCity(ddlProvince.val());
        ddlProvince.get(0).onchange = function () {

            resetCity($(this).val());
        };
    });
    function resetCity(pid) {
        var ddl = $("#city");
        ddl.empty();
        if (pid == undefined || pid == null || pid == "") {
            return;
        }
        var cities = $f.area.getCities(pid);
        for (var i = 0; i < cities.length; i++) {
            var city = cities[i];
            var option = $("<option>").text(city.ShortName).val(city.Id);
            $(option).attr("Code", city.Code);
            ddl.append(option);
        }
    }
    function btnOk() {
        var code = $("#city").find("option:selected").attr("Code");
        go(code);
    }
    function goCity() {
        var cityName = $("#_cityinput").val();
        if (cityName == "") {
            alert("对不起,没有找到该城市!");
            return;
        }
        var cities = $f.area.getAllCities();
        for (var i = 0; i < cities.length; i++) {
            var city = cities[i];
            if (city.ShortName == cityName) {
                var code = city.Code;
                go(code);
                return;
            }
        }
        alert("对不起,没有找到该城市!");
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

<div style="display:none;">
    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F6500c0b919d3d8e37db64dba3329109d' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script language="javascript" type="text/javascript" src="http://js.users.51.la/3273253.js"></script>
    <noscript><a href="http://www.51.la/?3273253" target="_blank"><img alt="<%=SiteInfo.Name%> -- taojen.com" src="http://img.users.51.la/3273253.asp" style="border:none" /></a></noscript>
    <script type="text/javascript" src="/Areas/Tongji/Content/tongji.js"></script>
</div>

</body>
</html>
