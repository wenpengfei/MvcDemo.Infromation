//====================================================================================================
// [插件名称] jQuery formValidator
//----------------------------------------------------------------------------------------------------
// [描    述] jQuery formValidator表单验证插件，它是基于jQuery类库，实现了js脚本于页面的分离。对一个表
//            单对象，你只需要写一行代码就可以轻松实现20种以上的脚本控制。现支持一个表单元素累加很多种
//            校验方式,采用配置信息的思想，而不是把信息写在表单元素上，能比较完美的实现ajax请求。
//----------------------------------------------------------------------------------------------------
// [作者网名] 猫冬	
// [邮    箱] wzmaodong@126.com
// [作者博客] http://wzmaodong.cnblogs.com
// [更新日期] 2008-01-24
// [版 本 号] ver3.3
//====================================================================================================
var jQuery_formValidator_initConfig;
(function($) {

    $.formValidator =
{
    //各种校验方式支持的控件类型
    grouplist: [],
    sustainType: function(id, setting) {
        var elem = $("#" + id).get(0);
        var srcTag = elem.tagName;
        var stype = elem.type;
        switch (setting.validatetype) {
            case "InitValidator":
                return true;
            case "InputValidator":
                if (srcTag == "INPUT" || srcTag == "TEXTAREA" || srcTag == "SELECT") {
                    return true;
                } else {
                    return false;
                }
            case "CompareValidator":
                if (srcTag == "INPUT" || srcTag == "TEXTAREA") {
                    if (stype == "checkbox" || stype == "radio") {
                        return false;
                    } else {
                        return true;
                    }
                }
                return false;
            case "AjaxValidator":
                if (stype == "text" || stype == "textarea" || stype == "file" || stype == "password" || stype == "select-one") {
                    return true;
                } else {
                    return false;
                }
            case "RegexValidator":
                if (srcTag == "INPUT" || srcTag == "TEXTAREA") {
                    if (stype == "checkbox" || stype == "radio") {
                        return false;
                    } else {
                        return true;
                    }
                }
                return false;
            case "FunctionValidator":
                return true;
            case "GroupValidator":
                return true;
        }
    },

    initConfig: function(controlOptions) {
        var settings =
		{
		    debug: false,
		    validatorgroup: "1",
		    alertmessage: false,
		    validobjectids: "",
		    forcevalid: false,
		    onsuccess: function() { return true; },
		    onerror: function() { },
		    submitonce: false,
		    formid: "",
		    autotip: false,
		    tidymode: false,
		    errorfocus: true,
		    wideword: true,
		    btnid: "",
		    btnvalue: "",
		    btnactionvalue: "",
		    fun: null,
		    errorclass: "wrong1",
		    focusclass: "action1",
		    successclass: "chenggong1",
		    tiphtml: '<span class="action_po"><span class="action_po_top">{0}</span><span class="action_po_bot"></span></span>'
		};
        controlOptions = controlOptions || {};
        $.extend(settings, controlOptions);
        //如果是精简模式，发生错误的时候，第一个错误的控件就不获得焦点
        if (settings.tidymode) { settings.errorfocus = false };
        if (settings.formid != "") {
            $("#" + settings.formid).submit(function() {
                if ($.formValidator.pageIsValid("1")) {
                    if (settings.fun) {
                        if (settings.fun()) {
                            $.formValidator.subform(settings.formid, settings.btnid, settings.btnactionvalue);
                        }
                        else {
                            return false;
                        }
                    }
                    else {
                        $.formValidator.subform(settings.formid, settings.btnid, settings.btnactionvalue);
                    }
                }
                return false;
            })
        };
        if (jQuery_formValidator_initConfig == null) { jQuery_formValidator_initConfig = new Array(); }
        jQuery_formValidator_initConfig.push(settings);
    },
    subform: function(fid, bid, btnactionvalue) {
        var form = $("#" + fid).get(0);
        var btn = $("#" + bid).get(0);
        //form.action = "http://my1.flxxwang.com/submit/login/";
        if (!form.onsubmit || (form.onsubmit() != false)) {
            form.submit();
        }
        btn.disabled = true;
        btn.value = btnactionvalue;
    }
    ,
    subfalse: function(fid, bid, btnvalue) {
        var btn = $("#" + bid).get(0);
        btn.disabled = false;
        btn.value = btnvalue;
    }
    ,
    //如果validator对象对应的element对象的validator属性追加要进行的校验。
    appendValid: function(id, setting) {
        //如果是各种校验不支持的类型，就不追加到。返回-1表示没有追加成功
        if (!$.formValidator.sustainType(id, setting)) return -1;
        var srcjo = $("#" + id).get(0);
        //重新初始化
        if (setting.validatetype == "InitValidator" || srcjo.settings == undefined) { srcjo.settings = new Array(); }
        var len = srcjo.settings.push(setting);
        srcjo.settings[len - 1].index = len - 1;
        return len - 1;
    },

    //如果validator对象对应的element对象的validator属性追加要进行的校验。
    getInitConfig: function(validatorgroup) {
        if (jQuery_formValidator_initConfig != null) {
            for (i = 0; i < jQuery_formValidator_initConfig.length; i++) {
                if (validatorgroup == jQuery_formValidator_initConfig[i].validatorgroup) {
                    return jQuery_formValidator_initConfig[i];
                }
            }
        }
        return null;
    },

    //触发每个控件上的各种校验
    triggerValidate: function(returnObj) {
        $.formValidator.trimTextBox(returnObj);
        switch (returnObj.setting.validatetype) {
            case "InputValidator":
                $.formValidator.inputValid(returnObj);
                break;
            case "CompareValidator":
                $.formValidator.compareValid(returnObj);
                break;
            case "AjaxValidator":
                $.formValidator.ajaxValid(returnObj);
                break;
            case "RegexValidator":
                $.formValidator.regexValid(returnObj);
                break;
            case "FunctionValidator":
                $.formValidator.functionValid(returnObj);
                break;
            case "GroupValidator":
                $.formValidator.groupValid(returnObj);
                break;
        }
    },

    // 去掉输入框中的首尾空格
    trimTextBox: function(returnObj) {
        var obj = $('#' + returnObj.id);
        if (obj.length > 0) {
            var tagName = obj.get(0).tagName.toUpperCase();
            if ((tagName == 'INPUT' && obj.get(0).type.toUpperCase() == 'TEXT') || tagName == 'TEXTAREA') {
                var val = $.trim(obj.val());
                obj.val(val);
            }
        }
    },
    clearErrorTip: function() {
        var initConfig = $.formValidator.getInitConfig("1");
        var errorTips = $("span[class='" + initConfig.errorclass + "']");
        for (var i = 0; i < errorTips.length; i++) {
            var id = errorTips[i].id;
            //$(errorTips[i]).attr
            $(errorTips[i]).removeClass(initConfig.errorclass);
            $(errorTips[i]).html('');
        }
        //$("input[type='" + sType + "'][name='" + srcjo.attr("name") + "'][checked]").length;
    },
    //设置显示信息
    setTipState: function(elem, showclass, showmsg, tipid) {
        //        if ($.j.isTextBox(elem))
        $(elem).removeClass('wrong_color').addClass('action_color');
        var tip;
        if (!tipid) {
            var setting0 = elem.settings[0];
            var initConfig = $.formValidator.getInitConfig(setting0.validatorgroup);
            tip = $("#" + setting0.tipid);
        }
        else {
            tip = $("#" + tipid);
            if (!initConfig) {
                //var setting1 = $("#" + tipid.replace("_Tip", "")).get(0).settings[0];
                initConfig = $.formValidator.getInitConfig("1");
            }
        }
        if (showmsg == null || showmsg == "") {
            //tip.hide();
        }
        else {
            tip.removeClass();
            if (showclass == "onError") {
                tip.addClass(initConfig.errorclass);
                tip.html(initConfig.tiphtml.replace('{0}', showmsg));
            }
            else if (showclass == "onCorrect") {
                tip.addClass(initConfig.successclass);
                tip.html('');
            }
            else if (showclass == "clear") {
                tip.addClass("");
                tip.html('');
            }
            else {
                tip.addClass(initConfig.focusclass);
                tip.html(initConfig.tiphtml.replace('{0}', showmsg));
            }
            //<span id="regNickNameState"><span class="action_po"><span id="regNickNameInfo" class="action_po_top"></span><span class="action_po_bot"></span></span></span>

        }
    },
    resetTipState: function(validatorgroup) {
        var initConfig = $.formValidator.getInitConfig(validatorgroup);
        $(initConfig.validobjectids).each(function() {
            $.formValidator.setTipState(this, "onShow", this.settings[0].onshow);
        });
    },

    //设置错误的显示信息
    setFailState: function(tipid, showmsg) {
        var tip = $("#" + tipid);
        tip.removeClass();
        tip.addClass("onError");
        tip.html(showmsg);
    },
    //根据单个对象,正确:正确提示,错误:错误提示
    showMessage: function(returnObj) {
        var id = returnObj.id;
        var elem = $("#" + id).get(0);
        var isvalid = returnObj.isvalid;
        var setting = returnObj.setting; //正确:setting[0],错误:对应的setting[i]
        var showmsg = "", showclass = "";
        var settings = $("#" + id).get(0).settings;
        var intiConfig = $.formValidator.getInitConfig(settings[0].validatorgroup);
        if (!isvalid) {
            showclass = "onError";
            if (setting.validatetype == "AjaxValidator") {
                if (setting.lastValid == "") {
                    showclass = "onLoad";
                    showmsg = setting.onwait;
                }
                else {
                    showmsg = setting.onerror;
                }
            }
            else {
                showmsg = (returnObj.errormsg == "" ? setting.onerror : returnObj.errormsg);
            }
            if (intiConfig.alertmessage) {
                var elem = $("#" + id).get(0);
                if (elem.validoldvalue != $(elem).val()) { alert(showmsg); }
            }
            else {
                $.formValidator.setTipState(elem, showclass, showmsg);
            }

            //            if ($.j.isTextBox(elem))
            $(elem).removeClass('action_color').addClass('wrong_color');
        }
        else {
            //验证成功后,如果没有设置成功提示信息,则给出默认提示,否则给出自定义提示;允许为空,值为空的提示
            //showmsg = $.formValidator.isEmpty(id) ? setting.onempty : setting.oncorrect;
            //alert("kdsfsadfsd");
            if (returnObj.empty || $("#" + id).css("display") == 'none') {
                $.formValidator.setTipState(elem, "clear", " ");
            }
            else {
                $.formValidator.setTipState(elem, "onCorrect", " ");
            }
            //            if ($.j.isTextBox(elem))
            $(elem).removeClass('action_color').removeClass('wrong_color');
        }
        return showmsg;
    },

    showAjaxMessage: function(returnObj) {
        var setting = returnObj.setting;
        var elem = $("#" + returnObj.id).get(0);
        //if (elem.validoldvalue != $(elem).val()) {
        $.formValidator.ajaxValid(returnObj);
        //        }
        //        else {
        //            if (setting.isvalid != undefined && !setting.isvalid) {
        //                elem.lastshowclass = "onError";
        //                elem.lastshowmsg = setting.onerror;
        //            }
        //            $.formValidator.setTipState(elem, elem.lastshowclass, elem.lastshowmsg);
        //        }
    },

    //获取指定字符串的长度
    getLength: function(id) {
        var srcjo = $("#" + id);
        var elem = srcjo.get(0);
        sType = elem.type;
        var len = 0;
        switch (sType) {
            case "text":
            case "hidden":
            case "password":
            case "textarea":
            case "file":
                var val = srcjo.val();
                var initConfig = $.formValidator.getInitConfig(elem.settings[0].validatorgroup);
                if (initConfig.wideword) {
                    for (var i = 0; i < val.length; i++) {
                        if (val.charCodeAt(i) >= 0x4e00 && val.charCodeAt(i) <= 0x9fa5) {
                            len += 2;
                        } else {
                            len++;
                        }
                    }
                }
                else {
                    len = val.length;
                }
                break;
            case "checkbox":
            case "radio":
                len = $("input[type='" + sType + "'][name='" + srcjo.attr("name") + "'][checked]").length;
                break;
            case "select-one":
                len = elem.options ? elem.options.selectedIndex : -1;
                break;
            case "select-multiple":
                len = $("select[name=" + elem.name + "] option[selected]").length;
                break;
        }
        return len;
    },

    //结合empty这个属性，判断仅仅是否为空的校验情况。
    isEmpty: function(id) {
        if ($("#" + id).get(0).settings[0].empty && $.formValidator.getLength(id) == 0) {
            return true;
        } else {
            return false;
        }
    },

    //对外调用：判断单个表单元素是否验证通过，不带回调函数
    isOneValid: function(id) {
        return $.formValidator.oneIsValid(id, 1).isvalid;
    },

    //验证单个是否验证通过,正确返回settings[0],错误返回对应的settings[i]
    oneIsValid: function(id, index, tag) {
        if (tag == undefined) {
            tag = 1;
        }
        var returnObj = new Object();
        returnObj.id = id;
        returnObj.ajax = -1;
        returnObj.errormsg = "";       //自定义错误信息
        returnObj.defaultval = "";
        returnObj.nextgroupid = '';
        returnObj.tag = tag;
        returnObj.empty = false;
        var elem = $("#" + id).get(0);
        var A = $("#" + id);
        var settings = elem.settings;
        var settingslen = settings.length;
        //只有一个formValidator的时候不检验
        if (settingslen == 1) { settings[0].bind = false; }
        if (!settings[0].bind) { return null; }
        for (var i = 0; i < settingslen; i++) {
            if (i == 0) {
                if (settings[0].defaultvalue) {
                    returnObj.defaultval = settings[0].defaultvalue;
                }
                if ($.formValidator.isEmpty(id) || (returnObj.defaultval != "" && A.val() == returnObj.defaultval) || A.css("display") == "none") {
                    returnObj.isvalid = true;
                    returnObj.setting = settings[0];
                    if ($.formValidator.isEmpty(id)) { returnObj.empty = true; }
                    //如果注册了组验证
                    var exist = false, index = 0;
                    $.each(settings, function(j1, n1) {
                        if (n1.validatetype == "GroupValidator") { index = j1; exist = true; return false; }
                    });
                    if (exist) {
                        returnObj.setting = settings[index];
                        $.formValidator.triggerValidate(returnObj);
                    }
                    break;
                }
                if (settings[0].q2b) {
                    A.val($.formValidator.QtoB(A.val()));
                }
                returnObj.empty = settings[0].empty;
                continue;
            }
            returnObj.setting = settings[i];
            if (settings[i].validatetype != "AjaxValidator") {
                $.formValidator.triggerValidate(returnObj);
            } else {
                returnObj.ajax = i;
                settings[i].isvalid = true;
            }
            if (!settings[i].isvalid) {
                returnObj.isvalid = false;
                returnObj.setting = settings[i];
                break;
            } else {
                returnObj.isvalid = true;
                returnObj.setting = settings[0];
                if (settings[i].validatetype == "AjaxValidator") break;
            }
        }
        return returnObj;
    },

    //验证所有需要验证的对象，并返回是否验证成功。
    pageIsValid: function(validatorgroup) {
        if (validatorgroup == null || validatorgroup == undefined) { validatorgroup = "1" };
        var isvalid = true;
        var thefirstid = "", thefirsterrmsg;
        var returnObj, setting;
        var error_tip = "^";
        var initConfig = $.formValidator.getInitConfig(validatorgroup);
        if (initConfig.validobjectids == "") { return true; }
        var jqObjs = $(initConfig.validobjectids);

        jqObjs.each(function(i, elem) {
            if (elem.settings[0].bind) {
                returnObj = $.formValidator.oneIsValid(elem.id, 1);
                if (returnObj) {
                    var tipid = elem.settings[0].tipid;
                    //校验失败,获取第一个发生错误的信息和ID
                    if (!returnObj.isvalid) {
                        isvalid = false;
                        if (thefirstid == "") {
                            thefirstid = returnObj.id;
                            thefirsterrmsg = (returnObj.errormsg == "" ? returnObj.setting.onerror : returnObj.errormsg)
                        }
                    }
                    //为了解决使用同个TIP提示问题:后面的成功或失败都不覆盖前面的失败
                    if (!initConfig.alertmessage) {
                        if (error_tip.indexOf("^" + tipid + "^") == -1) {
                            if (!returnObj.isvalid) {
                                error_tip = error_tip + tipid + "^";
                            }
                            $.formValidator.showMessage(returnObj);
                        }
                    }
                }
            }
        });
        //成功或失败后，进行回调函数的处理，以及成功后的灰掉提交按钮的功能
        if (isvalid) {
            isvalid = initConfig.onsuccess();
            if (initConfig.submitonce) { $("input[type='submit']").attr("disabled", true); }
        }
        else {
            var obj = $("#" + thefirstid).get(0);
            initConfig.onerror(thefirsterrmsg, obj);
            if (thefirstid != "" && initConfig.errorfocus) {
                //$("#" + thefirstid).focus();
                var o = getTopLeft(thefirstid);
                if (parent) {
                    parent.window.scrollTo(o.left, o.top);
                }
                else {
                    window.scrollTo(o.left, o.top);
                }
            }
        }
        return !initConfig.debug && isvalid;
    },

    //ajax校验
    ajaxValid: function(returnObj) {
        var id = returnObj.id;
        var srcjo = $("#" + id);
        var elem = srcjo.get(0);
        var settings = elem.settings;
        var setting = settings[returnObj.ajax];
        if (setting.checkfun) {
            setting.checkfun(srcjo.val(), elem, function(text) {
                var resultArray = text.split(',');
                if (resultArray[0] == "0") {
                    $.formValidator.setTipState(elem, "onError", resultArray[1]);
                }
                else {
                    $.formValidator.setTipState(elem, "onCorrect", " ");
                }
            });
        }
        return false;
    },

    //对正则表达式进行校验（目前只针对input和textarea）
    regexValid: function(returnObj) {
        var id = returnObj.id;
        var setting = returnObj.setting;
        var srcTag = $("#" + id).get(0).tagName;
        var elem = $("#" + id).get(0);
        var val = ($("#" + id).val());
        //如果有输入正则表达式，就进行表达式校验
        if (elem.settings[0].empty && elem.value == "") {
            setting.isvalid = true;
        }
        else {
            var regexpress = setting.regexp;
            if (setting.datatype == "enum") { regexpress = eval("regexEnum." + regexpress); }
            if (regexpress == undefined || regexpress == "") {
                setting.isvalid = true;
                return;
            }
            var regstrArray = regexpress.split('#');
            var messageArray = setting.onerror.split('#');
            for (var i = 0; i < regstrArray.length; i++) {
                if (regstrArray[i] == "" && regstrArray[i] == null) { continue; }
                try {
                    rex = new RegExp(regstrArray[i], "ig");
                }
                catch (ex) { alert(ex); return true; }
                if (!rex.test(val)) {
                    setting.isvalid = false;
                    returnObj.errormsg = messageArray[i];
                    return;
                }
            }
            setting.isvalid = true;
        }
    },
    //函数校验。返回true/false表示校验是否成功;返回字符串表示错误信息，校验失败;如果没有返回值表示处理函数，校验成功
    functionValid: function(returnObj) {
        var id = returnObj.id;
        var setting = returnObj.setting;
        var srcjo = $("#" + id);
        var lb_ret = setting.fun(srcjo.val(), srcjo.get(0));
        if (lb_ret != undefined) {
            if (typeof lb_ret == "string") {
                setting.isvalid = false;
                returnObj.errormsg = lb_ret;
            } else {
                setting.isvalid = lb_ret;
            }
        }
    },

    //对input和select类型控件进行校验
    inputValid: function(returnObj) {
        var id = returnObj.id;
        var setting = returnObj.setting;
        var srcjo = $("#" + id);
        var elem = srcjo.get(0);
        var val = srcjo.val();
        var sType = elem.type;
        var len = $.formValidator.getLength(id);
        var empty = setting.empty, emptyerror = false;
        switch (sType) {
            case "text":
            case "hidden":
            case "password":
            case "textarea":
            case "file":
                if (setting.type == "size") {
                    empty = setting.empty;
                    if (!empty) {
                        if (val.replace(/(^\s*)|(\s*$)/g, '').length == 0) {
                            emptyerror = true;
                        }
                    }
                    if (emptyerror) { returnObj.errormsg = setting.onerror; setting.isvalid = false; }
                    else {
                        setting.isvalid = true;
                    }
                }
                break;
            case "checkbox":
            case "select-one":
            case "select-multiple":
            case "radio":
                var lb_go_on = false;
                if (sType == "select-one" || sType == "select-multiple") { setting.type = "size"; }
                var type = setting.type;
                if (type == "size") {		//获得输入的字符长度，并进行校验
                    if (!emptyerror) { lb_go_on = true }
                    if (lb_go_on) { val = len }
                }
                else if (type == "date" || type == "datetime") {
                    var isok = false;
                    if (type == "date") { lb_go_on = isDate(val) };
                    if (type == "datetime") { lb_go_on = isDate(val) };
                    if (lb_go_on) { val = new Date(val); setting.min = new Date(setting.min); setting.max = new Date(setting.max); };
                }
                else if (type == "checkbox") {
                    lb_go_on = true;
                    val = $(":checkbox[name='" + srcjo.attr("name") + "'][checked]").length;
                }
                else if (type == "select") {
                    lb_go_on = true;
                    val = $(":select[name='" + srcjo.attr("name") + "'][selected]").length;
                }
                else if (type == "radio") {
                    lb_go_on = true;
                    val = $(":radio[name='" + srcjo.attr("name") + "'][checked]").length;
                }
                else {
                    stype = (typeof setting.min);
                    if (stype == "number") {
                        val = (new Number(val)).valueOf();
                        if (!isNaN(val)) { lb_go_on = true; }
                    }
                    if (stype == "string") { lb_go_on = true; }
                }
                setting.isvalid = false;
                if (lb_go_on) {
                    if (val < setting.min || val > setting.max) {
                        if (val < setting.min && setting.onerrormin) {
                            returnObj.errormsg = setting.onerrormin;
                        }
                        if (val > setting.min && setting.onerrormax) {
                            returnObj.errormsg = setting.onerrormax;
                        }
                    }
                    else {
                        setting.isvalid = true;
                    }
                }
                break;
        }
    },

    compareValid: function(returnObj) {
        var id = returnObj.id;
        var setting = returnObj.setting;
        var srcjo = $("#" + id);
        var desjo = $("#" + setting.desid);
        var ls_datatype = setting.datatype;
        setting.isvalid = false;
        curvalue = srcjo.val();
        ls_data = desjo.val();
        if (ls_datatype == "number") {
            if (!isNaN(curvalue) && !isNaN(ls_data)) {
                curvalue = parseFloat(curvalue);
                ls_data = parseFloat(ls_data);
            }
            else {
                return;
            }
            //如果要比较的值为空直接返回true
            if (desjo.val() == undefined || desjo.val() == '') {
                setting.isvalid = true;
                return;
            }
        }
        if (ls_datatype == "date" || ls_datatype == "datetime") {
            var isok = false;
            if (ls_datatype == "date") { isok = ($.formValidator.isDate(curvalue) && $.formValidator.isDate(ls_data)) };
            if (ls_datatype == "datetime") { isok = (isDateTime(curvalue) && isDateTime(ls_data)) };
            if (isok) {
                curvalue = new Date(curvalue.replace(/-/ig, "/")).getTime();
                ls_data = new Date(ls_data.replace(/-/ig, "/")).getTime();

            }
            else {
                setting.isvalid = true;
                return;
            }
        }
        switch (setting.operateor) {
            case "=":
                if (curvalue == ls_data) { setting.isvalid = true; }
                break;
            case "!=":
                if (curvalue != ls_data) { setting.isvalid = true; }
                break;
            case ">":
                if (curvalue > ls_data) { setting.isvalid = true; }
                break;
            case ">=":
                if (curvalue >= ls_data) { setting.isvalid = true; }
                break;
            case "<":
                if (curvalue < ls_data) { setting.isvalid = true; }
                break;
            case "<=":
                if (curvalue <= ls_data) { setting.isvalid = true; }
                break;
        }
    },
    groupValid: function(returnObj) {
        var setting = returnObj.setting;
        if (returnObj.tag == 1) {
            setting.isvalid = true;
            return;
        }
        var nextgroupid = returnObj.setting.nextgroupid;
        var groupName = returnObj.setting.groupName;
        var groupobj, grouplist = $.formValidator.grouplist;
        var j = 0;
        for (var i = 0; i < grouplist.length; i++) {
            if (grouplist[i].groupname == groupName) {
                groupobj = grouplist[i];
                j = i;
                break;
            }
        }
        if (returnObj.tag == 2) {
            groupobj = { "groupname": groupName, 'firstid': returnObj.id, 'errorcount': 0 };
            grouplist = $.formValidator.removeArray(grouplist, groupName);
            grouplist.push(groupobj);
            $.formValidator.grouplist = grouplist;
        }
        if (groupobj.firstid != nextgroupid) {
            var nextreturnObj = $.formValidator.oneIsValid(nextgroupid, 1, 3);
            if (groupobj.errorcount == 0 && nextreturnObj.isvalid) {
                returnObj.tag = 2;
                //                if ($.j.isTextBox($("#" + nextgroupid)))
                //                    $("#" + nextgroupid).removeClass('action_color').removeClass('wrong_color');
                return;
            }
            if (groupobj.errorcount > 0) {
                returnObj.tag = 3;
                return;
            }
            groupobj.errorcount++;
            if (nextreturnObj) {
                var showmsg = $.formValidator.showMessage(nextreturnObj);
                returnObj.tag = 3;
            }
        }
    }
    ,
    removeArray: function(arrPerson, name) {
        var newArray = [];
        for (var i = 0; i < arrPerson.length; i++) {
            var A = arrPerson[i];
            if (A.groupname == name) { continue; }
            newArray.push(A);
        }
        return newArray;
    }
    ,
    localTooltip: function(e) {
        e = e || window.event;
        var mouseX = e.pageX || (e.clientX ? e.clientX + document.body.scrollLeft : 0);
        var mouseY = e.pageY || (e.clientY ? e.clientY + document.body.scrollTop : 0);
        $("#fvtt").css({ "top": (mouseY + 2) + "px", "left": (mouseX - 40) + "px" });
    },
    removetip: function() {
        var tips = document.getElementsByTagName("span");
        for (var i = 0; i < tips.length; i++) {
            var A, B = tips[i].id;
            if (!B) { continue; }
            if (B.indexOf("_Tip") == -1) { continue; }
            A = $("#" + B);
            if (!A) { continue; }
            A.addClass("");
            A.html('');
        }
    }
    ,
    IsSimple: function(v) {
        return /[\u4e00-\u9fa5]/.test(v);
    },
    IsNum: function(v) {
        return /^\d+$/.test(v);
    },
    QtoB: function(value) {
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
    },
    isDate: function(str) {
        var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
        if (r == null) return false;
        var d = new Date(r[1], r[3] - 1, r[4]);
        return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4]);
    },
    checkTitle: function(str) {
        var r = /[\u4e00-\u9fa5]/.test(str);
        if (!r) return '标题太过简单';
        r = isHasContact(str);
        if (r) return '不允许包含联系方式';
        return true;
    },
    checkContent: function(str) {
        var r = /[\u4e00-\u9fa5]/.test(str);
        if (!r) return '内容太过简单';
        return true;
    }
};

    //每个校验控件必须初始化的
    $.fn.formValidator = function(cs) {
        var setting =
	{
	    validatorgroup: "1",
	    empty: false,
	    submitonce: false,
	    automodify: false,
	    onshow: "请输入内容",
	    onfocus: "请输入内容",
	    oncorrect: "输入正确",
	    onempty: "输入内容为空",
	    defaultvalue: null,
	    bind: true,
	    validatetype: "InitValidator",
	    tipcss:
		{
		    "left": "10px",
		    "top": "1px",
		    "height": "20px",
		    "width": "250px"
		},
	    triggerevent: "blur",
	    forcevalid: false,
	    q2b: false,
	    fun: function() { },
	    eid: ""
	};
        //获取该校验组的全局配置信息
        cs = cs || {};
        if (cs.validatorgroup == undefined) { cs.validatorgroup = "1" };
        var initConfig = $.formValidator.getInitConfig(cs.validatorgroup);
        //先合并整个配置(深度拷贝)
        $.extend(true, setting, cs);
        return this.each(function(e) {
            var jqobj = $(this);
            var setting_temp = {};
            $.extend(true, setting_temp, setting);
            if (this.id == "") {
                this.id = cs.eid;
            }
            var tip = setting_temp.tipid ? setting_temp.tipid : this.id + "_Tip";
            //每个控件都要保存这个配置信息
            setting.tipid = tip;
            $.formValidator.appendValid(this.id, setting);
            //保存控件ID
            var validobjectids = initConfig.validobjectids;
            if (validobjectids.indexOf("#" + this.id + " ") == -1) {
                initConfig.validobjectids = (validobjectids == "" ? "#" + this.id : validobjectids + ",#" + this.id);
            }
            var srcTag = this.tagName.toLowerCase();
            var stype = this.type;
            var defaultval = setting.defaultvalue;
            if (srcTag == "input" || srcTag == "textarea") {
                //注册获得焦点的事件。改变提示对象的文字和样式，保存原值
                jqobj.focus(function() {
                    if (!initConfig.alertmessage) {
                        //保存原来的状态
                        var tipjq = $("#" + tip);
                        this.lastshowclass = tipjq.attr("class");
                        this.lastshowmsg = tipjq.html();
                        $.formValidator.setTipState(this, "onFocus", setting.onfocus);
                        if (defaultval && defaultval != "" && defaultval == jqobj.val()) {
                            jqobj.val('');
                        }
                    }
                    if (stype == "password" || stype == "text" || stype == "textarea" || stype == "file") {
                        this.validoldvalue = jqobj.val();
                    }
                });
                //注册失去焦点的事件。进行校验，改变提示对象的文字和样式；出错就提示处理
                jqobj.bind(setting.triggerevent, function() {
                    var settings = this.settings;
                    if (defaultval && defaultval != "" && jqobj.val() == '') {
                        jqobj.val(defaultval);
                    }
                    var returnObj = $.formValidator.oneIsValid(this.id, 1, 2);
                    if (returnObj == null) { return; }
                    if (returnObj.ajax >= 0) {
                        $.formValidator.showAjaxMessage(returnObj);
                    }
                    else {
                        if (returnObj.tag == 2) {
                            var showmsg = $.formValidator.showMessage(returnObj);
                            //如果配置了回调函数
                            if (returnObj.isvalid && setting.fun) {
                                setting.fun();
                            }
                        }
                    }
                });
            }
            else if (srcTag == "select") {
                //获得焦点
                jqobj.bind("focus", function() {
                    if (!initConfig.alertmessage) {
                        $.formValidator.setTipState(this, "onFocus", setting.onfocus);
                    }
                });
                //失去焦点
                if (!setting.forcevalid) {
                    jqobj.bind("blur", function() {
                        var returnObj = $.formValidator.oneIsValid(this.id, 1, 2);
                        if (returnObj == null) { return; }
                        if (returnObj.ajax >= 0) {
                            $.formValidator.showAjaxMessage(returnObj);
                        } else {
                            if (returnObj.tag == 2) {
                                $.formValidator.showMessage(returnObj)
                            }
                        }
                    });
                }

                //选择项目后触发
                //                jqobj.bind("change", function() {
                //                    var returnObj = $.formValidator.oneIsValid(this.id, 1);
                //                    if (returnObj == null) { return; }
                //                    if (returnObj.ajax >= 0) {
                //                        $.formValidator.showAjaxMessage(returnObj);
                //                    } else {
                //                        $.formValidator.showMessage(returnObj);
                //                    }
                //                });
            }
        });
    };

    $.fn.inputValidator = function(controlOptions) {
        var settings =
	{
	    isvalid: false,
	    min: 0,
	    max: 99999999999999,
	    type: "size",
	    onerror: "输入错误",
	    validatetype: "InputValidator",
	    empty: false,
	    wideword: true
	};
        controlOptions = controlOptions || {};
        $.extend(true, settings, controlOptions);
        return this.each(function() {
            $.formValidator.appendValid(this.id, settings);
        });
    };

    $.fn.compareValidator = function(controlOptions) {
        var settings =
	{
	    isvalid: false,
	    desid: "",
	    operateor: "=",
	    onerror: "输入错误",
	    validatetype: "CompareValidator"
	};
        controlOptions = controlOptions || {};
        $.extend(true, settings, controlOptions);
        return this.each(function() {
            $.formValidator.appendValid(this.id, settings);
        });
    };

    $.fn.regexValidator = function(controlOptions) {
        var settings =
	{
	    isvalid: false,
	    regexp: "",
	    param: "i",
	    datatype: "string",
	    onerror: "输入的格式不正确",
	    validatetype: "RegexValidator"
	};
        controlOptions = controlOptions || {};
        $.extend(true, settings, controlOptions);
        return this.each(function() {
            $.formValidator.appendValid(this.id, settings);
        });
    };

    $.fn.functionValidator = function(controlOptions) {
        var settings =
	{
	    isvalid: true,
	    fun: function() { this.isvalid = true; },
	    validatetype: "FunctionValidator",
	    onerror: "输入错误"
	};
        controlOptions = controlOptions || {};
        $.extend(true, settings, controlOptions);
        return this.each(function() {
            $.formValidator.appendValid(this.id, settings);
        });
    };

    $.fn.groupValidator = function(controlOptions) {
        var settings =
	    {
	        isvalid: true,
	        groupName: "",
	        nextgroupid: "",
	        validatetype: "GroupValidator",
	        onerror: "输入错误"
	    };
        controlOptions = controlOptions || {};
        $.extend(true, settings, controlOptions);
        return this.each(function() {
            $.formValidator.appendValid(this.id, settings);
        });
    };
    $.fn.ajaxValidator = function(controlOptions) {
        var settings =
	{
	    isvalid: false,
	    lastValid: "",
	    type: "GET",
	    url: "",
	    addidvalue: true,
	    datatype: "html",
	    data: "",
	    async: true,
	    cache: false,
	    beforesend: function() { return true; },
	    success: function() { return true; },
	    complete: function() { },
	    processdata: false,
	    error: function() { },
	    buttons: null,
	    onerror: "服务器校验没有通过",
	    onwait: "正在等待服务器返回数据",
	    validatetype: "AjaxValidator",
	    checkfun: function() { }
	};
        controlOptions = controlOptions || {};
        $.extend(true, settings, controlOptions);
        return this.each(function() {
            $.formValidator.appendValid(this.id, settings);
        });
    };

    $.fn.defaultPassed = function(onshow) {
        return this.each(function() {
            var settings = this.settings;
            for (var i = 1; i < settings.length; i++) {
                settings[i].isvalid = true;
                if (!$.formValidator.getInitConfig(settings[0].validatorgroup).alertmessage) {
                    var ls_style = onshow ? "onShow" : "onCorrect";
                    $.formValidator.setTipState(this, ls_style, settings[0].oncorrect);
                }
            }
        });
    };

    $.fn.unFormValidator = function(unbind) {
        return this.each(function() {
            this.settings[0].bind = !unbind;
            if (unbind) {
                $("#" + this.settings[0].tipid).hide();
            } else {
                $("#" + this.settings[0].tipid).show();
            }
        });
    };

    $.fn.showTooltips = function() {
        if ($("body [id=fvtt]").length == 0) {
            fvtt = $("<div id='fvtt' style='position:absolute;z-index:56002'></div>");
            $("body").append(fvtt);
            fvtt.before("<iframe src='about:blank' class='fv_iframe' scrolling='no' frameborder='0'></iframe>");

        }
        return this.each(function() {
            jqobj = $(this);
            s = $("<span class='top' id=fv_content style='display:block'></span>");
            b = $("<b class='bottom' style='display:block' />");
            this.tooltip = $("<span class='fv_tooltip' style='display:block'></span>").append(s).append(b).css({ "filter": "alpha(opacity:95)", "KHTMLOpacity": "0.95", "MozOpacity": "0.95", "opacity": "0.95" });
            //注册事件
            jqobj.mouseover(function(e) {
                $("#fvtt").append(this.tooltip);
                $("#fv_content").html(this.Tooltip);
                $.formValidator.localTooltip(e);
            });
            jqobj.mouseout(function() {
                $("#fvtt").empty();
            });
            jqobj.mousemove(function(e) {
                $("#fv_content").html(this.Tooltip);
                $.formValidator.localTooltip(e);
            });
        });
    }
})(jQuery);

function getElementWidth(objectId) {
    x = document.getElementById(objectId);
    return x.offsetWidth;
}

function getTopLeft(objectId) {
    obj = new Object();
    o = document.getElementById(objectId);
    oLeft = o.offsetLeft;
    oTop = o.offsetTop;
    while (o.offsetParent != null) {
        oParent = o.offsetParent;
        oLeft += oParent.offsetLeft;
        oTop += oParent.offsetTop;
        o = oParent;
    }
    obj.top = oTop;
    obj.left = oLeft;
    return obj;
}


// 是否包含联系方式
function isHasContact(str) {
    var regStr = /([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{7})/;
    var reg = new RegExp(regStr);
    var regTestResult = reg.test(str);
    if (!regTestResult) {
        regStr = /(([qｑQＱ]+)(.?|.{1,5})(([0-9]|[０-９]|[零一二三四五六七八九]|[①-⑨]|[㈠-㈨])[-_@\~\#\$\%\^\&\*]*){5,13})|((([0-9]|[０-９]|[零一二三四五六七八九]|[①-⑨]|[㈠-㈨])[-_@\~\#\$\%\^\&\*]*){5,13}(.?|.{1,5})([qｑQＱ]+))/;
        reg = new RegExp(regStr);
        regTestResult = reg.test(str);
    }
    return regTestResult;
}
