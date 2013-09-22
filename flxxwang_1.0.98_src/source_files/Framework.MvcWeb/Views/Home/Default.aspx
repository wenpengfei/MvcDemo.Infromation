<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<string>" %>
<%@ Import Namespace="Framework.Common" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="Head" runat="server">
<%
    var city = ViewData["City"] as City;
%>
    <%--<base target="_blank" />--%><%--该句会导致很多脚本错误--%>
<title>【<%=city.ShortName %>分类信息】<%=city.ShortName %>免费发布信息 - <%=city.ShortName %><%=SiteInfo.Name%></title>
<meta name="Keywords"  content="<%=city.ShortName %>分类信息,<%=city.ShortName %>免费发布信息" />
<meta name="Description" content="<%=city.ShortName %><%=SiteInfo.Name%>，为你提供房产、车辆、招工、兼职、黄页等海量<%=city.ShortName %>分类信息，满足您不同的<%=city.ShortName %>免费发布信息需求。<%=city.ShortName %><%=SiteInfo.Name%>，最好的<%=city.ShortName %><%=SiteInfo.Name%>。" />
<link href="/Content/Fenlei/assets/css/home.default.css" type="text/css" rel="Stylesheet" />
<link href="/Content/Fenlei/assets/jTab/jTab.css" type="text/css" rel="Stylesheet" />
<link href="/Content/Fenlei/assets/css/tabMenu.css" type="text/css" rel="Stylesheet" />
<script src="/Scripts/jquery.watermark.js" type="text/javascript"></script>
<script src="/Scripts/jquery.validate.min.js" type="text/javascript"></script>
<script src="/Scripts/Kwicks-1.5.1/jquery.kwicks-1.5.1.js" type="text/javascript"></script>
<script src="/Content/Fenlei/assets/jTab/jquery.jtab.js" type="text/javascript"></script>
<script type="text/javascript">
    if (screen.width >= 1280) {
        document.write("<style type='text/css'>.block{width:229px;} .block em{width:110px} .screenWidth{width:1188px} #keyword{width:518px;} </style>");
    }
</script>
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="Main" runat="server">
<%
    var city = ViewData["City"] as City;
    var tid = ViewData["tid"];
%>
<div id="header">
    <div id="headerinside">
        <a href="<%=Url.Action("Default","Home",new{tid=tid}) %>" id="logo" target="_self">
            <img src="/Content/Fenlei/assets/images/logo/logo.gif" alt="中文最大生活信息门户"/>
        </a>
        <form>
            <div id="searchbar">
                <i id="key">
                    <input type="text" id="keyword" name="key" class="keyword" fdv="请输入类别名称或关键字" autocomplete="off" />
                </i>
                <input  type="submit" name="button" class="btnall" id="searchbtn" value="同城搜索" onmousemove="this.className='btnal2'" onmouseout="this.className=''" />
                <div class="clear"></div>
                <span id="hot">
                    <%--<a href="#">租房</a>
                    <a href="#">iphone4</a>
                    <a href="#">销售代表</a>
                    <a href="#">二手房</a>
                    <a href="#">ipad2</a>
                    <a href="#">同城交友</a>--%>
                </span>
            </div>
        </form>
        <a href="<%=Url.Action("Index","Post",new{tid=tid}) %>" id="fabu" target="_blank">免费发布信息</a>
    </div>
</div>

<div style="text-align:center;">
<%
    if (SiteInfo.IsTaojen)
    {
        %>
        <%--960*90首页横幅--%>
        <%=UnionAd.Baidu_960_90.Code %>
        <%
    }
    else
    {
        %>
        <%--728 x 90 - 首页横幅--%>
        <%=UnionAd.Google_728_90.Code %>
        <%    
    }
%>
</div>
<%--<div>
    <ul class="tabMenu">
	    <li><a href="#">Lorem</a></li>
	    <li><a href="#">Mauricii</a></li>
	    <li>
		    <a href="#">Periher</a>
		    <ul>
			    <li><a href="#">Hellenico</a></li>
			    <li><a href="#">Genere</a></li>
			    <li><a href="#">Indulgentia</a></li>
		    </ul>
	    </li>
	    <li><a href="#">Tyrio</a></li>
	    <li><a href="#">Quicumque</a></li>
    </ul>
    <div class="clear"></div>
</div>--%>

<%--<div>
    <ul class="kwicks">
        <li id="kwick1"></li>
        <li id="kwick2"></li>
        <li id="kwick3"></li>
        <li id="kwick4"></li>
    </ul>
</div>--%>

<div id="divCategories">
    <div id="col1" class="col">
        <div id="divHouse" class="block">
            <h2 class="hpic1"><a href="<%=Url.Action("Index","fangchan",new{tid=tid}) %>"><%=city.ShortName %>房产&raquo;</a></h2>
            <a href="<%=Url.Action("zufang","fangchan",new{tid=tid}) %>" class="red">房屋出租</a><%=HouseRent.Singleton.InfoCount[city.Id] %><br />
            <a href="<%=Url.Action("hezu","fangchan",new{tid=tid}) %>">房屋合租</a><%=HouseShare.Singleton.InfoCount[city.Id] %><br />
            <a href="<%=Url.Action("qiuzu","fangchan",new{tid=tid}) %>">房屋求租</a><%=HouseHire.Singleton.InfoCount[city.Id] %><br />
            <a href="<%=Url.Action("ershoufang","fangchan",new{tid=tid}) %>">二手房买卖</a><%=HouseSecond.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("duanzu","fangchan",new{tid=tid}) %>">短租房/日租房</a><%=HouseShort.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("xiezilou","fangchan",new{tid=tid}) %>">写字楼租售</a><%=HouseOffice.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("shangpu","fangchan",new{tid=tid}) %>">生意/商铺转让</a><%=HouseShop.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("qita","fangchan",new{tid=tid}) %>">厂房/仓库/土地</a><%=HouseOther.Singleton.InfoCount[city.Id] %><br />
        </div>
        <div id="divCar" class="block">
            <h2 class="hpic2"><a href="<%=Url.Action("Index","che",new{tid=tid}) %>" >车辆买卖与服务&raquo;</a></h2>
            <a href="<%=Url.Action("ershouche","che",new{tid=tid}) %>" class="red">二手汽车转让</a><%=CarSecondHand.Singleton.InfoCount[city.Id]%><br />
            <a href="http://hz.kuche.com/baojia/">新车报价</a><br />
            <a href="<%=Url.Action("danche","che",new{tid=tid}) %>">二手摩托车</a><%=CarMotor.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("zixingche","che",new{tid=tid}) %>">二手自行车/电动车</a><%=CarBicycle.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("zuche","huangye",new{tid=tid}) %>">租车</a><%=YellowPage.Singleton.InfoCount[YellowPageType.ZuChe][city.Id] %><br />
            <a href="<%=Url.Action("pinche","che",new{tid=tid}) %>">拼车/顺风车</a><%=Carpool.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("peijia","che",new{tid=tid}) %>">代驾/陪练/驾校</a><%=CarAccompany.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("cheliangfuwu","che",new{tid=tid}) %>">汽车服务/4S店</a><%=CarService.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("peijian","che",new{tid=tid}) %>">汽车配件/其他</a><%=CarFitting.Singleton.InfoCount[city.Id]%><br />
        </div>
        <div id="divEdu" class="block">
            <h2 class="hpic3"><a href="<%=Url.Action("Index","jiaoyu",new{tid=tid}) %>">教育培训&raquo;</a></h2>
            <em><a href="<%=Url.Action("fudao","jiaoyu",new{tid=tid}) %>">家教</a><%=EduTutor.Singleton.InfoCount[city.Id]%></em>
            <a href="<%=Url.Action("liuxue","jiaoyu",new{tid=tid}) %>">留学</a><%=EduAbroad.Singleton.InfoCount[city.Id]%><br />
            <em><a href="<%=Url.Action("waiyu","jiaoyu",new{tid=tid}) %>">外语</a><%=EduLanguage.Singleton.InfoCount[city.Id]%></em>
            <a  href="<%=Url.Action("jisuanji","jiaoyu",new{tid=tid}) %>">IT培训</a><%=EduIT.Singleton.InfoCount[city.Id]%><br />
            <em><a href="<%=Url.Action("zhiyepeix","jiaoyu",new{tid=tid}) %>">职业</a><%=EduProfession.Singleton.InfoCount[city.Id]%></em>
            <a href="<%=Url.Action("xueli","jiaoyu",new{tid=tid}) %>">学历</a><%=EduEducation.Singleton.InfoCount[city.Id]%><br />
            <em><a href="<%=Url.Action("mba","jiaoyu",new{tid=tid}) %>">管理</a><%=EduMBA.Singleton.InfoCount[city.Id]%></em>
            <a href="<%=Url.Action("shejipeixun","jiaoyu",new{tid=tid}) %>">设计</a><%=EduDesign.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("youjiao","jiaoyu",new{tid=tid}) %>">婴幼儿教育</a><%=EduBaby.Singleton.InfoCount[city.Id]%><br />
            <em><a href="<%=Url.Action("techang","jiaoyu",new{tid=tid}) %>">文体</a><%=EduSpecial.Singleton.InfoCount[city.Id]%></em>
            <a href="<%=Url.Action("peixunqita","jiaoyu",new{tid=tid}) %>">其他</a><%=EduOther.Singleton.InfoCount[city.Id]%><br />
        </div>
        <div id="divFriend" class="block lastrow">
            <h2 class="hpic4"><a href="<%=Url.Action("Index","jiaoyou",new{tid=tid}) %>" >交友征婚&raquo;</a></h2>
    	    <%--<em><a href="http://jiaoyou.flxxwang.com/hz/mm/<%=tid %>" class="red">找女友</a></em>
            <a href="http://jiaoyou.flxxwang.com/hz/gg/<%=tid %>" class="red">找男友</a>--%>
            <em><a href="<%=Url.Action("xingqu","jiaoyou",new{tid=tid}) %>">兴趣交友</a><%=FriendInterest.Singleton.InfoCount[city.Id]%></em>
            <a href="<%=Url.Action("laoxiang","jiaoyou",new{tid=tid}) %>">同乡会</a><%=FriendHome.Singleton.InfoCount[city.Id]%>
            <br />
            <em>
                <a href="<%=Url.Action("nvyou","jiaoyou",new{tid=tid}) %>">交友</a><%=FriendSex.Singleton.InfoCount[city.Id]%>
                <%--<i>/</i><a href="<%=Url.Action("zhenghun","jiaoyou",new{tid=tid}) %>">征婚</a>12501--%>
            </em>
            <a href="<%=Url.Action("jinengjiaohuan","jiaoyou",new{tid=tid}) %>">技能交换</a><%=FriendSkill.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("huodong","jiaoyou",new{tid=tid}) %>">驴友/活动/聚会</a><%=FriendActivity.Singleton.InfoCount[city.Id]%><br />
        </div>
    </div>
    <div id="col2" class="col">
        <div id="divSale" class="block">
            <h2 class="hpic6"><a href="<%=Url.Action("Index","tiaozao",new{tid=tid}) %>">跳蚤市场&raquo;</a></h2>
            <a href="<%=Url.Action("diannao","tiaozao",new{tid=tid}) %>">二手电脑</a><i>/</i><a href="<%=Url.Action("diannao", "TiaoZao", new { objecttype = 2 })%>">笔记本</a><%=SaleComputer.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("shouji","tiaozao",new{tid=tid}) %>">二手手机</a><%=SaleMobile.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("shoujihao","tiaozao",new{tid=tid}) %>">手机号码</a><%=SaleMobileNumber.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("shuma","tiaozao",new{tid=tid}) %>">数码产品</a><i>/</i><a href="<%=Url.Action("shuma", "TiaoZao", new { objecttype = 1 })%>">相机</a><%=SaleDigital.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("jiadian","tiaozao",new{tid=tid}) %>">二手家电</a><%=SaleElectric.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("ershoujiaju","tiaozao",new{tid=tid}) %>">二手家具/家居</a><%=SaleHome.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("fushi","tiaozao",new{tid=tid}) %>">服装箱包</a><i>/</i><a href="/<%=city.Code %>/tiaozao/meirong/">化妆品</a><%=SaleClothing.Singleton.InfoCount[city.Id] + SaleFacial.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("yingyou","tiaozao",new{tid=tid}) %>">母婴/儿童用品</a><%=SaleBaby.Singleton.InfoCount[city.Id]%>
            <%--<i>/</i><a href="<%=Url.Action("ertongyongpin","tiaozao",new{tid=tid}) %>">玩具</a>1687--%>
            <br />
            <a href="<%=Url.Action("yishu","tiaozao",new{tid=tid}) %>">艺术品/收藏品</a><%=SaleArt.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("tushu","tiaozao",new{tid=tid}) %>">图书/音像/软件</a><%=SaleBook.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("wenti","tiaozao",new{tid=tid}) %>">文体用品</a><%=SaleAthletics.Singleton.InfoCount[city.Id]%>
            <%--<i>/</i><a href="<%=Url.Action("yundongfushi","tiaozao",new{tid=tid}) %>">户外</a>
            <i>/</i><a href="<%=Url.Action("yueqi","tiaozao",new{tid=tid}) %>">乐器</a>1141--%>
            <br />
            <a href="<%=Url.Action("bangong","tiaozao",new{tid=tid}) %>">办公用品/设备</a><%=SaleOffice.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("ershoushebei","tiaozao",new{tid=tid}) %>">二手设备</a><%=SaleEquipment.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("huanwu","tiaozao",new{tid=tid}) %>">物品交换</a><%=SaleSwap.Singleton.InfoCount[city.Id]%>
            <%--<i>/</i><a href="/<%=city.Code %>/tiaozao/ershoufree/">赠送</a>--%>
            <br />
            <a href="<%=Url.Action("wangyou","tiaozao",new{tid=tid}) %>">网游/虚拟物品</a><%=SaleGame.Singleton.InfoCount[city.Id]%>
            <br />
    	    <a href="<%=Url.Action("tongxunyw","tiaozao",new{tid=tid}) %>">通讯</a>
            <%--<i>/</i><a href="/<%=city.Code %>/tiaozao/shangcheng.htm">商城</a>--%>
            <i>/</i><a href="<%=Url.Action("qita","tiaozao",new{tid=tid}) %>">其他</a><%=SaleCommunication.Singleton.InfoCount[city.Id] + SaleOther.Singleton.InfoCount[city.Id]%>
            <br />
        </div>
        <div id="divPet" class="block">
            <h2 class="hpic5"><a href="<%=Url.Action("Index","chongwu",new{tid=tid}) %>">宠物/宠物用品&raquo;</a></h2>
            <a href="<%=Url.Action("dog","chongwu",new{tid=tid}) %>">宠物狗</a><%=PetDog.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("cat","chongwu",new{tid=tid}) %>">猫</a><i>/</i><a href="/<%=city.Code %>/chongwu/huaniao/">花鸟鱼虫</a><%=PetCat.Singleton.InfoCount[city.Id] + PetBird.Singleton.InfoCount[city.Id]%><br />
		    <a href="<%=Url.Action("shipin","chongwu",new{tid=tid}) %>">宠物用品/食品</a><%=PetFood.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("cwhuwu","chongwu",new{tid=tid}) %>">宠物店/服务</a><%=PetService.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("cwzengsong","chongwu",new{tid=tid}) %>">宠物赠送/领养</a><%=PetGive.Singleton.InfoCount[city.Id]%><br />
        </div>
        <div id="divTicket" class="block lastrow">
            <h2 class="hpic7"><a href="<%=Url.Action("Index","piaowu",new{tid=tid}) %>">票务/卡券&raquo;</a></h2>
            <%--<a href="<%=Url.Action("huochepiao","piaowu",new{tid=tid}) %>">火车票转让</a><%=TicketTrain.Singleton.InfoCount[city.Id]%><br />--%>
            <a href="<%=Url.Action("jipiao","piaowu",new{tid=tid}) %>">特价机票</a><%=TicketAirplane.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("piao","piaowu",new{tid=tid}) %>">演出票</a><i>/</i><a href="<%=Url.Action("piao", "PiaoWu", new { objecttype = 4 })%>">电影票</a><%=TicketPerform.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("youle","piaowu",new{tid=tid}) %>">游乐园/景点</a><%=TicketPleasure.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("kaquan","piaowu",new{tid=tid}) %>">健身卡/优惠券</a>
            <%--<i>/</i><a href="<%=Url.Action("kaquan","piaowu",new{tid=tid}) %>" class="red">月饼券</a>--%>
            <%=TicketCard.Singleton.InfoCount[city.Id]%>
            <br />
            <%--<a href="/<%=city.Code %>/piaowu/?key=%25u56E2%25u8D2D">团购券</a><i>/</i>--%>
            <a href="<%=Url.Action("qtpiaowu","piaowu",new{tid=tid}) %>">其他票务</a><%=TicketOther.Singleton.InfoCount[city.Id]%><br />
            <a href="<%=Url.Action("piao","piaowu",new{tid=tid}) %>" class="red"><%=city.ShortName %>演出信息</a><br />
        </div>
    </div>
    <div id="col3" class="col">
        <div id="divRecruit1" class="block colspan2">
            <h2 class="hpic8"><a href="<%=Url.Action("Index","zhaopin",new{tid=tid}) %>"><%=city.ShortName %>招聘&raquo;</a></h2>
            <em><a href="<%=Url.Action("yewu","zhaopin",new{tid=tid}) %>">销售</a><%--64796--%></em>
            <a href="<%=Url.Action("kefu","zhaopin",new{tid=tid}) %>">客服</a><%--12493--%><br />
            <em><a href="<%=Url.Action("renli","zhaopin",new{objecttype=10}) %>">文员</a><%--21427--%></em>
            <a href="<%=Url.Action("renli","zhaopin",new{objecttype=9}) %>">助理</a><%--21427--%><br />
            <em><a href="<%=Url.Action("renli","zhaopin",new{objecttype=1}) %>">前台</a><%--21427--%></em>
            <a href="<%=Url.Action("xiezuochuban","zhaopin",new{objecttype=6}) %>">编辑</a><%--1045--%><br />
            <em><a href="<%=Url.Action("caiwushenji","zhaopin",new{objecttype=3}) %>">会计</a><%--6194--%></em>
            <a href="<%=Url.Action("caiwushenji","zhaopin",new{objecttype=4}) %>">出纳</a><%--6194--%><br />
            <a href="<%=Url.Action("renli","zhaopin",new{tid=tid}) %>">人事/行政/后勤</a><%--21427--%><br />
            <a href="<%=Url.Action("yewu","zhaopin",new{objecttype=7}) %>">房地产经纪人</a><%--64796--%><br />
            <a href="<%=Url.Action("wuliucangchu","zhaopin",new{objecttype=5}) %>">仓库管理员</a><%--5098--%><br />
            <a href="<%=Url.Action("guanggao","zhaopin",new{objecttype=9}) %>">平面设计</a><%--11238--%><br />
            <a href="<%=Url.Action("jisuanji","zhaopin",new{objecttype=13}) %>">网页设计/制作</a><%--11941--%><br />
            <a href="<%=Url.Action("jisuanji","zhaopin",new{objecttype=8}) %>">技术支持/维护</a><%--11941--%><br />
            <em><a href="<%=Url.Action("jisuanji","zhaopin",new{objecttype=17}) %>">网编</a><%--11896--%></em>
            <a href="<%=Url.Action("jisuanji","zhaopin",new{objecttype=18}) %>">网管</a><%--11896--%><br />
            <em><a href="<%=Url.Action("jiaoyupeixun","zhaopin",new{objecttype=1}) %>">教师</a><%--4463--%></em>
            <a href="<%=Url.Action("jiaoyupeixun","zhaopin",new{objecttype=3}) %>">幼教</a><%--4463--%><br />
            <em><a href="<%=Url.Action("yiyuanyiliao","zhaopin",new{objecttype=11}) %>">医生</a><%--1735--%></em>
            <a href="<%=Url.Action("yiyuanyiliao","zhaopin",new{objecttype=3}) %>">护士</a><%--1735--%><br />
            <a href="<%=Url.Action("guanggao","zhaopin",new{objecttype=5}) %>">装修装潢设计</a><%--11238--%><br />
        </div>
        <div id="divRecruit2" class="block">
            <h2 class="hpic9">热门行业&raquo;</h2>
            <a href="<%=Url.Action("lvyoujiudian","zhaopin",new{tid=tid}) %>">餐饮/服务/旅游</a><%--2067--%><br />
            <a href="<%=Url.Action("jisuanji","zhaopin",new{tid=tid}) %>">计算机/互联网/通信</a><%--11941--%><br />
		    <a href="<%=Url.Action("guanggao","zhaopin",new{tid=tid}) %>">广告/设计/咨询</a><%--11238--%><br />
            <em><a href="<%=Url.Action("yiyuanyiliao","zhaopin",new{tid=tid}) %>">医疗</a><%--1735--%></em>
            <a href="<%=Url.Action("qiche","zhaopin",new{tid=tid}) %>">汽车</a><%--1887--%><br />
            <em><a href="<%=Url.Action("jinrongbaoxian","zhaopin",new{tid=tid}) %>">保险</a><%--1008--%></em>
            <a href="<%=Url.Action("jiaoyupeixun","zhaopin",new{tid=tid}) %>">教育/培训</a><%--4463--%><br />
            <a href="<%=Url.Action("fangchanjianzhu","zhaopin",new{tid=tid}) %>">建筑/房产/物业</a><%--3920--%><br />
		    <a href="<%=Url.Action("meirongjianshen","zhaopin",new{tid=tid}) %>">美容/美发/保健</a><%--6936--%><br />
            <a href="<%=Url.Action("wentiyingshi","zhaopin",new{tid=tid}) %>">影视/娱乐/KTV</a><%--8399--%><br />
        </div>
        <div id="divJob1" class="block lastrow">
            <h2 class="hpic11"><a href="<%=Url.Action("Index","qiuzhi",new{tid=tid}) %>"><%=city.ShortName %>求职简历&raquo;</a></h2>
		    <em><a href="<%=Url.Action("yewu","qiuzhi",new{tid=tid}) %>">销售</a><%--64796--%></em>
            <a href="<%=Url.Action("kefu","qiuzhi",new{tid=tid}) %>">客服</a><%--12493--%><br />
		    <em><a href="<%=Url.Action("renli","qiuzhi",new{objecttype=10}) %>">文员</a><%--21427--%></em>
            <a href="<%=Url.Action("caiwushenji","qiuzhi",new{objecttype=3}) %>">会计</a><%--6194--%><br />
		    <em><a href="<%=Url.Action("jiaoyupeixun","qiuzhi",new{objecttype=1}) %>">教师</a><%--4463--%></em>
            <a href="<%=Url.Action("yiyuanyiliao","qiuzhi",new{objecttype=3}) %>">护士</a><%--1735--%><br />
            <a href="<%=Url.Action("renli","qiuzhi",new{tid=tid}) %>">人事/行政/后勤</a><%--21427--%><br />
            <a href="<%=Url.Action("guanggao","qiuzhi",new{objecttype=9}) %>">平面设计</a><%--11238--%><br />
        </div>
        <%--<div class="clear"></div>--%>
    </div>
    <div id="col4" class="col">
        <div id="divRecruit3" class="block">
            <h2 style="background:none;">&nbsp;</h2>
            <a href="<%=Url.Action("shengchankaifa","zhaopin",new{tid=tid}) %>">普工/技工</a><%--12258--%><br />
            <em><a href="<%=Url.Action("shengchankaifa","zhaopin",new{objecttype=3}) %>">电工</a><%--12258--%></em>
            <a href="<%=Url.Action("shengchankaifa","zhaopin",new{objecttype=7}) %>">焊工</a><%--12258--%><br />
            <em><a href="<%=Url.Action("siji","zhaopin",new{tid=tid}) %>">司机</a><%--11197--%></em>
            <a href="<%=Url.Action("jiazhengbaojie","zhaopin",new{objecttype=1}) %>">保安</a><%--3578--%><br />
            <em><a href="<%=Url.Action("lvyoujiudian","zhaopin",new{objecttype=5}) %>">服务员</a><%--13496--%></em>
            <a href="<%=Url.Action("lvyoujiudian","zhaopin",new{objecttype=3}) %>">厨师</a><%--13496--%><br />
            <em><a href="<%=Url.Action("chaoshishangye","zhaopin",new{objecttype=6}) %>">收银</a><%--7887--%></em>
            <a href="<%=Url.Action("lvyoujiudian","zhaopin",new{objecttype=1}) %>">配菜</a><%--13412--%><br />
            <em><a href="<%=Url.Action("chaoshishangye","zhaopin",new{objecttype=5}) %>">营业员</a><%--7887--%></em>
            <a href="<%=Url.Action("chaoshishangye","zhaopin",new{objecttype=4}) %>">导购</a><%--7887--%><br />
            <em><a href="<%=Url.Action("jiazhengbaojie","zhaopin",new{objecttype=2}) %>">保洁</a><%--3567--%></em>
            <a href="<%=Url.Action("jiazhengbaojie","zhaopin",new{objecttype=3}) %>">保姆</a><%--3567--%><br />
            <em><a href="<%=Url.Action("wuliucangchu","zhaopin",new{objecttype=10}) %>">快递员</a><%--5098--%></em>
            <a href="<%=Url.Action("wuliucangchu","zhaopin",new{objecttype=6}) %>">搬运工</a><%--5098--%><br />
            <em><a href="<%=Url.Action("meirongjianshen","zhaopin",new{objecttype=7}) %>">美容师</a><%--6936--%></em>
            <a href="<%=Url.Action("meirongjianshen","zhaopin",new{objecttype=5}) %>">发型师</a><%--6936--%><br />
            <a href="<%=Url.Action("meirongjianshen","zhaopin",new{objecttype=13}) %>">化妆师</a><%--6936--%><br />
            <a href="<%=Url.Action("meirongjianshen","zhaopin",new{objecttype=12}) %>">足疗保健</a><%--6936--%><br />
            <a href="<%=Url.Action("wentiyingshi","zhaopin",new{objecttype=8}) %>">酒吧服务员</a><%--8380--%><br />
            <a href="<%=Url.Action("jiazhengbaojie","zhaopin",new{tid=tid}) %>">家政保洁/安保</a><%--3578--%><br />
            <a href="<%=Url.Action("shichang","zhaopin",new{tid=tid}) %>">市场营销/公关媒介</a><%--246--%><br />
        </div>
        <div id="divPartJob" class="block">
            <h2 class="hpic10"><a href="<%=Url.Action("jianzhi","qiuzhi",new{tid=tid}) %>">兼职信息&raquo;</a></h2>
            <em><a href="<%=Url.Action("jianzhixuesheng","zhaopin",new{tid=tid}) %>">学生兼职</a><%--6245--%></em>
            <a href="<%=Url.Action("JianZhiXuesheng","qiuzhi",new{objecttype=2}) %>">实习生</a><%--6245--%><br />
            <em><a href="<%=Url.Action("JianZhiCanyinFuwu","qiuzhi",new{objecttype=6}) %>">钟点工</a><%--2067--%></em>
            <a href="<%=Url.Action("jianzhiyuyanwenzi","zhaopin",new{tid=tid}) %>">翻译</a>424<br />
            <em><a href="<%=Url.Action("JianZhiXiaoshouCuxiao","qiuzhi",new{objecttype=7}) %>">促销</a><%--2891--%></em>
            <a href="<%=Url.Action("JianZhiCaiwuFalv","qiuzhi",new{objecttype=1}) %>">会计</a><%--243--%><br />
            <em><a href="<%=Url.Action("JianZhiLiyiYanyi","qiuzhi",new{objecttype=2}) %>">礼仪</a><%--1241--%></em>
            <a href="<%=Url.Action("JianZhiJiaoyuPeixun","qiuzhi",new{objecttype=1}) %>">家教</a><%--1070--%><br />
            <a href="<%=Url.Action("JianZhiXiaoshouCuxiao","qiuzhi",new{objecttype=6}) %>">传单派发</a><%--2891--%><br />
            <a href="<%=Url.Action("JianZhiPingMian","zhaopin",new{tid=tid}) %>">设计制作</a><%--949--%><br />
            <a href="<%=Url.Action("JianZhiJisuanji","qiuzhi",new{objecttype=1}) %>">网站建设</a><%--949--%><br />
            <a href="<%=Url.Action("jianzhiqita","zhaopin",new{tid=tid}) %>">其他兼职</a><%--2047--%><br />
        </div>
        <div id="divJob2" class="block lastrow">
            <h2 class="hpic11" style="background:none; padding-left:10px"><a href="<%=Url.Action("Index","jianli",new{tid=tid}) %>">简历搜索&raquo;</a></h2>
            <a href="<%=Url.Action("shengchankaifa","qiuzhi",new{tid=tid}) %>">普工/技工/生产</a><%--12258--%><br />
            <em><a href="<%=Url.Action("lvyoujiudian","qiuzhi",new{objecttype=5}) %>">服务员</a><%--13496--%></em>
            <a href="<%=Url.Action("lvyoujiudian","qiuzhi",new{objecttype=3}) %>">厨师</a><%--13496--%><br />
            <em><a href="<%=Url.Action("jiazhengbaojie","qiuzhi",new{objecttype=3}) %>">保姆</a><%--3578--%></em>
            <a href="<%=Url.Action("jiazhengbaojie","qiuzhi",new{objecttype=1}) %>">保安</a><%--3578--%><br />
            <em><a href="<%=Url.Action("siji","qiuzhi",new{tid=tid}) %>">司机</a><%--11197--%></em>
            <a href="<%=Url.Action("chaoshishangye","qiuzhi",new{objecttype=4}) %>">导购</a><%--7887--%><br />
            <a href="<%=Url.Action("wuliucangchu","qiuzhi",new{objecttype=5}) %>">仓库管理员</a><%--5098--%><br />
        </div>
    </div>
    <div id="col5" class="col lastcol">
        <div id="yp1" class="block">
            <h2 class="hpic12">
                <%--<a href="/<%=city.Code %>/tuangou/?ref=homeright" target="_blank" id="tuanlink">今日团购&raquo;</a>--%>
                <a href="<%=Url.Action("Index","huangye",new{tid=tid}) %>">生活服务&raquo;</a>
            </h2> 
            <em><a href="<%=Url.Action("banjia","huangye",new{tid=tid}) %>">搬家</a><%=YellowPage.Singleton.InfoCount[YellowPageType.BanJia][city.Id] %></em>
            <a href="<%=Url.Action("zhuangxiu","huangye",new{tid=tid}) %>">装修</a><%=YellowPage.Singleton.InfoCount[YellowPageType.ZhuangXiu][city.Id] %><br />
            <em><a href="<%=Url.Action("baojie","huangye",new{tid=tid}) %>">保洁</a><%=YellowPage.Singleton.InfoCount[YellowPageType.BaoJie][city.Id] %></em>
            <a href="<%=Url.Action("jiazheng","huangye",new{tid=tid}) %>">家政</a><%=YellowPage.Singleton.InfoCount[YellowPageType.JiaZheng][city.Id] %><br />
            <em><a href="<%=Url.Action("huishou","huangye",new{tid=tid}) %>">回收</a><%=YellowPage.Singleton.InfoCount[YellowPageType.HuiShou][city.Id] %></em>
            <a href="<%=Url.Action("zulin","huangye",new{tid=tid}) %>">租赁</a><%=YellowPage.Singleton.InfoCount[YellowPageType.ZuLin][city.Id] %><br />
            <em><a href="<%=Url.Action("hunqing","huangye",new{tid=tid}) %>" >婚庆</a><%=YellowPage.Singleton.InfoCount[YellowPageType.HunQing][city.Id] %></em>
            <a href="<%=Url.Action("sheying","huangye",new{tid=tid}) %>">摄影</a><%=YellowPage.Singleton.InfoCount[YellowPageType.SheYing][city.Id] %><br />
            <em><a href="<%=Url.Action("zuche","huangye",new{tid=tid}) %>">租车</a><%=YellowPage.Singleton.InfoCount[YellowPageType.ZuChe][city.Id] %></em>
            <a href="<%=Url.Action("shutong","huangye",new{tid=tid}) %>">疏通</a><%=YellowPage.Singleton.InfoCount[YellowPageType.ShuTong][city.Id] %><br />
            <em><a href="<%=Url.Action("jiancai","huangye",new{tid=tid}) %>">建材</a><%=YellowPage.Singleton.InfoCount[YellowPageType.JianCai][city.Id] %></em>
            <a href="<%=Url.Action("shipin","huangye",new{tid=tid}) %>">食品</a><%=YellowPage.Singleton.InfoCount[YellowPageType.ShiPin][city.Id] %><br />
            <a href="<%=Url.Action("DianNaoWeiXiu","huangye",new{tid=tid}) %>">电脑维修</a><%=YellowPage.Singleton.InfoCount[YellowPageType.DianNaoWeiXiu][city.Id] %><br />
            <a href="<%=Url.Action("jiajuweixiu","huangye",new{tid=tid}) %>">家居维修</a><%=YellowPage.Singleton.InfoCount[YellowPageType.JiaJuWeiXiu][city.Id] %><br />
            <a href="<%=Url.Action("JiaDianWeiXiu","huangye",new{tid=tid}) %>">家电维修</a><%=YellowPage.Singleton.InfoCount[YellowPageType.JiaDianWeiXiu][city.Id] %><br />
            <a href="<%=Url.Action("fangweixiu","huangye",new{tid=tid}) %>">房屋维修/防水</a><%=YellowPage.Singleton.InfoCount[YellowPageType.FangWeiXiu][city.Id] %><br />
            <em><a href="<%=Url.Action("lipinxianhua","huangye",new{tid=tid}) %>">鲜花</a><%=YellowPage.Singleton.InfoCount[YellowPageType.LiPinXianHua][city.Id] %></em>
            <a href="<%=Url.Action("qingdian","huangye",new{tid=tid}) %>">庆典</a><%=YellowPage.Singleton.InfoCount[YellowPageType.QingDian][city.Id] %><br />
            <em><a href="<%=Url.Action("canyin","huangye",new{tid=tid}) %>">餐饮</a><%=YellowPage.Singleton.InfoCount[YellowPageType.CanYin][city.Id] %></em>
            <a href="<%=Url.Action("zhuankeyiyuan","huangye",new{tid=tid}) %>">专科医院</a><%=YellowPage.Singleton.InfoCount[YellowPageType.ZhuanKeYiYuan][city.Id] %><br />
        </div>
        <div id="yp2" class="block">
            <h2 class="hpic13"><a href="<%=Url.Action("shangwu","huangye",new{tid=tid}) %>">商务服务&raquo;</a></h2>
            <em><a href="<%=Url.Action("zhuce","huangye",new{tid=tid}) %>">工商注册</a><%=YellowPage.Singleton.InfoCount[YellowPageType.ZhuCe][city.Id] %></em>
            <a href="<%=Url.Action("kuaidi","huangye",new{tid=tid}) %>">快递</a><%=YellowPage.Singleton.InfoCount[YellowPageType.KuaiDi][city.Id] %><br />
            <em><a href="<%=Url.Action("wuliu","huangye",new{tid=tid}) %>">物流</a><%=YellowPage.Singleton.InfoCount[YellowPageType.WuLiu][city.Id] %></em>
            <a href="<%=Url.Action("huoyun","huangye",new{tid=tid}) %>">货运专线</a><%=YellowPage.Singleton.InfoCount[YellowPageType.HuoYun][city.Id] %><br />
            <a href="<%=Url.Action("danbaobaoxiantouzi","huangye",new{tid=tid}) %>">担保/保险/投资</a><%=YellowPage.Singleton.InfoCount[YellowPageType.DanBaoBaoXianTouZi][city.Id] %><br />
            <a href="<%=Url.Action("yinshua","huangye",new{tid=tid}) %>">印刷</a><i>/</i>
            <a href="<%=Url.Action("yinshua","huangye",new{objecttype=8}) %>">包装</a><%=YellowPage.Singleton.InfoCount[YellowPageType.YinShua][city.Id] %><br />
            <a href="<%=Url.Action("penhui","huangye",new{tid=tid}) %>">喷绘</a><i>/</i>
            <a href="<%=Url.Action("zhika","huangye",new{tid=tid}) %>">制卡</a><%=YellowPage.Singleton.InfoCount[YellowPageType.PenHui][city.Id]+YellowPage.Singleton.InfoCount[YellowPageType.ZhiKa][city.Id] %><br />
            <a href="<%=Url.Action("wangzhan","huangye",new{tid=tid}) %>">网站建设/推广</a><%=YellowPage.Singleton.InfoCount[YellowPageType.WangZhan][city.Id] %><br />
            <a href="<%=Url.Action("fanyi","huangye",new{tid=tid}) %>">翻译/速记</a><%=YellowPage.Singleton.InfoCount[YellowPageType.FanYi][city.Id] %><br />
            <a href="<%=Url.Action("SheJiCeHua","huangye",new{tid=tid}) %>">设计策划</a><%=YellowPage.Singleton.InfoCount[YellowPageType.SheJiCeHua][city.Id] %><br />
            <a href="<%=Url.Action("lvshi","huangye",new{tid=tid}) %>">法律咨询</a><%=YellowPage.Singleton.InfoCount[YellowPageType.Lvshi][city.Id] %><br />
            <a href="<%=Url.Action("caishui","huangye",new{tid=tid}) %>" >财务会计/评估</a><%=YellowPage.Singleton.InfoCount[YellowPageType.CaiShui][city.Id] %><br />
            <a href="<%=Url.Action("chuanmei","huangye",new{tid=tid}) %>">广告媒体</a><%=YellowPage.Singleton.InfoCount[YellowPageType.ChuanMei][city.Id] %><br />
            <a href="<%=Url.Action("ShangBiaoZhuanLi","huangye",new{tid=tid}) %>">商标专利</a><%=YellowPage.Singleton.InfoCount[YellowPageType.ShangBiaoZhuanLi][city.Id] %><br />
            <a href="<%=Url.Action("zhaoshang","huangye",new{tid=tid}) %>">招商加盟</a><br />
        </div>
        <div id="yp3" class="block lastrow">
            <h2 class="hpic14"><a href="<%=Url.Action("lvyouxiuxian","huangye",new{tid=tid}) %>">旅游/酒店/签证&raquo;</a></h2>
            <em><a href="<%=Url.Action("GuoNeiLvYou","huangye",new{tid=tid}) %>">国内游</a><%=YellowPage.Singleton.InfoCount[YellowPageType.GuoNeiLvYou][city.Id] %></em>
            <a href="<%=Url.Action("zhoubianyou","huangye",new{tid=tid}) %>">周边游</a><%=YellowPage.Singleton.InfoCount[YellowPageType.ZhouBianYou][city.Id] %><br />
            <em><a href="<%=Url.Action("jdyd","huangye",new{tid=tid}) %>">酒店</a><%=YellowPage.Singleton.InfoCount[YellowPageType.Jdyd][city.Id] %></em>
            <a href="<%=Url.Action("LvXingShe","huangye",new{tid=tid}) %>">旅行社</a><%=YellowPage.Singleton.InfoCount[YellowPageType.LvXingShe][city.Id] %><br />
        </div>
    </div>
    <div class="clear"></div>
</div>

<%--<div id="row4">--%>
    <%--<div id="divActivity" class="col">
        <div class="block">
            <%--<h3><a href="#">Taojen圈子</a>/<a href="#">活动</a></h3>
  	        <ul>
                <li><a href="#" target="_blank">玩转金秋，阳澄湖大闸蟹免费送</a></li>
                <li class="nob"><a href="#" target="_blank" class="red">拿什么求婚最给力？58告诉你</a></li>
                <li><a href="#" target="_blank">出行旅游选短租 温馨如家50元</a></li>
                <li class="nob"><a href="#" target="_blank" class="red">招聘旺季!<%=SiteInfo.Name%>充值送招聘助手</a></li>
                <li><a href="#" target="_blank">taojen团购与您一起发现生活之美</a></li>
            </ul>--%>
        <%--</div>
    </div>--%>
    <%--<div id="divTuanGou" class="col">
        <div class="block">
            <%--<ul>
                <li class="odd">
                    <h3><a href="#" title="">显示示40个文字显示示40个文字显示示40个文字显示示40个文字显示示40个文字...</a></h3>
                    <a href="#"><img align="left" src="#"></a>
                    原价<b class="yuan">200</b>元<br>
                    现价<b class="jiage">100</b>元<br>
                    <input type="button" value="去看看" onclick="window.open('#')" />
                </li>
                <li>
                    <h3><a href="#" title="">显示示40个文字显示示40个文字显示示40个文字显示示40个文字显示示40个文字...</a></h3>
                    <a href="#"><img align="left" src="#"></a>
                    原价<b class="yuan">200</b>元<br>
                    现价<b class="jiage">100</b>元<br>
                    <input type="button" value="去看看" onclick="window.open('#')" />
                </li>
                <li class="odd">
                    <h3><a href="#" title="">显示示40个文字显示示40个文字显示示40个文字显示示40个文字显示示40个文字...</a></h3>
                    <a href="#"><img align="left" src="#"></a>
                    原价<b class="yuan">200</b>元<br>
                    现价<b class="jiage">100</b>元<br>
                    <input type="button" value="去看看" onclick="window.open('#')" />
                </li>
                <li>
                    <h3><a href="#" title="">显示示40个文字显示示40个文字显示示40个文字显示示40个文字显示示40个文字...</a></h3>
                    <a href="#"><img align="left" src="#"></a>
                    原价<b class="yuan">200</b>元<br>
                    现价<b class="jiage">100</b>元<br>
                    <input type="button" value="去看看" onclick="window.open('#')" />
                </li>
                <li class="odd">
                    <h3><a href="#" title="">显示示40个文字显示示40个文字显示示40个文字显示示40个文字显示示40个文字...</a></h3>
                    <a href="#"><img align="left" src="#"></a>
                    原价<b class="yuan">200</b>元<br>
                    现价<b class="jiage">100</b>元<br>
                    <input type="button" value="去看看" onclick="window.open('#')" />
                </li>
                <li>
                    <h3><a href="#" title="">显示示40个文字显示示40个文字显示示40个文字显示示40个文字显示示40个文字...</a></h3>
                    <a href="#"><img align="left" src="#"></a>
                    原价<b class="yuan">200</b>元<br>
                    现价<b class="jiage">100</b>元<br>
                    <input type="button" value="去看看" onclick="window.open('#')" />
                </li>
            </ul>--%>
        <%--</div>
    </div>--%>
    <%--<div id="divjTab" class="col">
        <div class="block">
            <%--<div class="project_section">
	            <h2>推荐信息</h2>
            </div>
            <div class="project_section">
	            <h2>话费充值</h2>
            </div>
            <div class="project_section">
	            <h2>彩票频道</h2>
            </div>--%>
        <%--</div>
    </div>--%>
    <%--<div class="clear"></div>--%>
<%--</div>--%>

<div style="text-align:center;">
    <%
        if (SiteInfo.IsTaojen)
        {
            %>
            <%--960*90首页横幅--%>
            <%=UnionAd.Baidu_960_90.Code %>
            <%
        }
        else
        {
            %>
            <%--728 x 90 - 首页横幅--%>
            <%=UnionAd.Google_728_90.Code %>
            <%    
        }
    %>
</div>

<%--<div id="row5">
    <div class="block screenWidth">
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
</div>--%>

<%--暂时用热门城市,应该用热门区域更好--%>
<div id="row5">
    <div class="block screenWidth">
        <strong>热门城市：</strong>
        <li><a href='/bj/<%=tid %>' target='_self'>北京</a></li>
        <li><a href='/sh/<%=tid %>' target='_self'>上海</a></li>
        <li><a href='/gz/<%=tid %>' target='_self'>广州</a></li>
        <li><a href='/sz/<%=tid %>' target='_self'>深圳</a></li>
        <li><a href='/cd/<%=tid %>' target='_self'>成都</a></li>
        <li><a href='/cs/<%=tid %>' target='_self'>长沙</a></li>
        <li><a href='/hz/<%=tid %>' target='_self'>杭州</a></li>
        <li><a href='/jn/<%=tid %>' target='_self'>济南</a></li>
        <li><a href='/su/<%=tid %>' target='_self'>苏州</a></li>
        <li><a href='/tj/<%=tid %>' target='_self'>天津</a></li>
        <li><a href='/wh/<%=tid %>' target='_self'>武汉</a></li>
        <li><a href='/fz/<%=tid %>' target='_self'>福州</a></li>
    </div>
</div>

<div id="footer" class="screenWidth">
    <div class="bg">
        <div id="contact">
            <a href="#" title="有问题请与<%=SiteInfo.Name%>客服进行对话" class="fduihua">帮助中心</a>
            <a href="#" class="red">我要删除信息</a>|
            <a href="#">关于我们</a>|
            <a href="#">联系我们</a>|
            <a href="#">推广服务</a>|
            <a href="#"><%=SiteInfo.Name%>招聘</a>|
            <a href="#">使用协议及公告</a> <br />
            <%--京公网安备xxxxxxxxxx号--%> 
            <a href="http://www.miibeian.gov.cn/" style="color:#666">浙ICP备09071137号-4</a>
        </div>
    </div>
    <div id="flink">﻿
        ﻿<strong>友情链接</strong>:
        <a href='http://cylnz.taobao.com' target='_blank'>彩衣岭时尚前卫女装</a>&nbsp;
	    <a href='http://www.ly179.com' target='_blank'>临沂信息云</a>&nbsp;
	    <a href='http://www.shikong404.com' target='_blank'>时空404</a>&nbsp;
	    <a href='http://www.wenshutang.com' target='_blank'>问书堂</a>&nbsp;
        <%--<a href='http://hangzhou.fangtoo.com/' target='_blank'>杭州租房-房途网</a>&nbsp;--%>
        <a href='http://www.daichao.com/' target='_blank'>股票投资网</a>&nbsp;
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
        <%--<a href="/link.html" target="_blank">更多...</a>--%>
    </div>
    <div class="clear"></div>
</div>

<script type="text/javascript">
    var searchUrl="/<%=city.Code %>/{2}/{1}/1/0/0/-1/-333/-444/-1/0/-1/-1/-1/-1/0/-1/-1/-1/-1/-1/-1";
    $(function () {
        //        $('.kwicks').kwicks({
        //            max: 205,
        //            spacing: 5
        //        });

        $("#keyword").watermark({ html: '请输入类别名称或关键字', css: { left: '40px', color: '#ccc'} });

        //tuanGouPlay(gAdTuanGou);

        $("a[target!='_self']").attr("target", "_blank");//含没设置target的a元素.
        //        $("#keyword").autocomplete({ source: ["c++", "java", "php", "coldfusion", "javascript", "asp", "ruby"] });
        $("#keyword").autocomplete({
            source: function (request, response) {
                var keyword = new Keyword();
                keyword.search([request.term, $f.cookie.get("city"), null, 12], function (data) {
                    response($.map(data, function (item) {
                        item.q = request.term;
                        item.label = item.Key;
                        return item;
                    }));
                });
            },
            minLength: 1,

            //            focus: function (event, ui) {
            //                $("#keyword").val(ui.item.Key);
            //                return false;
            //            },
            select: function (event, ui) {
                //              $("#keyword").val(ui.item.Key);

                var url = searchUrl;
                if (ui.item.ParentCode == "ZhaoPin|QiuZhi") {
                    url = url.replace("{2}", "zhaopin");
                }
                else {
                    url = url.replace("{2}", ui.item.ParentCode);
                }
                if (ui.item.Code != null) {
                    url = url.replace("{1}", ui.item.Code);
                }
                else {
                    url = url.replace("{1}", "Index");
                }
                if (ui.item.ObjType != null) {
                    url = url.replace("-333", ui.item.ObjType);
                }
                else {
                    url = url.replace("-333", 0);
                }
                if (ui.item.Tag != null) {
                    url = url.replace("-444", ui.item.Tag);
                }
                else {
                    url = url.replace("-444", 0);
                }
                url = encodeURI(url);
                location.href = url;
                return true;
            }
        })
        .data("autocomplete")._renderItem = function (ul, item) {
            var key = item.Key.replace(item.q, "<span class='q'>" + item.q + "</span>");
            return $("<li></li>")
            .data("item.autocomplete", item)
            .append("<a><table><tr><td class='left'>" + key + "</td><td class='right'>约&nbsp;" + item.Total + "&nbsp;条</td></tr></table></a>")
			.appendTo(ul);
        };
    });
    
//    $('.tabMenu').find('> li').hover(function () {
//        $(this).find('ul').stop(true, true).slideToggle(1000, "easeOutBounce");
//    });

    $(function () {
        $('div.project_section').jTab({
            tabTitle: 'h2'
        });
    });

    var gAdTuanGou = 0;
    var direction = 1;
    function tuanGouPlay() {
        $("#divTuanGou .block").animate({ scrollLeft: gAdTuanGou * 630 }, { duration: 1000, easing: "easeOutQuad", complete: function () {
            if (gAdTuanGou == 0) {
                direction = 1;
            }
            if (gAdTuanGou == 2) {
                direction = -1;
            }
            gAdTuanGou = gAdTuanGou + direction;
            setTimeout(tuanGouPlay,5000);
        }
        });
}
</script>

</asp:Content>



