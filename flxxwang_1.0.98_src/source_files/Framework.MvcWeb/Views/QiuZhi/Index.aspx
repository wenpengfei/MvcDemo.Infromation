<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/jobindex.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Rows" runat="server">
<%
    var city = ViewData["City"] as City;
%>
<%--<div class="wrap" style="margin-top:20px">
	<div id="global">
    	<i class="lt"></i><i class="rt"></i>
        <div class="tabs"><p>
        	<a href="/searchjob/" class='select'><span>全杭州求职简历</span></a>
            <a href='/xihuqu/searchjob/' target='_blank'>西湖</a><i class="gap">|</i><a href='/gongshu/searchjob/' target='_blank'>拱墅</a><i class="gap">|</i><a href='/jianggan/searchjob/' target='_blank'>江干</a><i class="gap">|</i><a href='/xiacheng/searchjob/' target='_blank'>下城</a><i class="gap">|</i><a href='/hzshangcheng/searchjob/' target='_blank'>上城</a><i class="gap">|</i><a href='/yuhang/searchjob/' target='_blank'>余杭</a><i class="gap">|</i><a href='/xiaoshan/searchjob/' target='_blank'>萧山</a><i class="gap">|</i><a href='/binjiang/searchjob/' target='_blank'>滨江</a><i class="gap">|</i><a href='/jiandeshi/searchjob/' target='_blank'>建德</a><i class="gap">|</i>
       		<a href="/searchjob/">全部区域&raquo;</a> 
        </p></div><div class="clear"></div>
	</div><div class="clear"></div>
    <table class="searchjobhot" cellpadding="0" cellspacing="0" id="infolist">
    	<tr class="topline"><td class="t" style="width: 160px; padding: 0pt 0pt 0pt 10px;">求职位</td>
                    <td style="width: 100px;">历史职位</td>	
                    <td class="tc" style="width: 90px;">年龄</td>
                    <td class="tc" style="width: 90px;">学历</td>
                    <td class="tc" style="width: 90px;">工作经验</td>
	                <td class="tc" style="width: 80px;">发布日期</td></tr>
        
<tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'"><td class="t"><a href="http://hz.flxxwang.com/qzyewu/7853277109255x.shtml" target="_blank" class="t" tips="t">销售代表</a><span class="hc">本人热爱生活,性格开朗活泼,待人真诚。我很热爱市场营销专业,大学期间读了很多有关该专业的书,用心体会到市场营销理论体系的用处。我在校期间曾多次和志同道合的同学一起组织过校园和班级的活动,这些使我有很强的组织能力和团队协作精神,协调能力强。利用暑假时间,我做了两次有关销售的兼职,工作认真负责,积极主动,能吃苦耐劳,具有较强的适应能力,在兼职工作中积极配合,喜欢工作中有合作带来的快乐。在此希望能成为贵公司一份子,今后务必尽自己能力为贵公司出一份力。</span></td>
                    <td>销售代表</td>	
                    <td class="tc">21-30岁</td>
                    <td class="tc">本科</td>
                    <td class="tc">无经验</td>
	                <td class="tc">2分钟前</td></tr>

<tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'"><td class="t"><a href="http://hz.flxxwang.com/qzsiji/7773718510852x.shtml" target="_blank" class="t" tips="t">货运司机</a><span class="hc">本人C1驾照  能吃苦耐劳 3年驾龄经验  求份小车司机的工作</span></td>
                    <td>货运司机</td>	
                    <td class="tc">21-30岁</td>
                    <td class="tc">高中</td>
                    <td class="tc">1-3年</td>
	                <td class="tc">4分钟前</td></tr>

<tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'"><td class="t"><a href="http://hz.flxxwang.com/qzsiji/7774135510152x.shtml" target="_blank" class="t" tips="t">出租车司机</a><span class="hc">开出租5年，找九堡附近的，开夜班</span></td>
                    <td>出租车司机</td>	
                    <td class="tc">21-30岁</td>
                    <td class="tc">高中</td>
                    <td class="tc">3-5年</td>
	                <td class="tc">4分钟前</td></tr>

<tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'"><td class="t"><a href="http://hz.flxxwang.com/qzsiji/7774273506436x.shtml" target="_blank" class="t" tips="t">商务司机</a><span class="hc">16年驾龄出租车五星级驾驶员曾工作开过奥迪A8.宝马高档车，现求司机岗位</span></td>
                    <td>商务司机</td>	
                    <td class="tc">41-50岁</td>
                    <td class="tc">高中以下</td>
                    <td class="tc">10年以上</td>
	                <td class="tc">4分钟前</td></tr>

<tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'"><td class="t"><a href="http://hz.flxxwang.com/qzsiji/7774577545861x.shtml" target="_blank" class="t" tips="t">商务司机</a><span class="hc">本人现年21岁没什么学历!!车开了3年驾驶证不满一年B2驾照!以前开牵引车的,感觉没什么前途!现在求一个能有发展的一份好职业能吃苦耐劳工资没什么要求!只要能学到一些知识!高档车轿车没开过,希望各位主考能给次机会!我是外地人安徽的!</span></td>
                    <td>商务司机</td>	
                    <td class="tc">21-30岁</td>
                    <td class="tc">高中以下</td>
                    <td class="tc">1-3年</td>
	                <td class="tc">4分钟前</td></tr>

<tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'"><td class="t"><a href="http://hz.flxxwang.com/qzzhuanye/7853237978630x.shtml" target="_blank" class="t" tips="t">教师/助教</a><span class="hc">生活中可爱大方,为人亲和善良,是个有爱心、耐心的女孩子;工作上踏实肯干、责任心强,具有较强的学习能力和适应能力。大学期间曾兼职英语家教,热爱教育事业。</span></td>
                    <td>教师/助教</td>	
                    <td class="tc">21-30岁</td>
                    <td class="tc">本科</td>
                    <td class="tc">无经验</td>
	                <td class="tc">4分钟前</td></tr>

<tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'"><td class="t"><a href="http://hz.flxxwang.com/qzrenli/7853259297925x.shtml" target="_blank" class="t" tips="t">人事/行政/后勤</a><span class="hc">本人性格开朗、稳重、有活力,待人热情、真诚;工作认真负责,积极主动,能吃苦耐劳;有较强的实际动手能力和团体协作精神,能迅速的适应各种环境,并融合其中。在校期间学习刻苦,成绩优异,并担任工商学院学生会生活部部长,工作认真负责,积极配合老师完成工作任务,并多次组织参加社会实践活动,在能力和素质上都有了进一步的提高。善于交际、组织、管理、比较喜欢玩玩电脑、看看书、运动,乒乓球、听音乐等,能充分的运用于实际中;英语基础知识较扎实、具备一定的听、说、读、写能力;熟悉办公自动化及各种软件的运用。</span></td>
                    <td></td>	
                    <td class="tc">16-20岁</td>
                    <td class="tc">大专</td>
                    <td class="tc">无经验</td>
	                <td class="tc">5分钟前</td></tr>

<tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'"><td class="t"><a href="http://hz.flxxwang.com/qzyewu/7853219064834x.shtml" target="_blank" class="t" tips="t">销售助理</a><span class="hc">本人能勤奋学习,吃苦耐劳。</span></td>
                    <td>销售助理</td>	
                    <td class="tc">21-30岁</td>
                    <td class="tc">大专</td>
                    <td class="tc">无经验</td>
	                <td class="tc">9分钟前</td></tr>

<tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'"><td class="t"><a href="http://hz.flxxwang.com/qzzhaopin/7853203314695x.shtml" target="_blank" class="t" tips="t">景观实习生</a><span class="hc">本人活泼开朗,热情,积极上进。在校期间两次获得奖学金;利用寒暑假在上海果润装饰有限公司实习,来锻炼自己。</span></td>
                    <td>其他职位</td>	
                    <td class="tc">21-30岁</td>
                    <td class="tc">大专</td>
                    <td class="tc">无经验</td>
	                <td class="tc">12分钟前</td></tr>

<tr onmouseover="this.style.background='#fffee5'" onmouseout="this.style.background='#fff'"><td class="t"><a href="http://hz.flxxwang.com/qzsiji/7775756915586x.shtml" target="_blank" class="t" tips="t">司机</a><span class="hc">本人不抽烟不喝酒驾龄5年住在江干四季青</span></td>
                    <td></td>	
                    <td class="tc">21-30岁</td>
                    <td class="tc">高中</td>
                    <td class="tc">3-5年</td>
	                <td class="tc">14分钟前</td></tr>


    </table>
    <div class="clear"></div><div class="lookmore"><a href="/searchjob/">更多杭州求职简历&raquo;</a></div>
</div>--%>
<div class="wrap">
	<h3></h3>
	<p class="tips"><%=SiteInfo.Name%><%=city.ShortName %>求职频道每日更新数十万个<%=city.ShortName %>求职、<%=city.ShortName %>人才求职职位信息，真实有效、方便快捷，<%=city.ShortName %>找工作选择<%=SiteInfo.Name%> <a href="" class="keyword2"><%=city.ShortName %>求职</a> 频道。</p>
    <div class="others"><ul>
		<li><a href="<%=Url.Action("Index",new{city="bj"}) %>">北京求职</a></li>	
        <li><a href="<%=Url.Action("Index",new{city="sh"}) %>">上海求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="gz"}) %>">广州求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="sz"}) %>">深圳求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="tj"}) %>">天津求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="cd"}) %>">成都求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="zz"}) %>">郑州求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="wh"}) %>">武汉求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="xa"}) %>">西安求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="jn"}) %>">济南求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="cs"}) %>">长沙求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="hz"}) %>">杭州求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="su"}) %>">苏州求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="cq"}) %>">重庆求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="dl"}) %>">大连求职</a></li>
        <li><a href="<%=Url.Action("Index",new{city="nj"}) %>">南京求职</a></li>        
        <li><a href="<%=Url.Action("Index",new{city="sjz"}) %>">石家庄求职</a></li>
        <%--<li><a href="http://www.flxxwang.com/searchjob/changecity/">更多城市</a></li>--%>
    </ul><div class="clear"></div></div>
    <div class="others">
        <ul class="friendlink">﻿
            <strong>友情链接</strong>:
            <%--<a href='http://zhejiang.bidchance.com/' target='_blank'>杭州招标网</a>&nbsp;  
            <a href="/link.html" target="_blank">更多...</a>&nbsp;
            <a href="#" target="_blank">自动申请链接</a>--%>
        </ul>
    </div><div class="clear"></div>
</div>
</asp:Content>
