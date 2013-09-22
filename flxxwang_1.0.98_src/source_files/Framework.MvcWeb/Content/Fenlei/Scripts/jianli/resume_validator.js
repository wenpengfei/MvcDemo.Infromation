function infomationvalidate1() {
    if (isPostJobInfo != true) {
        if (!IsTPositionValidate($("#selPosCate1"))) {
            return false;
        }
        if (!IsTPositionNameValidate($("#txtTPosition"))) {
            return false;
        }
        if (!IsSalaryValidate($("#salary"))) {
            return false;
        }
        if (!isExperienceValidate($("#txtLetter"))) {
            return false;
        }
    }
    if (!IsTrueNameValidate($("#txtUserName"))) {
        return false;
    }
    if (!IsGenderValidate($("#selGender"))) {
        return false;
    }
    if (!IsEducationValidate($("#selEducation"))) {
        return false;
    }
    if (parseInt($("#selEducation").val()) > 2 && parseInt($("#hidresume").val()) == -1) {
        if ($("#divTempEduc ul.worklist li").length == 0) {
            var txtUserEducationInfo = $("#txtEducationInfoSave");
            txtUserEducationInfo.addClass("wrong");
            txtUserEducationInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请点击保存您的教育背景</span><span class=\"action_po_bot\"></span></span>");
            return false;
        }
    }
    if (!IsWorkedValidate($("#selWorked"))) {
        return false;
    }
    if (parseInt($("#selWorked").val()) > 0 && parseInt($("#hidresume").val()) == -1) {
        if ($("#divTempExpe ul.worklist li").length == 0) {
            var txtUserEducationInfo = $("#txtWorkedInfoSave");
            txtUserEducationInfo.addClass("wrong");
            txtUserEducationInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请点击保存您的工作经历</span><span class=\"action_po_bot\"></span></span>");
            return false;
        }
    }
    if (!IsMobileValidate($("#txtMobile"))) {
        return false;
    }
    if (!IsMailValidate($("#txtEmail"))) {
        return false;
    }
    if (isPostJobInfo != true) {
        if (!IsResumeNameValidate($("#txtResumeName"))) {
            return false;
        }
    }
    if (!IsBirthdayValidate($("#spInfoYear .txtyear"), $("#spInfoMonth .txtmonth"))) {
        return false;
    }
    if (!IsNowLiveValidate($("#hidNowLive"))) {
        return false;
    }
    return true;
};
function infomationvalidate2() {
    if (!IsCompNameValidate($("#txtCompName"))) {
        return false;
    }
    if (!IsPositionValidate($("#hidSPC3"))) {
        return false;
    }
    if (!IsPositionNameValidate($("#txtPositionName"))) {
        return false;
    }
    if (!IsPositionSalaryValidate($("#positionSalary"))) {
        return false;
    }
    if (!IsPosDateValidate($("#spPosStatYear .txtyear"), $("#spPosStatMonth .txtmonth"), $("#spPosEndYear .txtyear"), $("#spPosEndMonth .txtmonth"))) {
        return false;
    }
    if (!IsPerformanceValidate($("#txtPerformance"))) {
        return false;
    }
    return true;
};
function infomationvalidate3() {
    if (!IsSchoolValidate($("#txtSchool"))) {
        return false;
    }
    if (!IsProfessionalValidate($("#txtProfessional"))) {
        return false;
    }
    if (!IsEducDateValidate($("#spEduStatYear .txtyear"), $("#spEduStatMonth .txtmonth"), $("#spEduEndYear .txtyear"), $("#spEduEndMonth .txtmonth"))) {
        return false;
    }
    return true;
};
function infomationvalidate5() {
    if (!IsCertNameValidate($("#txtCertName"))) {
        return false;
    }
    if (!IsCertAuthorityValidate($("#txtCertAuthority"))) {
        return false;
    }
    if (!IsCertValidate($("#spIssueYear .txtyear"), $("#spIssueMonth .txtmonth"))) {
        return false;
    }
    return true;
};

function infomationvalidate32() {
    if (!IsSchoolValidate2($("#txtSchool2"))) {
        return false;
    }
    if (!IsProfessionalValidate2($("#txtProfessional2"))) {
        return false;
    }
    if (!IsEducDateValidate2($("#spEduStatYear2 .txtyear"), $("#spEduStatMonth2 .txtmonth"), $("#spEduEndYear2 .txtyear"), $("#spEduEndMonth2 .txtmonth"))) {
        return false;
    }
    return true;
};

function infomationvalidate22() {
    if (!IsCompNameValidate2($("#txtCompName2"))) {
        return false;
    }
    if (!IsPositionValidate2($("#hidSPC2"))) {
        return false;
    }
    if (!IsPositionNameValidate2($("#txtPositionName2"))) {
        return false;
    }
    if (!IsPositionSalaryValidate2($("#positionSalary2"))) {
        return false;
    }
    if (!IsPosDateValidate2($("#spPosStatYear2 .txtyear"), $("#spPosStatMonth2 .txtmonth"), $("#spPosEndYear2 .txtyear"), $("#spPosEndMonth2 .txtmonth"))) {
        return false;
    }
    if (!IsPerformanceValidate2($("#txtPerformance2"))) {
        return false;
    }
    return true;
};

$(function () {
    $("#txtUserName").focus(function () {
        var trueNameInfo = $("#txtTrueNameInfo");
        trueNameInfo.removeClass("wrong");
        trueNameInfo.addClass("action");
        trueNameInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">2-4个汉字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtUserName").blur(function () {
        IsTrueNameValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtMobile").focus(function () {
        var mobileInfo = $("#txtMobileInfo");
        mobileInfo.removeClass("wrong");
        mobileInfo.addClass("action");
        mobileInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">输入您的手机号码，11位数字组成</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtMobile").blur(function () {
        IsMobileValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtEmail").focus(function () {
        var mailInfo = $("#txtMailInfo");
        mailInfo.removeClass("wrong");
        mailInfo.addClass("action");
        mailInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">输入您的邮箱</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtEmail").blur(function () {
        IsMailValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#selGender").focus(function () {
        var txtUserEducationInfo = $("#txtTrueNameInfo");
        txtUserEducationInfo.removeClass("wrong");
        txtUserEducationInfo.addClass("action");
        txtUserEducationInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择性别</span><span class=\"action_po_bot\"></span></span>");
    });
    $("#selGender").blur(function () {
        IsGenderValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#selGender").change(function () {
        $(this).removeClass("wrongborder");
    });
    $("#selEducation").focus(function () {
        var txtUserEducationInfo = $("#txtEducationInfo");
        txtUserEducationInfo.removeClass("wrong");
        txtUserEducationInfo.addClass("action");
        txtUserEducationInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择最高学历</span><span class=\"action_po_bot\"></span></span>");
    });
    $("#selEducation").blur(function () {
        IsEducationValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#selEducation").change(function () {
        $(this).removeClass("wrongborder");
        if (parseInt($("#selEducation").val()) > 2 && parseInt($("#hidresume").val()) == -1) {
            $("#divTempEduc").show();
            $("#trEdu").show();
        }
        else {
            if ($("#divTempEduc ul.worklist").length > 0) {
                $("#divTempEduc ul.worklist").remove();
                removeTemp("removetempeduc", "usertempresumeedulist");
            }
            $("#divTempEduc").hide();
            $("#trEdu").hide();
            $("#tabAddEduc2").hide();
            $("#tabModyEduc2").show();
            if ($("#divTempEduc ul.worklist").length == 0) {
                $("#btnCancelEdu2").hide();
            }
        }
        //if (lc == 0) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom); }

        changeIframeH();
        if (isPostJobInfo == true) {
            dyniframesize("gsInfo");
        }

    });

    $("#txtSchool2").focus(function () {
        var txtWorkExperienceInfo = $("#txtSchoolInfo2");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">4-15个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtSchool2").blur(function () {
        IsSchoolValidate2($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtProfessional2").focus(function () {
        var txtWorkExperienceInfo = $("#txtSchoolInfo2");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">2-20个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtProfessional2").blur(function () {
        IsProfessionalValidate2($(this));
        $(this).removeClass("actionborder");
    });
    $("#selWorked").focus(function () {
        var txtUserEducationInfo = $("#txtWorkedInfo");
        txtUserEducationInfo.removeClass("wrong");
        txtUserEducationInfo.addClass("action");
        txtUserEducationInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择工作年限</span><span class=\"action_po_bot\"></span></span>");
    });
    $("#selWorked").blur(function () {
        IsWorkedValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#selWorked").change(function () {
        $(this).removeClass("wrongborder");
        if (parseInt($("#selWorked").val()) > 0 && parseInt($("#hidresume").val()) == -1) {
            $("#divTempExpe").show();
            $("#trExpe").show();
        } else {
            if ($("#divTempExpe ul.worklist").length > 0) {
                $("#divTempExpe ul.worklist").remove();
                removeTemp("removetempexpe", "usertempresumeexpelist");
            }
            $("#divTempExpe").hide();
            $("#trExpe").hide();
            $("#tabAddExpe2").hide();
            $("#tabModyExpe2").show();
            if ($("#divTempExpe ul.worklist").length == 0) {
                $("#btnCancelExpr2").hide();
            }
        }
        //        if (lc == 0) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom); }
        changeIframeH();
        if (isPostJobInfo == true) {
            dyniframesize("gsInfo");
        }
    });
    $("#txtCompName2").focus(function () {
        var txtWorkExperienceInfo = $("#txtCompNameInfo2");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">2-30个字，只能填写汉字、字母、数字和（）</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtCompName2").blur(function () {
        IsCompNameValidate2($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtPositionName2").focus(function () {
        var txtWorkExperienceInfo = $("#txtPositionInfo2");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">职位名称为2-12个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtPositionName2").blur(function () {
        IsPositionNameValidate2($(this));
        $(this).removeClass("actionborder");
    });
    $("#positionSalary2").focus(function () {
        var txtWorkExperienceInfo = $("#txtPositionInfo2");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">选择职位薪资</span><span class=\"action_po_bot\"></span></span>");
    });
    $("#positionSalary2").blur(function () {
        IsPositionSalaryValidate2($(this));
        $(this).removeClass("actionborder");
    });
    $("#positionSalary2").change(function () {
        $(this).removeClass("wrongborder");
    });
    $("#txtPerformance2").focus(function () {
        var txtWorkExperienceInfo = $("#txtPerformanceInfo2");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">10-1000个字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
        $(this).height(75);
    });
    $("#txtPerformance2").blur(function () {
        IsPerformanceValidate2($(this));
        $(this).removeClass("actionborder");
        $(this).height(35);
    });
    $("#txtResumeName").focus(function () {
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtResumeName").blur(function () {
        IsResumeNameValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtLetter").focus(function () {
        var txtWorkExperienceInfo = $("#txtLetterInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">内容应在5~300个字之间，不能填写电话、QQ等联系方式</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
        $(this).height(75);
        //        changeIframeH();
    });
    $("#txtLetter").blur(function () {
        isExperienceValidate($(this));
        $(this).removeClass("actionborder");
        $(this).height(35);
    });
    $("#txtLetter").bind("keyup change", lettercount);
    $("#txtTPosition").focus(function () {
        var txtWorkExperienceInfo = $("#txtTPositionInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">职位名称为2-12个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtTPosition").blur(function () {
        IsTPositionNameValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtNPosition").blur(function () {
        IsNPositionNameValidate($(this));
    });
    $("#salary").focus(function () {
        var txtWorkExperienceInfo = $("#txtTPositionInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">选择期望薪资</span><span class=\"action_po_bot\"></span></span>");
    });
    $("#salary").blur(function () {
        IsSalaryValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#salary").change(function () {
        $(this).removeClass("wrongborder");
    });
    $("#txtCompName").focus(function () {
        var txtWorkExperienceInfo = $("#txtCompNameInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">2-30个字，只能填写汉字、字母、数字和（）</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtCompName").blur(function () {
        IsCompNameValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtPositionName").focus(function () {
        var txtWorkExperienceInfo = $("#txtPositionInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">职位名称为2-12个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtPositionName").blur(function () {
        IsPositionNameValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#positionSalary").focus(function () {
        var txtWorkExperienceInfo = $("#txtPositionInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">选择职位薪资</span><span class=\"action_po_bot\"></span></span>");
    });
    $("#positionSalary").blur(function () {
        IsPositionSalaryValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#positionSalary").change(function () {
        $(this).removeClass("wrongborder");
    });
    $("#txtPerformance").focus(function () {
        var txtWorkExperienceInfo = $("#txtPerformanceInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">10-1000个字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
        $(this).height(75);
    });
    $("#txtPerformance").blur(function () {
        IsPerformanceValidate($(this));
        $(this).removeClass("actionborder");
        $(this).height(35);
    });
    $("#txtSchool").focus(function () {
        var txtWorkExperienceInfo = $("#txtSchoolInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">4-15个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtSchool").blur(function () {
        IsSchoolValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtProfessional").focus(function () {
        var txtWorkExperienceInfo = $("#txtSchoolInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">2-20个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtProfessional").blur(function () {
        IsProfessionalValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtCertName").focus(function () {
        var txtWorkExperienceInfo = $("#txtCertNameInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">4-15个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtCertName").blur(function () {
        IsCertNameValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtCertAuthority").focus(function () {
        var txtWorkExperienceInfo = $("#txtCertAuthorityInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">机构名称4-15个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtCertAuthority").blur(function () {
        IsCertAuthorityValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#spEduStatYear .txtyear").change(function () {
        clearInfoMsg($("#educDateInfo"));
    });
    $("#spEduStatMonth .txtmonth").change(function () {
        clearInfoMsg($("#educDateInfo"));
    });
    $("#spEduEndYear .txtyear").change(function () {
        clearInfoMsg($("#educDateInfo"));
    });
    $("#spEduEndMonth .txtmonth").change(function () {
        clearInfoMsg($("#educDateInfo"));
    });
    $("#spPosStatYear .txtyear").change(function () {
        clearInfoMsg($("#posDateInfo"));
    });
    $("#spPosStatMonth .txtmonth").change(function () {
        clearInfoMsg($("#posDateInfo"));
    });
    $("#spPosEndYear .txtyear").change(function () {
        clearInfoMsg($("#posDateInfo"));
    });
    $("#spPosEndMonth .txtmonth").change(function () {
        clearInfoMsg($("#posDateInfo"));
    });
});

function changeIframeH() {
    if (parent.document.getElementById("ContainerFrame") != null) {
        parent.document.getElementById("ContainerFrame").style.height = this.document.body.scrollHeight + "px";
    }
};
var lettercount = function () {
    var count = $("#txtLetter").val().getContentLength();
    var n = 300 - count;
    n = n > 0 ? n : 0;
    $("#txtLetterInfo").html("<span class=\"action_po\"><span class=\"action_po_top\">5-300个字，您还可以输入<b class='red'>" + n + "</b>个字。</span><span class=\"action_po_bot\"></span></span>");
};
String.prototype.getContentLength = function () {
    var len = 0;
    for (var i = 0; i < this.length; i++) {
        if ((this.charCodeAt(i) >= 0) && (this.charCodeAt(i) <= 255)) {
            len = len + 1;
        } else {
            len = len + 2;
        }
        if (len > 600) {
            var str = this.substring(0, i);
            $("#txtLetter").val(str);
        }
    }
    return ~ ~(len / 2);
};