
$info = {
    rootUrl: "/",
    gettag: function (a, b, c) {
        var obj = $("#" + a);
        var tr = $("#" + b);
        //var ul = $("#" + c);
        tr.css("display", "none");
        if (obj.val() != "") {
            $(':checkbox[name="Tag"]').attr('checked', false);
            var lis = $("#" + b + " li");
            lis.css('display', "none");
            for (var i = 0; i < lis.length; i++) {
                if ($(lis[i].children(0)).attr("t") == obj.val()) {
                    tr.css("display", "");
                    $(lis[i]).css('display', "");
                }
            }
        }
    }
}



//citycode
$(function () {
    if (typeof(__jsoninfo)!='undefined'&&__jsoninfo.city != null && __jsoninfo.city != '') {
        $f.cookie.set("city", __jsoninfo.city, '', 0, "/");
    }
});

//feet
$(function () {
    try {
        var feetInfo = eval($f.cookie.get("feetInfo"));
        if (feetInfo != null) {
            for (var i = 0; i < feetInfo.length; i++) {
                $("#feet_info").append("<li><a href='" + feetInfo[i].href + "' target='_blank'>" + feetInfo[i].innerText + "</a></li>");
            }
        }
        $("a").click(function () {
            if (feetInfo == null) {
                feetInfo = [];
            }
            var existFeetInfo = false;
            for (var i = 0; i < feetInfo.length; i++) {
                if (feetInfo[i].href == $(this)[0].href) {
                    existFeetInfo = true;
                    break;
                }
            }
            if (!existFeetInfo) {
                if ($(this)[0].href.indexOf("javascript:") != -1) {
                    return;
                }
                feetInfo.push({ href: $(this)[0].href, innerText: $(this).text() });
                if (feetInfo.length > 10) {
                    feetInfo.shift();
                }
                $("#feet_info").html("");
                for (var i = 0; i < feetInfo.length; i++) {
                    $("#feet_info").append("<li><a href='" + feetInfo[i].href + "' target='_blank'>" + feetInfo[i].innerText + "</a></li>");
                }
                $f.cookie.set("feetInfo", $f.toJson(feetInfo), "", 0, "/");
            }
        });
    }
    catch (e) { }
});

$(function () {
    $("a").click(function () {
        var text = $(this)[0].innerHTML;
        if (text) {
            text = text.toLowerCase().trim();
//            if (text.substr(0, 7) == "<script" || text.substr(0, 4) == '<img') {
            if (text.substr(0, 1) == "<") {
                text = undefined;
            }
        }
        else {
            text = undefined;
        }
        $.post("/stat/AddClickTotal", { _url: $(this).attr('href'), _text: text });
    });
});