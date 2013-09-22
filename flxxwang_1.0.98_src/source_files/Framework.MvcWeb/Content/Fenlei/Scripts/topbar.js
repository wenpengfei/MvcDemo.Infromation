if (!$f) {
    $f = {};
}
//topbar
$info.topbar = {
    //init
    init: function () {
        $("#myfeet_tooltip").mouseover(function () {
            $(this).hide();
        });
        setTimeout(function () { $("#myfeet_tooltip").hide();}, 5000);

        $("#myfeet").mouseover(function () {
            if ($(this).attr("class").indexOf(' hover') == -1)
                $(this).addClass("hover")
        });

        $("#myfeet").mouseout(function () {
            $(this).removeClass("hover");
        });

        $("#minsearch").hover(
                function () { $(this).addClass("hover") },
                function () {
                    $(this).removeClass("hover");
                    $("#minsearchkeyword").blur()
                });

        $("#sitemap").mouseover(function () {
            $(this).addClass("hover")
        });

        $("#sitemap").mouseout(function () {
            $(this).attr("class", $("#myfeet").attr("class").replace(' hover', ''))
        });
    }
    //end init
};
//end topbar

$(function () {
    //alert($f.cookie.get("msgTips"));
    if ($f.cookie.get("msgTips")) {
        $("#myfeet_tooltip").hide();
    }
    else {
        $("#myfeet_tooltip").show();
        $f.cookie.set("msgTips", true, '', 0, "/");
    }
    $info.topbar.init();

});