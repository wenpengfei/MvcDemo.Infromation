String.prototype.isInArray = function(arr) {
    for (var i = 0; i < arr.length; i++) {
        if (this == arr[i]) return true;
    }
    return false;
}
var UrlUtility = {
    DecordKey: function(v) {
        if (v && v != '') {
            return unescape(decodeURI(v));
        }
        return v;
    },
    EncordKey: function(v) {
        if (v && v != '') {
            return encodeURI(escape(v));
        }
        return v;
    },
    AddPara: function(url, name, value) {
        if (url.toString().indexOf('?') >= 0) {
            var re = new RegExp("([&?])" + name + "=([^&?]*)", "ig");
            return ((re.test(url)) ? (url.replace(re, RegExp.$1 + name + '=' + value)) : url + '&' + name + '=' + value);
        }
        else {
            return url + '?' + name + '=' + value;
        }
    },
    AddKeyPara: function(url, value, key) {
        if (!(key && key != '')) {
            key = 'key';
        }
        if (value && value != '') {
            value = UrlUtility.EncordKey(value);
            return UrlUtility.AddPara(url, key, value);
        }
        else {
            return UrlUtility.DelPara(url, key);
        }
    },
    GetKeyPara: function(url, key) {
        return UrlUtility.DecordKey(UrlUtility.GetParaValue(url, key));
    },
    DelPara: function(url, name) {
        var re = new RegExp("([&?])" + name + "=([^&?]*)(&|$)", "ig");
        if (re.test(url)) {
            url = url.replace(re, RegExp.$1);
            if (url.indexOf('?') == url.length - 1 || url.charAt(url.length - 1) == '&') {
                url = url.substring(0, url.length - 1);
            }
        }
        return url;
    },
    GetParaValue: function(url, name) {
        var re = new RegExp("[&?]" + name + "=([^&?]*)", "ig");
        return ((url.match(re)) ? (url.match(re)[0].substr(name.length + 2)) : '');
    }
};
function PopWindowInit(obj) {
    $(obj).parent().mouseover(function() {
        var list = $('.selectlist');
        list.hide();
        list.prev().removeClass("active");
        list.parent().removeClass("activeborder");
        $(obj).next().show();
        $(obj).addClass("active");
        $(obj).parent().addClass("activeborder");
    });
    $(obj).parent().mouseout(function(e) {
        $(obj).next().hide();
        $(obj).removeClass("active");
        $(obj).parent().removeClass("activeborder");
    });
}
function PopWindowClear(obj, v) {
    $(obj).parent().prev().prev().val(v);
    $(obj).parent().prev().html($(obj).html());
    $(obj).parent().hide();
    $(obj).parent().prev().removeClass("active");
    $(obj).parent().parent().removeClass("activeborder");
}
//function setConditionVal(obj, val) {
//    PopWindowClear(obj, val);
//    if ($(obj).html() == '公司名称') { $("#txtSearch").val('请输入公司名称'); }
//    if ($(obj).html() == '简历姓名') { $("#txtSearch").val('请输入人名'); }
//}
//function InitSelCondition(type) {
//    var sel = $("#condition_pop");
//    $("#condition_pop").hide();
//    sel.html('');
//    if (type == 0||type==1||type==2) {
//        $("#condition").html(type == 2 ? '目前职位' : '求职位');
//        sel.append("<a href='javascript:void(0)' onclick='setConditionVal(this,1)'>求职位</a>");
//        sel.append("<a href='javascript:void(0)' onclick='setConditionVal(this,2)'>目前职位</a>");
//    } else {
//        $("#condition").html(type == 3 ? '公司名称' : '简历姓名');
//        sel.append("<a href='javascript:void(0)' onclick='setConditionVal(this,3)'>公司名称</a>");
//        sel.append("<a href='javascript:void(0)' onclick='setConditionVal(this,4)'>简历姓名</a>");
//    }
//}
function InitSelect(ids) {
    for (var i = 0; i < ids.length; i++) {
        var v = UrlUtility.GetParaValue(window.location.href, ids[i]);
        if (v && v != '' && parseInt(v) > 0) {
            var obj = $('#' + ids[i]);
            obj.prev().val(v);
            obj.html(obj.next().find('a').get(parseInt(v)).innerHTML);
        }
    }
}
function removecondition(para) {
    window.location.href = UrlUtility.DelPara(window.location.href, para);
}
function changearea(area) {
    $("#spanLiveCity").attr("sid", area);
    Search();
}
function InitSearch(t) {
    cunnCity();
    $("#complexcondition").click(function() {
        $("#simplecondition").show();
        $(this).hide();
        $("#complex").hide();
    });
    $("#simplecondition").click(function() {
        $("#complexcondition").show();
        $(this).hide();
        $("#complex").show();
    });
    if (UrlUtility.GetParaValue(window.location.href, 'complex') == '1') {
        $("#complexcondition").show();
        $("#complex").show();
        $("#simplecondition").hide();
    }
    if (UrlUtility.GetParaValue(window.location.href, 'eduabove') != '1') {
        $("#eduabove")[0].checked = false;
    }
    if (UrlUtility.GetParaValue(window.location.href, 'expabove') != '1') {
        $("#expabove")[0].checked = false;
    }
    InitSelect(['sex', 'age', 'edu', 'exp', 'addtime']);
    $("#addcollect").click(function() {
        var ctrl = (navigator.userAgent.toLowerCase()).indexOf('mac') != -1 ? 'Command/Cmd' : 'CTRL';
        if (document.all) {
            window.external.addFavorite('http://www.flxxwang.com/jianli', '分类信息网简历库')
        } else if (window.sidebar) {
            window.sidebar.addPanel('58同城简历库', 'http://jianli.58.com/', "")
        } else {
            alert('您可以尝试通过快捷键' + ctrl + ' + D 加入到收藏夹~')
        }
    });
    PopWindowInit($("#condition"));
    PopWindowInit($("#sex"));
    PopWindowInit($("#age"));
    PopWindowInit($("#edu"));
    PopWindowInit($("#exp"));
    PopWindowInit($("#addtime"));
    $("#txtSearch").val("请输入职位名称或公司名称").addClass("c_ccc");
//    $("#li1").click(function() {
//        $(this).siblings().removeClass("selected");
//        $(this).addClass("selected");
//        if ($("#txtSearch").val().isInArray(['', '请输入公司名称','请输入人名'])) {
//            $("#txtSearch").val("请输入职位名称").addClass("c_ccc");
//        }
//        InitSelCondition(1);
//        $("#hidcondition").val('1');
//    });
//    $("#li2").click(function() {
//        $(this).siblings().removeClass("selected");
//        $(this).addClass("selected");
//        if ($("#txtSearch").val().isInArray(['', '请输入职位名称'])) {
//            $("#txtSearch").val("请输入公司名称").addClass("c_ccc");
//        }
//        InitSelCondition(3);
//        $("#hidcondition").val('3');
//    });
    $("#txtSearch").focus(function() {
        if ($(this).val().isInArray(['请输入职位名称或公司名称'])) {
            $(this).val("");
            $(this).removeClass("c_ccc");
        }
    });
    $("#txtSearch").blur(function() {
        if ($(this).val() == '') {
            $(this)[0].className = 'c_ccc';
            $(this).val("请输入职位名称或公司名称");
//            switch ($("#hidcondition").val()) {
//                case '1':
//                case '2':
//                    $(this).val("请输入职位名称");
//                    break;
//                case '3':
//                    $(this).val("请输入公司名称");
//                    break;
//                case '4':
//                    $(this).val("请输入人名");
//                    break;
//            }
        }
    });
    $("#txtSearch").keydown(function(event) {
        if (event.keyCode == 13) {
            event.cancelBubble = true;
            event.returnValue = false;
            Search();
        }
    });
    $("#spanLiveCity").click(function() { $("#divLiveCity").show(); showFirstLive(""); $("#spanLiveCity").addClass("active"); });
    $("div.resume_hot ul li a").click(function() {
        var url = "http://www.flxxwang.com/jianli/" + $("#spanLiveCity").attr("sid") + "/t1/";
        var txtSearch = $.trim($(this).html());
        url = UrlUtility.AddPara(url, 'key', encodeURIComponent(txtSearch));
        window.location.href = url;
    });
    //if (t && t != '' && parseInt(t) > 0) { $('#hidcondition').val(t);  if (t > 2) { $('#li1').removeClass('selected'); $('#li2').addClass('selected'); } InitSelCondition(parseInt(t)); } else { InitSelCondition($('#li1').hasClass('selected') ? 1 : 3); }
    
    var key = UrlUtility.GetParaValue(window.location.href, 'key');
    if (key && key != '') { $('#txtSearch').val(decodeURIComponent(key)); $('#txtSearch').removeClass('c_ccc'); }
}
function addsearchpara(url, para, except) {
    var val = $('#hid' + para).val();
    if (except && val == except || !except && val == '-1') { return UrlUtility.DelPara(url, para); } else { return UrlUtility.AddPara(url, para, val); }
}
function Search(cate) {
    var str = $("#txtSearch").val();
    var url = "";
    if (str.isInArray(['', '请输入职位名称或公司名称'])) {
        window.location.href = window.location.href;
    } else {
        str = $.trim(str);
        url = "http://jianli.58.com/" + $("#spanLiveCity").attr("sid") + "/t1/"; //t + $("#hidcondition").val()
        if ($("#simplecondition").css('display') == 'none') {
            url = addsearchpara(url, 'sex');
            url = addsearchpara(url, 'age');
            url = addsearchpara(url, 'edu');
            url = addsearchpara(url, 'exp');
            url = addsearchpara(url, 'addtime');
            url = UrlUtility.AddPara(url, 'eduabove', $("#eduabove")[0].checked ? '1' : '0');
            url = UrlUtility.AddPara(url, 'expabove', $("#expabove")[0].checked ? '1' : '0');
            url = UrlUtility.AddPara(url, 'complex', '1');
        } else {
            url = UrlUtility.DelPara(url, 'sex');
            url = UrlUtility.DelPara(url, 'age');
            url = UrlUtility.DelPara(url, 'edu');
            url = UrlUtility.DelPara(url, 'exp');
            url = UrlUtility.DelPara(url, 'addtime');
            url = UrlUtility.DelPara(url, 'eduabove');
            url = UrlUtility.DelPara(url, 'expabove');
            url = UrlUtility.AddPara(url, 'complex', '0');
        }
        if (cate) {
            url = UrlUtility.AddPara(url, 'dispcate', cate);
        } else {
            url = UrlUtility.DelPara(url, 'dispcate');
        }
        url = UrlUtility.AddPara(url, 'key', encodeURIComponent(str));
    }
    window.location.href = url;
}
function showFirstLive(zm) {
    if (zm == "") {
        var str = "<a href=\"javascript:hidLive('divLiveCity')\" class=\"close\">X</a><ul class=\"paixu\"><li class=\"select\">热门城市</li><li onclick=\"showFirstLive('a')\">A-C</li><li onclick=\"showFirstLive('d')\">D-G</li><li onclick=\"showFirstLive('h')\">H-J</li><li onclick=\"showFirstLive('k')\">K-N</li><li onclick=\"showFirstLive('p')\">P-T</li><li onclick=\"showFirstLive('w')\">W-Z</li></ul>";
        str += "<div class=\"clear\"></div><ul class=\"cities\"><li><a href=\"javascript:setSelectLive(1,'北京','bj');\">北京</a></li><li><a href=\"javascript:setSelectLive(2,'上海','sh');\">上海</a></li><li><a href=\"javascript:setSelectLive(18,'天津','tj');\">天津</a></li><li><a href=\"javascript:setSelectLive(3,'广州','gz');\">广州</a></li><li><a href=\"javascript:setSelectLive(202,'哈尔滨','hrb');\">哈尔滨</a></li><li><a href=\"javascript:setSelectLive(4,'深圳','sz');\">深圳</a></li>";
        str += "<li><a href=\"javascript:setSelectLive(122,'青岛','qd');\">青岛</a></li><li><a href=\"javascript:setSelectLive(342,'郑州','zz');\">郑州</a></li><li><a href=\"javascript:setSelectLive(241,'石家庄','sjz');\">石家庄</a></li><li><a href=\"javascript:setSelectLive(158,'武汉','wh');\">武汉</a></li><li><a href=\"javascript:setSelectLive(414,'长沙','cs');\">长沙</a></li><li><a href=\"javascript:setSelectLive(5,'苏州','su');\">苏州</a></li><li><a href=\"javascript:setSelectLive(188,'沈阳','sy');\">沈阳</a></li><li><a href=\"javascript:setSelectLive(172,'南京','nj');\">南京</a></li><li><a href=\"javascript:setSelectLive(147,'大连','dl');\">大连</a></li>";
        str += "<li><a href=\"javascript:setSelectLive(37,'重庆','cq');\">重庆</a></li><li><a href=\"javascript:setSelectLive(102,'成都','cd');\">成都</a></li><li><a href=\"javascript:setSelectLive(79,'杭州','hz');\">杭州</a></li><li><a href=\"javascript:setSelectLive(265,'济南','jn');\">济南</a></li><li><a href=\"javascript:setSelectLive(413,'东莞','dg');\">东莞</a></li><li><a href=\"javascript:setSelectLive(483,'西安','xa');\">西安</a></li><li><a href=\"javascript:setSelectLive(837,'合肥','hf');\">合肥</a></li></ul>";
        str += "<div class=\"clear\"></div>";
        $("#divLiveCity").html(str);
    } else {
        $.post("http://jianli.58.com/ajax/getareainfo/", { operate: 'getcitybyzm', zm: zm, fromurl: 'search' }, function(data) {
            $("#divLiveCity").html(data);
        });
    }
}
function hidLive(id) {
    $("#" + id).hide();
}
function setSelectLive(id, name, dir) {
    $("#spanLiveCity").attr("sid", id).attr("sdir", dir).html(name);
    $("#divLiveCity").hide();
    $("#spanLiveCity").removeClass("active");
}
function cunnCity() {
    try {
        $.get("http://jianli.58.com/ajax/getcurrentycity/", function(data) {
            if (data != undefined && data != "" && data != "{}") {
                var json = eval("(" + data + ")");
                $("#aPublish").attr("href", "http://post.58.com/" + json.id + "/9224/s2");
                $("#aPublish2").attr("href", "http://post.58.com/" + json.id + "/9224/s2");
            }
        });
    } catch (e) { }
}
//function SearchType(type) {
//    switch (type) {
//        case '1':
//            return '求职位';
//        case '2':
//            return '目前职位';
//        case '3':
//            return '公司名称';
//        case '4':
//            return '简历名称';
//    }
//    return '';
//}