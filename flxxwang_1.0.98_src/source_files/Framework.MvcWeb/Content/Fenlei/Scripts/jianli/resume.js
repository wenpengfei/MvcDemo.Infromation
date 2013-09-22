var lc = 0;
//function subform1(callback) {
//    if (!infomationvalidate1()) {
//        return;
//    }
//};


$(document).ready(function() {

});




function subformTempEdu(callback) {
    if (!infomationvalidate32()) {
        return;
    }
    
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

function subformTempExpr(callback) {
    if (!infomationvalidate22()) {
        return;
    }
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