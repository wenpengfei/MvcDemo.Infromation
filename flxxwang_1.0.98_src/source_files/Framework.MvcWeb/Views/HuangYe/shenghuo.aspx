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
    <span id="hot">热门搜索：
        <A href="<%=Url.Action("banjia") %>">搬家</A>
        <A href="<%=Url.Action("jiazheng",new{objecttype=2}) %>">保姆</A>
        <A href="<%=Url.Action("baojie") %>">保洁</A>
        <A href="<%=Url.Action("huishou") %>">二手回收</A>
        <A href="<%=Url.Action("zuche") %>">租车</A>
        <A href="<%=Url.Action("lipinxianhua",new{objecttype=2}) %>">鲜花</A>
        <A href="<%=Url.Action("ShengHuoPeiSong",new{objecttype=3}) %>">送水</A>
    </span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Rows" runat="server">
<div class="hytop">
    <a href="<%=Url.Action("Index", "huangye")%>"><span> 黄页首页 </span></a>
    <b> 生活服务 </b>
    <a href="<%=Url.Action("shangwu", "huangye")%>"><span> 商务服务 </span></a>
    <a href="<%=Url.Action("Index", "jiaoyu")%>"><span> 教育培训 </span></a>
    <a href="<%=Url.Action("lvyouxiuxian", "huangye")%>"><span> 旅游/酒店/签证 </span></a>
    <a href="<%=Url.Action("zhaoshang", "huangye")%>"><span> 招商加盟 </span></a>
    <p><i></i></p>
</div>


<div class="cb">
    <%
        var categories1 = InfoCategory.GetCategory(YellowPageBigType.ShengHuo);
        var categories2 = InfoCategory.GetCategory(YellowPageBigType.WeiXiuZhuangXiu);
        var categories3 = InfoCategory.GetCategory(YellowPageBigType.HunQing);
        var categories4 = InfoCategory.GetCategory(YellowPageBigType.BianMin);
        var categories = categories1.Union(categories2).Union(categories3).Union(categories4);
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
        <h2><a href="/banjia/">搬家</a></h2>
        <p>
            <a class="c_r" href="/kongtiaochaizhuang/">空调拆装</a><cite>|</cite>
            <a href="/gongsibanjia/">公司搬家</a><cite>|</cite>
            <a href="/banjiabanchang/">搬家搬场</a><cite>|</cite>
            <a href="/changtubanjia/">长途搬家搬运</a><cite>|</cite>
            <a href="/shebeibanqian/">设备搬迁</a><cite>|</cite>
            <a href="/qizhongdiaozhuang/">起重吊装</a><br />&nbsp;
        </p>
        <h2><a href="/baojie/">保洁清洗</a></h2>
        <p>
            <a class="c_r" href="/richangbaojie/">日常保洁</a><cite>|</cite>
            <a href="/kaihuangbaojie/">开荒保洁</a><cite>|</cite>
            <a href="/gongyebaojie/">工程保洁</a><cite>|</cite>
            <a href="/waiqiangqingxi/">外墙清洗</a>
        </p>
        <h2><a href="/meitishou/">美发/美体</a></h2>
        <p><a href="/nanshimeirong/">男士美容</a><cite>|</cite><a class="c_r" href="/mtss/">美体塑身</a><cite>|</cite><a href="/ssmeifa/">美发</a><cite>|</cite><a href="/fxiong/">丰胸</a><cite>|</cite><a href="/chubaheng/">除疤痕</a><cite>|</cite><a href="/mrmeijia/">美容美甲</a><cite>|</cite><a href="/wenshen/">纹身</a><cite>|</cite><a href="/tuomao/">脱毛</a><br /><a href="/mianbumeir/">面部美容</a><cite>|</cite><a href="/shoulian/">瘦脸</a></p>
        <h2><a href="/huishou/">二手回收</a></h2>
        <p><a href="/ziyuanhuishou/">资源回收</a><cite>|</cite><a   href="/jiajuhuishou/">家具家居回收</a><cite>|</cite><a class="c_r" href="/dianqihuishou/">电器回收</a><cite>|</cite><a href="/bangonghuishou/">办公用品回收</a><cite>|</cite><a href="/jinshuhuishou/">金属回收</a><cite>|</cite><a href="/diannaohuishou/">电脑回收</a><br /><a href="/dianzichanpin/">数码电子回收</a><cite>|</cite><a href="/ershoushichang/">手机回收</a><cite>|</cite><a href="/huishoushebei/">设备回收</a><cite>|</cite><a href="/feijiuhuishou/">其他回收</a></p>
        <h2><a href="/zhuankeyiy/">专科医院</a></h2>
        <p><a href="/fukeyiy/">妇科医院</a><cite>|</cite><a href="/zhengxing/">整形美容</a><cite>|</cite><a href="/pifubing/">皮肤病</a><cite>|</cite><a href="/yunyu/">不孕不育</a><cite>|</cite><a href="/kouqiang/">口腔</a><cite>|</cite><a href="/nanke/">男科</a><cite>|</cite><a href="/yanke/">眼科</a><cite>|</cite><a href="/guke/">骨科</a><cite>|</cite><a href="/naoke/">脑科</a></p>
        <h2><a href="/shutong/">管道疏通</a></h2> 
        <p><a href="/guandao/">管道疏通</a><cite>|</cite><a href="/weijust/">马桶疏通</a><cite>|</cite><a href="/xiashuidao/">下水道疏通</a><cite>|</cite><a href="/fencist/">化粪池清理</a></p>
        <h2><a href="/hunsha/">摄影摄像</a></a></h2>
        <p><a href="/shexiang/">摄像录像</a><cite>|</cite><a class="c_r" href="/yishusheying/">艺术摄影</a><cite>|</cite><a href="/chongyin/">彩扩冲印</a><cite>|</cite><a href="/hunshasy/">婚纱摄影</a><cite>|</cite><a href="/zhuanyesheying/">商业摄影</a><cite>|</cite><a href="/ertongsheying/" class="c_r">儿童摄影</a><cite>|</cite><a href="/gerenxiezhen/">个人写真</a><br /><a href="/xiangkuangzz/">相框相册制作</a></p>
        <h2><a href="/shipinlei/">食品</a></h2>
        <p><a href="/chaye/">茶叶</a><cite>|</cite><a href="/xiuxianshipin/">休闲食品</a><cite>|</cite><a href="/haixianlei/">海鲜类</a><cite>|</cite><a href="/guoshulei/">果蔬类</a><cite>|</cite><a href="/lipinka/">礼品卡</a><cite>|</cite><a href="/ylgz/">饮料果汁</a><cite>|</cite><a href="/jiulei/">酒类</a><cite>|</cite><a href="/fangbianshipin/">方便食品</a><br /><a href="/tutechan/">土特产</a><cite>|</cite><a href="/rouzhipin/">肉制品</a><cite>|</cite><a href="/wgzl/">五谷杂粮</a></p>
    <h2><a href="/fangweixiu/">房屋维修/防水</a></h2>
        <p><a href="/dianlu/">电路维修/安装</a><cite>|</cite><a class="c_r"href="/dakong/">打孔</a><cite>|</cite><a href="/shuiguan/">水管安装/维修</a><cite>|</cite><a href="/fangshui/">防水补漏</a><cite>|</cite><a href="/nuanqiweixiu/">暖气安装/维修</a><cite>|</cite><a href="/fenshuafangfu/">粉刷/防腐</a><br /><a href="/dajing/">打井</a></p>
       
    
    
        <h2><a href="/dianqi/">家电维修</a></h2>
        <p><a href="/dianshiweixiu/">电视维修</a><cite>|</cite><a href="shoujiweixiu">手机维修</a><cite>|</cite><a class="c_r" href="/kongtiao/">空调维修</a><cite>|</cite><a href="/zangao/">洗衣机维修</a><cite>|</cite><a href="/reshuiqiweixiu/">热水器维修</a><cite>|</cite><a href="/dianciluwx/">电磁炉维修</a><br /><a href="/bingxiangweixiu/">冰箱维修</a><cite>|</cite><a href="/weiboluweixiu/">微波炉维修</a><cite>|</cite><a href="/shumaweixiu/">数码维修</a><cite>|</cite><a href="/youyanjiweixiu/">抽油烟机维修</a><cite>|</cite><a href="/zhaojuweixiu/">燃气灶维修</a><cite>|</cite><a href="/yinshujiwx/">饮水机维修</a><br /><a href="/yixiangwx/">音响/功放维修</a><cite>|</cite></p>
            <h2><a href="/huwaiyundong/">户外</a></h2>
        <p><a class="c_r" href="/huaxuechang/">滑雪场</a><cite>|</cite><a   href="/panyan/">攀岩</a><cite>|</cite><a href="/qima/">骑马</a><cite>|</cite><a href="/bengji/">蹦极</a><cite>|</cite><a href="/qianshui/">潜水</a><cite>|</cite><a href="/piaoliu/">漂流</a><cite>|</cite><a href="/tuozhan/">野外生存/拓展</a><cite>|</cite><a href="/liubingchang/">溜冰场</a><cite>|</cite><a href="/kadingche/">卡丁车</a><br /><a   href="/reqiqiu/">滑翔/热气球</a><cite>|</cite></p>
            <h2><a href="/zulin/">租赁</a></h2>
        <p><a class="c_r" href="/jixiezulin/">机械设备租赁</a><cite>|</cite><a href="/bangongzulin/">办公设备租赁</a><cite>|</cite><a href="/qingdianzulin/">庆典会展租赁</a><cite>|</cite><a href="/fuzhuangzl/">服装租赁</a><cite>|</cite><a href="/zhuoyizl/">家具租赁</a></p>
        <h2><a href="/bgsbwx/">办公设备维修</a></h2>
        <p><a href="/fuyinjiweixiu/" class="c_r">复印机维修</a><cite>|</cite><a href="/dayinjiweixiu/">打印机维修</a><cite>|</cite><a href="/yinshuajiweixiu/">印刷机维修</a><cite>|</cite><a href="/penmajiweixiu/">喷码机维修</a><cite>|</cite><a href="/jituandianhua/">集团电话维修</a><br /><a href="/yjcmpwx/">液晶屏/触摸屏维修</a><cite>|</cite><a href="/touyingjiwx/">投影机维修</a><cite>|</cite><a href="/chuanzhenjiweixiu/">传真机维修</a><cite>|</cite><a href="/huituyiweixiu/">绘图仪维修</a><br />
        </p>
        <h2>公共服务</h2>
        <p><a href="/yiyuan/">医院</a><cite>|</cite><a href="/yinhang/">银行</a><cite>|</cite><a href="/shangchang/">商场</a><cite>|</cite><a href="/jiayouzhan/">加油站</a><cite>|</cite><a href="/jiadianmc/">家电卖场</a><cite>|</cite><a href="/yaodian/">药店</a><cite>|</cite><a href="/shudian/">书店</a><cite>|</cite><a href="/chaoshibld/">超市便利店</a><br /><a href="/zilaishui/">自来水/电力营业厅</a><cite>|</cite><a href="/jinrongjg/">金融机构</a><cite>|</cite><a href="/youjutx/">邮局通讯</a><cite>|</cite>
        </p>
        
      </div>

    <div class="r">
          <h2><a href="/zhuangxiu/">装修装饰</a></h2>
        <p><a href="/changsuo/">场所装修</a><cite>|</cite><a class="c_r" href="/jiazhuang/">家庭装修</a><cite>|</cite><a href="/gongzhuang/">办公装修</a><cite>|</cite><a href="/ershoufangzx/">二手房装修</a><cite>|</cite><a href="/shineizx/">旧房翻新</a><cite>|</cite><a href="/qiangyi/">墙艺</a><cite>|</cite><a href="/zhuangxiudui/">工程装修</a><br /><a href="/zshi/">装饰</a><cite>|</cite><a href="/tyjg/">庭院景观</a></p>
       <h2><a href="/baomu/">家政</a></h2>
    <p><a href="/zhongdiangong/">钟点工</a><cite>|</cite><a class="c_r" href="/bmu/">保姆</a><cite>|</cite><a href="/guanjia/">管家</a><cite>|</cite><a href="/yiliaopeihu/">医疗陪护</a><cite>|</cite><a href="/yuesao/">月嫂/育婴师</a><cite>|</cite><a href="/leihu/">家庭护理</a><cite>|</cite><a href="/sewai/">涉外家政</a></p>
     <h2><a href="/huizhan/">礼仪庆典</a></h2>
    <p><a href="/liyihuodong/">庆典公司</a><cite>|</cite><a href="/huizhanlan/" class="c_r">展览展会</a><cite>|</cite><a href="/huodongcehua/">活动策划</a><cite>|</cite><a href="/liyimote/">礼仪模特</a><cite>|</cite><a href="/changdidajian/">场地布置</a><cite>|</cite><a href="/ydyc/">乐队/演出</a><br />&nbsp;</p>
    <h2><a href="/tesecanyin/">餐饮</a></h2>
    <p><a href="/xican/">西餐</a><cite>|</cite><a href="/zizhu/">自助</a><cite>|</cite><a class="c_r" href="/zhongcanyin/">中餐</a><cite>|</cite><a href="/rihan/">日韩/东南亚</a><cite>|</cite><a href="/kuaican/">快餐/外卖</a><cite>|</cite><a href="/huoguo/">火锅</a><cite>|</cite><a href="/haixian/">海鲜</a><cite>|</cite><br /><a href="/dangao/">蛋糕/甜点/冰淇淋</a></p>
    <h2><a href="/yulecs/">娱乐休闲</a></h2>
    <p><a href="/yezonghui/">夜总会</a><cite>|</cite><a class="c_r" href="/ktv/">KTV</a><cite>|</cite><a href="/diting/">迪厅舞厅</a><cite>|</cite><a href="/jiuba/">酒吧</a><cite>|</cite><a href="/wangba/">网吧</a><cite>|</cite><a href="/youxiting/">游戏厅</a></p>
    <h2><a href="/lipinxianhua/">礼品/鲜花</a></h2>
    <p><a href="/lvzhipenzai/">绿植盆裁</a><cite>|</cite><a href="/xianhuasudi/">礼品</a><cite>|</cite><a href="/xianhua/">鲜花</a></p>  
    <h2><a href="/hunqing/">婚庆</a></h2>
 <p><a href="/xinnianggenzhuang/" class="c_r">彩妆造型</a><cite>|</cite><a href="/hunligenpai/">婚礼跟拍</a><cite>|</cite><a href="/hunqingzuche/">婚车租赁</a><cite>|</cite><a href="/hunqinggongsi/" class="c_r">婚庆公司</a><cite>|</cite><a href="/hunqingjiudian/">婚庆酒店</a><cite>|</cite><a href="/hunqingcehua/">婚庆策划</a><cite>|</cite>    <a href="/hunqingsiyi/">司仪督导</a><br /><a href="/lifu/">婚纱礼服</a><cite>|</cite><a href="/hunqingyongpin/">婚庆用品</a></p>
 <h2><a href="/weixiu/">电脑维修</a></h2>
    <p><a href="/fuwuqiweixiu/">服务器维修</a><cite>|</cite><a class="c_r" href="/bijibenweixiu/">笔记本维修</a><cite>|</cite><a href="/taishidiannao/">台式电脑</a><cite>|</cite><a href="/shujuhuifu/">数据恢复</a><cite>|</cite><a href="/yjxsqwx/">电脑显示器维修</a><br /><a href="/yingpanwx/">硬盘维修</a></p>
     <h2><a href="/songshui/">生活配送</a></h2>
    <p><a href="/paotui/">跑腿服务</a><cite>|</cite><a href="/songqi/">送气</a><cite>|</cite><a class="c_r" href="/sshui/">送水</a><cite>|</cite><a href="/shucai/">蔬菜配送</a><cite>|</cite><a href="/songmi/">送米</a><br />&nbsp;</p> 
    <h2><a href="/jiancai/">建材</a></h2>
    <p><a href="/jichujiancai/">钢材</a><cite>|</cite><a href="/menchuang/" class="c_r" >门窗</a><cite>|</cite><a href="/mucai/">木材板材</a><cite>|</cite><a href="/dengju/">照明灯具</a><cite>|</cite><a href="/diban/">地板</a><cite>|</cite><a href="/wujinlei/">五金电料</a><cite>|</cite><a href="/caigang/" class="c_r" >彩钢</a><cite>|</cite><a href="/tulyq/">涂料油漆</a><br /><a href="/cizdz/">瓷砖地砖</a><cite>|</cite><a href="/taoci/">卫浴洁具</a><cite>|</cite><a href="/chufchugui/">厨房洁具</a><cite>|</cite><a href="/youqiqzhi/">壁纸墙纸</a><cite>|</cite><a href="/qitajiancai/">水泥石材</a><cite>|</cite><a href="/bolijc/">玻璃</a><br />&nbsp;</p> 
    <h2><a href="/jianshen/">运动健身</a></h2>
    <p><a href="/yumaoqiuguan/">羽毛球</a><cite>|</cite><a href="/youyongguan/">游泳</a><cite>|</cite><a href="/qiuleicg/">球类场馆</a><cite>|</cite><a class="c_r" href="/jianshenwudao/">健身/舞蹈</a><cite>|</cite><a href="/yujia/">瑜伽馆</a><cite>|</cite><a href="/shebin/">舍宾</a><cite>|</cite><a href="/taiquandaoguan/">跆拳道馆</a><cite>|</cite><a href="/quanji/">拳击</a><br /><a href="/wushu/">武术</a></p>   

    
    
    
    <h2><a href="/jiajuweixiu/">家居维修</a></h2>
    <p><a href="/kaisuo/" class="c_r">开锁/换锁/修锁</a><cite>|</cite><a href="/menchweixiu/">门窗维修</a><cite>|</cite><a href="/jiasiweixiu/">家具维修</a><cite>|</cite><a href="/shafahuli/">沙发护理</a></p>    
    
    <h2><a href="/qtfuwu/">其他生活服务</a></h2>
    <p><a class="c_r" href="/ganxi/">干洗店</a><cite>|</cite><a href="/binzang/">殡葬</a></p>
    
      </div>--%>

    <div class="clear1"></div>
</div>

<div id="footer">
<div class="bg">
    <div id="contact">
        <%--北京市公安局朝阳分局备案编号:0000000000--%>
        <a href="http://www.miibeian.gov.cn/" style="margin-left:20px;">浙ICP备09071137号-4</a> <br />
        <div id="flink">
            ﻿﻿&nbsp; 
            <%--<a href="#" target="_blank">自动申请链接</a>.--%>
        </div>
        <div class="clear"></div>
    </div>
</div>

</div>

</asp:Content>
