<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title><%=SiteInfo.Name%> - 中国第一<%=SiteInfo.Name%>站|免费发布信息</title>
    <meta name="keywords" content="分类信息,免费发布信息" />
    <meta name="description" content="<%=SiteInfo.Name%>是中国第一中文<%=SiteInfo.Name%>站，涵盖房产、车辆、招工、兼职、黄页等海量的生活分类信息，满足您不同的查询需求。同时也是您最好的免费发布信息网站。" />
    <script type="text/javascript" src="/Scripts/jquery-1.5.1-vsdoc.js"></script>
    <script type="text/javascript" src="/Scripts/framework/framework.js?v20110101"></script>
    <script type="text/javascript" src="/Scripts/framework/Area/city_debug.js"></script>
    <script type="text/javascript" src="/Areas/Fenlei/Scripts/Infomation.js?v20110101"></script>
    <style type="text/css">body
        {
            text-align:center;
            font-size:14px; 
            font-family:Arial, "宋体" , sans-serif; 
            line-height:200%; background:#fff
        }
        body,ul,h1,h2,form,p,dl,dt,dd,p,form
        {
            margin:0; padding:0; list-style:none
        }
        img
        {
            border:none
        }
        a
        {
            color:#00c; margin: 0px 3px; text-decoration:none
        } 
        a:hover
        {
            color:#FF0508; text-decoration:underline
        }
        .c6
        {
            color:#585858
        }
        #logo,#qianm,#postgg
        {
            background:url(http://pic2.58.com/ui6/www/wpic.gif?2011425) no-repeat
        }
        #header
        {
            width:100%; border-bottom:2px solid #ff7200
        }
        #headerinside
        {
            height:240px;position:relative;width:990px; margin:0 auto;z-index: 10000
        }
        #logo 
        {
            background-position:9px 63px;position:absolute;left:20px;top:97px; width:230px; padding-bottom:22px;
        }
        #postgg 
        {
            background-position:0 -54px; width:443px; height:105px; position:absolute; right:-50px; bottom:0; line-height:26px; padding:105px 40px 0 60px; text-align:left; z-index:666
        }
        #qianm
        {
            background-position:-474px 0; width:70px; height:50px; position:absolute; left:220px; bottom:10px; display:inline-block; z-index:999
        }
        #flashimg{position:absolute; width:300px; height:240px; overflow:hidden; left:292px; bottom:0; z-index:662}
        #flashimg img{position:absolute; left:0px; bottom:0; background:#fff}
        .gray{color:#999}.lr{color: #f00;text-decoration: underline}
        .ml{margin-left:50px}.c{clear: both}.co16{clear:#0000cc; font-size:16px}
        .index_bo{width:990px; margin:0 auto; text-align:left; overflow:hidden}
        .topcity{ background:url(http://pic2.58.com/ui6/www/wsear.gif?2011425) repeat-x; width:100%; margin-top:1px;}
        .topcity .index_bo{border-bottom:1px solid #ccc; padding:18px 20px; width:970px; padding-right:0}
        .topcity a{margin-right:8px; text-decoration:underline}
        #citysear{ height:22px;line-height:22px; font-size:12px; padding-top:10px;white-space:nowrap;}
        #clist{width:960px; margin:0 auto; padding:10px 0px 10px 20px; clear:both;overflow:hidden;zoom:1}
        #clist dt{float: left;width: 30px;font-family: Arial, Helvetica, sans-serif; font-size: 16px;clear: both;font-weight: bold;margin: 0px;padding: 0px}
        #clist dd{float: left;width: 930px;margin-left: 0px;padding: 0px;margin-bottom: 10px}
        #clist dd a{font-size: 13px; margin-right:14px; white-space:nowrap}
        .footer{width:990px; margin:0 auto; text-align: center;border-top: 1px solid #ccc;padding: 15px 0px;font-size: 12px;line-height: 180%; overflow:hidden}
        .footer a{font-size: 12px;color: #666;text-decoration: underline}
        #changcityForm{display:inline}.cityinput{width:167px}
        .tooltip{border:1px solid #ccc;background:#fff;margin:-2px 0 0 1px;margin:-2px 0 0 0\0;_margin:-1px 0 0 0px}
        @media screen and (-webkit-min-device-pixel-ratio:0){.tooltip{margin:0}}
        .tooltip li{padding:0 5px;overflow:hidden;zoom:1}
        .tooltip li a{color:#666;text-decoration:none}.tooltip li a b{color:#002cad}
        .tooltip li .tool_r{float:right;color:#090;font-size:11px}
        .tooltip li.selected a b,.tooltip li.selected a,.tooltip li.selected .tool_r{color:#fff}
        .tooltip li.selected,.tag_options li.open_hover{background:#FD7A0E;color:#FFF}
        #tooltipdiv2{width:170px;font-size:12px;text-align:left}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
            <div id="headerinside">
                <a href="http://www.58.com">
                    <%--<img src="http://pic2.58.com/ui6/www/logo.gif?2011425" id="logo" />--%>
                </a>
	            <div id="postgg">
                    免费发布/查询 租房、 二手房、招聘求职、二手车、二手家电、<br />
                    宠物买卖、 家政保洁、今日团购 等本地生活信息。
                </div>
                <%--<span id="qianm"></span>--%>
                <div id="flashimga">
                    <%--<img src="http://pic2.58.com/ui6/www/1.gif?20114251846"/>
                    <img src="http://pic2.58.com/ui6/www/2.gif?20114251846"/>--%>
                </div>
            </div>
        </div>

        <div class="topcity">
	        <div class="index_bo">
                <a href="http://flxxwang.com/bj/" class="co16"><b>进入北京站&raquo;</b></a>
                <span class="gray ml">热门城市：</span>
                <a href="http://flxxwang.com/bj/" onclick="co('bj')"><b>北京</b></a>
                <a href="http://flxxwang.com/sh/" onclick="co('sh')"><b>上海</b></a>
                <a href="http://flxxwang.com/gz/" onclick="co('gz')"><b>广州</b></a>
                <a href="http://flxxwang.com/sz/" onclick="co('sz')"><b>深圳</b></a>
                <a href="http://flxxwang.com/hz/" onclick="co('hz')"><b>杭州</b></a>
                <a href="http://flxxwang.com/nj/" onclick="co('nj')"><b>南京</b></a>
                <a href="http://flxxwang.com/tj/" onclick="co('tj')"><b>天津</b></a>
                <a href="http://flxxwang.com/wh/" onclick="co('wh')"><b>武汉</b></a>
            <div class="c">
        </div>
        <div id="citysear">
            按省份选择城市： 
            <select id="province" name="province"></select>
            <select id="city" name="city"></select>
            <input type="button" value="确定" onclick="btnOk();" />
            <%--<form onsubmit="goCity(document.getElementById('_cityinput').value,'');return false;" id="changcityForm">--%>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;或直接输入
                <input type="text" id="_cityinput" fdv="请输入城市拼音" value="" class="cityinput" />
                <input type="button" value="确定" id="_citybtn" onclick="goCity();" />
            <%--</form>--%>
        </div>
</div>
</div>

<div class="index_bo">
    <dl id="clist">
        <dt>A.</dt>
        <dd>
	        <a href="/fenlei/as" onclick="go('as')">鞍山</a>
	        <a href="/fenlei/ay" onclick="go('ay')">安阳</a>
	        <a href="/fenlei/anqing" onclick="go('anqing')">安庆</a>
	        <a href="/fenlei/ankang" onclick="go('ankang')">安康</a>
	        <a href="/fenlei/am" onclick="go('am')">澳门</a>
	        <a href="/fenlei/aks" onclick="go('aks')">阿克苏</a>
	        <a href="/fenlei/ale" onclick="go('ale')">阿拉尔</a>
	        <a href="/fenlei/al" onclick="go('al')">阿里</a>
	        <a href="/fenlei/ab" onclick="go('ab')">阿坝</a>
	        <a href="/fenlei/alsm" onclick="go('alsm')">阿拉善盟</a>
	        <a href="/fenlei/anshun" onclick="go('anshun')">安顺</a>
        </dd>
        <dt>B.</dt>
        <dd>
	        <a href="/fenlei/bj" onclick="go('bj')">北京</a>
	        <a href="/fenlei/bd" onclick="go('bd')">保定</a>
	        <a href="/fenlei/bt" onclick="go('bt')">包头</a>
	        <a href="/fenlei/bz" onclick="go('bz')">滨州</a>
	        <a href="/fenlei/baoji" onclick="go('baoji')">宝鸡</a>
	        <a href="/fenlei/bengbu" onclick="go('bengbu')">蚌埠</a>
	        <a href="/fenlei/benxi" onclick="go('benxi')">本溪</a>
	        <a href="/fenlei/bc" onclick="go('bc')">白城</a>
	        <a href="/fenlei/bozhou" onclick="go('bozhou')">亳州</a>
	        <a href="/fenlei/bs" onclick="go('bs')">保山</a>
	        <a href="/fenlei/bygl" onclick="go('bygl')">巴音郭楞</a>
	        <a href="/fenlei/betl" onclick="go('betl')">博尔塔拉</a>
	        <a href="/fenlei/bazhong" onclick="go('bazhong')">巴中</a>
	        <a href="/fenlei/bycem" onclick="go('bycem')">巴彦淖尔盟</a>
	        <a href="/fenlei/baishan" onclick="go('baishan')">白山</a>
	        <a href="/fenlei/by" onclick="go('by')">白银</a>
	        <a href="/fenlei/baise" onclick="go('baise')">百色</a>
	        <a href="/fenlei/bh" onclick="go('bh')">北海</a>
	        <a href="/fenlei/bijie" onclick="go('bijie')">毕节</a>
        </dd>
        <dt>C.</dt>
        <dd>
	        <a href="/fenlei/cd" onclick="go('cd')">成都</a>
	        <a href="/fenlei/cs" onclick="go('cs')">长沙</a>
	        <a href="/fenlei/cq" onclick="go('cq')">重庆</a>
	        <a href="/fenlei/cc" onclick="go('cc')">长春</a>
	        <a href="/fenlei/cz" onclick="go('cz')">常州</a>
	        <a href="/fenlei/cangzhou" onclick="go('cangzhou')">沧州</a>
	        <a href="/fenlei/changde" onclick="go('changde')">常德</a>
	        <a href="/fenlei/chenzhou" onclick="go('chenzhou')">郴州</a>
	        <a href="/fenlei/chifeng" onclick="go('chifeng')">赤峰</a>
	        <a href="/fenlei/chengde" onclick="go('chengde')">承德</a>
	        <a href="/fenlei/changzhi" onclick="go('changzhi')">长治</a>
	        <a href="/fenlei/cx" onclick="go('cx')">楚雄</a>
	        <a href="/fenlei/changji" onclick="go('changji')">昌吉</a>
	        <a href="/fenlei/changge" onclick="go('changge')">长葛</a>
	        <a href="/fenlei/changdu" onclick="go('changdu')">昌都</a>
	        <a href="/fenlei/cy" onclick="go('cy')">朝阳</a>
	        <a href="/fenlei/ch" onclick="go('ch')">巢湖</a>
	        <a href="/fenlei/chizhou" onclick="go('chizhou')">池州</a>
	        <a href="/fenlei/chuzhou" onclick="go('chuzhou')">滁州</a>
	        <a href="/fenlei/chaozhou" onclick="go('chaozhou')">潮州</a>
	        <a href="/fenlei/chongzuo" onclick="go('chongzuo')">崇左</a>
        </dd>
        <dt>D.</dt>
        <dd>
	        <a href="/fenlei/dg" onclick="go('dg')">东莞</a>
	        <a href="/fenlei/dl" onclick="go('dl')">大连</a>
	        <a href="/fenlei/dz" onclick="go('dz')">德州</a>
	        <a href="/fenlei/dy" onclick="go('dy')">东营</a>
	        <a href="/fenlei/dq" onclick="go('dq')">大庆</a>
	        <a href="/fenlei/dandong" onclick="go('dandong')">丹东</a>
	        <a href="/fenlei/dt" onclick="go('dt')">大同</a>
	        <a href="/fenlei/dali" onclick="go('dali')">大理</a>
	        <a href="/fenlei/dingzhou" onclick="go('dingzhou')">定州</a>
	        <a href="/fenlei/deyang" onclick="go('deyang')">德阳</a>
	        <a href="/fenlei/diqing" onclick="go('diqing')">迪庆</a>
	        <a href="/fenlei/dh" onclick="go('dh')">德宏</a>
	        <a href="/fenlei/dazhou" onclick="go('dazhou')">达州</a>
	        <a href="/fenlei/dx" onclick="go('dx')">定西</a>
	        <a href="/fenlei/dxal" onclick="go('dxal')">大兴安岭</a>
	        <a href="/fenlei/dafeng" onclick="go('dafeng')">大丰</a>
        </dd>
        <dt>E.</dt>
        <dd>
	        <a href="/fenlei/erds" onclick="go('erds')">鄂尔多斯</a>
	        <a href="/fenlei/es" onclick="go('es')">恩施</a>
	        <a href="/fenlei/ez" onclick="go('ez')">鄂州</a>
        </dd>
        <dt>F.</dt>
        <dd>
	        <a href="/fenlei/fz" onclick="go('fz')">福州</a>
	        <a href="/fenlei/fs" onclick="go('fs')">佛山</a>
	        <a href="/fenlei/fushun" onclick="go('fushun')">抚顺</a>
	        <a href="/fenlei/fy" onclick="go('fy')">阜阳</a>
	        <a href="/fenlei/fx" onclick="go('fx')">阜新</a>
	        <a href="/fenlei/fuzhou" onclick="go('fuzhou')">抚州</a>
	        <a href="/fenlei/fcg" onclick="go('fcg')">防城港</a>
        </dd>
        <dt>G.</dt>
        <dd>
	        <a href="/fenlei/gz" onclick="go('gz')">广州</a>
	        <a href="/fenlei/gy" onclick="go('gy')">贵阳</a>
	        <a href="/fenlei/gl" onclick="go('gl')">桂林</a>
	        <a href="/fenlei/gg" onclick="go('gg')">贵港</a>
	        <a href="/fenlei/guyuan" onclick="go('guyuan')">固原</a>
	        <a href="/fenlei/ganzhou" onclick="go('ganzhou')">赣州</a>
	        <a href="/fenlei/gt" onclick="go('gt')">馆陶</a>
	        <a href="/fenlei/ga" onclick="go('ga')">广安</a>
	        <a href="/fenlei/guangyuan" onclick="go('guangyuan')">广元</a>
	        <a href="/fenlei/ganzi" onclick="go('ganzi')">甘孜</a>
	        <a href="/fenlei/guoluo" onclick="go('guoluo')">果洛</a>
	        <a href="/fenlei/gn" onclick="go('gn')">甘南</a>
	        <a href="/fenlei/hlbe" onclick="go('hlbe')">呼伦贝尔</a>
        </dd>
        <dt>H.</dt>
        <dd>
	        <a href="/fenlei/hz" onclick="go('hz')">杭州</a>
	        <a href="/fenlei/hrb" onclick="go('hrb')">哈尔滨</a>
	        <a href="/fenlei/haikou" onclick="go('haikou')">海口</a>
	        <a href="/fenlei/hf" onclick="go('hf')">合肥</a>
	        <a href="/fenlei/hu" onclick="go('hu')">呼和浩特</a>
	        <a href="/fenlei/huizhou" onclick="go('huizhou')">惠州</a>
	        <a href="/fenlei/hy" onclick="go('hy')">衡阳</a>
	        <a href="/fenlei/hd" onclick="go('hd')">邯郸</a>
	        <a href="/fenlei/huzhou" onclick="go('huzhou')">湖州</a>
	        <a href="/fenlei/hs" onclick="go('hs')">衡水</a>
	        <a href="/fenlei/hanzhong" onclick="go('hanzhong')">汉中</a>
	        <a href="/fenlei/ha" onclick="go('ha')">淮安</a>
	        <a href="/fenlei/hshi" onclick="go('hshi')">黄石</a>
	        <a href="/fenlei/hlr" onclick="go('hlr')">海拉尔</a>
	        <a href="/fenlei/heze" onclick="go('heze')">菏泽</a>
	        <a href="/fenlei/hh" onclick="go('hh')">怀化</a>
	        <a href="/fenlei/hg" onclick="go('hg')">黄冈</a>
	        <a href="/fenlei/hc" onclick="go('hc')">河池</a>
	        <a href="/fenlei/hami" onclick="go('hami')">哈密</a>
	        <a href="/fenlei/honghe" onclick="go('honghe')">红河</a>
	        <a href="/fenlei/hegang" onclick="go('hegang')">鹤岗</a>
	        <a href="/fenlei/hb" onclick="go('hb')">鹤壁</a>
	        <a href="/fenlei/hn" onclick="go('hn')">淮南</a>
	        <a href="/fenlei/huaibei" onclick="go('huaibei')">淮北</a>
	        <a href="/fenlei/huangshan" onclick="go('huangshan')">黄山</a>
	        <a href="/fenlei/ht" onclick="go('ht')">和田</a>
	        <a href="/fenlei/hlbe" onclick="go('hlbe')">呼伦贝尔</a>
	        <a href="/fenlei/huangna" onclick="go('huangna')">黄南</a>
	        <a href="/fenlei/hx" onclick="go('hx')">海西</a>
	        <a href="/fenlei/hainan" onclick="go('hainan')">海南</a>
	        <a href="/fenlei/haidong" onclick="go('haidong')">海东</a>
	        <a href="/fenlei/haibei" onclick="go('haibei')">海北</a>
	        <a href="/fenlei/hld" onclick="go('hld')">葫芦岛</a>
	        <a href="/fenlei/heyuan" onclick="go('heyuan')">河源</a>
	        <a href="/fenlei/hezhou" onclick="go('hezhou')">贺州</a>
	        <a href="/fenlei/heihe" onclick="go('heihe')">黑河</a>
	        <a href="/fenlei/hexian" onclick="go('hexian')">和县</a>
	        <a href="/fenlei/hq" onclick="go('hq')">霍邱</a>
        </dd>
        <dt>J.</dt>
        <dd>
	        <a href="/fenlei/jn" onclick="go('jn')">济南</a>
	        <a href="/fenlei/jining" onclick="go('jining')">济宁</a>
	        <a href="/fenlei/jx" onclick="go('jx')">嘉兴</a>
	        <a href="/fenlei/jm" onclick="go('jm')">江门</a>
	        <a href="/fenlei/jh" onclick="go('jh')">金华</a>
	        <a href="/fenlei/jl" onclick="go('jl')">吉林</a>
	        <a href="/fenlei/jy" onclick="go('jy')">揭阳</a>
	        <a href="/fenlei/jj" onclick="go('jj')">九江</a>
	        <a href="/fenlei/jiaozuo" onclick="go('jiaozuo')">焦作</a>
	        <a href="/fenlei/jincheng" onclick="go('jincheng')">晋城</a>
	        <a href="/fenlei/jingzhou" onclick="go('jingzhou')">荆州</a>
	        <a href="/fenlei/jms" onclick="go('jms')">佳木斯</a>
	        <a href="/fenlei/jixi" onclick="go('jixi')">鸡西</a>
	        <a href="/fenlei/ja" onclick="go('ja')">吉安</a>
	        <a href="/fenlei/jinchang" onclick="go('jinchang')">金昌</a>
	        <a href="/fenlei/jz" onclick="go('jz')">晋中</a>
	        <a href="/fenlei/jinzhou" onclick="go('jinzhou')">锦州</a>
	        <a href="/fenlei/jdz" onclick="go('jdz')">景德镇</a>
	        <a href="/fenlei/jingmen" onclick="go('jingmen')">荆门</a>
	        <a href="/fenlei/jyg" onclick="go('jyg')">嘉峪关</a>
	        <a href="/fenlei/jq" onclick="go('jq')">酒泉</a>
	        <a href="/fenlei/jiyuan" onclick="go('jiyuan')">济源</a>
        </dd>
        <dt>K.</dt>
        <dd>
	        <a href="/fenlei/km" onclick="go('km')">昆明</a>
	        <a href="/fenlei/klmy" onclick="go('klmy')">克拉玛依</a>
	        <a href="/fenlei/kel" onclick="go('kel')">库尔勒</a>
	        <a href="/fenlei/kaifeng" onclick="go('kaifeng')">开封</a>
	        <a href="/fenlei/ks" onclick="go('ks')">喀什</a>
	        <a href="/fenlei/kzls" onclick="go('kzls')">克孜勒苏</a>
	        <a href="/fenlei/kl" onclick="go('kl')">垦利</a>
        </dd>
        <dt>L.</dt>
        <dd>
	        <a href="/fenlei/lz" onclick="go('lz')">兰州</a>
	        <a href="/fenlei/luoyang" onclick="go('luoyang')">洛阳</a>
	        <a href="/fenlei/lf" onclick="go('lf')">廊坊</a>
	        <a href="/fenlei/linyi" onclick="go('linyi')">临沂</a>
	        <a href="/fenlei/lc" onclick="go('lc')">聊城</a>
	        <a href="/fenlei/lyg" onclick="go('lyg')">连云港</a>
	        <a href="/fenlei/lvliang" onclick="go('lvliang')">吕梁</a>
	        <a href="/fenlei/ls" onclick="go('ls')">乐山</a>
	        <a href="/fenlei/liaoyang" onclick="go('liaoyang')">辽阳</a>
	        <a href="/fenlei/liaoyuan" onclick="go('liaoyuan')">辽源</a>
	        <a href="/fenlei/lasa" onclick="go('lasa')">拉萨</a>
	        <a href="/fenlei/linfen" onclick="go('linfen')">临汾</a>
	        <a href="/fenlei/ly" onclick="go('ly')">龙岩</a>
	        <a href="/fenlei/linxia" onclick="go('linxia')">临夏</a>
	        <a href="/fenlei/liuzhou" onclick="go('liuzhou')">柳州</a>
	        <a href="/fenlei/luohe" onclick="go('luohe')">漯河</a>
	        <a href="/fenlei/luzhou" onclick="go('luzhou')">泸州</a>
	        <a href="/fenlei/lishui" onclick="go('lishui')">丽水</a>
	        <a href="/fenlei/lj" onclick="go('lj')">丽江</a>
	        <a href="/fenlei/la" onclick="go('la')">六安</a>
	        <a href="/fenlei/lw" onclick="go('lw')">莱芜</a>
	        <a href="/fenlei/linyixian" onclick="go('linyixian')">临猗</a>
	        <a href="/fenlei/lincang" onclick="go('lincang')">临沧</a>
	        <a href="/fenlei/linzhi" onclick="go('linzhi')">林芝</a>
	        <a href="/fenlei/liangshan" onclick="go('liangshan')">凉山</a>
	        <a href="/fenlei/ld" onclick="go('ld')">娄底</a>
	        <a href="/fenlei/ln" onclick="go('ln')">陇南</a>
	        <a href="/fenlei/lb" onclick="go('lb')">来宾</a>
	        <a href="/fenlei/lps" onclick="go('lps')">六盘水</a>
        </dd>
        <dt>M.</dt>
        <dd>
	        <a href="/fenlei/mianyang" onclick="go('mianyang')">绵阳</a>
	        <a href="/fenlei/mm" onclick="go('mm')">茂名</a>
	        <a href="/fenlei/mas" onclick="go('mas')">马鞍山</a>
	        <a href="/fenlei/mdj" onclick="go('mdj')">牡丹江</a>
	        <a href="/fenlei/mg" onclick="go('mg')">明港</a>
	        <a href="/fenlei/mz" onclick="go('mz')">梅州</a>
	        <a href="/fenlei/ms" onclick="go('ms')">眉山</a>
        </dd>
        <dt>N.</dt>
        <dd>
	        <a href="/fenlei/nj" onclick="go('nj')">南京</a>
	        <a href="/fenlei/nc" onclick="go('nc')">南昌</a>
	        <a href="/fenlei/nb" onclick="go('nb')">宁波</a>
	        <a href="/fenlei/nn" onclick="go('nn')">南宁</a>
	        <a href="/fenlei/ny" onclick="go('ny')">南阳</a>
	        <a href="/fenlei/nt" onclick="go('nt')">南通</a>
	        <a href="/fenlei/scnj" onclick="go('scnj')">内江</a>
	        <a href="/fenlei/nd" onclick="go('nd')">宁德</a>
	        <a href="/fenlei/nanchong" onclick="go('nanchong')">南充</a>
	        <a href="/fenlei/nujiang" onclick="go('nujiang')">怒江</a>
	        <a href="/fenlei/nq" onclick="go('nq')">那曲</a>
	        <a href="/fenlei/np" onclick="go('np')">南平</a>
        </dd>
        <dt>P.</dt>
        <dd>
	        <a href="/fenlei/pds" onclick="go('pds')">平顶山</a>
	        <a href="/fenlei/pj" onclick="go('pj')">盘锦</a>
	        <a href="/fenlei/px" onclick="go('px')">萍乡</a>
	        <a href="/fenlei/pl" onclick="go('pl')">平凉</a>
	        <a href="/fenlei/puyang" onclick="go('puyang')">濮阳</a>
	        <a href="/fenlei/panzhihua" onclick="go('panzhihua')">攀枝花</a>
	        <a href="/fenlei/pt" onclick="go('pt')">莆田</a>
	        <a href="/fenlei/pe" onclick="go('pe')">普洱</a>
        </dd>
        <dt>Q.</dt>
        <dd>
	        <a href="/fenlei/qd" onclick="go('qd')">青岛</a>
	        <a href="/fenlei/qz" onclick="go('qz')">泉州</a>
	        <a href="/fenlei/qhd" onclick="go('qhd')">秦皇岛</a>
	        <a href="/fenlei/cn" onclick="go('cn')">其他</a>
	        <a href="/fenlei/qqhr" onclick="go('qqhr')">齐齐哈尔</a>
	        <a href="/fenlei/quzhou" onclick="go('quzhou')">衢州</a>
	        <a href="/fenlei/qingyuan" onclick="go('qingyuan')">清远</a>
	        <a href="/fenlei/qinzhou" onclick="go('qinzhou')">钦州</a>
	        <a href="/fenlei/qj" onclick="go('qj')">曲靖</a>
	        <a href="/fenlei/qdn" onclick="go('qdn')">黔东南</a>
	        <a href="/fenlei/qingyang" onclick="go('qingyang')">庆阳</a>
	        <a href="/fenlei/qn" onclick="go('qn')">黔南</a>
	        <a href="/fenlei/qxn" onclick="go('qxn')">黔西南</a>
	        <a href="/fenlei/qth" onclick="go('qth')">七台河</a>
	        <a href="/fenlei/qianjiang" onclick="go('qianjiang')">潜江</a>
	        <a href="/fenlei/qingxu" onclick="go('qingxu')">清徐</a>
        </dd>
        <dt>R.</dt>
        <dd>
	        <a href="/fenlei/rizhao" onclick="go('rizhao')">日照</a>
	        <a href="/fenlei/rkz" onclick="go('rkz')">日喀则</a>
        </dd>
        <dt>S.</dt>
        <dd>
	        <a href="/fenlei/sh" onclick="go('sh')">上海</a>
	        <a href="/fenlei/sz" onclick="go('sz')">深圳</a>
	        <a href="/fenlei/su" onclick="go('su')">苏州</a>
	        <a href="/fenlei/sjz" onclick="go('sjz')">石家庄</a>
	        <a href="/fenlei/sy" onclick="go('sy')">沈阳</a>
	        <a href="/fenlei/st" onclick="go('st')">汕头</a>
	        <a href="/fenlei/suzhou" onclick="go('suzhou')">宿州</a>
	        <a href="/fenlei/sx" onclick="go('sx')">绍兴</a>
	        <a href="/fenlei/shiyan" onclick="go('shiyan')">十堰</a>
	        <a href="/fenlei/sm" onclick="go('sm')">三明</a>
	        <a href="/fenlei/sg" onclick="go('sg')">韶关</a>
	        <a href="/fenlei/sq" onclick="go('sq')">商丘</a>
	        <a href="/fenlei/shuyang" onclick="go('shuyang')">沭阳</a>
	        <a href="/fenlei/suqian" onclick="go('suqian')">宿迁</a>
	        <a href="/fenlei/suihua" onclick="go('suihua')">绥化</a>
	        <a href="/fenlei/shaoyang" onclick="go('shaoyang')">邵阳</a>
	        <a href="/fenlei/sanya" onclick="go('sanya')">三亚</a>
	        <a href="/fenlei/sd" onclick="go('sd')">顺德</a>
	        <a href="/fenlei/songyuan" onclick="go('songyuan')">松原</a>
	        <a href="/fenlei/smx" onclick="go('smx')">三门峡</a>
	        <a href="/fenlei/sw" onclick="go('sw')">汕尾</a>
	        <a href="/fenlei/suizhou" onclick="go('suizhou')">随州</a>
	        <a href="/fenlei/shz" onclick="go('shz')">石河子</a>
	        <a href="/fenlei/sn" onclick="go('sn')">山南</a>
	        <a href="/fenlei/suining" onclick="go('suining')">遂宁</a>
	        <a href="/fenlei/sl" onclick="go('sl')">商洛</a>
	        <a href="/fenlei/shuozhou" onclick="go('shuozhou')">朔州</a>
	        <a href="/fenlei/szs" onclick="go('szs')">石嘴山</a>
	        <a href="/fenlei/sr" onclick="go('sr')">上饶</a>
	        <a href="/fenlei/sp" onclick="go('sp')">四平</a>
	        <a href="/fenlei/sys" onclick="go('sys')">双鸭山</a>
	        <a href="/fenlei/snj" onclick="go('snj')">神农架</a>
        </dd>
        <dt>T.</dt>
        <dd>
	        <a href="/fenlei/tj" onclick="go('tj')">天津</a>
	        <a href="/fenlei/ty" onclick="go('ty')">太原</a>
	        <a href="/fenlei/ts" onclick="go('ts')">唐山</a>
	        <a href="/fenlei/ta" onclick="go('ta')">泰安</a>
	        <a href="/fenlei/tz" onclick="go('tz')">台州</a>
	        <a href="/fenlei/taizhou" onclick="go('taizhou')">泰州</a>
	        <a href="/fenlei/tw" onclick="go('tw')">台湾</a>
	        <a href="/fenlei/tl" onclick="go('tl')">铁岭</a>
	        <a href="/fenlei/tianshui" onclick="go('tianshui')">天水</a>
	        <a href="/fenlei/tlf" onclick="go('tlf')">吐鲁番</a>
	        <a href="/fenlei/tmsk" onclick="go('tmsk')">图木舒克</a>
	        <a href="/fenlei/tc" onclick="go('tc')">铜川</a>
	        <a href="/fenlei/tongliao" onclick="go('tongliao')">通辽</a>
	        <a href="/fenlei/th" onclick="go('th')">通化</a>
	        <a href="/fenlei/tongling" onclick="go('tongling')">铜陵</a>
	        <a href="/fenlei/tr" onclick="go('tr')">铜仁</a>
	        <a href="/fenlei/tm" onclick="go('tm')">天门</a>
	        <a href="/fenlei/taishan" onclick="go('taishan')">台山</a>
	        <a href="/fenlei/tongcheng" onclick="go('tongcheng')">桐城</a>
        </dd>
        <dt>W.</dt>
        <dd>
	        <a href="/fenlei/wh" onclick="go('wh')">武汉</a>
	        <a href="/fenlei/wx" onclick="go('wx')">无锡</a>
	        <a href="/fenlei/wf" onclick="go('wf')">潍坊</a>
	        <a href="/fenlei/xj" onclick="go('xj')">乌鲁木齐</a>
	        <a href="/fenlei/wz" onclick="go('wz')">温州</a>
	        <a href="/fenlei/weihai" onclick="go('weihai')">威海</a>
	        <a href="/fenlei/wuhu" onclick="go('wuhu')">芜湖</a>
	        <a href="/fenlei/wuzhou" onclick="go('wuzhou')">梧州</a>
	        <a href="/fenlei/wfd" onclick="go('wfd')">瓦房店</a>
	        <a href="/fenlei/wn" onclick="go('wn')">渭南</a>
	        <a href="/fenlei/ws" onclick="go('ws')">文山</a>
	        <a href="/fenlei/wuhai" onclick="go('wuhai')">乌海</a>
	        <a href="/fenlei/wjq" onclick="go('wjq')">五家渠</a>
	        <a href="/fenlei/wuzhong" onclick="go('wuzhong')">吴忠</a>
	        <a href="/fenlei/wlcb" onclick="go('wlcb')">乌兰察布</a>
	        <a href="/fenlei/wuwei" onclick="go('wuwei')">武威</a>
	        <a href="/fenlei/wzs" onclick="go('wzs')">五指山</a>
	        <a href="/fenlei/wuyishan" onclick="go('wuyishan')">武夷山</a>
        </dd>
        <dt>X.</dt>
        <dd>
	        <a href="/fenlei/xa" onclick="go('xa')">西安</a>
	        <a href="/fenlei/xm" onclick="go('xm')">厦门</a>
	        <a href="/fenlei/xz" onclick="go('xz')">徐州</a>
	        <a href="/fenlei/xiangtan" onclick="go('xiangtan')">湘潭</a>
	        <a href="/fenlei/xf" onclick="go('xf')">襄阳</a>
	        <a href="/fenlei/xx" onclick="go('xx')">新乡</a>
	        <a href="/fenlei/xt" onclick="go('xt')">邢台</a>
	        <a href="/fenlei/xiaogan" onclick="go('xiaogan')">孝感</a>
	        <a href="/fenlei/xn" onclick="go('xn')">西宁</a>
	        <a href="/fenlei/xc" onclick="go('xc')">许昌</a>
	        <a href="/fenlei/hk" onclick="go('hk')">香港</a>
	        <a href="/fenlei/xinzhou" onclick="go('xinzhou')">忻州</a>
	        <a href="/fenlei/xuancheng" onclick="go('xuancheng')">宣城</a>
	        <a href="/fenlei/bn" onclick="go('bn')">西双版纳</a>
	        <a href="/fenlei/xl" onclick="go('xl')">锡林</a>
	        <a href="/fenlei/xianyang" onclick="go('xianyang')">咸阳</a>
	        <a href="/fenlei/xy" onclick="go('xy')">信阳</a>
	        <a href="/fenlei/xam" onclick="go('xam')">兴安盟</a>
	        <a href="/fenlei/xinyu" onclick="go('xinyu')">新余</a>
	        <a href="/fenlei/xiangxi" onclick="go('xiangxi')">湘西</a>
	        <a href="/fenlei/xiantao" onclick="go('xiantao')">仙桃</a>
	        <a href="/fenlei/xianning" onclick="go('xianning')">咸宁</a>
        </dd>
        <dt>Y.</dt>
        <dd>
	        <a href="/fenlei/yt" onclick="go('yt')">烟台</a>
	        <a href="/fenlei/yanan" onclick="go('yanan')">延安</a>
	        <a href="/fenlei/yz" onclick="go('yz')">扬州</a>
	        <a href="/fenlei/yc" onclick="go('yc')">宜昌</a>
	        <a href="/fenlei/yancheng" onclick="go('yancheng')">盐城</a>
	        <a href="/fenlei/yy" onclick="go('yy')">岳阳</a>
	        <a href="/fenlei/yinchuan" onclick="go('yinchuan')">银川</a>
	        <a href="/fenlei/yanbian" onclick="go('yanbian')">延边</a>
	        <a href="/fenlei/yingtan" onclick="go('yingtan')">鹰潭</a>
	        <a href="/fenlei/yx" onclick="go('yx')">玉溪</a>
	        <a href="/fenlei/yuncheng" onclick="go('yuncheng')">运城</a>
	        <a href="/fenlei/yichun" onclick="go('yichun')">宜春</a>
	        <a href="/fenlei/yk" onclick="go('yk')">营口</a>
	        <a href="/fenlei/yl" onclick="go('yl')">榆林</a>
	        <a href="/fenlei/yb" onclick="go('yb')">宜宾</a>
	        <a href="/fenlei/yongzhou" onclick="go('yongzhou')">永州</a>
	        <a href="/fenlei/yj" onclick="go('yj')">阳江</a>
	        <a href="/fenlei/yangchun" onclick="go('yangchun')">阳春</a>
	        <a href="/fenlei/yq" onclick="go('yq')">阳泉</a>
	        <a href="/fenlei/yuzhou" onclick="go('yuzhou')">禹州</a>
	        <a href="/fenlei/yanling" onclick="go('yanling')">鄢陵</a>
	        <a href="/fenlei/yulin" onclick="go('yulin')">玉林</a>
	        <a href="/fenlei/yili" onclick="go('yili')">伊犁</a>
	        <a href="/fenlei/ya" onclick="go('ya')">雅安</a>
	        <a href="/fenlei/ys" onclick="go('ys')">玉树</a>
	        <a href="/fenlei/yiyang" onclick="go('yiyang')">益阳</a>
	        <a href="/fenlei/yf" onclick="go('yf')">云浮</a>
	        <a href="/fenlei/yich" onclick="go('yich')">伊春</a>
	        <a href="/fenlei/yxx" onclick="go('yxx')">永新</a>
	        <a href="/fenlei/yiwu" onclick="go('yiwu')">义乌</a>
        </dd>
        <dt>Z.</dt>
        <dd>
	        <a href="/fenlei/zz" onclick="go('zz')">郑州</a>
	        <a href="/fenlei/zh" onclick="go('zh')">珠海</a>
	        <a href="/fenlei/zjk" onclick="go('zjk')">张家口</a>
	        <a href="/fenlei/zs" onclick="go('zs')">中山</a>
	        <a href="/fenlei/zb" onclick="go('zb')">淄博</a>
	        <a href="/fenlei/zhuzhou" onclick="go('zhuzhou')">株洲</a>
	        <a href="/fenlei/zhangzhou" onclick="go('zhangzhou')">漳州</a>
	        <a href="/fenlei/zhanjiang" onclick="go('zhanjiang')">湛江</a>
	        <a href="/fenlei/zq" onclick="go('zq')">肇庆</a>
	        <a href="/fenlei/zaozhuang" onclick="go('zaozhuang')">枣庄</a>
	        <a href="/fenlei/zj" onclick="go('zj')">镇江</a>
	        <a href="/fenlei/zk" onclick="go('zk')">周口</a>
	        <a href="/fenlei/zd" onclick="go('zd')">正定</a>
	        <a href="/fenlei/zmd" onclick="go('zmd')">驻马店</a>
	        <a href="/fenlei/zg" onclick="go('zg')">自贡</a>
	        <a href="/fenlei/zjj" onclick="go('zjj')">张家界</a>
	        <a href="/fenlei/zy" onclick="go('zy')">资阳</a>
	        <a href="/fenlei/zunyi" onclick="go('zunyi')">遵义</a>
	        <a href="/fenlei/zhoushan" onclick="go('zhoushan')">舟山</a>
	        <a href="/fenlei/zhangqiu" onclick="go('zhangqiu')">章丘</a>
	        <a href="/fenlei/zx" onclick="go('zx')">赵县</a>
	        <a href="/fenlei/zc" onclick="go('zc')">诸城</a>
	        <a href="/fenlei/zt" onclick="go('zt')">昭通</a>
	        <a href="/fenlei/zw" onclick="go('zw')">中卫</a>
	        <a href="/fenlei/zhangye" onclick="go('zhangye')">张掖</a>
	        <a href="/fenlei/zhangbei" onclick="go('zhangbei')">张北</a>
	        <a href="/fenlei/pld" onclick="go('pld')">庄河</a>
        </dd>

        <%--<dt>A.</dt>
        <dd>
            <a href="http://as.58.com/" onclick="co('as')">鞍山</a>
            <a href="http://ay.58.com/" onclick="co('ay')">安阳</a>
            <a href="http://anqing.58.com/" onclick="co('anqing')">安庆</a>
            <a href="http://ankang.58.com/" onclick="co('ankang')">安康</a>
            <a href="http://am.58.com/" onclick="co('am')">澳门</a>
            <a href="http://aks.58.com/" onclick="co('aks')">阿克苏</a>
            <a href="http://ale.58.com/" onclick="co('ale')">阿拉尔</a>
            <a href="http://al.58.com/" onclick="co('al')">阿里</a>
            <a href="http://ab.58.com/" onclick="co('ab')">阿坝</a>
            <a href="http://alsm.58.com/" onclick="co('alsm')">阿拉善盟</a>
            <a href="http://anshun.58.com/" onclick="co('anshun')">安顺</a>
        </dd>
        <dt>B.</dt>
         <dd>
            <a href="http://bj.58.com/" class="lr" onclick="co('bj')">北京</a>
            <a href="http://bd.58.com/" onclick="co('bd')">保定</a>
            <a href="http://bt.58.com/" onclick="co('bt')">包头</a><a href="http://bz.58.com/" onclick="co('bz')">滨州</a><a href="http://baoji.58.com/" onclick="co('baoji')">宝鸡</a><a href="http://bengbu.58.com/" onclick="co('bengbu')">蚌埠</a><a href="http://benxi.58.com/" onclick="co('benxi')">本溪</a><a href="http://bc.58.com/" onclick="co('bc')">白城</a><a href="http://bozhou.58.com/" onclick="co('bozhou')">亳州</a><a href="http://bs.58.com/" onclick="co('bs')">保山</a><a href="http://bygl.58.com/" onclick="co('bygl')">巴音郭楞</a><a href="http://betl.58.com/" onclick="co('betl')">博尔塔拉</a><a href="http://bazhong.58.com/" onclick="co('bazhong')">巴中</a><a href="http://bycem.58.com/" onclick="co('bycem')">巴彦淖尔盟</a><a href="http://baishan.58.com/" onclick="co('baishan')">白山</a><a href="http://by.58.com/" onclick="co('by')">白银</a><a href="http://baise.58.com/" onclick="co('baise')">百色</a><a href="http://bh.58.com/" onclick="co('bh')">北海</a><a href="http://bijie.58.com/" onclick="co('bijie')">毕节</a>
        </dd>
        <dt>C.</dt><dd><a href="http://cd.58.com/" class="lr" onclick="co('cd')">成都</a><a href="http://cs.58.com/" onclick="co('cs')" class="lr">长沙</a><a href="http://cq.58.com/" onclick="co('cq')">重庆</a><a href="http://cc.58.com/" onclick="co('cc')">长春</a><a href="http://cz.58.com/" onclick="co('cz')">常州</a><a href="http://cangzhou.58.com/" onclick="co('cangzhou')">沧州</a><a href="http://changde.58.com/" onclick="co('changde')">常德</a><a href="http://chenzhou.58.com/" onclick="co('chenzhou')">郴州</a><a href="http://chifeng.58.com/" onclick="co('chifeng')">赤峰</a><a href="http://chengde.58.com/" onclick="co('chengde')">承德</a><a href="http://changzhi.58.com/" onclick="co('changzhi')">长治</a><a href="http://cx.58.com/" onclick="co('cx')">楚雄</a><a href="http://changji.58.com/" onclick="co('changji')">昌吉</a><a href="http://changge.58.com/" onclick="co('changge')">长葛</a><a href="http://changdu.58.com/" onclick="co('changdu')">昌都</a><a href="http://cy.58.com/" onclick="co('cy')">朝阳</a><a href="http://ch.58.com/" onclick="co('ch')">巢湖</a><a href="http://chizhou.58.com/" onclick="co('chizhou')">池州</a><a href="http://chuzhou.58.com/" onclick="co('chuzhou')">滁州</a><a href="http://chaozhou.58.com/" onclick="co('chaozhou')">潮州</a><a href="http://chongzuo.58.com/" onclick="co('chongzuo')">崇左</a></dd>
        <dt>D.</dt><dd><a href="http://dg.58.com/" onclick="co('dg')">东莞</a><a href="http://dl.58.com/" onclick="co('dl')">大连</a><a href="http://dz.58.com/" onclick="co('dz')">德州</a><a href="http://dy.58.com/" onclick="co('dy')">东营</a><a href="http://dq.58.com/" onclick="co('dq')">大庆</a><a href="http://dandong.58.com/" onclick="co('dandong')">丹东</a><a href="http://dt.58.com/" onclick="co('dt')">大同</a><a href="http://dali.58.com/" onclick="co('dali')">大理</a><a href="http://dingzhou.58.com/" onclick="co('dingzhou')">定州</a><a href="http://deyang.58.com/" onclick="co('deyang')">德阳</a><a href="http://diqing.58.com/" onclick="co('diqing')">迪庆</a><a href="http://dh.58.com/" onclick="co('dh')">德宏</a><a href="http://dazhou.58.com/" onclick="co('dazhou')">达州</a><a href="http://dx.58.com/" onclick="co('dx')">定西</a><a href="http://dxal.58.com/" onclick="co('dxal')">大兴安岭</a><a href="http://dafeng.58.com/" onclick="co('dafeng')">大丰</a></dd>
        <dt>E.</dt><dd><a href="http://erds.58.com/" onclick="co('erds')">鄂尔多斯</a><a href="http://es.58.com/" onclick="co('es')">恩施</a><a href="http://ez.58.com/" onclick="co('ez')">鄂州</a></dd>
        <dt>F.</dt><dd><a href="http://fz.58.com/" onclick="co('fz')">福州</a><a href="http://fs.58.com/" onclick="co('fs')">佛山</a><a href="http://fushun.58.com/" onclick="co('fushun')">抚顺</a><a href="http://fy.58.com/" onclick="co('fy')">阜阳</a><a href="http://fx.58.com/" onclick="co('fx')">阜新</a><a href="http://fuzhou.58.com/" onclick="co('fuzhou')">抚州</a><a href="http://fcg.58.com/" onclick="co('fcg')">防城港</a></dd>
        <dt>G.</dt><dd><a href="http://gz.58.com/" class="lr" onclick="co('gz')">广州</a><a href="http://gy.58.com/" onclick="co('gy')">贵阳</a><a href="http://gl.58.com/" onclick="co('gl')">桂林</a><a href="http://gg.58.com/" onclick="co('gg')">贵港</a><a href="http://guyuan.58.com/" onclick="co('guyuan')">固原</a><a href="http://ganzhou.58.com/" onclick="co('ganzhou')">赣州</a><a href="http://gt.58.com/" onclick="co('gt')">馆陶</a><a href="http://ga.58.com/" onclick="co('ga')">广安</a><a href="http://guangyuan.58.com/" onclick="co('guangyuan')">广元</a><a href="http://ganzi.58.com/" onclick="co('ganzi')">甘孜</a><a href="http://guoluo.58.com/" onclick="co('guoluo')">果洛</a><a href="http://gn.58.com/" onclick="co('gn')">甘南</a></dd>
        <dt>H.</dt><dd><a href="http://hz.58.com/" class="lr" onclick="co('hz')">杭州</a><a href="http://hrb.58.com/" onclick="co('hrb')">哈尔滨</a><a href="http://haikou.58.com/" onclick="co('haikou')">海口</a><a href="http://hf.58.com/" onclick="co('hf')">合肥</a><a href="http://hu.58.com/" onclick="co('hu')">呼和浩特</a><a href="http://huizhou.58.com/" onclick="co('huizhou')">惠州</a><a href="http://hy.58.com/" onclick="co('hy')">衡阳</a><a href="http://hd.58.com/" onclick="co('hd')">邯郸</a><a href="http://huzhou.58.com/" onclick="co('huzhou')">湖州</a><a href="http://hs.58.com/" onclick="co('hs')">衡水</a><a href="http://hanzhong.58.com/" onclick="co('hanzhong')">汉中</a><a href="http://ha.58.com/" onclick="co('ha')">淮安</a><a href="http://hshi.58.com/" onclick="co('hshi')">黄石</a><a href="http://hlr.58.com/" onclick="co('hlr')">海拉尔</a><a href="http://heze.58.com/" onclick="co('heze')">菏泽</a><a href="http://hh.58.com/" onclick="co('hh')">怀化</a><a href="http://hg.58.com/" onclick="co('hg')">黄冈</a><a href="http://hc.58.com/" onclick="co('hc')">河池</a><a href="http://hami.58.com/" onclick="co('hami')">哈密</a><a href="http://honghe.58.com/" onclick="co('honghe')">红河</a><br /><a href="http://hegang.58.com/" onclick="co('hegang')">鹤岗</a><a href="http://hb.58.com/" onclick="co('hb')">鹤壁</a><a href="http://hn.58.com/" onclick="co('hn')">淮南</a><a href="http://huaibei.58.com/" onclick="co('huaibei')">淮北</a><a href="http://huangshan.58.com/" onclick="co('huangshan')">黄山</a><a href="http://ht.58.com/" onclick="co('ht')">和田</a><a href="http://huangnan.58.com/" onclick="co('huangnan')">黄南</a><a href="http://hx.58.com/" onclick="co('hx')">海西</a><a href="http://hainan.58.com/" onclick="co('hainan')">海南</a><a href="http://haidong.58.com/" onclick="co('haidong')">海东</a><a href="http://haibei.58.com/" onclick="co('haibei')">海北</a><a href="http://hlbe.58.com/" onclick="co('hlbe')">呼伦贝尔</a><a href="http://hld.58.com/" onclick="co('hld')">葫芦岛</a><a href="http://heyuan.58.com/" onclick="co('heyuan')">河源</a><a href="http://hezhou.58.com/" onclick="co('hezhou')">贺州</a><a href="http://heihe.58.com/" onclick="co('heihe')">黑河</a><a href="http://hexian.58.com/" onclick="co('hexian')">和县</a><a href="http://hq.58.com/" onclick="co('hq')">霍邱</a></dd>
        <dt>J.</dt><dd><a href="http://jn.58.com/" class="lr" onclick="co('jn')">济南</a><a href="http://jining.58.com/" onclick="co('jining')">济宁</a><a href="http://jx.58.com/" onclick="co('jx')">嘉兴</a><a href="http://jm.58.com/" onclick="co('jm')">江门</a><a href="http://jh.58.com/" onclick="co('jh')">金华</a><a href="http://jl.58.com/" onclick="co('jl')">吉林</a><a href="http://jy.58.com/" onclick="co('jy')">揭阳</a><a href="http://jj.58.com/" onclick="co('jj')">九江</a><a href="http://jiaozuo.58.com/" onclick="co('jiaozuo')">焦作</a><a href="http://jincheng.58.com/" onclick="co('jincheng')">晋城</a><a href="http://jingzhou.58.com/" onclick="co('jingzhou')">荆州</a><a href="http://jms.58.com/" onclick="co('jms')">佳木斯</a><a href="http://jixi.58.com/" onclick="co('jixi')">鸡西</a><a href="http://ja.58.com/" onclick="co('ja')">吉安</a><a href="http://jinchang.58.com/" onclick="co('jinchang')">金昌</a><a href="http://jz.58.com/" onclick="co('jz')">晋中</a><a href="http://jinzhou.58.com/" onclick="co('jinzhong')">锦州</a><a href="http://jdz.58.com/" onclick="co('jdz')">景德镇</a><a href="http://jingmen.58.com/" onclick="co('jingmen')">荆门</a><a href="http://jyg.58.com/" onclick="co('jyg')">嘉峪关</a><br /><a href="http://jq.58.com/" onclick="co('jq')">酒泉</a><a href="http://jiyuan.58.com/" onclick="co('jiyuan')">济源</a></dd>
        <dt>K.</dt><dd><a href="http://km.58.com/" onclick="co('km')">昆明</a><a href="http://klmy.58.com/" onclick="co('klmy')">克拉玛依</a><a href="http://kel.58.com/" onclick="co('kel')">库尔勒</a><a href="http://kaifeng.58.com/" onclick="co('kaifeng')">开封</a><a href="http://ks.58.com/" onclick="co('ks')">喀什</a><a href="http://kzls.58.com/" onclick="co('kzls')">克孜勒苏</a><a href="http://kl.58.com/" onclick="co('kl')">垦利</a></dd>
        <dt>L.</dt><dd><a href="http://lz.58.com/" onclick="co('lz')">兰州</a><a href="http://luoyang.58.com/" onclick="co('luoyang')">洛阳</a><a href="http://lf.58.com/" onclick="co('lf')">廊坊</a><a href="http://linyi.58.com/" onclick="co('linyi')">临沂</a><a href="http://lc.58.com/" onclick="co('lc')">聊城</a><a href="http://lyg.58.com/" onclick="co('lyg')">连云港</a><a href="http://lvliang.58.com/" onclick="co('lvliang')">吕梁</a><a href="http://ls.58.com/" onclick="co('ls')">乐山</a><a href="http://liaoyang.58.com/" onclick="co('liaoyang')">辽阳</a><a href="http://liaoyuan.58.com/" onclick="co('liaoyuan')">辽源</a><a href="http://lasa.58.com/" onclick="co('lasa')">拉萨</a><a href="http://linfen.58.com/" onclick="co('linfen')">临汾</a><a href="http://ly.58.com/" onclick="co('ly')">龙岩</a><a href="http://linxia.58.com/" onclick="co('linxia')">临夏</a><a href="http://liuzhou.58.com/" onclick="co('liuzhou')">柳州</a><a href="http://luohe.58.com/" onclick="co('luohe')">漯河</a><a href="http://luzhou.58.com/" onclick="co('luzhou')">泸州</a><a href="http://lishui.58.com/" onclick="co('lishui')">丽水</a><a href="http://lj.58.com/" onclick="co('lj')">丽江</a><a href="http://la.58.com/" onclick="co('la')">六安</a><a href="http://lw.58.com/" onclick="co('lw')">莱芜</a><br /><a href="http://linyixian.58.com/" onclick="co('linyixian')">临猗</a><a href="http://lincang.58.com/" onclick="co('lincang')">临沧</a><a href="http://linzhi.58.com/" onclick="co('linzhi')">林芝</a><a href="http://liangshan.58.com/" onclick="co('liangshan')">凉山</a><a href="http://ld.58.com/" onclick="co('ld')">娄底</a><a href="http://ln.58.com/" onclick="co('ln')">陇南</a><a href="http://lb.58.com/" onclick="co('lb')">来宾</a><a href="http://lps.58.com/" onclick="co('lps')">六盘水</a></dd>
        <dt>M.</dt><dd><a href="http://mianyang.58.com/" onclick="co('mianyang')">绵阳</a><a href="http://mm.58.com/" onclick="co('mm')">茂名</a><a href="http://mas.58.com/" onclick="co('mas')">马鞍山</a><a href="http://mdj.58.com/" onclick="co('mdj')">牡丹江</a><a href="http://mg.58.com/" onclick="co('mg')">明港</a><a href="http://mz.58.com/" onclick="co('mz')">梅州</a><a href="http://ms.58.com/" onclick="co('ms')">眉山</a></dd>
        <dt>N.</dt><dd><a href="http://nj.58.com/" onclick="co('nj')">南京</a><a href="http://nc.58.com/" onclick="co('nc')">南昌</a><a href="http://nb.58.com/" onclick="co('nb')">宁波</a><a href="http://nn.58.com/" onclick="co('nn')">南宁</a><a href="http://ny.58.com/" onclick="co('ny')">南阳</a><a href="http://nt.58.com/" onclick="co('nt')">南通</a><a href="http://scnj.58.com/" onclick="co('scnj')">内江</a><a href="http://nd.58.com/" onclick="co('nd')">宁德</a><a href="http://nanchong.58.com/" onclick="co('nanchong')">南充</a><a href="http://nujiang.58.com/" onclick="co('nujiang')">怒江</a><a href="http://nq.58.com/" onclick="co('nq')">那曲</a><a href="http://np.58.com/" onclick="co('np')">南平</a></dd>
        <dt>P.</dt><dd><a href="http://pds.58.com/" onclick="co('pds')">平顶山</a><a href="http://pj.58.com/" onclick="co('pj')">盘锦</a><a href="http://px.58.com/" onclick="co('px')">萍乡</a><a href="http://pl.58.com/" onclick="co('pl')">平凉</a><a href="http://puyang.58.com/" onclick="co('puyang')">濮阳</a><a href="http://panzhihua.58.com/" onclick="co('panzhihua')">攀枝花</a><a href="http://pt.58.com/" onclick="co('pt')">莆田</a><a href="http://pe.58.com/" onclick="co('pe')">普洱</a></dd>
        <dt>Q.</dt><dd><a href="http://qd.58.com/" onclick="co('qd')">青岛</a><a href="http://qz.58.com/" onclick="co('qz')">泉州</a><a href="http://qhd.58.com/" onclick="co('qhd')">秦皇岛</a><a href="http://cn.58.com/" onclick="co('cn')">其他</a><a href="http://qqhr.58.com/" onclick="co('qqhr')">齐齐哈尔</a><a href="http://quzhou.58.com/" onclick="co('quzhou')">衢州</a><a href="http://qingyuan.58.com/" onclick="co('qingyuan')">清远</a><a href="http://qinzhou.58.com/" onclick="co('qinzhou')">钦州</a><a href="http://qj.58.com/" onclick="co('qj')">曲靖</a><a href="http://qdn.58.com/" onclick="co('qdn')">黔东南</a><a href="http://qingyang.58.com/" onclick="co('qingyang')">庆阳</a><a href="http://qn.58.com/" onclick="co('qn')">黔南</a><a href="http://qxn.58.com/" onclick="co('qxn')">黔西南</a><a href="http://qth.58.com/" onclick="co('qth')">七台河</a><a href="http://qianjiang.58.com/" onclick="co('qianjiang')">潜江</a><a href="http://qingxu.58.com/" onclick="co('qingxu')">清徐</a></dd>
        <dt>R.</dt><dd><a href="http://rizhao.58.com/" onclick="co('rizhao')">日照</a><a href="http://rkz.58.com/" onclick="co('rkz')">日喀则</a></dd>
        <dt>S.</dt><dd><a href="http://sh.58.com/" class="lr" onclick="co('sh')">上海</a><a href="http://sz.58.com/"
                class="lr" onclick="co('sz')">深圳</a><a href="http://su.58.com/" onclick="co('su')"
                    class="lr">苏州</a><a href="http://sy.58.com/" onclick="co('sy')">沈阳</a><a href="http://sjz.58.com/" onclick="co('sjz')">石家庄</a><a href="http://st.58.com/" onclick="co('st')">汕头</a><a href="http://suzhou.58.com/" onclick="co('suzhou')">宿州</a><a href="http://sx.58.com/" onclick="co('sx')">绍兴</a><a href="http://shiyan.58.com/" onclick="co('shiyan')">十堰</a><a href="http://sm.58.com/" onclick="co('sm')">三明</a><a href="http://sg.58.com/" onclick="co('sg')">韶关</a><a href="http://sq.58.com/" onclick="co('sq')">商丘</a><a href="http://shuyang.58.com/" onclick="co('shuyang')">沭阳</a><a href="http://suqian.58.com/" onclick="co('suqian')">宿迁</a><a href="http://suihua.58.com/" onclick="co('suihua')">绥化</a><a href="http://shaoyang.58.com/" onclick="co('shaoyang')">邵阳</a><a href="http://sanya.58.com/" onclick="co('sanya')">三亚</a><a href="http://sd.58.com/" onclick="co('sd')">顺德</a><a href="http://songyuan.58.com/" onclick="co('songyuan')">松原</a><a href="http://smx.58.com/" onclick="co('smx')">三门峡</a><a href="http://sw.58.com/" onclick="co('sw')">汕尾</a><br /><a href="http://suizhou.58.com/" onclick="co('suizhou')">随州</a><a href="http://shz.58.com/" onclick="co('shz')">石河子</a><a href="http://sn.58.com/" onclick="co('sn')">山南</a><a href="http://suining.58.com/" onclick="co('suining')">遂宁</a><a href="http://sl.58.com/" onclick="co('sl')">商洛</a><a href="http://shuozhou.58.com/" onclick="co('shuozhou')">朔州</a><a href="http://szs.58.com/" onclick="co('szs')">石嘴山</a><a href="http://sr.58.com/" onclick="co('sr')">上饶</a><a href="http://sp.58.com/" onclick="co('sp')">四平</a><a href="http://sys.58.com/" onclick="co('sys')">双鸭山</a><a href="http://snj.58.com/" onclick="co('snj')">神农架</a></dd>
        <dt>T.</dt><dd><a href="http://tj.58.com/" class="lr" onclick="co('tj')">天津</a><a href="http://ty.58.com/" onclick="co('ty')">太原</a><a href="http://ts.58.com/" onclick="co('ts')">唐山</a><a href="http://ta.58.com/" onclick="co('ta')">泰安</a><a href="http://tz.58.com/" onclick="co('tz')">台州</a><a href="http://taizhou.58.com/" onclick="co('taizhou')">泰州</a><a href="http://tw.58.com/" onclick="co('tw')">台湾</a><a href="http://tl.58.com/" onclick="co('tl')">铁岭</a><a href="http://tianshui.58.com/" onclick="co('tianshui')">天水</a><a href="http://tlf.58.com/" onclick="co('tlf')">吐鲁番</a><a href="http://tmsk.58.com/" onclick="co('tmsk')">图木舒克</a><a href="http://tc.58.com/" onclick="co('tc')">铜川</a><a href="http://tongliao.58.com/" onclick="co('tongliao')">通辽</a><a href="http://th.58.com/" onclick="co('th')">通化</a><a href="http://tongling.58.com/" onclick="co('tongling')">铜陵</a><a href="http://tr.58.com/" onclick="co('tr')">铜仁</a><a href="http://tm.58.com/" onclick="co('tm')">天门</a><a href="http://taishan.58.com/" onclick="co('taishan')">台山</a><a href="http://tongcheng.58.com/" onclick="co('tongcheng')">桐城</a></dd>
        <dt>W.</dt><dd><a href="http://wh.58.com/" class="lr" onclick="co('wh')">武汉</a><a href="http://wx.58.com/" onclick="co('wx')">无锡</a><a href="http://wf.58.com/" onclick="co('wf')">潍坊</a><a href="http://xj.58.com/" onclick="co('xj')">乌鲁木齐</a><a href="http://wz.58.com/" onclick="co('wz')">温州</a><a href="http://weihai.58.com/" onclick="co('weihai')">威海</a><a href="http://wuhu.58.com/" onclick="co('wuhu')">芜湖</a><a href="http://wuzhou.58.com/" onclick="co('wuzhou')">梧州</a><a href="http://wfd.58.com/" onclick="co('wfd')">瓦房店</a><a href="http://wn.58.com/" onclick="co('wn')">渭南</a><a href="http://ws.58.com/" onclick="co('ws')">文山</a><a href="http://wuhai.58.com/" onclick="co('wuhai')">乌海</a><a href="http://wjq.58.com/" onclick="co('wjq')">五家渠</a><a href="http://wuzhong.58.com/" onclick="co('wuzhong')">吴忠</a><a href="http://wlcb.58.com/" onclick="co('wlcb')">乌兰察布</a><a href="http://wuwei.58.com/" onclick="co('wuwei')">武威</a><a href="http://wzs.58.com/" onclick="co('wzs')">五指山</a><a href="http://wuyishan.58.com/" onclick="co('wuyishan')">武夷山</a></dd>
        <dt>X.</dt><dd><a href="http://xa.58.com/" onclick="co('xa')">西安</a><a href="http://xm.58.com/" onclick="co('xm')">厦门</a><a href="http://xz.58.com/" onclick="co('xz')">徐州</a><a href="http://xiangtan.58.com/" onclick="co('xiangtan')">湘潭</a><a href="http://xf.58.com/" onclick="co('xf')">襄阳</a><a href="http://xx.58.com/" onclick="co('xx')">新乡</a><a href="http://xt.58.com/" onclick="co('xt')">邢台</a><a href="http://xiaogan.58.com/" onclick="co('xiaogan')">孝感</a><a href="http://xn.58.com/" onclick="co('xn')">西宁</a><a href="http://xc.58.com/" onclick="co('xc')">许昌</a><a href="http://hk.58.com/" onclick="co('hk')">香港</a><a href="http://xinzhou.58.com/" onclick="co('xinzhou')">忻州</a><a href="http://xuancheng.58.com/" onclick="co('xuancheng')">宣城</a><a href="http://bn.58.com/" onclick="co('bn')">西双版纳</a><a href="http://xl.58.com/" onclick="co('xl')">锡林郭勒盟</a><a href="http://xianyang.58.com/" onclick="co('xianyang')">咸阳</a><a href="http://xy.58.com/" onclick="co('xy')">信阳</a><a href="http://xam.58.com/" onclick="co('xam')">兴安盟</a><a href="http://xinyu.58.com/" onclick="co('xinyu')">新余</a><br /><a href="http://xiangxi.58.com/" onclick="co('xiangxi')">湘西</a><a href="http://xiantao.58.com/" onclick="co('xiantao')">仙桃</a><a href="http://xianning.58.com/" onclick="co('xianning')">咸宁</a></dd>
        <dt>Y.</dt><dd><a href="http://yt.58.com/" onclick="co('yt')">烟台</a><a href="http://yanan.58.com/" onclick="co('yanan')">延安</a><a href="http://yz.58.com/" onclick="co('yz')">扬州</a><a href="http://yc.58.com/" onclick="co('yc')">宜昌</a><a href="http://yancheng.58.com/" onclick="co('yancheng')">盐城</a><a href="http://yy.58.com/" onclick="co('yy')">岳阳</a><a href="http://yinchuan.58.com/" onclick="co('yinchuan')">银川</a><a href="http://yanbian.58.com/" onclick="co('yanbian')">延边</a><a href="http://yingtan.58.com/" onclick="co('yingtan')">鹰潭</a><a href="http://yx.58.com/" onclick="co('yx')">玉溪</a><a href="http://yuncheng.58.com/" onclick="co('yuncheng')">运城</a><a href="http://yichun.58.com/" onclick="co('yichun')">宜春</a><a href="http://yk.58.com/" onclick="co('yk')">营口</a><a href="http://yl.58.com/" onclick="co('yl')">榆林</a><a href="http://yb.58.com/" onclick="co('yb')">宜宾</a><a href="http://yongzhou.58.com/" onclick="co('yongzhou')">永州</a><a href="http://yj.58.com/" onclick="co('yj')">阳江</a><a href="http://yangchun.58.com/" onclick="co('yangchun')">阳春</a><a href="http://yq.58.com/" onclick="co('yq')">阳泉</a><a href="http://yuzhou.58.com/" onclick="co('yuzhou')">禹州</a><a href="http://yanling.58.com/" onclick="co('yanling')">鄢陵</a><br /><a href="http://yulin.58.com/" onclick="co('yulin')">玉林</a><a href="http://yili.58.com/" onclick="co('yili')">伊犁</a><a href="http://ya.58.com/" onclick="co('ya')">雅安</a><a href="http://ys.58.com/" onclick="co('ys')">玉树</a><a href="http://yiyang.58.com/" onclick="co('yiyang')">益阳</a><a href="http://yf.58.com/" onclick="co('yf')">云浮</a><a href="http://yich.58.com/" onclick="co('yich')">伊春</a><a href="http://yxx.58.com/" onclick="co('yxx')">永新</a><a href="http://yiwu.58.com/" onclick="co('yiwu')">义乌</a></dd>
        <dt>Z.</dt><dd><a href="http://zz.58.com/" onclick="co('zz')">郑州</a><a href="http://zh.58.com/" onclick="co('zh')">珠海</a><a href="http://zjk.58.com/" onclick="co('zjk')">张家口</a><a href="http://zs.58.com/" onclick="co('zs')">中山</a><a href="http://zb.58.com/" onclick="co('zb')">淄博</a><a href="http://zhuzhou.58.com/" onclick="co('zhuzhou')">株洲</a><a href="http://zhangzhou.58.com/" onclick="co('zhangzhou')">漳州</a><a href="http://zhanjiang.58.com/" onclick="co('zhanjiang')">湛江</a><a href="http://zq.58.com/" onclick="co('zq')">肇庆</a><a href="http://zaozhuang.58.com/" onclick="co('zaozhuang')">枣庄</a><a href="http://zj.58.com/" onclick="co('zj')">镇江</a><a href="http://zk.58.com/" onclick="co('zk')">周口</a><a href="http://zd.58.com/" onclick="co('zd')">正定</a><a href="http://zmd.58.com/" onclick="co('zmd')">驻马店</a><a href="http://zg.58.com/" onclick="co('zg')">自贡</a><a href="http://zjj.58.com/" onclick="co('zjj')">张家界</a><a href="http://zy.58.com/" onclick="co('zy')">资阳</a><a href="http://zunyi.58.com/" onclick="co('zunyi')">遵义</a><a href="http://zhoushan.58.com/" onclick="co('zhoushan')">舟山</a><a href="http://zhangqiu.58.com/" onclick="co('zhangqiu')">章丘</a><br /><a href="http://zx.58.com/" onclick="co('zx')">赵县</a><a href="http://zc.58.com/" onclick="co('zc')">诸城</a><a href="http://zt.58.com/" onclick="co('zt')">昭通</a><a href="http://zw.58.com/" onclick="co('zw')">中卫</a><a href="http://zhangye.58.com/" onclick="co('zhangye')">张掖</a><a href="http://zhangbei.58.com/" onclick="co('zhangbei')">张北</a><a href="http://pld.58.com/" onclick="co('pld')">庄河</a></dd>--%>
    </dl>
</div>

<div class="c"></div>
<div class="footer">
    <%--北京市公安局朝阳分局备案编号:1101050809 &nbsp; &nbsp; --%>
    &copy; flxxwang.com <br />
    <a href="http://www.miibeian.gov.cn/">京ICP备000000号-2</a>
    <a href='http://www.flxxwang.com/about/'>与淘金对话</a>
</div>



<%--<script  type="text/javascript">
    function $(objname) { return document.getElementById(objname); }
    var oarray = $("flashimg").getElementsByTagName('img');
    var imgnum = oarray.length - 1;
    function fout() {
        var o = oarray[imgnum];
        if (o != null) {
            if (o.style.opacity == null || o.style.opacity == "") { o.style.opacity = 1; }
            var opacitynum = o.style.opacity;
            //alert(opacitynum);
            if (opacitynum < 0.11) {
                o.style.display = 'none';
                o.parentNode.insertBefore(o, oarray[0]);
                o.style.display = '';
                o.style.filter = '';
                o.style.opacity = 1;
                setTimeout("fout()", 3000);
                return;
            } else {
                o.style.filter = 'alpha(opacity:' + (opacitynum * 100 - 10) + ')';
                o.style.opacity = opacitynum - 0.1;
                setTimeout("fout()", 50);
            } 
        } 
    }
    fout(); setup();
</script>--%>

<%--<div style="display:none">
<script type="text/javascript">
    var _gaq = _gaq || []; var site_name = "58";
    _gaq.push(['pageTracker._setAccount', 'UA-877409-4']);
    _gaq.push(['pageTracker._setDomainName', '.58.com']);
    _gaq.push(['pageTracker._setAllowLinker', true]);
    _gaq.push(['pageTracker._addOrganic', 'sogou', 'query']);
    _gaq.push(['pageTracker._addOrganic', 'baidu', 'word']);
    _gaq.push(['pageTracker._addOrganic', 'soso', 'w']);
    _gaq.push(['pageTracker._addOrganic', 'youdao', 'q']);
    _gaq.push(['pageTracker._trackPageview']);
    (function () {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();</script><script type="text/javascript" src="http://track.58.com/referrer2.js"></script>
</div>--%>
</form>

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
        location.href = $info.rootUrl + code;
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
                location.href = $info.rootUrl + code;
                return;
            }
        }
        alert("对不起,没有找到该城市!");
    }
    function go(code) {
        location.href = $info.rootUrl + code;
    }
</script>
</body>
</html>
