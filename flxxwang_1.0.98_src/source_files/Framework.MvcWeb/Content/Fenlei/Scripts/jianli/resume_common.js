
//公共的js
var resumePart = { basic: 1, tempEdu: 2, tempWork: 3, Edu: 4, Work: 5, Lang: 6, Cert: 7 };
var resume = null;
var userid=parseInt($f.cookie.get("userId"),10);
$(function () {
    initResume(null);
    $("#selPosCate1").find("span").click(function () {
        initJobCategories($("#selPosCate1"));
    });
    $("#selPosCate2").find("span").click(function () {
        initJobCategories($("#selPosCate2"));
    });
    $("#selPosCate3").find("span").click(function () {
        initJobCategories($("#selPosCate3"));
    });


    $("#btnInfo").click(
    function () {
        if (infomationvalidate1()) {
            saveResume();
        }
    }
    );

    $("#btnOK").click(function () {
        resume.PublicState = parseInt($("input[name='rdoState']:checked").val(), 10);
        //$("#rdoBaidu").attr("checked")
        save();
    });
});

    
function initResume(initPart) {
    var __resume = new Resume();
    __resume._ignoreP = true;
    __resume._post("DataSelect", [userid, resumeType], function (data, textStatus, jqXHR) {

        if (data != null) {
            resume = new $f.model(null, data);
            if (initPart == null) {
                $("#hidresume").val(resume.Id); //标记是编辑时进来的，还是添加时进来的.
            }
            //resume.prototype = new $f.model(new Resume()._type);
            if (initPart == null || initPart == resumePart.basic) {
                $("#divMInfo").hide();
                $("#divSInfo").show();
                $("#ulSInfo li:eq(0)").html("<strong>" + resume.Name + "</strong>(" + resume.SexName + "，" + resume.Age + "岁)");
                $("#ulSInfo li:eq(1)").html($("#ulSInfo li:eq(1) i")[0].outerHTML + resume.Phone); 
                $("#ulSInfo li:eq(2)").html($("#ulSInfo li:eq(2) i")[0].outerHTML + resume.Email); 
                $("#ulSInfo li:eq(3)").html($("#ulSInfo li:eq(3) i")[0].outerHTML + resume.NowCity.ShortName); 
                $("#ulSInfo li:eq(4)").html($("#ulSInfo li:eq(4) i")[0].outerHTML + resume.EducationName); 
                //工作经验
                $("#ulSInfo li:eq(5)").html($("#ulSInfo li:eq(5) i")[0].outerHTML); //.append(resume.WorkYearStart + "-" + resume.WorkYearEnd);
                if (resume.WorkYearStart == 0 && resume.WorkYearEnd == 0) {
                    $("#ulSInfo li:eq(5)").html($("#ulSInfo li:eq(5)").html() + "(无经验)");
                }
                else if (resume.WorkYearStart > resume.WorkYearEnd) {
                    $("#ulSInfo li:eq(5)").html($("#ulSInfo li:eq(5)").html() + "(" + resume.WorkYearStart + "年以上)");
                }
                else {
                    $("#ulSInfo li:eq(5)").html($("#ulSInfo li:eq(5)").html() + "(" + resume.WorkYearStart + "-" + resume.WorkYearEnd + "年)");
                }
                //求职职位
                $("#ulSInfo li:eq(6)").html($("#ulSInfo li:eq(6) i")[0].outerHTML + resume.JobName); // .append(resume.JobName);
                if (resume.WageMin == 0 && resume.WageMax == 0) {
                    $("#ulSInfo li:eq(6)").html($("#ulSInfo li:eq(6)").html() + "(面议)");
                }
                else if (resume.WageMin > resume.WageMax) {
                    $("#ulSInfo li:eq(6)").html($("#ulSInfo li:eq(6)").html() + "(" + resume.WageMin + "元以上/月)");
                }
                else if (resume.WageMin == 0) {
                    $("#ulSInfo li:eq(6)").html($("#ulSInfo li:eq(6)").html() + "(" + resume.WageMax + "元以下/月)");
                }
                else {
                    $("#ulSInfo li:eq(6)").html($("#ulSInfo li:eq(6)").html() + "(" + resume.WageMin + "-" + resume.WageMax + "元/月)");
                }
                //目前职位
                if (resume.CurrentJob == null) {
                    $("#ulSInfo li:eq(7)").html($("#ulSInfo li:eq(7) i")[0].outerHTML + "未填写");
                }
                else {
                    $("#ulSInfo li:eq(7)").html($("#ulSInfo li:eq(7) i")[0].outerHTML + resume.CurrentJob.JobName);
                    if (resume.CurrentJob.WageMin == 0 && resume.CurrentJob.WageMax == 0) {
                        $("#ulSInfo li:eq(7)").html($("#ulSInfo li:eq(7)").html() + "(保密)");
                    }
                    else if (resume.CurrentJob.WageMin > resume.CurrentJob.WageMax) {
                        $("#ulSInfo li:eq(7)").html($("#ulSInfo li:eq(7)").html() + "(" + resume.CurrentJob.WageMin + "元以上/月)");
                    }
                    else if (resume.CurrentJob.WageMin == 0) {
                        $("#ulSInfo li:eq(7)").html($("#ulSInfo li:eq(7)").html() + "(" + resume.CurrentJob.WageMax + "元以下/月)");
                    }
                    else {
                        $("#ulSInfo li:eq(7)").html($("#ulSInfo li:eq(7)").html() + "(" + resume.CurrentJob.WageMin + "-" + resume.CurrentJob.WageMax + "元/月)");
                    }
                }

                $("#ulSInfo li:eq(8)").find("span").html(resume.AboutMe);

                if (resumeType == 2) {//兼职

                    var _freeTime = '<table cellpadding="0" cellspacing="0" class="time">';
                    _freeTime += '<tr><th class="tg">&nbsp;</th><th class="tg">星期一</th><th class="tg">星期二</th><th class="tg">星期三</th><th class="tg">星期四</th><th class="tg">星期五</th><th class="tg">星期六</th><th class="tg">星期日</th></tr>';
                    _freeTime += '<tr><th class="tg">上午</th>';
                    var _freeTimeList = eval(resume.FreeTimes);
                    for (var i = 0; i < _freeTimeList.length; i++) {
                        if (_freeTimeList[i].AM == true) {
                            _freeTime += "<td>√</td>";
                        }
                        else {
                            _freeTime += "<td> </td>";
                        }
                    }
                    _freeTime += '</tr><tr><th class="tg">下午</th>';
                    for (var i = 0; i < _freeTimeList.length; i++) {
                        if (_freeTimeList[i].PM == true) {
                            _freeTime += "<td>√</td>";
                        }
                        else {
                            _freeTime += "<td> </td>";
                        }
                    }
                    _freeTime += "</tr></table>";
                    $("#ulSInfo li:eq(9)").find("span").html(_freeTime);
                }

                $("#divExpe").show();
                $("#tabAddExpe").show();

                $("#divEduc").show();
                $("#tabAddEduc").show();

                $("#divLang").show();
                $("#tabAddLang").show();

                $("#divCert").show();
                $("#tabAddCert").show();

                $("#divState").show();
                $("#divComplte").show();
            }





            //                var salary = $("#positionSalary").val() > 1 ? $("#positionSalary").find("option:selected").text() + " 元/月" : $("#positionSalary").find("option:selected").text();
            //                var endDate = $("#spPosEndYear .txtyear").val() == "至今" ? "至今" : $("#spPosEndYear .txtyear").val() + " 年 " + $("#spPosEndMonth .txtmonth").val() + " 月";
            //                var str = "<input type=\"hidden\" value=\"" + $("#txtCompName").val() + "'" + $("#hidPC3").val() + "'" + $("#hidPCN3").val() + "'" + $("#hidSPC3").val() + "'" + $("#hidSPCN3").val() + "'" + $("#txtPositionName").val() + "'" + $("#positionSalary").val() + "'" + $("#spPosStatYear .txtyear").val() + "'" + $("#spPosStatMonth .txtmonth").val() + "'" + $("#spPosEndYear .txtyear").val() + "'" + $("#spPosEndMonth .txtmonth").val() + "'" + repLaceData($("#txtPerformance").val()) + "\" id=\"hidExpeVal" + id + "\">";
            //                str += "<li>";
            //                str += "<span class=\"editdisplay\"><a href=\"javascript:editExpe(" + id + ");\">修改</a> &nbsp;<a href=\"javascript:subformDel(backfunExpeDel," + id + ",&quot;resumeexpedel&quot;,'您确定要删除该工作经验吗？');\">删除</a></span>";
            //                str += $("#spPosStatYear .txtyear").val() + " 年 " + $("#spPosStatMonth .txtmonth").val() + " 月— " + endDate + " <span>|</span> " + $("#txtCompName").val() + " <span>|</span> " + $("#txtPositionName").val() + " <span>|</span> " + salary + "</li><li>" + repLaceData($("#txtPerformance").val()).replace(/\n/g, "<br>").replace(/\r\n/g, "<br>") + "</li>";
            //                if (id == $("#hidUpExpeId").val()) {
            //                    $("#ulExpe" + id).html(str);
            //                } else {
            //                    str = "<ul id=\"ulExpe" + id + "\" class=\"worklist\">" + str + "</ul>";
            //                    if ($("#divExpe ul.worklist").length == 0) { $("#divExpe").prepend(str); updatePercentAge(20); } else { $("#divExpe ul.worklist").last().after(str); }
            //                }

            if (initPart == null || initPart == resumePart.Work) {
                //初始化工作经历
                $("#divExpe ul.worklist").remove();
                var workList = eval(resume.WorkExperiences);
                if (workList != undefined && workList != null) {
                    for (var i = 0; i < workList.length; i++) {
                        var str = "<ul class='worklist' id='ulExpe" + workList[i].Id + "'>";
                        //<input id='hidExpeVal20074273' type='hidden' value="杭州'1'销售'2'销售代表'销售代表'5'2008'9'2010'6'网站推广告，网站销售" />
                        str += "<li>";
                        str += "<span class='editdisplay'>";
                        str += "<a href='javascript:editExpe(\"" + workList[i].Id + "\");'>修改</a> &nbsp;";
                        str += "<a href='javascript:expeDel(\"" + workList[i].Id + "\");'>删除</a>";
                        str += "</span>";
                        str += "" + workList[i].StartYear + " 年 " + workList[i].StartMonth + " 月—" + workList[i].EndYear + " 年 " + workList[i].EndMonth + " 月 <span>|</span>";
                        str += "" + workList[i].CompanyName + " <span>|</span>";
                        str += "" + workList[i].JobName + " <span>|</span>";
                        if (workList[i].WageMin == 0 && workList[i].WageMax == 0) {
                            str += "保密";
                        }
                        if (workList[i].WageMin > workList[i].WageMax) {
                            str += workList[i].WageMin + "元以上/月";
                        }
                        else if (workList[i].WageMin == 0) {
                            str += workList[i].WageMax + "元以下/月";
                        }
                        else {
                            str += "" + workList[i].WageMin + "-" + workList[i].WageMax + " 元/月";
                        }
                        str += "</li>";
                        str += "<li>" + workList[i].WorkContent + "</li>";
                        str += "</ul>";
                        if ($("#divExpe ul.worklist").length == 0) {
                            $("#divExpe").prepend(str);
                            //updatePercentAge(20);
                        }
                        else {
                            $("#divExpe ul.worklist").last().after(str);
                        }
                    }
                    clearExpe();
                    $("#tabModyExpe").hide();
                    $("#tabAddExpe").show();
                    changeIframeH();
                }
            }

            if (initPart == resumePart.tempWork) {

                $("#divTempExpe ul.worklist").remove();
                var workList = eval(resume.WorkExperiences);
                if (workList != null) {
                    for (var i = 0; i < workList.length; i++) {
                        var str = "<ul class='worklist' id='ul2Expe" + workList[i].Id + "'>";
                        //<input id='hidExpeVal20074273' type='hidden' value="杭州'1'销售'2'销售代表'销售代表'5'2008'9'2010'6'网站推广告，网站销售" />
                        str += "<li>";
                        str += "<span class='editdisplay'>";
                        str += "<a href='javascript:editTempExpe(\"" + workList[i].Id + "\");'>修改</a> &nbsp;";
                        str += "<a href='javascript:tempExpeDel(\"" + workList[i].Id + "\");'>删除</a>";
                        str += "</span>";
                        str += "" + workList[i].StartYear + " 年 " + workList[i].StartMonth + " 月—" + workList[i].EndYear + " 年 " + workList[i].EndMonth + " 月 <span>|</span>";
                        str += "" + workList[i].CompanyName + " <span>|</span>";
                        str += "" + workList[i].JobName + " <span>|</span>";
                        if (workList[i].WageMin == 0 && workList[i].WageMax == 0) {
                            str += "保密";
                        }
                        if (workList[i].WageMin > workList[i].WageMax) {
                            str += workList[i].WageMin + "元以上/月";
                        }
                        else if (workList[i].WageMin == 0) {
                            str += workList[i].WageMax + "元以下/月";
                        }
                        else {
                            str += "" + workList[i].WageMin + "-" + workList[i].WageMax + " 元/月";
                        }

                        str += "</li>";
                        str += "<li>" + workList[i].WorkContent + "</li>";
                        str += "</ul>";
                        if ($("#divTempExpe ul.worklist").length == 0) {
                            $("#divTempExpe").prepend(str);
                        }
                        else {
                            $("#divTempExpe ul.worklist").last().after(str);
                        }
                    }
                    clearTempExpe();
                    $("#tabModyExpe2").hide();
                    $("#tabAddExpe2").show();
                    if ($("#divTempExpe ul.worklist").length == 0) {
                        $("#tabAddExpe2").hide();
                        $("#tabModyExpe2").show();
                        $("#btnCancelExpr2").hide();
                    }
                    //$("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom);
                    changeIframeH();
                }
            }

            if (initPart == null || initPart == resumePart.Edu) {
                //初始化教育背景
                $("#divEduc ul.worklist").remove();
                var eduList = eval(resume.EduBackgrounds);
                if (eduList != undefined && eduList != null) {
                    for (var i = 0; i < eduList.length; i++) {
                        var str = "<ul class='worklist' id='ulEdu" + eduList[i].Id + "'>";
                        //<input id='hidEducVal14922851' type='hidden' value="贵州大学'计算机'2004'9'2008'7" />
                        str += "<li>";
                        str += "<span class='editdisplay'>";
                        str += "<a href='javascript:editEduc(\"" + eduList[i].Id + "\");'>修改</a> &nbsp;";
                        str += "<a href='javascript:eduDel(\"" + eduList[i].Id + "\");'>删除</a>";
                        str += "</span>";
                        str += "" + eduList[i].StartYear + " 年 " + eduList[i].StartMonth + " 月—" + eduList[i].EndYear + " 年 " + eduList[i].EndMonth + " 月 <span>|</span>";
                        str += "" + eduList[i].School + " <span>|</span>";
                        str += "" + eduList[i].Profession + "";
                        str += "</li>";
                        str += "</ul>";
                        if ($("#divEduc ul.worklist").length == 0) {
                            $("#divEduc").prepend(str);
                            //updatePercentAge(20);
                        }
                        else {
                            $("#divEduc ul.worklist").last().after(str);
                        }
                    }
                    clearEduc();
                    $("#tabModyEduc").hide();
                    $("#tabAddEduc").show();
                    changeIframeH();
                }
            }
            if (initPart == resumePart.tempEdu) {
                $("#divTempEduc ul.worklist").remove();
                var eduList = eval(resume.EduBackgrounds);
                if (eduList != null) {
                    for (var i = 0; i < eduList.length; i++) {
                        var str = "<ul class='worklist' id='ul2Edu" + eduList[i].Id + "'>";
                        //<input id='hidEducVal14922851' type='hidden' value="贵州大学'计算机'2004'9'2008'7" />
                        str += "<li>";
                        str += "<span class='editdisplay'>";
                        str += "<a href='javascript:editTempEdu(\"" + eduList[i].Id + "\");'>修改</a> &nbsp;";
                        str += "<a href='javascript:tempEduDel(\"" + eduList[i].Id + "\");'>删除</a>";
                        str += "</span>";
                        str += "" + eduList[i].StartYear + " 年 " + eduList[i].StartMonth + " 月—" + eduList[i].EndYear + " 年 " + eduList[i].EndMonth + " 月 <span>|</span>";
                        str += "" + eduList[i].School + " <span>|</span>";
                        str += "" + eduList[i].Profession + "";
                        str += "</li>";
                        str += "</ul>";
                        if ($("#divTempEduc ul.worklist").length == 0) {
                            $("#divTempEduc").prepend(str);
                        }
                        else {
                            $("#divTempEduc ul.worklist").last().after(str);
                        }
                    }

                    clearTempEduc();
                    $("#tabModyEduc2").hide();
                    $("#tabAddEduc2").show();
                    if ($("#divTempEduc ul.worklist").length == 0) {
                        $("#tabAddEduc2").hide();
                        $("#tabModyEduc2").show();
                        $("#btnCancelEdu2").hide();
                    }
                    //$("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom);
                    changeIframeH();
                }
            }
            if (initPart == null || initPart == resumePart.Lang) {
                //初始化语言技能
                $("#divLang ul.worklist").remove();
                var langList = eval(resume.LanguageSkills);
                if (langList != undefined && langList != null) {
                    for (var i = 0; i < langList.length; i++) {
                        var str = "<ul class='worklist' id='ulLang" + langList[i].Id + "'>";
                        //<input id='hidLangVal1318141081013' type='hidden' value="0'0" />
                        str += "<li>";
                        str += "<span class='editdisplay'>";
                        str += "<a href='javascript:editLang(\"" + langList[i].Id + "\");'>修改</a> &nbsp;";
                        str += "<a href='javascript:langDel(\"" + langList[i].Id + "\");'>删除</a>";
                        str += "</span>";
                        str += "" + langList[i].Language + "：" + langList[i].Skill + "";
                        str += "</li>";
                        str += "</ul>";
                        if ($("#divLang ul.worklist").length == 0) {
                            $("#divLang div.one").after(str);
                            //updatePercentAge(10);
                        }
                        else {
                            $("#divLang ul.worklist").last().after(str);
                        }
                    }
                    clearLang();
                    $("#tabModyLang").hide();
                    $("#tabAddLang").show();
                }
            }
            if (initPart == null || initPart == resumePart.Cert) {
                //初始化证书
                $("#divCert ul.worklist").remove();
                var certList = eval(resume.Certificates);
                if (certList != undefined && certList != null) {
                    for (var i = 0; i < certList.length; i++) {
                        var str = "<ul class='worklist' id='ulCert" + certList[i].Id + "'>";
                        //<input id='hidCertVal1318141615761' type='hidden' value="软件设计师'国家信息产业部'2000'2'" />
                        str += "<li>";
                        str += "<span class='editdisplay'><a href='javascript:editCert(\"" + certList[i].Id + "\");'>修改</a> &nbsp;"
                        str += "<a href='javascript:certDel(\"" + certList[i].Id + "\");'>删除</a>";
                        str += "</span>";
                        str += "" + certList[i].Name + " <span>|</span>";
                        str += "" + certList[i].CertOrg + " <span>|</span>";
                        str += "" + certList[i].CertYear + " 年 " + certList[i].CertMonth + " 月"
                        str += "</li>";
                        str += "</ul>";
                        if ($("#divCert ul.worklist").length == 0) {
                            $("#divCert").prepend(str);
                            //updatePercentAge(10); 
                        }
                        else {
                            $("#divCert ul.worklist").last().after(str);
                        }
                    }
                    clearCert();
                    $("#tabModyCert").hide();
                    $("#tabAddCert").show();
                }
            }
            changeIframeH();
        }
        else {
            $("#hidresume").val(-1);
            resume = new Resume();
            resume.Id = -1;
            resume.UserId = userid;
            resume.ResumeType = resumeType; //全兼
            resume.JobType = 0;
            resume.WageMin = 0;
            resume.WageMax = 0;
            //resume.Sex = -1;
            //resume.BirthDay = null;
            resume.Education = 0;
            resume.WorkYearStart = 0;
            resume.WorkYearEnd = 0;
            resume.NowCityId = 1;
            resume.PublicState = 1;
            resume.DateCreated = new Date().toJson(true);
            resume.DateModified = resume.DateCreated;

            $("#divMInfo").show();
        }
    }, function () {
    });
}

function save(savePart) {
    if (resume.Id < 0) {
        resume.DateCreated = new Date().toJson(true);
        resume.DateModified = resume.DateCreated;
        if (resume.Name == null || resume.Name.trim() == "") {
            if (resumeType == 1) {
                resume.Name = "我的全职简历";
            }
            else if (resumeType == 2) {
                resume.Name = "我的兼职简历";
            }
        }
        resume.Insert(
        function (data) {
            initResume(savePart);
            alert("保存成功");
        },
        function () {
            alert("保存失败");
        });
    }
    else {
        resume.DateModified=new Date().toJson(true);
        resume.Update(function (data) {
            initResume(savePart);
            alert("更新成功");
        },
        function () {
            initResume(savePart);
            alert("更新失败");
        });
    }
}

function saveResume() {        
    resume.Name = $("#txtResumeName").val();
    var pid = $("#selPosCate1").attr("pid");
    if (pid == undefined || pid == null) {
        alert("请选择职位类别");
        return;
    }
    resume.JobType = parseInt(pid, 10);
    var objid = $("#selPosCate1").attr("cid");
    if (objid == undefined || objid == null) {
        resume.ObjectType = null;
    }
    else {
        resume.ObjectType = parseInt(objid, 10);
    }
    resume.JobName = $("#txtTPosition").val();
    if (resumeType == 1) {//全兼
        resume.WageMin = $("#salary").val().split("-")[0];
        resume.WageMax = $("#salary").val().split("-")[1];
    }
    else {//兼职
        resume.WageMin = 0;
        resume.WageMax = 0;
    }
    resume.AboutMe = $("#txtLetter").val();
    resume.RealName = $("#txtUserName").val();
    resume.Sex = parseInt($("#selGender").val(), 10);
    var birthDay = new Date();
    birthDay.setYear(parseInt($("#spInfoYear .txtyear").val(), 10));
    birthDay.setMonth(parseInt($("#spInfoMonth .txtmonth").val(), 10));
    birthDay.setDate(1);
    birthDay.setHours(0, 0, 0, 0);
    resume.BirthDay = birthDay.toJson(true);
    resume.Education = parseInt($("#selEducation").val(), 10);
    resume.WorkYearStart = $("#selWorked").val().split("-")[0];
    resume.WorkYearEnd = $("#selWorked").val().split("-")[1];
    resume.Phone = $("#txtMobile").val();
    resume.Email = $("#txtEmail").val();

    var cityID = $("#hidNowLive").attr("cid");
    var areaID = $("#hidNowLive").attr("aid");
    var circleID = $("#hidNowLive").attr("nid");

    resume.NowCityId = parseInt(cityID, 10);
    if (areaID == undefined || areaID == null) {
        resume.NowRegionId = null;
    }
    else {
        resume.NowRegionId = parseInt(areaID, 10);
    }
    if (circleID == undefined || circleID == null) {
        resume.NowCircleId = null;
    }
    else {
        resume.NowCircleId = parseInt(circleID, 10);
    }
//    if (resume.Id>0) {
//        resume.PublicState = parseInt($("input[name='rdoState']:checked").val(), 10);
//    }

    if (resumeType == 2) {//兼职
        
        resume.FreeTimes = getFreeTime();
        resume.FreeTimes = $f.toJson(resume.FreeTimes);
        resume.IsStudent=$("input[name='rdoIdentity']:checked").val()=="1";
    }
    else {
        resume.FreeTimes = null;
    }

    resume.DateModified = resume.DateCreated;

    if ($("#Pic").val() != "") {
        resume.Pictures = $("#Pic").val();
    }

    save(resumePart.basic);
        
}

function saveTempEdu() {

    if (!infomationvalidate32()) {
        return;
    }
    //resume = new Resume();
    clearInfoMsg($("#txtEducationInfoSave"));
    var updateid = $("#hidUpEducId2").val();
    var edu = {};
    edu.School = $("#txtSchool2").val();
    edu.Profession = $("#txtProfessional2").val();
    edu.StartYear = parseInt($("#spEduStatYear2 .txtyear").val(), 10);
    edu.StartMonth = parseInt($("#spEduStatMonth2 .txtmonth").val(), 10);
    edu.EndYear = parseInt($("#spEduEndYear2 .txtyear").val(), 10);
    edu.EndMonth = parseInt($("#spEduEndMonth2 .txtmonth").val(), 10);
    var objArray = eval(resume.EduBackgrounds);
    if (objArray == undefined || objArray == null) {
        edu.Id = getUniqueId();
        resume.EduBackgrounds = [edu];
    }
    else {
        if (updateid != undefined && updateid != null && updateid > 0) {
            for (var i = 0; i < objArray.length; i++) {
                if (objArray[i].Id == updateid) {
                    edu.Id = objArray[i].Id;
                    objArray[i] = edu;
                    break;
                }
            }
        }
        else {
            edu.Id = getUniqueId();
            objArray.push(edu);
        }
        resume.EduBackgrounds = objArray;
    }
    resume.EduBackgrounds = $f.toJson(resume.EduBackgrounds);
    save(resumePart.tempEdu);
}

function saveTempExpr() {
    if (!infomationvalidate22()) {
        return;
    }
    clearInfoMsg($("#txtWorkedInfoSave"));
    var updateid = $("#hidUpExpeId2").val();

    var exp = {};
    if (resumeType == 1) {//全职
        var pid = $("#selPosCate2").attr("pid");
        if (pid == undefined || pid == null) {
            alert("请选择职位类别");
            return;
        }
        exp.JobType = parseInt(pid, 10);
        var objid = $("#selPosCate1").attr("cid");
        if (objid == undefined || objid == null) {
            exp.ObjectType = null;
        }
        else {
            exp.ObjectType = parseInt(objid, 10);
        }
    }
    else {//兼职
        exp.JobType = 0;
        exp.ObjectType = null;
    }
    exp.CompanyName = $("#txtCompName2").val();
    exp.JobName = $("#txtPositionName2").val();
    if (resumeType == 1) {//全职
        exp.WageMin = $("#positionSalary2").val().split("-")[0];
        exp.WageMax = $("#positionSalary2").val().split("-")[1];
    }
    else {//兼职
        exp.WageMin = 0;
        exp.WageMax = 0;
    }
    exp.StartYear = parseInt($("#spPosStatYear2 .txtyear").val(), 10);
    exp.StartMonth = parseInt($("#spPosStatMonth2 .txtmonth").val(), 10);
    exp.EndYear = parseInt($("#spPosEndYear2 .txtyear").val(), 10);
    exp.EndMonth = parseInt($("#spPosEndMonth2 .txtmonth").val(), 10);
    if ($("#spPosEndYear2 .txtyear").val() == "至今") {
        exp.StartYear = new Date().getYear();
        exp.StartMonth = new Date().getMonth();
    }
    exp.WorkContent = $("#txtPerformance2").val();

    var objArray = eval(resume.WorkExperiences);
    if (objArray == undefined || objArray == null) {
        exp.Id = getUniqueId();
        resume.WorkExperiences = [exp];
    }
    else {
        if (updateid != undefined && updateid != null && updateid > 0) {
            for (var i = 0; i < objArray.length; i++) {
                if (objArray[i].Id == updateid) {
                    exp.Id = objArray[i].Id;
                    objArray[i] = exp;
                    break;
                }
            }
        }
        else {
            exp.Id = getUniqueId();
            objArray.push(exp);
        }
        resume.WorkExperiences = objArray;
    }
    resume.WorkExperiences = $f.toJson(resume.WorkExperiences);

    save(resumePart.tempWork);
}

function saveExpr() {
    if (!infomationvalidate2()) {
        return;
    }
    var updateid = $("#hidUpExpeId").val();
    var exp = {};

    
    if (resumeType == 1) {//全职
        var pid = $("#selPosCate3").attr("pid");
        if (pid == null) {
            alert("请选择职位类别");
            return;
        }
        exp.JobType = parseInt(pid, 10);
        var objid = $("#selPosCate3").attr("cid");
        if (objid == null) {
            exp.ObjectType = null;
        }
        else {
            exp.ObjectType = parseInt(objid, 10);
        }
    }
    else {
        exp.JobType = 0;
        exp.ObjectType = null;
    }
    exp.CompanyName = $("#txtCompName").val();
    exp.JobName = $("#txtPositionName").val();
    if (resumeType == 1) {//全职
        exp.WageMin = $("#positionSalary").val().split("-")[0];
        exp.WageMax = $("#positionSalary").val().split("-")[1];
    }
    else {//兼职
        exp.WageMin = 0;
        exp.WageMax = 0;
    }
    exp.StartYear = parseInt($("#spPosStatYear .txtyear").val(), 10);
    exp.StartMonth = parseInt($("#spPosStatMonth .txtmonth").val(), 10);
    exp.EndYear = parseInt($("#spPosEndYear .txtyear").val(), 10);
    exp.EndMonth = parseInt($("#spPosEndMonth .txtmonth").val(), 10);
    if ($("#spPosEndYear .txtyear").val() == "至今") {
        exp.StartYear = new Date().getYear();
        exp.StartMonth = new Date().getMonth();
    }
    exp.WorkContent = $("#txtPerformance").val();
    var objArray = eval(resume.WorkExperiences);
    if (objArray == undefined || objArray == null) {
        exp.Id = getUniqueId();
        resume.WorkExperiences = [exp];
    }
    else {
        if (updateid != undefined && updateid != null&&updateid>0) {
            for (var i = 0; i < objArray.length; i++) {
                if (objArray[i].Id ==updateid) {
                    exp.Id = objArray[i].Id;
                    objArray[i] = exp;
                    break;
                }
            }
        }
        else {
            exp.Id = getUniqueId();
            objArray.push(exp);
        }
        resume.WorkExperiences = objArray;
    }
    resume.WorkExperiences = $f.toJson(resume.WorkExperiences);
    save(resumePart.Work);
}

function saveEdu() {
    if (!infomationvalidate3()) {
        return;
    }
    var updateid = $("#hidUpEducId").val();
    var edu = {};
    edu.School = $("#txtSchool").val();
    edu.Profession = $("#txtProfessional").val();
    edu.StartYear = parseInt($("#spEduStatYear .txtyear").val(), 10);
    edu.StartMonth = parseInt($("#spEduStatMonth .txtmonth").val(), 10);
    edu.EndYear = parseInt($("#spEduEndYear .txtyear").val(), 10);
    edu.EndMonth = parseInt($("#spEduEndMonth .txtmonth").val(), 10);

    var objArray = eval(resume.EduBackgrounds);
    if (objArray == undefined || objArray == null) {
        edu.Id = getUniqueId();
        resume.EduBackgrounds = [edu];
    }
    else {
        if (updateid != undefined && updateid != null && updateid > 0) {
            for (var i = 0; i < objArray.length; i++) {
                if (objArray[i].Id == updateid) {
                    edu.Id = objArray[i].Id;
                    objArray[i] = edu;
                    break;
                }
            }
        }
        else {
            edu.Id = getUniqueId();
            objArray.push(edu);
        }
        resume.EduBackgrounds = objArray;
    }
    resume.EduBackgrounds = $f.toJson(resume.EduBackgrounds);
    save(resumePart.Edu);
}

function saveLang() {
    var updateid = $("#hidUpLangId").val();
    var lang = {};
//        lang.Language = $("#selLanguage").val();
    //        lang.Skill = $("#selLanguageLev").val();
    lang.Language = $("#selLanguage :selected").text();
    lang.Skill = $("#selLanguageLev :selected").text();
    var objArray = eval(resume.LanguageSkills);
    if (objArray == undefined || objArray == null) {
        lang.Id = getUniqueId();
        resume.LanguageSkills = [lang];
    }
    else {
        if (updateid != undefined && updateid != null && updateid > 0) {
            for (var i = 0; i < objArray.length; i++) {
                if (objArray[i].Id == updateid) {
                    lang.Id = objArray[i].Id;
                    objArray[i] = lang;
                    break;
                }
            }
        }
        else {
            lang.Id = getUniqueId();
            objArray.push(lang);
        }
        resume.LanguageSkills = objArray;
    }
    resume.LanguageSkills = $f.toJson(resume.LanguageSkills);
    save(resumePart.Lang);
}

function saveCert() {
    if (!infomationvalidate5()) {
        return;
    }
    var updateid = $("#hidUpCertId").val();
    var cert = {};
    cert.Name = $("#txtCertName").val();
    cert.CertOrg = $("#txtCertAuthority").val();
    cert.CertYear = parseInt($("#spIssueYear .txtyear").val(), 10);
    cert.CertMonth = parseInt($("#spIssueMonth .txtmonth").val(), 10);

    var objArray = eval(resume.Certificates);
    if (objArray == undefined || objArray == null) {
        cert.Id = getUniqueId();
        resume.Certificates = [cert];
    }
    else {
        if (updateid != undefined && updateid != null && updateid > 0) {
            for (var i = 0; i < objArray.length; i++) {
                if (objArray[i].Id == updateid) {
                    cert.Id = objArray[i].Id;
                    objArray[i] = cert;
                    break;
                }
            }
        }
        else {
            cert.Id = getUniqueId();
            objArray.push(cert);
        }
        resume.Certificates = objArray;
    }
    resume.Certificates = $f.toJson(resume.Certificates);
    save(resumePart.Cert);

}

function expeDel(expId) {
    if (confirm("您确定要删除该工作经验吗？")) {
        var array = eval(resume.WorkExperiences);
        for (var i = 0; i < array.length; i++) {
            if (array[i].Id == expId) {
                array.splice(i, 1);
                resume.WorkExperiences = $f.toJson(array);
                save(resumePart.Work);
                break;
            }
        }
    }
}

function tempExpeDel(expId) {
    if (confirm("您确定要删除该工作经验吗？")) {
        var array = eval(resume.WorkExperiences);
        for (var i = 0; i < array.length; i++) {
            if (array[i].Id == expId) {
                array.splice(i, 1);
                resume.WorkExperiences = $f.toJson(array);
                save(resumePart.tempWork);
                break;
            }
        }
    }
}

function eduDel(eduId) {
    if (confirm("您确定要删除该教育经历吗？")) {
        var array = eval(resume.EduBackgrounds);
        for (var i = 0; i < array.length; i++) {
            if (array[i].Id == eduId) {
                array.splice(i, 1);
                resume.EduBackgrounds = $f.toJson(array);
                save(resumePart.Edu);
                break;
            }
        }
    }
}

function tempEduDel(eduId) {
    if (confirm("您确定要删除该教育经历吗？")) {
        var array = eval(resume.EduBackgrounds);
        for (var i = 0; i < array.length; i++) {
            if (array[i].Id == eduId) {
                array.splice(i, 1);
                resume.EduBackgrounds = $f.toJson(array);
                save(resumePart.tempEdu);
                break;
            }
        }
    }
}

function langDel(langId) {
    if (confirm("您确定要删除该语言技能吗？")) {
        var array = eval(resume.LanguageSkills);
        for (var i = 0; i < array.length; i++) {
            if (array[i].Id == langId) {
                array.splice(i, 1);
                resume.LanguageSkills = $f.toJson(array);
                save(resumePart.Lang);
                break;
            }
        }
    }
}

function certDel(certId) {
    if (confirm("您确定要删除该专业证书吗？")) {
        var array = eval(resume.Certificates);
        for (var i = 0; i < array.length; i++) {
            if (array[i].Id == certId) {
                array.splice(i, 1);
                resume.Certificates = $f.toJson(array);
                save(resumePart.Cert);
                break;
            }
        }
    }
}

function modyInfo() {
    $("#divSInfo").hide();
    $("#divMInfo").show();
    //PosCateIndexInit(1);
    //PosCateIndexInit(2);
//        if ($("#hidSPCN" + n).val() != "") {
//            $("#selPosCate" + n).find("span").text($("#hidSPCN" + n).val());
//            $("#selPosCate" + n).find("span").removeClass("c99");
//        }
    if (resume.JobType != 0) {
        $("#selPosCate1").attr("pid", resume.JobType);
    }
    else {
        $("#selPosCate1").attr("pid", null);
    }
    $("#selPosCate1").attr("cid", resume.ObjectType);
    $("#selPosCate1").find("span").text(resume.JobTypeName);

    $("#txtResumeName").val(resume.Name);
    $("#txtTPosition").val(resume.JobName);
    $("#salary").val(resume.WageMin+"-"+resume.WageMax);
    $("#txtLetter").val(resume.AboutMe);
    $("#txtUserName").val(resume.RealName);
        
    if (resume.Sex == true) {
        $("#selGender").val(1);
    }
    else if (resume.Sex == false) {
        $("#selGender").val(0);
    }
    else {
        $("#selGender").val(-1);
    }
    var birthDay = $f.date.parseJson(resume.BirthDay);
    if (birthDay != null) {
        $("#spInfoYear .txtyear").val(birthDay.getFullYear());
        $("#spInfoMonth .txtmonth").val(birthDay.getMonth());
    }
    else {
        $("#spInfoYear .txtyear").val(null);
        $("#spInfoMonth .txtmonth").val(null);
    }
    $("#selEducation").val(resume.Education);
    $("#selWorked").val(resume.WorkYearStart+"-"+resume.WorkYearEnd);
    $("#txtMobile").val(resume.Phone);
    $("#txtEmail").val(resume.Email);

    if (resume.NowCityId == 0) {
        $("#hidNowLive").attr("cid", null);
        $("#txtLiveCity").val(null);
    }
    else {
        $("#hidNowLive").attr("cid", resume.NowCityId);
        $("#txtLiveCity").val(resume.NowCity.Name);
    }
        
    $("#hidNowLive").attr("aid", resume.NowRegionId);
    $("#hidNowLive").attr("nid", resume.NowCircleId);
    if (resume.NowRegionId>0) {
        $("#txtLiveArea").val(resume.NowRegion.Name);
    }
    if (resume.NowCircleId>0) {
        $("#txtLiveName").val(resume.NowCircle.Name);
    }
    if (resumeType == 2) {//兼职
        setFreeTime();
        
        if (resume.IsStudent==true) {
            $("input[name='rdoIdentity'][value='1']").attr("checked", true);
        }
        else {
            $("input[name='rdoIdentity'][value='0']").attr("checked", true);
        }

    }
    changeIframeH();
}

function editExpe(id) {
    $("#tabModyExpe").show();
    $("#tabAddExpe").hide();
    $("#hidUpExpeId").val(id);
    //var hidVal = $("#hidExpeVal" + id).val().split("'");
    var expList = resume.WorkExperienceList;  // eval(resume.WorkExperiences);
    var exp = null;
    for (var i = 0; i < expList.length; i++) {
        if (expList[i].Id == id) {
            exp = expList[i];
            break;
        }
    }
    $("#txtCompName").val(exp.CompanyName);
    if (resumeType == 1) {//全职
        $("#selPosCate3").attr("pid", exp.JobType);
        $("#selPosCate3").attr("cid", exp.ObjectType);
        $("#selPosCate3").find("span").text(exp.JobTypeName);
        $("#selPosCate3").find("span").removeClass("c99");
    }
    $("#txtPositionName").val(exp.JobName);
    if (resumeType == 1) {//全职
        $("#positionSalary").attr("value", exp.WageMin + "-" + exp.WageMax);
    }
    $("#spPosStatYear .txtyear").val(exp.StartYear);
    $("#spPosStatMonth .txtmonth").val(exp.StartMonth);
    $("#spPosEndYear .txtyear").val(exp.EndYear);
    $("#spPosEndMonth .txtmonth").val(exp.EndMonth);
    $("#txtPerformance").val(exp.WorkContent);
//        if (hidVal[9] == "至今") {
//            $("#spEnd").hide();
//        } else {
//            $("#spEnd").show();
    //        }
    $("#spEnd").show();
    changeIframeH();
}

function editTempExpe(id) {
    $("#tabModyExpe2").show();
    if ($("#divTempExpe ul.worklist").length > 1) {
        $("#btnCancelExpr2").show();
    }
    $("#tabAddExpe2").hide();
    $("#hidUpExpeId2").val(id);
    //var hidVal = $("#hidExpe2Val" + id).val().split("'");
    var expList = resume.WorkExperienceList;  // eval(resume.WorkExperiences);
    var exp = null;
    for (var i = 0; i < expList.length; i++) {
        if (expList[i].Id == id) {
            exp = expList[i];
            break;
        }
    }
    $("#txtCompName2").val(exp.CompanyName);
    if (resumeType == 1) {//全职
        $("#selPosCate2").attr("pid", exp.JobType);
        $("#selPosCate2").attr("cid", exp.ObjectType);
        $("#selPosCate2").find("span").text(exp.JobTypeName);
        $("#selPosCate2").find("span").removeClass("c99");
    }
    $("#txtPositionName2").val(exp.JobName);
    if (resumeType == 1) {//全职
        $("#positionSalary2").attr("value", exp.WageMin + "-" + exp.WageMax);
    }
    $("#spPosStatYear2 .txtyear").val(exp.StartYear);
    $("#spPosStatMonth2 .txtmonth").val(exp.StartMonth);
    $("#spPosEndYear2 .txtyear").val(exp.EndYear);
    $("#spPosEndMonth2 .txtmonth").val(exp.EndMonth);
    $("#txtPerformance2").val(exp.WorkContent);
//        if (hidVal[9] == "至今") {
//            $("#spEnd2").hide();
//        } else {
//            $("#spEnd2").show();
//        }
    $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#divLiveCity").height());
    changeIframeH();
}

function editEduc(id) {
    $("#tabModyEduc").show();
    $("#tabAddEduc").hide();
    $("#hidUpEducId").val(id);
    var eduList = resume.EduBackgroundList;
    var edu = null;
    for (var i = 0; i < eduList.length; i++) {
        if (eduList[i].Id == id) {
            edu = eduList[i];
            break;
        }
    }
//        var hidVal = $("#hidEducVal" + id).val().split("'");
    $("#txtSchool").val(edu.School);
    $("#txtProfessional").val(edu.Profession);
    $("#spEduStatYear .txtyear").val(edu.StartYear);
    $("#spEduStatMonth .txtmonth").val(edu.StartMonth);
    $("#spEduEndYear .txtyear").val(edu.EndYear);
    $("#spEduEndMonth .txtmonth").val(edu.EndMonth);
    changeIframeH();
};

function editTempEdu(id) {
    $("#tabModyEduc2").show();
    if ($("#divTempEduc ul.worklist").length > 1) {
        $("#btnCancelEdu2").show();
    }
    $("#tabAddEduc2").hide();
    $("#hidUpEducId2").val(id);
    //var hidVal = $("#hid2EducVal" + id).val().split("'");
    var eduList = resume.EduBackgroundList;
    var edu = null;
    for (var i = 0; i < eduList.length; i++) {
        if (eduList[i].Id == id) {
            edu = eduList[i];
            break;
        }
    }
    $("#txtSchool2").val(edu.School);
    $("#txtProfessional2").val(edu.Profession);
    $("#spEduStatYear2 .txtyear").val(edu.StartYear);
    $("#spEduStatMonth2 .txtmonth").val(edu.StartMonth);
    $("#spEduEndYear2 .txtyear").val(edu.EndYear);
    $("#spEduEndMonth2 .txtmonth").val(edu.EndMonth);
    $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#divLiveCity").height());
    changeIframeH();
};

function editLang(id) {
    $("#tabModyLang").show();
    $("#tabAddLang").hide();
    $("#hidUpLangId").val(id);
    var langList = resume.LanguageSkillList;
    var lang = null;
    for (var i = 0; i < langList.length; i++) {
        if (langList[i].Id == id) {
            lang = langList[i];
            break;
        }
    }
    //var hidVal = $("#hidLangVal" + id).val().split("'");
//        $("#selLanguage").attr("value", hidVal[0]);
    //        $("#selLanguageLev").attr("value", hidVal[1]);
    $("#selLanguage @option[text='" + lang.Language + "']").attr("selected",true);
    $("#selLanguageLev @option[text='" + lang.Skill + "']").attr("selected", true);
    changeIframeH();
};

function editCert(id) {
    $("#tabModyCert").show();
    $("#tabAddCert").hide();
    $("#hidUpCertId").val(id);
    //var hidVal = $("#hidCertVal" + id).val().split("'");
    var certList = resume.CertificateList;
    var cert = null;
    for (var i = 0; i < certList.length; i++) {
        if (certList[i].Id == id) {
            cert = certList[i];
            break;
        }
    }
    $("#txtCertName").val(cert.Name);
    $("#txtCertAuthority").val(cert.CertOrg);
    $("#spIssueYear .txtyear").val(cert.CertYear);
    $("#spIssueMonth .txtmonth").val(cert.CertMonth);
    if (cert.CertPic != undefined && cert.CertPic != null && ert.CertPic != "") {
        $("#tdCert").html("<div id=\"uploadPic1\" class=\"uploadPic\" value=\"" + cert.CertPic + "\"></div>");
        $.c.Uploader1.SavedNum = 0; //清零
        $.c.Uploader1.init();
    }
    changeIframeH();
};

function initJobCategories(container) {
    $info.jobCategory.getParents(
    function (data) {
        var str = "<table cellpadding='0' cellspacing='0' width='100%'>";
        //str += "<tr><td colspan='3' class='linetwo'><a href='#'>" + name + "</a> &nbsp; &nbsp; <a href='#' class='blacklink'>[返回选择其他类别]</a></td></tr>";
        for (var i = 0; i < data.length; i++) {
            if (i % 3 == 0) {
                str += "<tr>";
            }
            str += "<td><a href='javascript:initJobChildCategory(" + $(this).attr("id") + "," + data[i].Id + ",\"" + data[i].Name + "\");'>" + data[i].Name + "</a></td>";
            if (i % 3 == 2) {
                str += "</tr>";
            }
        }
        if (str.lastIndexOf("</tr>") == (str.length - 5)) {
            str += "<tr>";
        }
        str += "<td><a class='blacklink' href='javascript:setParentJob(" + $(this).attr("id") + ",null,null)'>[不限]</a></td></tr>";
        str += "</table><div class=\"close_tip\">请直接点击下面职位类别进行选择。<a class=\"close\" href='javascript:hide("+$(this).find('div').attr('id')+");'>X</a></div>";
        $(this).find("div").show(); //.css("display", "");
        $(this).find("div").html(str);
    },
    function () {
        alert("失败");
    }, null, $(container));
}
    
function initJobChildCategory(container, ParentId,ParentName) {
    $info.jobCategory.getChild(ParentId, function (data) {
        var str = "<table cellpadding='0' cellspacing='0' width='100%'>";
        str += "<tr><td colspan='3' class='linetwo'><a href='javascript:setParentJob(" + $(this).attr("id") + "," + ParentId + ",\"" + ParentName + "\")'>" + data.Name + "</a> &nbsp; &nbsp; <a href='javascript:initJobCategories("+$(this).attr("id")+")' class='blacklink'>[返回选择其他类别]</a></td></tr>";
        for (var i = 0; i < data.Children.length; i++) {
            if (i % 3 == 0) {
                str += "<tr>";
            }
            str += "<td><a href='javascript:setChildJob(" + $(this).attr("id") + "," + ParentId + ",\"" + ParentName + "\"," + data.Children[i].Id + ",\"" + data.Children[i].Name + "\")'>" + data.Children[i].Name + "</a></td>";
            if (i % 3 == 2) {
                str += "</tr>";
            }
        }
        if (str.lastIndexOf("</tr>") == (str.length - 5)) {
            str += "<tr>";
        }
        str += "<td><a class='blacklink' href='javascript:setParentJob(" + $(this).attr("id") + "," + ParentId + ",\"" + ParentName + "\")'>[不限]</a></td></tr>";
        str += "</table><div class=\"close_tip\">请直接点击下面职位类别进行选择。<a class=\"close\" href='javascript:hide(" + $(this).find('div').attr('id') + ");'>X</a></div>";
        $(this).find("div").show();
        $(this).find("div").html(str);
    },
function () {
}, null, $(container));
}

function setParentJob(container, parentId, ParentName) {
    $(container).attr("cid", null);
    $(container).parent(0).find("input").val(null);
    $(container).attr("pid", parentId);
    if (ParentName == null) {
        $(container).find("span").html("请选择职位类别");
    }
    else {
        $(container).find("span").html(ParentName);
    }
    $(container).find("div").hide();//.css("display", "none");
}

function setChildJob(container, ParentId,ParentName,ChildId,ChildName) {
    $(container).attr("pid", ParentId);
    $(container).attr("cid", ChildId);
    $(container).find("span").html(ParentName);
    $(container).parent(0).find("input").val(ChildName);
    $(container).find("div").hide();//.css("display", "none");
}

function hide(element) {
    $(element).hide();
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
function addTempExpe() {
    $("#tabAddExpe2").hide();
    $("#tabModyExpe2").show();
    if ($("#divTempExpe ul.worklist").length > 0) {
        $("#btnCancelExpr2").show();
    }
    clearTempExpe();
//        if (lc == 0) {
        $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#tabModyExpe2").height()); 
//        }
    changeIframeH();
}
function cancelTempExpr() {
    $("#tabAddExpe2").show();
    $("#tabModyExpe2").hide();
    $("#btnCancelExpr2").hide();
    clearTempExpe();
//    if (lc == 0) {
        $("#aspnetForm").height(document.getElementById("divMInfo").getBoundingClientRect().bottom + $("#tabModyExpe2").height()); 
//    }
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
function clearEduc() {
    $("#hidUpEducId").val(0);
    $("#txtSchool").val("");
    $("#txtProfessional").val("");
    $("#spEduStatYear .txtyear").val("");
    $("#spEduStatMonth .txtmonth").val("");
    $("#spEduEndYear .txtyear").val("");
    $("#spEduEndMonth .txtmonth").val("");
};
function clearExpe() {
    $("#hidUpExpeId").val(0);
    $("#txtCompName").val("");
//        $("#hidPC3").val("0");
//        $("#hidPCN3").val("");
//        $("#hidSPC3").val("0");
    //        $("#hidSPCN3").val("");
    $("#selPosCate3").attr("pid", null);
    $("#selPosCate3").attr("cid", null);
    $("#txtPositionName").val("");
    $("#positionSalary").val("");
    $("#spPosStatYear .txtyear").val("");
    $("#spPosStatMonth .txtmonth").val("");
    $("#spPosEndYear .txtyear").val("");
    $("#spPosEndMonth .txtmonth").val("");
    $("#selPosCate3").find("span").text("请选择职位类别");
    $("#selPosCate3").find("span").addClass("c99");
    $("#txtPerformance").val("");
    $("#spEnd").show();
}
function clearTempEduc() {
    $("#hidUpEducId2").val(0);
    $("#txtSchool2").val("");
    $("#txtProfessional2").val("");
    $("#spEduStatYear2 .txtyear").val("");
    $("#spEduStatMonth2 .txtmonth").val("");
    $("#spEduEndYear2 .txtyear").val("");
    $("#spEduEndMonth2 .txtmonth").val("");
};
function clearTempExpe() {
    $("#hidUpExpeId2").val(0);
    $("#txtCompName2").val("");
//        $("#hidPC2").val("0");
//        $("#hidPCN2").val("");
//        $("#hidSPC2").val("0");
    //        $("#hidSPCN2").val("");
    $("#selPosCate2").attr("pid", null);
    $("#selPosCate2").attr("cid", null);
    $("#txtPositionName2").val("");
    $("#positionSalary2").val("");
    $("#spPosStatYear2 .txtyear").val("");
    $("#spPosStatMonth2 .txtmonth").val("");
    $("#spPosEndYear2 .txtyear").val("");
    $("#spPosEndMonth2 .txtmonth").val("");
    $("#selPosCate2").find("span").text("请选择职位类别");
    $("#selPosCate2").find("span").addClass("c99");
    $("#txtPerformance2").val("");
    $("#spEnd2").show();
};
function clearLang() {
    $("#hidUpLangId").val(0);
    $("#selLanguage").val("");
    $("#selLanguageLev").val("");
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

function getUniqueId() {
    var now = new Date();
    var str = "" + now.getFullYear();
    var month = now.getMonth();
    if (month < 10) {
        str += "0";
    }
    str += month;
    var day = now.getDay();
    if (month < 10) {
        str += "0";
    }
    str += day;
    var hour = now.getHours();
    if (hour < 10) {
        str += "0";
    }
    str += hour;
    var minutes = now.getMinutes();
    if (minutes < 10) {
        str += "0";
    }
    str += minutes;
    var seconds = now.getSeconds();
    if (seconds < 10) {
        str += "0";
    }
    str += seconds;
    str += now.getMilliseconds();
    return str;
}

