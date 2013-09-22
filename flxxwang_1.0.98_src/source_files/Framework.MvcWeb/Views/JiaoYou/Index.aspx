<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%var city = ViewData["City"] as City; %>
<title>【<%=city.ShortName %>交友|<%=city.ShortName %>交友网|<%=city.ShortName %>同城交友信息】 - <%=city.ShortName %><%=SiteInfo.Name%></title>
<meta name="Keywords" content="<%=city.ShortName %>交友,<%=city.ShortName %>交友网,<%=city.ShortName %>同城交友,<%=city.ShortName %>交友中心" />
<meta name="Description" content="flxxwang.com<%=city.ShortName %>交友网为您提供大量<%=city.ShortName %>白领交友，同城交友，找女朋友，找男朋友，<%=city.ShortName %>征婚，征婚启示信息等<%=city.ShortName %>本地交友信息。" /> 
<link type="text/css" rel="stylesheet" href="/Content/Fenlei/ui6/index/categories.css" />  
<script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/boot_toplist_version.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<%var city = ViewData["City"] as City; %>
<div id="header">
    <div id="headerinside">
        <div id="logo">
            <a href="<%=Url.Action("Default","Home") %>" target="_self">
                <img src="/Content/Fenlei/assets/images/logo/logo.gif" alt="中文最大生活信息门户"/>
            </a>
            <span>
                <a href="" target="_self"><b>交友征婚</b></a>
            </span>
        </div>
        <%--<form onsubmit='b_query();return false;'>
            <div id="searchbar" class="catec">
                <i id="key">
                    <input type="text" id="keyword" name="key" class="keyword" fdv="可输入职业，家乡，技能等" autocomplete="off" />
                </i>
                <i class="jobbtn">
                    <input  type="submit" name="button" class="btnall" id="searchbtn" value="搜索" onmousemove="this.className='btnal2'" onmouseout="this.className=''" />
                </i>
            </div>
        </form>--%>
        <a href="<%=Url.Action("s2","post",new{values="jiaoyou"}) %>" id="fabu">免费发布信息</a>
    </div>
</div>

<div class="wrap contop">
	<ul class="sixclass">
    	<li>
            <h2>
                <%--<a href="http://jiaoyou.flxxwang.com/hz/mm/">找女友</a>/
                <a href="http://jiaoyou.flxxwang.com/hz/gg/">找男友</a>/--%>
                <a href="<%=Url.Action("nvyou")%>">交友</a>
            </h2>
            <table class="sort" cellpadding="0" cellspacing="0">
            	<tr>
                	<th width="9%">性别：</th>
                    <td width="91%">
                        <a href="<%=Url.Action("nvyou", new {sex=1 })%>">帅哥</a> &nbsp; 
                        <a href="<%=Url.Action("nvyou", new {sex=0 })%>">美女</a>
                    </td>
                </tr>
                <tr>
                	<th>年龄：</th>
                    <td>
                        <a href="<%=Url.Action("nvyou", new {minage=18,maxage=22 })%>">18-22</a> &nbsp; 
                        <a href="<%=Url.Action("nvyou", new {minage=22,maxage=26 })%>">22-26</a> &nbsp; 
                        <a href="<%=Url.Action("nvyou", new {minage=27,maxage=31 })%>">27-31</a> &nbsp; 
                        <a href="<%=Url.Action("nvyou", new {minage=32,maxage=36 })%>">32-36</a> &nbsp; 
                        <a href="<%=Url.Action("nvyou", new {minage=37,maxage=40 })%>">37-40</a> &nbsp; 
                        <a href="<%=Url.Action("nvyou", new {minage=40,maxage=-1 })%>">40岁以上</a>
                    </td>
                </tr>
                <tr>
                	<th>图片：</th>
                    <td>
                        <a href="<%=Url.Action("nvyou", new {sex=1,pic=1 })%>">帅哥图片</a> &nbsp; 
                        <a href="<%=Url.Action("nvyou", new {sex=0,pic=1 })%>">美女图片</a>
                    </td>
                </tr>
                <%--<tr>
                	<th>职业：</th>
                    <td>
                        <a href="#">在校学生</a> &nbsp; 
                        <a href="#">上班族</a> &nbsp; 
                        <a href="#">高级管理者</a> &nbsp; 
                        <a href="#">老板</a> &nbsp; 
                        <a href="#">自由职业者</a> &nbsp; 
                        <a href="#">失业中</a>
                    </td>
                </tr>--%>
            </table>
        </li>
    	<li style="height:118px">
            <h2><a href="http://www.jiayuan.com/">征婚</a></h2>
            <table class="sort" cellpadding="0" cellspacing="0">
            	<tr>
                	<th width="9%">性别：</th>
                    <td width="91%">
                        <a href="http://search.jiayuan.com/result.php">帅哥</a> &nbsp; 
                        <a href="http://search.jiayuan.com/result.php">美女</a>
                    </td>
                </tr>
                <tr>
                	<th>年龄：</th>
                    <td>
                        <a href="http://search.jiayuan.com/result.php">18-22</a> &nbsp; 
                        <a href="http://search.jiayuan.com/result.php">22-26</a> &nbsp; 
                        <a href="http://search.jiayuan.com/result.php">27-31</a> &nbsp; 
                        <a href="http://search.jiayuan.com/result.php">32-36</a> &nbsp; 
                        <a href="http://search.jiayuan.com/result.php">37-40</a> &nbsp; 
                        <a href="http://search.jiayuan.com/result.php">40岁以上</a>
                    </td>
                </tr>
                <tr>
                	<th>图片：</th>
                    <td>
                        <a href="http://search.jiayuan.com/result.php">帅哥图片</a> &nbsp; 
                        <a href="http://search.jiayuan.com/result.php">美女图片</a>
                    </td>
                </tr>
            </table>
        </li>
        <div class="clear"></div>
        <li>
            <h2><a href="<%=Url.Action("laoxiang")%>">同乡会</a></h2>
            <table class="sort" cellpadding="0" cellspacing="0">
            	<tr>
                	<th width="9%">家乡：</th>
                    <td width="91%">
                        <%
                            for(var i=0;i<Province.Provinces.Count;i++)
                            {
                                var item = Province.Provinces[i];
                                %>
                                <a href="<%=Url.Action("laoxiang")%>"><%=item.ShortName %></a> &nbsp;
                                <%
                                if (i % 10 == 9)
                                {
                                    %>
                                    <br />
                                    <%
                                }
                            }
                        %>
                        <%--<a href="/laoxiang/c1/">北京</a> &nbsp; 
                        <a href="/laoxiang/c2/">天津</a> &nbsp; 
                        <a href="/laoxiang/c3/">河北</a> &nbsp; 
                        <a href="/laoxiang/c4/">山西</a> &nbsp; 
                        <a href="/laoxiang/c5/">内蒙古</a> &nbsp; 
                        <a href="/laoxiang/c6/">辽宁</a> &nbsp; 
                        <a href="/laoxiang/c7/">吉林</a> &nbsp; 
                        <a href="/laoxiang/c8/">黑龙江</a> &nbsp; 
                        <a href="/laoxiang/c9/">上海</a> &nbsp; 
                        <a href="/laoxiang/c10/">江苏</a><br />
                        <a href="/laoxiang/c11/">浙江</a> &nbsp; 
                        <a href="/laoxiang/c12/">安徽</a> &nbsp; 
                        <a href="/laoxiang/c13/">福建</a> &nbsp; 
                        <a href="/laoxiang/c14/">江西</a> &nbsp; 
                        <a href="/laoxiang/c15/">山东</a> &nbsp; 
                        <a href="/laoxiang/c16/">河南</a> &nbsp; 
                        <a href="/laoxiang/c17/">湖北</a> &nbsp; 
                        <a href="/laoxiang/c18/">湖南</a> &nbsp; 
                        <a href="/laoxiang/c19/">广东</a> &nbsp; 
                        <a href="/laoxiang/c20/">广西</a> &nbsp; 
                        <a href="/laoxiang/c22/">重庆</a><br />
                        <a href="/laoxiang/c23/">四川</a> &nbsp; 
                        <a href="/laoxiang/c24/">贵州</a> &nbsp; 
                        <a href="/laoxiang/c25/">云南</a> &nbsp; 
                        <a href="/laoxiang/c27/">陕西</a> &nbsp; 
                        <a href="/laoxiang/c28/">甘肃</a> &nbsp; 
                        <a href="/laoxiang/c29/">青海</a> &nbsp; 
                        <a href="/laoxiang/c30/">宁夏</a> &nbsp; 
                        <a href="/laoxiang/c31/">新疆</a> &nbsp; --%>
                        <a href="<%=Url.Action("laoxiang")%>">其他</a>
                    </td>
                </tr>
            </table>
        </li>
        <li>
            <h2><a href="<%=Url.Action("xingqu")%>">兴趣交友</a></h2>
            <table class="sort" cellpadding="0" cellspacing="0">
            	<tr>
                	<th width="9%">性别：</th>
                    <td width="91%">
                        <a href="<%=Url.Action("xingqu",new{sex=1})%>">帅哥</a> &nbsp; 
                        <a href="<%=Url.Action("xingqu",new{sex=0})%>">美女</a>
                    </td>
                </tr>
                <tr>
                	<th>年龄：</th>
                    <td>
                        <a href="<%=Url.Action("xingqu",new{minage=18,maxage=22})%>">18-22</a> &nbsp; 
                        <a href="<%=Url.Action("xingqu",new{minage=22,maxage=26})%>">22-26</a> &nbsp; 
                        <a href="<%=Url.Action("xingqu",new{minage=27,maxage=31})%>">27-31</a> &nbsp; 
                        <a href="<%=Url.Action("xingqu",new{minage=32,maxage=36})%>">32-36</a> &nbsp; 
                        <a href="<%=Url.Action("xingqu",new{minage=37,maxage=40})%>">37-40</a> &nbsp; 
                        <a href="<%=Url.Action("xingqu",new{minage=40,maxage=-1})%>">40岁以上</a>
                    </td>
                </tr>
				<tr>
                	<th>兴趣：</th>
                    <td>
                        <a href="<%=Url.Action("xingqu",new{wd="运动"})%>">运动</a> &nbsp; 
                        <a href="<%=Url.Action("xingqu",new{wd="聊天"})%>">聊天</a> &nbsp; 
                        <a href="<%=Url.Action("xingqu",new{wd="游泳"})%>">游泳</a> &nbsp; 
                        <a href="<%=Url.Action("xingqu",new{wd="台球"})%>">台球</a> &nbsp; 
                        <a href="<%=Url.Action("xingqu",new{wd="唱歌"})%>">唱歌</a> &nbsp; 
                        <a href="<%=Url.Action("xingqu",new{wd="爬山"})%>">爬山</a> &nbsp; 
                        <a href="<%=Url.Action("xingqu",new{wd="旅游"})%>">旅游</a>
                    </td>
                </tr>
            </table>
        </li>
        <div class="clear"></div>
        <li>
            <h2><a href="<%=Url.Action("jinengjiaohuan")%>">技能交换</a></h2>
            <table class="sort" cellpadding="0" cellspacing="0">
            	<tr>
                	<th width="9%">性别：</th>
                    <td width="91%">
                        <a href="<%=Url.Action("jinengjiaohuan",new{sex=1})%>">帅哥</a> &nbsp; 
                        <a href="<%=Url.Action("jinengjiaohuan",new{sex=0})%>">美女</a>
                    </td>
                </tr>
                <tr>
                	<th>技能：</th>
                    <td>
                        <a href="<%=Url.Action("jinengjiaohuan",new{wd="驾驶"})%>">驾驶</a> &nbsp; 
                        <a href="<%=Url.Action("jinengjiaohuan",new{wd="英语"})%>">英语</a> &nbsp; 
                        <a href="<%=Url.Action("jinengjiaohuan",new{wd="游泳"})%>">游泳</a> &nbsp; 
                        <a href="<%=Url.Action("jinengjiaohuan",new{wd="烹饪"})%>">烹饪</a> &nbsp; 
                        <a href="<%=Url.Action("jinengjiaohuan",new{wd="减肥"})%>">减肥</a> &nbsp; 
                        <a href="<%=Url.Action("jinengjiaohuan",new{wd="电脑"})%>">电脑</a> &nbsp; 
                        <a href="<%=Url.Action("jinengjiaohuan",new{wd="养生"})%>">养生</a> &nbsp; 
                        <a href="<%=Url.Action("jinengjiaohuan",new{wd="武术"})%>">武术</a> &nbsp; 
                        <a href="<%=Url.Action("jinengjiaohuan",new{wd="声乐"})%>">声乐</a>
                    </td>
                </tr>
            </table>
        </li>
        <li>
            <h2><a href="<%=Url.Action("huodong") %>">驴友/活动/聚会</a></h2>
            <table class="sort" cellpadding="0" cellspacing="0">
                <tr>
                	<td>
                        <a href="<%=Url.Action("huodong",new{wd="单身聚会"}) %>">单身聚会</a> &nbsp; 
                        <a href="<%=Url.Action("huodong",new{wd="K歌"}) %>">K歌</a> &nbsp; 
                        <a href="<%=Url.Action("huodong",new{wd="白领聚会"}) %>">白领聚会</a> &nbsp; 
                        <a href="<%=Url.Action("huodong",new{wd="驴友"}) %>">驴友</a> &nbsp; 
                        <a href="<%=Url.Action("huodong",new{wd="80后聚会"}) %>">80后聚会</a> &nbsp; 
                        <a href="<%=Url.Action("huodong",new{wd="70后聚会"}) %>">70后聚会</a>
                    </td>
                </tr>
            </table>
        </li>
    </ul>
    <div class="clear"></div>
</div>
<div class="wrap">
    <%--<div class="wrapleft" id="global">
    	<i class="lt"></i>
        <i class="rt"></i>
        <div class="tabs">
            <p>
        	    <a href="/nvyou/" target="_self" class='select'><span>全杭州异性交友</span></a>
                <a href='/xihuqu/nvyou/' target='_blank'>西湖</a><i class="gap">|</i>
                <a href='/gongshu/nvyou/' target='_blank'>拱墅</a><i class="gap">|</i>
                <a href='/jianggan/nvyou/' target='_blank'>江干</a><i class="gap">|</i>
                <a href='/xiacheng/nvyou/' target='_blank'>下城</a><i class="gap">|</i>
                <a href='/hzshangcheng/nvyou/' target='_blank'>上城</a><i class="gap">|</i>
                <a href='/yuhang/nvyou/' target='_blank'>余杭</a><i class="gap">|</i>
                <a href='/xiaoshan/nvyou/' target='_blank'>萧山</a><i class="gap">|</i>
                <a href='/binjiang/nvyou/' target='_blank'>滨江</a><i class="gap">|</i>
                <a href='/jiandeshi/nvyou/' target='_blank'>建德</a><i class="gap">|</i>
       		    <a href="/nvyou/">全部区域&raquo;</a> 
            </p>
        </div>
        <div class="clear"></div>
        <div class="filterbar">
            <h1>杭州异性交友</h1>
            <div class="clear"></div>
        </div>
    	<div class="clear"></div>
        <style>
            .ul_tbimg{ width:100%; overflow:hidden}
            .ul_tbimg li{ width:470px; height:88px; border-bottom:1px solid #F1F1F1; padding:5px 8px;}
            .ul_tbimg_fl{ float:left;}
            .ul_tbimg_fr{ float:right;}
            .ul_tbimg li img{ width:83px; height:83px;}
            .ul_tbimg li div{ width:360px; float:right; line-height:28px; color:#585858;}
            .ul_tbimg .ul_a{ color: #585858;text-decoration: underline;}
            .ul_tbimg li span{ display:block; width:100px; height:85px; padding-top:3px; float:left;}
        </style>

        <ul class="ul_tbimg">
            <li class="ul_tbimg_fl">
            <span><a href="http://jiaoyou.flxxwang.com/user/2517002440454" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/2517002440454/n_14593761643524.jpg"  title="骚动的心"  alt="骚动的心"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/2517002440454" target="_blank"> 骚动的心 </a><br />
            23岁 158cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >萧山</a> 性感<br />  想和一个23-28岁男生约会   </div>
            </li>
            <li class="ul_tbimg_fr">
            <span><a href="http://jiaoyou.flxxwang.com/user/2363287374599" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/2363287374599/n_14549403034627.jpg"  title="张铃"  alt="张铃"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/2363287374599" target="_blank"> 张铃 </a><br />
            24岁 160cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" ></a> 标准<br />  想和一个24-29岁男生聊天   </div>
            </li>
            <li class="ul_tbimg_fl">
            <span><a href="http://jiaoyou.flxxwang.com/user/703104211206" target="_blank"> <img src="http://pic.flxxwang.com/mobile/big/n_12801327656195.jpg"  title="cyz6631708"  alt="cyz6631708"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/703104211206" target="_blank"> cyz6631708 </a><br />
            22岁 160cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >西湖</a> 标准<br />  想和一个21-27岁男生看电影   </div>
            </li>
            <li class="ul_tbimg_fr">
            <span><a href="http://jiaoyou.flxxwang.com/user/1676857380870" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/1676857380870/n_13754027763970.jpg"  title="杭州气质漂亮小妹"  alt="杭州气质漂亮小妹"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/1676857380870" target="_blank"> 杭州气质漂亮小妹 </a><br />
            21岁 167cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >西湖</a> 性感<br />  想和一个18-40岁男生约会   </div>
            </li>
            <li class="ul_tbimg_fl">
            <span><a href="http://jiaoyou.flxxwang.com/user/1941532971015" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/1941532971015/n_14057415867393.jpg"  title="my"  alt="my"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/1941532971015" target="_blank"> my </a><br />
            26岁 168cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >西湖</a> 标准<br />  想和一个18-23岁男生约会   </div>
            </li>
            <li class="ul_tbimg_fr">
            <span><a href="http://jiaoyou.flxxwang.com/user/2379017903367" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/2379017903367/n_14455670639617.jpg"  title="落泪无痕"  alt="落泪无痕"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/2379017903367" target="_blank"> 落泪无痕 </a><br />
            22岁 161cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >西湖</a> 性感<br />  想和一个20-35岁男生结婚   </div>
            </li>
            <li class="ul_tbimg_fl">
            <span><a href="http://jiaoyou.flxxwang.com/user/52435588" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/52435588/n_13550216305924.jpg"  title="红色高跟"  alt="红色高跟"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/52435588" target="_blank"> 红色高跟 </a><br />
            23岁 165cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" ></a> 标准<br />  想和一个22-27岁男生约会   </div>
            </li>
            <li class="ul_tbimg_fr">
            <span><a href="http://jiaoyou.flxxwang.com/user/1429895614727" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/1429895614727/n_13546758193668.jpg"  title="触痛"  alt="触痛"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/1429895614727" target="_blank"> 触痛 </a><br />
            24岁 162cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >西湖</a> 性感<br />  想和一个24-29岁男生谈恋爱   </div>
            </li>
            <li class="ul_tbimg_fl">
            <span><a href="http://jiaoyou.flxxwang.com/user/1747223421191" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/1747223421191/n_14988622396931.jpg"  title="天使迷梦"  alt="天使迷梦"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/1747223421191" target="_blank"> 天使迷梦 </a><br />
            20岁 160cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >西湖</a> 标准<br />  想和一个25-40岁男生约会   </div>
            </li>
            <li class="ul_tbimg_fr">
            <span><a href="http://jiaoyou.flxxwang.com/user/2337305304070" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/2337305304070/n_14436132859649.jpg"  title="韩雪琪"  alt="韩雪琪"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/2337305304070" target="_blank"> 韩雪琪 </a><br />
            21岁 165cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >下城</a> 苗条<br />  想和一个26-53岁男生约会   </div>
            </li>
            <li class="ul_tbimg_fl">
            <span><a href="http://jiaoyou.flxxwang.com/user/3003490806278" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/3003490806278/n_15080205875458.jpg"  title="落敗的狱妖"  alt="落敗的狱妖"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/3003490806278" target="_blank"> 落敗的狱妖 </a><br />
            22岁 165cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >上城</a> 标准<br />  想和一个22-27岁男生约会   </div>
            </li>
            <li class="ul_tbimg_fr">
            <span><a href="http://jiaoyou.flxxwang.com/user/39895401" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/39895401/n_14507349527299.jpg"  title="寳貝儿思路"  alt="寳貝儿思路"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/39895401" target="_blank"> 寳貝儿思路 </a><br />
            21岁 164cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >下城</a> 丰满<br />  想和一个21-45岁男生约会   </div>
            </li>
            <li class="ul_tbimg_fl">
            <span><a href="http://jiaoyou.flxxwang.com/user/1827419548678" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/1827419548678/n_14567838036995.jpg"  title="小脸迷人"  alt="小脸迷人"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/1827419548678" target="_blank"> 小脸迷人 </a><br />
            22岁 165cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >下城</a> 标准<br />  想和一个25-50岁男生约会   </div>
            </li>
            <li class="ul_tbimg_fr">
            <span><a href="http://jiaoyou.flxxwang.com/user/2555097474311" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/2555097474311/n_14631833280002.jpg"  title="貂蝉"  alt="貂蝉"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/2555097474311" target="_blank"> 貂蝉 </a><br />
            22岁 167cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >上城</a> 苗条<br />  想和一个18-40岁男生喝咖啡   </div>
            </li>
            <li class="ul_tbimg_fl">
            <span><a href="http://jiaoyou.flxxwang.com/user/2534959357190" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/2534959357190/n_14699668863746.jpg"  title="心如雪"  alt="心如雪"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/2534959357190" target="_blank"> 心如雪 </a><br />
            24岁 162cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >萧山</a> 标准<br />  想和一个24-29岁男生约会   </div>
            </li>
            <li class="ul_tbimg_fr">
            <span><a href="http://jiaoyou.flxxwang.com/user/3038019557382" target="_blank"> <img src="http://pic.flxxwang.com/jiaoyou/s/small/3038019557382/n_15114693584387.jpg"  title="冰雪如一"  alt="冰雪如一"> </a></span>
            <div><a class="t" href="http://jiaoyou.flxxwang.com/user/3038019557382" target="_blank"> 冰雪如一 </a><br />
            24岁 165cm <a target="_blank" href="http://jiaoyou.flxxwang.com/hz/mm/"  class="ul_a" >西湖</a> 标准<br />  想和一个24-29岁男生谈恋爱   </div>
            </li>
            <i class="clear"></i>
        </ul>
        
        <script type="text/javascript">
            $(function () {
                $(".ul_tbimg>li").mouseover(function () {
                    $(".ul_tbimg>li").css("background-color", "#fff");
                    $(this).css("background-color", "#fffee5");
                });
            });
        </script>
    	<div class="clear"></div>
        <div class="lookmore">
            <a href="http://jiaoyou.flxxwang.com/hz/">查看更多杭州异性交友信息&raquo;</a>
        </div>
    </div>--%>
    <div class="wrapright" id="rightAdframe" style="display:none;">
        <div id="ad1" class="adbox"></div>
        <div id="ad2" class="adbox"></div>
    </div>
    <div class="clear"></div>
</div>
<div class="wrap">
	<h3></h3>
	<p class="tips">
        目前本站进一步加强了交友信息的审核，垃圾以及重复发布的信息将被删除，类别选错的将被修改类别。
        <%--<a href="http://about.flxxwang.com/" target="_blank">联系客服</a>--%>
    </p>
    <div class="others">
        <ul>
    	    <li><a href="<%=Url.Action("Index", new {city="bj"})%>">北京交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="sh"})%>">上海交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="sz"})%>">深圳交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="su"})%>">苏州交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="gz"})%>">广州交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="wh"})%>">武汉交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="cd"})%>">成都交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="tj"})%>">天津交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="cc"})%>">长春交友</a></li>
    	    <li><a href="<%=Url.Action("Index", new {city="sy"})%>">沈阳交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="qd"})%>">青岛交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="km"})%>">昆明交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="fz"})%>">福州交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="jn"})%>">济南交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="hz"})%>">杭州交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="wz"})%>">温州交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="cs"})%>">长沙交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="jl"})%>">吉林交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="dl"})%>">大连交友</a></li>
            <li><a href="<%=Url.Action("Index", new {city="hrb"})%>">哈尔滨交友</a></li>
        </ul>
        <div class="clear"></div>
    </div>

    <div class="others">
        <ul class="friendlink">
            ﻿<strong>友情链接</strong>:
            <a href='http://www.51yuan.net' target='_blank'>星梦奇缘交友网</a>&nbsp;
            <a href='http://www.531i.com' target='_blank'>杭州交友</a>&nbsp;
            <a href='<%=Url.Action("Index", new {city="bj"})%>' target='_blank'>交友</a>&nbsp;
            <a href='http://www.531i.com/' target='_blank'>531i杭州交友</a>&nbsp;
            <a href='http://www.jiaoyou8.com/' target='_blank'>未名交友</a>&nbsp;
            <a href='http://www.xinsilu.com/blog/' target='_blank'>中国模特博客圈</a>&nbsp;  
            <%--<a href="/link.html" target="_blank">更多...</a>&nbsp;--%>
            <%--<a href="#" target="_blank">自动申请链接</a>--%>
        </ul>
    </div>
    <div class="clear"></div>
</div>

<div id="footer">
    &copy; 2010 flxxwang.com
    <%--<a href="http://about.flxxwang.com/" id="askicon">联系客服</a>--%>
</div>

<script type="text/javascript">
    $(function () {
        $("a").attr("target", "_blank");
    });
</script>
</asp:Content>
