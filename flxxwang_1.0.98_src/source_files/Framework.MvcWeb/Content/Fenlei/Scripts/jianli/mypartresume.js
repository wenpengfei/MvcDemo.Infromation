var lc = 0;
function modyInfo() {
    $("#divSInfo").hide();
    $("#divMInfo").show();
    PosCateIndexInit(1);
    changeIframeH();
}
function addEduc() {
    $("#tabAddEduc").hide();
    $("#tabModyEduc").show();
    clearEduc();
    changeIframeH();
}
function cancelEdu() {
    $("#tabAddEduc").show();
    $("#tabModyEduc").hide();
    clearEduc();
    changeIframeH();
}
function addExpe() {
    $("#tabAddExpe").hide();
    $("#tabModyExpe").show();
    clearExpe();
    changeIframeH();
}
function cancelExpe() {
    $("#tabAddExpe").show();
    $("#tabModyExpe").hide();
    clearExpe();
    changeIframeH();
}
function addLang() {
    $("#tabAddLang").hide();
    $("#tabModyLang").show();
    clearLang();
    changeIframeH();
}
function cancelLang() {
    $("#tabAddLang").show();
    $("#tabModyLang").hide();
    clearLang();
    changeIframeH();
}
function addCert() {
    $("#tabAddCert").hide();
    $("#tabModyCert").show();
    clearCert();
    changeIframeH();
}
function cancelCert() {
    $("#tabAddCert").show();
    $("#tabModyCert").hide();
    clearCert();
    changeIframeH();
}
var xmlHttp = null;
//document.domain = "58.com";
function CreateXmlHttpRequest() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
};
function infomationvalidate1() {
    if (!IsTPositionValidate($("#hidSPC1"))) {
        return false;
    }
    if ($("#txtLetter").val() == "可以在 个人能力、优势、性格、专长等方面进行自我描述") {
        $("#txtLetter").val("");
    }
    if (!IsTPositionNameValidate($("#txtTPosition"))) {
        return false;
    }
    if (!isExperienceValidate($("#txtLetter"))) {
        return false;
    }
    if (!IsTrueNameValidate($("#txtUserName"))) {
        return false;
    }
    if (!IsGenderValidate($("#selGender"))) {
        return false;
    }
    if (!IsResumeNameValidate($("#txtResumeName"))) {
        return false;
    }
    if (!IsBirthdayValidate($("#spInfoYear .txtyear"), $("#spInfoMonth .txtmonth"))) {
        return false;
    }
    if (!IsEducationValidate($("#selEducation"))) {
        return false;
    }
    if (!IsWorked2Validate($("#selWorked"))) {
        return false;
    }
    if (parseInt($("#selEducation").val()) > 2 && parseInt($("#hidresume").val()) == 0) {
        if ($("#divTempEduc ul.worklist li").length == 0) {
            var txtUserEducationInfo = $("#txtEducationInfoSave");
            txtUserEducationInfo.addClass("wrong");
            txtUserEducationInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请点击保存您的教育背景</span><span class=\"action_po_bot\"></span></span>");
            return false;
        }
    }
    if (parseInt($("#selWorked").val()) > 0 && parseInt($("#hidresume").val()) == 0) {
        if ($("#divTempExpe ul.worklist li").length == 0) {
            var txtUserEducationInfo = $("#txtWorkedInfoSave");
            txtUserEducationInfo.addClass("wrong");
            txtUserEducationInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请点击保存您的实践经历</span><span class=\"action_po_bot\"></span></span>");
            return false;
        }
    }
    if (!IsMobileValidate($("#txtMobile"))) {
        return false;
    }
    if (!IsMailValidate($("#txtEmail"))) {
        return false;
    }
    if (!IsNowLiveValidate($("#hidNowLive"))) {
        return false;
    }
    var freetime = getFreeTime();
    if (freetime == "1$0,2$0,3$0,4$0,5$0,6$0,7$0") {
        var txtFreeTimeInfo = $("#txtFreeTimeInfo");
        txtFreeTimeInfo.addClass("wrong");
        txtFreeTimeInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">完善个人空余时间，可提高求职效果</span><span class=\"action_po_bot\"></span></span>");
        return false;
    }
    return true;
};
function infomationvalidate2() {
    if (!IsCompNameValidate($("#txtCompName"))) {
        return false;
    }
    if (!IsPositionNameValidate($("#txtPositionName"))) {
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
function backfun1() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            if (xmlHttp.responseText.indexOf("error:") != -1) {
                alert(xmlHttp.responseText.split(':')[1]);
            } else if (xmlHttp.responseText != "0") {
                location.href = location.href;
            }
        }
    }
};
function subform1(callback) {
    if (!infomationvalidate1()) {
        return;
    }
    var trueName = $("#txtUserName").val();
    var sex = $("#selGender").val();
    var workyears = $("#selWorked").val();
    var usereducation = $("#selEducation").val();
    var usermobile = $("#txtMobile").val().trimStr();
    var useremail = $("#txtEmail").val().trimStr();
    var birthday = $("#spInfoYear .txtyear").val() + "-" + $("#spInfoMonth .txtmonth").val() + "-" + "01 13:01:01";
    var cityID = $("#hidNowLive").attr("cid");
    var areaID = $("#hidNowLive").attr("aid");
    var nameID = $("#hidNowLive").attr("nid");
    var userCity;
    if (nameID != "0") {
        userCity = nameID;
    } else if (areaID != "0") {
        userCity = areaID;
    } else {
        userCity = cityID;
    }
    var resumename = $("#txtResumeName").val();
    var letter = $("#txtLetter").val();
    var targetcateid = $("#hidSPC1").val();
    var targetposition = $("#txtTPosition").val();
    var salary = 0; //$("#salary").val();
    var rdoidentity = $("input[name='rdoIdentity']:checked").val();
    var freetime = getFreeTime();
    CreateXmlHttpRequest();
    xmlHttp.onreadystatechange = callback;

    var xmlText = '<?xml version="1.0" encoding="UTF-8"?>';
    xmlText += "<sendinfo>";
    xmlText += "<operate>partresumeinfo</operate>";
    xmlText += "<resumeid>" + $("#hidresume").val() + "</resumeid>";
    xmlText += "<truename><![CDATA[" + repLaceData(trueName) + "]]></truename>";
    xmlText += "<resumename><![CDATA[" + repLaceData(resumename) + "]]></resumename>";
    xmlText += "<letter><![CDATA[" + repLaceData(letter) + "]]></letter>";
    xmlText += "<sex>" + sex + "</sex>";
    xmlText += "<birthday>" + birthday + "</birthday>";
    xmlText += "<workyears>" + workyears + "</workyears>";
    xmlText += "<usereducation>" + usereducation + "</usereducation>";
    xmlText += "<usermobile>" + usermobile + "</usermobile>";
    xmlText += "<useremail>" + useremail + "</useremail>";
    xmlText += "<targetcateid>" + targetcateid + "</targetcateid>";
    xmlText += "<targetposition><![CDATA[" + repLaceData(targetposition) + "]]></targetposition>";
    xmlText += "<salary>" + salary + "</salary>";
    xmlText += "<pics><![CDATA[" + $("#Pic").val() + "]]></pics>";
    xmlText += "<usercity>" + userCity + "</usercity>";
    xmlText += "<rdoidentity>" + rdoidentity + "</rdoidentity>";
    xmlText += "<freetime><![CDATA[" + freetime + "]]></freetime>";
    xmlText += "</sendinfo>";
    url = "http://jianli.58.com/ajax/addresume/";
    xmlHttp.open("POST", url, true);
    xmlHttp.setRequestHeader("Conent-Type", "text/xml");
    xmlHttp.send(xmlText);
};
function backfunExpr() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            if (xmlHttp.responseText.indexOf("error:") != -1) {
                alert(xmlHttp.responseText.split(':')[1]);
            } else if (xmlHttp.responseText != "0") {
                var id = xmlHttp.responseText;
                var endDate = $("#spPosEndYear .txtyear").val() == "至今" ? "至今" : $("#spPosEndYear .txtyear").val() + " 年 " + $("#spPosEndMonth .txtmonth").val() + " 月";
                var str = "<input type=\"hidden\" value=\"" + $("#txtCompName").val() + "'" + $("#txtPositionName").val() + "'" + $("#spPosStatYear .txtyear").val() + "'" + $("#spPosStatMonth .txtmonth").val() + "'" + $("#spPosEndYear .txtyear").val() + "'" + $("#spPosEndMonth .txtmonth").val() + "'" + repLaceData($("#txtPerformance").val()) + "\" id=\"hidExpeVal" + id + "\">";
                str += "<li>";
                str += "<span class=\"editdisplay\"><a href=\"javascript:editExpe(" + id + ");\">修改</a> &nbsp;<a href=\"javascript:subformDel(backfunExpeDel," + id + ",&quot;resumeexpedel&quot;,'您确定要删除该工作经验吗？');\">删除</a></span>";
                str += $("#spPosStatYear .txtyear").val() + " 年 " + $("#spPosStatMonth .txtmonth").val() + " 月— " + endDate + " <span>|</span> " + $("#txtCompName").val() + " <span>|</span> " + $("#txtPositionName").val() + "</li><li>" + repLaceData($("#txtPerformance").val()).replace(/\n/g, "<br>").replace(/\r\n/g, "<br>") + "</li>";
                if (id == $("#hidUpExpeId").val()) {
                    $("#ulExpe" + id).html(str);
                } else {
                    str = "<ul id=\"ulExpe" + id + "\" class=\"worklist\">" + str + "</ul>";
                    if ($("#divExpe ul.worklist").length == 0) { $("#divExpe").prepend(str); updatePercentAge(20); } else { $("#divExpe ul.worklist").last().after(str); }
                }
                clearExpe();
                $("#tabModyExpe").hide();
                $("#tabAddExpe").show();
                changeIframeH();
            }
        }
    }
}
function clearExpe() {
    $("#hidUpExpeId").val(0);
    $("#txtCompName").val("");
    $("#txtPositionName").val("");
    $("#spPosStatYear .txtyear").val("");
    $("#spPosStatMonth .txtmonth").val("");
    $("#spPosEndYear .txtyear").val("");
    $("#spPosEndMonth .txtmonth").val("");
    $("#txtPerformance").val("");
    $("#spEnd").show();
}
function backfunExpeDel() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            if (xmlHttp.responseText.indexOf("error:") != -1) {
                alert(xmlHttp.responseText.split(':')[1]);
            } else if (xmlHttp.responseText != "0") {
                $("#ulExpe" + xmlHttp.responseText).remove();
                if ($("#hidUpExpeId").val() == xmlHttp.responseText) {
                    $("#hidUpExpeId").val(0);
                }
                if ($("#divExpe ul.worklist").length == 0) {
                    location.href = location.href;
                }
            }
        }
    }
}
function subformExpr(callback) {
    if (!infomationvalidate2()) {
        return;
    }
    var updateid = $("#hidUpExpeId").val();
    var ecompname = $("#txtCompName").val();
    var edpid = 0; //$("#hidSPC3").val();
    var epositionname = $("#txtPositionName").val();
    var esalary = 0; //$("#positionSalary").val();
    var epsdate = $("#spPosStatYear .txtyear").val() + "-" + $("#spPosStatMonth .txtmonth").val() + "-" + "01";
    var epedate = $("#spPosEndYear .txtyear").val() + "-" + $("#spPosEndMonth .txtmonth").val() + "-" + "01";
    if ($("#spPosEndYear .txtyear").val() == "至今") {
        epedate = "3000-01-01";
    }
    var eperformance = $("#txtPerformance").val();
    CreateXmlHttpRequest();
    xmlHttp.onreadystatechange = callback;

    var xmlText = '<?xml version="1.0" encoding="UTF-8"?>';
    xmlText += "<sendinfo>";
    xmlText += "<operate>resumeexpe</operate>";
    xmlText += "<resumeid>" + $("#hidresume").val() + "</resumeid>";
    xmlText += "<updateid>" + updateid + "</updateid>";
    xmlText += "<ecompname><![CDATA[" + repLaceData(ecompname) + "]]></ecompname>";
    xmlText += "<edpid>" + edpid + "</edpid>";
    xmlText += "<epositionname><![CDATA[" + repLaceData(epositionname) + "]]></epositionname>";
    xmlText += "<esalary>" + esalary + "</esalary>";
    xmlText += "<epsdate>" + epsdate + "</epsdate>";
    xmlText += "<epedate>" + epedate + "</epedate>";
    xmlText += "<eperformance><![CDATA[" + repLaceData(eperformance) + "]]></eperformance>";
    xmlText += "</sendinfo>";
    url = "http://jianli.58.com/ajax/addresume/";
    xmlHttp.open("POST", url, true);
    xmlHttp.setRequestHeader("Conent-Type", "text/xml");
    xmlHttp.send(xmlText);
};
function backfunEdu() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            if (xmlHttp.responseText.indexOf("error:") != -1) {
                alert(xmlHttp.responseText.split(':')[1]);
            } else if (xmlHttp.responseText != "0") {
                var id = xmlHttp.responseText;
                var endDate = $("#spEduEndYear .txtyear").val() == "至今" ? "至今" : $("#spEduEndYear .txtyear").val() + " 年 " + $("#spEduEndMonth .txtmonth").val() + " 月";
                var str = "<input type=\"hidden\" value=\"" + $("#txtSchool").val() + "'" + $("#txtProfessional").val() + "'" + $("#spEduStatYear .txtyear").val() + "'" + $("#spEduStatMonth .txtmonth").val() + "'" + $("#spEduEndYear .txtyear").val() + "'" + $("#spEduEndMonth .txtmonth").val() + "\" id=\"hidEducVal" + id + "\">";
                str += "<li>";
                str += "<span class=\"editdisplay\"><a href=\"javascript:editEduc(" + id + ");\">修改</a> &nbsp;<a href=\"javascript:subformDel(backfunEduDel," + id + ",&quot;resumeeducdel&quot;,'您确定要删除该教育经历吗？');\">删除</a></span>";
                str += $("#spEduStatYear .txtyear").val() + " 年 " + $("#spEduStatMonth .txtmonth").val() + " 月— " + endDate + " <span>|</span> " + $("#txtSchool").val() + " <span>|</span> " + $("#txtProfessional").val() + "</li>";
                if (id == $("#hidUpEducId").val()) {
                    $("#ulEdu" + id).html(str);
                } else {
                    str = "<ul id=\"ulEdu" + id + "\" class=\"worklist\">" + str + "</ul>";
                    if ($("#divEduc ul.worklist").length == 0) { $("#divEduc").prepend(str); updatePercentAge(20); } else { $("#divEduc ul.worklist").last().after(str); }
                }
                clearEduc();
                $("#tabModyEduc").hide();
                $("#tabAddEduc").show();
            }
        }
    }
};
function clearEduc() {
    $("#hidUpEducId").val(0);
    $("#txtSchool").val("");
    $("#txtProfessional").val("");
    $("#spEduStatYear .txtyear").val("");
    $("#spEduStatMonth .txtmonth").val("");
    $("#spEduEndYear .txtyear").val("");
    $("#spEduEndMonth .txtmonth").val("");
    $("#spEduEnd").show();
};
function backfunEduDel() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            if (xmlHttp.responseText.indexOf("error:") != -1) {
                alert(xmlHttp.responseText.split(':')[1]);
            } else if (xmlHttp.responseText != "0") {
                $("#ulEdu" + xmlHttp.responseText).remove();
                if ($("#hidUpEducId").val() == xmlHttp.responseText) {
                    $("#hidUpEducId").val(0);
                }
                if ($("#divEduc ul.worklist").length == 0) { updatePercentAge(-20); }
            }
        }
    }
};
function subformEdu(callback) {
    if (!infomationvalidate3()) {
        return;
    }
    var updateid = $("#hidUpEducId").val();
    var eshool = $("#txtSchool").val();
    var eprofessional = $("#txtProfessional").val();
    var esdate = $("#spEduStatYear .txtyear").val() + "-" + $("#spEduStatMonth .txtmonth").val() + "-" + "01";
    var eedate = $("#spEduEndYear .txtyear").val() + "-" + $("#spEduEndMonth .txtmonth").val() + "-" + "01";
    if ($("#spEduEndYear .txtyear").val() == "至今") {
        eedate = "3000-01-01";
    }
    CreateXmlHttpRequest();
    xmlHttp.onreadystatechange = callback;

    var xmlText = '<?xml version="1.0" encoding="UTF-8"?>';
    xmlText += "<sendinfo>";
    xmlText += "<operate>resumeeduc</operate>";
    xmlText += "<resumeid>" + $("#hidresume").val() + "</resumeid>";
    xmlText += "<updateid>" + updateid + "</updateid>";
    xmlText += "<eshool><![CDATA[" + repLaceData(eshool) + "]]></eshool>";
    xmlText += "<eprofessional><![CDATA[" + repLaceData(eprofessional) + "]]></eprofessional>";
    xmlText += "<esdate>" + esdate + "</esdate>";
    xmlText += "<eedate>" + eedate + "</eedate>";
    xmlText += "</sendinfo>";
    url = "http://jianli.58.com/ajax/addresume/";
    xmlHttp.open("POST", url, true);
    xmlHttp.setRequestHeader("Conent-Type", "text/xml");
    xmlHttp.send(xmlText);
};
function backfunLang() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            if (xmlHttp.responseText.indexOf("error:") != -1) {
                alert(xmlHttp.responseText.split(':')[1]);
            } else if (xmlHttp.responseText != "0") {
                var id = xmlHttp.responseText;
                var str = "<input type=\"hidden\" value=\"" + $("#selLanguage").val() + "'" + $("#selLanguageLev").val() + "\" id=\"hidLangVal" + id + "\">";
                str += "<li>";
                str += "<span class=\"editdisplay\"><a href=\"javascript:editLang(" + id + ");\">修改</a> &nbsp;<a href=\"javascript:subformDel(backfunLangDel," + id + ",&quot;resumelangdel&quot;,'您确定要删除该语言技能吗？');\">删除</a></span>";
                str += $("#selLanguage").find("option:selected").text() + "：" + $("#selLanguageLev").find("option:selected").text() + "</li>";
                if (id == $("#hidUpLangId").val()) {
                    $("#ulLang" + id).html(str);
                } else {
                    str = "<ul id=\"ulLang" + id + "\" class=\"worklist\">" + str + "</ul>";
                    if ($("#divLang ul.worklist").length == 0) { $("#divLang div.one").after(str); updatePercentAge(10); } else { $("#divLang ul.worklist").last().after(str); }
                }
                clearLang();
                $("#tabModyLang").hide();
                $("#tabAddLang").show();
            }
        }
    }
};
function clearLang() {
    $("#hidUpLangId").val(0);
    $("#selLanguage").val("");
    $("#selLanguageLev").val("");
};
function backfunLangDel() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            if (xmlHttp.responseText.indexOf("error:") != -1) {
                alert(xmlHttp.responseText.split(':')[1]);
            } else if (xmlHttp.responseText != "0") {
                $("#ulLang" + xmlHttp.responseText).remove();
                if ($("#hidUpLangId").val() == xmlHttp.responseText) {
                    $("#hidUpLangId").val(0);
                }
                if ($("#divLang ul.worklist").length == 0) { updatePercentAge(-10); }
            }
        }
    }
};
function subformLang(callback) {
    var updateid = $("#hidUpLangId").val();
    var language = $("#selLanguage").val();
    var langlev = $("#selLanguageLev").val();
    CreateXmlHttpRequest();
    xmlHttp.onreadystatechange = callback;

    var xmlText = '<?xml version="1.0" encoding="UTF-8"?>';
    xmlText += "<sendinfo>";
    xmlText += "<operate>resumelang</operate>";
    xmlText += "<resumeid>" + $("#hidresume").val() + "</resumeid>";
    xmlText += "<updateid>" + updateid + "</updateid>";
    xmlText += "<language>" + language + "</language>";
    xmlText += "<langlev>" + langlev + "</langlev>";
    xmlText += "</sendinfo>";
    url = "http://jianli.58.com/ajax/addresume/";
    xmlHttp.open("POST", url, true);
    xmlHttp.setRequestHeader("Conent-Type", "text/xml");
    xmlHttp.send(xmlText);
};
function backfunCert() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            if (xmlHttp.responseText.indexOf("error:") != -1) {
                alert(xmlHttp.responseText.split(':')[1]);
            } else if (xmlHttp.responseText != "0") {
                var id = xmlHttp.responseText;
                var pichtml = "";
                if ($("#Pic1").val() != "") {
                    pichtml = " <span>|</span> <a target='_blank' href='http://pic.58.com" + $("#Pic1").val() + "'>证书图片</a>";
                }
                var str = "<input type=\"hidden\" value=\"" + $("#txtCertName").val() + "'" + $("#txtCertAuthority").val() + "'" + $("#spIssueYear .txtyear").val() + "'" + $("#spIssueMonth .txtmonth").val() + "'" + $("#Pic1").val() + "\" id=\"hidCertVal" + id + "\">";
                str += "<li>";
                str += "<span class='editdisplay'><a href=\"javascript:editCert(" + id + ");\">修改</a> &nbsp;<a href=\"javascript:subformDel(backfunCertDel," + id + ",&quot;resumecertdel&quot;,'您确定要删除该专业证书吗？');\">删除</a></span>";
                str += $("#txtCertName").val() + " <span>|</span> " + $("#txtCertAuthority").val() + " <span>|</span> " + $("#spIssueYear .txtyear").val() + " 年 " + $("#spIssueMonth .txtmonth").val() + " 月" + pichtml + "</li>";
                if (id == $("#hidUpCertId").val()) {
                    $("#ulCert" + id).html(str);
                } else {
                    str = "<ul id=\"ulCert" + id + "\" class=\"worklist\">" + str + "</ul>";
                    if ($("#divCert ul.worklist").length == 0) { $("#divCert").prepend(str); updatePercentAge(10); } else { $("#divCert ul.worklist").last().after(str); }
                }
                clearCert();
                $("#tabModyCert").hide();
                $("#tabAddCert").show();
            }
        }
    }
};
function clearCert() {
    $("#hidUpCertId").val(0);
    $("#txtCertName").val("");
    $("#txtCertAuthority").val("");
    $("#spIssueYear .txtyear").val("");
    $("#spIssueMonth .txtmonth").val("");
    $("#uploadPic1").val("");
    $("#Pic1").val("");
    $("#tdCert").html("<div id=\"uploadPic1\" class=\"uploadPic\" value=\"\"></div>");
    $.c.Uploader1.SavedNum = 0; //清零
    $.c.Uploader1.init();
};
function backfunCertDel() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            if (xmlHttp.responseText.indexOf("error:") != -1) {
                alert(xmlHttp.responseText.split(':')[1]);
            } else if (xmlHttp.responseText != "0") {
                $("#ulCert" + xmlHttp.responseText).remove();
                if ($("#hidUpCertId").val() == xmlHttp.responseText) {
                    $("#hidUpCertId").val(0);
                }
                if ($("#divCert ul.worklist").length == 0) { updatePercentAge(-10); }
            }
        }
    }
};
function subformCert(callback) {
    if (!infomationvalidate5()) {
        return;
    }
    var updateid = $("#hidUpCertId").val();
    var certname = $("#txtCertName").val();
    var certauthy = $("#txtCertAuthority").val();
    var cdate = $("#spIssueYear .txtyear").val() + "-" + $("#spIssueMonth .txtmonth").val() + "-" + "01";
    CreateXmlHttpRequest();
    xmlHttp.onreadystatechange = callback;

    var xmlText = '<?xml version="1.0" encoding="UTF-8"?>';
    xmlText += "<sendinfo>";
    xmlText += "<operate>resumecert</operate>";
    xmlText += "<resumeid>" + $("#hidresume").val() + "</resumeid>";
    xmlText += "<updateid>" + updateid + "</updateid>";
    xmlText += "<certname><![CDATA[" + repLaceData(certname) + "]]></certname>";
    xmlText += "<certauthy><![CDATA[" + repLaceData(certauthy) + "]]></certauthy>";
    xmlText += "<cdate>" + cdate + "</cdate>";
    xmlText += "<pics><![CDATA[" + $("#Pic1").val() + "]]></pics>";
    xmlText += "</sendinfo>";
    url = "http://jianli.58.com/ajax/addresume/";
    xmlHttp.open("POST", url, true);
    xmlHttp.setRequestHeader("Conent-Type", "text/xml");
    xmlHttp.send(xmlText);
};
function subformDel(callback, id, operate, title) {
    if (confirm(title)) {
        CreateXmlHttpRequest();
        xmlHttp.onreadystatechange = callback;
        var xmlText = '<?xml version="1.0" encoding="UTF-8"?>';
        xmlText += "<sendinfo><operate>" + operate + "</operate><resumeid>" + $("#hidresume").val() + "</resumeid><delid>" + id + "</delid></sendinfo>";
        url = "http://jianli.58.com/ajax/addresume/";
        xmlHttp.open("POST", url, true);
        xmlHttp.setRequestHeader("Conent-Type", "text/xml");
        xmlHttp.send(xmlText);
    }
};
function editExpe(id) {
    $("#tabModyExpe").show();
    $("#tabAddExpe").hide();
    $("#hidUpExpeId").val(id);
    var hidVal = $("#hidExpeVal" + id).val().split("'");
    $("#txtCompName").val(hidVal[0]);
    $("#txtPositionName").val(hidVal[1]);
    $("#spPosStatYear .txtyear").val(hidVal[2]);
    $("#spPosStatMonth .txtmonth").val(hidVal[3]);
    $("#spPosEndYear .txtyear").val(hidVal[4]);
    $("#spPosEndMonth .txtmonth").val(hidVal[5]);
    $("#txtPerformance").val(hidVal[6]);
    if (hidVal[4] == "至今") {
        $("#spEnd").hide();
    } else {
        $("#spEnd").show();
    }
    changeIframeH();
}
function editEduc(id) {
    $("#tabModyEduc").show();
    $("#tabAddEduc").hide();
    $("#hidUpEducId").val(id);
    var hidVal = $("#hidEducVal" + id).val().split("'");
    $("#txtSchool").val(hidVal[0]);
    $("#txtProfessional").val(hidVal[1]);
    $("#spEduStatYear .txtyear").val(hidVal[2]);
    $("#spEduStatMonth .txtmonth").val(hidVal[3]);
    $("#spEduEndYear .txtyear").val(hidVal[4]);
    $("#spEduEndMonth .txtmonth").val(hidVal[5]);
    if (hidVal[4] == "至今") {
        $("#spEduEnd").hide();
    } else {
        $("#spEduEnd").show();
    }
    changeIframeH();
};
function editLang(id) {
    $("#tabModyLang").show();
    $("#tabAddLang").hide();
    $("#hidUpLangId").val(id);
    var hidVal = $("#hidLangVal" + id).val().split("'");
    $("#selLanguage").attr("value", hidVal[0]);
    $("#selLanguageLev").attr("value", hidVal[1]);
    changeIframeH();
};
function editCert(id) {
    $("#tabModyCert").show();
    $("#tabAddCert").hide();
    $("#hidUpCertId").val(id);
    var hidVal = $("#hidCertVal" + id).val().split("'");
    $("#txtCertName").val(hidVal[0]);
    $("#txtCertAuthority").val(hidVal[1]);
    $("#spIssueYear .txtyear").val(hidVal[2]);
    $("#spIssueMonth .txtmonth").val(hidVal[3]);
    if (hidVal[4] != null && hidVal[4] != "") {
        $("#tdCert").html("<div id=\"uploadPic1\" class=\"uploadPic\" value=\"http://pic.58.com" + hidVal[4] + "\"></div>");
        $.c.Uploader1.SavedNum = 0; //清零
        $.c.Uploader1.init();
    }
    changeIframeH();
};
function repLaceData(source) {
    if (source != "") {
        source = replacestr(source, "'", "");
        return source.replace(/]]>/g, "");
    } else {
        return "";
    }
};
function replacestr(source, obj, target) {
    var reg = new RegExp(obj, "g");
    return (source.replace(reg, target));
};
function replaceUrl(source) {
    return (source.replace(/http[s]?:\/\/([\w\-\.]+)(:\d+)?([\w\-\.\/?%&=]*)?/ig, ""));
};
function PosCateIndexInit(n) {
    if ($("#hidSPCN" + n).val() != "") { $("#selPosCate" + n).find("span").text($("#hidSPCN" + n).val()); $("#selPosCate" + n).find("span").removeClass("c99"); }
    $("#selPosCate" + n).click(function() {
        if ($("#divPosCate" + n).css("display") == "none") {
            var h = $("#hidPC" + n).val();
            if (h == 0) {
                pushDPList(n, 0, 1);
            } else {
                pushDPList(n, h, 2, $("#hidPCN" + n).val());
            }
            $("#divPosCate" + n).show();
            $("#divPosCateU" + n).show();
        }
    });
};
function fillDPList(n, cataData, id, dp, name) {
    var str = "<table cellpadding='0' cellspacing='0' width='100%'>";
    if (dp == 2) {
        str += "<tr><td colspan='3' class='linetwo'><a href='javascript:setPosCateValue(" + n + "," + id + ",\"" + name + "\", 2);'>" + name + "</a> &nbsp; &nbsp; <a href='javascript:pushDPList(" + n + ",0, 1);' class='blacklink'>[返回选择其他类别]</a></td></tr>";
    }
    for (var i = 0; i < cataData.length; i++) {
        if (i % 3 == 0) {
            str += "<tr><td><a href='javascript:setPosCateValue(" + n + "," + cataData[i].id + ",\"" + cataData[i].name + "\"," + cataData[i].dp + ");'>" + cataData[i].name + "</a></td>";
        } else if (i % 3 == 2) {
            str += "<td><a href='javascript:setPosCateValue(" + n + "," + cataData[i].id + ",\"" + cataData[i].name + "\"," + cataData[i].dp + ");'>" + cataData[i].name + "</a></td></tr>";
        } else {
            str += "<td><a href='javascript:setPosCateValue(" + n + "," + cataData[i].id + ",\"" + cataData[i].name + "\"," + cataData[i].dp + ");'>" + cataData[i].name + "</a></td>";
        }
    }
    if (dp == 2) {
        if (str.lastIndexOf("</tr>") != (str.length - 5)) {
            str += "</tr>";
        }
    } else {
        if (str.lastIndexOf("</tr>") != (str.length - 5)) {
            str += "<td><a class='blacklink' href='javascript:clearPosCateValue(" + n + ");'>[不限]</a></td></tr>";
        } else {
            str += "<tr><td><a class='blacklink' href='javascript:clearPosCateValue(" + n + ");'>[不限]</a></td></tr>";
        }
    }
    str += "</table><div class=\"close_tip\">请直接点击下面职位类别进行选择。<a class=\"close\" href=\"javascript:hidPosCate('" + n + "')\">X</a></div>";
    $("#divPosCate" + n).html(str);
    DivSetVisible("divPosCate" + n, "DivShim" + n, true);
};
function pushDPList(n, id, dp, name) {
    var src = document.createElement("script");
    src.type = "text/javascript";
    src.src = "http://010.zp.com/ajax/getdispposcatelist/?n=" + n + "&pcid=" + id + "&dp=" + dp + "&t=1&name=" + encodeURIComponent(name);
    document.body.appendChild(src);
};
function setPosCateValue(n, id, name, dp) {
    if (dp == 2) {
        $("#selPosCate" + n).find("span").text(name);
        $("#selPosCate" + n).find("span").removeClass("c99");
        $("#hidSPC" + n).val(id);
        $("#hidSPCN" + n).val(name);
        $("#divPosCate" + n).hide();
        $("#divPosCateU" + n).hide();
        DivSetVisible("divPosCate" + n, "DivShim" + n, false);
        if (n == 1) { $("#txtTPosition").val(name); $("#txtTPosition").removeClass("wrongborder"); clearInfoMsg($("#txtTPositionInfo")); } else if (n == 2) { $("#txtPositionName2").val(name); $("#txtPositionName2").removeClass("wrongborder"); clearInfoMsg($("#txtPositionInfo2")); } else if (n == 3) { $("#txtPositionName").val(name); $("#txtPositionName").removeClass("wrongborder"); clearInfoMsg($("#txtPositionInfo")); }
    } else {
        $("#hidPC" + n).val(id);
        $("#hidPCN" + n).val(name);
        pushDPList(n, id, 2, name);
    }
};
function clearPosCateValue(n) {
    $("#selPosCate" + n).find("span").text("请选择职位类别");
    $("#selPosCate" + n).find("span").addClass("c99");
    $("#hidSPC" + n).val(0);
    $("#hidPC" + n).val(0);
    $("#hidPCN" + n).val("");
    $("#divPosCate" + n).hide();
    $("#divPosCateU" + n).hide();
    DivSetVisible("divPosCate" + n, "DivShim" + n, false);
};
function hidPosCate(n) {
    $("#divPosCate" + n).hide();
    $("#divPosCateU" + n).hide();
    DivSetVisible("divPosCate" + n, "DivShim" + n, false);
};
$(document).ready(function() {
    lc = $("#hidLC").val(); //改版后lc只要大于0，就显示语言和证书。第一次添加教育和工作，只能在Info框内添加
    $(".worklist").hover(function() {
        $(this).addClass("overcolor");
    }, function() {
        $(this).removeClass("overcolor");
    });
    if (lc == 0) {
        $("#divMInfo").show();
        $("#tabModyExpe").show();
        PosCateIndexInit(1);
        $("#txtLetter").val("可以在 个人能力、优势、性格、专长等方面进行自我描述");
        $("#txtLetter").addClass("c99");
    }
    if (lc > 0) {//至少填写完简单个人信息
        $("#btnInfo").val("保存基本信息").removeClass("btns");
        $("#btnInfo").parent(".butt").addClass("btn-v4");
        $("#divSInfo").show();
        $("#divExpe").show();
        //新增
        $("#divLang").show();
        $("#tabModyLang").show();
        $("#divCert").show();
        $("#tabModyCert").show();
        $("#divState").show();
        $("#divComplte").show();
        //只要生成了简历就显示
        $("#tabAddExpe").show();
        $("#divExpe").show();
        $("#tabAddEduc").show();
        $("#divEduc").show();
        setFreeTime();
        changeIframeH();
    }
    if (lc > 3) {//至少填写过语言
        $("#tabModyLang").hide();
        $("#tabAddLang").show();
        $("#btnCancelLang").show();
    }
    if (lc > 4) {//至少填写过证书
        $("#tabModyCert").hide();
        $("#tabAddCert").show();
        $("#btnCancelCert").show();
    }
    $("#btnOK").click(function() {
        var item = $("input[name='rdoState']:checked").val();
        var include = "&include=0";
        if ($("#rdoBaidu").attr("checked") == true) {
            include = "&include=1";
        }
        $.post("http://jianli.58.com/ajax/action_ajaxresume/?id=" + $("#hidresume").val() + "&type=state&openstate=" + item + include, function(data) {
            if (self != top) {
                location.href = "http://jianli.58.com/resuelist/";
                $(parent.window).scrollTop(0);
            } else {
                if (location.href.indexOf("type=postresume", 1) > 0) {
                    var url = window.location.href;
                    var count = url.indexOf("?");
                    var sum = url.length;
                    location.href = "http://jianli.58.com/resumetop/" + url.substr(count, sum - count); //由求职发布进来的
                } else {
                    location.href = "http://my.58.com/myseekjob/1/?menu=4";
                }
            }
        });
    });
    InitInfoDate();
    InitExpeDate();
    InitEduDate();
    InitCertDate();
    InitExpeDate2();
    InitEduDate2();
    $("#spInfoYear .txtyear").val($("#hidYear").val()); //默认出生日期
    $("#spInfoMonth .txtmonth").val($("#hidMonth").val());
    InitLive(); //初始化居住地
    if (parseInt($("#hidresume").val()) == 0) {
        removeAllTemp(); //初始化清空缓存
    }
    $("#txtLiveCity").click(function() {
        $("#divLiveCity").show();
        showFirstLive("");
        $("#divLiveArea").hide();
        $("#divLiveName").hide();
        DivSetVisible("divLiveCity", "DivShimC", true);
        DivSetVisible("divLiveArea", "DivShimA", false);
        DivSetVisible("divLiveName", "DivShimN", false);
    });
    $("#txtLiveArea").click(function() {
        if ($("#divLiveArea").html() == "") {
            showSecondLive(1, '北京');
        } else {
            $("#divLiveArea").show();
            $("#divLiveCity").hide();
            $("#divLiveName").hide();
            DivSetVisible("divLiveCity", "DivShimC", false);
            DivSetVisible("divLiveArea", "DivShimA", true);
            DivSetVisible("divLiveName", "DivShimN", false);
        }
    });
    $("#txtLiveName").click(function() {
        if ($("#divLiveName").html() == "") {
            if ($("#hidNowLive").attr("aid") == 0) {
                alert("请选择区域");
            } else {
                showThiLive($("#hidNowLive").attr("aid"), $("#hidNowLive").attr("aname"));
            }
        } else {
            $("#divLiveName").show();
            $("#divLiveCity").hide();
            $("#divLiveArea").hide();
            DivSetVisible("divLiveCity", "DivShimC", false);
            DivSetVisible("divLiveArea", "DivShimA", false);
            DivSetVisible("divLiveName", "DivShimN", true);
        }
    });
    //校验
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
    });
    $("#selGender").blur(function() {
        IsGenderValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#selGender").change(function() {
        $(this).removeClass("wrongborder");
    });
    $("#selEducation").focus(function() {
        var txtUserEducationInfo = $("#txtEducationInfo");
        txtUserEducationInfo.removeClass("wrong");
        txtUserEducationInfo.addClass("action");
        txtUserEducationInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">请选择最高学历</span><span class=\"action_po_bot\"></span></span>");
    });
    $("#selEducation").blur(function() {
        IsEducationValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#selEducation").change(function() {
        $(this).removeClass("wrongborder");
        if (parseInt($("#selEducation").val()) > 2 && parseInt($("#hidresume").val()) == 0) {
            $("#divTempEduc").show();
            $("#trEdu").show();
        } else {
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
            clearTempEduc();
        }
        if (lc == 0) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom); }
        changeIframeH();
    });
    $("#txtSchool2").focus(function() {
        var txtWorkExperienceInfo = $("#txtSchoolInfo2");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">4-15个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtSchool2").blur(function() {
        IsSchoolValidate2($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtProfessional2").focus(function() {
        var txtWorkExperienceInfo = $("#txtSchoolInfo2");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">2-20个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtProfessional2").blur(function() {
        IsProfessionalValidate2($(this));
        $(this).removeClass("actionborder");
    });
    $("#selWorked").change(function() {
        if (parseInt($("#selWorked").val()) > 0 && parseInt($("#hidresume").val()) == 0) {
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
            clearTempExpe();
        }
        if (lc == 0) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom); }
        changeIframeH();
    });
    $("#txtCompName2").focus(function() {
        var txtWorkExperienceInfo = $("#txtCompNameInfo2");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">2-30个字，只能填写汉字、字母、数字和（）</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtCompName2").blur(function() {
        IsCompNameValidate2($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtPositionName2").focus(function() {
        var txtWorkExperienceInfo = $("#txtPositionInfo2");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">职位名称为2-12个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtPositionName2").blur(function() {
        IsPositionNameValidate2($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtPerformance2").focus(function() {
        var txtWorkExperienceInfo = $("#txtPerformanceInfo2");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">10-1000个字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
        $(this).height(75);
    });
    $("#txtPerformance2").blur(function() {
        IsPerformanceValidate2($(this));
        $(this).removeClass("actionborder");
        $(this).height(35);
    });
    $("#txtResumeName").focus(function() {
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtResumeName").blur(function() {
        IsResumeNameValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtLetter").focus(function() {
        var txtWorkExperienceInfo = $("#txtLetterInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">内容应在5~300个字之间，不能填写电话、QQ等联系方式</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
        if ($(this).val() == "可以在 个人能力、优势、性格、专长等方面进行自我描述") {
            $(this).val("");
            $(this).removeClass("c99");
        }
        $(this).height(75);
        changeIframeH();
    });
    $("#txtLetter").blur(function() {
        isExperienceValidate($(this));
        $(this).removeClass("actionborder");
        $(this).height(35);
    });
    $("#txtLetter").bind("keyup change", lettercount);
    $("#txtTPosition").focus(function() {
        var txtWorkExperienceInfo = $("#txtTPositionInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">职位名称为2-12个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtTPosition").blur(function() {
        IsTPositionNameValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtCompName").focus(function() {
        var txtWorkExperienceInfo = $("#txtCompNameInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">2-30个字，只能填写汉字、字母、数字和（）</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtCompName").blur(function() {
        IsCompNameValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtPositionName").focus(function() {
        var txtWorkExperienceInfo = $("#txtPositionInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">职位名称为2-12个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtPositionName").blur(function() {
        IsPositionNameValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtPerformance").focus(function() {
        var txtWorkExperienceInfo = $("#txtPerformanceInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">10-1000个字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
        $(this).height(75);
    });
    $("#txtPerformance").blur(function() {
        IsPerformanceValidate($(this));
        $(this).removeClass("actionborder");
        $(this).height(35);
    });
    $("#txtSchool").focus(function() {
        var txtWorkExperienceInfo = $("#txtSchoolInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">4-15个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtSchool").blur(function() {
        IsSchoolValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtProfessional").focus(function() {
        var txtWorkExperienceInfo = $("#txtSchoolInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">2-20个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtProfessional").blur(function() {
        IsProfessionalValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtCertName").focus(function() {
        var txtWorkExperienceInfo = $("#txtCertNameInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">4-15个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtCertName").blur(function() {
        IsCertNameValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#txtCertAuthority").focus(function() {
        var txtWorkExperienceInfo = $("#txtCertAuthorityInfo");
        txtWorkExperienceInfo.removeClass("wrong");
        txtWorkExperienceInfo.addClass("action");
        txtWorkExperienceInfo.html("<span class=\"action_po\"><span class=\"action_po_top\">机构名称4-15个字，只能填写汉字、字母、数字</span><span class=\"action_po_bot\"></span></span>");
        $(this).removeClass("wrongborder");
        $(this).addClass("actionborder");
    });
    $("#txtCertAuthority").blur(function() {
        IsCertAuthorityValidate($(this));
        $(this).removeClass("actionborder");
    });
    $("#spEduStatYear .txtyear").change(function() {
        clearInfoMsg($("#educDateInfo"));
    });
    $("#spEduStatMonth .txtmonth").change(function() {
        clearInfoMsg($("#educDateInfo"));
    });
    $("#spEduEndYear .txtyear").change(function() {
        clearInfoMsg($("#educDateInfo"));
    });
    $("#spEduEndMonth .txtmonth").change(function() {
        clearInfoMsg($("#educDateInfo"));
    });
    $("#spPosStatYear .txtyear").change(function() {
        clearInfoMsg($("#posDateInfo"));
    });
    $("#spPosStatMonth .txtmonth").change(function() {
        clearInfoMsg($("#posDateInfo"));
    });
    $("#spPosEndYear .txtyear").change(function() {
        clearInfoMsg($("#posDateInfo"));
    });
    $("#spPosEndMonth .txtmonth").change(function() {
        clearInfoMsg($("#posDateInfo"));
    });
    $(".time_table input[type=checkbox]").click(function() {
        clearInfoMsg($("#txtFreeTimeInfo"));
    });
})
function DivSetVisible(divid, iframeid, state) {
    var DivRef = document.getElementById(divid); //弹出的div
    var IfrRef = document.getElementById(iframeid); //下面的iframe
    if (state) {
        DivRef.style.display = "block";
        IfrRef.style.width = DivRef.offsetWidth;
        IfrRef.style.height = DivRef.offsetHeight;
        //IfrRef.style.top = DivRef.style.top;
        //IfrRef.style.left = DivRef.style.left;
        IfrRef.style.zIndex = DivRef.style.zIndex - 1;
        IfrRef.style.display = "block";
    } else {
        DivRef.style.display = "none";
        IfrRef.style.display = "none";
    }
};
function changeIframeH() {
    if (parent.document.getElementById("ContainerFrame") != null) {
        parent.document.getElementById("ContainerFrame").style.height = this.document.body.scrollHeight + "px";
    }
};
var lettercount = function() {
    var count = $("#txtLetter").val().getContentLength();
    var n = 300 - count;
    n = n > 0 ? n : 0;
    $("#txtLetterInfo").html("<span class=\"action_po\"><span class=\"action_po_top\">5-300个字，您还可以输入<b class='red'>" + n + "</b>个字。</span><span class=\"action_po_bot\"></span></span>");
};
String.prototype.getContentLength = function() {
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
function InitInfoDate() {
    pushDateSelect("spInfoYear", 4, "<a href=\"#\" style=\"display:none\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spInfoMonth");
    var year = $("#spInfoYear .txtyear"), yearlist = $("#spInfoYear .zp_datediv");
    var month = $("#spInfoMonth .txtmonth"), monthlist = $("#spInfoMonth .zp_datediv");
    year.focus(function() { yearlist.show(); monthlist.hide(); }).click(function() { return false; });
    yearlist.click(function() { return false; });
    $("#spInfoYear .zp_datediv_list>a").click(function() {
        year.val($(this).text());
        year.blur();
        yearlist.hide();
        month.focus();
    });
    var tb1 = $("#spInfoYear .zp_datediv_title a");
    $(tb1[0]).click(function() {
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
    $(tb1[1]).click(function() {
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
    $(btns1[0]).click(function() {
    });
    $(btns1[1]).click(function() {
        year.val("");
    });
    $(btns1[2]).click(function() {
        yearlist.hide();
    });
    month.focus(function() {
        monthlist.show();
        yearlist.hide();
    }).click(function() { return false; });
    monthlist.click(function() { return false; });
    $("#spInfoMonth .zp_datediv_list>a").click(function() {
        month.val($(this).text());
        month.blur();
        monthlist.hide();
    });
    var btns2 = $("#spInfoMonth .zp_datediv_bottom a");
    $(btns2[0]).click(function() {
        month.val("");
    });
    $(btns2[1]).click(function() {
        monthlist.hide();
    });
    $(document).click(function() {
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
    startyear.focus(function() { startyearlist.show(); startmonthlist.hide(); endyearlist.hide(); endmonthlist.hide(); }).click(function() { return false; });
    startyearlist.click(function() { return false; });
    $("#spPosStatYear .zp_datediv_list>a").click(function() {
        startyear.val($(this).text());
        startyear.blur();
        startyearlist.hide();
        startmonth.focus();
        clearInfoMsg($("#posDateInfo"));
    });
    var tb1 = $("#spPosStatYear .zp_datediv_title a");
    $(tb1[0]).click(function() {
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
    $(tb1[1]).click(function() {
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
    $(btns1[0]).click(function() {
    });
    $(btns1[1]).click(function() {
        startyear.val("");
    });
    $(btns1[2]).click(function() {
        startyearlist.hide();
    });
    startmonth.focus(function() {
        startmonthlist.show();
        startyearlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    }).click(function() { return false; });
    startmonthlist.click(function() { return false; });
    $("#spPosStatMonth .zp_datediv_list>a").click(function() {
        startmonth.val($(this).text());
        startmonth.blur();
        startmonthlist.hide();
        clearInfoMsg($("#posDateInfo"));
    });
    var btns2 = $("#spPosStatMonth .zp_datediv_bottom a");
    $(btns2[0]).click(function() {
        startmonth.val("");
    });
    $(btns2[1]).click(function() {
        startmonthlist.hide();
    });
    endyear.focus(function() { endyearlist.show(); endmonthlist.hide(); startyearlist.hide(); startmonthlist.hide(); }).click(function() { return false; });
    endyearlist.click(function() { return false; });
    $("#spPosEndYear .zp_datediv_list>a").click(function() {
        endyear.val($(this).text());
        endyear.blur();
        endyearlist.hide();
        $("#spEnd").show();
        endmonth.focus();
        clearInfoMsg($("#posDateInfo"));
    });
    var tb1 = $("#spPosEndYear .zp_datediv_title a");
    $(tb1[0]).click(function() {
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
    $(tb1[1]).click(function() {
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
    $(btns1[0]).click(function() {
        endyear.val("至今");
        $("#spEnd").hide();
        endyearlist.hide();
        endmonthlist.hide();
        clearInfoMsg($("#posDateInfo"));
    });
    $(btns1[1]).click(function() {
        endyear.val("");
    });
    $(btns1[2]).click(function() {
        endyearlist.hide();
    });
    endmonth.focus(function() {
        endmonthlist.show();
        endyearlist.hide();
        startyearlist.hide();
        startmonthlist.hide();
    }).click(function() { return false; });
    endmonthlist.click(function() { return false; });
    $("#spPosEndMonth .zp_datediv_list>a").click(function() {
        endmonth.val($(this).text());
        endmonth.blur();
        endmonthlist.hide();
        clearInfoMsg($("#posDateInfo"));
    });
    var btns2 = $("#spPosEndMonth .zp_datediv_bottom a");
    $(btns2[0]).click(function() {
        endmonth.val("");
    });
    $(btns2[1]).click(function() {
        endmonthlist.hide();
    });
    $(document).click(function() {
        startyearlist.hide();
        startmonthlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    });
};
function InitEduDate() {
    pushDateSelect("spEduStatYear", 5, "<a href=\"#\" style=\"display:none\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spEduStatMonth");
    pushDateSelect("spEduEndYear", 5, "<a href=\"#\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spEduEndMonth");
    var startyear = $("#spEduStatYear .txtyear"), startyearlist = $("#spEduStatYear .zp_datediv");
    var startmonth = $("#spEduStatMonth .txtmonth"), startmonthlist = $("#spEduStatMonth .zp_datediv");
    var endyear = $("#spEduEndYear .txtyear"), endyearlist = $("#spEduEndYear .zp_datediv");
    var endmonth = $("#spEduEndMonth .txtmonth"), endmonthlist = $("#spEduEndMonth .zp_datediv");
    startyear.focus(function() { startyearlist.show(); startmonthlist.hide(); endyearlist.hide(); endmonthlist.hide(); }).click(function() { return false; });
    startyearlist.click(function() { return false; });
    $("#spEduStatYear .zp_datediv_list>a").click(function() {
        startyear.val($(this).text());
        startyear.blur();
        startyearlist.hide();
        startmonth.focus();
    });
    var tb1 = $("#spEduStatYear .zp_datediv_title a");
    $(tb1[0]).click(function() {
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
    $(tb1[1]).click(function() {
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
    $(btns1[0]).click(function() {
    });
    $(btns1[1]).click(function() {
        startyear.val("");
    });
    $(btns1[2]).click(function() {
        startyearlist.hide();
    });
    startmonth.focus(function() {
        startmonthlist.show();
        startyearlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    }).click(function() { return false; });
    startmonthlist.click(function() { return false; });
    $("#spEduStatMonth .zp_datediv_list>a").click(function() {
        startmonth.val($(this).text());
        startmonth.blur();
        startmonthlist.hide();
    });
    var btns2 = $("#spEduStatMonth .zp_datediv_bottom a");
    $(btns2[0]).click(function() {
        startmonth.val("");
    });
    $(btns2[1]).click(function() {
        startmonthlist.hide();
    });
    endyear.focus(function() { endyearlist.show(); endmonthlist.hide(); startyearlist.hide(); startmonthlist.hide(); }).click(function() { return false; });
    endyearlist.click(function() { return false; });
    $("#spEduEndYear .zp_datediv_list>a").click(function() {
        endyear.val($(this).text());
        endyear.blur();
        $("#spEduEnd").show();
        endyearlist.hide();
        endmonth.focus();
    });
    var tb1 = $("#spEduEndYear .zp_datediv_title a");
    $(tb1[0]).click(function() {
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
    $(tb1[1]).click(function() {
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
    $(btns1[0]).click(function() {
        endyear.val("至今");
        $("#spEduEnd").hide();
        endyearlist.hide();
        endmonthlist.hide();
        clearInfoMsg($("#educDateInfo"));
    });
    $(btns1[1]).click(function() {
        endyear.val("");
    });
    $(btns1[2]).click(function() {
        endyearlist.hide();
    });
    endmonth.focus(function() {
        endmonthlist.show();
        endyearlist.hide();
        startyearlist.hide();
        startmonthlist.hide();
    }).click(function() { return false; });
    endmonthlist.click(function() { return false; });
    $("#spEduEndMonth .zp_datediv_list>a").click(function() {
        endmonth.val($(this).text());
        endmonth.blur();
        endmonthlist.hide();
    });
    var btns2 = $("#spEduEndMonth .zp_datediv_bottom a");
    $(btns2[0]).click(function() {
        endmonth.val("");
    });
    $(btns2[1]).click(function() {
        endmonthlist.hide();
    });
    $(document).click(function() {
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
    year.focus(function() { yearlist.show(); monthlist.hide(); }).click(function() { return false; });
    yearlist.click(function() { return false; });
    $("#spIssueYear .zp_datediv_list>a").click(function() {
        year.val($(this).text());
        year.blur();
        yearlist.hide();
        month.focus();
    });
    var tb1 = $("#spIssueYear .zp_datediv_title a");
    $(tb1[0]).click(function() {
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
    $(tb1[1]).click(function() {
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
    $(btns1[0]).click(function() {
    });
    $(btns1[1]).click(function() {
        year.val("");
    });
    $(btns1[2]).click(function() {
        yearlist.hide();
    });
    month.focus(function() {
        monthlist.show();
        yearlist.hide();
    }).click(function() { return false; });
    monthlist.click(function() { return false; });
    $("#spIssueMonth .zp_datediv_list>a").click(function() {
        month.val($(this).text());
        month.blur();
        monthlist.hide();
    });
    var btns2 = $("#spIssueMonth .zp_datediv_bottom a");
    $(btns2[0]).click(function() {
        month.val("");
    });
    $(btns2[1]).click(function() {
        monthlist.hide();
    });
    $(document).click(function() {
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
    str += "<iframe id=\"DivShimY\" scrolling=\"no\" frameborder=\"0\" style=\"position:absolute; top:0px; left:0px; display:none;filter=progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);\"></iframe>";
    $("#" + pushspid).html(str);
}
function pushMonthSelect(pushspid) {
    var str = "<input class=\"txtmonth\" type=\"text\" size=\"2\" readonly=\"readonly\" />";
    str += "<div class=\"zp_datediv month\"><div class=\"zp_datediv_title\">请选择月份</div>";
    str += "<div class=\"zp_datediv_content\"><div class=\"zp_datediv_hidden\"><div class=\"zp_datediv_list current\">";
    str += "<a href=\"#\">1</a><a href=\"#\">2</a><a href=\"#\">3</a><a href=\"#\">4</a><a href=\"#\">5</a><a href=\"#\">6</a><a href=\"#\">7</a><a href=\"#\">8</a><a href=\"#\">9</a><a href=\"#\">10</a><a href=\"#\">11</a><a href=\"#\">12</a>";
    str += "</div></div></div><div class=\"zp_datediv_bottom\"><a href=\"#\">[清除]</a>　<a href=\"#\">[关闭]</a></div></div>";
    str += "<iframe id=\"DivShimM\" scrolling=\"no\" frameborder=\"0\" style=\"position:absolute; top:0px; left:0px; display:none;filter=progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);\"></iframe>";
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
        $.post("http://jianli.58.com/ajax/getareainfo/", { operate: "getareabyid", pid: cid }, function(data) {
            $("#divLiveArea").html(data);
        });
    } else if (str == "3") {
        $("#txtLiveCity").val($("#hidNowLive").attr("cname"));
        $("#txtLiveArea").val($("#hidNowLive").attr("aname"));
        $("#txtLiveName").val($("#hidNowLive").attr("nname"));
        var cid = $("#hidNowLive").attr("cid");
        $.post("http://jianli.58.com/ajax/getareainfo/", { operate: "getareabyid", pid: cid }, function(data) {
            $("#divLiveArea").html(data);
        });
        var aid = $("#hidNowLive").attr("aid");
        $.post("http://jianli.58.com/ajax/getareainfo/", { operate: "getnamebyid", pid: aid }, function(data) {
            if (data != "") {
                $("#divLiveName").html(data);
            }
        });
    }
};
function showFirstLive(zm) {
    if (zm == "") {
        var str = "<a href=\"javascript:hidLive('divLiveCity')\" class=\"close\">X</a><ul class=\"paixu\"><li class=\"select\">热门城市</li><li onclick=\"showFirstLive('a')\">A-C</li><li onclick=\"showFirstLive('d')\">D-G</li><li onclick=\"showFirstLive('h')\">H-J</li><li onclick=\"showFirstLive('k')\">K-N</li><li onclick=\"showFirstLive('p')\">P-T</li><li onclick=\"showFirstLive('w')\">W-Z</li></ul>";
        str += "<div class=\"clear\"></div><ul class=\"cities\"><li><a href=\"javascript:showSecondLive(1,'北京');\">北京</a></li><li><a href=\"javascript:showSecondLive(2,'上海');\">上海</a></li><li><a href=\"javascript:showSecondLive(18,'天津');\">天津</a></li><li><a href=\"javascript:showSecondLive(3,'广州');\">广州</a></li><li><a href=\"javascript:showSecondLive(202,'哈尔滨');\">哈尔滨</a></li><li><a href=\"javascript:showSecondLive(4,'深圳');\">深圳</a></li>";
        str += "<li><a href=\"javascript:showSecondLive(122,'青岛');\">青岛</a></li><li><a href=\"javascript:showSecondLive(342,'郑州');\">郑州</a></li><li><a href=\"javascript:showSecondLive(241,'石家庄');\">石家庄</a></li><li><a href=\"javascript:showSecondLive(158,'武汉');\">武汉</a></li><li><a href=\"javascript:showSecondLive(414,'长沙');\">长沙</a></li><li><a href=\"javascript:showSecondLive(5,'苏州');\">苏州</a></li><li><a href=\"javascript:showSecondLive(188,'沈阳');\">沈阳</a></li><li><a href=\"javascript:showSecondLive(172,'南京');\">南京</a></li><li><a href=\"javascript:showSecondLive(147,'大连');\">大连</a></li>";
        str += "<li><a href=\"javascript:showSecondLive(37,'重庆');\">重庆</a></li><li><a href=\"javascript:showSecondLive(102,'成都');\">成都</a></li><li><a href=\"javascript:showSecondLive(79,'杭州');\">杭州</a></li><li><a href=\"javascript:showSecondLive(265,'济南');\">济南</a></li><li><a href=\"javascript:showSecondLive(413,'东莞');\">东莞</a></li><li><a href=\"javascript:showSecondLive(483,'西安');\">西安</a></li><li><a href=\"javascript:showSecondLive(837,'合肥');\">合肥</a></li></ul>";
        str += "<div class=\"clear\"></div>";
        $("#divLiveCity").html(str);
        if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#divLiveCity").height()); }
        changeIframeH();
    } else {
        $.post("http://jianli.58.com/ajax/getareainfo/", { operate: 'getcitybyzm', zm: zm }, function(data) {
            $("#divLiveCity").html(data);
            if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#divLiveCity").height()); }
            changeIframeH();
        });
    }
};
function showSecondLive(pid, pname) {
    $.post("http://jianli.58.com/ajax/getareainfo/", { operate: "getareabyid", pid: pid }, function(data) {
        $("#divLiveArea").show();
        $("#divLiveName").hide();
        $("#divLiveName").html("");
        $("#divLiveArea").html(data);
        $("#divLiveCity").hide();
        DivSetVisible("divLiveCity", "DivShimC", false);
        DivSetVisible("divLiveArea", "DivShimA", true);
        DivSetVisible("divLiveName", "DivShimN", false);
        $("#txtLiveCity").val(pname);
        $("#txtLiveArea").val("区域"); $("#txtLiveArea").addClass("c99");
        $("#txtLiveName").val("商圈"); $("#txtLiveName").addClass("c99");
        $("#hidNowLive").attr("cid", pid).attr("cname", pname).attr("aid", "0").attr("aname", "").attr("nid", "0").attr("nname", "").val("1");
        if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#divLiveArea").height()); }
        changeIframeH();
    });
};
function showThiLive(pid, pname) {
    $.post("http://jianli.58.com/ajax/getareainfo/", { operate: "getnamebyid", pid: pid }, function(data) {
        if (data != "") {
            $("#spLiveName").show();
            $("#divLiveName").show();
            $("#divLiveName").html(data);
        }
        $("#divLiveArea").hide();
        DivSetVisible("divLiveArea", "DivShimA", false);
        DivSetVisible("divLiveName", "DivShimN", true);
        $("#txtLiveArea").val(pname); $("#txtLiveArea").removeClass("c99");
        $("#txtLiveName").val("商圈"); $("#txtLiveName").addClass("c99");
        $("#hidNowLive").attr("aid", pid).attr("aname", pname).attr("nid", "0").attr("nname", "").val("2");
        if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#divLiveName").height()); }
        changeIframeH();
    });
};
function finishLive(id, name) {
    $("#divLiveName").hide();
    DivSetVisible("divLiveName", "DivShimN", false);
    $("#txtLiveName").val(name); $("#txtLiveName").removeClass("c99");
    $("#hidNowLive").attr("nid", id).attr("nname", name).val("3");
    if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom); }
    changeIframeH();
};
function hidLive(id) {
    $("#" + id).hide();
    if (id == "divLiveCity") {
        DivSetVisible("divLiveCity", "DivShimC", false);
    } else if (id == "divLiveArea") {
        DivSetVisible("divLiveArea", "DivShimA", false);
    } else if (id == "divLiveName") {
        DivSetVisible("divLiveName", "DivShimN", false);
    }
    if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom); }
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
    if (lc < 2) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom); }
    changeIframeH();
};
function removeTemp(operate, tempcachename) {
    CreateXmlHttpRequest();
    var xmlText = '<?xml version="1.0" encoding="UTF-8"?>';
    xmlText += "<sendinfo><operate>" + operate + "</operate><tempcachename>" + tempcachename + "</tempcachename><resumeid>0</resumeid></sendinfo>";
    url = "http://jianli.58.com/ajax/addresume/";
    xmlHttp.open("POST", url, true);
    xmlHttp.setRequestHeader("Conent-Type", "text/xml");
    xmlHttp.send(xmlText);
};
function removeAllTemp() {
    CreateXmlHttpRequest();
    var xmlText = '<?xml version="1.0" encoding="UTF-8"?>';
    xmlText += "<sendinfo><operate>removealltemp</operate><resumeid>0</resumeid></sendinfo>";
    url = "http://jianli.58.com/ajax/addresume/";
    xmlHttp.open("POST", url, true);
    xmlHttp.setRequestHeader("Conent-Type", "text/xml");
    xmlHttp.send(xmlText);
};
function clearTempEduc() {
    $("#hidUpEducId2").val(0);
    $("#txtSchool2").val("");
    $("#txtProfessional2").val("");
    $("#spEduStatYear2 .txtyear").val("");
    $("#spEduStatMonth2 .txtmonth").val("");
    $("#spEduEndYear2 .txtyear").val("");
    $("#spEduEndMonth2 .txtmonth").val("");
    $("#spEduEnd2").show();
};
function clearTempExpe() {
    $("#hidUpExpeId2").val(0);
    $("#txtCompName2").val("");
    $("#txtPositionName2").val("");
    $("#spPosStatYear2 .txtyear").val("");
    $("#spPosStatMonth2 .txtmonth").val("");
    $("#spPosEndYear2 .txtyear").val("");
    $("#spPosEndMonth2 .txtmonth").val("");
    $("#txtPerformance2").val("");
    $("#spEnd2").show();
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
    startyear.focus(function() { startyearlist.show(); startmonthlist.hide(); endyearlist.hide(); endmonthlist.hide(); }).click(function() { return false; });
    startyearlist.click(function() { return false; });
    $("#spPosStatYear2 .zp_datediv_list>a").click(function() {
        startyear.val($(this).text());
        startyear.blur();
        startyearlist.hide();
        startmonth.focus();
        clearInfoMsg($("#posDateInfo2"));
    });
    var tb1 = $("#spPosStatYear2 .zp_datediv_title a");
    $(tb1[0]).click(function() {
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
    $(tb1[1]).click(function() {
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
    $(btns1[0]).click(function() {
    });
    $(btns1[1]).click(function() {
        startyear.val("");
    });
    $(btns1[2]).click(function() {
        startyearlist.hide();
    });
    startmonth.focus(function() {
        startmonthlist.show();
        startyearlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    }).click(function() { return false; });
    startmonthlist.click(function() { return false; });
    $("#spPosStatMonth2 .zp_datediv_list>a").click(function() {
        startmonth.val($(this).text());
        startmonth.blur();
        startmonthlist.hide();
        clearInfoMsg($("#posDateInfo2"));
    });
    var btns2 = $("#spPosStatMonth2 .zp_datediv_bottom a");
    $(btns2[0]).click(function() {
        startmonth.val("");
    });
    $(btns2[1]).click(function() {
        startmonthlist.hide();
    });
    endyear.focus(function() { endyearlist.show(); endmonthlist.hide(); startyearlist.hide(); startmonthlist.hide(); }).click(function() { return false; });
    endyearlist.click(function() { return false; });
    $("#spPosEndYear2 .zp_datediv_list>a").click(function() {
        endyear.val($(this).text());
        endyear.blur();
        endyearlist.hide();
        $("#spEnd2").show();
        endmonth.focus();
        clearInfoMsg($("#posDateInfo2"));
    });
    var tb1 = $("#spPosEndYear2 .zp_datediv_title a");
    $(tb1[0]).click(function() {
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
    $(tb1[1]).click(function() {
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
    $(btns1[0]).click(function() {
        endyear.val("至今");
        $("#spEnd2").hide();
        endyearlist.hide();
        endmonthlist.hide();
        clearInfoMsg($("#posDateInfo2"));
    });
    $(btns1[1]).click(function() {
        endyear.val("");
    });
    $(btns1[2]).click(function() {
        endyearlist.hide();
    });
    endmonth.focus(function() {
        endmonthlist.show();
        endyearlist.hide();
        startyearlist.hide();
        startmonthlist.hide();
    }).click(function() { return false; });
    endmonthlist.click(function() { return false; });
    $("#spPosEndMonth2 .zp_datediv_list>a").click(function() {
        endmonth.val($(this).text());
        endmonth.blur();
        endmonthlist.hide();
        clearInfoMsg($("#posDateInfo2"));
    });
    var btns2 = $("#spPosEndMonth2 .zp_datediv_bottom a");
    $(btns2[0]).click(function() {
        endmonth.val("");
    });
    $(btns2[1]).click(function() {
        endmonthlist.hide();
    });
    $(document).click(function() {
        startyearlist.hide();
        startmonthlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    });
};
function InitEduDate2() {
    pushDateSelect("spEduStatYear2", 5, "<a href=\"#\" style=\"display:none\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spEduStatMonth2");
    pushDateSelect("spEduEndYear2", 5, "<a href=\"#\">[<strong>至今</strong>]</a>　");
    pushMonthSelect("spEduEndMonth2");
    var startyear = $("#spEduStatYear2 .txtyear"), startyearlist = $("#spEduStatYear2 .zp_datediv");
    var startmonth = $("#spEduStatMonth2 .txtmonth"), startmonthlist = $("#spEduStatMonth2 .zp_datediv");
    var endyear = $("#spEduEndYear2 .txtyear"), endyearlist = $("#spEduEndYear2 .zp_datediv");
    var endmonth = $("#spEduEndMonth2 .txtmonth"), endmonthlist = $("#spEduEndMonth2 .zp_datediv");
    startyear.focus(function() { startyearlist.show(); startmonthlist.hide(); endyearlist.hide(); endmonthlist.hide(); }).click(function() { return false; });
    startyearlist.click(function() { return false; });
    $("#spEduStatYear2 .zp_datediv_list>a").click(function() {
        startyear.val($(this).text());
        startyear.blur();
        startyearlist.hide();
        startmonth.focus();
    });
    var tb1 = $("#spEduStatYear2 .zp_datediv_title a");
    $(tb1[0]).click(function() {
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
    $(tb1[1]).click(function() {
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
    $(btns1[0]).click(function() {
    });
    $(btns1[1]).click(function() {
        startyear.val("");
    });
    $(btns1[2]).click(function() {
        startyearlist.hide();
    });
    startmonth.focus(function() {
        startmonthlist.show();
        startyearlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    }).click(function() { return false; });
    startmonthlist.click(function() { return false; });
    $("#spEduStatMonth2 .zp_datediv_list>a").click(function() {
        startmonth.val($(this).text());
        startmonth.blur();
        startmonthlist.hide();
    });
    var btns2 = $("#spEduStatMonth2 .zp_datediv_bottom a");
    $(btns2[0]).click(function() {
        startmonth.val("");
    });
    $(btns2[1]).click(function() {
        startmonthlist.hide();
    });
    endyear.focus(function() { endyearlist.show(); endmonthlist.hide(); startyearlist.hide(); startmonthlist.hide(); }).click(function() { return false; });
    endyearlist.click(function() { return false; });
    $("#spEduEndYear2 .zp_datediv_list>a").click(function() {
        endyear.val($(this).text());
        endyear.blur();
        $("#spEduEnd2").show();
        endyearlist.hide();
        endmonth.focus();
    });
    var tb1 = $("#spEduEndYear2 .zp_datediv_title a");
    $(tb1[0]).click(function() {
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
    $(tb1[1]).click(function() {
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
    $(btns1[0]).click(function() {
        endyear.val("至今");
        $("#spEduEnd2").hide();
        endyearlist.hide();
        endmonthlist.hide();
        clearInfoMsg($("#educDateInfo2"));
    });
    $(btns1[1]).click(function() {
        endyear.val("");
    });
    $(btns1[2]).click(function() {
        endyearlist.hide();
    });
    endmonth.focus(function() {
        endmonthlist.show();
        endyearlist.hide();
        startyearlist.hide();
        startmonthlist.hide();
    }).click(function() { return false; });
    endmonthlist.click(function() { return false; });
    $("#spEduEndMonth2 .zp_datediv_list>a").click(function() {
        endmonth.val($(this).text());
        endmonth.blur();
        endmonthlist.hide();
    });
    var btns2 = $("#spEduEndMonth2 .zp_datediv_bottom a");
    $(btns2[0]).click(function() {
        endmonth.val("");
    });
    $(btns2[1]).click(function() {
        endmonthlist.hide();
    });
    $(document).click(function() {
        startyearlist.hide();
        startmonthlist.hide();
        endyearlist.hide();
        endmonthlist.hide();
    });
}
function addTempEduc() {
    $("#tabAddEduc2").hide();
    $("#tabModyEduc2").show();
    if ($("#divTempEduc ul.worklist").length > 0) {
        $("#btnCancelEdu2").show();
    }
    clearTempEduc();
    changeIframeH();
}
function cancelTempEdu() {
    $("#tabAddEduc2").show();
    $("#tabModyEduc2").hide();
    $("#btnCancelEdu2").hide();
    clearTempEduc();
    changeIframeH();
}
function addTempExpe() {
    $("#tabAddExpe2").hide();
    $("#tabModyExpe2").show();
    if ($("#divTempExpe ul.worklist").length > 0) {
        $("#btnCancelExpr2").show();
    }
    clearTempExpe();
    if (lc == 0) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#tabModyExpe2").height()); }
    changeIframeH();
}
function cancelTempExpr() {
    $("#tabAddExpe2").show();
    $("#tabModyExpe2").hide();
    $("#btnCancelExpr2").hide();
    clearTempExpe();
    if (lc == 0) { $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#tabModyExpe2").height()); }
    changeIframeH();
}
function subformTempEdu(callback) {
    if (!infomationvalidate32()) {
        return;
    }
    clearInfoMsg($("#txtEducationInfoSave"));
    var updateid = $("#hidUpEducId2").val();
    var eshool = $("#txtSchool2").val();
    var eprofessional = $("#txtProfessional2").val();
    var esdate = $("#spEduStatYear2 .txtyear").val() + "-" + $("#spEduStatMonth2 .txtmonth").val() + "-" + "01";
    var eedate = $("#spEduEndYear2 .txtyear").val() + "-" + $("#spEduEndMonth2 .txtmonth").val() + "-" + "01";
    if ($("#spEduEndYear2 .txtyear").val() == "至今") {
        eedate = "3000-01-01";
    }
    CreateXmlHttpRequest();
    xmlHttp.onreadystatechange = callback;

    var xmlText = '<?xml version="1.0" encoding="UTF-8"?>';
    xmlText += "<sendinfo>";
    xmlText += "<operate>tempresumeeduc</operate>";
    xmlText += "<resumeid>" + $("#hidresume").val() + "</resumeid>";
    xmlText += "<updateid>" + updateid + "</updateid>";
    xmlText += "<eshool><![CDATA[" + repLaceData(eshool) + "]]></eshool>";
    xmlText += "<eprofessional><![CDATA[" + repLaceData(eprofessional) + "]]></eprofessional>";
    xmlText += "<esdate>" + esdate + "</esdate>";
    xmlText += "<eedate>" + eedate + "</eedate>";
    xmlText += "</sendinfo>";
    url = "http://jianli.58.com/ajax/addresume/";
    xmlHttp.open("POST", url, true);
    xmlHttp.setRequestHeader("Conent-Type", "text/xml");
    xmlHttp.send(xmlText);
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
function backfunTempEdu() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            if (xmlHttp.responseText.indexOf("error:") != -1) {
                alert(xmlHttp.responseText.split(':')[1]);
            } else if (xmlHttp.responseText != "0") {
                var id = xmlHttp.responseText;
                var endDate = $("#spEduEndYear2 .txtyear").val() == "至今" ? "至今" : $("#spEduEndYear2 .txtyear").val() + " 年 " + $("#spEduEndMonth2 .txtmonth").val() + " 月";
                var str = "<input type=\"hidden\" value=\"" + $("#txtSchool2").val() + "'" + $("#txtProfessional2").val() + "'" + $("#spEduStatYear2 .txtyear").val() + "'" + $("#spEduStatMonth2 .txtmonth").val() + "'" + $("#spEduEndYear2 .txtyear").val() + "'" + $("#spEduEndMonth2 .txtmonth").val() + "\" id=\"hid2EducVal" + id + "\">";
                str += "<li>";
                str += "<span class=\"editdisplay\"><a href=\"javascript:editTempEduc(" + id + ");\">修改</a> &nbsp;<a href=\"javascript:subformDel(backfunTempEduDel," + id + ",&quot;tempresumeeducdel&quot;,'您确定要删除该教育经历吗？');\">删除</a></span>";
                str += $("#spEduStatYear2 .txtyear").val() + " 年 " + $("#spEduStatMonth2 .txtmonth").val() + " 月— " + endDate + " <span>|</span> " + $("#txtSchool2").val() + " <span>|</span> " + $("#txtProfessional2").val() + "</li>";
                if (id == $("#hidUpEducId2").val()) {
                    $("#ul2Edu" + id).html(str);
                } else {
                    str = "<ul id=\"ul2Edu" + id + "\" class=\"worklist\">" + str + "</ul>";
                    if ($("#divTempEduc ul.worklist").length == 0) { $("#divTempEduc").prepend(str); } else { $("#divTempEduc ul.worklist").last().after(str); }
                }
                clearTempEduc();
                $("#tabModyEduc2").hide();
                $("#tabAddEduc2").show();
                $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom);
                changeIframeH();
            }
        }
    }
};
function editTempEduc(id) {
    $("#tabModyEduc2").show();
    if ($("#divTempEduc ul.worklist").length > 1) {
        $("#btnCancelEdu2").show();
    }
    $("#tabAddEduc2").hide();
    $("#hidUpEducId2").val(id);
    var hidVal = $("#hid2EducVal" + id).val().split("'");
    $("#txtSchool2").val(hidVal[0]);
    $("#txtProfessional2").val(hidVal[1]);
    $("#spEduStatYear2 .txtyear").val(hidVal[2]);
    $("#spEduStatMonth2 .txtmonth").val(hidVal[3]);
    $("#spEduEndYear2 .txtyear").val(hidVal[4]);
    $("#spEduEndMonth2 .txtmonth").val(hidVal[5]);
    if (hidVal[4] == "至今") {
        $("#spEduEnd2").hide();
    } else {
        $("#spEduEnd2").show();
    }
    $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#divLiveCity").height());
    changeIframeH();
};
function backfunTempEduDel() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            if (xmlHttp.responseText.indexOf("error:") != -1) {
                alert(xmlHttp.responseText.split(':')[1]);
            } else if (xmlHttp.responseText != "0") {
                $("#ul2Edu" + xmlHttp.responseText).remove();
                if ($("#divTempEduc ul.worklist").length == 0) {
                    $("#tabAddEduc2").hide();
                    $("#tabModyEduc2").show();
                    $("#btnCancelEdu2").hide();
                }
                if ($("#hidUpEducId2").val() == xmlHttp.responseText) {
                    $("#hidUpEducId2").val(0);
                }
                $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom);
            }
        }
    }
};
function backfunTempExpr() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            if (xmlHttp.responseText.indexOf("error:") != -1) {
                alert(xmlHttp.responseText.split(':')[1]);
            } else if (xmlHttp.responseText != "0") {
                var id = xmlHttp.responseText;
                var endDate = $("#spPosEndYear2 .txtyear").val() == "至今" ? "至今" : $("#spPosEndYear2 .txtyear").val() + " 年 " + $("#spPosEndMonth2 .txtmonth").val() + " 月";
                var str = "<input type=\"hidden\" value=\"" + $("#txtCompName2").val() + "'" + $("#txtPositionName2").val() + "'" + $("#spPosStatYear2 .txtyear").val() + "'" + $("#spPosStatMonth2 .txtmonth").val() + "'" + $("#spPosEndYear2 .txtyear").val() + "'" + $("#spPosEndMonth2 .txtmonth").val() + "'" + repLaceData($("#txtPerformance2").val()) + "\" id=\"hidExpe2Val" + id + "\">";
                str += "<li>";
                str += "<span class=\"editdisplay\"><a href=\"javascript:editTempExpe(" + id + ");\">修改</a> &nbsp;<a href=\"javascript:subformDel(backfunTempExpeDel," + id + ",&quot;tempresumeexpedel&quot;,'您确定要删除该工作经验吗？');\">删除</a></span>";
                str += $("#spPosStatYear2 .txtyear").val() + " 年 " + $("#spPosStatMonth2 .txtmonth").val() + " 月— " + endDate + " <span>|</span> " + $("#txtCompName2").val() + " <span>|</span> " + $("#txtPositionName2").val() + "</li><li>" + repLaceData($("#txtPerformance2").val()).replace(/\n/g, "<br>").replace(/\r\n/g, "<br>") + "</li>";
                if (id == $("#hidUpExpeId2").val()) {
                    $("#ul2Expe" + id).html(str);
                } else {
                    str = "<ul id=\"ul2Expe" + id + "\" class=\"worklist\">" + str + "</ul>";
                    if ($("#divTempExpe ul.worklist").length == 0) { $("#divTempExpe").prepend(str); } else { $("#divTempExpe ul.worklist").last().after(str); }
                }
                clearTempExpe();
                $("#tabModyExpe2").hide();
                $("#tabAddExpe2").show();
                $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom);
                changeIframeH();
            }
        }
    }
};
function backfunTempExpeDel() {
    if (xmlHttp.readyState == 4) {
        if (xmlHttp.status == 200) {
            if (xmlHttp.responseText.indexOf("error:") != -1) {
                alert(xmlHttp.responseText.split(':')[1]);
            } else if (xmlHttp.responseText != "0") {
                $("#ul2Expe" + xmlHttp.responseText).remove();
                if ($("#divTempExpe ul.worklist").length == 0) {
                    $("#tabAddExpe2").hide();
                    $("#tabModyExpe2").show();
                    $("#btnCancelExpr2").hide();
                }
                if ($("#hidUpExpeId2").val() == xmlHttp.responseText) {
                    $("#hidUpExpeId2").val(0);
                }
                $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom);
            }
        }
    }
};
function subformTempExpr(callback) {
    if (!infomationvalidate22()) {
        return;
    }
    clearInfoMsg($("#txtWorkedInfoSave"));
    var updateid = $("#hidUpExpeId2").val();
    var ecompname = $("#txtCompName2").val();
    var edpid = 0; //$("#hidSPC2").val();
    var epositionname = $("#txtPositionName2").val();
    var esalary = 0; //$("#positionSalary2").val();
    var epsdate = $("#spPosStatYear2 .txtyear").val() + "-" + $("#spPosStatMonth2 .txtmonth").val() + "-" + "01";
    var epedate = $("#spPosEndYear2 .txtyear").val() + "-" + $("#spPosEndMonth2 .txtmonth").val() + "-" + "01";
    if ($("#spPosEndYear2 .txtyear").val() == "至今") {
        epedate = "3000-01-01";
    }
    var eperformance = $("#txtPerformance2").val();
    CreateXmlHttpRequest();
    xmlHttp.onreadystatechange = callback;

    var xmlText = '<?xml version="1.0" encoding="UTF-8"?>';
    xmlText += "<sendinfo>";
    xmlText += "<operate>tempresumeexpe</operate>";
    xmlText += "<resumeid>" + $("#hidresume").val() + "</resumeid>";
    xmlText += "<updateid>" + updateid + "</updateid>";
    xmlText += "<ecompname><![CDATA[" + repLaceData(ecompname) + "]]></ecompname>";
    xmlText += "<edpid>" + edpid + "</edpid>";
    xmlText += "<epositionname><![CDATA[" + repLaceData(epositionname) + "]]></epositionname>";
    xmlText += "<esalary>" + esalary + "</esalary>";
    xmlText += "<epsdate>" + epsdate + "</epsdate>";
    xmlText += "<epedate>" + epedate + "</epedate>";
    xmlText += "<eperformance><![CDATA[" + repLaceData(eperformance) + "]]></eperformance>";
    xmlText += "</sendinfo>";
    url = "http://jianli.58.com/ajax/addresume/";
    xmlHttp.open("POST", url, true);
    xmlHttp.setRequestHeader("Conent-Type", "text/xml");
    xmlHttp.send(xmlText);
};
function infomationvalidate22() {
    if (!IsCompNameValidate2($("#txtCompName2"))) {
        return false;
    }
    if (!IsPositionNameValidate2($("#txtPositionName2"))) {
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
function editTempExpe(id) {
    $("#tabModyExpe2").show();
    if ($("#divTempExpe ul.worklist").length > 1) {
        $("#btnCancelExpr2").show();
    }
    $("#tabAddExpe2").hide();
    $("#hidUpExpeId2").val(id);
    var hidVal = $("#hidExpe2Val" + id).val().split("'");
    $("#txtCompName2").val(hidVal[0]);
    $("#txtPositionName2").val(hidVal[1]);
    $("#spPosStatYear2 .txtyear").val(hidVal[2]);
    $("#spPosStatMonth2 .txtmonth").val(hidVal[3]);
    $("#spPosEndYear2 .txtyear").val(hidVal[4]);
    $("#spPosEndMonth2 .txtmonth").val(hidVal[5]);
    $("#txtPerformance2").val(hidVal[6]);
    if (hidVal[4] == "至今") {
        $("#spEnd2").hide();
    } else {
        $("#spEnd2").show();
    }
    $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#divLiveCity").height());
    changeIframeH();
}
function getFreeTime() {
    var str = "";
    for (var i = 1; i < 8; i++) {
        if ($("#chk_" + i + "_1").attr("checked") == true && $("#chk_" + i + "_2").attr("checked") == true) {
            str += i + "$3,";
        } else if ($("#chk_" + i + "_1").attr("checked") == true) {
            str += i + "$1,";
        } else if ($("#chk_" + i + "_2").attr("checked") == true) {
            str += i + "$2,";
        } else {
            str += i + "$0,";
        }
    }
    if (str.length > 0) str = str.substring(0, str.length - 1);
    return str;
}
function setFreeTime() {
    var str = $(".time_table").attr("selval");
    if (str.length == 0) return;
    var strs = str.split(',');
    $(strs).each(function(i, n) {
        var s = n.split('$')[1];
        if (s == "3") {
            $("#chk_" + (i + 1) + "_1").attr("checked", true);
            $("#chk_" + (i + 1) + "_2").attr("checked", true);
        } else if (s == "2") {
            $("#chk_" + (i + 1) + "_2").attr("checked", true);
        } else if (s == "1") {
            $("#chk_" + (i + 1) + "_1").attr("checked", true);
        }
    });
}
function updatePercentAge(num) {
    if ($("#paNum").length) {
        var n = replacestr($("#paNum").html(), "%", "");
        var newN = parseInt(n) + parseInt(num);
        if (newN > 100) { newN = 100; }
        if (newN < 0) { newN = 0; }
        $("#paNum").html(newN + "%");
        $("#paPic").css("width", newN + "%");
    }
}