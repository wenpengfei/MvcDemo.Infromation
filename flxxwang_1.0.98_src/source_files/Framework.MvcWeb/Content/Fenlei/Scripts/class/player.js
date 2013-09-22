// JavaScript Document
$(function () {
    var index = 0;
    $('<div id="flow"></div>').appendTo("#ajquery");
    //滑动导航改变内容	
    $("#ajquerynav li").click(function () {
        if (MyTime) {
            clearInterval(MyTime);
        }
        index = $("#ajquerynav li").index(this);
        MyTime = setTimeout(function () {
            ShowjQueryFlash(index);
            $('#ajquerycon').stop();
        }, 400);

    }, function () {
        clearInterval(MyTime);
        MyTime = setInterval(function () {
            ShowjQueryFlash(index);
            index++;
            if (index == 6) { index = 0; }
        }, 3000);
    });
    //滑入 停止动画，滑出开始动画.
    $('#ajquerycon').hover(function () {
        if (MyTime) {
            clearInterval(MyTime);
        }
    }, function () {
        MyTime = setInterval(function () {
            ShowjQueryFlash(index);
            index++;
            if (index == 6) { index = 0; }
        }, 3000);
    });
    //自动播放
    ShowjQueryFlash(index++);
    var MyTime = setInterval(function () {
        ShowjQueryFlash(index);
        index++;
        if (index == 6) { index = 0; }
    }, 3000);
});
function ShowjQueryFlash(i) {
    $("#ajquerycon div").eq(i).animate({ opacity: 1 }, 1000).css({ "display": "block" }).siblings().animate({ opacity: 0 }, 1000).css({ "display": "none" });
    $("#flow").animate({ left: i * 122 + 5 + "px" }, 300); //滑块滑动
    $("#ajquerynav li").eq(i).addClass("current").siblings().removeClass("current");
}