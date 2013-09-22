<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Index/YellowPageIndex.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Style" runat="server">
<style type="text/css">
body,dl,ol,ul,li,dt,dd,p,h2,h3,h4{margin:0;padding:0;list-style:none;-webkit-text-size-adjust:none}body{font:12px/1.2 Arial, Tahoma, "宋体", sans-serif;color:#333; min-width:1000px}a{color:#0000cc;text-decoration:none;cursor:pointer}a:hover,#fabu:hover{color:#ff0000;text-decoration:underline}.clear{clear:both;font-size:0;height:0; line-height:1%;overflo:hidden}img{border:none}.fr{float:right}.red,.link_red,#hot a.red{color:#ff0000}.mt{margin-top:10px}.sc{display:block}.hc{display:none}.fr{float:right}#header,.cb,.morelink,#footer{width:1000px;margin:0 auto;clear:both; padding:0; overflow:hidden}#headerinside{height:88px; position:relative; z-index:666}#logo{position:absolute;left:15px;top:10px}
#searchbar{position:absolute;left:270px;top:21px; line-height:26px; overflow:hidden}
#key{background:url(/Content/Fenlei/Ui6/index/searbut.gif) no-repeat 0 0; height:30px; padding:2px 0; display:inline-block; float:left}#keyword{background:url(/Content/Fenlei/Ui6/index/searbut.gif) no-repeat 0 -2px; width:419px;height:22px; line-height:22px; padding:4px 0; border:none; padding-left:38px; float:left; display:inline-block; overflow:hidden}.keyword{color:#ccc}.keyword2{color:#000}#searchbtn{background:url(/Content/Fenlei/Ui6/index/searbut.gif) no-repeat -557px 0px;width:123px;height:35px; text-align:center;color:#fff; font-size:16px; font-weight:bold; cursor:pointer; overflow:hidden; text-align:center; color:#fff; line-height:33px; padding-bottom:4px;border:none; float:left}#searchbtn.btnal2{text-decoration:underline}#fabu{position:absolute;right:10px;top:21px; background:url(/Content/Fenlei/Ui6/index/searbut.gif) no-repeat -682px 0; width:118px; height:35px; line-height:35px; display:inline-block; font-size:14px; font-weight:bold; color:#000; text-align:center; float:left;cursor:pointer;}#hot{float:left;color:#888; padding-left:10px; display:inline}#hot a{margin-right:19px; color:#888;}.tooltip{width:539px; padding:8px;border:1px solid #dcdadc;background:#fff;margin-top:-4px;line-height:200%}.tooltip ul{width:100%; overflow:hidden}.tooltip li{height:26px;overflow:hidden;padding-left:5px}.tooltip li a{text-decoration:none;color:#666;font-size:13px}.tooltip li a b{color:#002cad}.tooltip li .tool_r{float:right;color:#008000;font-size:11px}
.tooltip li.selected a b,.tooltip li.selected a,.tooltip li.selected .tool_r
{
    color:#FFF8D8
}
.tooltip li.selected
{
    background:#f97d03;cursor:pointer;color:#FFF8D8; padding-right:8px;
}.closewindow{float:right;margin:-5px 5px 0 0;}.l{ float:left; width:460px; display:inline; padding-left:15px;margin-right:60px;}.r{ float:left; width:460px;}.cb h2{font-size:14px; border-bottom:1px solid #eee; line-height:30px; height:30px; /*background:url(http://pic2.flxxwang.com/ui6/yp/bgpic.png) no-repeat 0px 8px;padding-left:22px;*/}.cb p{ line-height:24px; padding-bottom:19px;}.cb p a{color:#666;white-space:nowrap}
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
    font-size:14px; width:990px; margin:0 auto 10px;  padding-left:10px; position:relative;
}
.hytop a 
{
    float:left; display:inline-block; text-align:center; margin-left:5px; padding-right:2px; 
    color:#4d4d4d;
    background:url(/content/fenlei/assets/images/list/sprites.png) no-repeat right -123px;
    height: 25px;line-height: 25px;margin-top:3px;
}
.hytop a:hover 
{
    /*color:#f00;*/
    color:#10ade4;
    text-decoration:none
}
.hytop a span
{
    display: inline-block; font-size:14px;padding: 0 8px 0 10px; 
    background:url(/content/fenlei/assets/images/list/sprites.png) no-repeat 0 -148px;
}
.hytop b 
{
    float:left; display:inline-block; margin-left:5px; width:80px; color:#fff; text-align:center; height:28px; line-height:28px; 
    background:url(/content/fenlei/ui6/yp/hy_03.png) no-repeat;
}
</style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HotSearch" runat="server">
<span id="hot">
    热门搜索：
    <A href="<%=Url.Action("fanyi",new{objecttype=3}) %>">同声传译</A>
    <A href="<%=Url.Action("ZiXunFuWu",new{objecttype=6}) %>">起名/风水</A>
    <A href="<%=Url.Action("kuaidi") %>">快递</A>
    <A href="<%=Url.Action("lvshi") %>">法律咨询</A>
    <A href="<%=Url.Action("yinshua",new{objecttype=8}) %>">包装</A>
    <A href="<%=Url.Action("danbaobaoxiantouzi",new{objecttype=2}) %>">保险</A>
    <A href="<%=Url.Action("zhuce",new{objecttype=1}) %>">公司注册</A> 
</span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Rows" runat="server">
<div class="hytop">
    <a href="<%=Url.Action("Index", "huangye")%>"><span> 黄页首页 </span></a>
    <a href="<%=Url.Action("shenghuo", "huangye")%>"><span> 生活服务 </span></a>
    <b> 商务服务 </b>
    <a href="<%=Url.Action("Index", "jiaoyu")%>"><span> 教育培训 </span></a>
    <a href="<%=Url.Action("lvyouxiuxian", "huangye")%>"><span> 旅游/酒店/签证 </span></a>
    <a href="<%=Url.Action("zhaoshang", "huangye")%>"><span> 招商加盟 </span></a>
    <p><i></i></p>
</div>
<div class="cb">
      <%
        var categories1 = InfoCategory.GetCategory(YellowPageBigType.ShangWu);
        var categories2 = InfoCategory.GetCategory(YellowPageBigType.ZhuceFalvCaiShui);
        var categories = categories1.Union(categories2);
        var lCount = categories.Count() / 2;
        if (categories.Count() % 2 == 1)
        {
            lCount += 1;
        }
        var leftCategories = categories.Take(lCount);
        var rightCategories = categories.Skip(lCount);
    %>
    <div class="l">
    <%
        for (var i = 0; i < leftCategories.Count(); i++)
        {
            var category = leftCategories.ElementAt(i);
            %>
            <h2><a href="<%=Url.Action(category.Code) %>"><%=category.Name %></a></h2>
            <p>
            <%
            if (category.Children != null)
            {
                for (var j = 0; j < category.Children.Count(); j++)
                {
                    var subCategory = category.Children.ElementAt(j) as YellowPageCategory;
                    %>
                    <a href="<%=Url.Action(category.Code, new {objecttype=subCategory.Id })%>"><%=subCategory.Name%></a>
                    <%
                    if (j < category.Children.Count() - 1)
                    {
                        %>
                        <cite>|</cite>
                        <%
                    }
                }
            }
            %>
            </p>
            <%
        }   
    %>
    </div>

    <div class="r">
    <%
        for (var i = 0; i < rightCategories.Count(); i++)
        {
            var category = rightCategories.ElementAt(i);
            %>
            <h2><a href="<%=Url.Action(category.Code) %>"><%=category.Name %></a></h2>
            <p>
            <%
            if (category.Children != null)
            {
                for (var j = 0; j < category.Children.Count(); j++)
                {
                    var subCategory = category.Children.ElementAt(j) as YellowPageCategory;
                    %>
                    <a href="<%=Url.Action(category.Code, new {objecttype=subCategory.Id })%>"><%=subCategory.Name%></a>
                    <%
                    if (j < category.Children.Count() - 1)
                    {
                        %>
                        <cite>|</cite>
                        <%
                    }
                }
            }
            %>
            </p>
            <%
        }   
    %>
    </div>
      
      <%--<div class="l">
      <h2><a href="/xitong/">网络维护及布线</a></h2>
    <p><a href="/wangluoweihuweixiu/">网络维护</a><cite>|</cite><a href="/dnzuzhuang/">电脑组装</a><cite>|</cite><a class="c_r" href="/gqkd/">光纤宽带</a><cite>|</cite><a href="/anfang/">安防监控</a><cite>|</cite><a href="/yingjian/">综合布线</a><cite>|</cite><a href="/xitongjicheng/">系统集成</a><cite>|</cite><a href="/itwaibao/">IT外包</a></p>
      <h2><a href="/pingmian/">设计策划</a> - <a href="/chuanmei/">广告传媒</a></h2>
    <p><a href="/huanjingdm/">店面设计</a><cite>|</cite><a class="c_r" href="/ggcehua/">广告策划</a><cite>|</cite><a href="/gpnhyesheji/">工业设计</a><cite>|</cite><a href="/yingshi/">影视制作</a><cite>|</cite><a href="/pingmiansj/">平面设计</a><cite>|</cite><a href="/mingpian/">名片设计</a><cite>|</cite><a href="/zhhsheji/">装潢设计</a><br /><a href="/visheji/">VI设计</a><cite>|</cite><a href="/pinpai/">品牌策划</a><cite>|</cite><a href="/donghua/">动画设计</a></p>
   <h2><a href="/zhuce/">工商注册</a></h2>
    <p><a class="c_r" href="/gongsizhuce/">公司注册</a><cite>|</cite><a href="/bzheng/">办证咨询</a><cite>|</cite><a href="/haiwaizhuce/">海外公司注册</a><cite>|</cite><a href="/daibanshenpi/">代办审批</a><cite>|</cite><a href="/gongshangnianjian/">工商年检</a></p>
    <h2><a href="/caishui/">财务会计/评估</a></h2>
    <p><a href="/kuaiji/">会计服务</a><cite>|</cite><a href="/dailijizh/">代理记帐</a><cite>|</cite><a class="c_r" href="/caiwushenpi/">财务审计</a><cite>|</cite><a href="/pingu/">评估</a><cite>|</cite><a href="/shuiwuguwen/">税务顾问</a><cite>|</cite><a href="/gongchzaojia/">工程造价</a><cite>|</cite><a href="/yanzi/">验资</a></p>
        <h2><a href="/penhui/">喷绘招牌</a></h2>
    <p><a class="c_r" href="/zpzz/">招牌制作</a><cite>|</cite><a href="/guanggaozp/">广告招牌</a><cite>|</cite><a href="/phui/">喷绘</a><cite>|</cite><a href="/dianzizp/">led制作</a><cite>|</cite><a href="/xisu/">吸塑</a><br />&nbsp;<br />&nbsp;</p>
    <h2><a href="/wuliu/">货运专线</a></h2>
    <p><a class="c_r" href="/guoneizx/">国内货运专线</a><cite>|</cite><a href="/guojizx/">国际货运专线</a></p>
    <h2><a href="/allzhika/">制卡</a></h2>
    <p><a class="c_r" href="/zhika/">pvc卡</a><cite>|</cite><a href="/zhinengka/">智能卡</a><cite>|</cite><a href="/renxiangzhka/">人像证卡</a><cite>|</cite><a href="/zhizhika/">纸卡</a><cite>|</cite><a href="/jinshuka/">金属卡</a></p>
    <h2><a href="/huoyun/">货运物流</a></h2>
    <p><a href="/tuoyun/">托运</a><cite>|</cite><a href="/kcpeihuo/">空车配货</a><cite>|</cite><a href="/huoyundaili/">货运代理</a><cite>|</cite><a href="/kongyun/">航空运输</a><cite>|</cite><a href="/baoguan/">进出口报关</a><cite>|</cite><a class="c_r" href="/ysbz/">仓储</a><cite>|</cite><a href="/lingdan/">全国零担</a></p>
    
    

    
           
      </div>
      <div class="r">
      <h2><a href="/danbaobaoxiantouzi/">担保/保险/投资</a></h2>
    <p><a class="c_r" href="/touzichan/">投资</a><cite>|</cite><a href="/baoxianfuwu/">保险</a><cite>|</cite><a href="/danban/">担保</a></p>
    <h2><a href="/yinshua/">印刷包装</a></h2>
    <p><a href="/zhileiyinshua/">纸类印刷</a><cite>|</cite><a class="c_r" href="/baozhuang/">包装</a><cite>|</cite><a href="/siwangyinshua/">丝网印刷</a><cite>|</cite><a href="/shumayinshua/">数码印刷</a><cite>|</cite><a href="/buganjiao/">不干胶印刷</a><cite>|</cite><a href="/fangweiyinshua/">防伪印刷</a><cite>|</cite><a href="/fuxie/">无碳复写</a><br /><a href="/shoutidai/">包装袋印刷</a></p>
    <h2><a href="/wangzhan/">网站建设/推广</a></h2> 
    <p><a href="/wangzhantg/">网站推广</a><cite>|</cite><a class="c_r" href="/wzjianshe/">网站建设</a><cite>|</cite><a href="/wzyueming/">网站域名</a><cite>|</cite><a href="/wzfuwuqi/">服务器租用</a><cite>|</cite><a href="/zhujitg/">主机托管</a></p>
    <h2><a href="/zixunzhongjie/">咨询</a></h2>
    <p><a href="/diaocha/">调查清债</a><cite>|</cite><a href="/xinlizixun/">心理咨询</a><cite>|</cite><a href="/rczj/">人才/职介</a><cite>|</cite><a class="c_r" href="/kzqm/">起名/风水</a><cite>|</cite><a href="/ggzx/">企业公关</a><cite>|</cite><a href="/hukouzixun/">户口咨询</a></p>
    <h2><a href="/lvshi/">法律咨询</a></h2>
    <p><a href="/susdaili/">刑事辩护</a><cite>|</cite><a href="/falvgewen/">合同纠纷</a><cite>|</cite><a href="/laodong/">劳动纠纷</a><cite>|</cite><a class="c_r" href="/jiating/">婚姻家庭</a><cite>|</cite><a href="/zhishi/">知识产权</a><cite>|</cite><a href="/falvyuanzhu/">法律援助</a><br /><a href="/fangdichanjf/">房地产纠纷</a><cite>|</cite><a href="/jiufen/">商业纠纷</a><cite>|</cite><a href="/jzgc/">建筑工程</a><cite>|</cite><a href="/zhaiwu/">债务债权</a><cite>|</cite><a href="/gsfawu/">公司法务</a><cite>|</cite><a href="/chaiqian/">征地拆迁</a><br /><a href="/jtshigu/">交通事故</a><cite>|</cite><a class="c_r" href="/ylshigu/">医疗事故</a></p>
       <h2><a href="/fanyi/">翻译/速记</a></h2>
    <p><a class="c_r" href="/kouyi/">口译</a><cite>|</cite><a href="/tongsheng/">同声传译</a><cite>|</cite><a href="/suji/">速记</a><cite>|</cite><a href="/bendihua/">本地化翻译</a><cite>|</cite><a href="/biyi/">笔译</a></p>
    <h2><a href="/shangbiaozhli/">商标专利</a></h2>
    <p><a class="c_r" href="/shangbiaozhuce/">商标注册</a><cite>|</cite><a href="/shangbiao/">商标转让</a><cite>|</cite><a href="/zhuanxshenpi/">专项审批</a></p>
    <h2><a href="/kuaidi/">快递</a></h2>
    <p><a class="c_r" href="/gnkuaidi/">国内快递</a><cite>|</cite><a href="/tckuaidi/">同城快递</a><cite>|</cite><a href="/hwkuaidi/">货物快递</a><cite>|</cite><a href="/xiaojian/">小件速递</a><cite>|</cite><a href="/gjkuaidi/">国际快递</a></p>
    
    
    
    
   
    
      </div>--%>
      <div class="clear1"></div>
    </div>

<div id="footer">
    <div class="bg">
        <div id="contact">
            <%--北京市公安局朝阳分局备案编号:0000000000--%>
            <a href="http://www.miibeian.gov.cn/" style="margin-left:20px;">浙ICP备09071137号-4</a><br />
            <%--<div id="flink">﻿﻿
                &nbsp; <a href="#" target="_blank">自动申请链接</a>.
            </div>--%>
            <div class="clear"></div>
        </div>
    </div>
</div>
</asp:Content>
