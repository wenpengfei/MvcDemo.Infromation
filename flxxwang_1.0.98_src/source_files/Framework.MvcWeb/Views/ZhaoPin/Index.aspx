<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/jobindex.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Rows" runat="server">
<%
    var city = ViewData["City"] as City;
%>

<%--<div class="wrap">
    <h2 class="whtxt">杭州招聘热门企业</h2>
    <ul class="companyposition">
        <ul>

            <li><a href='http://qy.flxxwang.com/54432146/' target='_blank'>浙江奥斯卡电影大世界</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7630435858050x.shtml" target="_blank" class="blacklink">招聘服务主管</a></li>

            <li><a href='http://qy.flxxwang.com/3046350321926/' target='_blank'>爱尚水果</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7852724050055x.shtml" target="_blank" class="blacklink">其他职位</a></li>

            <li><a href='http://qy.flxxwang.com/192762616583/' target='_blank'>浙江购得乐五金有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7230834079494x.shtml" target="_blank" class="blacklink">总经理助理</a></li>

            <li><a href='http://qy.flxxwang.com/959846914566/' target='_blank'>杭州阿波罗男子医院</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/6809727251591x.shtml" target="_blank" class="blacklink">医助/导医</a></li>

            <li><a href='http://qy.flxxwang.com/1050019393542/' target='_blank'>浙江盛威贵金属有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7686250847109x.shtml" target="_blank" class="blacklink">淘宝客服人员</a></li>

            <li><a href='http://qy.flxxwang.com/46568302/' target='_blank'>浙江轩昊服饰有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7851847278213x.shtml" target="_blank" class="blacklink">试衣模特</a></li>

            <li><a href='http://qy.flxxwang.com/52667906/' target='_blank'>上海谷果实业有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7851742666119x.shtml" target="_blank" class="blacklink">急招服装理单员</a></li>

            <li><a href='http://qy.flxxwang.com/57252806/' target='_blank'></a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/6457146754563x.shtml" target="_blank" class="blacklink">包装打包工</a></li>

            <li><a href='http://qy.flxxwang.com/75033963526/' target='_blank'>杭州中豪大酒店</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/6367098270343x.shtml" target="_blank" class="blacklink">前厅行李员</a></li>

            <li><a href='http://qy.flxxwang.com/57351578/' target='_blank'>浙江诠得文化发展有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7838597600900x.shtml" target="_blank" class="blacklink">银得宝实体店店长</a></li>

            <li><a href='http://qy.flxxwang.com/38244879/' target='_blank'>杭州巾帼西丽服务管理有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/6556340207752x.shtml" target="_blank" class="blacklink">数字城管信息采集员</a></li>

            <li><a href='http://qy.flxxwang.com/34178571/' target='_blank'>DDPOPO时尚男女潮包网</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7811877186947x.shtml" target="_blank" class="blacklink">网店包装客服2000包住</a></li>

            <li><a href='http://qy.flxxwang.com/50319603/' target='_blank'>杭州久城装饰工程有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7849726815493x.shtml" target="_blank" class="blacklink">电话销售+网络销售位</a></li>

            <li><a href='http://qy.flxxwang.com/302184948743/' target='_blank'>雷婷化妆品公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7749525888515x.shtml" target="_blank" class="blacklink">美甲师</a></li>

            <li><a href='http://qy.flxxwang.com/50319603/' target='_blank'>杭州久城装饰工程有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7849652307974x.shtml" target="_blank" class="blacklink">室内设计师/实习</a></li>

            <li><a href='http://qy.flxxwang.com/34986458/' target='_blank'></a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/6489038346499x.shtml" target="_blank" class="blacklink">验光师</a></li>

            <li><a href='http://qy.flxxwang.com/1712502390791/' target='_blank'>杭州三赢人力资源公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7187341614598x.shtml" target="_blank" class="blacklink">停车收费</a></li>

            <li><a href='http://qy.flxxwang.com/2888595775750/' target='_blank'>杭州宇星通信技术有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7849584093573x.shtml" target="_blank" class="blacklink">商务助理</a></li>

            <li><a href='http://qy.flxxwang.com/629356201735/' target='_blank'>杭州比骥贸易有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7849515843462x.shtml" target="_blank" class="blacklink">高薪急聘销售精英</a></li>

            <li><a href='http://qy.flxxwang.com/2888595775750/' target='_blank'>杭州宇星通信技术有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7849514836486x.shtml" target="_blank" class="blacklink">仓库管理员</a></li>

            <li><a href='http://qy.flxxwang.com/40219959/' target='_blank'>杭州朗天</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/5382516688131x.shtml" target="_blank" class="blacklink">仓管</a></li>

            <li><a href='http://qy.flxxwang.com/30153537/' target='_blank'>杭州尤思小逗教育咨询有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/2344593721730x.shtml" target="_blank" class="blacklink">销售顾问</a></li>

            <li><a href='http://qy.flxxwang.com/2883971803398/' target='_blank'>浙江安达担保有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7805057345539x.shtml" target="_blank" class="blacklink">汽车按揭业务员</a></li>

            <li><a href='http://qy.flxxwang.com/2862089725959/' target='_blank'>杭州三赢人力资源服务有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7849344842243x.shtml" target="_blank" class="blacklink">永创机械招普工</a></li>

            <li><a href='http://qy.flxxwang.com/944827526406/' target='_blank'>葡挞斯 北软店</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/6802345504516x.shtml" target="_blank" class="blacklink">北部软件园奶茶店店员</a></li>

            <li><a href='http://qy.flxxwang.com/629356201735/' target='_blank'>杭州比骥贸易有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7838223427847x.shtml" target="_blank" class="blacklink">2000底薪起招电话销售</a></li>

            <li><a href='http://qy.flxxwang.com/53332161/' target='_blank'>浙江五和网络科技有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7849276660355x.shtml" target="_blank" class="blacklink">物流配送骑士</a></li>

            <li><a href='http://qy.flxxwang.com/2862089725959/' target='_blank'>杭州三赢人力资源服务有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7849243438726x.shtml" target="_blank" class="blacklink">其他职位</a></li>

            <li><a href='http://qy.flxxwang.com/57867747/' target='_blank'>manpower</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/6776186127494x.shtml" target="_blank" class="blacklink">急招各大商场营业员</a></li>

            <li><a href='http://qy.flxxwang.com/2751869865222/' target='_blank'>浙江瑞博游戏公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7706175379714x.shtml" target="_blank" class="blacklink">游戏推广员</a></li>

            <li><a href='http://qy.flxxwang.com/57527302/' target='_blank'>威塑可（杭州）塑料有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/6423822208006x.shtml" target="_blank" class="blacklink">保安岗位</a></li>

            <li><a href='http://qy.flxxwang.com/55163439/' target='_blank'>杭州新旅航空服务有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7828122578052x.shtml" target="_blank" class="blacklink">业务员</a></li>

            <li><a href='http://qy.flxxwang.com/479901672711/' target='_blank'>中国南方航空</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/6599935318788x.shtml" target="_blank" class="blacklink">机场地面服务</a></li>

            <li><a href='http://qy.flxxwang.com/3018509391366/' target='_blank'>北京恒安堂便利店连锁有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7838841780868x.shtml" target="_blank" class="blacklink">店长</a></li>

            <li><a href='http://qy.flxxwang.com/1497445506822/' target='_blank'>东部数码城</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7660907444229x.shtml" target="_blank" class="blacklink">楼层管理员</a></li>

            <li><a href='http://qy.flxxwang.com/34813277/' target='_blank'>浙江荣事集团有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7550237030148x.shtml" target="_blank" class="blacklink">跟单员</a></li>

            <li><a href='http://qy.flxxwang.com/52480370/' target='_blank'>杭州精策品牌策划机构</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7839797973894x.shtml" target="_blank" class="blacklink">项目经理</a></li>

            <li><a href='http://qy.flxxwang.com/1955084220935/' target='_blank'>杭州蓝保环境技术有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7683891035266x.shtml" target="_blank" class="blacklink">工程技术</a></li>

            <li><a href='http://qy.flxxwang.com/117972843526/' target='_blank'>49911413713|277杭州新东都KTV</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7282569479943x.shtml" target="_blank" class="blacklink">女业务员</a></li>

            <li><a href='http://qy.flxxwang.com/35604212/' target='_blank'>中国食虫植物网淘宝总店</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/6192122311301x.shtml" target="_blank" class="blacklink">营运执行(客服发货园艺)</a></li>

            <li><a href='http://qy.flxxwang.com/167787016459/' target='_blank'>杭州财富核能人力资源培训有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/6624523117570x.shtml" target="_blank" class="blacklink">培训助理</a></li>

            <li><a href='http://qy.flxxwang.com/43357895/' target='_blank'>杭州沃顿投资管理有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7785634082184x.shtml" target="_blank" class="blacklink">运营策划</a></li>

            <li><a href='http://qy.flxxwang.com/1236888815367/' target='_blank'>杭州乐丰数码科技有限公司</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7841099364484x.shtml" target="_blank" class="blacklink">网店客服</a></li>

            <li><a href='http://qy.flxxwang.com/35573719/' target='_blank'>杭州金夫人婚纱摄影</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7761492359688x.shtml" target="_blank" class="blacklink">调色师</a></li>

            <li><a href='http://qy.flxxwang.com/2953422655750/' target='_blank'>浙江利达评估</a> &nbsp;<a href="http://hz.flxxwang.com/zhaopin/7840737736710x.shtml" target="_blank" class="blacklink">其他职位</a></li>

        </ul>
    </ul>
    <div class="clear"></div>
</div>--%>

<div class="wrap" id="rmmqgg">
    <h2 class="whtxt">热门名企</h2>
    <ul class="companylogos" id="companylogos"> 
    </ul>
    <div class="clear"></div>
</div>

<script type="text/javascript">
    var obj = document.getElementById("companylogos").getElementsByTagName("li");
    if (obj.length < 1) { document.getElementById('rmmqgg').style.display = 'none'; }
</script>

<div class="wrap">
	<div class="others">
        <h4 class="f12"><%=city.ShortName %>招聘频道介绍</h4>
        <p class="tips" style="padding-top:4px;">
            <%=SiteInfo.Name%><%=city.ShortName %>招聘频道为<%=city.ShortName %>求职者每日更新数十万个<%=city.ShortName %>招聘、<%=city.ShortName %>人才信息职位，真实有效、方便快捷，<%=city.ShortName %>人才市场选择<%=SiteInfo.Name%> 
            <a href="" class="keyword2"><%=city.ShortName %>招聘</a> 频道。
        </p>
    </div>
    <div class="others">
        <h4 class="f12"><%=city.ShortName %>招聘相关热门城市</h4>
        <ul>
            <li><a href="<%=Url.Action("Index",new{city="bj"}) %>" target="_blank">北京招聘</a></li>	
            <li><a href="<%=Url.Action("Index",new{city="sh"}) %>" target="_blank">上海招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="gz"}) %>" target="_blank">广州招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="sz"}) %>" target="_blank">深圳招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="tj"}) %>" target="_blank">天津招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cd"}) %>" target="_blank">成都招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="zz"}) %>" target="_blank">郑州招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="wh"}) %>" target="_blank">武汉招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="xa"}) %>" target="_blank">西安招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="jn"}) %>" target="_blank">济南招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cs"}) %>" target="_blank">长沙招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="hz"}) %>" target="_blank">杭州招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="su"}) %>" target="_blank">苏州招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cq"}) %>" target="_blank">重庆招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="dl"}) %>" target="_blank">大连招聘</a></li>
            <li><a href="<%=Url.Action("Index",new{city="nj"}) %>" target="_blank">南京招聘</a></li>        
            <li><a href="<%=Url.Action("Index",new{city="sjz"}) %>" target="_blank">石家庄招聘</a></li>
            <%--<li><a href="http://www.flxxwang.com/job/changecity/" target="_blank">更多城市</a></li>--%>
        </ul>
        <div class="clear"></div>
    </div>
    <div class="others">
        <ul class="friendlink">
            ﻿<strong>友情链接</strong>:
            <a href='http://www.rencai8.com/' target='_blank'>未名人才</a>&nbsp;
            <a href='http://<%=city.Code %>.51jz.cn/' target='_blank'><%=city.ShortName %>家政网</a>&nbsp;
            <a href='http://www.zhaopinfang.com/' target='_blank'>招聘房</a>&nbsp;
            <%--<a href='http://hz.fenlei168.com/' target='_blank'>杭州<%=SiteInfo.Name%></a>&nbsp;--%>
            <a href='http://www.emba163.cn' target='_blank'>金融培训网</a>&nbsp;
            <a href='http://www.studysc.com.cn/' target='_blank'>四川求学网</a>&nbsp;
            <a href='http://jz.hr1000.com' target='_blank'>荆州招聘网</a>&nbsp;
            <%--<a href='http://www.job592.com/hot-hangzhou/' target='_blank'>杭州招聘信息</a>&nbsp;--%>
            <%--<a href='http://hangzhou.138job.com' target='_blank'>杭州美容人才网</a>&nbsp;--%>
            <%--<a href='http://hangzhou.job128.com' target='_blank'>杭州招聘网</a>&nbsp;--%>
            <a href='http://www.yanqingidea.com' target='_blank'>北京平面设计师招聘</a>&nbsp;
            <a href='http://www.sckuaiji.cn' target='_blank'>北京会计培训</a>&nbsp;
            <a href='http://www.fczhaopin.cn' target='_blank'>丰城人才招聘网</a>&nbsp;
            <a href='http://www.zgczp.com' target='_blank'>中关村招聘网</a>&nbsp;
            <a href='http://www.cxzhaopin.com/' target='_blank'>长兴招聘网</a>&nbsp;
            <a href='http://www.hxrcsc.com/' target='_blank'>湖南人才网</a>&nbsp;
            <a href='http://www.loloxi.com/' target='_blank'>乐乐行</a>&nbsp;
            <a href='http://www.xnxww.com/' target='_blank'>大学生兼职网</a>&nbsp;
            <a href='http://www.ly-benet.net/' target='_blank'>洛阳电脑培训</a>&nbsp;
            <a href='http://www.farsight.com.cn/' target='_blank'>嵌入式培训</a>&nbsp;
            <a href='http://www.ybzhiye.com/' target='_blank'>调酒培训学校</a>&nbsp;
            <a href='http://www.gototsinghua.org.cn/' target='_blank'>清华大学研修班</a>&nbsp;
            <a href='http://www.tinlu.com/' target='_blank'>网络营销</a>&nbsp;
            <a href='http://www.mie168.com/' target='_blank'>管理信息化</a>&nbsp;
            <a href='http://www.aiduku.com/' target='_blank'>医学论文</a>&nbsp;
            <a href='http://job.365zww.com/' target='_blank'>个人简历</a>&nbsp;
            <a href='http://www.whzhaopin.cn/' target='_blank'>威海招聘网</a>&nbsp;
            <a href='http://www.xn--gmqtc099emtf.com' target='_blank'>仙桃人才网</a>&nbsp;  
            <%--<a href="/link.html" target="_blank">更多...</a>&nbsp;
            <a href="#" target="_blank">自动申请链接</a>--%>
        </ul>
    </div>
    <div class="clear"></div>
</div>
</asp:Content>
