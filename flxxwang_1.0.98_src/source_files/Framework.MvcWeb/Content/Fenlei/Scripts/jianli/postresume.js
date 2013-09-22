var xmlHttp = null;
//document.domain = "58.com";
function CreateXmlHttpRequest() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
}
function infomationvalidate() {
    if (!IsTrueNameValidate($("#txtUserName"))) {
        return false;
    }
    if (!IsGenderValidate($("#selGender"))) {
        return false;
    }
    if (!IsEducationValidate($("#selEducation"))) {
        return false;
    }
    if (!IsWorkedValidate($("#selWorked"))) {
        return false;
    }
    if (!IsMobileValidate($("#txtMobile"))) {
        return false;
    }
    if (!IsMailValidate($("#txtEmail"))) {
        return false;
    }
    return true;
}
function sendLastedResume(callback) {
    var url = "http://jianli.58.com/ajax/addresume/";
    var xmlData = '<?xml version="1.0" encoding="UTF-8"?>';
    xmlData += '<sendinfo>';
    xmlData += '<operate>updateintentions</operate>';
    xmlData += "<resumeid>" + $("#hidresume").val() + "</resumeid>";
    xmlData += '<tcatetypeid>{0}</tcatetypeid>';
    xmlData += '<tcatenname><![CDATA[{1}]]></tcatenname>';
    xmlData += '<tposition><![CDATA[{2}]]></tposition>';
    xmlData += '<tpositionsalary>{3}</tpositionsalary>';
    xmlData += '<npositionid>{4}</npositionid>';
    xmlData += '<nposition><![CDATA[{5}]]></nposition>';
    xmlData += '<npositionsalary>{6}</npositionsalary>';
    xmlData += '<letter><![CDATA[{7}]]></letter>';
    xmlData += '</sendinfo>';
    xmlData = xmlData.replace('{0}', window.parent.getRootCateID());
    xmlData = xmlData.replace('{1}', $(window.parent.document).find("#xiaozhiwei").find("option:selected").text());
    xmlData = xmlData.replace('{2}', $(window.parent.document).find("#Title").val());
    xmlData = xmlData.replace('{3}', $(window.parent.document).find("#ddlQWXZ").val());
    xmlData = xmlData.replace('{4}', $(window.parent.document).find("#hidSPC").val());
    xmlData = xmlData.replace('{5}', $(window.parent.document).find("#Title2").val());
    xmlData = xmlData.replace('{6}', $(window.parent.document).find("#nowSalary").val());
    xmlData = xmlData.replace('{7}', $(window.parent.document).find("#Content").val());
    $.ajax({
        type: 'POST',
        url: url,
        processData: false,
        data: xmlData,
        cache: false,
        success: function(info) {
            callback(1, info);
        },
        error: function(err) {
            callback(0, err);
        }
    });
}
function getMode() {
    if ($("#hidType").val() == 0) { return false; }
    else { return true; }
}
function subform(callback) {
    if (!infomationvalidate()) {
        return;
    }
    var trueName = $("#txtUserName").val();
    var sex = $("#selGender").val();
    var workyears = $("#selWorked").val();
    var usereducation = $("#selEducation").val();
    var usermobile = $("#txtMobile").val().trimStr();
    var useremail = $("#txtEmail").val().trimStr();
    var birthday = $("#selYear").val() + "-" + $("#selMonth").val() + "-" + "01 13:01:01";
    var cityID = document.getElementById("Register1_dropCityid").value.trimStr();
    var areaID = document.getElementById("Register1_dropAreaid").value.trimStr();
    var nameID = document.getElementById("Register1_dropNameid").value.trimStr();
    var userCity;
    if (nameID != -1)
        userCity = nameID;
    else if (areaID != -1)
        userCity = areaID
    else
        userCity = cityID;
    CreateXmlHttpRequest();
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4) {
            if (xmlHttp.status == 200) {
                if (xmlHttp.responseText.indexOf("error:") == -1) {
                    if (xmlHttp.responseText != '0') {
                        var id = xmlHttp.responseText;
                        $("#hidresume").val(id);
                    }
                }
                callback();
            }
        } 
    };

    var xmlText = '';
    xmlText = '<?xml version="1.0" encoding="UTF-8"?>';
    xmlText += "<sendinfo>";
    xmlText += "<operate>postresume</operate>";
    xmlText += "<resumeid>" + $("#hidresume").val() + "</resumeid>";
    xmlText += "<truename><![CDATA[" + repLaceData(trueName) + "]]></truename>";
    xmlText += "<sex>" + sex + "</sex>";
    xmlText += "<birthday>" + birthday + "</birthday>";
    xmlText += "<workyears>" + workyears + "</workyears>";
    xmlText += "<usereducation>" + usereducation + "</usereducation>";
    xmlText += "<usermobile>" + usermobile + "</usermobile>";
    xmlText += "<useremail>" + useremail + "</useremail>";
    if (document.getElementById("Pic") != null)
        xmlText += "<pics><![CDATA[" + document.getElementById("Pic").value + "]]></pics>";
    if (document.getElementById("Register1_dropCityid") != null)
        xmlText += "<usercity>" + userCity + "</usercity>";
    xmlText += "</sendinfo>";
    url = "http://jianli.58.com/ajax/addresume/";
    xmlHttp.open("POST", url, true);
    xmlHttp.setRequestHeader("Conent-Type", "text/xml");
    xmlHttp.send(xmlText);
}
function repLaceData(source) {
    if (source != '') {
        return source.replace(/]]>/g, "");
    } else {
        return '';
    }
}
$(document).ready(function() {
    pushParentTR();
    $("#txtUserName").focus(function() {
        var trueNameInfo = $("#txtTrueNameInfo");
        trueNameInfo.removeClass("wrong");
        trueNameInfo.addClass("action");
        trueNameInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">2-4个汉字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtUserName").blur(function() {
        IsTrueNameValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtMobile").focus(function() {
        var mobileInfo = $("#txtMobileInfo");
        mobileInfo.removeClass("wrong");
        mobileInfo.addClass("action");
        mobileInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">输入您的手机号码，11位数字组成</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtMobile").blur(function() {
        IsMobileValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtEmail").focus(function() {
        var mailInfo = $("#txtMailInfo");
        mailInfo.removeClass("wrong");
        mailInfo.addClass("action");
        mailInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">输入您的邮箱</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtEmail").blur(function() {
        IsMailValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#selGender").focus(function() {
        var txtUserEducationInfo = $("#txtTrueNameInfo");
        txtUserEducationInfo.removeClass("wrong");
        txtUserEducationInfo.addClass("action");
        txtUserEducationInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择性别</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#selGender").blur(function() {
        IsGenderValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#selEducation").focus(function() {
        var txtUserEducationInfo = $("#txtTrueNameInfo");
        txtUserEducationInfo.removeClass("wrong");
        txtUserEducationInfo.addClass("action");
        txtUserEducationInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择学历</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#selEducation").blur(function() {
        IsEducationValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#selWorked").focus(function() {
        var txtUserEducationInfo = $("#txtTrueNameInfo");
        txtUserEducationInfo.removeClass("wrong");
        txtUserEducationInfo.addClass("action");
        txtUserEducationInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择工作年限</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#selWorked").blur(function() {
        IsWorkedValidate($(this));
        $(this).removeClass("actionborder");
    });
    window.parent.PosCateIndexInit();
});
function pushParentTR() {
    try {
        var arr = $("#hidValues").val().split("'");
        var str = "<td class=\"t\">最近职位： </td> <td>";
        str += "<span id=\"selPosCate\" class=\"choose\"><span>请选择职位类别</span><div style=\"width: 480px; display: none;\" id=\"divPosCate\" class=\"setbox\">正在加载中，请稍等...</div><div id=\"divPosCateU\" style=\"display: none;\" class=\"setboxline\"></div><iframe scrolling=\"no\" frameborder=\"0\" style=\"position: absolute; top: 0px; left: 0px; display: none;\" src=\"javascript:false;\" id=\"DivShim\"></iframe>";
        str += " <input type=\"hidden\" value=\"" + arr[0] + "\" id=\"hidPC\"><input type=\"hidden\" value=\"" + arr[1] + "\" id=\"hidPCN\"><input type=\"hidden\" value=\"" + arr[2] + "\" id=\"hidSPC\"><input type=\"hidden\" value=\"" + arr[3] + "\" id=\"hidSPCN\"></span>";
        str += "<input type=\"text\" id=\"Title2\" value=\"" + arr[4] + "\" class=\"text2\"  maxLength=12 />";
        str += returnSay(arr[5]) + "元/月</td>";
        $(window.parent.document).find("#trJianLi").html(str);
        $(window.parent.document).find("#trJianLi").show();
        $(window.parent.document).find("#ddlQWXZ").val(arr[6]);
    } catch (e) {
    }
}
function returnSay(n) {
    var str = "<select id=\"nowSalary\"><option value=\"-1\">目前薪资</option><option value=\"0\">保密</option><option value=\"1\">1000以下</option><option value=\"2\">1000-2000</option><option value=\"3\">2000-3000</option><option value=\"4\">3000-5000</option><option value=\"5\">5000-8000</option><option value=\"6\">8000-12000</option><option value=\"7\">12000-20000</option><option value=\"8\">20000-25000</option><option value=\"9\">25000以上</option></select>";
    str = str.replace("value=\"" + n + "\"", "value=\"" + n + "\" selected");
    return str;
}
function getCompanyId() {
    return $("#hidValues2").val().split("'")[0];
}
function getComopanyName() {
    return $("#hidValues2").val().split("'")[1];
}
function GetPhone() {
    return $("#hidValues2").val().split("'")[2];
}
var CityInfoLoadClass = {
    cityinfoload: function(cityID, areaID, nameID, obj) {
        $.ajax({
            type: "post",
            dataType: "html",
            url: "http://jianli.58.com/ajax/getareainfo/",
            data: { operate: 'getcityinfo', parentid: '0', cityID: cityID, areaID: areaID, nameID: nameID, parentNodeID: obj },
            success: function(data, textStatus) {
                var response = data.toString();
                var r = document.getElementById(obj).getElementsByTagName('span');
                for (var i = 0; i < r.length; i++) {
                    if (r[i].id == "getcity") {
                        r[i].innerHTML = response;
                    }
                }
            }
        });
    },
    cityChange: function(obj, obj1) {
        $.ajax({
            type: "post",
            dataType: "html",
            url: "http://jianli.58.com/ajax/getareainfo/",
            data: { operate: 'getareainfo', parentid: obj, cityID: '0', areaID: '0', nameID: '0', parentNodeID: obj1 },
            success: function(data, textStatus) {
                var response = data.toString();
                var r = document.getElementById(obj1).getElementsByTagName('span');
                for (var i = 0; i < r.length; i++) {
                    if (r[i].id == "getarea") {
                        r[i].innerHTML = response;
                    }
                }
            }
        });
    },
    areaChange: function(obj, obj1) {
        $.ajax({
            type: "post",
            dataType: "html",
            url: "http://jianli.58.com/ajax/getareainfo/",
            data: { operate: 'getnameinfo', parentid: obj, cityID: '0', areaID: '0', nameID: '0', parentNodeID: obj1 },
            success: function(data, textStatus) {
                var response = data.toString();
                var r = document.getElementById(obj1).getElementsByTagName('span');
                for (var i = 0; i < r.length; i++) {
                    if (r[i].id == "getname") {
                        r[i].innerHTML = response;
                    }
                }
            }
        });
    }
};