function canshow(visable, phone, email) {
    if (document.URL.indexOf("&f=1")) {
        var rowt = parent.document.getElementById("t_rowt");
        var rowb = parent.document.getElementById("t_rowb");
        var cphone = parent.document.getElementById("t_phone");
        var cemail = parent.document.getElementById("t_email");
        var checklink = parent.document.getElementById("checklink");
        if (rowt != null && rowb != null) {
            if (visable == 'inline') {
                rowb.style.display = "";
                rowt.style.display = "";
                checklink.style.display = "none";
                if (cphone != null) {
                    cphone.innerHTML = phone;
                }
                if (cemail != null) {
                    cemail.innerHTML = email;
                }
            }
        }
    }
}
function userdown(operate, resumeid, f) {
    var strUrl = "http://jianli.58.com/ajax/resumemsg/?operate=" + operate + "&rid=" + resumeid;
    if (f != "") { strUrl += "&f=" + f; }
    $.ajax({
        type: "POST",
        dataType: "html",
        url: strUrl,
        success: function(msg) {
            $("#divchak").html(msg);
            $(window.parent.document).find(".frame").height(137);
            $(window.parent.document).find(".contains").height(110);
            $(window.parent.document).find(".fe_window_iframe").height(110);
        }
    });
}
function zptdown(operate, resumeid, f) {
    var strUrl = "http://jianli.58.com/ajax/resumemsg/?operate=" + operate + "&rid=" + resumeid + "&selid=" + $("#favdirs").val();
    if (f != "") { strUrl += "&f=" + f; }
    $.ajax({
        type: "POST",
        dataType: "html",
        url: strUrl,
        success: function(msg) {
            $("#divchak").html(msg);
        }
    });
}
function changeIframeH(h) {
    if ($(window.parent.document).find(".fe_window_iframe") != null) {
        $('#gsInfo').height(h);
        $(window.parent.document).find(".fe_window_iframe").height(this.document.body.scrollHeight);
    }
}