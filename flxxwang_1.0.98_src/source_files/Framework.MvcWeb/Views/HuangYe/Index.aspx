<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Index/YellowPageIndex.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Style" runat="server">
<%var city = ViewData["City"] as City; %>
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
.clear{clear:both;font-size:0;height:0;overflow:hidden}
img{border:none}
.fr{float:right}
.red,.link_red,#hot a.red{color:#ff0000}
.mt{margin-top:10px}
.sc{display:block}
.hc{display:none}
.fl{float:left}
#headerinside,.cb,.morelink,#footer{width:1000px;margin:0 auto;clear:both; padding:0; overflow:hidden}
#headerinside{height:78px; position:relative; z-index:666}
#logo{position:absolute;left:15px;top:10px}
#searchbar{position:absolute;left:270px;top:21px; line-height:26px; overflow:hidden}
#key{background:url(/content/fenlei/ui6/index/searbut.gif) no-repeat 0 0; height:30px; padding:2px 0; display:inline-block; float:left}
#keyword{background:url(/content/fenlei/ui6/index/searbut.gif) no-repeat 0 -2px; width:419px;height:22px; line-height:22px; padding:4px 0; border:none; padding-left:38px; float:left; display:inline-block; overflow:hidden}
.keyword{color:#ccc}
.keyword2{color:#000}
#searchbtn{background:url(/content/fenlei/ui6/index/searbut.gif) no-repeat -557px 0px;width:123px;height:35px; text-align:center;color:#fff; font-size:16px; font-weight:bold; cursor:pointer; overflow:hidden; text-align:center; color:#fff; line-height:33px; padding-bottom:4px;border:none; float:left}
#searchbtn.btnal2{text-decoration:underline}
#fabu{position:absolute;right:10px;top:21px; background:url(/content/fenlei/ui6/index/searbut.gif) no-repeat -682px 0; width:118px; height:35px; line-height:35px; display:inline-block; font-size:14px; font-weight:bold; color:#000; text-align:center; float:left;cursor:pointer;}
#hot a{margin-left:10px; color:#888; display:none}
.tooltip{width:439px; padding:8px;border:1px solid #dcdadc;background:#fff;margin-top:-4px;line-height:200%}
.tooltip ul{width:100%; overflow:hidden}
.tooltip li{height:26px;overflow:hidden;padding-left:5px}
.tooltip li a{text-decoration:none;color:#666;font-size:13px}
.tooltip li a b{color:#002cad}
.tooltip li .tool_r{float:right;color:#008000;font-size:11px}
.tooltip li.selected a b,.tooltip li.selected a,.tooltip li.selected .tool_r{color:#FFF8D8}
.tooltip li.selected{background:#f97d03;cursor:pointer;color:#FFF8D8; padding-right:8px}
.closewindow{float:right;margin:-5px 5px 0 0}.cb .c_b{height:579px; *height:579px; height:578px\0}
.c_b{width:189px;overflow:hidden; float:left;line-height:30px;color:#bebebe;overflow:hidden;font-size:14px; margin-top:-5px; padding-left:10px;border-right:1px solid #f1f1f1}
.pr0{border-right:none}h2 span.fr a{font-weight:lighter; font-size:12px; padding-right:10px}
.cb h2
{
    background:url(/content/fenlei/ui6/yp/yppic.png) no-repeat 10px 10px;
    font-family:Verdana,"宋体";font-size:14px; padding:3px 0 0 32px; margin-top:5px; margin-left:-10px; color:#666;border-top:1px solid #f1f1f1; overflow:hidden}
.c_b a{font-size:14px}.cb h2 a{color:#000}
.c_b h2 a{padding:0px}
#tuanlink{float:right; color:#ff0000; padding-right:8px}
.c_b em{font-style:normal; display:inline-block; width:90px}
.cb_ul h3,#listinfo h3{font-size:14px; line-height:26px; color:#0000cc;margin:0; padding:0; margin-top:4px; font-size:14px}
.morelinkinside{padding:2px 10px;border-bottom:solid 1px #f1f1f1;border-top:solid 1px #f1f1f1; height:30px; line-height:30px; margin-top:10px;overflow:hidden;}
.morelinkinside strong{float:left;}
.morelinkinside li{float:left; margin-right:15px; list-style-type:none}
#footer .bg{text-align:center; color:#bebebe; line-height:26px;}
#footer a{color:#666; font-weight:400}#footer a.fc{ color:#00c}
#flink a{margin:0 0 0 5px; white-space:nowrap\0; color:#bebebe; display:inline-block\0}
#flink a:hover{text-decoration:none}

/*yp*/
.cb h3{padding:20px 10px 5px 10px; margin-bottom:5px; font-size:14px;}
.cb_ul{width:470px; height:120px; padding:0px 0px 0px 2px; margin-top:0px; margin-bottom:18px; float:left; overflow:hidden}
.cb_ul li{float:left; width:50%; font-size:14px; line-height:220%}
#footer .bg{padding:10px;text-align:center; line-height:180%; border-top:solid 1px #f1f1f1;}
#footer #flink{margin-top:5px; line-height:20px}
.h10{ height:10px; line-height:1%; font-size:1%;}
/* ntTips for nTalker */
.ntTips{width:170px}
.ntTips_con{ background: #FFFBCC url() no-repeat 0px -9999px; padding:5px 20px 5px 5px;}
.ntTips_con .num{ color:#FD7A0E; font:bold 14px Arial, sans-serif; margin-right:3px;}
.ntTips_con a{ text-decoration:none;}
.cb .ypic2{background-position:10px -26px;background-position:10px -27px\0}
.cb .ypic3{background-position:10px -60px}
.cb .ypic4{background-position:10px -97px}
.cb .ypic5{background-position:10px -134px}
.cb .ypic6{background-position:10px -170px}
.cb .ypic7{background-position:10px -206px;background-position:10px -207px\0}
.cb .ypic8{background-position:10px -243px; padding-left:32px}
.cb .ypic9{background-position:10px -279px}
.history{width:27px;font-size:12px;position:fixed; left:50%; margin-left:500px;bottom:166px;_position:absolute;_top:expression(eval(document.documentElement.scrollTop+166));}
*html,*html body{background-image:url(about:blank);background-attachment:fixed;}
*html .history{position:absolute;bottom:auto;top:expression(eval(document.documentElement.scrollTop))+166;}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Rows" runat="server">
<%var city = ViewData["City"] as City; %>
<div class="cb" id="hyts">
    <div style="background:#f7f7f7; width:998px;  margin:2px 0 15px 2px;">
        <div style="background:#fbfbfb; width:976px; padding:5px 10px; border:1px solid #dddddd; position:relative; top:-2px; margin-left:-2px; line-height:26px; font-size:14px; overflow:hidden">
            <span style="color:#10ace5; font-size:20px; _font-size:13px; _font-weight:bold; font-weight:bold; float:right; display:inline-block; cursor:pointer" onclick="document.getElementById('hyts').style.display='none'">&times;</span>
            <b><%=city.ShortName %>黄页</b> &nbsp;&nbsp;作为本地最有影响力的生活服务平台，直接面对老百姓需求，提供 
            <a href="<%=Url.Action("banjia") %>">搬家</a>、
            <a href="<%=Url.Action("jiazheng") %>" >家政</a>、
            <a href="<%=Url.Action("wuliu") %>">物流</a>、
            <a href="<%=Url.Action("zuche") %>">租车</a>、
            <a href="<%=Url.Action("hunqing") %>">婚庆</a>、
            <a href="<%=Url.Action("zhuangxiu") %>" >维修</a> 等多个生活服务领域信息。
        </div>
    </div>
</div>

<div class="cb">
    <div id="toptuanad"></div><!-- class begin2011-->
    <div class="c_b">
        <h2 class="ypic1"><a href="<%=Url.Action("shenghuo")%>">生活服务</a></h2>
        <%
            var shengHuoCategories = InfoCategory.GetCategory(YellowPageBigType.ShengHuo);
            for (var i = 0; i < shengHuoCategories.Count(); i++)
            {
                var item = shengHuoCategories.ElementAt(i);
                %>
                <a href="<%=Url.Action(item.Code) %>"><%=item.Name %></a><br />
                <%
                
            } 
        %>    
        <%--<a href="/banjia/">搬家</a> | <a href="/gongsibanjia/">公司搬家</a><br />
        <a href="/baomu/">家政</a> | <a href="/bmu/">保姆</a><br />
        <a href="/baojie/">保洁</a> | <a href="/kaihuangbaojie/">开荒保洁</a><br />
        <a href="/shutong/">管道疏通</a><br />
        <a href="/huishou/">二手回收</a><br />
        <a href="/zuche/">租车</a> | <a href="/shangwuzuche/">商务租车</a><br />
        <a href="/zulin/">租赁</a> | <a href="/jixiezulin/">机械设备租赁</a><br />
        <a href="/lipinxianhua/">礼品/鲜花</a><br />
        <a href="/songshui/">生活配送</a> | <a href="/sshui/">送水</a><br />
        <a href="/tesecanyin/">餐饮</a> | <a href="/kuaican/">快餐/外卖</a><br />
        <a href="/shipinlei/">食品</a><br />
        <a href="/yulecs/">娱乐休闲</a><br />
        <a href="/meitishou/">美发/美体</a><br />
        <a href="/jianshen/">运动健身</a><br />
        <a href="/huwaiyundong/">户外</a><br />
        <a href="/zhuankeyiy/">专科医院</a><br />
        <a href="/qtfuwu/">其他生活服务</a><br />--%>
    </div>
    <div class="c_b">
        <h2 class="ypic2"><a href="<%=Url.Action("shangwu")%>">商务服务</a></h2>
        <%
            var shangwuCategories = InfoCategory.GetCategory(YellowPageBigType.ShangWu);
            for (var i = 0; i < shangwuCategories.Count(); i++)
            {
                var item = shangwuCategories.ElementAt(i);
                %>
                <a href="<%=Url.Action(item.Code) %>"><%=item.Name %></a><br />
                <%
                
            } 
        %>  
        <%--<a href="/pingmian/">设计策划</a><br />
        <a href="/fanyi/">翻译/速记</a><br />
        <a href="/chuanmei/">广告传媒</a><br />
        <a href="/wangzhan/">网站建设/推广</a><br />
        <a href="/xitong/">网络维护及布线</a><br />
        <a href="/zixunzhongjie/">咨询服务</a> | <a href="/kuaidi/">快递</a><br />
        <a href="/huoyun/">物流服务</a> | <a href="/wuliu/">货运专线</a><br />
        <a href="/yinshua/">印刷包装</a><br />
        <a href="/penhui/">喷绘招牌</a> | <a href="/allzhika/">制卡</a><br />--%>
        <h2 class="ypic3">维修/装修</h2>
        <%
            var weiXiuCategories = InfoCategory.GetCategory(YellowPageBigType.WeiXiuZhuangXiu);
            for (var i = 0; i < weiXiuCategories.Count(); i++)
            {
                var item = weiXiuCategories.ElementAt(i);
                %>
                <a href="<%=Url.Action(item.Code) %>"><%=item.Name %></a>
                <%
                if (i % 2 == 0 && i < weiXiuCategories.Count() - 1)
                {
                    %>
                    |
                    <%
                }
                else if (i % 2 == 1 && i < weiXiuCategories.Count() - 1)
                {
                    %>
                    <br />
                    <%
                }
            } 
        %>
        <%--<a href="/dianqi/">家电维修</a> | <a href="/kongtiao/">空调维修</a><br />
        <a href="/weixiu/">电脑维修</a><br />
        <a href="/bgsbwx/">办公设备维修</a><br />
        <a href="/jiajuweixiu/">家居维修</a> | <a href="/kaisuo/">开锁换锁</a><br />
        <a href="/zhuangxiu/">装修装饰</a><br />
        <a href="/fangweixiu/">房屋维修/防水</a><br />
        <a href="/jiancai/">建材</a><br />--%>
    </div>
    <div class="c_b">
        <h2 class="ypic4"><a href="<%=Url.Action("lvyouxiuxian")%>">旅游/住宿</a></h2>
        <%
            var lvyouxiuxianCategories = InfoCategory.GetCategory(YellowPageBigType.LvYouXiuXian);
            for (var i = 0; i < lvyouxiuxianCategories.Count(); i++)
            {
                var item = lvyouxiuxianCategories.ElementAt(i);
                %>
                <a href="<%=Url.Action(item.Code) %>"><%=item.Name %></a><br />
                <%
                
            } 
        %> 
        <%--<a href="/lvyou/">旅行社</a><br />
        <a href="/lvyouxianlu/">国内旅游线路</a><br />
        <a href="/guojilvyou/">出国旅游线路</a><br />
        <a href="/gangaotai/">港澳台游</a><br />
        <a href="/zhoubianyou/">周边游</a><br />
        <a href="/dujia/">度假村/农家乐</a><br />
        <a href="/jipiao/">特价机票</a><br />
        <a href="/jdyd/">酒店预订</a><br />
        <a href="/visa/">代办签证/签注</a><br />--%>
        <h2 class="ypic5">公司注册/法律/财税</h2>
        <%
            var zhuceCategories = InfoCategory.GetCategory(YellowPageBigType.ZhuceFalvCaiShui);
            for (var i = 0; i < zhuceCategories.Count(); i++)
            {
                var item = zhuceCategories.ElementAt(i);
                %>
                <a href="<%=Url.Action(item.Code) %>"><%=item.Name %></a><br />
                <%
                
            } 
        %> 
        <%--<a href="/zhuce/">工商注册</a><br />
        <a href="/gongsizhuce/">公司注册</a><br />
        <a href="/lvshi/">法律咨询</a><br />
        <a href="/danbaobaoxiantouzi/">担保/保险/投资</a><br />
        <a href="/caishui/">财务会计/评估</a><br />
        <a href="/shangbiaozhli/">商标专利</a><br /><br />--%>
    </div>      
    <div class="c_b">
        <h2 class="ypic6"><a href="<%=Url.Action("Index","jiaoyu")%>">教育培训</a></h2> 
        <a href="<%=Url.Action("fudao", "jiaoyu")%>">家教</a><br />
        <a href="<%=Url.Action("liuxue", "jiaoyu")%>">留学</a> | 
        <a href="<%=Url.Action("liuxue", "jiaoyu",new{objecttype=1})%>">移民</a> | 
        <a href="<%=Url.Action("liuxue", "jiaoyu",new{objecttype=15})%>">留学/移民签证</a><br />
        <a href="<%=Url.Action("waiyu", "jiaoyu")%>">外语培训</a><br />
        <a href="<%=Url.Action("mba", "jiaoyu")%>">管理/MBA</a><br />
        <a href="<%=Url.Action("youjiao", "jiaoyu")%>">婴幼儿教育</a><br />
        <a href="<%=Url.Action("xueli", "jiaoyu")%>">学历教育</a><br />
        <a href="<%=Url.Action("jisuanji", "jiaoyu")%>">IT培训</a> | 
        <a href="<%=Url.Action("shejipeixun", "jiaoyu")%>">设计培训</a><br />
        <a href="<%=Url.Action("techang", "jiaoyu")%>">文艺/体育</a><br />
        <a href="<%=Url.Action("zhiyepeix", "jiaoyu")%>">职业技能培训</a><br />
        <a href="<%=Url.Action("zhiyepeix", "jiaoyu",new{objecttype=4})%>">资格认证</a> | 
        <a href="<%=Url.Action("zhiyepeix", "jiaoyu",new{objecttype=13})%>">技能培训</a><br />
        <h2 class="ypic7">便民服务</h2>
        <%
            var bianminCategory = InfoCategory.GetCategory(YellowPageBigType.BianMin).ElementAt(0);
            for (var i = 0; i < bianminCategory.ObjectTypeCollection.Count; i++)
            {
                var item = bianminCategory.ObjectTypeCollection[i];
                %>
                <a href="<%=Url.Action("BianMin",new{objecttype=item.Id}) %>"><%=item.Name %></a>
                <%
                if (i % 2 == 0 && i < bianminCategory.ObjectTypeCollection.Count - 1)
                {
                    %>
                    |
                    <%
                }
                else if (i % 2 == 1 && i < bianminCategory.ObjectTypeCollection.Count - 1)
                {
                    %>
                    <br />
                    <%
                }
            } 
        %> 
        <%--<a href="/yinhang/">银行</a> | <a href="/jinrongjg/">金融机构</a><br />
        <a href="/youjutx/">邮局通讯</a> | <a href="/jiadianmc/">家电卖场</a><br />
        <a href="/yiyuan/">医院</a> | <a href="/yaodian/">药店</a><br />
        <a href="/shudian/">书店</a> | <a href="/shangchang/">商场</a><br />
        <a href="/chaoshibld/">超市便利店</a> | <a href="/jiayouzhan/">加油站</a><br />
        <a href="/zilaishui/">自来水/电力营业厅</a><br />--%>
    </div>
    <div class="c_b pr0">
        <h2 class="ypic8"><a href="<%=Url.Action("zhaoshang")%>">招商加盟</a></h2>
        <%
            var zhaoshangCategories = InfoCategory.GetCategory(YellowPageBigType.ZhaoShang);
            for (var i = 0; i < zhaoshangCategories.Count(); i++)
            {
                var item = zhaoshangCategories.ElementAt(i);
                %>
                <a href="<%=Url.Action(item.Code) %>"><%=item.Name %></a><br />
                <%
            } 
        %>
        <%--<a href="/canyinjia/">餐饮加盟</a><br />
        <a href="/fuzhuangjia/">服装加盟</a><br />
        <a href="/lipinshipin/">礼品饰品</a><br />
        <a href="/jixiejiagong/">机械加盟</a><br />
        <a href="/jiajuhuanbao/">家居/环保项目</a><br />
        <a href="/jiaoyuertong/">教育项目</a><br />
        <a href="/meirongbaojain/">美容保健</a><br />
        <a href="/xiejm/">鞋加盟</a><br /> 
        <a href="/jiancaijm/">建材加盟</a><br /> 
        <a href="/ganxijm/">干洗加盟</a><br />
        <a href="/qitajiameng/">其他加盟</a><br />--%>
        <h2 class="ypic9">婚庆服务</h2>
        <%
            var hunqingCategories = InfoCategory.GetCategory(YellowPageBigType.HunQing);
            for (var i = 0; i < hunqingCategories.Count(); i++)
            {
                var item = hunqingCategories.ElementAt(i);
                %>
                <a href="<%=Url.Action(item.Code) %>"><%=item.Name %></a>
                <%
                if (i % 2 == 0 && i < hunqingCategories.Count() - 1)
                {
                    %>
                    |
                    <%
                }
                else if (i % 2 == 1 && i < hunqingCategories.Count() - 1)
                {
                    %>
                    <br />
                    <%
                }
            } 
        %>
        <%--<a href="/hunqing/">婚庆</a> | <a href="/lifu/">婚纱礼服</a><br />
        <a href="/hunsha/">摄影摄像</a> | <a href="/hunshasy/">婚纱摄影</a><br />
        <a href="/huizhan/">礼仪庆典</a> | <a href="/huizhanlan/">展览展会</a><br />--%>
   </div>
    <div class="clear" style="border-bottom:1px solid #f1f1f1"></div><!-- class end -->
    <%--<h3>
        <a href="http://www.flxxwang.com/allproduct.html" style="margin-right:411px; float:right">推荐信息</a>
        <a href="http://hz.flxxwang.com.cn/">关于网邻通：生活服务网邻通是<%=SiteInfo.Name%>的企业会员身份...</a>
    </h3> 
    <div style="width:516px; color:#333; font-size:12px; line-height:200%; padding-top:9px;border-right:1px solid #fff; float:left">
 	    <a href="http://hz.flxxwang.com.cn/">
            <img src="http://pic2.flxxwang.com/n/images/wlt/hygywlt.jpg" border="0" align="left" style="margin:0px 10px 10px 0px;" />
        </a>
 	    300M网站虚拟主机空间<br />全面展示公司形象及产品服务<br />企业信息在flxxwang.com列表页优先展示
        <div class="clear"></div>
    </div>
    <div class="cb_ul">
        <ul>
            <li><a href="http://about.flxxwang.com/70.html">如何申请网邻通</a></li>
            <li><a href="http://about.flxxwang.com/102.html">网邻通信息优先介绍</a></li>
            <li><a href="http://about.flxxwang.com/73.html">信息排序优先常见问题</a></li>
            <li><a href="http://about.flxxwang.com/14.html">怎样注册成为用户</a></li>
            <li><a href="http://about.flxxwang.com/89.html"><%=SiteInfo.Name%>信息质量控制规定</a></li>
            <li><a href="http://about.flxxwang.com/20.html"><%=SiteInfo.Name%>常见图表说明</a></li>
        </ul>
    </div>--%>
    <div class="clear"></div>  
</div>

<div id="footer">
    <div class="bg">
        <div id="contact">
            <%--京公网安备0000000000号--%>
            <a href="http://www.miibeian.gov.cn/" style="margin-left:20px;">浙ICP备09071137号-4</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="<%=Url.Action("hylist") %>" class="fc">黄页导航</a><br />
            <div id="flink">﻿
                <strong>友情链接</strong>:
                <a href='http://www.71sm.com/' target='_blank'>企业商贸网</a>&nbsp;
                <a href='http://www.regltd.com/' target='_blank'>注册香港公司</a>&nbsp;
                <a href='http://www.flxxwang.com/sh/fudao/' target='_blank'>上海家教</a>&nbsp;
                <%--<a href='http://www.flxxwang.com/sh/xianhuasudi/' target='_blank'>上海礼品公司</a>&nbsp;  --%>
                <%--<a href="/link.html" target="_blank">更多...</a>&nbsp;--%>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>


<%--<div class="history" >
    <a href="http://www.sojump.com/jq/1077488.aspx" target="_blank">
        <img src="http://pic2.flxxwang.com/ui6/yp/wenjuan.png" />
    </a>
</div>--%>
</asp:Content>
