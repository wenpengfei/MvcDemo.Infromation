$(document).ready(function () {
    InitInfoDate();
    InitExpeDate();
    InitEduDate();
    InitCertDate();
    InitExpeDate2();
    InitEduDate2();
    $("#spInfoYear .txtyear").val($("#hidYear").val()); //默认出生日期
    $("#spInfoMonth .txtmonth").val($("#hidMonth").val());
    InitLive(); //初始化居住地
    //    if (parseInt($("#hidresume").val()) == 0) {
    //        removeAllTemp(); //初始化清空缓存
    //    }
    $("#txtLiveCity").click(function () { $("#divLiveCity").show(); showFirstLive(""); $("#divLiveArea").hide(); $("#divLiveName").hide(); });
    $("#txtLiveArea").click(function () {
        if ($("#divLiveArea").html().trim() == "") {
            showSecondLive(1, '北京');
        }
        else {
            $("#divLiveArea").show();
            $("#divLiveCity").hide();
            $("#divLiveName").hide();
        } 
    });
    $("#txtLiveName").click(function () {
        if ($("#divLiveName").html().trim() == "") {
            //            if ($("#hidNowLive").attr("aid") == 0) {
            if ($("#hidNowLive").attr("aid") == 0 || $("#hidNowLive").attr("aid") == null) {//by lls
                alert("请选择区域");
            } else {
                showThiLive(parseInt($("#hidNowLive").attr("aid"),10),
                $("#hidNowLive").attr("aname"));
            }
        } else {
            $("#divLiveName").show();
            $("#divLiveCity").hide();
            $("#divLiveArea").hide();
        }
    });
});


function InitInfoDate() {
    pushDateSelect("spInfoYear", 3, "<a href=\"#\" style=\"display:none\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spInfoMonth");
    var year = $("#spInfoYear .txtyear"), yearlist = $("#spInfoYear .zp_datediv");
    var month = $("#spInfoMonth .txtmonth"), monthlist = $("#spInfoMonth .zp_datediv");
    year.focus(function () { yearlist.show(); monthlist.hide(); }).click(function () { return false; });
    yearlist.click(function () { return false; });
    $("#spInfoYear .zp_datediv_list>a").click(function () {
        year.val($(this).text());
        year.blur();
        yearlist.hide();
        month.focus();
    });
    var tb1 = $("#spInfoYear .zp_datediv_title a");
    $(tb1[0]).click(function () {
        var cu = $("#spInfoYear .zp_datediv_list.current");
        if (cu.prev().length) {
            cu.removeClass("current");
            cu.prev().addClass("current");

            $(tb1[1]).removeClass("next_none").addClass("next1");
            if (!cu.prev().prev().length) {
                $(tb1[0]).removeClass("pre").addClass("pre_none");
            } else {
                $(tb1[0]).removeClass("pre_none").addClass("pre");
            }
        }
    });
    $(tb1[1]).click(function () {
        var cu = $("#spInfoYear .zp_datediv_list.current");
        if (cu.next().length) {
            cu.removeClass("current");
            cu.next().addClass("current");

            $(tb1[0]).removeClass("pre_none").addClass("pre");
            if (!cu.next().next().length) {
                $(tb1[1]).removeClass("next1").addClass("next_none");
            } else {
                $(tb1[1]).removeClass("next_none").addClass("next1");
            }
        }
    });
    var btns1 = $("#spInfoYear .zp_datediv_bottom a");
    $(btns1[0]).click(function () {
    });
    $(btns1[1]).click(function () {
        year.val("");
    });
    $(btns1[2]).click(function () {
        yearlist.hide();
    });
    month.focus(function () {
        monthlist.show();
        yearlist.hide();
    }).click(function () { return false; });
    monthlist.click(function () { return false; });
    $("#spInfoMonth .zp_datediv_list>a").click(function () {
        month.val($(this).text());
        month.blur();
        monthlist.hide();
    });
    var btns2 = $("#spInfoMonth .zp_datediv_bottom a");
    $(btns2[0]).click(function () {
        month.val("");
    });
    $(btns2[1]).click(function () {
        monthlist.hide();
    });
    $(document).click(function () {
        yearlist.hide();
        monthlist.hide();
    });
};
function InitExpeDate() {
    pushDateSelect("spPosStatYear", 5, "<a href=\"#\" style=\"display:none\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spPosStatMonth");
    pushDateSelect("spPosEndYear", 5, "<a href=\"#\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spPosEndMonth");
    var startyear = $("#spPosStatYear .txtyear"), startyearlist = $("#spPosStatYear .zp_datediv");
    var startmonth = $("#spPosStatMonth .txtmonth"), startmonthlist = $("#spPosStatMonth .zp_datediv");
    var endyear = $("#spPosEndYear .txtyear"), endyearlist = $("#spPosEndYear .zp_datediv");
    var endmonth = $("#spPosEndMonth .txtmonth"), endmonthlist = $("#spPosEndMonth .zp_datediv");
    startyear.focus(function () { startyearlist.show(); startmonthlist.hide(); endyearlist.hide(); endmonthlist.hide(); }).click(function () { return false; });
    startyearlist.click(function () { return false; });
    $("#spPosStatYear .zp_datediv_list>a").click(function () {
        startyear.val($(this).text());
        startyear.blur();
        startyearlist.hide();
        startmonth.focus();
        clearInfoMsg($("#posDateInfo"));
    });
    var tb1 = $("#spPosStatYear .zp_datediv_title a");
    $(tb1[0]).click(function () {
        var cu = $("#spPosStatYear .zp_datediv_list.current");
        if (cu.prev().length) {
            cu.removeClass("current");
            cu.prev().addClass("current");
            $(tb1[1]).removeClass("next_none").addClass("next1");
            if (!cu.prev().prev().length) {
                $(tb1[0]).removeClass("pre").addClass("pre_none");
            } else {
                $(tb1[0]).removeClass("pre_none").addClass("pre");
            }
        }
    });
    $(tb1[1]).click(function () {
        var cu = $("#spPosStatYear .zp_datediv_list.current");
        if (cu.next().length) {
            cu.removeClass("current");
            cu.next().addClass("current");
            $(tb1[0]).removeClass("pre_none").addClass("pre");
            if (!cu.next().next().length) {
                $(tb1[1]).removeClass("next1").addClass("next_none");
            } else {
                $(tb1[1]).removeClass("next_none").addClass("next1");
            }
        }
    });
    var btns1 = $("#spPosStatYear .zp_datediv_bottom a");
    $(btns1[0]).click(function () {
    });
    $(btns1[1]).click(function () {
        startyear.val("");
    });
    $(btns1[2]).click(function () {
        startyearlist.hide();
    });
    startmonth.focus(function () {
        startmonthlist.show();
        startyearlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    }).click(function () { return false; });
    startmonthlist.click(function () { return false; });
    $("#spPosStatMonth .zp_datediv_list>a").click(function () {
        startmonth.val($(this).text());
        startmonth.blur();
        startmonthlist.hide();
        clearInfoMsg($("#posDateInfo"));
    });
    var btns2 = $("#spPosStatMonth .zp_datediv_bottom a");
    $(btns2[0]).click(function () {
        startmonth.val("");
    });
    $(btns2[1]).click(function () {
        startmonthlist.hide();
    });
    endyear.focus(function () { endyearlist.show(); endmonthlist.hide(); startyearlist.hide(); startmonthlist.hide(); }).click(function () { return false; });
    endyearlist.click(function () { return false; });
    $("#spPosEndYear .zp_datediv_list>a").click(function () {
        endyear.val($(this).text());
        endyear.blur();
        endyearlist.hide();
        $("#spEnd").show();
        endmonth.focus();
        clearInfoMsg($("#posDateInfo"));
    });
    var tb1 = $("#spPosEndYear .zp_datediv_title a");
    $(tb1[0]).click(function () {
        var cu = $("#spPosEndYear .zp_datediv_list.current");
        if (cu.prev().length) {
            cu.removeClass("current");
            cu.prev().addClass("current");
            $(tb1[1]).removeClass("next_none").addClass("next1");
            if (!cu.prev().prev().length) {
                $(tb1[0]).removeClass("pre").addClass("pre_none");
            } else {
                $(tb1[0]).removeClass("pre_none").addClass("pre");
            }
        }
    });
    $(tb1[1]).click(function () {
        var cu = $("#spPosEndYear .zp_datediv_list.current");
        if (cu.next().length) {
            cu.removeClass("current");
            cu.next().addClass("current");
            $(tb1[0]).removeClass("pre_none").addClass("pre");
            if (!cu.next().next().length) {
                $(tb1[1]).removeClass("next1").addClass("next_none");
            } else {
                $(tb1[1]).removeClass("next_none").addClass("next1");
            }
        }
    });
    var btns1 = $("#spPosEndYear .zp_datediv_bottom a");
    $(btns1[0]).click(function () {
        endyear.val("至今");
        $("#spEnd").hide();
        endyearlist.hide();
        endmonthlist.hide();
        clearInfoMsg($("#posDateInfo"));
    });
    $(btns1[1]).click(function () {
        endyear.val("");
    });
    $(btns1[2]).click(function () {
        endyearlist.hide();
    });
    endmonth.focus(function () {
        endmonthlist.show();
        endyearlist.hide();
        startyearlist.hide();
        startmonthlist.hide();
    }).click(function () { return false; });
    endmonthlist.click(function () { return false; });
    $("#spPosEndMonth .zp_datediv_list>a").click(function () {
        endmonth.val($(this).text());
        endmonth.blur();
        endmonthlist.hide();
        clearInfoMsg($("#posDateInfo"));
    });
    var btns2 = $("#spPosEndMonth .zp_datediv_bottom a");
    $(btns2[0]).click(function () {
        endmonth.val("");
    });
    $(btns2[1]).click(function () {
        endmonthlist.hide();
    });
    $(document).click(function () {
        startyearlist.hide();
        startmonthlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    });
};
function InitEduDate() {
    pushDateSelect("spEduStatYear", 5, "<a href=\"#\" style=\"display:none\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spEduStatMonth");
    pushDateSelect("spEduEndYear", 5, "<a href=\"#\" style=\"display:none\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spEduEndMonth");
    var startyear = $("#spEduStatYear .txtyear"), startyearlist = $("#spEduStatYear .zp_datediv");
    var startmonth = $("#spEduStatMonth .txtmonth"), startmonthlist = $("#spEduStatMonth .zp_datediv");
    var endyear = $("#spEduEndYear .txtyear"), endyearlist = $("#spEduEndYear .zp_datediv");
    var endmonth = $("#spEduEndMonth .txtmonth"), endmonthlist = $("#spEduEndMonth .zp_datediv");
    startyear.focus(function () { startyearlist.show(); startmonthlist.hide(); endyearlist.hide(); endmonthlist.hide(); }).click(function () { return false; });
    startyearlist.click(function () { return false; });
    $("#spEduStatYear .zp_datediv_list>a").click(function () {
        startyear.val($(this).text());
        startyear.blur();
        startyearlist.hide();
        startmonth.focus();
    });
    var tb1 = $("#spEduStatYear .zp_datediv_title a");
    $(tb1[0]).click(function () {
        var cu = $("#spEduStatYear .zp_datediv_list.current");
        if (cu.prev().length) {
            cu.removeClass("current");
            cu.prev().addClass("current");
            $(tb1[1]).removeClass("next_none").addClass("next1");
            if (!cu.prev().prev().length) {
                $(tb1[0]).removeClass("pre").addClass("pre_none");
            } else {
                $(tb1[0]).removeClass("pre_none").addClass("pre");
            }
        }
    });
    $(tb1[1]).click(function () {
        var cu = $("#spEduStatYear .zp_datediv_list.current");
        if (cu.next().length) {
            cu.removeClass("current");
            cu.next().addClass("current");
            $(tb1[0]).removeClass("pre_none").addClass("pre");
            if (!cu.next().next().length) {
                $(tb1[1]).removeClass("next1").addClass("next_none");
            } else {
                $(tb1[1]).removeClass("next_none").addClass("next1");
            }
        }
    });
    var btns1 = $("#spEduStatYear .zp_datediv_bottom a");
    $(btns1[0]).click(function () {
    });
    $(btns1[1]).click(function () {
        startyear.val("");
    });
    $(btns1[2]).click(function () {
        startyearlist.hide();
    });
    startmonth.focus(function () {
        startmonthlist.show();
        startyearlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    }).click(function () { return false; });
    startmonthlist.click(function () { return false; });
    $("#spEduStatMonth .zp_datediv_list>a").click(function () {
        startmonth.val($(this).text());
        startmonth.blur();
        startmonthlist.hide();
    });
    var btns2 = $("#spEduStatMonth .zp_datediv_bottom a");
    $(btns2[0]).click(function () {
        startmonth.val("");
    });
    $(btns2[1]).click(function () {
        startmonthlist.hide();
    });
    endyear.focus(function () { endyearlist.show(); endmonthlist.hide(); startyearlist.hide(); startmonthlist.hide(); }).click(function () { return false; });
    endyearlist.click(function () { return false; });
    $("#spEduEndYear .zp_datediv_list>a").click(function () {
        endyear.val($(this).text());
        endyear.blur();
        endyearlist.hide();
        endmonth.focus();
    });
    var tb1 = $("#spEduEndYear .zp_datediv_title a");
    $(tb1[0]).click(function () {
        var cu = $("#spEduEndYear .zp_datediv_list.current");
        if (cu.prev().length) {
            cu.removeClass("current");
            cu.prev().addClass("current");
            $(tb1[1]).removeClass("next_none").addClass("next1");
            if (!cu.prev().prev().length) {
                $(tb1[0]).removeClass("pre").addClass("pre_none");
            } else {
                $(tb1[0]).removeClass("pre_none").addClass("pre");
            }
        }
    });
    $(tb1[1]).click(function () {
        var cu = $("#spEduEndYear .zp_datediv_list.current");
        if (cu.next().length) {
            cu.removeClass("current");
            cu.next().addClass("current");
            $(tb1[0]).removeClass("pre_none").addClass("pre");
            if (!cu.next().next().length) {
                $(tb1[1]).removeClass("next1").addClass("next_none");
            } else {
                $(tb1[1]).removeClass("next_none").addClass("next1");
            }
        }
    });
    var btns1 = $("#spEduEndYear .zp_datediv_bottom a");
    $(btns1[0]).click(function () {
    });
    $(btns1[1]).click(function () {
        endyear.val("");
    });
    $(btns1[2]).click(function () {
        endyearlist.hide();
    });
    endmonth.focus(function () {
        endmonthlist.show();
        endyearlist.hide();
        startyearlist.hide();
        startmonthlist.hide();
    }).click(function () { return false; });
    endmonthlist.click(function () { return false; });
    $("#spEduEndMonth .zp_datediv_list>a").click(function () {
        endmonth.val($(this).text());
        endmonth.blur();
        endmonthlist.hide();
    });
    var btns2 = $("#spEduEndMonth .zp_datediv_bottom a");
    $(btns2[0]).click(function () {
        endmonth.val("");
    });
    $(btns2[1]).click(function () {
        endmonthlist.hide();
    });
    $(document).click(function () {
        startyearlist.hide();
        startmonthlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    });
};
function InitCertDate() {
    pushDateSelect("spIssueYear", 5, "<a href=\"#\" style=\"display:none\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spIssueMonth");
    var year = $("#spIssueYear .txtyear"), yearlist = $("#spIssueYear .zp_datediv");
    var month = $("#spIssueMonth .txtmonth"), monthlist = $("#spIssueMonth .zp_datediv");
    year.focus(function () { yearlist.show(); monthlist.hide(); }).click(function () { return false; });
    yearlist.click(function () { return false; });
    $("#spIssueYear .zp_datediv_list>a").click(function () {
        year.val($(this).text());
        year.blur();
        yearlist.hide();
        month.focus();
    });
    var tb1 = $("#spIssueYear .zp_datediv_title a");
    $(tb1[0]).click(function () {
        var cu = $("#spIssueYear .zp_datediv_list.current");
        if (cu.prev().length) {
            cu.removeClass("current");
            cu.prev().addClass("current");
            $(tb1[1]).removeClass("next_none").addClass("next1");
            if (!cu.prev().prev().length) {
                $(tb1[0]).removeClass("pre").addClass("pre_none");
            } else {
                $(tb1[0]).removeClass("pre_none").addClass("pre");
            }
        }
    });
    $(tb1[1]).click(function () {
        var cu = $("#spIssueYear .zp_datediv_list.current");
        if (cu.next().length) {
            cu.removeClass("current");
            cu.next().addClass("current");
            $(tb1[0]).removeClass("pre_none").addClass("pre");
            if (!cu.next().next().length) {
                $(tb1[1]).removeClass("next1").addClass("next_none");
            } else {
                $(tb1[1]).removeClass("next_none").addClass("next1");
            }
        }
    });
    var btns1 = $("#spIssueYear .zp_datediv_bottom a");
    $(btns1[0]).click(function () {
    });
    $(btns1[1]).click(function () {
        year.val("");
    });
    $(btns1[2]).click(function () {
        yearlist.hide();
    });
    month.focus(function () {
        monthlist.show();
        yearlist.hide();
    }).click(function () { return false; });
    monthlist.click(function () { return false; });
    $("#spIssueMonth .zp_datediv_list>a").click(function () {
        month.val($(this).text());
        month.blur();
        monthlist.hide();
    });
    var btns2 = $("#spIssueMonth .zp_datediv_bottom a");
    $(btns2[0]).click(function () {
        month.val("");
    });
    $(btns2[1]).click(function () {
        monthlist.hide();
    });
    $(document).click(function () {
        yearlist.hide();
        monthlist.hide();
    });
};
function pushDateSelect(pushspid, currentid, now) {
    var str = "<input class=\"txtyear\" type=\"text\" size=\"5\" readonly=\"readonly\" />";
    str += "<div class=\"zp_datediv year\">";
    str += "<div class=\"zp_datediv_title\"><a href=\"#\" title=\"更早的年份\" class=\"pre\"></a>请选择年份<a href=\"#\" title=\"更晚的年份\" class=\"next_none\"></a></div>";
    str += "<div class=\"zp_datediv_content\"><div class=\"zp_datediv_hidden\">";
    str += "<div class=\"zp_datediv_list" + (currentid == 1 ? " current" : "") + "\"><a href=\"#\">1952</a><a href=\"#\">1953</a><a href=\"#\">1954</a><a href=\"#\">1955</a><a href=\"#\">1956</a><a href=\"#\">1957</a><a href=\"#\">1958</a><a href=\"#\">1959</a><a href=\"#\">1960</a><a href=\"#\">1961</a><a href=\"#\">1962</a><a href=\"#\">1963</a></div>";
    str += "<div class=\"zp_datediv_list" + (currentid == 2 ? " current" : "") + "\"><a href=\"#\">1964</a><a href=\"#\">1965</a><a href=\"#\">1966</a><a href=\"#\">1967</a><a href=\"#\">1968</a><a href=\"#\">1969</a><a href=\"#\">1970</a><a href=\"#\">1971</a><a href=\"#\">1972</a><a href=\"#\">1973</a><a href=\"#\">1974</a><a href=\"#\">1975</a></div>";
    str += "<div class=\"zp_datediv_list" + (currentid == 3 ? " current" : "") + "\"><a href=\"#\">1976</a><a href=\"#\">1977</a><a href=\"#\">1978</a><a href=\"#\">1979</a><a href=\"#\">1980</a><a href=\"#\">1981</a><a href=\"#\">1982</a><a href=\"#\">1983</a><a href=\"#\">1984</a><a href=\"#\">1985</a><a href=\"#\">1986</a><a href=\"#\">1987</a></div>";
    str += "<div class=\"zp_datediv_list" + (currentid == 4 ? " current" : "") + "\"><a href=\"#\">1988</a><a href=\"#\">1989</a><a href=\"#\">1990</a><a href=\"#\">1991</a><a href=\"#\">1992</a><a href=\"#\">1993</a><a href=\"#\">1994</a><a href=\"#\">1995</a><a href=\"#\">1996</a><a href=\"#\">1997</a><a href=\"#\">1998</a><a href=\"#\">1999</a></div>";
    str += "<div class=\"zp_datediv_list" + (currentid == 5 ? " current" : "") + "\"><a href=\"#\">2000</a><a href=\"#\">2001</a><a href=\"#\">2002</a><a href=\"#\">2003</a><a href=\"#\">2004</a><a href=\"#\">2005</a><a href=\"#\">2006</a><a href=\"#\">2007</a><a href=\"#\">2008</a><a href=\"#\">2009</a><a href=\"#\">2010</a><a href=\"#\">2011</a></div>";
    str += "</div></div><div class=\"zp_datediv_bottom\">" + now + "<a href=\"#\">[清除]</a>　<a href=\"#\">[关闭]</a></div></div>";
    str += "<iframe id=\"DivShimY\" src=\"javascript:false;\" scrolling=\"no\" frameborder=\"0\" style=\"position:absolute; top:0px; left:0px; display:none;filter=progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);\"></iframe>";
    $("#" + pushspid).html(str);
}
function pushMonthSelect(pushspid) {
    var str = "<input class=\"txtmonth\" type=\"text\" size=\"2\" readonly=\"readonly\" />";
    str += "<div class=\"zp_datediv month\"><div class=\"zp_datediv_title\">请选择月份</div>";
    str += "<div class=\"zp_datediv_content\"><div class=\"zp_datediv_hidden\"><div class=\"zp_datediv_list current\">";
    str += "<a href=\"#\">1</a><a href=\"#\">2</a><a href=\"#\">3</a><a href=\"#\">4</a><a href=\"#\">5</a><a href=\"#\">6</a><a href=\"#\">7</a><a href=\"#\">8</a><a href=\"#\">9</a><a href=\"#\">10</a><a href=\"#\">11</a><a href=\"#\">12</a>";
    str += "</div></div></div><div class=\"zp_datediv_bottom\"><a href=\"#\">[清除]</a>　<a href=\"#\">[关闭]</a></div></div>";
    str += "<iframe id=\"DivShimM\" src=\"javascript:false;\" scrolling=\"no\" frameborder=\"0\" style=\"position:absolute; top:0px; left:0px; display:none;filter=progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);\"></iframe>";
    $("#" + pushspid).html(str);
};
function InitLive() {
        var str = $("#hidNowLive").val();
        if (str == "0") {
            $("#txtLiveCity").val("北京");
            $("#hidNowLive").attr("cid", "1").attr("cname", "北京").attr("aid", "0").attr("aname", "").attr("nid", "0").attr("nname", "").val("1");
            $("#txtLiveArea").val("区域"); $("#txtLiveArea").addClass("c99");
            $("#txtLiveName").val("商圈"); $("#txtLiveName").addClass("c99");
        } else if (str == "1") {
            if ($("#hidNowLive").attr("cid") == 0) {
                $("#txtLiveCity").val("北京");
                $("#hidNowLive").attr("cid", "1").attr("cname", "北京");
            }
            $("#txtLiveCity").val($("#hidNowLive").attr("cname"));
            $("#txtLiveArea").val("区域"); $("#txtLiveArea").addClass("c99");
            $("#txtLiveName").val("商圈"); $("#txtLiveName").addClass("c99");
        } else if (str == "2") {
            $("#txtLiveCity").val($("#hidNowLive").attr("cname"));
            $("#txtLiveArea").val($("#hidNowLive").attr("aname"));
            $("#txtLiveName").val("商圈"); $("#txtLiveName").addClass("c99");
            var cid = $("#hidNowLive").attr("cid");
        } else if (str == "3") {
            $("#txtLiveCity").val($("#hidNowLive").attr("cname"));
            $("#txtLiveArea").val($("#hidNowLive").attr("aname"));
            $("#txtLiveName").val($("#hidNowLive").attr("nname"));
            var cid = $("#hidNowLive").attr("cid");
            var aid = $("#hidNowLive").attr("aid");
        }
};
function showFirstLive(zm) {
    if (zm == "") {
        //var str = "<a href=\"javascript:hidLive('divLiveCity')\" class=\"close\">X</a><ul class=\"paixu\"><li class=\"select\">热门城市</li><li onclick=\"showFirstLive('a')\">A-C</li><li onclick=\"showFirstLive('d')\">D-G</li><li onclick=\"showFirstLive('h')\">H-J</li><li onclick=\"showFirstLive('k')\">K-N</li><li onclick=\"showFirstLive('p')\">P-T</li><li onclick=\"showFirstLive('w')\">W-Z</li></ul>";
        var str = "<a href=\"javascript:hidLive('divLiveCity')\" class=\"close\">X</a>";
        str += "<ul class=\"paixu\">";
        str += "<li class=\"select\">热门城市</li>";
        str += "<li onclick=\"showFirstLive('A-C')\">A-C</li>";
        str += "<li onclick=\"showFirstLive('D-G')\">D-G</li>";
        str += "<li onclick=\"showFirstLive('H-J')\">H-J</li>";
        str += "<li onclick=\"showFirstLive('K-N')\">K-N</li>";
        str += "<li onclick=\"showFirstLive('P-T')\">P-T</li>";
        str += "<li onclick=\"showFirstLive('W-Z')\">W-Z</li>"
        str += "</ul>";
        str += "<div class=\"clear\"></div><ul class=\"cities\"><li><a href=\"javascript:showSecondLive(1,'北京');\">北京</a></li><li><a href=\"javascript:showSecondLive(3,'上海');\">上海</a></li><li><a href=\"javascript:showSecondLive(2,'天津');\">天津</a></li><li><a href=\"javascript:showSecondLive(213,'广州');\">广州</a></li><li><a href=\"javascript:showSecondLive(73,'哈尔滨');\">哈尔滨</a></li><li><a href=\"javascript:showSecondLive(4,'深圳');\">深圳</a></li>";
        str += "<li><a href=\"javascript:showSecondLive(148,'青岛');\">青岛</a></li><li><a href=\"javascript:showSecondLive(164,'郑州');\">郑州</a></li><li><a href=\"javascript:showSecondLive(5,'石家庄');\">石家庄</a></li><li><a href=\"javascript:showSecondLive(182,'武汉');\">武汉</a></li><li><a href=\"javascript:showSecondLive(199,'长沙');\">长沙</a></li><li><a href=\"javascript:showSecondLive(90,'苏州');\">苏州</a></li><li><a href=\"javascript:showSecondLive(50,'沈阳');\">沈阳</a></li><li><a href=\"javascript:showSecondLive(86,'南京');\">南京</a></li><li><a href=\"javascript:showSecondLive(51,'大连');\">大连</a></li>";
        str += "<li><a href=\"javascript:showSecondLive(4,'重庆');\">重庆</a></li><li><a href=\"javascript:showSecondLive(248,'成都');\">成都</a></li><li><a href=\"javascript:showSecondLive(99,'杭州');\">杭州</a></li><li><a href=\"javascript:showSecondLive(147,'济南');\">济南</a></li><li><a href=\"javascript:showSecondLive(229,'东莞');\">东莞</a></li><li><a href=\"javascript:showSecondLive(320,'西安');\">西安</a></li><li><a href=\"javascript:showSecondLive(110,'合肥');\">合肥</a></li></ul>";
        str += "<div class=\"clear\"></div>";
        $("#divLiveCity").html(str);
//        if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#divLiveCity").height()); }
        changeIframeH();
    } else {

        //            //if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#divLiveCity").height()); }

//            changeIframeH();
        var start = zm.split("-")[0];
        var end = zm.split("-")[1];

        var cities = $f.area.GetCitiesRange(start, end);

        var str = "<a href=\"javascript:hidLive('divLiveCity')\" class=\"close\">X</a>";
        str+="<ul class=\"paixu\">";
        str += "<li onclick=\"showFirstLive('')\">热门城市</li>";
        if (start == "A") {
            str += "<li class=\"select\">A-C</li>";
        }
        else {
            str += "<li onclick=\"showFirstLive('A-C')\">A-C</li>";
        }
        if (start == "D") {
            str += "<li class=\"select\">D-G</li>";
        }
        else {
            str += "<li onclick=\"showFirstLive('D-G')\">D-G</li>";
        }
        if (start == "H") {
            str += "<li class=\"select\">H-J</li>";
        }
        else {
            str += "<li onclick=\"showFirstLive('H-J')\">H-J</li>";
        }
        if (start == "K") {
            str += "<li class=\"select\">K-N</li>";
        }
        else {
            str += "<li onclick=\"showFirstLive('K-N')\">K-N</li>";
        }
        if (start == "P") {
            str += "<li class=\"select\">P-T</li>";
        }
        else {
            str += "<li onclick=\"showFirstLive('P-T')\">P-T</li>";
        }
        if (start == "W") {
            str += "<li class=\"select\">W-Z</li>"
        }
        else {
            str += "<li onclick=\"showFirstLive('W-Z')\">W-Z</li>"
        }
        str += "</ul>";

        str += "<div class=\"clear\"></div><ul class=\"cities\">";
        for (var i = 0; i < cities.length; i++) {
            var city = cities[i];
            str += "<li><a href=\"javascript:showSecondLive(" + city.Id + ",'" + city.ShortName + "');\">" + city.ShortName + "</a></li>";
        }
        str += "</ul><div class=\"clear\"></div>";
        $("#divLiveCity").html(str);
                    changeIframeH();
    }
};
function showSecondLive(pid, pname) {
    var region = new $f.model("Framework.Common.Region");
    region._ignoreP = true;
    region._post("GetRegions", [pid], function (data) {
        $("#divLiveArea").show();
        $("#divLiveName").hide();
        $("#divLiveName").html("");

        var str = "<a href=\"javascript:hidLive('divLiveArea')\" class=\"close\">X</a><ul class=\"cities\">";

        for (var i = 0; i < data.length; i++) {
            var region = data[i];
            str += "<li><a href=\"javascript:showThiLive(" + region.Id + ",'" + region.Name + "');\">" + region.Name + "</a></li>";
        }

        str += "<li><a href=\"javascript:clearLiveValue(2);\" class=\"blacklink\">[不限]</a></li>";
        str += "</ul><div class=\"clear\"></div>";
        $("#divLiveArea").html(str);

        $("#divLiveCity").hide();
        $("#txtLiveCity").val(pname);
        $("#txtLiveArea").val("区域"); $("#txtLiveArea").addClass("c99");
        $("#txtLiveName").val("商圈"); $("#txtLiveName").addClass("c99");
        $("#hidNowLive").attr("cid", pid).attr("cname", pname).attr("aid", "0").attr("aname", "").attr("nid", "0").attr("nname", "").val("1");
        //if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#divLiveArea").height()); }
       
        changeIframeH();
    });
};
function showThiLive(pid, pname) {
    var circle = new $f.model("Framework.Common.Circle");
    circle._ignoreP = true;
    circle._post("GetCirclesByRegion", [pid], function (data) {
        if (data.length > 0) {
            $("#spLiveName").show();
            $("#divLiveName").show();
            var str = "<a href=\"javascript:hidLive('divLiveName')\" class=\"close\">X</a><ul class=\"cities\">";
            
            for(var i=0;i<data.length;i++)
            {

                str += "<li><a href=\"javascript:finishLive(" + data[i].Id + ",'" + data[i].Name + "');\">" + data[i].Name + "</a></li>";
            }
            str+="<li><a href=\"javascript:clearLiveValue(3);\" class=\"blacklink\">[不限]</a></li></ul><div class=\"clear\"></div>";
            $("#divLiveName").html(str);
        }
        $("#divLiveArea").hide();
        $("#txtLiveArea").val(pname); $("#txtLiveArea").removeClass("c99");
        $("#txtLiveName").val("商圈"); $("#txtLiveName").addClass("c99");
        $("#hidNowLive").attr("aid", pid).attr("aname", pname).attr("nid", "0").attr("nname", "").val("2");
        //if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#divLiveName").height()); }
        changeIframeH();
    });
};
function finishLive(id, name) {
    $("#divLiveName").hide();
    $("#txtLiveName").val(name); $("#txtLiveName").removeClass("c99");
    $("#hidNowLive").attr("nid", id).attr("nname", name).val("3");
//    if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom); }
    changeIframeH();
};
function hidLive(id) {
    $("#" + id).hide();
//    if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom); }
    changeIframeH();
};
function clearLiveValue(level) {
    if (level == 2) {
        $("#txtLiveArea").val("区域"); $("#txtLiveArea").addClass("c99");
        $("#divLiveArea").hide();
        $("#txtLiveName").val("商圈"); $("#txtLiveName").addClass("c99");
        $("#hidNowLive").attr("aid", "0").attr("aname", "").attr("nid", "0").attr("nname", "").val("1");
    } else if (level == 3) {
        $("#txtLiveName").val("商圈"); $("#txtLiveName").addClass("c99");
        $("#divLiveName").hide();
        $("#hidNowLive").attr("nid", "0").attr("nname", "").val("2");
    }
    //if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom); }
    changeIframeH();
};



function InitExpeDate2() {
    pushDateSelect("spPosStatYear2", 5, "<a href=\"#\" style=\"display:none\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spPosStatMonth2");
    pushDateSelect("spPosEndYear2", 5, "<a href=\"#\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spPosEndMonth2");
    var startyear = $("#spPosStatYear2 .txtyear"), startyearlist = $("#spPosStatYear2 .zp_datediv");
    var startmonth = $("#spPosStatMonth2 .txtmonth"), startmonthlist = $("#spPosStatMonth2 .zp_datediv");
    var endyear = $("#spPosEndYear2 .txtyear"), endyearlist = $("#spPosEndYear2 .zp_datediv");
    var endmonth = $("#spPosEndMonth2 .txtmonth"), endmonthlist = $("#spPosEndMonth2 .zp_datediv");
    startyear.focus(function () { startyearlist.show(); startmonthlist.hide(); endyearlist.hide(); endmonthlist.hide(); }).click(function () { return false; });
    startyearlist.click(function () { return false; });
    $("#spPosStatYear2 .zp_datediv_list>a").click(function () {
        startyear.val($(this).text());
        startyear.blur();
        startyearlist.hide();
        startmonth.focus();
        clearInfoMsg($("#posDateInfo2"));
    });
    var tb1 = $("#spPosStatYear2 .zp_datediv_title a");
    $(tb1[0]).click(function () {
        var cu = $("#spPosStatYear2 .zp_datediv_list.current");
        if (cu.prev().length) {
            cu.removeClass("current");
            cu.prev().addClass("current");
            $(tb1[1]).removeClass("next_none").addClass("next1");
            if (!cu.prev().prev().length) {
                $(tb1[0]).removeClass("pre").addClass("pre_none");
            } else {
                $(tb1[0]).removeClass("pre_none").addClass("pre");
            }
        }
    });
    $(tb1[1]).click(function () {
        var cu = $("#spPosStatYear2 .zp_datediv_list.current");
        if (cu.next().length) {
            cu.removeClass("current");
            cu.next().addClass("current");
            $(tb1[0]).removeClass("pre_none").addClass("pre");
            if (!cu.next().next().length) {
                $(tb1[1]).removeClass("next1").addClass("next_none");
            } else {
                $(tb1[1]).removeClass("next_none").addClass("next1");
            }
        }
    });
    var btns1 = $("#spPosStatYear2 .zp_datediv_bottom a");
    $(btns1[0]).click(function () {
    });
    $(btns1[1]).click(function () {
        startyear.val("");
    });
    $(btns1[2]).click(function () {
        startyearlist.hide();
    });
    startmonth.focus(function () {
        startmonthlist.show();
        startyearlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    }).click(function () { return false; });
    startmonthlist.click(function () { return false; });
    $("#spPosStatMonth2 .zp_datediv_list>a").click(function () {
        startmonth.val($(this).text());
        startmonth.blur();
        startmonthlist.hide();
        clearInfoMsg($("#posDateInfo2"));
    });
    var btns2 = $("#spPosStatMonth2 .zp_datediv_bottom a");
    $(btns2[0]).click(function () {
        startmonth.val("");
    });
    $(btns2[1]).click(function () {
        startmonthlist.hide();
    });
    endyear.focus(function () { endyearlist.show(); endmonthlist.hide(); startyearlist.hide(); startmonthlist.hide(); }).click(function () { return false; });
    endyearlist.click(function () { return false; });
    $("#spPosEndYear2 .zp_datediv_list>a").click(function () {
        endyear.val($(this).text());
        endyear.blur();
        endyearlist.hide();
        $("#spEnd2").show();
        endmonth.focus();
        clearInfoMsg($("#posDateInfo2"));
    });
    var tb1 = $("#spPosEndYear2 .zp_datediv_title a");
    $(tb1[0]).click(function () {
        var cu = $("#spPosEndYear2 .zp_datediv_list.current");
        if (cu.prev().length) {
            cu.removeClass("current");
            cu.prev().addClass("current");
            $(tb1[1]).removeClass("next_none").addClass("next1");
            if (!cu.prev().prev().length) {
                $(tb1[0]).removeClass("pre").addClass("pre_none");
            } else {
                $(tb1[0]).removeClass("pre_none").addClass("pre");
            }
        }
    });
    $(tb1[1]).click(function () {
        var cu = $("#spPosEndYear2 .zp_datediv_list.current");
        if (cu.next().length) {
            cu.removeClass("current");
            cu.next().addClass("current");
            $(tb1[0]).removeClass("pre_none").addClass("pre");
            if (!cu.next().next().length) {
                $(tb1[1]).removeClass("next1").addClass("next_none");
            } else {
                $(tb1[1]).removeClass("next_none").addClass("next1");
            }
        }
    });
    var btns1 = $("#spPosEndYear2 .zp_datediv_bottom a");
    $(btns1[0]).click(function () {
        endyear.val("至今");
        $("#spEnd2").hide();
        endyearlist.hide();
        endmonthlist.hide();
        clearInfoMsg($("#posDateInfo2"));
    });
    $(btns1[1]).click(function () {
        endyear.val("");
    });
    $(btns1[2]).click(function () {
        endyearlist.hide();
    });
    endmonth.focus(function () {
        endmonthlist.show();
        endyearlist.hide();
        startyearlist.hide();
        startmonthlist.hide();
    }).click(function () { return false; });
    endmonthlist.click(function () { return false; });
    $("#spPosEndMonth2 .zp_datediv_list>a").click(function () {
        endmonth.val($(this).text());
        endmonth.blur();
        endmonthlist.hide();
        clearInfoMsg($("#posDateInfo2"));
    });
    var btns2 = $("#spPosEndMonth2 .zp_datediv_bottom a");
    $(btns2[0]).click(function () {
        endmonth.val("");
    });
    $(btns2[1]).click(function () {
        endmonthlist.hide();
    });
    $(document).click(function () {
        startyearlist.hide();
        startmonthlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    });
};
function InitEduDate2() {
    pushDateSelect("spEduStatYear2", 5, "<a href=\"#\" style=\"display:none\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spEduStatMonth2");
    pushDateSelect("spEduEndYear2", 5, "<a href=\"#\" style=\"display:none\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spEduEndMonth2");
    var startyear = $("#spEduStatYear2 .txtyear"), startyearlist = $("#spEduStatYear2 .zp_datediv");
    var startmonth = $("#spEduStatMonth2 .txtmonth"), startmonthlist = $("#spEduStatMonth2 .zp_datediv");
    var endyear = $("#spEduEndYear2 .txtyear"), endyearlist = $("#spEduEndYear2 .zp_datediv");
    var endmonth = $("#spEduEndMonth2 .txtmonth"), endmonthlist = $("#spEduEndMonth2 .zp_datediv");
    startyear.focus(function () { startyearlist.show(); startmonthlist.hide(); endyearlist.hide(); endmonthlist.hide(); }).click(function () { return false; });
    startyearlist.click(function () { return false; });
    $("#spEduStatYear2 .zp_datediv_list>a").click(function () {
        startyear.val($(this).text());
        startyear.blur();
        startyearlist.hide();
        startmonth.focus();
    });
    var tb1 = $("#spEduStatYear2 .zp_datediv_title a");
    $(tb1[0]).click(function () {
        var cu = $("#spEduStatYear2 .zp_datediv_list.current");
        if (cu.prev().length) {
            cu.removeClass("current");
            cu.prev().addClass("current");
            $(tb1[1]).removeClass("next_none").addClass("next1");
            if (!cu.prev().prev().length) {
                $(tb1[0]).removeClass("pre").addClass("pre_none");
            } else {
                $(tb1[0]).removeClass("pre_none").addClass("pre");
            }
        }
    });
    $(tb1[1]).click(function () {
        var cu = $("#spEduStatYear2 .zp_datediv_list.current");
        if (cu.next().length) {
            cu.removeClass("current");
            cu.next().addClass("current");
            $(tb1[0]).removeClass("pre_none").addClass("pre");
            if (!cu.next().next().length) {
                $(tb1[1]).removeClass("next1").addClass("next_none");
            } else {
                $(tb1[1]).removeClass("next_none").addClass("next1");
            }
        }
    });
    var btns1 = $("#spEduStatYear2 .zp_datediv_bottom a");
    $(btns1[0]).click(function () {
    });
    $(btns1[1]).click(function () {
        startyear.val("");
    });
    $(btns1[2]).click(function () {
        startyearlist.hide();
    });
    startmonth.focus(function () {
        startmonthlist.show();
        startyearlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    }).click(function () { return false; });
    startmonthlist.click(function () { return false; });
    $("#spEduStatMonth2 .zp_datediv_list>a").click(function () {
        startmonth.val($(this).text());
        startmonth.blur();
        startmonthlist.hide();
    });
    var btns2 = $("#spEduStatMonth2 .zp_datediv_bottom a");
    $(btns2[0]).click(function () {
        startmonth.val("");
    });
    $(btns2[1]).click(function () {
        startmonthlist.hide();
    });
    endyear.focus(function () { endyearlist.show(); endmonthlist.hide(); startyearlist.hide(); startmonthlist.hide(); }).click(function () { return false; });
    endyearlist.click(function () { return false; });
    $("#spEduEndYear2 .zp_datediv_list>a").click(function () {
        endyear.val($(this).text());
        endyear.blur();
        endyearlist.hide();
        endmonth.focus();
    });
    var tb1 = $("#spEduEndYear2 .zp_datediv_title a");
    $(tb1[0]).click(function () {
        var cu = $("#spEduEndYear2 .zp_datediv_list.current");
        if (cu.prev().length) {
            cu.removeClass("current");
            cu.prev().addClass("current");
            $(tb1[1]).removeClass("next_none").addClass("next1");
            if (!cu.prev().prev().length) {
                $(tb1[0]).removeClass("pre").addClass("pre_none");
            } else {
                $(tb1[0]).removeClass("pre_none").addClass("pre");
            }
        }
    });
    $(tb1[1]).click(function () {
        var cu = $("#spEduEndYear2 .zp_datediv_list.current");
        if (cu.next().length) {
            cu.removeClass("current");
            cu.next().addClass("current");
            $(tb1[0]).removeClass("pre_none").addClass("pre");
            if (!cu.next().next().length) {
                $(tb1[1]).removeClass("next1").addClass("next_none");
            } else {
                $(tb1[1]).removeClass("next_none").addClass("next1");
            }
        }
    });
    var btns1 = $("#spEduEndYear2 .zp_datediv_bottom a");
    $(btns1[0]).click(function () {
    });
    $(btns1[1]).click(function () {
        endyear.val("");
    });
    $(btns1[2]).click(function () {
        endyearlist.hide();
    });
    endmonth.focus(function () {
        endmonthlist.show();
        endyearlist.hide();
        startyearlist.hide();
        startmonthlist.hide();
    }).click(function () { return false; });
    endmonthlist.click(function () { return false; });
    $("#spEduEndMonth2 .zp_datediv_list>a").click(function () {
        endmonth.val($(this).text());
        endmonth.blur();
        endmonthlist.hide();
    });
    var btns2 = $("#spEduEndMonth2 .zp_datediv_bottom a");
    $(btns2[0]).click(function () {
        endmonth.val("");
    });
    $(btns2[1]).click(function () {
        endmonthlist.hide();
    });
    $(document).click(function () {
        startyearlist.hide();
        startmonthlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    });
}