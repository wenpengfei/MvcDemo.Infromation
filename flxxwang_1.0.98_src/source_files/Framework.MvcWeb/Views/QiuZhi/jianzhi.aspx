<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/jobBaseIndex.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
<%--<script type="text/javascript" src="/Content/Fenlei/Scripts/v6/source/4fd65d7f222c38e66aa84b7472f175d5.js"></script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Rows" runat="server">
<%
    var city = ViewData["City"] as City;
%>
<script>function search() { go('jianzhi'); }; function changesearchtype(type, cate) { search = function () { go(cate) }; }</script>
<!---兼职热门职位--->
<div class="wrap">
    <h2 class="whtxt" style="border-bottom:none"><%=city.ShortName %>兼职热门职位</h2>
    <ul class="hotcategory">
        <li><a href="<%=Url.Action("JianZhiCanyinFuwu",new{objecttype=2}) %>">服务员</a><%--<cite>(1597)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiCanyinFuwu",new{objecttype=4}) %>">快递员</a><%--<cite>(1597)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiCanyinFuwu",new{objecttype=3}) %>">送餐员</a><%--<cite>(1597)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiXuesheng",new{objecttype=1}) %>">学生兼职</a><%--<cite>(5954)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiKefuShichang",new{objecttype=1}) %>">电话客服</a><%--<cite>(455)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiXiaoshouCuxiao",new{objecttype=1}) %>">业务员</a><%--<cite>(2764)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiXiaoshouCuxiao",new{objecttype=6}) %>">发单员</a><%--<cite>(2764)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiXiaoshouCuxiao",new{objecttype=7}) %>">促销员</a><%--<cite>(2764)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiKefuShichang",new{objecttype=5}) %>">问卷调查员</a><%--<cite>(455)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiXiaoshouCuxiao",new{objecttype=8}) %>">营业员</a><%--<cite>(2764)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiJiaoyuPeixun",new{objecttype=1}) %>">家教</a><%--<cite>(960)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiJiaoyuPeixun",new{objecttype=2}) %>">教师</a><%--<cite>(960)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiJiaoyuPeixun",new{objecttype=4}) %>">翻译</a><%--<cite>(233)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiJiaoyuPeixun",new{objecttype=1}) %>">编辑</a><%--<cite>(233)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiJiaoyuPeixun",new{objecttype=3}) %>">校对排版</a><%--<cite>(233)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiCanyinFuwu",new{objecttype=6}) %>">钟点工</a><%--<cite>(1597)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiLiyiYanyi",new{objecttype=2}) %>">礼仪</a><%--<cite>(1384)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiLiyiYanyi",new{objecttype=3}) %>">模特</a><%--<cite>(1384)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiLiyiYanyi",new{objecttype=1}) %>">群众演员</a><%--<cite>(1384)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiLiyiYanyi",new{objecttype=4}) %>">歌手</a><%--<cite>(1384)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiCaiwuFalv",new{objecttype=1}) %>">会计</a><%--<cite>(203)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiJisuanji",new{objecttype=1}) %>">网站建设</a><%--<cite>(913)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiJisuanji",new{objecttype=3}) %>">网站推广</a><%--<cite>(913)</cite>--%></li>
        <li><a href="<%=Url.Action("JianZhiPingMian") %>">图形/影像/设计</a><%--<cite>(450)</cite>--%></li>
    </ul>
    <div class="clear"></div>
    <h2 class="whtxt">杭州兼职分类</h2>
        <ul class="types">
            <%
                var jobCategory = InfoCategory.GetCategory<JobCategory>();
                var jobCategories = jobCategory.Children.Where(item => item.Code != null && item.Code.ToLower().StartsWith("jianzhi"));
                for (var i = 0; i < jobCategories.Count(); i++)
                {
                    var category = jobCategories.ElementAt(i);
                    %>
                    <li>
                    <h2><a href="<%=Url.Action(category.Code) %>"><%=category.Name %></a></h2>
                        <p>
                    <%
                    for (var j = 0; j < category.ObjectTypeCollection.Count; j++)
                    {
                        var objType = category.ObjectTypeCollection[j];
                        %>
                            <a href="<%=Url.Action(category.Code,new{objecttype=objType.Id}) %>"><%=objType.Name%></a>
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
                    </li>
                    <%
                }
            %>
            <%--<li>
                <h2><a href="/jisuanjiwl/">计算机/网络</a></h2>
                <p style="height:48px">
                    <a href="/wangyesheji/">网页设计</a><cite>|</cite><a href="/wangzhanzz/" class="red">网站建设</a><cite>|</cite><a href="/donghuazz/">多媒体制作</a><cite>|</cite><a href="/chengxukaifa/">程序员</a><cite>|</cite><a href="/wangzhantuiguang/">网站推广</a><cite>|</cite><a href="/wangluoluru/">录入员</a><cite>|</cite><a href="/youxiceshi/">游戏代练</a><br /><a href="/wangzhanbanzhu/">论坛管理员</a><cite>|</cite><a href="/ruanjianjiemiansheji/">软件界面设计</a><cite>|</cite><a href="/rixinjishu/">电脑维修</a><cite>|</cite><a href="/seo/">seo优化</a><cite>|</cite><a href="/wangluojz/">其他网络兼职</a>
                </p>
            </li>
            <li>
                <h2><a href="/computer/">图形/影像/设计</a></h2>
                <p style="height:48px">
                    <a href="/zhitu/">图像处理</a><cite>|</cite><a href="/yingxiangchuli/">影视处理</a><cite>|</cite><a href="/hunshasheying/">摄影摄像</a><cite>|</cite><a href="/logosheji/">LOGO设计</a><cite>|</cite><a href="/jianzhuzhuanghuang/">装潢设计</a><cite>|</cite><a href="/gongyesheji/" class="red">工业设计</a><cite>|</cite><a href="/cadshejijz/">CAD设计</a><br /><a href="/chatumanhua/">插画师</a><cite>|</cite><a href="/qitatuxingsheji/">其他设计兼职</a>
                </p>
            </li>
            <li><h2><a href="/yuyanwenzi/">翻译/编辑</a></h2>
                <p><a href="/wenzi/">外文翻译</a><cite>|</cite><a href="/yingyukouyi/">口译</a><cite>|</cite><a href="/zhuangaoren/">撰稿人</a><cite>|</cite><a href="/bianjijz/">编辑</a><cite>|</cite><a href="/paibanjz/">校对排版</a><cite>|</cite><a href="/kouyupeilian/">口语陪练</a><cite>|</cite><a href="/zimufanyi/">字幕翻译</a><cite>|</cite><a href="/shujuzhengli/">数据整理</a><br /><a href="/xinwenxieshou/">写手</a><cite>|</cite><a href="/jieshuoyuan/">解说员</a><cite>|</cite><a href="/qitayuyanwenzi/">其他翻译编辑兼职</a></p></li>
            <li><h2><a href="/xiaoshoucuxiao/">销售/促销</a></h2>
                <p><a href="/jzxiaoshou/">业务员</a><cite>|</cite><a href="/xiaoyuandaili/" class="red">校园代理</a><cite>|</cite><a href="/shangwugongguan/">文秘</a><cite>|</cite><a href="/paifayuan/">发单员</a><cite>|</cite><a href="/dianhuaxiaoshoujz/">电话销售</a><cite>|</cite><a href="/baoxiandaili/">保险经纪人</a><cite>|</cite><a href="/zhaoshangdaili/">招生代理</a><cite>|</cite><a href="/xiaoshou/">促销员</a><br /><a href="/yewurenyuan/">营业员</a><cite>|</cite><a href="/xiaoshigong/">小时工</a><cite>|</cite><a href="/wangluoxiaoshou/">网络销售</a><cite>|</cite><a href="/qitaxiaoshou/">其他销售兼职</a></p></li>
            <li><h2><a href="/kefushichang/">客服/市场调查</a></h2>
                <p><a href="/dianhuafangwen/">电话回访</a><cite>|</cite><a href="/kehuzixunrexian/">话务员</a><cite>|</cite><a href="/hujiaozhongxin/">呼叫中心人员</a><cite>|</cite><a href="/dianhuakefu/">电话客服</a><cite>|</cite><a href="/shouhoufuwujz/" class="red">售后服务</a><cite>|</cite><a href="/shichangcaifang/">市场调查员</a><br /><a href="/wenjuandiaocha/">问卷调查员</a><cite>|</cite><a href="/qitashichangdiaocha/">其他客服兼职</a>
        </p></li>
            <li><h2><a href="/jianzhicaiwu/">财务/法律</a></h2>
                <p><a href="/guwen/">会计</a><cite>|</cite><a href="/caiwuzixun/">财务咨询</a><cite>|</cite><a href="/lushijz/">律师</a><cite>|</cite><a href="/jianzhizixun/">咨询员</a><cite>|</cite><a href="/qita/">其他财务法律兼职</a></p></li>
            <li><h2><a href="/jiaoyupeixun/">教育培训</a></h2>
                <p style="height:24px"><a href="/jianzhijiajiao/">家教</a><cite>|</cite><a href="/jiaoshijz/">教师</a><cite>|</cite><a href="/jianshenwudaojiaolian/">舞蹈老师</a><cite>|</cite><a href="/qichepeilian/">汽车陪练</a><cite>|</cite><a href="/yuandongjiaolian/">健身教练</a><cite>|</cite><a href="/jyqita/">其他教育培训兼职</a></p></li>
            <li><h2><a href="/canyinfuwu/">餐饮/服务/旅游</a></h2>
                <p style="height:24px"><a href="/canting/">餐厅服务员</a><cite>|</cite><a href="/kuaidiyuan/">快递员</a><cite>|</cite><a href="/songcan/">送餐员</a><cite>|</cite><a href="/baojiejz/">家政保洁</a><cite>|</cite><a href="/jiazheng/">钟点工</a><cite>|</cite><a href="/daoyou/">导游</a><cite>|</cite><a href="/canyiqita/">其他服务兼职</a></p></li>
            <li><h2><a href="/liyiyanyi/">礼仪/演艺</a></h2>
                <p style="height:24px"><a href="/libing/">礼仪</a><cite>|</cite><a href="/yanyuanjz/">群众演员</a><cite>|</cite><a href="/qzmoterjz/">模特</a><cite>|</cite><a href="/zhuchi/">主持人</a><cite>|</cite><a href="/hunlizhuchi/">婚庆司仪</a><cite>|</cite><a href="/dclw/">歌手</a><cite>|</cite><a href="/liyiqita/">其他演出兼职</a></p></li>
		            <li><h2><a href="/xueshengjianzhi/">学生兼职/实习</a></h2>
                <p style="height:24px"><a href="/xueshengjz/">学生兼职</a><cite>|</cite><a href="/shixi/">学生实习</a></p></li>
                <li><h2><a href="/partime/">其他兼职</a></h2>
                <p><a href="/qitarxjjgongzuo/">其他兼职工作</a></p></li>--%>
        </ul>
        <div class="clear"></div>
    </div>

<div class="wrap">
	<div class="others">
        <h4 class="f12"><%=city.ShortName %>兼职频道介绍</h4>
	    <p class="tips">
            <%=city.ShortName %>兼职频道为您提供<%=city.ShortName %>兼职信息，在此有大量<%=city.ShortName %>兼职信息供您选择，您可以免费查看和发布<%=city.ShortName %>兼职信息。感谢您选择<%=city.ShortName %>兼职信息平台。
            <%--有疑问请 <a href="http://about.flxxwang.com/" target="_blank">联系客服</a>--%>
        </p>
    </div>
    <div class="others">
        <h4 class="f12"><%=city.ShortName %>兼职相关热门城市</h4>
        <ul>
		    <li><a href="<%=Url.Action("Index",new{city="bj"}) %>">北京兼职</a></li>	
            <li><a href="<%=Url.Action("Index",new{city="sh"}) %>">上海兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="gz"}) %>">广州兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="sz"}) %>">深圳兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="tj"}) %>">天津兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cd"}) %>">成都兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="zz"}) %>">郑州兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="wh"}) %>">武汉兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="xa"}) %>">西安兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="jn"}) %>">济南兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cs"}) %>">长沙兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="hz"}) %>">杭州兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="su"}) %>">苏州兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cq"}) %>">重庆兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="dl"}) %>">大连兼职</a></li>
            <li><a href="<%=Url.Action("Index",new{city="nj"}) %>">南京兼职</a></li>        
            <li><a href="<%=Url.Action("Index",new{city="sjz"}) %>">石家庄兼职</a></li>
            <%--<li><a href="http://www.flxxwang.com/jianzhi/changecity/">更多城市</a></li>--%>
        </ul>
        <div class="clear"></div>
    </div>
    <div class="others">
        <ul class="friendlink">
            ﻿<strong>友情链接</strong>:
            <a href='http://<%=city.Code %>.jianzhi8.com/' target='_blank'><%=city.ShortName %>兼职</a>&nbsp;
            <a href='http://www.soxsok.com/' target='_blank'>搜学搜课</a>&nbsp;
            <a href='http://zd.54yjs.cn/' target='_blank'>简历指南网</a>&nbsp;
            <a href='http://www.daxuejz.com/' target='_blank'>杭州大学生兼职网</a>&nbsp;
            <%--<a href='http://www.hzhr8.cn' target='_blank'>杭州人才网</a>&nbsp;--%>
            <%--<a href='http://www.tuan800.com/hangzhou' target='_blank'>杭州团购网</a>&nbsp;--%>
            <a href='http://www.qibuni.com' target='_blank'>干洗加盟</a>&nbsp;
            <a href='http://www.uu-club.com' target='_blank'>悠游旅游网</a>&nbsp;
            <a href='http://cy.biz178.com' target='_blank'>餐饮加盟</a>&nbsp;
            <a href='http://www.001hr.com' target='_blank'>上海人才网</a>&nbsp;
            <a href='http://www.bag-hr.com/' target='_blank'>中国皮具箱包人才网</a>&nbsp;  
            <%--<a href="/link.html" target="_blank">更多...</a>&nbsp;
            <a href="#" target="_blank">自动申请链接</a>--%>
        </ul>
    </div>
    <div class="clear"></div>
</div>

</asp:Content>
