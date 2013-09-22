<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>求职简历发布成功-<%=SiteInfo.Name%></title>
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/ui6/zp/user20110815.css" />

    <script type="text/javascript" src="/Content/Fenlei/Scripts/c8/28.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="/Content/Fenlei/Scripts/jianli/job.js"></script>
    <script type="text/javascript" src="/Content/Fenlei/Scripts/jianli/j.js"></script>
    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/Area/city_debug.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>
    <script src="/Scripts/framework/db.js" type="text/javascript"></script>
    <script type="text/javascript" src="/content/fenlei/scripts/model.js"></script>
    <script type="text/javascript" src="/Content/Fenlei/Scripts/jobCategory.js"></script>
    <script type="text/javascript" src="/Content/Fenlei/Scripts/jianli/resume_validator.js"></script>
    <script type="text/javascript" src="/Content/Fenlei/Scripts/jianli/resume_init.js"></script>

    <script src="/Content/Fenlei/Scripts/fileupload/upload.js?v20110101" type="text/javascript"></script>
</head>
<body>
    <div class="chuangjian">
    <div class="area_bottom"></div>
    <div id="view"><input type="hidden" id="hidresume" value="0" />
        <div class="sample" id="divSInfo" style="display:none">
            <ul class="s_info" id="ulSInfo">
        	    <li class="title"></li>
        	    <li><i>我的身份：</i></li>
                <li><i>手机：</i></li>
                <li><i>电子邮件：</i>liliesheng@yahoo.com.cn</li>
                <li><i>现居住地：</i></li>
                <li><i>最高学历：</i></li>
                <li class="padt"><i>求职职位：</i></li>
                <li><i>实践经验：</i></li>
                <li style="display:none;"><i style="vertical-align:top">自我评价：</i><span style="width:639px;display:inline-block"></span></li>
                <li><i style="vertical-align:top">空余时间：</i><span style="width:639px;display:inline-block"></span></li>
            </ul>
            <div class="editorpic">
        	    <p><a href="javascript:modyInfo();">修改基本信息</a></p>
                
            </div>
        </div>
        <form id="aspnetForm" method="post" enctype="multipart/form-data">
        <div class="sample" id="divMInfo" style="display:none">
    	    <table cellpadding="0" cellspacing="0" class="box_table">
            <tr>
                <th><b>*</b>我的身份：</th>
                <td>
                    <label><input type="radio" checked="checked" style="margin:0;" name="rdoIdentity" value="1" /> 在校学生</label> &nbsp; &nbsp; &nbsp; &nbsp; 
                    <label><input type="radio"  style="margin:0;" name="rdoIdentity" value="0" /> 社会人才</label>
                </td> 
            </tr>
            <tr><th><b>*</b>姓 &nbsp; &nbsp; 名：</th><td><input type="text" class="textstyle" id="txtUserName" size="10" maxlength=4 value='' /> <select id="selGender"><option value="-1">性别</option><option value='0'>男</option><option value='1'>女</option></select> <b>*</b>出生年月：<input type="hidden" id="hidYear" value='' /><span class="dingweiyong" id="spInfoYear" style="z-index:16"></span> 年 <input type="hidden" id="hidMonth" value='' /><span class="dingweiyong" id="spInfoMonth" style="z-index:16"></span> 月 <span id="txtTrueNameInfo"></span></td></tr>
            <tr><th><b>*</b>手 &nbsp; &nbsp; 机：</th><td><input type="text" class="textstyle" id="txtMobile" value='' /> <span id="txtMobileInfo" style="z-index:12"></span></td></tr>
            <tr><th><b>*</b>电子邮件：</th><td><input type="text" class="textstyle" id="txtEmail" value='liliesheng@yahoo.com.cn' /> <span id="txtMailInfo"></span></td></tr>
            <tr><th><b>*</b>现居住地：</th><td><input type="hidden" id="hidNowLive" cid='0' cname='' aid='0' aname='' nid='0' nname='' value='0' />
            <span class="dingweiyong" style="z-index:15;margin-right:3px;"><input id="txtLiveCity" type="text" class="textstyle" size="8" readonly="readonly" /><div class="zhankai" id="divLiveCity" style="display:none"></div><iframe id="DivShimC" scrolling="no" frameborder="0" style="position:absolute; top:0px; left:0px; display:none;filter=progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);"></iframe></span>
            <span class="dingweiyong" style="z-index:15;margin-right:3px;"><input id="txtLiveArea" type="text" class="textstyle" size="8" readonly="readonly" /><div class="zhankai" id="divLiveArea" style="display:none"></div><iframe id="DivShimA" scrolling="no" frameborder="0" style="position:absolute; top:0px; left:0px; display:none;filter=progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);"></iframe></span>
            <span class="dingweiyong" style="z-index:15;margin-right:3px;"><input id="txtLiveName" type="text" class="textstyle" size="8" readonly="readonly" /><div class="zhankai" id="divLiveName" style="display:none"></div><iframe id="DivShimN" scrolling="no" frameborder="0" style="position:absolute; top:0px; left:0px; display:none;filter=progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);"></iframe></span> <span id="txtNowLiveInfo"></span>
            </td></tr>
            <tr><th valign=top><b>*</b>最高学历：</th>
                <td>
                    <select id="selEducation">
                        <option value="-1">请选择</option>
                        <option value='1'>技校</option>
                        <option value='2'>高中</option>
                        <option value='3'>中专</option>
                        <option value='4'>大专</option>
                        <option value='5'>本科</option>
                        <option value='6'>硕士</option>
                        <option value='7'>博士</option>
                    </select>
                    <span id="txtEducationInfo"></span>
                </td>
            </tr>
            <tr id="trEdu" style="display:none">
                <td colspan="2" style="width:795px;">
                    <div class="tbg" id="divTempEduc" style="display:none">
                        <table cellpadding="0" cellspacing="0" class="box_table" id="tabAddEduc2" style="display:none">
                            <tr>
            	                <th>&nbsp;</th>
            	                <td><label class="btn-v4"><input type="button" value="添加教育背景" onclick="addTempEduc()" /></label></td>
                            </tr>
                        </table>
                        <table cellpadding="0" cellspacing="0" class="box_table" id="tabModyEduc2">
                            <tr>
            	                <th><b>*</b>学校名称：</th><td><input type="text" class="textstyle" id="txtSchool2" /> <b>*</b>专业：<input type="text" class="textstyle" id="txtProfessional2" /> <span id="txtSchoolInfo2" style="z-index:14"></span><input type="hidden" id="hidUpEducId2" value="0" /></td>
                            </tr>
                            <tr>
            	                <th><b>*</b>在校时间：</th><td><span class="dingweiyong" id="spEduStatYear2" style="z-index:14"></span> 年 <span class="dingweiyong" id="spEduStatMonth2" style="z-index:14"></span> 月 - <span class="dingweiyong" id="spEduEndYear2" style="z-index:14"></span> <span id="spEduEnd2">年 <span class="dingweiyong" id="spEduEndMonth2" style="z-index:14"></span> 月</span> <span id="educDateInfo2"></span></td>
                            </tr>
                            <tr>
            	                <th>&nbsp;</th>
            	                <td>
            	                    <label class="btn-v4">
                                        <input type="button" value="保存教育背景" onclick="saveTempEdu();" /><%--onclick="subformTempEdu(backfunTempEdu);"--%>
                                    </label>
            	                    <input type="button" value="取消" class="btn-v2" id="btnCancelEdu2" style="display:none;" onclick="cancelTempEdu()" />
            	                    <span id="txtEducationInfoSave"></span>
            	                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <th valign="top"><b>*</b>实践经验：</th>
                <td>
                    <select id="selWorked">
                        <option value="-1">请选择</option>
                        <option value='0-0'>无</option>
                        <option value='1-1'>有</option>
                    </select>
                    <span class="gray">(校外机构做过兼职或校内社团、学生会等任职)</span>
                    <span id="txtWorkedInfo"></span>
                </td>
            </tr>
            <tr id="trExpe" style="display:none">
                <td colspan="2" style="width:795px;">
                    <div class="tbg" id="divTempExpe" style="display:none">
                        <table cellpadding="0" cellspacing="0" class="box_table" id="tabAddExpe2" style="display:none">
                            <tr>
            	                <th>&nbsp;</th>
            	                <td><label class="btn-v4"><input type="button" value="添加实践经历" class="btn-v3" onclick="addTempExpe()" /></label></td>
                            </tr>
                        </table>
                        <table cellpadding="0" cellspacing="0" class="box_table" id="tabModyExpe2">
                            <tr>
            	                <th><b>*</b>公司/社团：</th><td><input type="text" class="textstyle" size="35" id="txtCompName2" /> <span id="txtCompNameInfo2"></span><input type="hidden" id="hidUpExpeId2" value="0" /></td>
                            </tr>
                            <tr>
            	                <th><b>*</b>职位名称：</th><td>
                                <span class="fl"><input type="text" class="textstyle" id="txtPositionName2" /></span> <span id="txtPositionInfo2" style="z-index:14"></span></td>
                            </tr>
                            <tr>
            	                <th><b>*</b>工作时间：</th><td><span class="dingweiyong" id="spPosStatYear2" style="z-index:13"></span> 年 <span class="dingweiyong" id="spPosStatMonth2" style="z-index:13"></span> 月 - <span class="dingweiyong" id="spPosEndYear2" style="z-index:13"></span> <span id="spEnd2">年 <span class="dingweiyong" id="spPosEndMonth2" style="z-index:13"></span> 月</span> <span id="posDateInfo2"></span></td>
                            </tr>
                            <tr>
            	                <th><b>*</b>工作内容：</th><td><textarea style="height:35px" id="txtPerformance2"></textarea> <span id="txtPerformanceInfo2"></span></td>
                            </tr>
                            <tr>
            	                <th>&nbsp;</th>
            	                <td>
            	                    <label class="btn-v4">
                                        <input type="button" value="保存实践经历" onclick="saveTempExpr();" /><%--onclick="subformTempExpr(backfunTempExpr);"--%>
                                    </label>
            	                    <input type="button" value="取消" class="btn-v2" id="btnCancelExpr2" style="display:none;" onclick="cancelTempExpr()" />
            	                    <span id="txtWorkedInfoSave"></span>
            	                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <th class="t"><b>*</b>空余时间：</th>
                <td>
                    <table cellspacing="0" cellpadding="0" class="time_table"><%--selval=""--%>
	                    <tr><th>&nbsp;</th><th>星期一</th><th>星期二</th><th>星期三</th><th>星期四</th><th>星期五</th><th>星期六</th><th>星期日</th></tr>
                        <tr>
                            <th>上午</th>
                            <td><input type="checkbox" id="chk_1_1" /></td>
                            <td><input type="checkbox" id="chk_2_1" /></td>
                            <td><input type="checkbox" id="chk_3_1" /></td>
                            <td><input type="checkbox" id="chk_4_1" /></td>
                            <td><input type="checkbox" id="chk_5_1" /></td>
                            <td><input type="checkbox" id="chk_6_1" /></td>
                            <td><input type="checkbox" id="chk_7_1" /></td>
                        </tr>
                        <tr>
                            <th>下午</th>
                            <td><input type="checkbox" id="chk_1_2" /></td>
                            <td><input type="checkbox" id="chk_2_2" /></td>
                            <td><input type="checkbox" id="chk_3_2" /></td>
                            <td><input type="checkbox" id="chk_4_2" /></td>
                            <td><input type="checkbox" id="chk_5_2" /></td>
                            <td><input type="checkbox" id="chk_6_2" /></td>
                            <td><input type="checkbox" id="chk_7_2" /></td>
                        </tr>
                    </table><span id="txtFreeTimeInfo"></span>
                </td>
            </tr>
            <tr><th>&nbsp;</th><td><div id="uploadPic" class="uploadPic" value=""></div>
                <script type="text/javascript">
                    $info.Uploader.init();
                </script></td></tr>
            </table>
            <div style="height:1px; margin-top:-1px;clear: both;overflow:hidden;"></div>
        </div></form>
    </div>
    </div>
    <script type="text/javascript" src="/Content/Fenlei/Scripts/jianli/postedresume.js"></script>
    
    <script type="text/javascript">
        var resumeType = 2; //兼职
        var isPostJobInfo = true;

        function getFreeTime() {
            var list = [];
            for (var i = 1; i < 8; i++) {
                list.push({ Day: i, AM: $("#chk_" + i + "_1").attr("checked"), PM: $("#chk_" + i + "_2").attr("checked") });
            }
            return list;
        }
        function setFreeTime() {
            var list = eval(resume.FreeTimes);
            for (var i = 0; i < list.length; i++) {
                $("#chk_" + list[i].Day + "_1").attr("checked", list[i].AM);
                $("#chk_" + list[i].Day + "_2").attr("checked", list[i].PM);
            }
        }
    </script>
    <script type="text/javascript">
        function postResume(callback) {

            if ($("#divMInfo").css("display") != "none") {
                if (!checkInput()) {
                    callback(false);
                    return;
                }
                saveResume(callback, true);
            }
            else {
                callback(true);
            }
        }
        function checkInput() {
            return infomationvalidate1();
        }
    </script>
</body>
</html>
