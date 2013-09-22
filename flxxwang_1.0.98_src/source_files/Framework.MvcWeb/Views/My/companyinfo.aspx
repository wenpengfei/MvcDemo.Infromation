<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.Company>" %>


<!DOCTYPE html>

<html>
<head runat="server">
    <title>企业信息</title>
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/ui6/my/css/user.css" />
    <%--<script type="text/javascript" src="/Content/Fenlei/Scripts/5_1/jquery1.3.2.js"></script>--%>
    <script type="text/javascript" src="/Scripts/jquery-ui-1.9m6/jquery-1.6.2.js"></script>
    <script type="text/javascript" src="/Content/Fenlei/Scripts/qy/formvalidator.js"></script>

    <%--<script src="/Scripts/jquery-1.5.1.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>
    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script type="text/javascript" src="/Scripts/framework/cookie.js"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>
    <script src="/Scripts/framework/db.js" type="text/javascript"></script>
    <script type="text/javascript" src="/content/fenlei/scripts/model.js"></script>
    <script type="text/javascript">
        function resizeFrame() {
            if (parent.document.getElementById("ContainerFrame") != null) {
                var hh = (parent.document.getElementById("ContainerFrame").contentWindow.document.body.scrollHeight) + 10;
                parent.document.getElementById("ContainerFrame").style.height = hh + 10 + "px";
            }
        }
    </script>
</head>
<body>
    <div class="area_b" id="comShow">
        <ul id="area_nav" class="area_nav">
            <li class="selected"><a>公司信息</a></li>
            <li><a href="<%=Url.Action("invitesendedlist") %>">发送的面试邀请</a></li>
            <li><a href="<%=Url.Action("favoriteresumelist") %>">已下载简历</a></li>
        </ul>
    </div>
    <div class="area_bottom"></div>
    <div id="div4">
		<div id="CompanyInfo1_a1" class="companytianxie" style="display: block">
			<input type="hidden" id="enterpriseID" name="enterpriseID" value="<%=this.Model.Id %>" />
	        <table id="tableEdit" width="" cellpadding="0" cellspacing="0" class="company company-a">
	            <tr>
	                <th>
	                    <b class="red">*</b> 公司名：
	                </th>
	                <td>
                        <%if (this.Model.Id > 0)
                          { %>
                          <input type="hidden" id="enterpriseName" name="enterpriseName" value="<%=this.Model.CompanyName %>" />
                        <%}
                          else
                          { %>
                          <input type="text" id="enterpriseName" name="enterpriseName" value="<%=this.Model.CompanyName %>" class="inp" />
                        <%} %>
		                <span class="fGrey2 fen f13"></span>&nbsp;
		                <span id="spCompanyTip" class="red" style="font-size: 9pt">填写后不能修改</span>
		                <span id="enterpriseName_Tip"></span>
		            </td>
	            </tr>
	            <tr>
	                <th>
	                    <b class="red">*</b> 公司别称：
	                </th>
	                <td>
		                <input name="enterpriseAlias" type="text" id="enterpriseAlias" size="32" maxlength="30"  value="<%=this.Model.CompanyName2 %>" class="inp" />
		                <span id="CompanyInfo1_lblCompanyBieCheng" class="fGrey2 fen f13"></span>&nbsp;
		                <span id="enterpriseAliasTip" class="red" style="font-size: 9pt">填写后不能修改</span>
		                <span id="enterpriseAlias_Tip"></span>
		            </td>
	            </tr>
	            <tr>
	                <th>
	                    <b class="red">*</b> 所属行业：
	                </th>
	                <td>
	                    <select name="enterpriseTrade" id="enterpriseTrade">
                            <%if (this.Model.TradeId <= 0)
                              {%>
						    <option value="-1" selected="selected">请选择</option>
                            <%}
                              else
                              { %>
                               <option value="-1">请选择</option>
                            <%} %>
                            <%foreach (var item in CompanyTrade.Trades)
                              {%>

                              <% if (item.Id == this.Model.TradeId)
                                 {%>
                              <option value="<%=item.Id %>" selected="selected"><%=item.Name %></option>
                              <%}
                                 else
                                 { %>
                                 <option value="<%=item.Id %>"><%=item.Name %></option>
                              <%} %>
                            <%} %>
                        </select>
                	    <span id="enterpriseTrade_Tip"></span>
	                </td>
	            </tr>
	            <tr>
	                <th>
	                    <b class="red">*</b> 公司性质：
	                </th>
	                <td>
	                    <select name="enterpriseType" id="enterpriseType">
                        <%if (this.Model.TypeId <= 0)
                          { %>
						    <option value="-1" selected="selected">请选择</option>
                            <%}
                          else
                          { %>
                          <option value="-1">请选择</option>
                            <%} %>
                            <%foreach (var item in CompanyType.Types)
                              { %>
                              <%if (item.Id == this.Model.TypeId)
                                { %>
                                <option value="<%=item.Id %>" selected="selected"><%=item.Name %></option>
                              <%}
                                else
                                { %>
                                <option value="<%=item.Id %>"><%=item.Name %></option>
                              <%} %>
                            <%} %>
                        </select>
                	    <span id="enterpriseType_Tip"></span>
	                </td>
	            </tr>
	            <tr>
	                <th>
	                    <b class="red">*</b> 公司规模：
	                </th>
	                <td>
	                    <select name="enterpriseSize" id="enterpriseSize" >
                        <%if (this.Model.SizeId <= 0)
                          { %>
                          <option value="-1" selected="selected">请选择</option>
                        <%}
                          else
                          { %>
                          <option value="-1">请选择</option>
                        <%} %>
	                      <%foreach (var item in CompanySize.Sizes)
                         { %>
                         <%if (item.Id == this.Model.SizeId)
                           { %>
                           <option value="<%=item.Id %>" selected="selected"><%=item.DisplayName %></option>
                         <%}
                           else
                           { %>
                           <option value="<%=item.Id %>"><%=item.DisplayName %></option>
                         <%} %>
                          <%} %>  
                        </select>
                	    <span id="enterpriseSize_Tip"></span>
	                </td>
	            </tr>
	            <tr>
	                <th>
	                    <b class="red">*</b> 联系人：
	                </th>
	                <td>
	                    <input name="linkMan" type="text" id="linkMan" maxlength="20" value="<%=this.Model.ContactPerson %>" class="inp" />
                	    <span id="linkMan_Tip"></span>
	                </td>
	            </tr>
	            <tr>
	                <th>
	                    <b class="red">*</b> 联系电话：
	                </th>
	                <td>
	                    <input name="phone" type="text" id="phone" value="<%=this.Model.Phone %>" class="inp" maxlength="20" />
                	    <span id="phone_Tip"></span>
	                </td>
	            </tr>
	            <tr>
	                <th>
	                    <b class="red">*</b> 电子邮件：
	                </th>
	                <td>
	                    <input name="email"" type="text" id="email" value="<%=this.Model.Email %>" class="inp"/>
                	    <span id="email_Tip"></span>
	                </td>
	            </tr>
	            <tr>
	                <th>
	                    <b class="red">*</b> 公司地址：
	                </th>
	                <td>
	                    <input name="address" type="text" id="address" maxlength="24"  value="<%=this.Model.Address %>" class="inp" />
                	    <span id="address_Tip"></span>
	                </td>
	            </tr>
	            <tr>
	                <th>
	                    <b class="red">*</b> 公司简介：
	                </th>
	                <td>
	                    <textarea id="intro" name="intro" id="txtRemark" cols="80" rows="10"><%=this.Model.Content %></textarea>
	                    <div style="height: 40px;">
	                	    <span id="intro_Tip"></span>
		                </div>
	                </td>
	            </tr>
	            <tr>
	                <th>&nbsp;</th>
	                <td>
	                    <br />
	            	    <br />
	                    <input name="ctl00$btnSave" type="button" id="btnSave" onclick="subform();return false;" value="保存" class="btn-v2"  />
	                    <input type="button" id="btnCancel" class="btn-v2" value="取消" onclick="javascript:document.getElementById('CompanyInfo1_a0').style.display='block';document.getElementById('CompanyInfo1_a1').style.display='none';resizeFrame();return false;" />
	                </td>
	            </tr>
	        </table>
	    </div>
    </div>
</body>

<script type="text/javascript">
    var parentcontainer = parent.document.getElementById("ContainerFrame");
    if (parentcontainer) {
        var hh = parentcontainer.contentWindow.document.body.scrollHeight;
        parentcontainer.style.height = hh + 10 + "px";
    }
    jQuery(document).ready(function () {//pageIsValid
        jQuery.formValidator.initConfig({ formid: "", errorfocus: true, btnid: '' });
        jQuery("#enterpriseName")
		.formValidator({ onfocus: "2-30个字，只能填汉字,字母,数字及括号" })
		.inputValidator({ onerror: "请输入公司名称" })
		.regexValidator({ regexp: "^[\u4e00-\u9fa5|A-Za-z0-9\（）\(\)]{2,30}$", onerror: "2-30个字，只能填汉字,字母,数字及括号" });
        jQuery("#enterpriseAlias")
		.formValidator({ onfocus: "2-30个字，只能填汉字,字母,数字及括号" })
		.inputValidator({ onerror: "请输入公司别名" })
		.regexValidator({ regexp: "^[\u4e00-\u9fa5|A-Za-z0-9\（）\(\)]{2,30}$", onerror: "2-30个字，只能填汉字,字母,数字及括号" });

        jQuery("#enterpriseTrade")
		.formValidator({ onfocus: "请选择公司行业。" })
		.inputValidator({ onerror: "请选择公司行业" })
		.functionValidator({ fun: function () { return (jQuery("#enterpriseTrade").val() != '-1'); }, onerror: "请选择公司行业。" });
        jQuery("#enterpriseType")
		.formValidator({ onfocus: "请选择公司性质。" })
		.inputValidator({ onerror: "请选择公司性质" })
		.functionValidator({ fun: function () { return (jQuery("#enterpriseType").val() != '-1'); }, onerror: "请选择公司性质。" });
        jQuery("#enterpriseSize")
		.formValidator({ onfocus: "请选择公司规模。" })
		.inputValidator({ onerror: "请选择公司规模" })
		.functionValidator({ fun: function () { return (jQuery("#ddlCompanyTrade").val() != '-1'); }, onerror: "请选择公司规模。" });
        jQuery("#phone")
		.formValidator({ onfocus: "请输入联系电话。", q2b: true })
		.inputValidator({ onerror: "请输入联系电话" })
		.regexValidator({ regexp: "(^(1[0-9]|14[0-9]|15[0-9]|18[0-9])\\d{9}$)|(^(\\d{3,4})?[-]?\\d{7,8}(-\\d{1,4})?$)", onerror: "请输入正确联系电话,如:13811775858,010-11111111。" });
        jQuery("#email")
		.formValidator({ onfocus: "请输入电子邮件。" })
		.inputValidator({ onerror: "请输入电子邮件" })
		.regexValidator({ regexp: "^\\w+([-+.]\\w+)*@[a-zA-Z0-9]{1}([-a-zA-Z0-9]{0,61}[a-zA-Z0-9]{1})?\\.[a-zA-Z0-9]+([.a-zA-Z0-9]+)*$", onerror: "请输入正确的邮件,如:myname@sina.com " });
        jQuery("#linkMan")
		.formValidator({ onfocus: "请填写联系人！" })
		.inputValidator({ onerror: "请正确输入联系人,2-10个字。" })
		.regexValidator({ regexp: "^[a-zA-Z\u4E00-\u9FA5]{2,10}$", onerror: "只能由中英文字符组成(2-10个字)。" });
        jQuery("#address")
		.formValidator({ onfocus: "请输入公司地址。" })
		.inputValidator({ onerror: "请输入公司地址" })
		.regexValidator({ regexp: "^[\\w\\u4e00-\\u9fa5]{10,24}$", onerror: "只能填写汉字,数字,字母(10-24个字)。" });
        jQuery("#intro")
		.formValidator({ onfocus: "50-800字，不能填写电话、QQ等联系方式。" })
		.inputValidator({ onerror: "50-800字，不能填写电话、QQ等联系方式。" })
		.regexValidator({ regexp: "^[\\s\\S]{50,800}$", onerror: "50-800字，不能填写电话、QQ等联系方式。" });
    });


    function subform() {
        if (jQuery.formValidator.pageIsValid()) {
            var userid = $f.cookie.get("userId");
            if (userid == null || userid == "") {
                alert("未登陆");
                return;
            }
            var company = new Company();
            company.Id = parseInt($("#enterpriseID").val(), 10);
            company.UserId = parseInt(userid,10);
            company.CompanyName=$("#enterpriseName").val();
            company.CompanyName2 = $("#enterpriseAlias").val();
            company.Address = $("#address").val();
            company.TradeId = parseInt($("#enterpriseTrade").val(), 10);
            company.TypeId = parseInt($("#enterpriseType").val(), 10);
            company.SizeId = parseInt($("#enterpriseSize").val(), 10);
            company.Phone = $("#phone").val();
            company.Content = $("#intro").val();
            company.ContactPerson = $("#linkMan").val();
            company.Email = $("#email").val();
            company.DateCreated = new Date().toJson(true);
            company.DateModified = company.DateCreated;
            
            if (company.Id > 0) {
                company.Update(function () {
                    alert("操作成功");
                }, function () {
                    alert("操作失败");
                });
            }
            else {
                company.Insert(function () {
                    alert("操作成功");
                }, function () {
                    alert("操作失败");
                });
            }

//            jQuery.ajax({
//                url: "/addent/add/?key=",
//                data: {
//                    enterpriseID: jQuery("#enterpriseID").val(),
//                    enterpriseName: jQuery("#enterpriseName").val(),
//                    enterpriseAlias: jQuery("#enterpriseAlias").val(),
//                    address: jQuery("#address").val(),
//                    enterpriseTrade: jQuery("#enterpriseTrade").val(),
//                    enterpriseType: jQuery("#enterpriseType").val(),
//                    enterpriseSize: jQuery("#enterpriseSize").val(),
//                    phone: jQuery("#phone").val(),
//                    intro: jQuery("#intro").val(),
//                    linkMan: jQuery("#linkMan").val(),
//                    email: jQuery("#email").val(),
//                    produceid: 2
//                },
//                type: 'post',
//                dataType: 'html',
//                success: function (data, textStatus) {
//                    if (data.indexOf("error") > -1) {
//                        alert(data);
//                    } else {
//                        window.location.href = location.href;
//                    }
//                }
//            });
        }
    }
</script>
<script type="text/javascript">
    window.onload = function () {
        setTimeout("resizeFrame()", 500);
    }
    function resizeFrame() {
        if (parent.document.getElementById("ContainerFrame") != null) {
            var hh = (parent.document.getElementById("ContainerFrame").contentWindow.document.body.scrollHeight) + 10;
            parent.document.getElementById("ContainerFrame").style.height = hh + 10 + "px";
        }
    }
</script> 

</html>
