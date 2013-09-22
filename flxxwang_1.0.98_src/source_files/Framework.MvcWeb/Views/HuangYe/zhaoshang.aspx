<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Index/YellowPageIndex.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Style" runat="server">
<style type="text/css">
body,dl,ol,ul,li,dt,dd,p,h2,h3,h4{margin:0;padding:0;list-style:none;-webkit-text-size-adjust:none}body{font:12px/1.2 Arial, Tahoma, "宋体", sans-serif;color:#333; min-width:1000px}a{color:#0000cc;text-decoration:none;cursor:pointer}
a:hover,#fabu:hover
{
    /*color:#ff0000;*/
    color:#10ade4;
    text-decoration:underline
}
.clear{clear:both;font-size:0;height:0; line-height:1%;overflo:hidden}img{border:none}.fr{float:right}.red,.link_red,#hot a.red{color:#ff0000}.mt{margin-top:10px}.sc{display:block}.hc{display:none}.fr{float:right}#header,.cb,.morelink,#footer{width:1000px;margin:0 auto;clear:both; padding:0; overflow:hidden}#headerinside{height:88px; position:relative; z-index:666}#logo{position:absolute;left:15px;top:10px}#searchbar{position:absolute;left:270px;top:21px; line-height:26px; overflow:hidden}#key{background:url(/Content/Fenlei/Ui6/index/searbut.gif) no-repeat 0 0; height:30px; padding:2px 0; display:inline-block; float:left}#keyword{background:url(/Content/Fenlei/Ui6/index/searbut.gif) no-repeat 0 -2px; width:419px;height:22px; line-height:22px; padding:4px 0; border:none; padding-left:38px; float:left; display:inline-block; overflow:hidden}.keyword{color:#ccc}.keyword2{color:#000}#searchbtn{background:url(/Content/Fenlei/Ui6/index/searbut.gif) no-repeat -557px 0px;width:123px;height:35px; text-align:center;color:#fff; font-size:16px; font-weight:bold; cursor:pointer; overflow:hidden; text-align:center; color:#fff; line-height:33px; padding-bottom:4px;border:none; float:left}#searchbtn.btnal2{text-decoration:underline}#fabu{position:absolute;right:10px;top:21px; background:url(/Content/Fenlei/Ui6/index/searbut.gif) no-repeat -682px 0; width:118px; height:35px; line-height:35px; display:inline-block; font-size:14px; font-weight:bold; color:#000; text-align:center; float:left;cursor:pointer;}#hot{float:left;color:#888; padding-left:10px; display:inline}#hot a{margin-right:19px; color:#888;}.tooltip{width:539px; padding:8px;border:1px solid #dcdadc;background:#fff;margin-top:-4px;line-height:200%}.tooltip ul{width:100%; overflow:hidden}.tooltip li{height:26px;overflow:hidden;padding-left:5px}.tooltip li a{text-decoration:none;color:#666;font-size:13px}.tooltip li a b{color:#002cad}.tooltip li .tool_r{float:right;color:#008000;font-size:11px}.tooltip li.selected a b,.tooltip li.selected a,.tooltip li.selected .tool_r{color:#FFF8D8}.tooltip li.selected{background:#f97d03;cursor:pointer;color:#FFF8D8; padding-right:8px;}.closewindow{float:right;margin:-5px 5px 0 0;}.l{ float:left; width:460px; display:inline; padding-left:15px;margin-right:60px;}.r{ float:left; width:460px;}.cb h2{font-size:14px; border-bottom:1px solid #eee; line-height:30px; height:30px; /*background:url(http://pic2.flxxwang.com/ui6/yp/bgpic.png) no-repeat 0px 8px;padding-left:22px;*/}.cb p{ line-height:24px; padding-bottom:19px;}.cb p a{color:#666;white-space:nowrap}
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
.hytop a{ float:left; display:inline-block; text-align:center; margin-left:5px; padding-right:2px; color:#4d4d4d;background:url(/content/fenlei/assets/images/list/sprites.png) no-repeat right -123px;height: 25px;line-height: 25px;margin-top:3px;}
.hytop a:hover 
{
    /*color:#f00;*/
    color:#10ade4;
    text-decoration:none
}
.hytop a span{display: inline-block; font-size:14px;padding: 0 8px 0 10px; background:url(/content/fenlei/assets/images/list/sprites.png) no-repeat 0 -148px;}
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
    <a href="<%=Url.Action("canyinjia") %>">餐饮加盟</a>
    <a href="<%=Url.Action("canyinjia",new{objecttype=3}) %>">经典小吃</a>
    <a href="<%=Url.Action("fuzhuangjia",new{objecttype=1}) %>">女装加盟</a>
    <a href="<%=Url.Action("meirongbaojian",new{objecttype=1}) %>">化妆品</a>
    <a href="<%=Url.Action("xiangbaojm",new{objecttype=1}) %>">女包</a>
    <a href="<%=Url.Action("jiancaijm") %>">建材</a>
    <a href="<%=Url.Action("jiajuhuanbao",new{objecttype=2}) %>">家居</a> 
</span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Rows" runat="server">
<div class="hytop">
    <a href="<%=Url.Action("Index", "huangye")%>"><span> 黄页首页 </span></a>
    <a href="<%=Url.Action("shenghuo", "huangye")%>"><span> 生活服务 </span></a>
    <a href="<%=Url.Action("shangwu", "huangye")%>"><span> 商务服务 </span></a>
    <a href="<%=Url.Action("Index", "jiaoyu")%>"><span> 教育培训 </span></a>
    <a href="<%=Url.Action("lvyouxiuxian", "huangye")%>"><span> 旅游/酒店/签证 </span></a>
    <b> 招商加盟 </b>
    <p><i></i></p>
</div>


<div class="cb">
    <%
        var categories = InfoCategory.GetCategory(YellowPageBigType.ZhaoShang);
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
            for (var j = 0; j < category.ObjectTypeCollection.Count; j++)
            {
                var objType = category.ObjectTypeCollection[j];
                %>
                <a href="<%=Url.Action(category.Code, new {objecttype=objType.Id })%>"><%=objType.Name%></a>
                <%
                if (j < category.ObjectTypeCollection.Count - 1)
                {
                    %>
                    <cite>|</cite>
                    <%
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
            for (var j = 0; j < category.ObjectTypeCollection.Count; j++)
            {
                var objType = category.ObjectTypeCollection[j];
                %>
                <a href="<%=Url.Action(category.Code, new {objecttype=objType.Id })%>"><%=objType.Name%></a>
                <%
                if (j < category.ObjectTypeCollection.Count - 1)
                {
                    %>
                    <cite>|</cite>
                    <%
                }
            }
            %>
            </p>
            <%
        }   
    %>
    </div>

    <%--<div class="l">
    <h2><a href="/canyinjia/">餐饮加盟</a></h2>
<p><a href="/jingdianxiaochi/" class="c_r">特色小吃</a><cite>|</cite><a href="/kuaicjm/" class="c_r">快餐加盟</a><cite>|</cite><a href="/huogjm/" >火锅加盟</a><cite>|</cite><a href="/chuantshipin/" >面食加盟</a><cite>|</cite><a href="/dangd/" >蛋糕店</a><cite>|</cite><a href="/jiujm/" >酒加盟</a><cite>|</cite><a href="/shishangyinpin/" >冷饮热饮</a><br /><a href="/shaokjm/" >烧烤加盟</a><cite>|</cite><a href="/lucss/" >卤菜熟食</a><cite>|</cite><a href="/xicjm/" >西餐加盟</a><cite>|</cite><a href="/gangjm/" >干锅加盟</a><cite>|</cite><a href="/zhoujm/" >粥店加盟</a> </p>
<h2><a href="/xiejm/">鞋加盟</a></h2>
<p><a href="/ydxxjm/" >运动休闲</a><cite>|</cite><a href="/nvxie/" class="c_r">女鞋</a><cite>|</cite><a href="/tongxjm/" >童鞋</a><cite>|</cite><a href="/pixjm/" >皮鞋</a></p>
   
<h2><a href="/lipinshipin/">礼品饰品</a></h2>
<p><a href="/gongyipin/">工艺品</a><cite>|</cite><a href="/liangyuandian/" class="c_r">两元店</a><cite>|</cite><a href="/lipinjiameng/">礼品加盟</a><cite>|</cite><a href="/hanguoshipin/">韩国饰品</a><cite>|</cite><a href="/shipinjiameng/" >饰品挂件</a><cite>|</cite><a href="/zbyqjm/" >珠宝玉器</a></p>
<h2><a href="/jiajuhuanbao/">家居/环保项目</a></h2>
<p><a href="/tianrannengyuan/" class="c_r">能源环保</a><cite>|</cite><a href="/jiajujiameng/" >床上用品</a><cite>|</cite><a href="/clbyjm/"  >窗帘布艺</a><cite>|</cite><a href="/huanbaocailiao/">净水设备</a><cite>|</cite><a href="/kqqjjm/" >空气清洁</a><cite>|</cite><a href="/tiemo/">贴膜</a></p>
  
<h2><a href="/jixiejiagong/">机械加盟</a></h2>
<p><a href="/scjxjm/" >生产生活</a><cite>|</cite><a href="/spjxjm/" >食品加工</a></a><cite>|</cite><a href="/qczsjm/" class="c_r">汽车装饰</a></a></p>
        
    </div>
      
    <div class="r">
    <h2><a href="/fuzhuangjia/">服装加盟</a></a></h2>
<p><a href="/nvzhuangjia/" class="c_r">女装加盟</a><cite>|</cite><a href="/tongzhuangjia/">童装加盟</a><cite>|</cite><a href="/nanzhuangjm/">男装加盟</a><cite>|</cite><a href="/yundongzhuang/">运动休闲</a><cite>|</cite><a href="/neiyijia/" >内衣泳装</a><br />&nbsp;</p>
<h2><a href="/xiangbaojia/">箱包加盟</a></h2>
<p><a href="/nvbaojm/" class="c_r">女包</a><cite>|</cite><a href="/laganxiangjm/" >拉杆箱</a><cite>|</cite><a href="/qianbaojm/" >钱包</a><cite>|</cite><a href="/beibaojm/" >背包</a><cite>|</cite><a href="/shoubaojm/" >手包</a><cite>|</cite><a href="/yaobaojm/" >腰包</a></p>
<h2><a href="/meirongbaojain/">美容保健</a></h2>
<p><a href="/yangshen/">养生保健</a><cite>|</cite><a href="/huahzuangpin/" class="c_r">化妆品</a><cite>|</cite><a href="/meirongspa/">美容SPA</a></p>
<h2><a href="/jiancaijm/">建材加盟</a></h2>
<p><a href="/dengjjm/" class="c_r">灯具加盟</a><cite>|</cite><a href="/mencjm/"  >门窗加盟</a><cite>|</cite><a href="/cwsbjm/" >厨卫设备</a><cite>|</cite><a href="/bizjm/" class="c_r">壁纸加盟</a><cite>|</cite><a href="/dibjm/" >地板加盟</a><cite>|</cite><a href="/zstljm/"  >装饰涂料</a><cite>|</cite><a href="/scbcjm/" >石材板材</a></p>
<h2><a href="/ganxijm/">干洗加盟</a>&nbsp;&nbsp;-&nbsp;&nbsp;<a href="/jiaoyuertong/">教育项目</a></h2>
      
    </div>--%>
    <div class="clear1"></div>
</div>

<div id="footer">
    <div class="bg">
        <div id="contact">
        <%--北京市公安局朝阳分局备案编号:0000000000--%>
            <a href="http://www.miibeian.gov.cn/" style="margin-left:20px;">浙ICP备09071137号-4</a> <br />
            <div id="flink">﻿﻿
                <strong>友情链接</strong>:
                <a href='http://www.jswyz.com' target='_blank'>金沙湾野战基地</a>&nbsp;
                <a href='http://www.eachseo.com' target='_blank'>上海注册公司</a>&nbsp;
                <a href='http://www.chinanmg.com' target='_blank'>北京信用卡提现</a>&nbsp;
                <a href='http://bbs.hbzkw.com' target='_blank'>湖北自考网</a>&nbsp;
                <a href='http://ye.anxjm.com/' target='_blank'>母婴幼儿加盟</a>&nbsp;
                <a href='http://www.lysd888.net/' target='_blank'>沈阳旅行社</a>&nbsp;
                <a href='http://www.gzaur.com/' target='_blank'>会议桌牌</a>&nbsp;
                <a href='http://www.lntu365.com/' target='_blank'>沈阳旅游</a>&nbsp;
                <a href='http://www.sztyqh.com' target='_blank'>苏州乐器培训</a>&nbsp;
                <a href='http://www.chnche.com' target='_blank'>平板运输车</a>&nbsp;
                <a href='http://house.longchengjie.com/' target='_blank'>柳州房产网</a>&nbsp;
                <a href='http://blog.bolin.org.cn/' target='_blank'>柏林博客</a>&nbsp;
                <a href='http://baotou.city8.com' target='_blank'>包头地图</a>&nbsp;  
                <%--<a href="/link.html" target="_blank">更多...</a>&nbsp; --%>
                <%--<a href="#" target="_blank">自动申请链接</a>.--%>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
</asp:Content>
