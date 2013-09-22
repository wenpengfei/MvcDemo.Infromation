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
.hytop b{ float:left; display:inline-block; margin-left:5px; color:#fff; height:28px; line-height:28px; background:url(/content/fenlei/ui6/yp/hy_03.png) no-repeat left; padding-left:10px;}.hytop b span{background:url(/content/fenlei/ui6/yp/hy_03.png) no-repeat right; padding-right:10px; display:inline-block;}
</style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HotSearch" runat="server">
<span id="hot">
    热门搜索：
    <A href="<%=Url.Action("GangAoTaiYou",new{objecttype=1}) %>">港澳旅游</A>
    <A href="<%=Url.Action("GangAoTaiYou",new{objecttype=2}) %>">台湾旅游</A>
    <A href="<%=Url.Action("guojilvyou",new{objecttype=3}) %>">欧洲</A>
    <A href="<%=Url.Action("guojilvyou",new{objecttype=4}) %>">澳洲</A>
    <A href="<%=Url.Action("jdyd",new{objecttype=2}) %>">经济型酒店</A>
    <A href="<%=Url.Action("dujia",new{objecttype=3}) %>">农家乐</A>
    <A href="<%=Url.Action("visa",new{objecttype=1}) %>">旅游签证</A> 
</span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Rows" runat="server">
<div class="hytop">
    <a href="<%=Url.Action("Index", "huangye")%>"><span> 黄页首页 </span></a>
    <a href="<%=Url.Action("shenghuo", "huangye")%>"><span> 生活服务 </span></a>
    <a href="<%=Url.Action("shangwu", "huangye")%>"><span> 商务服务 </span></a>
    <a href="<%=Url.Action("Index", "jiaoyu")%>"><span> 教育培训 </span></a>
    <b><span>旅游/酒店/签证</span></b>
    <a href="<%=Url.Action("zhaoshang", "huangye")%>"><span> 招商加盟 </span></a>
    <p><i></i></p>
</div>
<div class="cb">
    <%
        var categories = InfoCategory.GetCategory(YellowPageBigType.LvYouXiuXian);
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
      <h2><a href="/zhoubianyou/">周边游</a> - <a href="/lvyouxianlu/">国内旅游</a></h2> 
    <p><a href="/yiriyou/">一日游</a><cite>|</cite> 
      <a href="/erriyou/">二日游</a><cite>|</cite> 
      <a href="/sanriyou/">三日及以上</a></p>
    <h2><a href="/guojilvyou/">国际旅游</a> - <a href="/lvyou/">旅行社</a></h2>
    <p><a href="/dongnanya/">东南亚</a><cite>|</cite><a href="/rbhg/">日韩</a><cite>|</cite><a href="/ouzhou/">欧洲</a><cite>|</cite><a href="/aozhou/">澳洲</a><cite>|</cite><a href="/fzzd/">非洲中东</a><cite>|</cite><a href="/meizhouyou/">美洲</a></p>
    <h2><a href="/visa/">代办签证/签注</a></h2>
    <p><a href="/qzheng/">旅游签证</a><cite>|</cite><a href="/shangwuvisa/">商务工作签证</a><cite>|</cite><a href="/qianzhu/">港澳台签注</a><cite>|</cite><a href="/tanqinvisa/">探亲访友签证</a></p></div>
      <div class="r">
      <h2><a href="/jdyd/">酒店预订/住宿</a></h2>
    <p><a href="/jingjijiudian/">经济型酒店</a><cite>|</cite><a href="/zhusu/">特价住宿</a><cite>|</cite><a href="/hotel/">星级酒店</a><cite>|</cite><a href="/bgldzds/">宾馆/旅店/招待所</a></p>
    <h2><a href="/dujia/">度假村/农家乐</a></h2>
    <p><a href="/wenquandujiacun/">温泉度假村</a><cite>|</cite><a href="/nongjiale/">农家乐</a><cite>|</cite><a href="/zhoubiandujiacun/">周边度假村</a><cite>|</cite><a href="/caizhai/">采摘</a></p>
       <h2><a href="/gangaotai/">港澳台游</a></h2>
    <p><a href="/gangao/">港澳旅游</a><cite>|</cite> 
      <a href="/taiwanyou/">台湾旅游</a></p></div>--%>
      <div class="clear1"></div>
    </div>

<div id="footer">
    <div class="bg"><div id="contact">
        <%--北京市公安局朝阳分局备案编号:0000000000--%>
        <a href="http://www.miibeian.gov.cn/" style="margin-left:20px;">浙ICP备09071137号-4</a><br />
        <div id="flink">﻿﻿
            &nbsp; 
           <%-- <a href="#" target="_blank">自动申请链接</a>.--%>
        </div>
        <div class="clear"></div>
    </div>
</div>
</div>
</asp:Content>
