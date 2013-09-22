<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Framework.Common" %>
<%@ Import Namespace="Infomation.Core.Extensions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%var city = ViewData["City"] as City; %>
<title>【<%=city.ShortName %>宠物网|<%=city.ShortName %>宠物市场】- <%=city.ShortName %><%=SiteInfo.Name%></title> 
<meta name="keywords" content="<%=city.ShortName %>宠物网,<%=city.ShortName %>宠物市场" /> 
<meta name="description" content="<%=city.ShortName %>宠物网是<%=city.ShortName %>地区最大的网上宠物交易市场，这里有大量的<%=city.ShortName %>宠物市场信息供您查询，经过严格审核的<%=city.ShortName %>宠物市场信息，是您查找<%=city.ShortName %>宠物网的最佳选择。" /> 
<link type="text/css" rel="stylesheet" href="/Content/Fenlei/ui6/index/pets.css" /> 
<%--<script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/boot_toplist_version.js"></script>--%>
<%--<script src="http://pic2.flxxwang.com/n/js/class/jquery1.2.6.pack.js" type=text/javascript></script>--%>
<script src="/Content/Fenlei/Scripts/class/player.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<%var city = ViewData["City"] as City; %>
<div id="header">
    <div id="headerinside">
        <div id="logo">
            <a href="<%=Url.Action("Default","Home") %>" target="_self">
                <img src="/Content/Fenlei/assets/images/logo/logo.gif" alt="中文最大生活信息门户"/>
            </a>
            <span><a href="" target="_self"><b>宠物频道</b></a></span>
        </div>
        <%--<form onsubmit='b_query();return false;'>
            <div id="searchbar">
                <i id="key">
                    <input type="text" id="keyword" name="key" class="keyword" fdv="请输入宠物名称" autocomplete="off" />
                </i>
                <input  type="submit" name="button" class="btnall" id="searchbtn" value="同城搜索" onmousemove="this.className='btnal2'" onmouseout="this.className=''" />
            </div>
        </form>--%>
        <a href="<%=Url.Action("s2","post",new{values="chongwu"}) %>" id="fabu">免费发布信息</a>
    </div>
</div>

<div class="wrap mt15">
	<div class="lbsear">
    	<div class="lhb">
            <h2>类别选择</h2>
        </div>
        <div class="content" id="ymenu-side">
            <ul class="ym-mainmnu">
                <li class="ym-tab">
                    <a class="dlb">大型犬</a>
                    <ul class="ym-submnu">
                    	<li>
                            <%
                                foreach (var tag in PetDog.Singleton.TagCollection.Where(item=>item.Tag=="L"))
                                {
                                    %>
                                    <a href="<%=Url.Action("dog",new{tag=tag.Id}) %>"><%=tag.Name %></a>
                                    <%    
                                }
                            %>
                            <%--<a href="/zangao/">藏獒</a>
                            <a href="/bixiong/">比熊</a>
                            <a href="/jianmao/">金毛</a>
                            <a href="/labuladuo/">拉布拉多</a>
                            <a href="/alasijia/">阿拉斯加</a>
                            <a href="/smuyangqua/">苏格兰牧羊犬</a>
                            <a href=" /damaidingquan/">大麦町犬</a>
                            <a href=" /dmuyangquan/">德国牧羊犬</a>
                            <a href=" /dabaixiong/">大白熊</a>
                            <a href="/gumu/">古牧</a>
                            <a href=" /bianjingmuyangquan/">边境牧羊犬</a>
                            <a href=" /luoweina/">罗威纳</a>
                            <a href="/lingtiquan/">灵提</a>
                            <a href=" /shengbona/">圣伯纳</a>
                            <a href=" /gaojiasuoquan/">高加索犬</a>
                            <a href=" /dubinquan/">杜宾犬</a>--%>
                        </li>
                    </ul>
                </li>
                
                <li class="ym-tab">
                    <a class="dlb">中型犬</a>
                    <ul class="ym-submnu">
                        <li>
                            <%
                                foreach (var tag in PetDog.Singleton.TagCollection.Where(item=>item.Tag=="M"))
                                {
                                    %>
                                    <a href="<%=Url.Action("dog",new{tag=tag.Id}) %>"><%=tag.Name %></a>
                                    <%    
                                }
                            %>
                            <%--<a href=" /samoye/">萨摩耶</a>
                            <a href=" /hashiqi/">哈士奇</a>
                            <a href=" /songshi/">松狮</a>
                            <a href="/shapiquan/">沙皮犬</a>
                            <a href="/bigequan/">比格犬</a>
                            <a href="/keka/">可卡</a>
                            <a href="/xiledi/">喜乐蒂</a>
                            <a href="/douniuquan/">斗牛犬</a>--%>
                        </li>
                    </ul>
                </li>
                
                <li class="ym-tab">
                    <a class="dlb">小型犬</a>
                    <ul class="ym-submnu">
                        <li>
                            <%
                                foreach (var tag in PetDog.Singleton.TagCollection.Where(item=>item.Tag=="S"))
                                {
                                    %>
                                    <a href="<%=Url.Action("dog",new{tag=tag.Id}) %>"><%=tag.Name %></a>
                                    <%    
                                }
                            %>
                            <%--<a href="/ditaixiong/">泰迪熊</a>
                            <a href="/xuenaruei/">雪纳瑞</a>
                            <a href=" /guibinquan/">贵宾</a>
                            <a href="/hudiequan/">蝴蝶犬</a>
                            <a href="/yuekexia/">约克夏</a>
                            <a href="/jiwawa/">吉娃娃</a>
                            <a href="/bomei/">博美犬</a>
                            <a href=" /xishiquan/">西施犬</a>
                            <a href="/bage/">巴哥</a>
                            <a href="/lachang/">腊肠</a>
                            <a href=" /jingba/">京巴</a>
                            <a href=" /xigaodi/">西高地</a>
                            <a href=" /yinhuquan/">银狐犬</a>
                            <a href="/kejiquan/">柯基犬</a>
                            <a href="/qitadog/">其他品种</a>--%>
                        </li>
                    </ul>
                </li>
                
                <li class="ym-tab">
                    <a class="dlb">宠物猫</a>
                    <ul class="ym-submnu">
                        <li>
                            <%
                                foreach (var tag in PetCat.Singleton.TagCollection)
                                {
                                    %>
                                    <a href="<%=Url.Action("cat",new{tag=tag.Id}) %>"><%=tag.Name %></a>
                                    <%
                                }
                            %>
                            <%--<a href="/jiafeimao/">加菲猫</a>
                            <a href="/bosimao/">波斯猫</a>
                            <a href="/zeermao/">折耳猫</a>
                            <a href="/duanmaomao/">短毛猫</a>
                            <a href="/qitamao/">其他</a>--%>
                        </li>
                    </ul>
                </li>

                <li class="ym-tab">
                    <a class="dlb">花鸟鱼虫</a>
                    <ul class="ym-submnu">
                        <li>
                            <%
                                foreach (var obj in PetBird.Singleton.ObjectTypeCollection)
                                {
                                    %>
                                    <a href="<%=Url.Action("huaniao",new{objecttype=obj.Id}) %>"><%=obj.Name%></a>
                                    <%
                                }
                            %>
                            <%--<a href="/guanshangyu/">观赏鱼</a>
                            <a href="/wanshangniao/">玩赏鸟</a>
                            <a href="/qishipenjing/">奇石盆景</a>
                            <a href="/qitaxiaochong/">其他小宠</a>--%>
                        </li>
                    </ul>
                </li>
                
                 <li class="ym-tab">
                    <a class="dlb">宠物用品/食品</a>
                    <ul class="ym-submnu">
                        <li>
                            <%
                                foreach (var obj in PetFood.Singleton.ObjectTypeCollection)
                                {
                                    %>
                                    <a href="<%=Url.Action("shipin",new{objecttype=obj.Id}) %>"><%=obj.Name%></a>
                                    <%
                                }
                            %>
                            <%--<a href="/gouliang/">狗粮</a>
                            <a href="/gouyongpin/">狗用品</a>
                            <a href="/maoliang/">猫粮</a>
                            <a href="/maoyongpin/">猫用品</a>
                            <a href="/chongwuwanju/">宠物玩具</a>
                            <a href="/chongwufushi/">宠物服饰</a>
                            <a href="/qitayongpin/">其他</a>--%>
                        </li>
                    </ul>
                </li>
                
                 <li class="ym-tab">
                    <a class="dlb">宠物店/服务</a>
                    <ul class="ym-submnu">
                        <li>
                            <%
                                foreach (var obj in PetService.Singleton.ObjectTypeCollection)
                                {
                                    %>
                                    <a href="<%=Url.Action("cwhuwu",new{objecttype=obj.Id}) %>"><%=obj.Name%></a>
                                    <%
                                }
                            %>
                            <%--<a href="/chongwuyiyuan/">宠物医院</a>
                            <a href="/chongwujiyang/">宠物寄养</a>
                            <a href="/chongwumeirong/">宠物美容</a>
                            <a href="/chongwusheying/">宠物摄影</a>
                            <a href="/chongwupeizhong/">宠物配种</a>
                            <a href="/chongwutuoyun/">宠物托运</a>
                            <a href="/qitacwfw/">其他宠物服务</a>--%>
                        </li>
                    </ul>
                </li>

                <li class="ym-tab" id="bgno">
                    <a class="dlb">宠物赠送/领养</a>
                    <ul class="ym-submnu">
                        <li>
                            <a href="<%=Url.Action("cwzengsong")%>">宠物赠送</a>
                            <a href="<%=Url.Action("cwzengsong")%>">宠物领养</a>
                        </li>
                    </ul>
                </li>
                <div class="clear"></div>
            </ul>
        </div>
    </div>

    <div id="ajquery">
        
        <div id="ajquerycon">
            <%
                var playItems = PetDog.Recent(true, 6);
                for (var i=0;i<playItems.Count;i++)
                {
                    var item = playItems[i];
                    %>
                    <div id="jqbg0<%=i %>">
                        <span>
                            <a href='<%=item.Link.Url(this.Url) %>' target="_blank">
                                <img src='<%=item.PictureList[0] %>' />
                            </a>
                        </span>
                        <a href='<%=item.Link.Url(this.Url) %>' target="_blank" class="ajtit"><%=item.Title %></a>
                    </div>
                    <%
                }
            %>
            <%--<div id="jqbg00">
                <span>
                    <a href='http://hz.flxxwang.com/dog/7852178727171x.shtml' target="_blank">
                        <img src='http://pic.flxxwang.com/p1/big/n_15121896169482.jpg' />
                    </a>
                </span>
                <a href='http://hz.flxxwang.com/dog/7852178727171x.shtml' target="_blank" class="ajtit">家养纯种墨西哥吉娃娃</a>
            </div>

            <div id="jqbg01">
                <span>
                    <a href='http://hz.flxxwang.com/dog/7852138902534x.shtml' target="_blank">
                        <img src='http://pic.flxxwang.com/p1/big/n_15121858806545.jpg' />
                    </a>
                </span>
                <a href='http://hz.flxxwang.com/dog/7852138902534x.shtml' target="_blank" class="ajtit">家养博美宝宝,公母都</a>
            </div>

            <div id="jqbg02">
                <span>
                    <a href='http://hz.flxxwang.com/dog/7852147027204x.shtml' target="_blank">
                        <img src='http://pic.flxxwang.com/p1/big/n_15121832340496.jpg' />
                    </a>
                </span>
                <a href='http://hz.flxxwang.com/dog/7852147027204x.shtml' target="_blank" class="ajtit">出售蓝眼三把火哈士奇</a>
            </div>

            <div id="jqbg03">
                <span>
                    <a href='http://hz.flxxwang.com/dog/7852129302920x.shtml' target="_blank">
                        <img src='http://pic.flxxwang.com/p1/big/n_15121800855058.jpg' />
                    </a>
                </span>
                <a href='http://hz.flxxwang.com/dog/7852129302920x.shtml' target="_blank" class="ajtit">自家的金毛宝宝现在快</a>
            </div>

            <div id="jqbg04">
                <span>
                    <a href='http://hz.flxxwang.com/dog/7852090467590x.shtml' target="_blank">
                        <img src='http://pic.flxxwang.com/p1/big/n_15121756826636.jpg' />
                    </a>
                </span>
                <a href='http://hz.flxxwang.com/dog/7852090467590x.shtml' target="_blank" class="ajtit">转让家养纯种纯正玩具</a>
            </div>

            <div id="jqbg05">
                <span>
                    <a href='http://hz.flxxwang.com/dog/7676124224390x.shtml' target="_blank">
                        <img src='http://pic.flxxwang.com/p1/big/n_14769831933202.jpg' />
                    </a>
                </span>
                <a href='http://hz.flxxwang.com/dog/7676124224390x.shtml' target="_blank" class="ajtit">可爱的松狮头贵宾犬转</a>
            </div>--%>
        </div>

        <div id="ajquerynav">
       
        <ul>
            <%
                for (var i=0;i<playItems.Count;i++)
                    {
                        var item = playItems[i];
                        %>
                        <li<%=i == 0 ? " class='current'" : ""%>><p><span><img src='<%=item.PictureList[0] %>' /></span></p></li>
                        <%
                    }
            %>
            
            <%--<li class='current'><p><span><img src='http://pic.flxxwang.com/p1/tiny/n_15121896169482.jpg' /></span></p></li>

            <li ><p><span><img src='http://pic.flxxwang.com/p1/tiny/n_15121858806545.jpg' /></span></p></li>

            <li ><p><span><img src='http://pic.flxxwang.com/p1/tiny/n_15121832340496.jpg' /></span></p></li>

            <li ><p><span><img src='http://pic.flxxwang.com/p1/tiny/n_15121800855058.jpg' /></span></p></li>

            <li ><p><span><img src='http://pic.flxxwang.com/p1/tiny/n_15121756826636.jpg' /></span></p></li>

            <li ><p><span><img src='http://pic.flxxwang.com/p1/tiny/n_14769831933202.jpg' /></span></p></li>--%>

        </ul>
    </div>
</div>
</div>
<div class="clear"></div>

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

<div class="wrap mt15">
    <div class="petshot">
        <h2>热门宠物品种</h2>
        <div class="petslb">
            <a href="<%=Url.Action("dog") %>">全部</a>
            <%
                foreach (var tag in PetDog.Singleton.TagCollection.Take(19))
                {
                    %>
                    <a href="<%=Url.Action("dog",new{tag=tag.Id}) %>"><%=tag.Name %></a>
                    <%
                }
            %>    
            <%--<a href="/hashiqi/">哈士奇</a>
            <a href="/zangao/">藏獒</a>
            <a href="/ditaixiong/">泰迪熊</a>
            <a href="/samoye/">萨摩耶</a>
            <a href="/bixiong/">比熊</a>
            <a href="/jianmao/">金毛</a>
            <a href="/labuladuo/">拉布拉多</a>
            <a href="/songshi/">松狮</a>
            <a href="/jiwawa/">吉娃娃</a>
            <a href="/bomei/">博美犬</a>
            <a href="/xuenaruei/">雪纳瑞</a>
            <a href="/dmuyangquan/">德国牧羊犬</a>
            <a href="/guibinquan/">贵宾</a>
            <a href="/alasijia/">阿拉斯加</a>
            <a href="/hudiequan/">蝴蝶犬</a>
            <a href="/gaojiasuoquan/">高加索犬</a>
            <a href="/keka/">可卡</a>
            <a href="/shapiquan/">沙皮犬</a>
            <a href="/smuyangqua/">苏格兰牧羊犬</a>--%>
        </div>
	</div>
</div>
<div class="clear"></div>

<!---最新发布--->
<%--<div class="wrap mt15">
    <div class="petshot">
        <h2>最新发布</h2>
        <div class="newfb">
        
        <ul>

            <li><a href='http://hz.flxxwang.com/dog/7852178727171x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_15121896169482.jpg' /></a><span class="fr">年龄：3个月</span><b>500</b>元</li>

            <li><a href='http://hz.flxxwang.com/dog/7852138902534x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_15121858806545.jpg' /></a><span class="fr">年龄：3个月</span><b>500</b>元</li>

            <li><a href='http://hz.flxxwang.com/dog/7852147027204x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_15121832340496.jpg' /></a><span class="fr">年龄：3个月</span><b>700</b>元</li>

            <li><a href='http://hz.flxxwang.com/dog/7852129302920x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_15121800855058.jpg' /></a><span class="fr">年龄：3个月</span><b>600</b>元</li>

            <li><a href='http://hz.flxxwang.com/dog/7852090467590x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_15121756826636.jpg' /></a><span class="fr">年龄：3个月</span><b>800</b>元</li>

            <li><a href='http://hz.flxxwang.com/dog/7676124224390x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_14769831933202.jpg' /></a><span class="fr">年龄：个月</span>面议</li>

            <li><a href='http://hz.flxxwang.com/dog/7849108413190x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_15115961756174.jpg' /></a><span class="fr">年龄：2个月</span>面议</li>

            <li><a href='http://hz.flxxwang.com/dog/7750907740418x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_14919236827402.jpg' /></a><span class="fr">年龄：3个月</span><b>500</b>元</li>

            <li><a href='http://hz.flxxwang.com/dog/6898827297027x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_13215183909123.jpg' /></a><span class="fr">年龄：3个月</span><b>450</b>元</li>

            <li><a href='http://hz.flxxwang.com/dog/7849492282501x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_15116516404240.jpg' /></a><span class="fr">年龄：2个月</span><b>1400</b>元</li>

            <li><a href='http://hz.flxxwang.com/dog/7793493408007x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_15004385085714.jpg' /></a><span class="fr">年龄：3个月</span><b>2200</b>元</li>

            <li><a href='http://hz.flxxwang.com/dog/7848372966914x.shtml' target="_blank" class="scrpicimg"><img src='http://pic.flxxwang.com/p1/tiny/n_15114284869898.jpg' /></a><span class="fr">年龄：3个月</span><b>1000</b>元</li>

        </ul>
        </div>
    </div>       
</div>--%>
<div class="clear"></div>

<!---宠物狗--->
<div class="wrap mt15">
	<%--<div class="wbody">
        <div class="petshot">
            <h2>
                <span class="fr">
                    <a href="/hashiqi/">哈士奇</a>
                    <a href="/jianmao/">金毛</a>
                    <a href="/zangao/">藏獒</a>
                    <a href="/ditaixiong/">泰迪熊</a>
                    <a href="/dog/">更多&raquo;</a>
                </span>
                <a href="/dog/" class="black">宠物狗</a>
            </h2>
    		
            <table cellpadding="0" cellspacing="0" border="0" class="tbimg" id="infolist">

                 <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/dog/7852178727171x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15121896169482.jpg' alt="家养纯种墨西哥吉娃娃苹果头大眼睛,相貌标致体态优美" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/dog/7852178727171x.shtml' target="_blank" class="t">家养纯种墨西哥吉娃娃</a><span class="ico c_666">(杭州)</span><br />自家繁殖的吉娃娃宝宝热卖中 头...</td>
                    <td class="price">
                   <b>500</b>元<br />51秒前
        
                  </td>
              </tr>
  
                 <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/dog/7852138902534x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15121858806545.jpg' alt="家养博美宝宝,公母都有。喜欢的可联系我看宝宝" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/dog/7852138902534x.shtml' target="_blank" class="t">家养博美宝宝,公母都</a><span class="ico c_666">(杭州)</span><br />出售自家繁殖多只纯种健康博美幼...</td>
                    <td class="price">
                   <b>500</b>元<br />4分钟前
        
                  </td>
              </tr>
  
                 <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/dog/7852147027204x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15121832340496.jpg' alt="出售蓝眼三把火哈士奇宝宝,活泼可爱,疫苗和驱虫已做" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/dog/7852147027204x.shtml' target="_blank" class="t">出售蓝眼三把火哈士奇</a><span class="ico c_666">(杭州)</span><br />哈士奇狗狗都已做了3针荷兰疫苗和...</td>
                    <td class="price">
                   <b>700</b>元<br />5分钟前
        
                  </td>
              </tr>
  
               </table>
        </div>
    </div>
    <div class="wbody fr">
        <div class="petshot">
            <h2>
                <span class="fr">
                    <a href="/jiafeimao/">加菲猫</a>
                    <a href="/bosimao/">波斯猫</a>
                    <a href="/zeermao/">折耳猫</a>
                    <a href="/qitamao/">其他</a>
                    <a href="/cat/">更多&raquo;</a>
                </span>
                <a href="/cat/" class="black">宠物猫</a>
            </h2>
    		
            <table cellpadding="0" cellspacing="0" border="0" class="tbimg" id="infolist">

                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/cat/7840374845699x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15098295816973.jpg' alt="(转让)高品质 英短渐层种公 便宜出售" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/cat/7840374845699x.shtml' target="_blank" class="t">(转让)高品质 英短渐层</a><span class="ico c_666">(杭州-江干-三里亭)</span><br />(转让)高品质 英短渐层种公 便宜...</td>
                    <td class="price">
                    <b>2800</b>元<br />26小时前
        
                    </td>
                </tr>
  
                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/cat/7840347879430x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15098246445327.jpg' alt="纯种苏格兰折耳 虎斑" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/cat/7840347879430x.shtml' target="_blank" class="t">纯种苏格兰折耳 虎斑</a><span class="ico c_666">(杭州-江干-三里亭)</span><br />纯种苏格兰折耳 虎斑 蓝虎斑 黑...</td>
                    <td class="price">
                    <b>2500</b>元<br />26小时前
        
                    </td>
                </tr>
  
                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/cat/7840338999431x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15098205462796.jpg' alt="有偿 领养 纯种英短 红虎斑DD" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/cat/7840338999431x.shtml' target="_blank" class="t">有偿 领养 纯种英短 </a><span class="ico c_666">(杭州-江干-三里亭)</span><br />有偿 领养 纯种英短 红虎斑DD...</td>
                    <td class="price">
                    <b>1200</b>元<br />26小时前
        
                    </td>
                </tr>
  
            </table>
        </div>
    </div>
    <div class="clear"></div>
    <div class="wbody mt15">
        <div class="petshot">
            <h2>
                <span class="fr">
                    <a href="/guanshangyu/">观赏鱼</a>
                    <a href="/wanshangniao/">玩赏鸟</a>
                    <a href="/qishipenjing/">奇石盆景</a>
                    <a href="/qitaxiaochong/">其他小宠</a>
                    <a href="/pet/">更多&raquo;</a>
                </span>
                <a href="/pet/" class="black">花鸟鱼虫</a>
            </h2>
        
            <table cellpadding="0" cellspacing="0" border="0" class="tbimg" id="infolist">

                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/pet/7851454337797x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15120177575438.jpg' alt="超可爱小宠荷兰兔找爱心新主人拉,带笼子转让" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/pet/7851454337797x.shtml' target="_blank" class="t">超可爱小宠荷兰兔找爱</a><span class="ico c_666">(杭州-滨江-浦沿)</span><br />超可爱的荷兰兔宝宝，因为很快就...</td>
                    <td class="price">
                    <b>80</b>元<br />2小时前
        
                    </td>
                </tr>
  
                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/pet/5730338812547x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_11520944619268.jpg' alt="黄色孔雀鸽一对" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/pet/5730338812547x.shtml' target="_blank" class="t">黄色孔雀鸽一对</a><span class="ico c_666">(杭州-余杭)</span><br />有黄色孔雀鸽数对 凤尾鸽 青年鸽...</td>
                    <td class="price">
                    <b>300</b>元<br />22小时前
        
                    </td>
                </tr>
  
                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/pet/7832847195400x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15083233037072.jpg' alt="艾伦水虎 鱼缸成套转" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/pet/7832847195400x.shtml' target="_blank" class="t">艾伦水虎 鱼缸成套转</a><span class="ico c_666">(杭州-上城-望江)</span><br />18CM的艾伦&nbsp; 喜欢的朋友肯...</td>
                    <td class="price">
                    <b>600</b>元<br />42小时前
        
                    </td>
                </tr>
  
            </table>
        </div>
    </div>
    <div class="wbody fr mt15">
        <div class="petshot">
            <h2>
                <span class="fr">
                    <a href="/cwzengsong/0/">宠物赠送</a>
                    <a href="/cwzengsong/1/">宠物领养</a>
                    <a href="/cwzengsong/">更多&raquo;</a>
                </span>
                <a href="/cwzengsong/" class="black">宠物赠送/领养</a>
            </h2>
    		
            <table cellpadding="0" cellspacing="0" border="0" class="tbimg" id="infolist">

                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/cwzengsong/7829148672133x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15075836409612.jpg' alt="转让画眉给有爱心爱动物之人赠鸟笼" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/cwzengsong/7829148672133x.shtml' target="_blank" class="t">转让画眉给有爱心爱动</a><span class="ico c_666">(杭州-萧山-北干)</span><br />本人有一只小画眉爱鸟，从小养大...</td>
                    <td class="price">
                    50小时前
        
                    </td>
                </tr>
  
                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/cwzengsong/7806933634821x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15031397726738.jpg' alt="自家毛毛寻求有心人领养.3个月大金毛." /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/cwzengsong/7806933634821x.shtml' target="_blank" class="t">自家毛毛寻求有心人领</a><span class="ico c_666">(杭州-江干)</span><br />自家毛毛寻求有心人领养.3个月大...</td>
                    <td class="price">
                    11-11
        
                    </td>
                </tr>
  
                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/cwzengsong/7796362058755x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15010264921613.jpg' alt="希望领养一只铁包金小鹿犬,4个月以下年龄" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/cwzengsong/7796362058755x.shtml' target="_blank" class="t">希望领养一只铁包金小</a><span class="ico c_666">(杭州-拱墅-余杭塘上)</span><br />家里的小鹿不幸去世了，希望再养...</td>
                    <td class="price">
                    11-10
        
                    </td>
                </tr>
  
            </table>
        </div>
    </div>
    <div class="wbody mt15">
        <div class="petshot">
            <h2>
                <span class="fr">
                    <a href="/gouliang/">狗粮</a>
                    <a href="/maoliang/">猫粮</a>
                    <a href="/chongwuwanju/">宠物玩具</a>
                    <a href="/qitayongpin/">其他</a>
                    <a href="/shipin/">更多&raquo;</a>
                </span>
                <a href="/shipin/" class="black">宠物用品/食品</a>
            </h2>
       
            <table cellpadding="0" cellspacing="0" border="0" class="tbimg" id="infolist">

                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/shipin/7839926424964x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15097375053066.jpg' alt="高档出口产品.kaiqu高档皮宠物窝 狗屋 狗房子" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/shipin/7839926424964x.shtml' target="_blank" class="t">高档出口产品.kaiqu高</a><span class="ico c_666">(杭州-上城-吴山)</span><br />) 产品材质：蜡感变色皮/棉垫，...</td>
                    <td class="price">
                    <b>320</b>元<br />27小时前
        
                    </td>
                </tr>
  
                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/shipin/7839869423106x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15097278797070.jpg' alt="自钓钱塘江鳗鱼出售诚心想要的请联系,非诚勿扰。" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/shipin/7839869423106x.shtml' target="_blank" class="t">自钓钱塘江鳗鱼出售诚</a><span class="ico c_666">(杭州-江干-白杨)</span><br />自钓钱塘江鳗鱼出售诚心想要的请...</td>
                    <td class="price">
                    面议<br />27小时前
        
                    </td>
                </tr>
  
                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/shipin/7806496970370x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15030538055434.jpg' alt="转让95成新的宠物窝狗窝 粉红公主窝" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/shipin/7806496970370x.shtml' target="_blank" class="t">转让95成新的宠物窝狗</a><span class="ico c_666">(杭州-江干-钱江新城)</span><br />宠物店买来价格是69元，我们家狗...</td>
                    <td class="price">
                    <b>39</b>元<br />11-11
        
                    </td>
                </tr>
  
            </table>
        </div>
    </div>
    <div class="wbody fr mt15">
        <div class="petshot">
            <h2>
                <span class="fr">
                    <a href="/chongwuyiyuan/">宠物医院</a>
                    <a href="/chongwujiyang/">宠物寄养</a>
                    <a href="/chongwumeirong/">宠物美容</a>
                    <a href="/qitacwfw/">其他</a>
                    <a href="/chongwu/">更多&raquo;</a>
                </span>
                <a href="/chongwu/" class="black">宠物服务</a>
            </h2>
    		
            <table cellpadding="0" cellspacing="0" border="0" class="tbimg" id="infolist">
                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/chongwu/7829850882821x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15077202447890.jpg' alt="超级贵宾种公茶杯犬对外配种" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/chongwu/7829850882821x.shtml' target="_blank" class="t">超级贵宾种公茶杯犬对</a><span class="ico c_666">(杭州)</span><br />三条超级种公对外配种 18*1819*1...</td>
                    <td class="price">
                    <b>2000</b>元<br />48小时前
        
                    </td>
                </tr>
  
                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/chongwu/7815812967298x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15049165102098.jpg' alt="宠物训练  狗狗训练 狗狗寄养 宠物寄养乐园 训犬" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/chongwu/7815812967298x.shtml' target="_blank" class="t">宠物训练  狗狗训练 狗</a><span class="ico c_666">(杭州)</span><br />坚持以犬为本，本中心环境优美，...</td>
                    <td class="price">
                    面议<br />11-12
        
                    </td>
                </tr>
  
                <tr>
                    <td class="img" width="60"><div><a href='http://hz.flxxwang.com/chongwu/7807505629062x.shtml' target="_blank"><img src='http://pic.flxxwang.com/p1/tiny/n_15032575152397.jpg' alt="超小玩具红贵宾对外配种啦~~" /></a></div></td>
                    <td class="t"><a href='http://hz.flxxwang.com/chongwu/7807505629062x.shtml' target="_blank" class="t">超小玩具红贵宾对外配</a><span class="ico c_666">(杭州-萧山-萧山周边)</span><br />宝贝是超小玩具~身材匀称 体重才...</td>
                    <td class="price">
                    面议<br />11-11
        
                    </td>
                </tr>
            </table>
        </div>
    </div>--%>
    <div class="wbody mt15" style="text-align:center">
        <%--广告位置--%>
        <%
            if (SiteInfo.IsTaojen)
            {
                %>
                <%--336*280大矩形--%>
                <%=UnionAd.Baidu_336_280.Code %>
                <%
            }
            else
            {
                %>
                <%--336 x 280 - 大矩形--%>
                <%=UnionAd.Google_336_280.Code %>
                <%    
            }
        %>
    </div>
    <div class="wbody fr mt15" style="text-align:center">
        <%--广告位置--%>
        <%
            if (SiteInfo.IsTaojen)
            {
                %>
                <%--336*280大矩形--%>
                <%=UnionAd.Baidu_336_280.Code %>
                <%
            }
            else
            {
                %>
                <%--336 x 280 - 大矩形--%>
                <%=UnionAd.Google_336_280.Code %>
                <%    
            }
        %>
    </div>
    <div class="clear"></div>
</div>
<div class="clear"></div>

<div class="wrap">
	<p class="tips">
        <%=city.ShortName %>宠物频道-为您免费提供<%=city.ShortName %>宠物信息发布及查询服务。
        <%--如果您对<%=city.ShortName %>宠物频道有任何意见和建议，欢迎 <a href="http://about.flxxwang.com/">联系客服</a>--%>
    </p>
    <div class="others">
        <ul>
            <li><a href="<%=Url.Action("Index",new{city="bj"}) %>">北京宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="sh"}) %>">上海宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="sz"}) %>">深圳宠物网</a></li>                        
            <li><a href="<%=Url.Action("Index",new{city="su"}) %>">苏州宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="gz"}) %>">广州宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="wh"}) %>">武汉宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cd"}) %>">成都宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="tj"}) %>">天津宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cc"}) %>">长春宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="sy"}) %>">沈阳宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="qd"}) %>">青岛宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="km"}) %>">昆明宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="fz"}) %>">福州宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="jn"}) %>">济南宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="hz"}) %>">杭州宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="wz"}) %>">温州宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="cs"}) %>">长沙宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="jl"}) %>">吉林宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="dl"}) %>">大连宠物网</a></li>
            <li><a href="<%=Url.Action("Index",new{city="hrb"}) %>">哈尔滨宠物网</a></li> 
        </ul>
        <div class="clear"></div>
    </div>

    <%--<div class="others">
        <ul class="friendlink">
            ﻿&nbsp;<a href="#">自动申请链接</a>
        </ul>
        <div class="clear"></div>
    </div>--%>

</div>

<div id="footer">
    &copy; 2010 flxxwang.com  
    <%--<a href="http://about.flxxwang.com/" id="askicon">联系客服</a>--%>
    <a href="<%=Url.Action("salelist","home") %>" target="_blank" style="margin-left:10px">二手市场导航</a>
</div>
<script type="text/javascript">
    $(function () {
        $("a").attr("target", "_blank");
    });
</script>
</asp:Content>
