<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%var city = ViewData["City"] as City; %>
<title><%=city.ShortName %>二手网 <%=city.ShortName %>二手闲置物品交易网 - <%=city.ShortName %><%=SiteInfo.Name%></title> 
<meta name="keywords" content="<%=city.ShortName %>二手网 <%=city.ShortName %>二手闲置物品" /> 
<meta name="description" content="<%=city.ShortName %>二手闲置物品交易网，是专门为<%=city.ShortName %>用户提供的二手闲置物品交易平台。您可以发布、查找<%=city.ShortName %>二手电脑、二手手机、二手家电、二手家具、日用品、旧书等二手闲置物品信息。买卖二手物品，尽在<%=city.ShortName %>二手网" /> 
<link href="/Content/Fenlei/ui6/index/sale.css?v=4" type="text/css" rel="stylesheet" />
<%--<script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/boot_toplist_version.js"></script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<%var city = ViewData["City"] as City;%>
<div id="header">
    <div id="headerinside">
        <div id="logo">
            <a href="<%=Url.Action("Default","Home") %>" target="_self">
                <img src="/Content/Fenlei/assets/images/logo/logo.gif" alt="中文最大生活信息门户"/>
            </a>
            <span>
                <a href="" target="_self"><b>跳蚤市场</b></a>
            </span>
        </div>
        <%--<form onsubmit='b_query();return false;'>
            <div id="searchbar">
                <i id="key">
                    <input type="text" id="keyword" name="key" class="keyword" fdv="请输入类别名称或关键字" autocomplete="off" />
                </i>
                <input  type="submit" name="button" class="btnall" id="searchbtn" value="同城搜索" onmousemove="this.className='btnal2'" onmouseout="this.className=''" />
            </div>
        </form>--%>
        <a href="<%=Url.Action("s2","post",new{values="tiaozao"}) %>" id="fabu">免费发布信息</a>
    </div>
</div>

<!---focus--->
<div class="wrap">
    <div class="rightxt">
        <div class="seartxt">
            <h2>热门搜索</h2>
	        <p>
                <a href="<%=Url.Action("diannao", new { wd = "ipad2"})%>">ipad2</a>
                <a href="<%=Url.Action("shouji", new {wd="iphone4"})%>"><b>iphone4</b></a><br />
                <a href="<%=Url.Action("jiadian", new {wd="洗衣机"})%>">洗衣机</a>
                <a href="<%=Url.Action("shuma", new {wd="PSP"})%>"><b>PSP</b></a>
                <a href="<%=Url.Action("diannao", new {wd="硬盘"})%>" class="red">硬盘</a><br />
                <a href="<%=Url.Action("bangong", new {wd="电脑桌"})%>">电脑桌</a>
                <a href="<%=Url.Action("shouji", new {wd="诺基亚"})%>">诺基亚</a><br />
                <a href="<%=Url.Action("ershoujiaju", new {wd="床"})%>">床/床垫</a>
                <a href="<%=Url.Action("diannao", new {wd="显示器"})%>" style="margin-left:20px">显示器</a>
            </p>
        </div>
        <div class="zaqi mt10">
            <h2>杂七杂八</h2>
            <p>
                <a href="<%=Url.Action("qita", new { objecttype = 1})%>">闲置礼品</a>
                <a href="<%=Url.Action("meirong")%>">美容保健</a>
                <a href="<%=Url.Action("qita", new { objecttype = 4})%>">五花八门</a>
                <a href="<%=Url.Action("tushu")%>">图书</a>
                <a href="<%=Url.Action("zixingche", "che")%>" class="red">二手自行车</a>
                <a href="<%=Url.Action("wenti", new { objecttype = 1})%>">户外用品</a>
            </p>
        </div>
    </div>

	<div class="lbsear">
    	<div class="lhb">
            <h2>类别选择</h2>
        </div>
        <div class="content" id="ymenu-side">
            <ul class="ym-mainmnu">
                <li class="ym-tab">
                    <span class="dlb"><a href="<%=Url.Action("diannao")%>">二手电脑/配件</a>、<a href="<%=Url.Action("diannao",new{objecttype=2})%>">笔记本</a></span>
                    <ul class="ym-submnu">
                        <%
                            foreach (var obj in SaleComputer.Singleton.ObjectTypeCollection)
                            {
                                %>
                                <li>
                                    <p>
                                        <b><a href="<%=Url.Action("diannao",new{objecttype=obj.Id})%>"><%=obj.Name %></a></b>
                                        <span>
                                            <%
                                                var tagCollection = SaleComputer.Singleton.TagCollection.Where(item => item.ObjectTypeId == obj.Id);
                                                foreach (var tag in tagCollection)
                                                {
                                                    %>
                                                    <a href="<%=Url.Action("diannao",new{objecttype=obj.Id,tag=tag.Id})%>"><%=tag.Name %></a>
                                                    <%
                                                }
                                            %>
                                        </span>
                                    </p>
                                </li>
                                <%
                            }
                        %>
                    	<%--<li>
                            <p>
                                <b><a href="<%=Url.Action("diannao",new{objecttype=1})%>">台式机</a></b>
                                <span>
                                    <a href="<%=Url.Action("diannao",new{objecttype=1,tag=25})%>">组装机</a>
                                    <a href="<%=Url.Action("diannao",new{objecttype=1,tag=24})%>">品牌机</a>
                                </span>
                            </p>
                        </li>
                        <li>
                            <b><a href="/bijiben/">笔记本</a></b>
                            <span>
                                <a href="/apple/">苹果</a>
                                <a href="/dell/">戴尔</a>
                                <a href="/lenovo/">联想</a>
                                <a href="/ibm/">IBM</a>
                                <a href="/compaq/">惠普</a>
                                <a href="/samsung/">三星</a>
                                <a href="/asus/">华硕</a>
                                <a href="/acer/">宏基</a>
                                <a href="/toshiba/">东芝</a>
                                <a href="/sony/">索尼</a>
                                <a href="/shangwangben/">上网本</a>
                            </span>
                        </li>
                        <li>
                            <b><a href="/diannaopeijian/">硬件</a></b>
                            <span>
                                <a href="/neicuntiao/">内存条</a>
                                <a href="/xianka/">显卡</a>
                                <a href="/zhuban/">主板</a>
                                <a href="/yingpan/">硬盘</a>
                                <a href="/cpu/">CPU</a>
                                <a href="/xianshiqi/">显示器/液晶</a>
                                <a href="/keluji/">光驱/刻录</a>
                                <a href="/wangka/">网卡/无线网卡</a>
                                <a href="/bijibendianchi/">笔记本电池</a>
                            </span>
                        </li>
                        <li>
                            <b><a href="/zhoubianshebei/" class="dlb">外设产品</a></b>
                            <span>
                                <a href="/luyouqi/">路由器</a>
                                <a href="/shexiangtou/">摄像头</a>
                                <a href="/ydyingpan/">移动硬盘</a>
                                <a href="/yinxiang/">音箱/音响</a>
                                <a href="/shubiao/">鼠标/键盘</a>
                                <a href="/zhoubianshebei/pve_5620_398628/">无线路由器</a>
                                <a href="/bijibendianyuan/">笔记本电源</a>
                            </span>
                        </li>
                        <li>
                            <b><a href="/fuwuqi/">服务器</a></b>
                            <span>
                                <a href="/tsfwq/">台式服务器</a>
                                <a href="/jjsfwq/">机架式服务器</a>
                                <a href="/jgsfwq/">机柜式服务器</a>
                            </span>
                        </li>
                        <li class="btno">
                            <b><a href="/pbdn/">平板电脑/ipad</a></b>
                            <span>
                                <a href="/pbdn/jh_ipad2/">Ipad2</a>
                            </span>
                        </li>--%>
                    </ul>
                </li>
                
                <li class="ym-tab">
                    <span class="dlb"><a href="<%=Url.Action("shuma") %>">数码产品</a>、<a href="<%=Url.Action("shuma",new{objecttype=1}) %>">数码相机</a></span>
                    <ul class="ym-submnu">
                        <%
                            foreach (var obj in SaleDigital.Singleton.ObjectTypeCollection)
                            {
                                %>
                                <li>
                                    <p>
                                        <b><a href="<%=Url.Action("shuma",new{objecttype=obj.Id})%>"><%=obj.Name %></a></b>
                                        <span>
                                            <%
                                                var tagCollection = SaleDigital.Singleton.TagCollection.Where(item => item.ObjectTypeId == obj.Id);
                                                foreach (var tag in tagCollection)
                                                {
                                                    %>
                                                    <a href="<%=Url.Action("shuma",new{objecttype=obj.Id,tag=tag.Id})%>"><%=tag.Name %></a>
                                                    <%
                                                }
                                            %>
                                        </span>
                                    </p>
                                </li>
                                <%
                            }
                        %>
                        <%--<li>
                            <b><a href="/shumaxiangji/">数码相机</a></b>
                            <span>
                                <a href="/jianengxiangji/">佳能 </a>
                                <a href="/nikangxiangji/">尼康</a>
                                <a href="/albsxj/">奥林巴斯</a>
                                <a href="/kedaxiangji/">柯达</a>
                                <a href="/suonixj/">索尼</a>
                                <a href="/aiguozhexiangji/">爱国者</a>
                                <a href="/fushixiangji/">富士</a><br />
                                <a href="/songxiaxj/">松下</a>
                                <a href="/shumaxiangji/pve_5606_408331/">镜头</a>
                                <a href="/shumaxiangji/pve_5606_398633/">单反相机</a>
                                <a href="/xiangjipeijian/">相机配件</a>
                            </span>
                        </li>
                        <li>
                            <b><a href="/shexiangji/">数码摄像机</a></b>
                            <span>
                                <a href="/suonidv/">索尼</a>
                                <a href="/jianengdv/">佳能</a>
                                <a href="/jvcdv/">JVC</a>
                                <a href="/songxiadv/">松下</a>
                                <a href="/sanxingdv/">三星</a>
                            </span>
                        </li>
                        <li>
                            <b><a href="/mpsanmpsi/">MP3/MP4</a></b>
                            <span>
                                <a href="/mpsanmpsi/pve_5606_398634/">iTouch</a>
                                <a href="/mpsanmpsi/pve_5606_398635/">iPod</a>
                            </span>
                        </li>
                        <li>
                            <b><a href="/youxiji/">游戏机</a></b>
                            <span>
                                <a href="/psp/">PSP</a>
                                <a href="/youxiji/pve_5623_300676/">Wii</a>
                                <a href="/youxiji/pve_5623_300677/">Xbox</a>
                                <a href="/youxijipeijian/">游戏机配件</a>
                            </span>
                        </li>
                        <li class="btno">
                            <b><a href="/smqita/">其他数码产品</a></b>
                            <span>
                                <a href="/shumaxiangkuang/">数码相框</a>
                                <a href="/smqita/pve_5623_398636/">录音笔</a>
                                <a href="/smqita/pve_5623_398637/">电子书</a>
                            </span>
                        </li>--%>
                    </ul>
                </li>
                
                <li class="ym-tab">
                    <span class="dlb"><a href="<%=Url.Action("shouji")%>">二手手机</a>、<a href="<%=Url.Action("shoujihao")%>">手机号码</a></span>
                    <ul class="ym-submnu">
                        <li>
                            <b><a href="<%=Url.Action("shouji")%>">二手手机</a></b>
                            <span>
                                <%
                                    foreach (var obj in SaleMobile.Singleton.ObjectTypeCollection)
                                    {
                                        %>
                                        <a href="<%=Url.Action("shouji",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                                        <%
                                    }
                                %>
                                <%--<a href="/nuojiya/">诺基亚</a>
                                <a href="/iphonesj/">苹果</a>
                                <a href="/sanxing/">三星 </a>
                                <a href="/shouji/pve_1229_398629/">黑莓</a>
                                <a href="/shouji/pve_1229_398632/">酷派</a>
                                <a href="/shouji/pve_1229_300000/">联想</a>
                                <a href="/shouji/pve_1229_398631/">华为</a>
                                <a href="/motuoluola/">摩托罗拉</a>
                                <a href="/htc/">HTC/多普达</a><br />
                                <a href="/ailixin/">索尼爱立信</a>
                                <a href="/shoujipeijian/">手机配件</a>
                                <a href="/qitasj/">其他手机品牌</a>--%>
                            </span>
                        </li>
                        <li>
                            <b><a href="<%=Url.Action("shoujihao")%>">手机号码 </a></b>
                            <span>
                                <%
                                    foreach (var obj in SaleMobileNumber.Singleton.ObjectTypeCollection)
                                    {
                                        %>
                                        <a href="<%=Url.Action("shoujihao",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                                        <%
                                    }
                                %>
                                <%--<a href="/quanqiutong/">全球通</a>
                                <a href="/donggandidai/">动感地带</a>
                                <a href="/shenzhouxing/">神州行</a>
                                <a href="/ruyitong/">联通</a>
                                <a href="/cdma/">电信</a>
                                <a href="/tietong/">铁通</a><br />
                                <a href="/xiaolingtonghaoma/">小灵通</a>--%>
                            </span>
                        </li>
                        <li class="btno">
                            <b><a href="<%=Url.Action("tongxunyw")%>">通讯业务</a></b>
                            <span>
                                <%
                                    foreach (var obj in SaleCommunication.Singleton.ObjectTypeCollection)
                                    {
                                        %>
                                        <a href="<%=Url.Action("tongxunyw",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                                        <%
                                    }
                                %>
                                <%--<a href="/chonzhika/">充值卡</a>
                                <a href="/shoujishangwangka/">手机上网卡</a>
                                <a href="/shoujiyewu/">手机业务</a>--%>
                            </span>
                        </li>
                </ul>
                </li>

                <li class="ym-tab">
                    <span class="dlb"><a href="<%=Url.Action("jiadian")%>">二手家电</a>、<a href="<%=Url.Action("ershoujiaju")%>">二手家具</a></span>
                    <ul class="ym-submnu">
                        <%
                            foreach (var obj in SaleElectric.Singleton.ObjectTypeCollection)
                            {
                                %>
                                <li>
                                    <p>
                                        <b><a href="<%=Url.Action("jiadian",new{objecttype=obj.Id})%>"><%=obj.Name %></a></b>
                                        <span>
                                            <%
                                                var tagCollection = SaleElectric.Singleton.TagCollection.Where(item => item.ObjectTypeId == obj.Id);
                                                foreach (var tag in tagCollection)
                                                {
                                                    %>
                                                    <a href="<%=Url.Action("jiadian",new{objecttype=obj.Id,tag=tag.Id})%>"><%=tag.Name %></a>
                                                    <%
                                                }
                                            %>
                                        </span>
                                    </p>
                                </li>
                                <%
                            }
                        %>
                        <%--<li>
                            <b><a href="/jiadian/">二手家电</a></b>
                            <span>
                                <a href="/ershoukongtiao/">空调</a>
                                <a href="/jiadian/pve_1244_408259/">烤箱</a>
                                <a href="/jiadian/pve_1244_408261/">功放</a>
                                <a href="/weibolu/">微波炉</a>
                                <a href="/yinshuiji/">饮水机</a>
                                <a href="/diannuanqi/">电暖气</a>
                                <a href="/xiyiji/">洗衣机</a>
                                <a href="/bingxiang/">冰箱/冰柜</a><br />
                                <a href="/jiadianpeijian/">家电配件</a>
                                <a href="/jiadian/pve_1244_408258/">音响/音箱</a>
                            </span>
                        </li>
                        <li>
                            <b><a href="/dianshiji/">电视机</a></b>
                            <span>
                                <a href="/dlzcaidian/">等离子电视</a>
                                <a href="/yjcaidian/">液晶电视机</a>
                                <a href="/gqcaidian/">高清电视机</a>
                            </span>
                        </li>
                        <li>
                            <b><a href="/jdqita/">其他家电</a></b>
                            <span>
                                <a href="/dvdji/">DVD机</a>
                                <a href="/diancilu/">电磁炉</a>
                                <a href="/zhazhiji/">榨汁机</a>
                                <a href="/reshuiqi/">热水器</a>
                                <a href="/jingshuiqi/">净水器</a>
                            </span>
                        </li>--%>

                        <%
                            foreach (var obj in SaleHome.Singleton.ObjectTypeCollection)
                            {
                                %>
                                <li>
                                    <p>
                                        <b><a href="<%=Url.Action("ershoujiaju",new{objecttype=obj.Id})%>"><%=obj.Name %></a></b>
                                        <span>
                                            <%
                                                var tagCollection = SaleHome.Singleton.TagCollection.Where(item => item.ObjectTypeId == obj.Id);
                                                foreach (var tag in tagCollection)
                                                {
                                                    %>
                                                    <a href="<%=Url.Action("ershoujiaju",new{objecttype=obj.Id,tag=tag.Id})%>"><%=tag.Name %></a>
                                                    <%
                                                }
                                            %>
                                        </span>
                                    </p>
                                </li>
                                <%
                            }
                        %>
                        <%--<li>
                            <b><a href="/ershoujiaju/">家具/家居</a></b>
                            <span>
                                <a href="/guizi/">柜子</a>
                                <a href="/zhuolei/">桌子</a>
                                <a href="/chaji/">茶几</a>
                                <a href="/zuoju/">椅子/沙发</a>
                                <a href="/jujia/">居家用品/家纺</a>
                                <a href="/jiajuqita/">其他家具/家居</a>
                            </span>
                        </li>
                        <li class="btno">
                            <b><a href="/chuang/">床/床垫</a></b>
                            <span>
                                <a href="/shuanrenchuang/">双人床</a>
                                <a href="/danrenchuang/">单人床</a>
                                <a href="/chuangcengchuang/">双层床</a>
                                <a href="/tongchuang/">童床</a>
                                <a href="/zhediechuang/">折叠床</a>
                                <a href="/chuangdian/">床垫</a>
                            </span>
                        </li>--%>
                    </ul>
                </li>
                
                <li class="ym-tab">
                    <span class="dlb"><a href="<%=Url.Action("yingyou") %>">母婴/儿童用品</a></span>
                    <ul class="ym-submnu">
                        <%
                            foreach (var obj in SaleBaby.Singleton.ObjectTypeCollection)
                            {
                                %>
                                <li>
                                    <p>
                                        <b><a href="<%=Url.Action("yingyou",new{objecttype=obj.Id})%>"><%=obj.Name %></a></b>
                                        <span>
                                            <%
                                                var tagCollection = SaleBaby.Singleton.TagCollection.Where(item => item.ObjectTypeId == obj.Id);
                                                foreach (var tag in tagCollection)
                                                {
                                                    %>
                                                    <a href="<%=Url.Action("yingyou",new{objecttype=obj.Id,tag=tag.Id})%>"><%=tag.Name %></a>
                                                    <%
                                                }
                                            %>
                                        </span>
                                    </p>
                                </li>
                                <%
                            }
                        %>
                        <%--<li>
                            <b><a href="/yunfuyongpin/">孕妇用品</a></b>
                            <span>
                                <a href="/fangfusefu/">防辐射服</a>
                                <a href="/mmfuzhuang/">孕妇装</a>
                                <a href="/mmhuli/">卫生护理</a>
                            </span>
                        </li>
                        <li>
                            <b><a href="/yingeryongpin/">婴幼/儿童用品</a></b>
                            <span>
                                <a href="/zhiniaoku/">纸尿裤</a>
                                <a href="/naifen/">奶粉</a>
                                <a href="/yingerxihu/">婴儿洗护</a>
                                <a href="/yingerfush/">婴儿服饰</a>
                                <a href="/chusehngjnp/">出生纪念品</a><br />
                                <a href="/yingerche/">婴儿车</a>
                                <a href="/yingerchuang/">婴儿床</a>
                            </span>
                        </li>
                        <li class="btno">
                            <b><a href="/ertongyongpin/">玩具</a></b>
                            <span>
                                <a href=""></a>
                            </span>
                        </li>--%>
                    </ul>
                </li>
                
                 <li class="ym-tab">
                    <span class="dlb"><a href="<%=Url.Action("fushi") %>">服装/鞋帽/箱包</a></span>
                    <ul class="ym-submnu">
                        <%
                            foreach (var obj in SaleClothing.Singleton.ObjectTypeCollection)
                            {
                                %>
                                <li>
                                    <p>
                                        <b><a href="<%=Url.Action("fushi",new{objecttype=obj.Id})%>"><%=obj.Name %></a></b>
                                        <span>
                                            <%
                                                var tagCollection = SaleClothing.Singleton.TagCollection.Where(item => item.ObjectTypeId == obj.Id);
                                                foreach (var tag in tagCollection)
                                                {
                                                    %>
                                                    <a href="<%=Url.Action("fushi",new{objecttype=obj.Id,tag=tag.Id})%>"><%=tag.Name %></a>
                                                    <%
                                                }
                                            %>
                                        </span>
                                    </p>
                                </li>
                                <%
                            }
                        %>
                        <%--<li>
                            <b><a href="/nanzhuang/">服装</a></b>
                            <span>
                                <a href="/nanfuzhuang/">男装</a>
                                <a href="/nvzhuang/">女装</a>
                                <a href="/tongzhuang/">童装</a>
                                <a href="/nanzhuang/pve_5764_408283/">婚纱</a>
                                <a href="/nanzhuang/pve_5764_408284/">礼服</a>
                                <a href="/nanzhuang/pve_5764_408327/">内衣</a>
                                <a href="/waimaofuzhuang/">外贸服饰</a>
                                <a href="/pinpaifuzhuang/">品牌服饰</a>
                                <a href="/qunzifs/">裙子/连衣裙</a>
                            </span>
                        </li>
                        <li>
                            <b><a href="/fsxiemao/">鞋帽</a></b>
                            <span>
                                <a href="/shoutao/">手套</a>
                                <a href="/maozi/">帽子</a>
                                <a href="/pixie/">皮鞋</a>
                                <a href="/weijin/">围巾</a>
                                <a href="/xiuxianxie/">休闲鞋</a>
                                <a href="/yundongxie/">运动鞋</a>
                                <a href="/fsxiemao/pve_5764_408294/">高跟鞋</a>
                            </span>
                        </li>
                        <li>
                            <b><a href="/fushipeijian/">配饰</a></b>
                            <span>
                                <a href="/fushipeijian/pve_5764_408286/">手表</a>
                                <a href="/fushipeijian/pve_5764_408287/">领带</a>
                            </span>
                        </li>
                        <li class="btno">
                            <b><a href="/xiangbao/">箱包</a></b>
                            <span>
                                <a href=""></a>
                            </span>
                        </li>--%>
                    </ul>
                </li>
                
                <li class="ym-tab" id="bgno" style="background:none">
                    <span class="dlb"><a href="#qblist" target="_self"><b>查看全部分类</b></a></span>
                </li>
                <div class="clear"></div>
            </ul>
            
        </div>
    </div>

    <div class="rollbox">
        <div class="leftbotton" onmousedown="ISL_GoUp()" onmouseup="ISL_StopUp()" onmouseout="ISL_StopUp()"></div>
        <div class="cont" id="isl_cont">
            <div class="scrcont">
                <div id="list_scr1">
                    <div class="scrpic">
                        <ul>
                            <li>
                                <%--<a href ='http://hz.flxxwang.com/diannao/7851739027719x.shtml' class='scrpicimg'>
                                    <img src='http://pic.flxxwang.com/p1/tiny/n_15120995461650.jpg' />
                                </a>
                                <a href='http://hz.flxxwang.com/diannao/7851739027719x.shtml' target='_blank'>
                                    出自用主机一台
                                </a>
                                <br />
                                <b>350元</b>--%>
                            </li>

                 	        <li>
                                <%--<a href ='http://hz.flxxwang.com/shouji/7851995559300x.shtml' class='scrpicimg'>
                                    <img src='http://pic.flxxwang.com/p1/tiny/n_15121524663564.jpg' />
                                </a>
                                <a href='http://hz.flxxwang.com/shouji/7851995559300x.shtml' target='_blank'>
                                    出99基本冲新三星i917
                                </a>
                                <br />
                                <b>1350元</b>--%>
                            </li>

                 	        <li>
                                <%--<a href ='http://hz.flxxwang.com/shuma/7851352469762x.shtml' class='scrpicimg'>
                                    <img src='http://pic.flxxwang.com/mobile/tiny/n_15120253642497.jpg' />
                                </a>
                                <a href='http://hz.flxxwang.com/shuma/7851352469762x.shtml' target='_blank'>
                                    索尼Psp3000
                                </a>
                                <br />
                                <b>750元</b>--%>
                            </li>

                 	        <li>
                                <%--<a href ='http://hz.flxxwang.com/jiadian/7797660153991x.shtml' class='scrpicimg'>
                                    <img src='http://pic.flxxwang.com/p1/tiny/n_15012877546512.jpg' />
                                </a>
                                <a href='http://hz.flxxwang.com/jiadian/7797660153991x.shtml' target='_blank'>
                                    99新24寸阳光家园TV24
                                </a>
                                <br />
                                <b>980元</b>--%>
                            </li>

                 	        <li>
                                <%--<a href ='http://hz.flxxwang.com/ershoujiaju/7851695150469x.shtml' class='scrpicimg'>
                                    <img src='http://pic.flxxwang.com/p1/tiny/n_15120922650127.jpg' />
                                </a>
                                <a href='http://hz.flxxwang.com/ershoujiaju/7851695150469x.shtml' target='_blank'>
                                    急转广东小吃机械 全自
                                </a>
                                <br />
                                <b>1800元</b>--%>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="list_scr2"></div>
            </div>
        </div>
        <div class="rightbotton" onmousedown="isl_godown()" onmouseup="isl_stopdown()" onmouseout="isl_stopdown()"></div>
        <div class="rollinfo">
            <ul>
                <%--<li><a href="http://hz.flxxwang.com/shouji/7851995559300x.shtml" target="_blank">出99基本冲新三星i917,包装盒配</a></li>
                <li><a href="http://hz.flxxwang.com/fushi/7428608112136x.shtml" target="_blank">品质保障,价低物美</a></li>
                <li><a href="http://hz.flxxwang.com/shouji/7839069662342x.shtml" target="_blank">转让诺基亚5700</a></li>
                <li><a href="http://hz.flxxwang.com/jiadian/7851962013443x.shtml" target="_blank">出售45L万家乐热水器</a></li>--%>
            </ul>
         </div>
    </div>
</div>

<script language="javascript" type="text/javascript">
    var obj = document.getElementById("ymenu-side").getElementsByTagName("li");
    window.document.onmouseover = function () {
        var temp = null;
        if (document.all) {
            temp = window.event.srcElement
        }
        else {
            temp = arguments[0].target;
        }
        while (temp != document) {
            if (temp.className && temp.className == "ym-mainmnu") {
                return;
            }
            temp = temp.parentNode;
        }
        for (var j = 0; j < obj.length; j++) {
            if (obj[j].getElementsByTagName("ul").length > 0) {
                obj[j].className = "ym-tab";
                obj[j].getElementsByTagName("ul")[0].style.display = "none";
            }
        }
    }
    for (var i = 0; i < obj.length; i++) {
        obj[i].onmouseover = function () {
            if (this.getElementsByTagName("ul").length > 0) {
                if (this.className != "current") {
                    for (var j = 0; j < obj.length; j++) {
                        if (obj[j].getElementsByTagName("ul").length > 0 && obj[j] != this) {
                            obj[j].className = "ym-tab";
                            obj[j].getElementsByTagName("ul")[0].style.top = obj[j].style.top;
                            obj[j].getElementsByTagName("ul")[0].style.display = "none";
                        }
                    }
                    this.className = "current";
                    this.getElementsByTagName("ul")[0].style.display = "block";
                }
                topCurrentli = this.style.top;
                //nav_over(this.getElementsByTagName("ul")[0]);
            }
        }
    }
</script>

<script type="text/javascript">
    var Speed = 10; //速度(毫秒)
    var Space = 5; //每次移动(px)
    var PageWidth = 145; //翻页宽度
    var fill = 0; //整体移位
    var MoveLock = false;
    var MoveTimeObj;
    var Comp = 0;
    var AutoPlayObj = null;
    GetObj("list_scr2").innerHTML = GetObj("list_scr1").innerHTML;
    GetObj('isl_cont').scrollLeft = fill;
    GetObj("isl_cont").onmouseover = function () { clearInterval(AutoPlayObj); }
    GetObj("isl_cont").onmouseout = function () { AutoPlay(); }
    AutoPlay();
    function GetObj(objName) { if (document.getElementById) { return eval('document.getElementById("' + objName + '")') } else { return eval('document.all.' + objName) } }
    function AutoPlay() { //自动滚动
        clearInterval(AutoPlayObj);
        AutoPlayObj = setInterval('isl_godown();isl_stopdown();', 3000); //间隔时间
    }
    function ISL_GoUp() { //上翻开始
        if (MoveLock) return;
        clearInterval(AutoPlayObj);
        MoveLock = true;
        MoveTimeObj = setInterval('isl_scrup();', Speed);
    }
    function ISL_StopUp() { //上翻停止
        clearInterval(MoveTimeObj);
        if (GetObj('isl_cont').scrollLeft % PageWidth - fill != 0) {
            Comp = fill - (GetObj('isl_cont').scrollLeft % PageWidth);
            compscr();
        } else {
            MoveLock = false;
        }
        AutoPlay();
    }
    function isl_scrup() { //上翻动作
        if (GetObj('isl_cont').scrollLeft <= 0) { GetObj('isl_cont').scrollLeft = GetObj('isl_cont').scrollLeft + GetObj('list_scr1').offsetWidth }
        GetObj('isl_cont').scrollLeft -= Space;
    }
    function isl_godown() { //下翻
        clearInterval(MoveTimeObj);
        if (MoveLock) return;
        clearInterval(AutoPlayObj);
        MoveLock = true;
        ISL_ScrDown();
        MoveTimeObj = setInterval('ISL_ScrDown()', Speed);
    }
    function isl_stopdown() { //下翻停止
        clearInterval(MoveTimeObj);
        if (GetObj('isl_cont').scrollLeft % PageWidth - fill != 0) {
            Comp = PageWidth - GetObj('isl_cont').scrollLeft % PageWidth + fill;
            compscr();
        } else {
            MoveLock = false;
        }
        AutoPlay();
    }
    function ISL_ScrDown() { //下翻动作
        if (GetObj('isl_cont').scrollLeft >= GetObj('list_scr1').scrollWidth) { GetObj('isl_cont').scrollLeft = GetObj('isl_cont').scrollLeft - GetObj('list_scr1').scrollWidth; }
        GetObj('isl_cont').scrollLeft += Space;
    }
    function compscr() {
        var num;
        if (Comp == 0) { MoveLock = false; return; }
        if (Comp < 0) { //上翻
            if (Comp < -Space) {
                Comp += Space;
                num = Space;
            } else {
                num = -Comp;
                Comp = 0;
            }
            GetObj('isl_cont').scrollLeft -= num;
            setTimeout('compscr()', Speed);
        } else { //下翻
            if (Comp > Space) {
                Comp -= Space;
                num = Space;
            } else {
                num = Comp;
                Comp = 0;
            }
            GetObj('isl_cont').scrollLeft += num;
            setTimeout('compscr()', Speed);
        }
    }
</script>
<div class="clear"></div>

<!---热门跳蚤--->
<%--<div class="wrap">
	<div class="sale_hot">
    	<div id="sift">
            <span class="shif">
                <b>杭州二手市场</b>
                <span style="float:right">
                    <em>其他跳蚤市场：</em>
                    <select para="Local2" name="filter" paratype="1" id="s1" class="selects swidth" swidth="6" onchange="window.location.href=this.value;">
                        <option value="/sale/">全杭州</option>
                        <option value="/xihuqu/sale/">西湖</option>
                        <option value="/gongshu/sale/">拱墅</option>
                        <option value="/jianggan/sale/">江干</option>
                        <option value="/xiacheng/sale/">下城</option>
                        <option value="/hzshangcheng/sale/">上城</option>
                        <option value="/yuhang/sale/">余杭</option>
                        <option value="/xiaoshan/sale/">萧山</option>
                        <option value="/binjiang/sale/">滨江</option>
                        <option value="/jiandeshi/sale/">建德</option>
                        <option value="/fuyangshi/sale/">富阳</option>
                        <option value="/linanshi/sale/">临安</option>
                        <option value="/tonglu/sale/">桐庐</option>
                        <option value="/chunan/sale/">淳安</option>
                        <option value="/hangzhou/sale/">杭州周边</option>
                    </select>
                </span>
	        </span>
        </div>
		<div class="shotul">
            <ul>
        	    <li><a href='/binjiangqu/sale/'>滨江周边</a> (2937)</li>
                <li><a href='/hzxianlin/sale/'>闲林</a> (2447)</li>
                <li><a href='/jiangganqu/sale/'>江干周边</a> (2228)</li>
                <li><a href='/xiaoshanqu/sale/'>萧山周边</a> (1906)</li>
                <li><a href='/xiaoyinghz/sale/'>小营</a> (1474)</li>
                <li><a href='/daguan/sale/'>大关</a> (1301)</li>
                <li><a href='/qingbo/sale/'>清波</a> (1223)</li>
                <li><a href='/xihuquqita/sale/'>西湖周边</a> (1179)</li>
                <li><a href='/liangzhu/sale/'>良渚</a> (989)</li>
                <li><a href='/gongshuqu/sale/'>拱墅周边</a> (986)</li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>--%>

<!---最新发布--->
<%--<div class="wrap2">
    <div class="sale_hot">
        <h2>最新发布</h2>
        <div class="newfb">
            <ul>
                <li>
                    <a href='http://hz.flxxwang.com/wenti/7851404934661x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_15120268849678.jpg' /></a>
                    <a href='http://hz.flxxwang.com/wenti/7851404934661x.shtml' target="_blank">美德理md700和卡西欧c</a>
                    <br /><b>1300</b>元
                </li>

                <li>
                    <a href='http://hz.flxxwang.com/yingyou/7666438723459x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_15120215876112.jpg' /></a>
                    <a href='http://hz.flxxwang.com/yingyou/7666438723459x.shtml' target="_blank">低价转让贝因美爱+100</a>
                    <br /><b>200</b>元
                </li>

                <li>
                    <a href='http://hz.flxxwang.com/shouji/7444830387844x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_14307172520973.jpg' /></a>
                    <a href='http://hz.flxxwang.com/shouji/7444830387844x.shtml' target="_blank">机神HTC 巨屏4.3寸可刷</a>
                    <br /><b>2150</b>元
                </li>

                <li>
                    <a href='http://hz.flxxwang.com/diannao/7429225479432x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_14275995622154.jpg' /></a>
                    <a href='http://hz.flxxwang.com/diannao/7429225479432x.shtml' target="_blank">转让自用IBM T60</a>
                    <br /><b>1800</b>元
                </li>

                <li>
                    <a href='http://hz.flxxwang.com/shuma/7851352469762x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/mobile/tiny/n_15120253642497.jpg' /></a>
                    <a href='http://hz.flxxwang.com/shuma/7851352469762x.shtml' target="_blank">索尼Psp3000</a>
                    <br /><b>750</b>元
                </li>

                <li>
                    <a href='http://hz.flxxwang.com/fushi/7851291435656x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_15120101752846.jpg' /></a>
                    <a href='http://hz.flxxwang.com/fushi/7851291435656x.shtml' target="_blank">HM 的豹纹毛衣</a>
                    <br /><b>80</b>元
                </li>
            </ul>
        </div>
    </div>       
</div>--%>
<div class="clear"></div>

<!---电脑手机数码--->
<%--<div class="wrap2">
	<div class="wbody">
        <div class="sale_hot">
            <h2>
                <span class="fr">
                    <a href="/diannao/">二手电脑</a>
                    <a href="/shouji/">二手手机</a>
                    <a href="/shuma/">数码产品</a>
                </span>
                电脑手机数码
            </h2>
    		<table cellpadding="0" cellspacing="0" border="0" class="tbimg" id="infolist">
                <tr>
                    <td class="img" width="60">
                        <div>
                            <a href='http://hz.flxxwang.com/shouji/6864539927426x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_13146609766657.jpg' alt='八成新三码合一XV67004G卡,共150,不二价' />
                            </a>
                        </div>
                    </td>
                    <td class="t">
                        <a href='http://hz.flxxwang.com/shouji/6864539927426x.shtml' target="_blank" class="t">
                            八成新三码合一XV67004G卡,共150,不二价
                        </a>
                        <br />
                        <span class="ico c_666">
                            (<a href="/xiacheng/taishiji/" class="u">下城</a>- <a href="/genshan/taishiji/" class="u">艮山</a>)
                        </span>
                    </td>
                    <td class="price">
                        <b>160</b>元<br />2分钟前
                    </td>
                </tr>
                <tr>
                    <td class="img" width="60">
                        <div>
                            <a href='http://hz.flxxwang.com/shuma/7852063626503x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_15121671848975.jpg' alt='转让9.9成新佳能5D2 24-70套机' />
                            </a>
                        </div>
                    </td>
                    <td class="t">
                        <a href='http://hz.flxxwang.com/shuma/7852063626503x.shtml' target="_blank" class="t">转让9.9成新佳能5D2 24-70套机</a>
                        <br />
                        <span class="ico c_666">
                            (<a href="/taishiji/" class="u">杭州</a>)
                        </span>
                    </td>
                    <td class="price">
                        <b>7500</b>元<br />16分钟前
                    </td>
                </tr>
                <tr>
                    <td class="img" width="60">
                        <div>
                            <a href='http://hz.flxxwang.com/shuma/7852056743556x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_15121652594190.jpg' alt='转 佳能50D机身和镜头EF 85mm f/1.8' />
                            </a>
                        </div>
                    </td>
                    <td class="t">
                        <a href='http://hz.flxxwang.com/shuma/7852056743556x.shtml' target="_blank" class="t">转 佳能50D机身和镜头EF 85mm f/1.8</a>
                        <br />
                        <span class="ico c_666">
                            (<a href="/xihujingqu/taishiji/" class="u">西湖</a>- <a href="/wenyilu/taishiji/" class="u">文一路</a>)
                        </span>
                    </td>
                    <td class="price">
                        <b>7300</b>元<br />17分钟前
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="wbody fr">
        <div class="sale_hot">
            <h2>
                <span class="fr">
                    <a href="/ershoujiaju/">二手家具</a>
                    <a href="/jiadian/">二手家电</a>
                    <a href="/jujia/">家居用品</a>
                </span>
                家电家具家居
            </h2>
    		<table cellpadding="0" cellspacing="0" border="0" class="tbimg" id="infolist">
                <tr>
                    <td class="img" width="60">
                        <div>
                            <a href='http://hz.flxxwang.com/ershoujiaju/7765951599877x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_15053550251026.jpg' alt='转9成新以上凳子/椅子一把' />
                            </a>
                        </div>
                    </td>
                    <td class="t">
                        <a href='http://hz.flxxwang.com/ershoujiaju/7765951599877x.shtml' target="_blank" class="t">转9成新以上凳子/椅子一把</a>
                        <br />
                        <span class="ico c_666">
                            (<a href="/jianggan/taishiji/" class="u">江干</a>- <a href="/jgxiasha/taishiji/" class="u">下沙</a>)
                        </span>
                    </td>
                    <td class="price">
                        <b>30</b>元<br />12分钟前
                    </td>
                </tr>
                <tr>
                    <td class="img" width="60">
                        <div>
                            <a href='http://hz.flxxwang.com/ershoujiaju/7851695150469x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_15120922650127.jpg' alt='急转广东小吃机械 全自动肠粉机一套带磨浆机1800' />
                            </a>
                        </div>
                    </td>
                    <td class="t">
                        <a href='http://hz.flxxwang.com/ershoujiaju/7851695150469x.shtml' target="_blank" class="t">急转广东小吃机械 全自动肠粉机一套带磨浆机</a>
                        <br />
                        <span class="ico c_666">
                            (<a href="/taishiji/" class="u">杭州</a>- <a href="/hangzhou/taishiji/" class="u">杭州周边</a>)
                        </span>
                    </td>
                    <td class="price">
                        <b>1800</b>元<br />1小时前
                    </td>
                </tr>
                <tr>
                    <td class="img" width="60">
                        <div>
                            <a href='http://hz.flxxwang.com/jiadian/7797660153991x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_15012877546512.jpg' alt='99新24寸阳光家园TV248D内置DVD液晶电视' />
                            </a>
                        </div>
                    </td>
                    <td class="t">
                        <a href='http://hz.flxxwang.com/jiadian/7797660153991x.shtml' target="_blank" class="t">99新24寸阳光家园TV248D内置DVD液晶电视</a>
                        <br />
                        <span class="ico c_666">
                            (<a href="/jianggan/taishiji/" class="u">江干</a>- <a href="/jiangganqu/taishiji/" class="u">江干周边</a>)
                        </span>
                    </td>
                    <td class="price">
                        <b>980</b>元<br />1小时前
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="clear"></div>

    <div class="wbody mt15">
        <div class="sale_hot">
            <h2>
                <span class="fr">
                    <a href="/yingyou/">母婴用品</a>
                    <a href="/meirong/">美容化妆</a>
                    <a href="/fushi/">服装鞋帽</a>
                </span>
                母婴美容服饰
            </h2>
        
            <table cellpadding="0" cellspacing="0" border="0" class="tbimg" id="infolist">
                <tr>
                    <td class="img" width="60">
                        <div>
                            <a href='http://hz.flxxwang.com/meirong/7852038285446x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_15121628057874.jpg' alt='转让全新sana豆乳美肌卸妆霜,购于香港' />
                            </a>
                        </div>
                    </td>
                    <td class="t">
                        <a href='http://hz.flxxwang.com/meirong/7852038285446x.shtml' target="_blank" class="t">转让全新sana豆乳美肌卸妆霜,购于香港</a>
                        <br />
                        <span class="ico c_666">
                            (<a href="/xihujingqu/taishiji/" class="u">西湖</a>- <a href="/hzhuanglong/taishiji/" class="u">黄龙</a>)
                        </span>
                    </td>
                    <td class="price">
                        <b>80</b>元<br />17分钟前
                    </td>
                </tr>
                <tr>
                    <td class="img" width="60">
                        <div>
                            <a href='http://hz.flxxwang.com/fushi/7428608112136x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_14274759780366.jpg' alt='品质保障,价低物美' />
                            </a>
                        </div>
                    </td>
                    <td class="t">
                        <a href='http://hz.flxxwang.com/fushi/7428608112136x.shtml' target="_blank" class="t">品质保障,价低物美</a>
                        <br />
                        <span class="ico c_666">
                            (<a href="/taishiji/" class="u">杭州</a>)
                        </span>
                    </td>
                    <td class="price">
                        <b>13</b>元<br />27分钟前
                    </td>
                </tr>
                <tr>
                    <td class="img" width="60">
                        <div>
                            <a href='http://hz.flxxwang.com/yingyou/7851781267974x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_15121110020370.jpg' alt='好孩子婴儿车,学步车' />
                            </a>
                        </div>
                    </td>
                    <td class="t">
                        <a href='http://hz.flxxwang.com/yingyou/7851781267974x.shtml' target="_blank" class="t">好孩子婴儿车,学步车</a>
                        <br />
                        <span class="ico c_666">
                            (<a href="/jianggan/taishiji/" class="u">江干</a>- <a href="/baiyang/taishiji/" class="u">白杨</a>)
                        </span>
                    </td>
                    <td class="price">
                        <b>280</b>元<br />50分钟前
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="wbody fr mt15">
        <div class="sale_hot">
            <h2>
                <span class="fr">
                    <a href="/tushu/">图书音像</a>
                    <a href="/wenti/">文体娱乐</a>
                    <a href="/bangong/">办公用品</a>
                </span>
                图书文体办公
            </h2>
            <table cellpadding="0" cellspacing="0" border="0" class="tbimg" id="infolist">
                <tr>
                    <td class="img" width="60">
                        <div>
                            <a href='http://hz.flxxwang.com/bangong/7053496678917x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_13524529131011.jpg' alt='出售爱普生S3投影机' />
                            </a>
                        </div>
                    </td>
                    <td class="t">
                        <a href='http://hz.flxxwang.com/bangong/7053496678917x.shtml' target="_blank" class="t">出售爱普生S3投影机</a>
                        <br />
                        <span class="ico c_666">
                            (<a href="/xihujingqu/taishiji/" class="u">西湖</a>- <a href="/wenerlu/taishiji/" class="u">文二路</a>)
                        </span>
                    </td>
                    <td class="price">
                        <b>1200</b>元<br />31分钟前
                    </td>
                </tr>
                <tr>
                    <td class="img" width="60">
                        <div>
                            <a href='http://hz.flxxwang.com/wenti/7851404934661x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_15120268849678.jpg' alt='美德理md700和卡西欧ctk738两款琴都比较新' />
                            </a>
                        </div>
                    </td>
                    <td class="t">
                        <a href='http://hz.flxxwang.com/wenti/7851404934661x.shtml' target="_blank" class="t">美德理md700和卡西欧ctk738两款琴都比较新</a>
                        <br />
                        <span class="ico c_666">
                            (<a href="/xihujingqu/taishiji/" class="u">西湖</a>- <a href="/sandun/taishiji/" class="u">三墩</a>)
                        </span>
                    </td>
                    <td class="price">
                        <b>1300</b>元<br />2小时前
                    </td>
                </tr>
                <tr>
                    <td class="img" width="60">
                        <div>
                            <a href='http://hz.flxxwang.com/wenti/7851254936066x.shtml' target="_blank">
                                <img src='http://pic.flxxwang.com/p1/tiny/n_15120032913674.jpg' alt='忍痛转让德国品牌标准面单民谣吉他,绝对超值只此一天' />
                            </a>
                        </div>
                    </td>
                    <td class="t">
                        <a href='http://hz.flxxwang.com/wenti/7851254936066x.shtml' target="_blank" class="t">忍痛转让德国品牌标准面单民谣吉他,绝对超值</a>
                        <br />
                        <span class="ico c_666">
                            (<a href="/xiacheng/taishiji/" class="u">下城</a>- <a href="/chaohui/taishiji/" class="u">朝晖</a>)
                        </span>
                    </td>
                    <td class="price">
                        <b>1000</b>元<br />2小时前
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>--%>
<div class="clear"></div>

<!---跳蚤全部分类--->
<div class="wrap2">
    <div class="sale_hot"><a name="qblist"></a>
        <h2><span class="fr"><a href="#top" target="_self">返回顶部</a></span>跳蚤全部分类</h2>
        <div class="sale_list">
        	<ul>
            	<li><h3><a href="<%=Url.Action("diannao")%>">二手电脑/笔记本&raquo;</a></h3>
                    <%
                        foreach (var obj in SaleComputer.Singleton.ObjectTypeCollection)
                        {
                            %>
                            <a href="<%=Url.Action("diannao",new{objecttype=obj.Id})%>" class="red"><%=obj.Name %></a>
                            <%
                        }
                    %>
                    <%--<a href="/bijiben/" class="red">笔记本</a>
                    <a href="/taishiji/">台式机</a>
                    <a href="/pbdn/">平板电脑/ipad</a>
                    <a href="/diannaopeijian/">硬件</a>
                    <a href="/zhoubianshebei/">外设产品</a>
                    <a href="/wangka/">无线网卡</a>
                    <a href="/xianshiqi/">显示器/液晶</a>
                    <a href="/ydyingpan/">移动硬盘</a>--%>
                </li>
                <li><h3><a href="<%=Url.Action("shuma")%>">数码产品&raquo;</a></h3>
                    <%
                        foreach (var obj in SaleDigital.Singleton.ObjectTypeCollection)
                        {
                            %>
                            <a href="<%=Url.Action("shuma",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                            <%
                        }
                    %>
                    <%--<a href="/shumaxiangji/" class="red">数码相机</a>
                    <a href="/shexiangji/">摄像机</a>
                    <a href="/youxiji/">游戏机/PSP</a>
                    <a href="/mpsanmpsi/">MP3/MP4</a>
                    <a href="/koudaishuma/">口袋数码</a>--%>
                </li>
                <li><h3><a href="<%=Url.Action("shouji")%>">二手手机&raquo;</a><a href="<%=Url.Action("shoujihao")%>">手机号码&raquo;</a></h3>
                    <%
                        foreach (var obj in SaleMobile.Singleton.ObjectTypeCollection)
                        {
                            %>
                            <a href="<%=Url.Action("shouji",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                            <%
                        }
                    %>
                    <%--<a href="/nuojiya/">诺基亚</a>
                    <a href="/iphonesj/" class="red">iPhone</a>
                    <a href="/sanxing/">三星</a>
                    <a href="/ailixin/">索尼爱立信</a>
                    <a href="/htc/">HTC/多普达</a>
                    <a href="/motuoluola/">摩托罗拉</a>
                    <a href="/shouji/pve_1229_398629/">黑莓</a>
                    <a href="/shouji/pve_1229_398630/">LG</a>
                    <a href="/shouji/pve_1229_300000/">联想</a>
                    <a href="/shoujipeijian/">手机配件</a>--%>
                </li>
            </ul><div class="clear"></div>
            <ul>
            	<li><h3><a href="<%=Url.Action("jiadian")%>">二手家电&raquo;</a></h3>
                    <%
                        foreach (var obj in SaleElectric.Singleton.ObjectTypeCollection)
                        {
                            %>
                            <a href="<%=Url.Action("jiadian",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                            <%
                        }
                    %>
                    <%--<a href="/dianshiji/">电视机</a>
                    <a href="/xiyiji/">洗衣机</a>
                    <a href="/ershoukongtiao/">空调</a>
                    <a href="/bingxiang/">冰箱</a>
                    <a href="/diannuanqi/">电暖气</a>
                    <a href="/reshuiqi/">热水器</a>--%>
                </li>
                <li><h3><a href="<%=Url.Action("ershoujiaju")%>">二手家具/家居&raquo;</a></h3>
                    <%
                        foreach (var obj in SaleHome.Singleton.ObjectTypeCollection)
                        {
                            %>
                            <a href="<%=Url.Action("ershoujiaju",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                            <%
                        }
                    %>
                    <%--<a href="/chuang/">床/床垫</a>
                    <a href="/zuoju/">椅子/沙发</a>
                    <a href="/guizi/">柜子</a>
                    <a href="/zhuolei/">桌子</a>
                    <a href="/jujia/">居家用品/家纺</a>--%>
                </li>
                <li><h3><a href="<%=Url.Action("yingyou")%>">母婴/儿童用品&raquo;</a></h3>
                    <%
                        foreach (var obj in SaleBaby.Singleton.ObjectTypeCollection)
                        {
                            %>
                            <a href="<%=Url.Action("yingyou",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                            <%
                        }
                    %>
                    <%--<a href="/yingeryongpin/">婴幼/儿童用品</a>
                    <a href="/ertongyongpin/">玩具</a>
                    <a href="/naifen/">奶粉</a>
                    <a href="/yingerchuang/">婴儿床</a>
                    <a href="/yunfuyongpin/">孕妇用品</a>--%>
                </li>
            </ul><div class="clear"></div>
            <ul>
            	<li><h3><a href="<%=Url.Action("fushi")%>">服装/鞋帽/箱包&raquo;</a><a href="<%=Url.Action("meirong")%>">美容/保健&raquo;</a></h3>
                    <%
                        foreach (var obj in SaleClothing.Singleton.ObjectTypeCollection)
                        {
                            %>
                            <a href="<%=Url.Action("fushi",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                            <%
                        }
                    %>
                    <%--<a href="/nanzhuang/">服装      </a>
                    <a href="/fushipeijian/">配饰</a>
                    <a href="/xiangbao/">箱包</a>
                    <a href="/fsxiemao/">鞋帽</a>--%>
                </li>
                <li><h3><a href="<%=Url.Action("tushu")%>">图书/音像/软件&raquo;</a><a href="<%=Url.Action("wangyou")%>">网游/虚拟物品&raquo;</a></h3>
                    <%
                        foreach (var obj in SaleBook.Singleton.ObjectTypeCollection)
                        {
                            %>
                            <a href="<%=Url.Action("tushu",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                            <%
                        }
                    %>
                    <%--<a href="/tushubook/">书籍</a>
                    <a href="/yingpandianshiju/">影片/电视剧</a>
                    <a href="/cddvd/">音乐</a>
                    <a href="/ruanjiants/">软件</a>--%>
                </li>
                <li><h3><a href="<%=Url.Action("wenti")%>">文体用品&raquo;</a><a href="<%=Url.Action("yishu")%>">艺术品/收藏品&raquo;</a></h3>
                    <%
                        foreach (var obj in SaleAthletics.Singleton.ObjectTypeCollection)
                        {
                            %>
                            <a href="<%=Url.Action("wenti",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                            <%
                        }
                    %>
                    <%--<a href="/yundongfushi/">户外用品</a>
                    <a href="/jianshenqixie/">健身器材</a>
                    <a href="/huju/">文教用品</a>
                    <a href="/yueqi/">乐器</a>
                    <a href="/diaoyuyongju/">钓鱼用具</a>--%>
                </li>
            </ul><div class="clear"></div>
            <ul>
            	<li><h3><a href="<%=Url.Action("bangong")%>">办公用品/设备&raquo;</a></h3>
                    <%
                        foreach (var obj in SaleOffice.Singleton.ObjectTypeCollection)
                        {
                            %>
                            <a href="<%=Url.Action("bangong",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                            <%
                        }
                    %>
                    <%--<a href="/bangongshebei/">办公设备</a>
                    <a href="/diannaohaocai/">办公耗材</a>
                    <a href="/zhuomianwenju/">桌面文具</a>
                    <a href="/bangongjiaju/">办公家具</a>--%>
                </li>
                <li><h3><a href="<%=Url.Action("ershoushebei")%>">二手设备&raquo;</a></h3>
                    <%
                        foreach (var obj in SaleEquipment.Singleton.ObjectTypeCollection)
                        {
                            %>
                            <a href="<%=Url.Action("ershoushebei",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                            <%
                        }
                    %>
                    <%--<a href="/huagong/">化工</a>
                    <a href="/fangzhi/">纺织</a>
                    <a href="/fyinshua/">印刷</a>
                    <a href="/gongcheng/">工程机械</a>
                    <a href="/kuangye/">机床</a>
                    <a href="/diandongji/">仪器仪表</a>--%>
               </li>
               <li><h3><a href="<%=Url.Action("tongxunyw")%>">通讯业务&raquo;</a></h3>
                    <%
                        foreach (var obj in SaleCommunication.Singleton.ObjectTypeCollection)
                        {
                            %>
                            <a href="<%=Url.Action("tongxunyw",new{objecttype=obj.Id})%>"><%=obj.Name %></a>
                            <%
                        }
                    %>
                    <%--<a href="/chonzhika/">充值卡</a>
                    <a href="/shoujishangwangka/">手机上网卡</a>
                    <a href="/shoujiyewu/">手机业务</a>--%>
                </li>
            </ul><div class="clear"></div>
            <ul class="saleqt" style="border-bottom:none">
            	<li>
                    <%--<a href="/xiaoyuan/">校园二手&raquo;</a>--%>
                    <a href="<%=Url.Action("meirong")%>">美容/保健&raquo;</a>
                    <a href="<%=Url.Action("huanwu")%>">物品交换&raquo;</a>
                    <a href="<%=Url.Action("danche")%>">二手摩托车&raquo;</a>
                    <a href="<%=Url.Action("zixingche")%>">自行车/电动车&raquo;</a>
				</li>
                <li>
                    <a href="<%=Url.Action("ershoufree")%>">免费赠送&raquo;</a>
                    <%--<a href="/wuyuanwupin/">5元以下物品&raquo;</a>--%>
                    <a href="<%=Url.Action("wangyou")%>">网游/虚拟物品&raquo;</a>
                    <a href="<%=Url.Action("huochepiao")%>">火车票转让&raquo;</a>
                    <a href="<%=Url.Action("kaquan")%>">健身卡/优惠券&raquo;</a>
				</li>
                <li>
                    <a href="<%=Url.Action("fuwujy")%>">创意服务交易&raquo;</a>
                    <a href="<%=Url.Action("qita")%>">其他跳蚤信息&raquo;</a>
                    <a href="<%=Url.Action("dog","chongwu")%>">宠物狗&raquo;</a>
                    <a href="<%=Url.Action("qita",new{objecttype=1})%>">闲置礼品&raquo;</a>
                </li>
            </ul>

        </div>
	</div>
</div>
<div class="clear"></div>

<!---跳蚤商城--->
<%--<div class="wrap2">
    <div class="sale_hot">
        <h2><span class="fr"><a href="/shangcheng.shtml">进入商城&raquo;</a></span>跳蚤商城</h2>
        <div class="salesc">
            <ul>
        	    <li>
                    <a href="/tbpcpeijian/"><b>电脑及配件</b></a><br />
                    <a href="/tbpcpeijian/"><i class="scdn"></i></a>
        		    <p>
                        <a href="/tbdianyuan/">电源</a> | 
                        <a href="/tbshengka/">声卡</a><br />
                        <a href="/tbdianshika/">电视卡</a> | 
                        <a href="/tbdianshihe/">电视盒</a><br />
                        <a href="/tbpcsanre/">散热设备</a> | 
                        <a href="/tixiang/">机箱</a><br />
                        <a href="/tblingpeijian/">电脑零配件</a> | 
                        <a href="/tbpczhoubian/">电脑周边</a>
                    </p>
                </li>
                <li>
                    <a href="/tbshumapeijian/"><b>数码</b></a><br />
                    <a href="/tbshumapeijian/"><i class="scsj"></i></a>
                    <p>
                        <a href="/tbxiangji/">相机</a> | 
                        <a href="/tbmppeijian/">Mp3/mp4配件</a><br />
                        <a href="/tbshoujpeijian/">手机配件</a> | 
                        <a href="/tbshumaxiaopeijian/">数码配件</a><br />
                        <a href="/tbsheyingyongpin/">摄影用品</a><br />
                        <a href="/tbdianziqicai/">电子器材配件</a>
                    </p>
                </li>
                <li>
                    <a href="/tbjiayongdianqi/"><b>家电、家具</b></a><br />
                    <a href="/tbjiayongdianqi/"><i class="scjd"></i></a>
                    <p>
                        <a href="/tbchufangdianqi/">厨房家电</a> | 
                        <a href="/tbchufangxiaojiadian/">厨房小家电</a><br />
                        <a href="/tbshenghuodianqi/">生活电器</a> | 
                        <a href="/tbqitadianqi/">日用小电器</a><br />
                        <a href="/tbchengtaojiaju/">成套家具</a> | 
                        <a href="/tbzhuoleijiaju/">桌类家具</a><br />
                        <a href="/tbguileijiaju/">柜类家具</a> | 
                        <a href="/tbwojujiaju/">卧具家具</a>
                    </p>
                </li>
                <li>
                    <a href="/tbyingeryongpin/"><b>母婴、玩具</b></a><br />
                    <a href="/tbyingeryongpin/"><i class="scmy"></i></a>
                    <p>
                        <a href="/tbertongwanju/">儿童玩具</a> | 
                        <a href="/tbyingerhufu/">宝宝护肤品</a><br />
                        <a href="/tbshubao/">书包背包</a> | 
                        <a href="/tbmamariyongpin/">妈妈日用品</a><br />
                        <a href="/tbchuangyiwanju/">创意玩具</a> | 
                        <a href="/tbmoshuyizhi/">魔术/搞怪</a><br />
                        <a href="/tbwawa/">娃娃/玩偶/机器人</a> | 
                        <a href="/cosplay/tuhuicosplay/">聚会</a>
                    </p>
                </li>
                <li>
                    <a href="/tbbangongwenju/"><b>办公用品、图书</b></a><br />
                    <a href="/tbbangongwenju/"><i class="scbg"></i></a>
                    <p>
                        <a href="/tbbangongyongpin/">办公设备</a> | 
                        <a href="/tbzhuoshangyongpin/">桌上用品</a><br />
                        <a href="/tbzhizhangbence/">纸张本册</a> | 
                        <a href="/lishidili/">历史地理</a><br />
                        <a href="/tbshuxiegongju/">笔类书写工具</a> | 
                        <a href="/tingji/">经济</a><br />
                        <a href="/tbwenjiancunchu/">文件储存用品</a> | 
                        <a href="/tbfalv/">法律</a>
                    </p>
                </li>
                <li>
                    <a href="/tbgudongshoucang/"><b>文体、艺术品</b></a><br />
                    <a href="/tbgudongshoucang/"><i class="scwt"></i></a>
                    <p>
                        <a href="/tbwenfangsibao/">文房四宝</a><br />
                        <a href="/tbgudong/">古董</a><br />
                        <a href="/tbguwan/">古玩杂项</a><br />&nbsp;
                    </p>
                </li>
                <li class="bno">
                    <a href="/shangcheng.shtml"><b>其他分类</b></a><br />
                    <a href="/shangcheng.shtml"><i class="scqt"></i></a>
                    <p>
                        <a href="/tbyanjingzhuanqu/">眼镜</a> | 
                        <a href="/tbzippojundaoyan/">Zippo/军刀/烟</a><br />
                        <a href="/tbdianwan/">电玩</a> | 
                        <a href="/tbyouxiruanjian/">游戏软件</a><br />
                        <a href="/tbweiyuyongpin/">卫浴用品</a><br />&nbsp;
                    </p>
                </li>
            </ul>
        </div>
	</div>
</div>--%>

<!---search--->
<div class="wrap2 mt0">
    <div class="links mb10">
        <ul>
            <li><a href="<%=Url.Action("Index",new{city="bj"}) %>">北京二手网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="tj"}) %>">天津二手网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="sh"}) %>">上海二手网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="gz"}) %>">广州二手网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="sz"}) %>">深圳二手网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="wh"}) %>">武汉二手网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cd"}) %>">成都二手网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="dl"}) %>">大连二手网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="xa"}) %>">西安二手网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="yz"}) %>">扬州二手网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="xm"}) %>">厦门二手网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cq"}) %>">重庆二手网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="hf"}) %>">合肥二手网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="ty"}) %>">太原二手网</a></li>
        </ul>
    </div>
    <div class="line"></div>
    <div class="friendlink">﻿
        <strong>友情链接</strong>:
        <a href='<%=Url.Action("fushi")%>' target='_blank'><%=city.ShortName %>服装批发市场</a>&nbsp;
        <%--<a href='http://hz.flxxwang.com/qitajiameng/' target='_blank'>舞蹈用品加盟</a>&nbsp;--%>
        <a href='http:// www.15com.com' target='_blank'>义乌二手网</a>&nbsp;
        <a href='http://www.zhangxiaoquan.com.cn/' target='_blank'>张小泉商城</a>&nbsp;
        <a href='<%=Url.Action("ershoujiaju")%>' target='_blank'><%=city.ShortName %>二手家具</a>&nbsp;
        <a href='http://ly.sz.bendibao.com/wenquan/' target='_blank'>广东温泉度假村</a>&nbsp;
        <a href='http://www.56tie.com/' target='_blank'>免费发布信息网</a>&nbsp;  
        <%--<a href="/link.html" target="_blank">更多...</a>&nbsp;--%>
        <%--<a href="#">自动申请链接</a>--%>
    </div>
</div>

<!---footer--->
<div id="footer">
    &copy; flxxwang.com 
    <%--<a href="http://about.flxxwang.com/" title="有问题请与<%=SiteInfo.Name%>客服进行对话" id="askicon">联系客服</a>
    <a href="/salelist.shtml" target="_blank" style="margin-left:10px">二手市场导航</a>--%>
</div>
<script type="text/javascript">
    $(function () {
        $("a").attr("target", "_blank");
    });
</script>
</asp:Content>
