//$.ajaxSetup({ type: "post", global: false, dataType: "html" });
function QtoB(value) {
    var str = value;
    var result = "";
    for (var i = 0; i < str.length; i++) {
        if (str.charCodeAt(i) == 12288) {
            result += String.fromCharCode(str.charCodeAt(i) - 12256);
            continue;
        }
        if (str.charCodeAt(i) > 65280 && str.charCodeAt(i) < 65375)
            result += String.fromCharCode(str.charCodeAt(i) - 65248);
        else result += String.fromCharCode(str.charCodeAt(i));
    }
    return result;
}
function clearInfoMsg(obj) {
    obj.removeClass("action");
    obj.removeClass("wrong");
    obj.html("");
}
function IsTrueNameValidate(obj) {
    try {
        var trueName = obj.val();
        var trueNameInfo = $("#txtTrueNameInfo");
        var re = /^[\u4E00-\u9FA5]{2,4}$/;
        if (!trueName.match(re)) {
            trueNameInfo.removeClass("action");
            trueNameInfo.addClass("wrong");
            trueNameInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">2-4个字，不允许出现特殊字符</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(trueNameInfo);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsGenderValidate(obj) {
    try {
        var gender = obj.val();
        var trueNameInfo = $("#txtTrueNameInfo");
        if (gender == "-1") {
            trueNameInfo.removeClass("action");
            trueNameInfo.addClass("wrong");
            trueNameInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择性别</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(trueNameInfo);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsEducationValidate(obj) {
    try {
        var gender = obj.val();
        var trueNameInfo = $("#txtEducationInfo");
        if (gender == "-1") {
            trueNameInfo.removeClass("action");
            trueNameInfo.addClass("wrong");
            trueNameInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择最高学历</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(trueNameInfo);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsEducationValidate22(obj) {
    try {
        var gender = obj.val();
        var trueNameInfo = $("#educDateInfo2");
        if (gender == "-1") {
            trueNameInfo.removeClass("action");
            trueNameInfo.addClass("wrong");
            trueNameInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择学历</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(trueNameInfo);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsEducationValidate2(obj) {
    try {
        var gender = obj.val();
        var trueNameInfo = $("#educDateInfo");
        if (gender == "-1") {
            trueNameInfo.removeClass("action");
            trueNameInfo.addClass("wrong");
            trueNameInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择学历</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(trueNameInfo);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsWorkedValidate(obj) {
    try {
        var gender = obj.val();
        var trueNameInfo = $("#txtWorkedInfo");
        if (gender == "-1") {
            trueNameInfo.removeClass("action");
            trueNameInfo.addClass("wrong");
            trueNameInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择工作年限</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(trueNameInfo);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsMobileValidate(obj) {
    try {
        var txtMobile = obj.val().trimStr();
        txtMobile = QtoB(txtMobile);
        var mobileInfo = $("#txtMobileInfo");
        obj.val(txtMobile);
        var re = /(^$)|(^(0\d{2,3})?-?([2-9]\d{6,7})(-\d{1,4})?$)|(^((\(\d{3}\))|(\d{0}))?(13|14|15|18)\d{9}$)|(^(400|800)\d{7}(-\d{1,4})?$)|(^(95013)\d{6,8}$)/;
        if (txtMobile == "" || (!txtMobile.match(re))) {
            mobileInfo.removeClass("action");
            mobileInfo.addClass("wrong");
            mobileInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">电话填写错误。请参照格式填写：87654321-001或138********!</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(mobileInfo);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsMailValidate(obj) {
    try {
        var txtMail = obj.val().trimStr();
        var mailInfo = $("#txtMailInfo");
        var re = /^[_\.0-9a-zA-Z-]+[0-9a-zA-Z]@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,3}$/;
        if (!txtMail.match(re)) {
            mailInfo.removeClass("action");
            mailInfo.addClass("wrong");
            mailInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">邮箱格式不正确!</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(mailInfo);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsResumeNameValidate(obj) {
    try {
        var txtCurrent = obj.val();
        var info = $("#txtResumeNameInfo");
        var re = /^[\w|\u4E00-\u9FA5]{0,15}$/;
        if (!txtCurrent.match(re)) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请输入简历名称，最多15个字</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function isExperienceValidate(obj) {
    try {
        var txtExperience = obj.val();
        var txtExperienceInfo = $("#" + obj.attr("id") + "Info");
        if (txtExperience.trimStr() == '' || txtExperience.length > 300 || txtExperience.length < 5 || isIncludePhone(txtExperience) || isIncludeQQ(txtExperience)) {
            txtExperienceInfo.removeClass("action");
            txtExperienceInfo.addClass("wrong");
            txtExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">内容应在5~300个字之间，不能填写电话、QQ等联系方式</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(txtExperienceInfo);
            return true;
        }
    } catch (ex) {
        return true;
    }
}
function isIncludePhone(v) {
    try {
        var expPhone = /((0\d{2,3})?-?(\d{7,8})(-\d{3,6})?)|(((\(\d{3}\))|(\d{3}\-))?(13|15|18)\d{9})|((95|96)\d{10})|((400|800)\d{7})/;
        var regPhone = new RegExp(expPhone);
        v = QtoB(v);
        if (regPhone.test(v)) { return true; }
        else return false;
    } catch (e) {
        return false;
    }
}
function isIncludeQQ(v) {
    try {
        var re = /[0-9０-９]{5,13}/g;
        v = QtoB(v);
        if (re.test(v.replace(/\s/g, "")))
            return true;
        else
            return false;
    } catch (e) {
        return false;
    }
}
function IsTPositionValidate(obj) {
    try {
        //var g = obj.val();
        var info = $("#txtTPositionInfo");
        if (obj.attr("pid") == undefined || obj.attr("pid")==null) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择职位类别</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsTPositionNameValidate(obj) {
    try {
        var txtCurrent = obj.val();
        var info = $("#txtTPositionInfo");
        var re = /^([\w|\u4E00-\u9FA5]|[.。()（）+#\/]){2,12}$/;
        if (!txtCurrent.match(re)) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">职位名称为2-12个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsNPositionNameValidate(obj) {
    try {
        var txtCurrent = obj.val();
        var info = $("#txtNPositionInfo");
        var re = /^([\w|\u4E00-\u9FA5]|[.。()（）+#\/]){0,12}$/;
        if (!txtCurrent.match(re)) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">职位名称小于12个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsSalaryValidate(obj) {
    try {
        var g = obj.val();
        var info = $("#txtTPositionInfo");
        if (g == "-1") {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择期望薪资</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function getLen(val) {
    var len = 0;
    for (var i = 0; i < val.length; i++) {
        if (val.charCodeAt(i) >= 0x4e00 && val.charCodeAt(i) <= 0x9fa5) {
            len += 2;
        } else {
            len++;
        }
    }
    return len;
}
function IsCompNameValidate(obj) {
    try {
        var txtCurrent = obj.val();
        var info = $("#txtCompNameInfo");
        //var re = /^[\w|\u4E00-\u9FA5]{4,15}$/;
        var re = /^[\u4e00-\u9fa5\A-Za-z0-9\（）\()]*$/;
        if (txtCurrent == "") {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">公司名称为必填</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else if (!txtCurrent.match(re) || getBytesLength(txtCurrent) < 4 || getBytesLength(txtCurrent) > 60) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">2-30个字，只能填写汉字、字母、数字和（）</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsCompNameValidate2(obj) {
    try {
        var txtCurrent = obj.val();
        var info = $("#txtCompNameInfo2");
        var re = /^[\u4e00-\u9fa5\A-Za-z0-9\（）\()]*$/;
        if (txtCurrent == "") {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">公司名称为必填</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else if (!txtCurrent.match(re) || getBytesLength(txtCurrent) < 4 || getBytesLength(txtCurrent) > 60) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">2-30个字，只能填写汉字、字母、数字和（）</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsPositionValidate(obj) {
    try {
        var g = obj.val();
        var info = $("#txtPositionInfo");
        if (g == "0") {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择职位类别</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsPositionValidate2(obj) {
    try {
        var g = obj.val();
        var info = $("#txtPositionInfo2");
        if (g == "0") {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择职位类别</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsPositionNameValidate(obj) {
    try {
        var txtCurrent = obj.val();
        var info = $("#txtPositionInfo");
        var re = /^([\w|\u4E00-\u9FA5]|[.。()（）+#\/]){2,12}$/;
        if (!txtCurrent.match(re)) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">职位名称为2-12个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsPositionNameValidate2(obj) {
    try {
        var txtCurrent = obj.val();
        var info = $("#txtPositionInfo2");
        var re = /^([\w|\u4E00-\u9FA5]|[.。()（）+#\/]){2,12}$/;
        if (!txtCurrent.match(re)) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">职位名称为2-12个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsPositionSalaryValidate(obj) {
    try {
        var g = obj.val();
        var info = $("#txtPositionInfo");
        if (g == "-1") {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择职位薪资</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsPositionSalaryValidate2(obj) {
    try {
        var g = obj.val();
        var info = $("#txtPositionInfo2");
        if (g == "-1") {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择职位薪资</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsPerformanceValidate(obj) {
    try {
        var txtCurrent = obj.val();
        var len = getBytesLength(txtCurrent);
        var info = $("#txtPerformanceInfo");
        if (len < 20 || len > 2000) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">10-1000个字</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsPerformanceValidate2(obj) {
    try {
        var txtCurrent = obj.val();
        var len = getBytesLength(txtCurrent);
        var info = $("#txtPerformanceInfo2");
        if (len < 20 || len > 2000) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">10-1000个字</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsPosDateValidate(objSY, objSM, objEY, objEM) {
    try {
        var info = $("#posDateInfo");
        if (objSY.val() == "" || objSM.val() == "" || objEY.val() == "" || (objEY.val() != "至今" && objEM.val() == "")) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择日期范围</span><span class=\"action_po_bot\"></span></span>");
            return false;
        }
        if (objEY.val() == "至今") {
            clearInfoMsg(info);
            return true;
        }
        var star = new Date(objSY.val(), objSM.val(), 1);
        var end = new Date(objEY.val(), objEM.val(), 1);
        if (star >= end) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">开始日期需小于结束日期</span><span class=\"action_po_bot\"></span></span>");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsPosDateValidate2(objSY, objSM, objEY, objEM) {
    try {
        var info = $("#posDateInfo2");
        if (objSY.val() == "" || objSM.val() == "" || objEY.val() == "" || (objEY.val() != "至今" && objEM.val() == "")) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择日期范围</span><span class=\"action_po_bot\"></span></span>");
            return false;
        }
        if (objEY.val() == "至今") {
            clearInfoMsg(info);
            return true;
        }
        var star = new Date(objSY.val(), objSM.val(), 1);
        var end = new Date(objEY.val(), objEM.val(), 1);
        if (star >= end) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">开始日期需小于结束日期</span><span class=\"action_po_bot\"></span></span>");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsSchoolValidate(obj) {
    try {
        var txtCurrent = obj.val();
        var info = $("#txtSchoolInfo");
        var re = /^[\w|\u4E00-\u9FA5]{4,15}$/;
        if (!txtCurrent.match(re)) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">4-15个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsSchoolValidate2(obj) {
    try {
        var txtCurrent = obj.val();
        var info = $("#txtSchoolInfo2");
        var re = /^[\w|\u4E00-\u9FA5]{4,15}$/;
        if (!txtCurrent.match(re)) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">4-15个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsProfessionalValidate(obj) {
    try {
        var txtCurrent = obj.val();
        var info = $("#txtSchoolInfo");
        var re = /^[\w|\u4E00-\u9FA5]{2,20}$/;
        if (!txtCurrent.match(re)) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">专业2-20个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsProfessionalValidate2(obj) {
    try {
        var txtCurrent = obj.val();
        var info = $("#txtSchoolInfo2");
        var re = /^[\w|\u4E00-\u9FA5]{2,20}$/;
        if (!txtCurrent.match(re)) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">专业2-20个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsEducDateValidate(objSY, objSM, objEY, objEM) {
    try {
        var info = $("#educDateInfo");
        if (objSY.val() == "" || objSM.val() == "" || objEY.val() == "" || (objEY.val() != "至今" && objEM.val() == "")) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择日期范围</span><span class=\"action_po_bot\"></span></span>");
            return false;
        }
        if (objEY.val() == "至今") {
            clearInfoMsg(info);
            return true;
        }
        var star = new Date(objSY.val(), objSM.val(), 1);
        var end = new Date(objEY.val(), objEM.val(), 1);
        if (star >= end) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">开始日期需小于结束日期</span><span class=\"action_po_bot\"></span></span>");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsEducDateValidate2(objSY, objSM, objEY, objEM) {
    try {
        var info = $("#educDateInfo2");
        if (objSY.val() == "" || objSM.val() == "" || objEY.val() == "" || (objEY.val() != "至今" && objEM.val() == "")) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择日期范围</span><span class=\"action_po_bot\"></span></span>");
            return false;
        }
        if (objEY.val() == "至今") {
            clearInfoMsg(info);
            return true;
        }
        var star = new Date(objSY.val(), objSM.val(), 1);
        var end = new Date(objEY.val(), objEM.val(), 1);
        if (star >= end) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">开始日期需小于结束日期</span><span class=\"action_po_bot\"></span></span>");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsCertNameValidate(obj) {
    try {
        var txtCurrent = obj.val();
        var info = $("#txtCertNameInfo");
        var re = /^[\w|\u4E00-\u9FA5]{4,15}$/;
        if (!txtCurrent.match(re)) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">4-15个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsCertAuthorityValidate(obj) {
    try {
        var txtCurrent = obj.val();
        var info = $("#txtCertAuthorityInfo");
        var re = /^[\w|\u4E00-\u9FA5]{4,15}$/;
        if (!txtCurrent.match(re)) {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">机构名称4-15个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
String.prototype.trimStr = function() {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
function IsContentEqual(obj1, obj2) {
    if (obj1.val().trimStr() == obj2.val().trimStr())
        return true;
    return false;
}
function getBytesLength(str) {
    return str.replace(/[^\x00-\xff]/g, 'xx').length;
}
function IsBirthdayValidate(objY, objM) {
    try {
        var info = $("#txtTrueNameInfo");
        if (objY.val() == "" || objM.val() == "") {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择出生日期</span><span class=\"action_po_bot\"></span></span>");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsCertValidate(objY, objM) {
    try {
        var info = $("#txtCertAuthorityInfo");
        if (objY.val() == "" || objM.val() == "") {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择证书日期</span><span class=\"action_po_bot\"></span></span>");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsNowLiveValidate(obj) {
    try {
        var info = $("#txtNowLiveInfo");
        if (obj.val() == "0") {
            info.removeClass("action");
            info.addClass("wrong");
            info.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择现居住地</span><span class=\"action_po_bot\"></span></span>");
            return false;
        } else {
            clearInfoMsg(info);
            return true;
        }
    } catch (e) {
        return true;
    }
}
function IsWorked2Validate(obj) {
    try {
        var gender = obj.val();
        var trueNameInfo = $("#txtWorkedInfo");
        if (gender == "-1") {
            trueNameInfo.removeClass("action");
            trueNameInfo.addClass("wrong");
            trueNameInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择实践经验</span><span class=\"action_po_bot\"></span></span>");
            obj.addClass("wrongborder");
            return false;
        } else {
            clearInfoMsg(trueNameInfo);
            return true;
        }
    } catch (e) {
        return true;
    }
}