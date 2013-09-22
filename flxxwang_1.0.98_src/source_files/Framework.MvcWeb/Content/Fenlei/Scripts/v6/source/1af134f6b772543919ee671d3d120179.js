//lls:该文件可以删除了.
//by lls
﻿(function(window,undefined){
    window.fe=function(selector,context){};
   
    //topinfomsg
    //fe.namespace("fe.system");
    fe.system={};
    fe.system.my={
        showgg:function(){
            var c=document.getElementById("topinfomsg");
            if(!c)return;
            var closestr='<span class="btn-q" onclick="document.getElementById(\'topinfomsg\').style.display=\'none\';">×</span>';
            var str='<strong></strong>58同城交友隆重推出，聊天、交友、分享照片并享受快乐吧！<a href="http://jiaoyou.58.com/" target="_blank">立即加入>></a>';
            if(str!=null&&str!=""){
                c.style.display="";c.innerHTML=str+closestr;c.style.display=''
            }
            else{
                c.style.display='none'
            }
        }
    };
    $(function()//by lls
    {
        fe.system.my.showgg();//by lls
    });
    //end topinfomsg

    //topbar
    fe.bs={};
    fe.bs.topbar={
        rendered:false,
        init:function(){
            if(this.rendered)return;
            this.rendered=true;
            var j=____json4fe,m=j.modules,c=j.catentry.length?j.catentry[j.catentry.length-1]:j.catentry,city=j.locallist.length?j.locallist[0]:j.locallist,l=j.locallist.length?j.locallist[j.locallist.length-1]:j.locallist;


            var tpl='<div class="w pos"> ';
            if(m=='home'||m=='list'||m=='final'||m=='post'){tpl+='<div class="bar_left">';
            if(m=='list'){tpl+='    <h2>{0}</h2> <span id="ipconfig">[<a href="http://www.58.com/{2}/changecity/" target="_self">切换城市</a>]</span><span class="gap">|</span>'
            }else
            {tpl+='    <h2>{0}</h2> <span id="ipconfig">[<a href="http://www.58.com/changecity.aspx" target="_self">切换城市</a>]</span><span class="gap">|</span>'
            }
            if(m=='home'||m=='list'||m=='final')tpl+='<span class="tuan"><a target="_blank" href="http://t.58.com/{1}/{3}">58团购</a><span id="tuanlist" class="c_999"></span></span>';tpl+='</div>'
            }else if(m=='my'){tpl+='<div class="bar_left">';tpl+='<a href="http://{1}.58.com/">58同城首页</a>';
            tpl+='<span class="gap">|</span><a href="http://t.58.com/">58团购</a>';
            if(true){tpl+='<span class="gap">|</span><a href="http://vip.58.com/" title="切换到VIP用户中心">切换到VIP用户中心</a>'
            }
            tpl+='</div>'}
            tpl+='<div class="bar_right">';
            if(m!='home'&&m!='my')
            tpl+='    <div id="modify"><a href="http://{1}.58.com/">58同城首页</a><span class="gap">|</span></div>';
            tpl+='    <div id="myfeet" class="haschild">浏览记录<span class="arrow"></span><div id="myfeetBox" class="hc"><ul id="feet_final"><li>数据加载中...</li></ul><i class="shadow"></i></div>';
            if(true){tpl+='<!---气泡---><div id="myfeet_tooltip" class="msgTips"><i class="msgTips_arrow"></i><div class="msgTips_con">您的浏览可以被记录啦！</div><i class="shadow"></i></div>'
            }
            tpl+='</div> ';
            if(m!='home')
            tpl+='    <div id="minsearch" class="haschild">搜索<span class="arrow"></span> <div id="minsearchBox" class="hc"> <input class="keyword" autocomplete="off" value="" id="minsearchkeyword" type="text"> <input id="minsearchsearchbtn" type="button" value="" > <i class="shadow"></i></div></div> ';
            tpl+='    <div id="login"><a href="#4">登录</a><span class="gap">|</span><a href="#5">注册</a></div>';
            tpl+='    <div id="sitemap" class="haschild">导航<span class="arrow"></span> <div id="sitemapBox" class="hc">';
            tpl+='    	<div class="maplist"> <a href="{5}house.shtml">房产</a>：<a href="{5}zufang/">租房</a> &nbsp; <a href="{5}ershoufang/">买房</a> &nbsp; <a href="{5}duanzu/">短租</a><br><a href="{5}sale.shtml">二手</a>：<a href="{5}diannao/">电脑</a> &nbsp; <a href="{5}shouji/">手机</a> &nbsp; <a href="{5}jiadian/">家电</a><br><a href="{5}job.shtml">招聘</a>：<a href="{5}yewu/">销售</a> &nbsp; <a href="{5}kefu/">客服</a> &nbsp; <a href="{5}zpshengchankaifa/">普工</a><br><a href="{5}car.shtml">车辆</a>：<a href="{5}ershouche/">汽车</a> &nbsp; <a href="{5}zuche/">租车</a> &nbsp; <a href="{5}pinche/">拼车</a><br><a href="{5}searchjob.shtml">求职</a> &nbsp; <a href="{5}jianzhi.shtml">兼职</a> &nbsp; <a href="{5}huangye/">黄页</a> &nbsp; <a href="/jiaoyu.shtml">培训</a><br><a href="{5}piaowu.shtml">票务</a> &nbsp; <a href="{5}lvyouxiuxian.shtml">旅游</a> &nbsp; <a href="{5}pets.shtml">宠物</a> &nbsp; <a href="{5}jiaoyou.shtml">交友</a>  </div>';tpl+='		<div class="mapfuc"> ';
            tpl+='<a href="http://t.58.com/{1}/{3}" class="c_r">同城团购&nbsp;&nbsp;&nbsp;每日一团»</a> <br>';
            tpl+='<a href="http://post.58.com/{4}/">免费发布</a> &nbsp; ';
            tpl+='<a href="http://about.58.com/info/del-menu.html">删除信息</a><br>';
            tpl+='<a href="http://about.58.com/yinsibaohu.html?utm_source=top-navigation&utm_medium=58call&utm_campaign=link-click">58隐私保护助手</a><br>';
            tpl+='<a href="http://wap.58.com/wap.html">手机畅游58同城</a> <br>';
            tpl+='<a href="http://vip.58.com/product/index.html">58同城网邻通</a> <br>';
            tpl+='<a class="fduihua" href="http://about.58.com/">帮助中心</a></div>';
            tpl+='	<i class="shadow"></i></div></div>';

            $("#topbar").html(tpl);//by lls

            if(true){//by lls
                $("#myfeet_tooltip").mouseover(function () {
                        $(this).css("display","none");
                        });
                setTimeout(function(){$("#myfeet_tooltip").css("display","none");},5000)
            }

    //        var loadedmyfeet=false;
            $("#myfeet").mouseover(function () {
               if($(this).attr("class").indexOf(' hover')==-1)
                      $(this).addClass("hover")
    //            if(!loadedmyfeet){
    //                loadedmyfeet=true;
    //            }
            });

             $("#myfeet").mouseout(function () {
                $(this).removeClass("hover");
            });
            if(true){//by lls
                $("#minsearch").hover(
                    function(){$(this).addClass("hover")},
                    function(){$(this).removeClass("hover");$("#minsearchkeyword").blur()}
                    );
            }
            $("#sitemap").mouseover(function () {
                $(this).addClass("hover")
            });

            $("#sitemap").mouseout(function () {
                $(this).attr("class",$("#myfeet").attr("class").replace(' hover',''))
            });

    }};

    $(function()//by lls
    {
        if(!fe.bs.topbar.rendered){
                fe.bs.topbar.init();
            }
    });
    //end topbar
﻿})(window);﻿