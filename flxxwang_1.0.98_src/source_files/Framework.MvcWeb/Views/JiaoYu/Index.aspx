<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%var city = ViewData["City"] as City; %>
<title>【<%=city.ShortName %>教育网|<%=city.ShortName %>教育培训】 - <%=city.ShortName %><%=SiteInfo.Name%></title>
<meta name="description" content="<%=city.ShortName %>教育培训为您提供<%=city.ShortName %>教育培训,<%=city.ShortName %>教育机构,<%=city.ShortName %>家教信息，在这里有大量的<%=city.ShortName %>教育信息,<%=city.ShortName %>培训信息,<%=city.ShortName %>家教信息供您查询。 " />
<meta name="keywords" content="<%=city.ShortName %>教育网,<%=city.ShortName %>教育培训" />
<script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/1.js"></script>
<%--<script type="text/javascript" src="/Content/Fenlei/Scripts/5_1/72/43.js"></script>--%>
<script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/boot_toplist_version.js"></script>
<%--<script  type="text/javascript">
    var _bdhm_top = 0;
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    var _bdhm_tim = new Image(1, 1);
    _bdhm_tim.id = "bdhmPerimg";
    _bdhm_tim.src = _bdhmProtocol + "hm.baidu.com/_tt.gif?si=850d0ecfa2c2e6e4dce8e4dbe08821b6&rnd=" + Math.round(Math.random() * 2147483647);
    _bdhm_tim.onload = function () { _bdhm_top = 1; }
</script>--%>
<style type="text/css">
body,dl,ol,ul,li,dt,dd,p,h2,h3,h4{margin:0;padding:0;list-style:none;-webkit-text-size-adjust:none}
body{font:12px/1.2 Arial, Tahoma, "宋体", sans-serif;color:#333; min-width:1000px}
a{color:#0000cc;text-decoration:none;cursor:pointer}
a:hover,#fabu:hover
{
    /*color:#ff0000;*/
    color:#10ade4;
    text-decoration:underline
}
.clear{clear:both;font-size:0;height:0; line-height:1%;overflo:hidden}img{border:none}.fr{float:right}.red,.link_red,#hot a.red{color:#ff0000}.mt{margin-top:10px}.sc{display:block}.hc{display:none}.fr{float:right}#header,.cb,.morelink,#footer{width:1000px;margin:0 auto;clear:both; padding:0; overflow:hidden}#headerinside{height:88px; position:relative; z-index:666}#logo{position:absolute;left:15px;top:10px}#searchbar{position:absolute;left:270px;top:21px; line-height:26px; overflow:hidden}#key{background:url(/Content/Fenlei/ui6/index/searbut.gif) no-repeat 0 0; height:30px; padding:2px 0; display:inline-block; float:left}#keyword{background:url(/Content/Fenlei/ui6/index/searbut.gif) no-repeat 0 -2px; width:419px;height:22px; line-height:22px; padding:4px 0; border:none; padding-left:38px; float:left; display:inline-block; overflow:hidden}.keyword{color:#ccc}.keyword2{color:#000}#searchbtn{background:url(/Content/Fenlei/ui6/index/searbut.gif) no-repeat -557px 0px;width:123px;height:35px; text-align:center;color:#fff; font-size:16px; font-weight:bold; cursor:pointer; overflow:hidden; text-align:center; color:#fff; line-height:33px; padding-bottom:4px;border:none; float:left}#searchbtn.btnal2{text-decoration:underline}#fabu{position:absolute;right:10px;top:21px; background:url(/Content/Fenlei/ui6/index/searbut.gif) no-repeat -682px 0; width:118px; height:35px; line-height:35px; display:inline-block; font-size:14px; font-weight:bold; color:#000; text-align:center; float:left;cursor:pointer;}#hot{float:left;color:#888; padding-left:10px; display:inline}#hot a{margin-right:19px; color:#888;}.tooltip{width:539px; padding:8px;border:1px solid #dcdadc;background:#fff;margin-top:-4px;line-height:200%}.tooltip ul{width:100%; overflow:hidden}.tooltip li{height:26px;overflow:hidden;padding-left:5px}.tooltip li a{text-decoration:none;color:#666;font-size:13px}.tooltip li a b{color:#002cad}.tooltip li .tool_r{float:right;color:#008000;font-size:11px}.tooltip li.selected a b,.tooltip li.selected a,.tooltip li.selected .tool_r{color:#FFF8D8}.tooltip li.selected{background:#f97d03;cursor:pointer;color:#FFF8D8; padding-right:8px;}.closewindow{float:right;margin:-5px 5px 0 0;}.l{ float:left; width:460px; display:inline; padding-left:15px;margin-right:60px;}.r{ float:left; width:460px;}.cb h2{font-size:14px; border-bottom:1px solid #eee; line-height:30px; height:30px;}.cb p{ line-height:24px; padding-bottom:19px;}.cb p a{color:#666;white-space:nowrap}
.cb p a:hover 
{
    /*color:#f00*/
    color:#10ade4;
}
.cb li a:hover,.cb p a.c_r
{
    /*color:#f00*/
    color:#10ade4;
}
.cb cite{color:#ddd;padding:0 8px}.cb .jpic2{background-position:0px -28px}.cb .jpic3{background-position:0px -66px}.cb .jpic4{background-position:0px -100px}.cb .jpic5{background-position:0px -137px}.cb .jpic6{background-position:0px -173px}.cb .jpic7{background-position:0px -208px}.cb .jpic8{background-position:0px -244px}.cb .jpic9{background-position:0px -281px}.cb .jpic10{background-position:0px -315px}#footer a{color:#666; font-weight:400}#flink a{margin:0 0 0 5px; white-space:nowrap\0; color:#bebebe; display:inline-block\0}#flink a:hover{text-decoration:none}#footer .bg{color:#bebebe;padding:10px;text-align:center; line-height:180%; border-top:solid 1px #f1f1f1;}#footer #flink{margin-top:5px; line-height:20px}.h10{ height:10px; line-height:1%; font-size:1%;}.friendlink a{ padding-right:10px;}/* 智能提示 */.tooltip{border:1px solid #DCDADC;background:#fff;margin-top:-3px;+margin-top:-4px;line-height:200%}.tooltip li{height:26px;padding-left:5px;overflow:hidden}.tooltip li a{color:#666;font-size:13px;text-decoration:none}.tooltip li a b{color:#002cad}.tooltip li .tool_r{float:right;color:#090;font-size:11px}.tooltip li.selected a b,.tooltip li.selected a,.tooltip li.selected .tool_r{color:#fff}.tooltip li.selected,.tag_options li.open_hover{background:#FF7E05;color:#FFF}#tooltipdiv1{width:152px}.clear1 {clear:both;font-size:0;height:0; line-height:1%;overflo:hidden}

.hytop 
{
    height:28px; 
    /*border-bottom:2px solid #ff7200;*/
    border-bottom:2px solid #10ade4;
    font-size:14px; 
    width:990px; 
    margin:0 auto 10px;  
    padding-left:10px; 
    position:relative;
}
.hytop a 
{
    float:left; 
    display:inline-block; 
    text-align:center; 
    margin-left:5px; 
    padding-right:2px; 
    color:#4d4d4d;
    background:url(/Content/Fenlei/assets/images/list/sprites.png) no-repeat right -123px;
    height: 25px;
    line-height: 25px;
    margin-top:3px;
}
.hytop a:hover 
{
    /*color:#f00;*/
    color:#10ade4;
    text-decoration:none
}
.hytop a span
{
    display: inline-block; 
    font-size:14px;
    padding: 0 8px 0 10px; 
    background:url(/Content/Fenlei/assets/images/list/sprites.png) no-repeat 0 -148px;
}
.hytop b 
{
    float:left; 
    display:inline-block; 
    margin-left:5px; 
    color:#fff; 
    height:28px; 
    line-height:28px; 
    background:url(/Content/Fenlei/ui6/yp/hy_03.png) no-repeat left; 
    padding-left:10px;
}
.hytop b span
{
    background:url(/Content/Fenlei/ui6/yp/hy_03.png) no-repeat right; 
    padding-right:10px; 
    display:inline-block;
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<%var city = ViewData["City"] as City; %>
<div id="header">
    <div id="headerinside">
        <a href="<%=Url.Action("Default","Home") %>" id="logo" target="_self">
            <img src="/Content/Fenlei/assets/images/logo/logo.gif" alt="中文最大生活信息门户"/>
        </a>
        <div id="searchbar">
            <i id="key">
                <input type="text" id="keyword" class="keyword" value="请输入类别名称或关键字"/>
            </i>
            <input type="button" name="button" class="btnall" id="searchbtn" value="同城搜索" onmousemove="this.className='btnal2'" onmouseout="this.className=''" />
            <div class="clear"></div>
            <%--<span id="hot">
                热门搜索：
                <a href="/fudao/">家教</a>
                <a href="/xueli/">学历教育</a>
                <a href="/waiyu/">外语培训</a>
                <a href="/jisuanji/">it培训</a>
                <a href="/youjiao/">婴幼儿教育</a>
                <a href="/zhongxuejiajiao/">初中家教</a>
                <a href="/xiaoxuejiajiao/">小学家教</a>
            </span>--%>
        </div>
        <div >
            <a href="<%=Url.Action("s2","post",new{values="jiaoyu"}) %>" id="fabu">免费发布信息</a>
        </div>
    </div>
</div>

<div class="hytop">
    <a href="<%=Url.Action("index","huangye") %>"><span> 黄页首页 </span></a>
    <a href="<%=Url.Action("shenghuo","huangye") %>"><span> 生活服务 </span></a>
    <a href="<%=Url.Action("shangwu","huangye") %>"><span> 商务服务 </span></a>
    <b><span> 教育培训 </span></b>
    <a href="<%=Url.Action("lvyouxiuxian","huangye") %>"><span> 旅游/酒店/签证 </span></a>
    <a href="<%=Url.Action("zhaoshang","huangye") %>"><span> 招商加盟 </span></a>
    <p><i></i></p>
</div>

<div class="cb">
    <div class="l">
        <h2 class="jpic3"><a href="<%=Url.Action("zhiyepeix") %>">职业技能培训&raquo;</a></h2>
        <p>
            <%
                for (var i = 0; i < EduProfession.Singleton.ObjectTypeCollection.Count; i++)
                {
                    var item = EduProfession.Singleton.ObjectTypeCollection[i];
                    %>
                    <a href="<%=Url.Action("zhiyepeix",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                    <%
                    if (i < EduProfession.Singleton.ObjectTypeCollection.Count - 1)
                    {
                        if (i % 8 == 7)
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
            <%--<a href="/kuaijipeixun/">会计</a><cite>|</cite>
            <a class="c_r" href="/zgrz/">资格认证</a><cite>|</cite>
            <a href="/jishupeixun/">技能</a><cite>|</cite>
            <a href="/chuyipeixun/">厨师</a><cite>|</cite>
            <a href="/jiaoshipeixun/">教师</a><cite>|</cite>
            <a href="/miermeifa/">美容美发</a><cite>|</cite>
            <a href="/renliziyuanpeixun/">人力资源师</a><cite>|</cite>
            <a href="/gongwuyuanpeixun/">公务员</a><br />
            <a href="/sheyingpeixun/">摄影</a><cite>|</cite>
            <a href="/yyspeixun/">营养师</a><cite>|</cite>
            <a href="/daoyoupeixun/">导游</a><cite>|</cite>
            <a href="/xlzxspeixun/">心理咨询师</a><cite>|</cite>
            <a href="/baoguanyuan/">报关员</a><cite>|</cite>
            <a href="/chspeixun/">策划师</a><cite>|</cite>
            <a href="/jineng/">汽车维修</a>--%>
        </p>
        <h2 class="jpic9"><a href="<%=Url.Action("xueli") %>">学历教育&raquo;</a></h2>
        <p>
            <%
                for (var i = 0; i < EduEducation.Singleton.ObjectTypeCollection.Count; i++)
                {
                    var item = EduEducation.Singleton.ObjectTypeCollection[i];
                    %>
                    <a href="<%=Url.Action("xueli",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                    <%
                    if (i < EduEducation.Singleton.ObjectTypeCollection.Count - 1)
                    {
                        if (i % 8 == 7)
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
            <%--<a href="/zikao/">自考</a><cite>|</cite>
            <a href="/kaoyanpeixun/">在职研究生</a><cite>|</cite>
            <a class="c_r" href="/xuelirenzheng/">学历认证</a><cite>|</cite>
            <a href="/yuanchengjiaoyu/">远程教育</a><cite>|</cite>
            <a href="/chegnrenjiaoyu/">成人教育</a><cite>|</cite>
            <a href="/chengrengaokao/">成人高考</a><cite>|</cite>
            <a href="/wangluojiaoyu/">网络教育</a><br />
            <a href="/zhuanshben/">专升本</a><cite>|</cite>
            <a href="/erxueli/">二学历</a>--%>
        </p>
        <h2 class="jpic4"><a href="<%=Url.Action("techang") %>">文艺/体育&raquo;</a></h2>
        <p>
            <%
                for (var i = 0; i < EduSpecial.Singleton.ObjectTypeCollection.Count; i++)
                {
                    var item = EduSpecial.Singleton.ObjectTypeCollection[i];
                    %>
                    <a href="<%=Url.Action("techang",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                    <%
                    if (i < EduSpecial.Singleton.ObjectTypeCollection.Count - 1)
                    {
                        if (i % 8 == 7)
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
            <%--<a href="/yueqipeixun/">乐器</a><cite>|</cite>
            <a class="c_r" href="/wudaopeixun/">舞蹈</a><cite>|</cite>
            <a href="/shufapeixun/">书法</a><cite>|</cite>
            <a href="/yinyuepeixun/">声乐</a><cite>|</cite>
            <a href="/meishupeixun/">美术</a><cite>|</cite>
            <a href="/yujiapeixun/">瑜伽</a><cite>|</cite>
            <a href="/wushupeixun/">武术</a><cite>|</cite>
            <a href="/djpeixun/">dj</a><cite>|</cite>
            <a href="/qiuleipeixun/">球类</a><cite>|</cite>
            <a href="/taiquandao/">跆拳道</a><cite>|</cite>
            <a href="/qilei/">棋类</a><br />
            <a href="/biaoyanpeixun/">表演</a>--%>
        </p>
        <h2 class="jpic6"><a href="<%=Url.Action("youjiao") %>">婴幼儿教育&raquo;</a></h2>
        <p>
            <%
                for (var i = 0; i < EduBaby.Singleton.ObjectTypeCollection.Count; i++)
                {
                    var item = EduBaby.Singleton.ObjectTypeCollection[i];
                    %>
                    <a href="<%=Url.Action("youjiao",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                    <%
                    if (i < EduBaby.Singleton.ObjectTypeCollection.Count - 1)
                    {
                        if (i % 8 == 7)
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
            <%--<a href="/xueqianjiaoyu/">学前教育</a><cite>|</cite>
            <a class="c_r" href="/youeryuanjiaoyu/">幼儿园</a><cite>|</cite>
            <a href="/qinzijiaoyu/">亲子教育</a><cite>|</cite>
            <a href="/zhilikaifa/">智力开发</a><cite>|</cite>
            <a href="/taijiao/">胎教</a>--%>
        </p>
        <h2 class="jpic7"><a href="<%=Url.Action("liuxue") %>">留学&raquo;</a></h2>
        <p>
            <%
                for (var i = 0; i < EduAbroad.Singleton.ObjectTypeCollection.Count; i++)
                {
                    var item = EduAbroad.Singleton.ObjectTypeCollection[i];
                    %>
                    <a href="<%=Url.Action("liuxue",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                    <%
                    if (i < EduAbroad.Singleton.ObjectTypeCollection.Count - 1)
                    {
                        if (i % 8 == 7)
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
            <%--<a href="/meiguoliuxue/">美国</a><cite>|</cite>
            <a href="/ribenliuxue/">日本</a><cite>|</cite>
            <a href="/xjpliuxue/">新加坡</a><cite>|</cite>
            <a class="c_r" href="/aozhouliuxue/">澳洲</a><cite>|</cite>
            <a href="/faguoliuxue/">法国</a><cite>|</cite>
            <a href="/jndliuxue/">加拿大</a><cite>|</cite>
            <a href="/yingguoliuxue/">英国</a><cite>|</cite>
            <a href="/hanguoliuxue/">韩国</a><cite>|</cite>
            <a href="/deguoliuxue/">德国</a><cite>|</cite>
            <a href="/xbyliuxue/">西班牙</a><br />
            <a href="/xxlliuxue/">新西兰</a>--%>
        </p>

        <%--<h2 class="jpic7"><a href="/lxymvisa/">留学/移民签证&raquo;</a></h2>
        <p>
            <a href="/guojilaowu/">出国劳务签证</a><cite>|</cite>
            <a class="c_r" href="/lxvisa/">留学签证</a><cite>|</cite>
            <a href="/ymvisa/">移民签证</a>
        </p>--%>

    </div>
    <div class="r">
        <h2 class="jpic1"><a href="<%=Url.Action("fudao") %>">家教&raquo;</a></h2>
        <p>
            <%
                for (var i = 0; i < EduTutor.Singleton.ObjectTypeCollection.Count; i++)
                {
                    var item = EduTutor.Singleton.ObjectTypeCollection[i];
                    %>
                    <a href="<%=Url.Action("fudao",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                    <%
                    if (i < EduTutor.Singleton.ObjectTypeCollection.Count - 1)
                    {
                        if (i % 8 == 7)
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
            <%--<a href="/zhongxuejiajiao/">初中</a><cite>|</cite>
            <a class="c_r" href="/xiaoxuejiajiao/">小学</a><cite>|</cite>
            <a href="/gaozhongjiajiao/">高中</a><cite>|</cite>
            <a href="/zhongkaojiajiao/">中考</a><cite>|</cite>
            <a href="/gaokaochongci/">高考</a><cite>|</cite>
            <a href="/xscjiajiao/">小升初</a><br />&nbsp;--%>
        </p>
        <h2 class="jpic2"><a href="<%=Url.Action("waiyu") %>">外语培训&raquo;</a></h2>
        <p>
            <%
                for (var i = 0; i < EduLanguage.Singleton.ObjectTypeCollection.Count; i++)
                {
                    var item = EduLanguage.Singleton.ObjectTypeCollection[i];
                    %>
                    <a href="<%=Url.Action("waiyu",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                    <%
                    if (i < EduLanguage.Singleton.ObjectTypeCollection.Count - 1)
                    {
                        if (i % 8 == 7)
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
            <%--<a href="/yingyupx/">英语培训</a><cite>|</cite>
            <a class="c_r" href="/riyupeixun/">日语</a><cite>|</cite>
            <a href="/hanyupeixun/">韩语</a><cite>|</cite>
            <a href="/fayupeixun/">法语</a><cite>|</cite>
            <a href="/xibanyayupx/">西班牙语</a><cite>|</cite>
            <a href="/eyupeixun/">俄语</a><cite>|</cite>
            <a href="/deyupeixun/">德语</a><cite>|</cite>
            <a href="/yidaliyupx/">意大利语</a><br />&nbsp;--%>
        </p>
        <h2 class="jpic8"><a href="<%=Url.Action("jisuanji") %>">IT培训&raquo;</a></h2>
        <p>
            <%
                for (var i = 0; i < EduIT.Singleton.ObjectTypeCollection.Count; i++)
                {
                    var item = EduIT.Singleton.ObjectTypeCollection[i];
                    %>
                    <a href="<%=Url.Action("jisuanji",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                    <%
                    if (i < EduIT.Singleton.ObjectTypeCollection.Count - 1)
                    {
                        if (i % 8 == 7)
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
            <%--<a href="/rjgcspeixun/">软件工程师</a><cite>|</cite>
            <a href="/dianzishangwu/">电子商务</a><cite>|</cite>
            <a class="c_r" href="/youxipeixun/">动漫/游戏</a><cite>|</cite>
            <a href="/wlgcspeixun/">网络工程师</a><cite>|</cite>
            <a href="/jsjdjkaoshi/">计算机等级考试</a><br />
            <a href="/dnwxpeixun/">电脑维修培训</a><cite>|</cite>
            <a href="/itrenzheng/">IT认证</a><cite>|</cite>
            <a href="/wlyxpeixun/">网络营销</a><cite>|</cite>
            <a href="/sjkpeixun/">数据库培训</a><br />--%>
        </p>
        <h2 class="jpic5"><a href="<%=Url.Action("mba") %>">管理/MBA&raquo;</a></h2>
        <p>
            <%
                for (var i = 0; i < EduMBA.Singleton.ObjectTypeCollection.Count; i++)
                {
                    var item = EduMBA.Singleton.ObjectTypeCollection[i];
                    %>
                    <a href="<%=Url.Action("mba",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                    <%
                    if (i < EduMBA.Singleton.ObjectTypeCollection.Count - 1)
                    {
                        if (i % 8 == 7)
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
            <%--<a href="/mbapeixun/">MBA</a><cite>|</cite>
            <a href="/xiangmuguanli/">项目</a><cite>|</cite>
            <a href="/gongchengguanli/">工程</a><cite>|</cite>
            <a class="c_r" href="/wuliuguanli/">物流</a><cite>|</cite>
            <a href="/caiwuguanli/">财务</a><cite>|</cite>
            <a href="/jiudianguanli/">酒店</a><cite>|</cite>
            <a href="/gongshangguanli/">工商</a><cite>|</cite>
            <a href="/wuyeguanli/">物业</a><cite>|</cite>
            <a href="/qiyepeixun/">企业</a><cite>|</cite>
            <a href="/xingzhengguanli/">行政</a>--%>
        </p>        
        <h2 class="jpic10"><a href="<%=Url.Action("shejipeixun") %>">设计培训&raquo;</a></h2>
        <p>
            <%
                for (var i = 0; i < EduDesign.Singleton.ObjectTypeCollection.Count; i++)
                {
                    var item = EduDesign.Singleton.ObjectTypeCollection[i];
                    %>
                    <a href="<%=Url.Action("shejipeixun",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                    <%
                    if (i < EduDesign.Singleton.ObjectTypeCollection.Count - 1)
                    {
                        if (i % 8 == 7)
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
            <%--<a href="/snsjpeixun/">室内</a><cite>|</cite>
            <a class="c_r" href="/fzsjpeixun/">服装</a><cite>|</cite>
            <a href="/pmshpeixun/">平面</a><cite>|</cite>
            <a href="/jzsjpeixun/">建筑</a><cite>|</cite>
            <a href="/mjsjpeixun/">模具</a><cite>|</cite>
            <a href="/wysjpeixun/">网页</a><br />&nbsp;--%>
        </p>

        <%--<h2 class="jpic7"><a href="/yimin/">移民&raquo;</a></h2>
        <p>
            <a href="/touziyimin/" >投资移民</a><cite>|</cite>
            <a href="/jishuyimin/" >技术移民</a><cite>|</cite>
            <a href="/meiguoyimin/" >美国移民</a><cite>|</cite>
            <a class="c_r" href="/jndyimin/" >加拿大移民</a><cite>|</cite>
            <a href="/adlyyimin/" >澳大利亚移民</a><cite>|</cite>
            <a href="/xjpyimin/" >新加坡移民</a><br />
            <a href="/xxlyimin/" >新西兰移民</a><cite>|</cite>
            <a href="/aozhouyimin/" >澳洲移民</a><cite>|</cite>
            <a href="/gaokaoyimin/" >高考移民</a>
        </p>--%>

    </div>
    <div class="clear1"></div>
</div>

<div id="footer">
    <div class="bg">
        <div id="contact">
            <%--北京市公安局朝阳分局备案编号:0000000000--%>
            <a href="http://www.miibeian.gov.cn/" style="margin-left:20px;">浙ICP备09071137号-4</a> <br />
            <%--<div id="flink">
            ﻿﻿  &nbsp; <a href="#" target="_blank">自动申请链接</a>.
            </div>--%>
            <div class="clear"></div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $("a").attr("target", "_blank");
    });
</script>
</asp:Content>