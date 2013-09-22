<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.Resume>" %>
<%@ Import Namespace="Infomation.Core.Extensions" %>
<!DOCTYPE html>

<html>
<head runat="server">
    <title>求职简历发布成功-<%=SiteInfo.Name%></title>
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/ui6/zp/user20110815.css" />

    <script type="text/javascript" src="/Content/Fenlei/Scripts/c8/28.js"></script>
    <%--<script type="text/javascript" src="/Content/Fenlei/Scripts/jianli/jquery.js"></script>--%>
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
    <%--<script type="text/javascript" src="/Content/Fenlei/Scripts/jianli/resume.js"></script>--%>

    <script src="/Content/Fenlei/Scripts/fileupload/upload.js?v20110101" type="text/javascript"></script>
</head>
<body>

    <div class="chuangjian">
       <div class="area_b">
        <ul id="area_nav" class="area_nav">
            <li class="selected"><a href="javascript:void(0);">我的简历</a></li>
            <li><a href="<%=Url.Action("jianli","my") %>">简历投递记录</a></li>
        </ul>
           <div class="wzd_top">简历完整度：<span class="per"><span id="paPic" style="width:0%"></span></span><strong id="paNum">0%</strong></div>
       </div>
    
    <div class="area_bottom"></div>
    <div id="view">
        <input type="hidden" id="hidresume" value="0" />
        
        <div class="sample" id="divSInfo" style="display:none">
            <ul class="s_info" id="ulSInfo">
        	    <li class="title"></li>
                <li><i>手机：</i></li>
                <li><i>电子邮件：</i></li>
                <li><i>现居住地：</i></li>
                <li><i>最高学历：</i></li>
                <li><i>工作年限：</i></li>
                <li class="padt"><i>求职职位：</i></li>
                <li><i>目前职位：</i></li>
                <li><i style="vertical-align:top">概括自己：</i><span style="width:639px;display:inline-block"></span></li>
            </ul>
            <div class="editorpic">
        	    <p><a href="javascript:modyInfo();">修改基本信息</a></p>
                
            </div>
        </div>

        <form id="aspnetForm" method="post" enctype="multipart/form-data">
        <div class="sample" id="divMInfo" style="display:none"><%--style="display:none"--%>
    	    <table cellpadding="0" cellspacing="0" class="box_table">
                <tr>
                    <th>简历名称：</th>
                    <td style="width:689px">
                        <input type="text" class="textstyle" id="txtResumeName" value='' />
                        <span id="txtResumeNameInfo"></span>
                    </td>
                </tr>
                <tr>
                    <th><b>*</b>求职职位：</th>
                    <td>
                        <span class="choose clickwindow" id="selPosCate1">
                            <span class="c99">请选择职位类别</span>
                            <div class="setbox" id="divPosCate1" style="width:480px;display:none"><%--display:none--%>
                            正在加载中，请稍等...
                            </div>

                            <%--<div class="setboxline" style="display:none" id="divPosCateU1"></div>
                            <iframe id="DivShim1" scrolling="no" frameborder="0" style="position:absolute; top:0px; left:0px; display:none;filter=progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);"></iframe>
                            <input type="hidden" id="hidPC1" value="0" />
                            <input type="hidden" id="hidPCN1" value="" />
                            <input type="hidden" id="hidSPC1" value="0" />
                            <input type="hidden" id="hidSPCN1" value="" />--%>
                        </span> 
                        <span class="fl">
                            <input type="text" class="textstyle" id="txtTPosition" value='' />
                            <select id="salary">
                                <option value="-1">期望薪资</option>
                                <option value='0-0' selected="selected">面议</option>
                                <option value='0-100'>1000以下</option>
                                <option value='1000-2000'>1000-2000</option>
                                <option value='2000-3000'>2000-3000</option>
                                <option value='3000-5000'>3000-5000</option>
                                <option value='5000-8000'>5000-8000</option>
                                <option value='8000-12000'>8000-12000</option>
                                <option value='12000-20000'>12000-20000</option>
                                <option value='20000-25000'>20000-25000</option>
                                <option value='25000-0'>25000以上</option>
                            </select> 元/月
                        </span> 
                        <span id="txtTPositionInfo"></span>
                    </td>
                </tr>
                <tr>
                    <th><b>*</b>概括自己：</th>
                    <td><textarea id="txtLetter" style="height:35px"></textarea><span id="txtLetterInfo"></span></td>
                </tr>
                <tr>
                    <th><b>*</b>姓 &nbsp; &nbsp; 名：</th>
                    <td>
                        <input type="text" class="textstyle" id="txtUserName" size="10" maxlength=4 value='' />
                        <select id="selGender">
                            <option value="-1">性别</option>
                            <option value='1' selected="selected">男</option>
                            <option value='0'>女</option>
                        </select><b>*</b>
                        出生年月：
                        <input type="hidden" id="hidYear" value='1985' /><%--type="hidden"--%>
                        <span class="dingweiyong" id="spInfoYear" style="z-index:16"></span> 年 
                        <input type="hidden" id="hidMonth" value='1' /><%--type="hidden"--%>
                        <span class="dingweiyong" id="spInfoMonth" style="z-index:16"></span> 月 
                        <span id="txtTrueNameInfo"></span>
                    </td>
                </tr>
                <tr>
                    <th valign="top"><b>*</b>最高学历：</th>
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
            <tr id="trEdu" style="display:none"><%--style="display:none"--%>
                <td colspan="2" style="width:795px;">
                    <div class="tbg" id="divTempEduc" style="display:none"><%--style="display:none"--%>
                        <table cellpadding="0" cellspacing="0" class="box_table" id="tabAddEduc2" style="display:none">
                            <tr>
            	                <th>&nbsp;</th>
            	                <td><label class="btn-v4"><input type="button" value="添加教育背景" onclick="addTempEduc()" /></label></td>
                            </tr>
                        </table>
                        <table cellpadding="0" cellspacing="0" class="box_table" id="tabModyEduc2">
                            <tr>
            	                <th><b>*</b>学校名称：</th><td><input type="text" class="textstyle" id="txtSchool2" /> <b>*</b>专业：<input type="text" class="textstyle" id="txtProfessional2" /> <span id="txtSchoolInfo2" style="z-index:15"></span><input type="hidden" id="hidUpEducId2" value="0" /></td>
                            </tr>
                            <tr>
            	                <th><b>*</b>在校时间：</th><td><span class="dingweiyong" id="spEduStatYear2" style="z-index:15"></span> 年 <span class="dingweiyong" id="spEduStatMonth2" style="z-index:15"></span> 月 - <span class="dingweiyong" id="spEduEndYear2" style="z-index:15"></span> 年 <span class="dingweiyong" id="spEduEndMonth2" style="z-index:15"></span> 月 <span id="educDateInfo2"></span></td>
                            </tr>
                            <tr>
            	                <th>&nbsp;</th>
            	                <td>
            	                    <label class="btn-v4"><input type="button" value="保存教育背景" onclick="saveTempEdu();" /></label><%--onclick="subformTempEdu(backfunTempEdu);"--%>
            	                    <input type="button" value="取消" class="btn-v2" id="btnCancelEdu2" style="display:none;" onclick="cancelTempEdu()" />
            	                    <span id="txtEducationInfoSave"></span>
            	                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <th valign="top"><b>*</b>工作经验：</th>
                <td>
                    <select id="selWorked">
                        <option value="-1">工作年限</option>
                        <option value='0-0'>无经验</option>
                        <option value='1-3'>1-3年</option>
                        <option value='3-5'>3-5年</option>
                        <option value='5-10'>5-10年</option>
                        <option value='10-0'>10年以上</option>
                    </select>
                    <span id="txtWorkedInfo"></span>
                </td>
            </tr>
            <tr id="trExpe" style="display:none"><%--style="display:none"--%>
                <td colspan="2" style="width:795px;">
                    <div class="tbg" id="divTempExpe" style="display:none"><%--style="display:none"--%>
                        <table cellpadding="0" cellspacing="0" class="box_table" id="tabAddExpe2" style="display:none">
                            <tr>
            	                <th>&nbsp;</th>
            	                <td><label class="btn-v4"><input type="button" value="添加工作经历" class="btn-v3" onclick="addTempExpe()" /></label></td>
                            </tr>
                        </table>
                        <table cellpadding="0" cellspacing="0" class="box_table" id="tabModyExpe2">
                            <tr>
            	                <th><b>*</b>公司名称：</th><td><input type="text" class="textstyle" size="35" id="txtCompName2" /> <span id="txtCompNameInfo2"></span><input type="hidden" id="hidUpExpeId2" value="0" /></td>
                            </tr>
                            <tr>
            	                <th><b>*</b>职位名称：</th>
                                <td>
                                    <span class="choose clickwindow" id="selPosCate2" style="z-index:14">
                                        <span class="c99">请选择职位类别</span>
                                        <div class="setbox" id="divPosCate2" style="width:480px;display:none">正在加载中，请稍等...</div>
                                        <%--<div class="setboxline" style="display:none" id="divPosCateU2"></div>
                                        <iframe id="DivShim2" scrolling="no" frameborder="0" style="position:absolute; top:0px; left:0px; display:none;filter=progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);"></iframe>
                                        <input type="hidden" id="hidPC2" value="0" /><input type="hidden" id="hidPCN2" value="" />
                                        <input type="hidden" id="hidSPC2" value="0" /><input type="hidden" id="hidSPCN2" value="" />--%>
                                    </span> 
                                    <span class="fl">
                                    <input type="text" class="textstyle" id="txtPositionName2" />
                                    <select id="positionSalary2">
                                        <option value="-1">职位薪资</option>
                                        <option value='0-0'>保密</option>
                                        <option value='0-999'>1000以下</option>
                                        <option value='1000-2000'>1000-2000</option>
                                        <option value='2000-3000'>2000-3000</option>
                                        <option value='3000-5000'>3000-5000</option>
                                        <option value='5000-8000'>5000-8000</option>
                                        <option value='8000-12000'>8000-12000</option>
                                        <option value='12000-20000'>12000-20000</option>
                                        <option value='20000-25000'>20000-25000</option>
                                        <option value='25000-0'>25000以上</option>
                                    </select> 元/月</span> 
                                    <span id="txtPositionInfo2" style="z-index:14"></span></td>
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
                                        <input type="button" value="保存工作经历" onclick="saveTempExpr();"/><%--onclick="subformTempExpr(backfunTempExpr);"--%>
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
                <th><b>*</b>手 &nbsp; &nbsp; 机：</th>
                <td>
                    <input type="text" class="textstyle" id="txtMobile" value='' />
                    <span id="txtMobileInfo" style="z-index:12"></span>
                </td>
            </tr>
            <tr>
                <th><b>*</b>电子邮件：</th>
                <td>
                    <input type="text" class="textstyle" id="txtEmail" value='liliesheng@yahoo.com.cn' />
                    <span id="txtMailInfo"></span>
                </td>
            </tr>
            <tr>
                <th><b>*</b>现居住地：</th>
                <td>
                    <input type="hidden" id="hidNowLive" cid='0' cname='' aid='0' aname='' nid='0' nname='' value='0' />
                    <span class="dingweiyong" style="z-index:11;margin-right:3px;">
                        <input id="txtLiveCity" type="text" class="textstyle" size="8" readonly="readonly" />
                        <div class="zhankai" id="divLiveCity" style="display:none"><%--style="display:none"--%>
                        </div>
                        <iframe id="DivShimC" scrolling="no" frameborder="0" style="position:absolute; top:0px; left:0px; display:none;filter=progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);"></iframe>
                    </span>
                    <span class="dingweiyong" style="z-index:11;margin-right:3px;">
                        <input id="txtLiveArea" type="text" class="textstyle" size="8" readonly="readonly" />
                        <div class="zhankai" id="divLiveArea" style="display:none"> <%--style="display:none"--%>
                        </div>
                        <iframe id="DivShimA" scrolling="no" frameborder="0" style="position:absolute; top:0px; left:0px; display:none;filter=progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);"></iframe>
                    </span>
                    <span class="dingweiyong" style="z-index:11;margin-right:3px;">
                        <input id="txtLiveName" type="text" class="textstyle" size="8" readonly="readonly" />
                        <div class="zhankai" id="divLiveName" style="display:none"><%--style="display:none"--%>
                        </div>
                        <iframe id="DivShimN" scrolling="no" frameborder="0" style="position:absolute; top:0px; left:0px; display:none;filter=progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);"></iframe>
                    </span>
                    <span id="txtNowLiveInfo"></span>
                </td>
            </tr>
            <tr style="height:20px;display:none"><td></td><td></td></tr>
            <tr><th>&nbsp;</th><td><div id="uploadPic" class="uploadPic" value=""></div>
                <script type="text/javascript">
                    $info.Uploader.init();
                </script></td>
            </tr>
            <tr>
                <th>&nbsp;</th>
                <td><label class="butt">
                    <input id="btnInfo" type="button" value="保存" class="btns" /><%--onclick="subform1(backfun1);"--%>
                </label></td>
            </tr>
            </table>
            <div style="height:1px; margin-top:-1px;clear: both;overflow:hidden;"></div>
        </div>
        </form>


        <div class="box" id="divExpe" style="display:none">
            <%--<ul class='worklist' id='ulExpe20074273'>
                <input id='hidExpeVal20074273' type='hidden' value="杭州'1'销售'2'销售代表'销售代表'5'2008'9'2010'6'网站推广告，网站销售" />
                <li>
                    <span class='editdisplay'>
                        <a href='javascript:editExpe(20074273);'>修改</a> &nbsp;
                        <a href='javascript:subformDel(backfunExpeDel,20074273,"resumeexpedel","您确定要删除该工作经验吗？");'>删除</a>
                    </span>
                    2008 年 9 月—2010 年 6 月 <span>|</span> 
                    杭州 <span>|</span> 
                    销售代表 <span>|</span> 
                    5000-8000 元/月
                </li>
                <li>网站推广告，网站销售</li>
            </ul>--%>
            <table cellpadding="0" cellspacing="0" class="box_table" id="tabAddExpe" style="display:none">
                <tr>
            	    <th>&nbsp;</th>
            	    <td><label class="btn-v4"><input type="button" value="添加工作经历" onclick="addExpe()" /></label></td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" class="box_table" id="tabModyExpe" style="display:none">
                <tr>
            	    <th><b>*</b>公司名称：</th>
                    <td>
                        <input type="text" class="textstyle" size="35" id="txtCompName" />
                        <span id="txtCompNameInfo"></span>
                        <input type="hidden" id="hidUpExpeId" value="0" />
                    </td>
                </tr>
                <tr>
            	    <th><b>*</b>职位名称：</th>
                    <td>
                        <span class="choose clickwindow" id="selPosCate3">
                            <span class="c99">请选择职位类别</span>
                            <div class="setbox" id="divPosCate3" style="width:480px;display:none">正在加载中，请稍等...</div>
                            <%--<div class="setboxline" style="display:none" id="divPosCateU3"></div>
                            <iframe id="DivShim3" scrolling="no" frameborder="0" style="position:absolute; top:0px; left:0px; display:none;filter=progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0);"></iframe>
                            <input type="hidden" id="hidPC3" value="0" /><input type="hidden" id="hidPCN3" value="" />
                            <input type="hidden" id="hidSPC3" value="0" /><input type="hidden" id="hidSPCN3" value="" />--%>
                        </span> 
                        <span class="fl">
                            <input type="text" class="textstyle" id="txtPositionName" />
                            <select id="positionSalary">
                                <option value="-1">职位薪资</option>
                                <option value='0-0'>保密</option>
                                <option value='0-1000'>1000以下</option>
                                <option value='1000-2000'>1000-2000</option>
                                <option value='2000-3000'>2000-3000</option>
                                <option value='3000-5000'>3000-5000</option>
                                <option value='5000-8000'>5000-8000</option>
                                <option value='8000-12000'>8000-12000</option>
                                <option value='12000-20000'>12000-20000</option>
                                <option value='20000-25000'>20000-25000</option>
                                <option value='25000-0'>25000以上</option>
                            </select> 元/月</span>
                            <span id="txtPositionInfo"></span></td>
                </tr>
                <tr>
            	    <th><b>*</b>工作时间：</th><td><span class="dingweiyong" id="spPosStatYear"></span> 年 <span class="dingweiyong" id="spPosStatMonth"></span> 月 - <span class="dingweiyong" id="spPosEndYear"></span> <span id="spEnd">年 <span class="dingweiyong" id="spPosEndMonth"></span> 月</span> <span id="posDateInfo"></span></td>
                </tr>
                <tr>
            	    <th><b>*</b>工作内容：</th><td><textarea style="height:35px" id="txtPerformance"></textarea> <span id="txtPerformanceInfo"></span></td>
                </tr>
                <tr>
            	    <th>&nbsp;</th>
            	    <td>
            	        <label class="btn-v4">
                            <input type="button" value="保存工作经历" onclick="saveExpr();" /><%--onclick="subformExpr(backfunExpr);"--%>
                        </label>
            	        <input type="button" value="取消" class="btn-v2" onclick="cancelExpe()" />
            	    </td>
                </tr>
            </table>
        </div>
        <div class="box" style="display:none" id="divEduc">
            <h3 id="hEduc" style="display:none">填写教育背景能帮助您尽快找到工作 <span>(招聘企业96%都非常关心求职者的教育背景，好的教育背景能提高80%的求职成功率。)</span></h3>
            
            <table cellpadding="0" cellspacing="0" class="box_table" id="tabAddEduc" style="display:none">
                <tr>
            	    <th>&nbsp;</th>
            	    <td><label class="btn-v4"><input type="button" value="添加教育背景" onclick="addEduc()" /></label></td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" class="box_table" id="tabModyEduc" style="display:none">
                <tr>
            	    <th><b>*</b>学校名称：</th><td><input type="text" class="textstyle" id="txtSchool" /> <b>*</b>专业：<input type="text" class="textstyle" id="txtProfessional" /> <span id="txtSchoolInfo"></span><input type="hidden" id="hidUpEducId" value="0" /></td>
                </tr>
                <tr>
            	    <th><b>*</b>在校时间：</th><td><span class="dingweiyong" id="spEduStatYear"></span> 年 <span class="dingweiyong" id="spEduStatMonth"></span> 月 - <span class="dingweiyong" id="spEduEndYear"></span> 年 <span class="dingweiyong" id="spEduEndMonth"></span> 月 <span id="educDateInfo"></span></td>
                </tr>
                <tr>
            	    <th>&nbsp;</th>
            	    <td>
            	        <label class="btn-v4">
                            <input type="button" value="保存教育背景" onclick="saveEdu();" /><%--onclick="subformEdu(backfunEdu);"--%>
                        </label>
            	        <input type="button" value="取消" class="btn-v2" onclick="cancelEdu()" />
            	    </td>
                </tr>
            </table>
        </div>
        <div class="box" style="display:none" id="divLang" style="padding-top:0;">
            <h3 id="hLang" style="display:none">填写语言技能能帮助您尽快找到工作 <span>(招聘企业96%都非常关心求职者的语言技能，好的语言技能能提高80%的求职成功率。)</span></h3>
            <div class="one"><h3><span class="icon-one"></span>填写语言优势及证书详情，能获得更多高薪职位面试机会！</h3></div>
            
            <table cellpadding="0" cellspacing="0" class="box_table" id="tabAddLang" style="display:none">
                <tr>
            	    <th>&nbsp;</th>
            	    <td><label class="btn-v4"><input type="button" value="添加语言技能" onclick="addLang()"/></label></td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="0" class="box_table" id="tabModyLang" style="display:none">
                <tr>
            	    <th>语言种类：</th>
                        <td>
                            <select id="selLanguage">
                                <option value='0' selected>英语</option>
                                <option value='1'>日语</option>
                                <option value='2'>韩语</option>
                                <option value='3'>法语</option>
                                <option value='4'>德语</option>
                                <option value='5'>俄语</option>
                                <option value='6'>小语种</option>
                            </select>
                            <select id="selLanguageLev">
                                <option value='0' selected>一般</option>
                                <option value='1'>熟练</option>
                                <option value='2'>精通</option>
                            </select>
                            <input type="hidden" id="hidUpLangId" value="0" />
                        </td>
                </tr>
                <tr>
            	    <th>&nbsp;</th>
            	    <td>
            	        <label class="btn-v4">
                            <input type="button" value="保存语言技能" onclick="saveLang();" /><%--onclick="subformLang(backfunLang);"--%>
                        </label>
            	        <input type="button" value="取消" class="btn-v2" style="display:none;" id="btnCancelLang" onclick="cancelLang()" />
            	    </td>
                </tr>
            </table>
        </div>
        <div class="box" style="display:none" id="divCert">
            <h3 id="hCert" style="display:none">填写专业证书能帮助您尽快找到工作 <span>(招聘企业96%都非常关心求职者的专业证书，好的专业证书能提高80%的求职成功率。)</span></h3>
            
            <table cellpadding="0" cellspacing="0" class="box_table" id="tabAddCert" style="display:none">
                <tr>
            	    <th>&nbsp;</th>
            	    <td><label class="btn-v4"><input type="button" value="添加专业证书" onclick="addCert()"/></label></td>
                </tr>
            </table>
            <form id="aspnetForm1" method=post enctype="multipart/form-data">
            <table cellpadding="0" cellspacing="0" class="box_table" id="tabModyCert" style="display:none">
                <tr>
            	    <th>证书名称：</th><td><input type="text" id="txtCertName" class="textstyle" /><input type="hidden" id="hidUpCertId" value="0" /> <span id="txtCertNameInfo" style="z-index:15"></span></td>
                </tr>
                <tr>
            	    <th>发证机构：</th><td><input type="text" id="txtCertAuthority" class="textstyle" /> 发证时间：<span class="dingweiyong" id="spIssueYear"></span> 年 <span class="dingweiyong" id="spIssueMonth"></span> 月 <span id="txtCertAuthorityInfo"></span></td>
                </tr>
                <tr>
            	    <th>证书照片：</th>
            	    <td id="tdCert"><div id="uploadPic1" class="uploadPic" value=""></div>
                        <script type="text/javascript">
                            $.c.Uploader1.init();
                        </script></td>
                </tr>
                <tr>
            	    <th>&nbsp;</th>
            	    <td>
            	        <label class="btn-v4">
                            <input type="button" value="保存专业证书" onclick="saveCert();" /><%--onclick="subformCert(backfunCert);"--%>
                        </label>
            	        <input type="button" value="取消" class="btn-v2" style="display:none;" id="btnCancelCert" onclick="cancelCert()" />
            	    </td>
                </tr>
            </table></form>
        </div>
        <div class="box" style="display:none" id="divState">
            <table cellpadding="0" cellspacing="0" class="box_table">
                <tr>
            	    <th></th><td class="mode"><label><input type="radio" checked="checked" name="rdoState" value="1" /> 公开</label> 允许所有企业下载您的简历</td>
                </tr>
                <tr>
            	    <th></th><td class="mode"><label><input type="radio"  name="rdoState" value="2" /> 对58公开</label> 只允许<%=SiteInfo.Name%>认证企业下载您的简历</td>
                </tr>
                <tr>
            	    <th></th>
            	    <td class="mode"><label><input type="radio"  name="rdoState" value="3" /> 保密</label> 不允许企业主动下载您的简历，只有您应聘的企业才可查看</td>
                </tr>
                <tr>
            	    <th></th>
            	    <td style="padding-top:15px;"><label><input type="checkbox" style="margin:0;" checked="checked" id="rdoBaidu" /> 允许百度收录我的简历</label></td>
                </tr>
            </table>
        </div>
        <div class="box" style="display:none" id="divComplte">
            <p align="center">
                <label class="butt" id="butt"><input type="button" value="完成简历填写" class="btns" id="btnOK" /></label>
            </p>
            <input type="hidden" id="hidLC" value="0" />
        </div>

	    <span class="v1"></span>
        <span class="v2"></span>
        <span class="v3"></span>
        <span class="v4"></span>
    </div>
    </div>

    <script type="text/javascript" src="/Content/Fenlei/Scripts/jianli/resume_common.js"></script>

    <script type="text/javascript">
        var resumeType = 1; //全职
        var isPostJobInfo = false;
    </script>

    
    
</body>
</html>
