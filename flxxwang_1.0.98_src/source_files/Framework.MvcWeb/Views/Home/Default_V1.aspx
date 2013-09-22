<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Fenlei/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<string>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
<base target="_blank" />
<title>【杭州分类信息】杭州免费发布信息 - 杭州<%=SiteInfo.Name%></title>
<meta name="Keywords"  content="杭州分类信息,杭州免费发布信息" />
<meta name="Description" content="杭州<%=SiteInfo.Name%>，为你提供房产、车辆、招工、兼职、黄页等海量杭州分类信息，满足您不同的杭州免费发布信息需求。杭州<%=SiteInfo.Name%>，最好的杭州<%=SiteInfo.Name%>。" />
<%--<link href="http://pic2.58.com/ui6/topbar.css?20110711" type="text/css" rel="stylesheet" />--%>
<style type="text/css">
    body,dl,ol,ul,li,dt,dd,p,h2,h3,h4{margin:0;padding:0;list-style:none;-webkit-text-size-adjust:none}
    body{font:12px/1.2 Arial, Tahoma, "SimSun", sans-serif;color:#333; min-width:1000px}
    a{color:#0000cc;text-decoration:none;cursor:pointer}
    a:hover,#fabu:hover{color:#ff0000;text-decoration:underline}
    .clear{clear:both;font-size:0;height:0;overflow:hidden}
    img{border:none}
    .fr{float:right}
    .red,.link_red,#hot a.red,#contact a.red{color:#ff0000}
    .mt{margin-top:10px}
    .sc{display:block}
    .hc{display:none}
    .fr{float:right}
    #headerinside,.cb,.morelink,#footer{background:#fff; width:1000px;margin:0 auto;clear:both; overflow:hidden}
    #headerinside{height:78px; position:relative; z-index:666}
    #logo{position:absolute;left:15px;top:10px}
    #searchbar{position:absolute;left:350px;top:11px; line-height:26px; overflow:hidden}
    #searchbar i{font-style:normal}
    #key,#keyword,#searchbtn,#fabu{background-image:url(http://pic2.58.com/ui6/index/topbar.png) !important}
    #key{background:url() repeat-x 0 -320px; height:30px; padding:2px 0; display:inline-block; float:left}
    #keyword{background:url() no-repeat 0 -285px; width:339px;height:22px; line-height:22px; padding:4px 0; border:none; padding-left:38px; float:left; display:inline-block; overflow:hidden}
    .keyword{color:#ccc}
    .keyword2{color:#000}
    #searchbtn{background:url() no-repeat 0 -358px;width:123px;height:35px; font-size:16px; font-weight:bold; cursor:pointer; overflow:hidden; text-align:center; color:#fff; line-height:33px; line-height:32px\0; padding-bottom:4px;border:none; float:left}
    #searchbtn.btnal2{text-decoration:underline}
    #fabu{position:absolute;right:10px;top:11px; background:url() no-repeat 0 -395px; width:118px; height:35px; line-height:35px; display:inline-block; font-size:14px; font-weight:bold; color:#000; text-align:center; float:left;cursor:pointer;}
    #hot{float:left}
    #hot a{margin-left:10px; color:#888; display:none}
    .tooltip{width:360px; padding:8px;border:1px solid #dcdadc;background:#fff;margin-top:-4px;line-height:200%}
    .tooltip ul{width:100%; overflow:hidden}
    .tooltip li{height:26px;overflow:hidden;padding-left:5px}
    .tooltip li a{text-decoration:none;color:#666;font-size:13px}
    .tooltip li a b{color:#002cad}
    .tooltip li .tool_r{float:right;color:#008000;font-size:11px}
    .tooltip li.selected a b,.tooltip li.selected a,.tooltip li.selected .tool_r{color:#FFF8D8}
    .tooltip li.selected{background:#f97d03;cursor:pointer;color:#FFF8D8; padding-right:8px;}
    .closewindow{float:right;margin:-5px 5px 0 0;}
    .cb .c_bh{height:923px; *height:883px; height:902px\0;}
    .cb .c_bhs{height:607px; *height:579px; height:591px\0}
    @media screen and (-webkit-min-device-pixel-ratio:0)
    {
        .cb .c_bh {height:934px}
        .cb .c_bhs{height:616px}
    } 
    .plb{border-left:1px solid #f1f1f1;}
    .c_b{width:189px;overflow:hidden; float:left;line-height:28px; color:#bebebe;overflow:hidden;font-size:10px; margin-top:-5px; padding-left:10px;border-right:1px solid #f1f1f1;}
    .pr0{border-right:none}
    .c_b2{width:399px; float:left; margin-top:0px; padding-left:0px; overflow:hidden}
    h2 span.fr a{font-weight:lighter; font-size:12px; padding-right:10px}
    .cb h2{background:url(http://pic2.58.com/ui6/index/bgpic.gif) no-repeat 10px 10px; font-family:Verdana,"SimSun";font-size:14px; padding:3px 0 0 32px; margin-top:5px; margin-left:-10px; color:#666;border-top:1px solid #f1f1f1; overflow:hidden}
    .c_b a,.c_b i{font-size:14px; font-style:normal}
    .cb h2 a{color:#000}
    .c_b2 h2{margin-top:0}
    .c_b2 h2.btl{padding:10px 0 7px 32px; margin-left:0}
    .c_b2 .c_b{border-right:none;padding-bottom:5px;margin-top:0px;}
    .c_b2 .c_b.bor{border-right:1px solid #f1f1f1}
    .c_b h2 a{padding:0px}
    #tuanlink{float:right; color:#ff0000; padding-right:8px}
    .c_b em{font-style:normal; display:inline-block; width:94px; white-space:nowrap}
    .cb .hpic2{background-position:10px -24px;background-position:10px -25px\0}
    .cb .hpic3{background-position:10px -60px}
    .cb .hpic4{background-position:10px -97px}
    .cb .hpic5{background-position:10px -134px}
    .cb .hpic6{background-position:10px -170px}
    .cb .hpic7{background-position:10px -206px;background-position:10px -207px\0}
    .cb .hpic8{background-position:10px -243px; padding-left:32px}
    .cb .hpic9{background-position:10px -279px}
    .cb .hpic10{background-position:10px -315px}
    .cb .hpic11{background-position:10px -351px}
    .cb .hpic12{background-position:10px -388px}
    .cb .hpic13{background-position:10px -424px}
    .cb .hpic14{background-position:10px -460px}
    .cb .btno{border-top:none}
    .cb_ul h3,#toptuanad1 h3,#toptuanad1 h1,#listinfo h3{font-size:14px; height:26px; line-height:26px; color:#0000cc;margin:0; padding:0; margin-top:4px; font-size:14px; overflow:hidden}
    .cb_ul{width:188px; height:143px; padding-left:10px; float:left; line-height:22px; color:#999; border:1px solid #f2f2f2; overflow:hidden}
    .morelinkinside{padding:2px 10px;border-bottom:solid 1px #f1f1f1;border-top:solid 1px #f1f1f1; height:30px; line-height:30px; margin-top:10px;overflow:hidden;}
    .morelinkinside strong{float:left;}
    .morelinkinside li{float:left; margin-right:15px; list-style-type:none}
    #footer .bg{text-align:center; color:#bebebe; line-height:26px;}
    #footer #flink{padding:5px 10px; line-height:20px; text-align:left; border-top:1px solid #f1f1f1; line-height:22px; color:#bebebe; font-weight:900; text-align:center}
    #footer a{color:#666; font-weight:400}
    #flink a{margin:0 0 0 5px; white-space:nowrap\9; color:#bebebe; display:inline-block\9}
    #flink a:hover{text-decoration:none}
    #contact{padding:5px 0}
    #contact a{margin:0 18px; color:#000}
    #contact a.fduihua,.mapfuc a.fduihua{background:url(http://pic2.58.com/ui6/index/bgpic.gif) no-repeat right -505px; padding-right:22px; margin-right:0}
    #listinfo{width:225px; padding-left:10px; height:143px; border:1px solid #f2f2f2; float:right; font-size:14px; overflow:hidden}
    .cb_ul a,#listinfo a{font-size:14px; line-height:27px; *line-height:26px; overflow:hidden ;}
    .cb_ul ul li a{font-size:12px;line-height:22px}
    .cb_ul em,#listinfo em{font-style:normal; display:inline-block; width:50%;}
    #infomsg{background:none; color:#000; width:auto;  text-align:right; padding:5px; line-height:16px; border:none; margin:5px; position:absolute; right:0px; bottom:0px; font-weight:bold;z-index:1000}
    #infomsg .close{margin:0px; padding:0}
    #znq{position:absolute;left:225px;top:10px; width:100px; height:50px; overflow:hidden}
    .mr10{margin-right:10px}/*团购*/
    .toptuanad{width:542px; height:143px; float:left; border:1px solid #f2f2f2; padding-left:10px; border-left:none; color:#4d4d4d; overflow:hidden}
    .toptuanad .tuanpic li{width:271px; float:left; line-height:28px; overflow:hidden}
    .toptuanad .tuanpic li h3{line-height:22px; height:22px;width:97%}
    .toptuanad .tuanpic img{float:left; width:160px; height:80px; padding:8px 8px 0 0}
    .toptuanad .tuanpic b.jiage{color:#f00; font-size:20px; margin:0 4px}
    .toptuanad .tuanpic b.yuan{text-decoration:line-through;_text-decoration:none; _background:url(http://img03.taobaocdn.com/tps/i1/T1tFVLXfxhXXXXXXXX-50-10.png) repeat-x 0 .2em;}
    .toptuanad .tuanpic input{background:url(http://pic2.58.com/ui6/index/tuan.gif) no-repeat; width:85px; height:27px; display:inline-block; font-size:14px; font-weight:bold; text-decoration:none; line-height:26px; _line-height:27px; padding-left:10px; padding-bottom:2px; margin-top:3px; text-indent:0; border:none; text-align:left; cursor:pointer;}
    .player{width:100%; height:7px; text-align:center; padding-top:9px; overflow:hidden}
    .player span{background:url(http://pic2.58.com/ui6/index/tuan.gif) no-repeat -86px -0px; width:7px; height:7px; display:inline-block; margin-right:5px; cursor:pointer}
    .player span.select{background-position:-86px -8px}.nbsp a{margin-right:3px}
    .nbsp i{margin-left:-3px}
    #listinfo a,.cb_ul a,.toptuanad a{margin-right:0}
    #myfeetBox{width:200px; overflow:hidden}
    #myfeet li{overflow:hidden}
    .msgTips{width:210px}
</style>
<script type="text/javascript">
    if (screen.width >= 1280) { document.write("<style type='text/css'>#headerinside,.cb,.morelink,#footer,#topbar .w{width:1200px;}#searchbar{left:355px;}#keyword{width:518px;}.tooltip{width:539px;}.c_b{width:229px;}.c_b2{width:479px;}.c_b em{width:110px}.cb_ul{width:228px;}#toptuanad1,.toptuanad{width:638px;}.toptuanad .tuanpic li{width:319px}.price{width:200px; padding-left:30px}.tuanpic .ygm{width:130px}#listinfo{width:289px;}#listinfo h3 a{width:74px;}.tuanpic .ygm input{width:110px;}.price b{margin:0 5px}</style>"); }
</script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="cb nbsp"><!-- class begin2011-->
    <div class="c_b c_bh">
        <h2 class="hpic1"><a href="<%=this.Model %>/fangchan/" >杭州房产&raquo;</a></h2>
            <a href="<%=this.Model %>/fangchan/zufang/" class="red">房屋出租</a>430309<br />
            <a href="<%=this.Model %>/fangchan/hezu/">房屋合租</a>39613<br />
            <a href="<%=this.Model %>/fangchan/qiuzu/">房屋求租</a>10128<br />
            <a href="<%=this.Model %>/fangchan/ershoufang/">二手房买卖</a>123347<br />
            <a href="<%=this.Model %>/fangchan/duanzu/">短租房/日租房</a>4571<br />
            <a href="<%=this.Model %>/fangchan/zhaozu/">写字楼租售</a>17779<br />
            <a href="<%=this.Model %>/fangchan/shangpu/">生意/商铺转让</a>38514<br />
            <a href="<%=this.Model %>/fangchan/fangchan/">厂房/仓库/土地</a>4908<br />
        <h2 class="hpic2"><a href="<%=this.Model %>/che/" >车辆买卖与服务&raquo;</a></h2>
            <a href="<%=this.Model %>/che/ershouche/" class="red">二手汽车转让</a>13271<br />
            <a href="http://hz.kuche.com/baojia/">新车报价</a><br />
            <a href="<%=this.Model %>/che/danche/">二手摩托车</a>6426<br />
            <a href="<%=this.Model %>/che/zixingche/">二手自行车/电动车</a>8895<br />
            <a href="<%=this.Model %>/che/zuche/">租车</a>7205<br />
            <a href="<%=this.Model %>/che/pinche/">拼车/顺风车</a>1854<br />
            <a href="<%=this.Model %>/che/peijia/">代驾/陪练/驾校</a>2643<br />
            <a href="<%=this.Model %>/che/cheliangfuwu/">汽车服务/4S店</a>639<br />
            <a href="<%=this.Model %>/che/peijian/">汽车配件/其他</a>1268<br />
        <h2 class="hpic3"><a href="<%=this.Model %>/jiaoyu/">教育培训&raquo;</a></h2>
            <em><a href="<%=this.Model %>/jiaoyu/fudao/">家教</a>2659</em><a href="<%=this.Model %>/jiaoyu/liuxue/">留学</a>436<br />
            <em><a href="<%=this.Model %>/jiaoyu/waiyu/">外语</a>1330</em><a  href="<%=this.Model %>/jiaoyu/jisuanji/">IT培训</a>1662<br />
            <em><a href="<%=this.Model %>/jiaoyu/zhiyepeix/">职业</a>4468</em><a href="<%=this.Model %>/jiaoyu/xueli/">学历</a>2625<br />
            <em><a href="<%=this.Model %>/jiaoyu/mba/">管理</a>382</em><a href="<%=this.Model %>/jiaoyu/shejipeixun/">设计</a>904<br />
            <a href="<%=this.Model %>/jiaoyu/youjiao/">婴幼儿教育</a>374<br />
            <em><a href="<%=this.Model %>/jiaoyu/techang/">文体</a>1691</em><a href="<%=this.Model %>/jiaoyu/peixunqita/">其他</a>1797<br />
        <h2 class="hpic4"><a href="<%=this.Model %>/jiaoyou/" >交友征婚&raquo;</a></h2>
    	    <em><a href="http://jiaoyou.58.com/hz/mm/" class="red">找女友</a></em><a href="http://jiaoyou.58.com/hz/gg/" class="red">找男友</a><br />
            <em><a href="<%=this.Model %>/jiaoyou/nvyou/">交友</a><i>/</i><a href="<%=this.Model %>/jiaoyou/zhenghun/">征婚</a>12501</em><a href="<%=this.Model %>/jiaoyou/jinengjiaohuan/">技能交换</a>1168<br />
            <a href="<%=this.Model %>/jiaoyou/huodong/">驴友/活动/聚会</a>995<br />
    </div>
    <div class="c_b c_bh">
        <h2 class="hpic6"><a href="<%=this.Model %>/tiaozao/">跳蚤市场&raquo;</a></h2>
            <a href="<%=this.Model %>/tiaozao/diannao/">二手电脑</a><i>/</i><a href="<%=this.Model %>/tiaozao/bijiben/">笔记本</a>13061<br />
            <a href="<%=this.Model %>/tiaozao/shouji/">二手手机</a>13025<br />
            <a href="<%=this.Model %>/tiaozao/shoujihao/">手机号码</a>7434<br />
            <a href="<%=this.Model %>/tiaozao/shuma/">数码产品</a><i>/</i><a href="<%=this.Model %>/tiaozao/shumaxiangji/">相机</a>4021<br />
            <a href="<%=this.Model %>/tiaozao/jiadian/">二手家电</a>8061<br />
            <a href="<%=this.Model %>/tiaozao/ershoujiaju/">二手家具/家居</a>4772<br />
            <a href="<%=this.Model %>/tiaozao/fushi/">服装箱包</a><i>/</i><a href="<%=this.Model %>/tiaozao/meirong/">化妆品</a>9505<br />
            <a href="<%=this.Model %>/tiaozao/yingyou/">母婴/儿童用品</a><i>/</i><a href="<%=this.Model %>/tiaozao/ertongyongpin/">玩具</a>1687<br />
            <a href="<%=this.Model %>/tiaozao/yishu/">艺术品/收藏品</a>1703<br />
            <a href="<%=this.Model %>/tiaozao/tushu/">图书/音像/软件</a>709<br />
            <a href="<%=this.Model %>/tiaozao/wenti/">文体</a><i>/</i><a href="<%=this.Model %>/tiaozao/yundongfushi/">户外</a><i>/</i><a href="<%=this.Model %>/tiaozao/yueqi/">乐器</a>1141<br />
            <a href="<%=this.Model %>/tiaozao/bangong/">办公用品/设备</a>2112<br />
            <a href="<%=this.Model %>/tiaozao/ershoushebei/">二手设备</a>3943<br />
            <a href="<%=this.Model %>/tiaozao/huanwu/">物品交换</a><i>/</i><a href="<%=this.Model %>/tiaozao/ershoufree/">赠送</a>1191<br />
    	    <a href="<%=this.Model %>/tiaozao/tongxunyw/">通讯</a><i>/</i><a href="<%=this.Model %>/tiaozao/shangcheng.htm">商城</a><i>/</i><a href="<%=this.Model %>/tiaozao/qita/">其他</a></a><br />
        <h2 class="hpic5"><a href="<%=this.Model %>/chongwu/">宠物/宠物用品&raquo;</a></h2>
            <a href="<%=this.Model %>/chongwu/dog/">宠物狗</a>59402<br />
            <a href="<%=this.Model %>/chongwu/cat/">猫</a><i>/</i><a href="/pet/">花鸟鱼虫</a>270<br />
		    <a href="<%=this.Model %>/chongwu/shipin/">宠物用品/食品</a>281<br />
            <a href="<%=this.Model %>/chongwu/chongwu/">宠物店/服务</a>233<br />
            <a href="<%=this.Model %>/chongwu/cwzengsong/">宠物赠送/领养</a>1569<br />
        <h2 class="hpic7"><a href="<%=this.Model %>/piaowu/">票务/卡券&raquo;</a></h2>
            <a href="<%=this.Model %>/piaowu/huochepiao/">火车票转让</a>1779<br />
            <a href="<%=this.Model %>/piaowu/jipiao/">特价机票</a>458<br />
            <a href="<%=this.Model %>/piaowu/piao/">演出票</a><i>/</i><a href="<%=this.Model %>/piaowu/dianyingpiao/">电影票</a>828<br />
            <a href="<%=this.Model %>/piaowu/youle/">游乐园/景点</a>930<br />
            <a href="<%=this.Model %>/piaowu/kaquan/">健身卡/优惠券</a>
            <%--<i>/</i><a href="<%=this.Model %>/piaowu/kaquan/" class="red">月饼券</a>--%>
            1768<br />
            <%--<a href="<%=this.Model %>/piaowu/?key=%25u56E2%25u8D2D">团购券</a><i>/</i>--%>
            <a href="<%=this.Model %>/piaowu/qtpiaowu/">其他票务</a>1165<br />
            <a href="<%=this.Model %>/piaowu/piao/" class="red">杭州演出信息</a><br />
    </div>
    <div class="c_b2">
	    <div class="c_b">
		    <h2 class="hpic8"><a href="<%=this.Model %>/zhaopin/">杭州招聘&raquo;</a></h2>
            <em><a href="<%=this.Model %>/zhaopin/yewu/">销售</a>64796</em><a href="<%=this.Model %>/zhaopin/kefu/">客服</a>12493<br />
            <em><a href="<%=this.Model %>/zhaopin/wenziluru/">文员</a>21427</em><a href="<%=this.Model %>/zhaopin/mishu/">助理</a>21427<br />
            <em><a href="<%=this.Model %>/zhaopin/qiantai/">前台</a>21427</em><a href="<%=this.Model %>/zhaopin/bianji/">编辑</a>1045<br />
            <em><a href="<%=this.Model %>/zhaopin/caiwu/">会计</a>6194</em><a href="<%=this.Model %>/zhaopin/chuna/">出纳</a>6194<br />
            <a href="<%=this.Model %>/zhaopin/renli/">人事/行政/后勤</a>21427<br />
            <a href="<%=this.Model %>/zhaopin/fangdichan/">房地产经纪人</a>64796<br />
            <a href="<%=this.Model %>/zhaopin/cangku/">仓库管理员</a>5098<br />
            <a href="<%=this.Model %>/zhaopin/sheji/">平面设计</a>11238<br />
            <a href="<%=this.Model %>/zhaopin/wangzhanmeigong/">网页设计/制作</a>11941<br />
            <a href="<%=this.Model %>/zhaopin/jishuzhichi/">技术支持/维护</a>11941<br />
            <em><a href="<%=this.Model %>/zhaopin/wangzhanyingyun/">网编</a>11896</em><a href="<%=this.Model %>/zhaopin/wangluogongchengshi/">网管</a>11896<br />
            <em><a href="<%=this.Model %>/zhaopin/jiaoshi/">教师</a>4463</em><a href="<%=this.Model %>/zhaopin/youerjiaoshi/">幼教</a>4463<br />
            <em><a href="<%=this.Model %>/zhaopin/yiliao/">医生</a>1735</em><a href="<%=this.Model %>/zhaopin/hushi/">护士</a>1735<br />
            <a href="<%=this.Model %>/zhaopin/shineisheji/">装修装潢设计</a>11238<br />
        </div>      
	    <div class="c_b pr0">
		    <h2 style="background:none;">&nbsp;</h2>
            <a href="<%=this.Model %>/zhaopin/shengchankaifa/">普工/技工</a>12258<br />
            <em><a href="<%=this.Model %>/zhaopin/dianzi/">电工</a>12258</em><a href="<%=this.Model %>/zhaopin/maohangong/">焊工</a>12258<br />
            <em><a href="<%=this.Model %>/zhaopin/siji/">司机</a>11197</em><a href="<%=this.Model %>/zhaopin/baoanl/">保安</a>3578<br />
            <em><a href="<%=this.Model %>/zhaopin/cantfwy/">服务员</a>13496</em><a href="<%=this.Model %>/zhaopin/canguan/">厨师</a>13496<br />
            <em><a href="<%=this.Model %>/zhaopin/shouying/">收银</a>7887</em><a href="<%=this.Model %>/zhaopin/chufangqiepei/">配菜</a>13412<br />
            <em><a href="<%=this.Model %>/zhaopin/yingyeyuan/">营业员</a>7887</em><a href="<%=this.Model %>/zhaopin/cuxiao/">导购</a>7887<br />
            <em><a href="<%=this.Model %>/zhaopin/baojieyuan/">保洁</a>3567</em><a href="<%=this.Model %>/zhaopin/baomuxin/">保姆</a>3567<br />
            <em><a href="<%=this.Model %>/zhaopin/sudiyuan/">快递员</a>5098</em><a href="<%=this.Model %>/zhaopin/banyungong">搬运工</a>5098<br />
            <em><a href="<%=this.Model %>/zhaopin/meirongshi/">美容师</a>6936</em><a href="<%=this.Model %>/zhaopin/faxingshi/">发型师</a>6936<br />
            <a href="<%=this.Model %>/zhaopin/huazhuangshizg/">化妆师</a>6936<br />
            <a href="<%=this.Model %>/zhaopin/baojiananmozuliao/">足疗保健</a>6936<br />
            <a href="<%=this.Model %>/zhaopin/jiubagzy/">酒吧服务员</a>8380<br />
            <a href="<%=this.Model %>/zhaopin/jiazhengbaojiexin/">家政保洁/安保</a>3578<br />
            <a href="<%=this.Model %>/zhaopin/zhaopinhui/">杭州招聘会</a>246<br />
	    </div><div class="clear"></div>
        <div class="c_b bor">
            <h2 class="hpic9">热门行业&raquo;</h2>
            <a href="<%=this.Model %>/zhaopin/lvyoujiudian/">餐饮/服务/旅游</a>2067<br />
            <a href="<%=this.Model %>/zhaopin/tech/">计算机/互联网/通信</a>11941<br />
		    <a href="<%=this.Model %>/zhaopin/guanggao/">广告/设计/咨询</a>11238<br />
            <em><a href="<%=this.Model %>/zhaopin/yiyuanyiliao/">医疗</a>1735</em><a href="<%=this.Model %>/zhaopin/qiche/">汽车</a>1887<br />
            <em><a href="<%=this.Model %>/zhaopin/jinrongbaoxian/">保险</a>1008</em><a href="<%=this.Model %>/zhaopin/jiaoyupeixun/">教育/培训</a>4463<br />
            <a href="<%=this.Model %>/zhaopin/fangchanjianzhu/">建筑/房产/物业</a>3920<br />
		    <a href="<%=this.Model %>/zhaopin/meirongjianshen/">美容/美发/保健</a>6936<br />
            <a href="<%=this.Model %>/zhaopin/wentiyingshi/">影视/娱乐/KTV</a>8399<br />
	    </div>
	    <div class="c_b pr0">
        <h2 class="hpic10"><a href="<%=this.Model %>/zhaopin/jianzhi/">兼职信息&raquo;</a></h2>
            <em><a href="<%=this.Model %>/zhaopin/jianzhi/xueshengjz/">学生兼职</a>6245</em><a href="<%=this.Model %>/zhaopin/jianzhi/shixi/">实习生</a>6245<br />
            <em><a href="<%=this.Model %>/zhaopin/jianzhi/jiazheng/">钟点工</a>2067</em><a href="<%=this.Model %>/zhaopin/jianzhi/yuyanwenzi/">翻译</a>424<br />
            <em><a href="<%=this.Model %>/zhaopin/jianzhi/xiaoshou/">促销</a>2891</em><a href="<%=this.Model %>/zhaopin/jianzhi/guwen/">会计</a>243<br />
            <em><a href="<%=this.Model %>/zhaopin/jianzhi/libing/">礼仪</a>1241</em><a href="<%=this.Model %>/zhaopin/jianzhi/jianzhijiajiao/">家教</a>1070<br />
            <a href="<%=this.Model %>/zhaopin/jianzhi/paifayuan/">传单派发</a>2891<br />
            <a href="<%=this.Model %>/zhaopin/jianzhi/computer/">设计制作</a>949<br />
            <a href="<%=this.Model %>/zhaopin/jianzhi/wangzhanzz/">网站建设</a>949<br />
            <a href="<%=this.Model %>/zhaopin/jianzhi/partime/">其他兼职</a>2047<br />
	    </div><div class="clear"></div>
	    <div class="c_b">
	        <h2 class="hpic11"><a href="<%=this.Model %>/qiuzhi/">杭州求职简历&raquo;</a></h2>
		    <em><a href="<%=this.Model %>/qiuzhi/yewu/">销售</a>64796</em><a href="<%=this.Model %>/qiuzhi/kefu/">客服</a>12493<br />
		    <em><a href="<%=this.Model %>/qiuzhi/wenziluru/">文员</a>21427</em><a href="<%=this.Model %>/qiuzhi/caiwu/">会计</a>6194<br />
		    <em><a href="<%=this.Model %>/qiuzhi/jiaoshi/">教师</a>4463</em><a href="<%=this.Model %>/qiuzhi/hushi/">护士</a>1735<br />
            <a href="<%=this.Model %>/qiuzhi/renli/">人事/行政/后勤</a>21427<br />
            <a href="<%=this.Model %>/qiuzhi/sheji/">平面设计</a>11238<br />
	    </div>
	    <div class="c_b pr0">
    	    <h2 style="background:none; padding-left:10px"><a href="<%=this.Model %>/qiuzhi/jianli/">简历搜索&raquo;</a></h2>
            <a href="<%=this.Model %>/qiuzhi/qzzpshengchankaifa/">普工/技工/生产</a>12258<br />
            <em><a href="<%=this.Model %>/qiuzhi/qzcantfwy/">服务员</a>13496</em><a href="<%=this.Model %>/qiuzhi/qzcanguan/">厨师</a>13496<br />
            <em><a href="<%=this.Model %>/qiuzhi/qzbaomuxin/">保姆</a>3578</em><a href="<%=this.Model %>/qiuzhi/qzbaoanl/">保安</a>3578<br />
            <em><a href="<%=this.Model %>/qiuzhi/qzsiji/">司机</a>11197</em><a href="<%=this.Model %>/qiuzhi/qzcuxiao/">导购</a>7887<br />
            <a href="<%=this.Model %>/qiuzhi/qzcangku/">仓库管理员</a>5098<br />
        </div>
    </div>
    <div class="c_b pr0 plb c_bh">
        <h2 class="hpic12"><a href="<%=this.Model %>/tuangou/?ref=homeright" target="_blank" id="tuanlink">今日团购&raquo;</a><a href="<%=this.Model %>/huangye/">生活服务&raquo;</a></h2> 
            <em><a href="<%=this.Model %>/huangye/banjia/">搬家</a>11514</em><a href="<%=this.Model %>/huangye/zhuangxiu/">装修</a>10334<br />
            <em><a href="<%=this.Model %>/huangye/baojie/">保洁</a>3713</em><a href="<%=this.Model %>/huangye<%=this.Model %>/huangye/baomu/">家政</a>4306<br />
            <em><a href="<%=this.Model %>/huangye/huishou/">回收</a>6282</em><a href="<%=this.Model %>/huangye/zulin/">租赁</a>1671<br />
            <em><a href="<%=this.Model %>/huangye/hunqing/" >婚庆</a>1068</em><a href="<%=this.Model %>/huangye/hunsha/">摄影</a>3225<br />
            <em><a href="<%=this.Model %>/huangye/zuche/">租车</a>7205</em><a href="<%=this.Model %>/huangye/shutong/">疏通</a>2272<br />
           <em><a href="<%=this.Model %>/huangye/jiancai/">建材</a>2272</em><a href="<%=this.Model %>/huangye/shipinlei/">食品</a>1358<br />
            <a href="<%=this.Model %>/huangye/weixiu/">电脑维修</a>4072<br />
            <a href="<%=this.Model %>/huangye/jiajuweixiu/">家居维修</a>2786<br />
            <a href="<%=this.Model %>/huangye/dianqi/">家电维修</a>13600<br />
            <a href="<%=this.Model %>/huangye/fangweixiu/">房屋维修/防水</a>5256<br />
            <em><a href="<%=this.Model %>/huangye/lipinxianhua/">鲜花</a>784</em><a href="<%=this.Model %>/huangye/huizhan/">庆典</a>841<br />
            <em><a href="<%=this.Model %>/huangye/tesecanyin/">餐饮</a>1161</em><a href="<%=this.Model %>/huangye/zhuankeyiy/">专科医院</a>10304<br />
        <h2 class="hpic13"><a href="<%=this.Model %>/huangye/shangwu.htm">商务服务&raquo;</a></h2>
            <em><a href="<%=this.Model %>/huangye/zhuce/">工商注册</a>10238</em><a href="<%=this.Model %>/huangye/kuaidi/">快递</a>1374<br />
            <em><a href="<%=this.Model %>/huangye/huoyun/">物流</a>4543</em><a href="<%=this.Model %>/huangye/wuliu/">货运专线</a>186<br />
            <a href="<%=this.Model %>/huangye/danbaobaoxiantouzi/">担保/保险/投资</a>4079<br />
            <a href="<%=this.Model %>/huangye/yinshua/">印刷</a><i>/</i><a href="<%=this.Model %>/huangye/baozhuang/">包装</a>1692<br />
            <a href="<%=this.Model %>/huangye/penhui/">喷绘</a><i>/</i><a href="<%=this.Model %>/huangye/allzhika/">制卡</a>617<br />
            <a href="<%=this.Model %>/huangye/wangzhan/">网站建设/推广</a>2339<br />
            <a href="<%=this.Model %>/huangye/fanyi/">翻译/速记</a>529<br />
            <a href="<%=this.Model %>/huangye/pingmian/">设计策划</a>1141<br />
            <a href="<%=this.Model %>/huangye/lvshi/">法律咨询</a>607<br />
            <a href="<%=this.Model %>/huangye/caishui/" >财务会计/评估</a>1786<br />
            <a href="<%=this.Model %>/huangye/chuanmei/">广告媒体</a>1926<br />
            <a href="<%=this.Model %>/huangye/shangbiaozhli/">商标专利</a>705<br />
            <a href="<%=this.Model %>/huangye/zhaoshang.htm">招商加盟</a>7901<br />
        <h2 class="hpic14"><a href="<%=this.Model %>/huangye/lvyouxiuxian.shtml">旅游/酒店/签证&raquo;</a></h2>
            <em><a href="<%=this.Model %>/huangye/lvyouxianlu/">国内游</a>799</em><a href="<%=this.Model %>/huangye/zhoubianyou/">周边游</a>844<br />
            <em><a href="<%=this.Model %>/huangyejdyd">酒店</a>564</em><a href="<%=this.Model %>/huangye/lvyou/">旅行社</a>571<br />
    </div>
    <div class="clear" style="border-bottom:1px solid #f1f1f1"></div><!-- class end -->

    <div class="cb_ul mt">
  	    <h3><a href="http://q.flxxwang.com">58圈子</a>/<a href="http://q.flxxwang.com/event/">活动</a></h3>
  	    <ul>
            <li><a href="http://t.58.com/zt/20110826_dzx.html?pm58=tgbanner/right_110826_dzx?utm_source=58.com_quanzi" target="_blank">玩转金秋，阳澄湖大闸蟹免费送</a></li>
            <li class="nob"><a href="http://t.58.com/zt/20110826_zs.html?pm58=tgbanner/right_110826_zs?utm_source=58.com_quanzi" target="_blank" class="link_red">拿什么求婚最给力？58告诉你</a></li>
            <li><a href="http://www.58.com/?path=duanzu/" target="_blank">出行旅游选短租 温馨如家50元</a></li><li class="nob"><a href="http://q.58.com/58zhiding/topic_739609.shtml" target="_blank" class="link_red">招聘旺季!58同城充值送招聘助手</a></li>
            <li><a href="http://t.58.com/zt/20110826_lwx.html?pm58=tgbanner/right_110826_lwx?utm_source=58.com_quanzi" target="_blank">58团购与您一起发现生活之美</a></li>
        </ul>
    </div>

     <div id="toptuanad1" class="mt">
        <p style="text-align:center; margin-top:62px; font-size:14px; color:#585858">加载中...</p>
     </div>

     <div id="listinfo" class="mt">
 	    <h3><a href="http://www.58.com/allproduct.html">推荐信息</a></h3><div class="clear"></div>
        <em><a href="<%=this.Model %>/huangye/" class="red">生活黄页</a></em><a href="http://www.flxxwang.com/wlt/" >网邻通</a><br />
        <em><a href="http://tianqi.flxxwang.com/">天气预报</a></em><a href="http://bus.flxxwang.com/">杭州公交</a><br />
        <em><a href="http://jipiao.58.com/">特惠机票</a>/<a href="http://hotel.flxxwang.com/">酒店</a></em><a href="http://lieche.flxxwang.com" >列车时刻表</a><br />
        <em><a href="http://caipiao.flxxwang.com/">彩票频道</a></em><a href="http://www.flxxwang.com/rcsc.htm">人才市场</a><br />
     </div>
     <div class="clear"></div>  
</div>


<div class="morelink">
    <div class="morelinkinside">
        <strong>热门区域：</strong>
        <li><a href='<%=this.Model %>/xihuqu/' target='_self'>西湖</a></li>
        <li><a href='<%=this.Model %>/gongshu/' target='_self'>拱墅</a></li>
        <li><a href='<%=this.Model %>/jianggan/' target='_self'>江干</a></li>
        <li><a href='<%=this.Model %>/xiacheng/' target='_self'>下城</a></li>
        <li><a href='<%=this.Model %>/hzshangcheng/' target='_self'>上城</a></li>
        <li><a href='<%=this.Model %>/binjiang/' target='_self'>滨江</a></li>
        <li><a href='<%=this.Model %>/yuhang/' target='_self'>余杭</a></li>
        <li><a href='<%=this.Model %>/xiaoshan/' target='_self'>萧山</a></li>
        <li><a href='<%=this.Model %>/hangzhou/' target='_self'>杭州周边</a></li>
    </div>
</div>

<div id="footer">
    <div class="bg">
        <div id="contact">
            <a href="http://about.flxxwang.com/" title="有问题请与58客服进行对话" class="fduihua">帮助中心</a>
            <a href="http://about.flxxwang.com/info/del-menu.html" class="red">我要删除信息</a>|
            <a href="http://about.flxxwang.com/home/">关于我们</a>|
            <a href="http://about.flxxwang.com/contract/79/">联系我们</a>|
            <a href="http://about.flxxwang.com/contract/a79/">推广服务</a>|
            <a href="http://about.flxxwang.com/hr/">58招聘</a>|
            <a href="http://about.flxxwang.com/home/announcement.html">使用协议及公告</a> <br />
            京公网安备110105000809号 <a href="http://www.miibeian.gov.cn/" style="color:#666">京ICP证000000</a>
        </div>
    </div>
    <div id="flink">﻿
        ﻿<strong>友情链接</strong>:
        <a href='http://hangzhou.fangtoo.com/' target='_blank'>杭州租房-房途网</a>&nbsp;
        <a href='http://villa.focus.cn/' target='_blank'>焦点别墅网</a>&nbsp;
        <a href='http://www.jtlhome.com/' target='_blank'>居泰隆实体家居</a>&nbsp;
        <a href='http://bbs.tradeknow.com/' target='_blank'>外贸网</a>&nbsp;
        <a href='http://www.54yjs.cn/' target='_blank'>兼职实习网</a>&nbsp;
        <a href='http://www.auto-m.hc360.com/' target='_blank'>汽车维修保养</a>&nbsp;
        <a href='http://www.lcwap.com/' target='_blank'>龙城信息网</a>&nbsp;
        <a href='http://www.soulou8.com/' target='_blank'>搜楼网</a>&nbsp;
        <a href='http://www.unsbiz.com/' target='_blank'>环球财富网</a>&nbsp;
        <a href='http://www.ccots.com.cn' target='_blank'>商务在线旅行网</a>&nbsp;
        <a href='http://home.soufun.com' target='_blank'>搜房家居</a>&nbsp;
        <a href='http://www.cbi360.com' target='_blank'>中国建设网</a>&nbsp;
        <a href='http://hangzhou.gongjiao.com' target='_blank'>杭州公交</a>&nbsp;
        <a href='http://emotion.pclady.com.cn/' target='_blank'>PClady情感频道</a>&nbsp;
        <a href='http://www.kg10000.com/' target='_blank'>空港旅游网</a>&nbsp;
        <a href='http://house.ifeng.com/' target='_blank'>凤凰网房产</a>&nbsp;
        <a href='http://www.lavago.com' target='_blank'>拉拉勾旅游网</a>&nbsp;
        <a href='http://www.inpai.com.cn' target='_blank'>硬派网</a>&nbsp;
        <a href='http://www.QcTsw.Com' target='_blank'>汽车投诉网</a>&nbsp;
        <a href='http://www.eguo.com/' target='_blank'>E国团购导航</a>&nbsp;
        <a href='http://auto.enet.com.cn/' target='_blank'>硅谷动力汽车</a>&nbsp;
        <a href='http://hz.taofang.com' target='_blank'>杭州淘房网</a>&nbsp;
        <a href='http://www.yellowurl.cn/' target='_blank'>中国黄页网</a>&nbsp;
        <a href='http://www.818.com/' target='_blank'>818医药网</a>&nbsp;
        <a href='http://www.etowz.com/' target='_blank'>易坦网</a>&nbsp;
        <a href='http://hangzhou.bitauto.com/' target='_blank'>杭州汽车网</a>&nbsp;
        <a href='http://www.shsunedu.com' target='_blank'>学尔森教育</a>&nbsp;
        <a href='http://www.0731jiaju.com.cn/' target='_blank'>装修公司</a>&nbsp;
        <a href='http://www.gototsinghua.org.cn/' target='_blank'>清华大学研修班</a>&nbsp;
        <a href='http://www.fanwenzh.com/' target='_blank'>教育学习网</a>&nbsp;
        <a href="/link.html" target="_blank">更多...
    </div>
    <div class="clear"></div>
</div>

<div style="display:none">
<%--<script type="text/javascript">
    var _gaq = _gaq || []; var site_name = "58";
    _gaq.push(['pageTracker._setAccount', 'UA-877409-4']);
    _gaq.push(['pageTracker._setDomainName', '.58.com']);
    _gaq.push(['pageTracker._setAllowLinker', true]);
    _gaq.push(['pageTracker._addOrganic', 'sogou', 'query']);
    _gaq.push(['pageTracker._addOrganic', 'baidu', 'word']);
    _gaq.push(['pageTracker._addOrganic', 'soso', 'w']);
    _gaq.push(['pageTracker._addOrganic', 'youdao', 'q']);
    _gaq.push(['pageTracker._trackPageview']);
    _gaq.push(['pageTracker._trackPageLoadTime']);
    boot.require('util.js', function (Frame, js) {
        Frame.init(function () {
            js.append(('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js');
            js.append('http://track.58.com/referrer2.js');
        });
    });
</script>--%>
</div>

<%--<div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1020842622/?label=UaXhCIqxoQIQ_qTj5gM&amp;guid=ON&amp;script=0"/></div>--%>
</asp:Content>


