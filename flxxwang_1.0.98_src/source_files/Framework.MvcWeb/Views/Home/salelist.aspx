<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>杭州二手导航-<%=SiteInfo.Name%></title> 
<style type="text/css">body,dl,ol,ul,li,dt,dd,p,h2,h3,form{margin:0;padding:0;list-style:none}body{color:#333;font-family:Arial,"宋体";font-size:12px}a{cursor:pointer;color:#00C;text-decoration:none}a:hover{color:#FF0508;text-decoration:underline}img{border:none}.clear{clear:both;font-size:0;height:0;overflow:hidden}.bar_left .tuan,.bar_left .gap{display:none}/*header*/#headerinside,.wrap,#footer{background:#fff; width:990px;margin:0 auto; clear:both}#headerinside{height:75px; position:relative; z-index:666}#logo{position:absolute;left:15px;top:20px}#logo span{height:32px; border-left:1px solid #e6e6e6; margin-left:10px; padding-left:10px; display:inline-block; white-space:nowrap; position:absolute; top:7px; left:152px}#logo span b{font-size:24px; color:#4d4d4d; margin-top:8px; display:inline-block}#logo:hover,#logo a:hover{text-decoration:none}#searchbar{position:absolute;left:390px;top:26px; line-height:26px; overflow:hidden}#searchbar i{font-style:normal}#key,#keyword,#searchbtn,#fabu{background-image:url(/content/fenlei/assets/images/topbar.png) !important}#key{background:url() repeat-x 0 -320px; height:30px; padding:2px 0; display:inline-block; float:left}#keyword{background:url() no-repeat 0 -285px; width:303px;height:22px; line-height:22px; padding:4px 0; border:none; padding-left:38px; float:left; display:inline-block; overflow:hidden}.keyword{color:#ccc}.keyword2{color:#000}#searchbtn{background:url() no-repeat 0 -358px;width:123px;height:35px; font-size:16px; font-weight:bold; cursor:pointer; overflow:hidden; text-align:center; color:#fff; line-height:33px; line-height:32px\0; padding-bottom:4px;border:none; float:left}#searchbtn.btnal2{text-decoration:underline}#fabu{position:absolute;right:0;top:26px; background:url() no-repeat 0 -395px; width:118px; height:35px; line-height:35px; display:inline-block; font-size:14px; font-weight:bold; color:#000; text-align:center; float:left;cursor:pointer}.tooltip{width:324px; padding:8px;border:1px solid #dcdadc;background:#fff;margin-top:-4px;line-height:200%}.tooltip ul{width:100%; overflow:hidden}.tooltip li{height:26px;overflow:hidden;padding-left:5px}.tooltip li a{text-decoration:none;color:#666;font-size:13px}.tooltip li a b{color:#002cad}.tooltip li .tool_r{float:right;color:#008000;font-size:11px}.tooltip li.selected a b,.tooltip li.selected a,.tooltip li.selected .tool_r{color:#FFF8D8}.tooltip li.selected{background:#f97d03;cursor:pointer;color:#FFF8D8; padding-right:8px}.closewindow{float:right;margin:-5px 5px 0 0}#searchbar i{font-style:normal}/* footer  */#footer {font-size:12px;line-height:180%;padding:10px 0;text-align:center;border-top:1px solid #dbdbdb; color:#bebebe}.gray{color:#999}.lr{color: #f00;text-decoration: underline}.index_bo{width:990px; margin:10px auto; text-align:left; border-top:1px solid #dbdbdb; overflow:hidden}#clist{width:960px; margin:0 auto; padding:20px 0px 10px 20px; clear:both;overflow:hidden; line-height:28px; zoom:1}#clist dt{float:left; width:180px; white-space:nowrap;text-align:left; font-size: 14px;font-weight: bold;margin: 0px;padding: 0px; padding:0 15px 15px 0; overflow:hidden}#clist dd{float: left;width: 760px;margin-left: 0px;padding: 0px;padding-bottom: 15px;}#clist dt a{color:#000}#clist dd a{font-size: 13px; margin-right:15px; white-space:nowrap}</style>
<script type="text/javascript" src="/Content/Fenlei/Scripts/comm_js/boot_toplist_version.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
<div id="header">
    <div id="headerinside">
        <div id="logo">
            <a href="/" target="_self">
                <img src="/content/fenlei/assets/images/logo/logo.gif" alt="中文最大生活信息门户"/>
            </a>
            <span>
                <a href="/sale.shtml" target="_self"><b>跳蚤市场</b></a>
            </span>
        </div>
        <form onsubmit='b_query();return false;'>
            <div id="searchbar">
                <i id="key">
                    <input type="text" id="keyword" name="key" class="keyword" fdv="请输入类别名称或关键字" autocomplete="off" />
                </i>
                <input  type="submit" name="button" class="btnall" id="searchbtn" value="同城搜索" onmousemove="this.className='btnal2'" onmouseout="this.className=''" />
            </div>
        </form>
        <a href="http://post.flxxwang.com/79/5/s2" id="fabu">免费发布信息</a>
    </div>
</div>

<div class="index_bo">
	<dl id="clist">
        <dt><a href="/diannao/">杭州二手电脑/配件</a></dt>
        <dd><a href="/taishiji/">杭州台式机</a>
            <a href="/bijiben/">杭州笔记本</a>
            <a href="/diannaopeijian/">杭州硬件</a>
            <a href="/zhoubianshebei/">杭州外设产品</a>
            <a href="/fuwuqi/">杭州服务器</a>
            <a href="/pcqita/">杭州其他</a></dd>   
            
		<dt><a href="/shouji/">杭州二手手机</a></dt>
        <dd><a href="nuojiya/">杭州诺基亚</a>
            <a href="iphonesj/">杭州苹果</a>
            <a href="sanxing/">杭州三星</a>
            <a href="ailixin/">杭州索尼爱立信</a>
            <a href="htc/">杭州HTC/多普达</a>
            <a href="motuoluola/">杭州摩托罗拉</a>
            <a href="xiaolingtong/">杭州小灵通</a>
            <a href="shoujipeijian/">杭州手机配件</a>
            <a href="qitasj/">杭州其他手机品牌</a></dd>
        <dt><a href="/shoujihao/">杭州手机号码</a></dt>
        <dd><a href="quanqiutong/">杭州全球通</a>
            <a href="donggandidai/">杭州动感地带</a>
            <a href="shenzhouxing/">杭州神州行</a>
            <a href="ruyitong/">杭州联通</a>
            <a href="cdma/">杭州电信</a>
            <a href="tietong/">杭州铁通</a>
            <a href="xiaolingtonghaoma/">杭州小灵通</a></dd>

        <dt><a href="/shuma/">杭州数码产品</a></dt>
        <dd><a href="/shumaxiangji/">杭州数码相机</a>
            <a href="/shexiangji/">杭州数码摄像机</a>
            <a href="/mpsanmpsi/">杭州MP3/MP4</a>
            <a href="/koudaishuma">杭州口袋数码</a>
            <a href="/youxiji/">杭州游戏机</a>
            <a href="/smqita/">杭州其他数码产品</a></dd>

        <dt><a href="/bangong/">杭州办公用品/设备</a></dt>
        <dd><a href="/bangongshebei/">杭州办公设备</a>
            <a href="/diannaohaocai/">杭州办公耗材</a>
            <a href="/zhuomianwenju/">杭州桌面文具</a>
            <a href="/bangongjiaju/">杭州办公家具</a>
            <a href="/bgqita/">杭州其他</a></dd>

        <dt><a href="/jiadian/">杭州二手家电</a></dt>
        <dd><a href="/dianshiji/">杭州电视机</a>
            <a href="/xiyiji/">杭州洗衣机</a>
            <a href="/ershoukongtiao/">杭州空调</a>
            <a href="/bingxiang/">杭州冰箱/冰柜</a>
            <a href="/weibolu/">杭州微波炉</a>
            <a href="/yinshuiji/">杭州饮水机</a>
            <a href="/jiadianpeijian/">杭州家电配件</a>
            <a href="/diannuanqi/">杭州电暖气</a>
            <a href="/jdqita/">杭州其他家电</a></dd>
        
        <dt><a href="/ershoujiaju/">杭州二手家具/家居</a></dt>
        <dd><a href="/chuang/">杭州床/床垫</a>
            <a href="/guizi/">杭州柜子</a>
            <a href="/zhuolei/">杭州桌子</a>
            <a href="/zuoju/">杭州椅子/沙发</a>
            <a href="/chaji/">杭州茶几</a>
            <a href="/jujia/">杭州居家用品/家纺</a>
            <a href="/jiajuqita/">杭州其他家具家居</a></dd>
        
        <dt><a href="/yingyou/">杭州母婴/儿童用品</a></dt>
        <dd><a href="/yunfuyongpin/">杭州孕妇用品</a>
            <a href="/yingeryongpin/">杭州婴幼/儿童用品</a>
            <a href="/ertongyongpin/">杭州玩具</a>
            <a href="/yyqita/">杭州其他母婴用品</a></dd>
        
        <dt><a href="/fushi/">杭州服饰/鞋帽/箱包</a></dt>
        <dd><a href="/nanzhuang/">杭州服装</a>
            <a href="/fushipeijian/">杭州配饰</a>
            <a href="/xiangbao/">杭州箱包</a>
            <a href="/fsxiemao/">杭州鞋帽</a>
            <a href="/fsqita/">杭州其他</a></dd>
            
        <dt><a href="/meirong/">杭州美容保健</a></dt>
        <dd><a href="/meirongyongpin/">杭州美容</a>
            <a href="/hufu/">杭州护肤</a>
            <a href="/meirongmeiti/">杭州美体</a>
            <a href="/caizhuang/">杭州化妆</a>
            <a href="/fengxiong/">杭州保健品</a>
            <a href="/meifa/">杭州美发</a>
            <a href="/meijia/">杭州美甲</a>
            <a href="/xiangshuimr/">杭州香水</a>
            <a href="/mrqita/">杭州其他用品</a></dd>
                
        <dt><a href="/wenti/">杭州文体用品</a></dt>
        <dd><a href="/yundongfushi/">杭州户外用品</a>
            <a href="/jianshenqixie/">杭州健身器材</a>
            <a href="/huju/">杭州文教用品</a>
            <a href="/qiulei/">杭州球类用品</a>
            <a href="/yueqi/">杭州乐器</a>
            <a href="/yujiawt/">杭州瑜伽用品</a>
            <a href="/youyongwt/">杭州游泳用品</a>
            <a href="/diaoyuyongju/">杭州钓鱼用具</a>
            <a href="/qipai/">杭州各类棋牌</a>
            <a href="/qitawenti/">杭州其他文体用品</a></dd>
        
        <dt><a href="/tongxunyw/">杭州通讯业务</a></dt>
        <dd><a href="/chonzhika/">杭州充值卡</a>
            <a href="/shoujishangwangka/">杭州手机上网卡</a>
            <a href="/shoujiyewu/">杭州手机业务</a></dd>
        
        <dt><a href="/tushu/">杭州图书/音像/软件</a></dt>
        <dd><a href="/tushubook/">杭州书籍</a>
            <a href="/yingpandianshiju/">杭州影片/电视剧</a>
            <a href="/cddvd/">杭州音乐</a>
            <a href="/ruanjiants/">杭州软件</a>
            <a href="/qitayinxiang/">杭州其他音像物品</a></dd>
        
        <dt><a href="/yishu/">杭州艺术品/收藏品</a></dt>
        <dd><a href="/gudongguwan/">杭州古董古玩</a>
            <a href="/shufahuihua/">杭州书法绘画</a>
            <a href="/zhubaoshipin/">杭州珠宝玉器</a>
            <a href="/yuqi/">杭州纪念品</a>
            <a href="/mingxingwupin/">杭州工艺品</a>
            <a href="/ysqita/">杭州其他艺术品</a></dd>
 
        <dt><a href="/wangyou/">杭州网游/虚拟物品</a></dt>
        <dd><a href="/wangyoudianka/">杭州网游点卡</a>
            <a href="/zhuangbei/">杭州装备</a>
            <a href="/jinbi/">杭州金币</a>
            <a href="/zhanghao/">杭州帐号</a>
            <a href="/wyqita/">杭州网游其他</a></dd>
        
        <dt><a href="/ershoushebei/">杭州二手设备</a></dt>
        <dd><a href="/huagong/">杭州化工</a>
            <a href="/fangzhi/">杭州纺织</a>
            <a href="/fyinshua/">杭州印刷</a>
            <a href="/gongcheng/">杭州工程机械</a>
            <a href="/yanjinshebei/">杭州塑料</a>
            <a href="/kuangye/">杭州机床</a>
            <a href="/fadian/">杭州发电</a>
            <a href="/diandongji/">杭州仪器仪表</a>
            <a href="/mugongshebei/">杭州木工</a>
            <a href="/nongye/">杭州农业</a>
            <a href="/zaozhi/">杭州食品加工</a>
            <a href="/sssbqita/">杭州其他二手设备</a></dd>

        <dt><a href="/tiaozao/">杭州其他跳蚤</a></dt>
        <dd><a href="/weixing/">杭州通讯器材</a>
            <a href="/canjirenyongpin/">杭州特/残疾人用品</a>
            <a href="/lipin/">杭州闲置礼品</a>
            <a href="/qitatiaozao/">杭州杂七杂八</a></dd>
            
        <dt><a href="/huochepiao/">杭州火车票</a></dt>
        <dd><a href="/huochepiao/b1/">杭州硬座</a>
            <a href="/huochepiao/b2/">杭州软座</a>
            <a href="/huochepiao/b3/">杭州硬卧</a>
            <a href="/huochepiao/b4/">杭州软卧</a>
            <a href="/huochepiao/b5/">杭州站票</a>
            <a href="/huochepiao/a1/">杭州转让</a>
            <a href="/huochepiao/a2/">杭州求购</a></dd>
            
        <dt><a href="/piao/">杭州演出票</a></dt>
        <dd><a href="/yanchanghui/">杭州演唱会</a>
            <a href="/yinyuehui/">杭州音乐会</a>
            <a href="/geju/">杭州话剧歌剧</a>
            <a href="/shaoerjuchang/">杭州少儿剧场</a>
            <a href="/moshuzaji/">杭州魔术杂技</a>
            <a href="/wudaobalei/">杭州舞蹈芭蕾</a>
            <a href="/zongheyanchu/">杭州综合演出</a>
            <a href="/xiqu/">杭州戏曲</a></dd>
            
        <dt><a href="/youle/">杭州游乐园/景点</a></dt>
        <dd><a href="/hlg/">杭州欢乐谷</a>
            <a href="/slfxsly/">杭州水立方</a>
            <a href="/dongwuyuan/">杭州动物园</a>
            <a href="/shidu/">杭州十渡</a>
            <a href="/haiyangguan/">杭州海洋馆</a>
            <a href="/changcheng/">杭州八达岭长城</a>
            <a href="/zutuanyou/">杭州组团游</a>
            <a href="/sjxyly/">杭州石景山游乐园</a>
            <a href="/mrssj/">杭州摩锐水世界</a>
            <a href="/zhenrencs/">杭州真人CS</a>
            <a href="/wenquan/">杭州温泉</a>
            <a href="/qitayoule/">杭州其他</a></dd>
        
        <dt><a href="/kaquan/">杭州健身卡/优惠券</a></dt>
        <dd><a href="/jianshenka/">杭州健身卡</a>
            <a href="/youyongka/">杭州游泳卡</a>
            <a href="/gouwuka/">杭州购物卡</a>
            <a href="/canyinmeishi/">杭州餐饮美食券</a>
            <a href="/meirongmeifa/">杭州容美发券</a>
            <a href="/youhuika/">杭州优惠卡</a>
            <a href="/xiaofeika/">杭州代金券</a>
            <a href="/kqqita/">杭州其他优惠卡</a></dd>
            
        <dt><a href="/dog/">杭州宠物狗</a></dt>
        <dd><a href="/hashiqi/">杭州哈士奇</a>
            <a href="/zangao/">杭州藏獒</a>
            <a href="/ditaixiong/">杭州泰迪熊</a>
            <a href="/samoye/">杭州萨摩耶</a>
            <a href="/bixiong/">杭州比熊</a>
            <a href="/jianmao/">杭州金毛</a>
            <a href="/labuladuo/">杭州拉布拉多</a>
            <a href="/songshi/">杭州松狮</a>
            <a href="/jiwawa/">杭州吉娃娃</a>
            <a href="/bomei/">杭州博美犬</a>
            <a href="/xuenaruei/">杭州雪纳瑞</a>
            <a href="/dmuyangquan/">杭州德国牧羊犬</a>
            <a href="/guibinquan/">杭州贵宾</a>
            <a href="/alasijia/">杭州阿拉斯加</a>
            <a href="/hudiequan/">杭州蝴蝶犬</a>
            <a href="/gaojiasuoquan/">杭州高加索犬</a>
            <a href="/keka/">杭州可卡</a>
            <a href="/shapiquan/">杭州沙皮犬</a>
            <a href="/smuyangqua/">杭州苏格兰牧羊犬</a>
            <a href="/damaidingquan/">杭州大麦町犬</a>
            <a href="/shengbona/">杭州圣伯纳</a>
            <a href="/bage/">杭州巴哥</a>
            <a href="/luoweina/">杭州罗威纳</a>
            <a href="/xiledi/">杭州喜乐蒂</a>
            <a href="/xishiquan/">杭州西施犬</a>
            <a href="/dabaixiong/">杭州大白熊</a>
            <a href="/lachang/">杭州腊肠</a>
            <a href="/douniuquan/">杭州斗牛犬</a>
            <a href="/jingba/">杭州京巴</a>
            <a href="/xigaodi/">杭州西高地</a>
            <a href="/yuekexia/">杭州约克夏</a>
            <a href="/bigequan/">杭州比格犬</a>
            <a href="/yinhuquan/">杭州银狐犬</a>
            <a href="/kejiquan/">杭州柯基犬</a>
            <a href="/gumu/">杭州古牧</a>
            <a href="/bianjingmuyangquan/">杭州边境牧羊犬</a>
            <a href="/dubinquan/">杭州杜宾犬</a>
            <a href="/lingtiquan/">杭州灵提</a>
            <a href="/qitadog/">杭州其他品种</a></dd>
            
        <dt><a href="/cat/">杭州宠物猫</a></dt>
        <dd><a href="/jiafeimao/">杭州加菲猫</a>
            <a href="/bosimao/">杭州波斯猫</a>
            <a href="/zeermao/">杭州折耳猫</a>
            <a href="/duanmaomao/">杭州短毛猫</a>
            <a href="/qitamao/">杭州其他</a></dd>
            
        <dt><a href="/pet/">杭州花鸟鱼虫</a></dt>
        <dd><a href="/guanshangyu/">杭州观赏鱼</a>
            <a href="/wanshangniao/">杭州玩赏鸟</a>
            <a href="/qishipenjing/">杭州奇石盆景</a>
            <a href="/qitaxiaochong/">杭州其他小宠</a></dd>
 
         <dt><a href="/shipin/">杭州宠物用品/食品</a></dt>
        <dd><a href="/gouliang/">杭州狗粮</a>
            <a href="/gouyongpin/">杭州狗用品</a>
            <a href="/maoliang/">杭州猫粮</a>
            <a href="/maoyongpin/">杭州猫用品</a>
            <a href="/chongwuwanju/">杭州宠物玩具</a>
            <a href="/chongwufushi/">杭州宠物服饰</a>
            <a href="/qitayongpin/">杭州其他</a></dd>
        
        <dt><a href="/chongwu/">杭州宠物店/服务信息</a></dt>
        <dd><a href="/chongwuyiyuan/">杭州宠物医院</a>
            <a href="/chongwujiyang/">杭州宠物寄养</a>
            <a href="/chongwumeirong/">杭州宠物美容</a>
            <a href="/chongwusheying/">杭州宠物摄影</a>
            <a href="/chongwupeizhong/">杭州宠物配种</a>
            <a href="/chongwutuoyun/">杭州宠物托运</a>
            <a href="/qitacwfw/">杭州其他宠物服务</a></dd>
                
        <dt><a href="/danche/">杭州二手摩托车</a></dt>
        <dd><a href="/yamaha/">杭州雅马哈</a>
            <a href="/bentianmoto/">杭州本田</a>
            <a href="/jialing/">杭州嘉陵</a>
            <a href="/jlbtmoto/">杭州嘉陵本田</a>
            <a href="/jilimoto/">杭州吉利</a>
            <a href="/lingmumoto/">杭州铃木</a>
            <a href="/haojue/">杭州豪爵</a>
            <a href="/hjlmmoto/">杭州豪爵铃木</a>
            <a href="/qingqi/">杭州轻骑</a>
            <a href="/zongshen/">杭州宗申</a>
            <a href="/guangyang/">杭州光阳</a>
            <a href="/qianjiang/">杭州钱江</a>
            <a href="/lifan/">杭州力帆</a>
            <a href="/jianshe/">杭州建设</a>
            <a href="/jsymhmoto/">杭州建设雅马哈</a>
            <a href="/jincheng/">杭州金城</a>
            <a href="/jclmmoto/">杭州金城铃木</a>
            <a href="/qqlmmoto/">杭州轻骑铃木</a>
            <a href="/chunfeng/">杭州春风</a>
            <a href="/dayang/">杭州大阳</a>
            <a href="/halei/">杭州哈雷</a>
            <a href="/chuanqi/">杭州川崎</a>
            <a href="/xindazhou/">杭州新大洲</a>
            <a href="/xdzbtmoto/">杭州新大洲本田</a>
            <a href="/wybtmoto/">杭州五羊本田</a>
            <a href="/baomamoto/">杭州宝马</a>
            <a href="/biyaqiao/">杭州比亚乔</a>
            <a href="/apuliya/">杭州阿普利亚</a>
            <a href="/changling/">杭州长铃</a>
            <a href="/fengtianmoto/">杭州丰田</a>
            <a href="/huari/">杭州华日</a>
            <a href="/hecqmoto/">杭州黄河川崎</a>
            <a href="/qqmlmoto/">杭州轻骑木兰</a>
            <a href="/ershoumt/">杭州摩托车</a></dd>
            
        <dt><a href="/zixingche/">杭州自行车/电动车</a></dt>
        <dd><a href="/fzixingche/">杭州自行车</a>
            <a href="/diandongche/">杭州电动车</a>
            <a href="/sanlunche/">杭州三轮车</a>
            <a href="/peijianzhuangbei/">杭州配件/装备</a></dd>
        
        <dt><a href="/zuche/">杭州租车</a></dt>
        <dd><a href="/zuchehang/">杭州租车行 </a>
            <a href="/lvyouche/">杭州旅游租车</a>
            <a href="/shangwuzuche/">杭州商务租车</a>
            <a href="/sji/">杭州司机</a></dd>
        
        <dt><a href="/pinche/">杭州拼车/顺风车</a></dt>
        <dd><a href="/sxbpinche/">杭州上下班拼车</a>
            <a href="/changtupinche/">杭州长途拼车</a>
            <a href="/lvyoupinche/">杭州拼车自驾游</a></dd>
            
        <dt><a href="/huanwu/">杭州物品交换</a></dt>
        <dt><a href="/fuwujy/">杭州创意服务交易</a></dt>
        <dt><a href="/xiaoyuan/">杭州校园二手</a></dt>
        <dt><a href="/wuyuanwupin/">杭州5元物品</a></dt>
        <dt><a href="/ershoufree/">杭州免费赠送</a></dt>
        <dt><a href="/dianyingpiao/">杭州电影票</a></dt>
        <dt><a href="/qtpiaowu/">杭州其他票务</a></dt>
        <dt><a href="/cwzengsong/">杭州宠物赠送/领养</a></dt>
    </dl>
</div>
<div class="c"></div>

<div id="footer">
    &copy; flxxwang.com 
    <%--<a href="http://about.flxxwang.com/" title="有问题请与<%=SiteInfo.Name%>客服进行对话" id="askicon">联系客服</a>--%>
</div>

<script type="text/javascript">
    $(function () {
        $("a").attr("target", "_blank");
    });
</script>
</asp:Content>
