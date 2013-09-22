(function ($) {
    $.log = function (msg) { var _debug = false; if (_debug) try { console.log(msg); } catch (e) { }; },
    $.j = {
        Cookie: {
            get: function (A) {
                var B = document.cookie.match(new RegExp(A + "=([^&;]+)")); if (B != null) { return decodeURI(B[1]); } return "";
            },
            setcookie: function (A, B) {
                $.j.Cookie.set(A, B);
            },
            set: function (A, B, C, D, E) {
                var F = A + "=" + escape(B) + ";";
                if (C && C != '') {
                    F = F + "domain=" + C + ";";
                }
                if (D && D > 0) {
                    var exp = new Date();
                    exp.setTime(exp.getTime() + (86400 * 1000 * D));
                    F = F + "expires=" + exp.toGMTString() + ";";
                }
                if (E && E != '') {
                    F = F + "path=" + E + ";";
                }
                document.cookie = F;
            },
            del: function (name) {
                $.j.Cookie.set(name, ' ', '', -1, '/');
            }
        },
        AjaxProvider: function (a, b, c) {
            $.post(a, {},
                function (data, textStatus) {
                    b(data);
                }, "html");
        },
        callajax: function (a, b, c) {
            var l = "/ajax?";
            var p = "&action=" + a + "&";
            p += b;
            p += "&rand=" + new Date();
            l += p;
            $.j.AjaxProvider(l, c);
        },
        getdicvalue: function (A, B, S) {
            try {
                for (var C = 0; C < B.length; C++) {
                    var H = B[C].split(S);
                    if (A.toLowerCase() == H[0].toLowerCase()) {
                        var h = H[1];
                        if (h) {
                            return h;
                        }
                    }
                }
                return "";
            }
            catch (ex) {
                return "";
            }
        },
        getTopLeft: function (o) {
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
        },
        scrollToElement: function (a) {
            try {
                var o = $.j.getTopLeft(a);
                if (parent)
                { parent.window.scrollTo(o.left, o.top); }
                else {
                    window.scrollTo(o.left, o.top);
                }
            }
            catch (E) {
                window.scrollTo(0, 0);
            }
        },
        geturlparam: function (a, b) {
            var reg = new RegExp("(^|&)" + b + "=([^&]*)(&|$)");
            var r = a.substr(a.indexOf("\?") + 1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        },
        initEffectiveDate: function () {
            var A = $("#hidEffectiveDate");
            var B = $("#EffectiveDate");
            if (B && A && A.val() != "") {
                if (A.val() == "7" || A.val() == "30" || A.val() == "100" || A.val() == "365") {
                    B.val(A.val());
                }
            }
        },
        appendvalue: function () {
            var d, s, e, cc, z, p;
            var l = true;
            var A = $("#StartTime"), B = $("#StartStation"), C = $("#EndStation"), D = $("#Num"), E = $("#count"), F = $("#ObjectType");
            if (A) {
                d = A.val();
            }
            if (B) {
                s = B.val();
                if (B.attr("Except") == s) {
                    s = "";
                    l = false;
                }
            }
            if (C) {
                e = C.val();
                if (C.attr("Except") == e) {
                    e = "";
                    l = false;
                }
            }
            if (D) {
                cc = D.val();
            }
            if (E) {
                z = E.val();
            }
            if (F) {
                if ($("#ObjectType").attr('disabled') == true) {
                    p = "类型不限";
                } else {
                    p = $("#ObjectType option:selected").text();
                }
            }
            $.j.appendtitle(d, s, e, cc, z, p);
        },
        appendtitle: function (d, s, e, cc, z, p) {
            var value = "";
            if (s != "" && s != null) {
                value = s + "-";
            }
            if (e != "" && e != null) {
                value += e + " ";
            }
            if (cc != "" && cc != null) {
                value += cc + " ";
            }
            if (p != "" && p != null) {
                value += p;
            }
            if (z != "" && z != null) {
                value += z + "张";
            }
            if (d != "" && d != null) {
                value += " 发车日期:" + d;
            }
            $("#Title").val(value);
        },
        dyniframesize: function (iframename) {
            var iframeid = document.getElementById(iframename); //iframe id
            iframeid.height = "10px"; //先给一个够小的初值,然后再长高.
            if (document.getElementById) {
                if (iframeid && !window.opera) {
                    if (iframeid.contentDocument && iframeid.contentDocument.body.offsetHeight) {
                        iframeid.height = iframeid.contentDocument.body.offsetHeight;
                    } else if (iframeid.Document && iframeid.Document.body.scrollHeight) {
                        iframeid.height = iframeid.Document.body.scrollHeight;
                    }
                }
            }
        },
        // 从xml数据中读取城市数据
        getCityDataFromXml: function (objElem, callback) {
            $.ajax({
                url: '/config/City.xml',
                type: 'get',
                dataType: 'xml',
                timeout: 5000,
                cache: false,
                error: function (msg) {
                    alert('加载xml文档出错：' + msg);
                },
                success: function (xml) {
                    var arrData = [];
                    $(xml).find('province').each(function (i) {
                        var arrLine = [];
                        arrLine.push($(this).attr("value")); // 省份
                        $(this).find('city').each(function (i) {
                            arrLine.push($(this).attr('value'));
                        });
                        arrData.push(arrLine);
                    });
                    $(objElem).data('CityData', arrData);
                    callback();
                }
            });
        },
        // 初始化标签验证
        initTagCheck: function (limitNum) {
            var _num = 2;
            if (limitNum) {
                if (!isNaN(limitNum)) {
                    if (parseInt(limitNum) > 0) {
                        _num = parseInt(limitNum);
                    }
                }
            }
            $(':checkbox[name="Tag"]').formValidator({ tipid: 'infotag_Tip', onfocus: '' })
                .functionValidator({ fun: function (val, elem) {
                    return $(':checkbox[name="Tag"]:checked').length <= _num;
                }, onerror: '最多只能选择' + _num + '个标签'
                });
            $(':checkbox[name="Tag"]').bind('click', function () {
                var c = $(':checkbox[name="Tag"]:checked').length;
                if (c <= _num) {
                    //$.formValidator.setTipState(null, "onCorrect", " ", "infotag_Tip");//lls
                    $.formValidator.setTipState("#infotag_Tip", "onCorrect", " ", "infotag_Tip");
                } else {
                    //$.formValidator.setTipState(null, "onError", "最多只能选择" + _num + "个标签", "infotag_Tip");
                    $.formValidator.setTipState("#infotag_Tip", "onError", "最多只能选择" + _num + "个标签", "infotag_Tip");
                }
            });
        },
        // 日期控制点击后触发的动作
        CalClickAfter: function (obj) {
            var hasEvent = $(obj).data('hasEvent');
            if (hasEvent != 1) {
                $(obj).data('hasEvent', 1);
                $('#GGS_cal_days').bind('click', function () {
                    obj.focus();
                });
            }
        },
        // 判断元素是否为文本框（单/多行)
        isTextBox: function (elem) {
            var id = $(elem).get(0).id;
            if (!$(elem).get(0).tagName) return false;
            var tagName = $(elem).get(0).tagName.toUpperCase();
            var c = $('#' + id + ':text').length;
            if (c == 1) return true;
            if (tagName == 'TEXTAREA') return true;
            return false;
        },
        // 获取单行文本框的拼接值
        getTextBoxJoinValue: function (str) {
            var res = '';
            try {
                var arrVal = [];
                var obj = $(':text:visible');
                obj.each(function (i) {
                    if (obj.get(i).id != 'Title' && obj.get(i).id != 'Phone' && obj.get(i).id != 'codeText' && obj.get(i).id != 'IM') {
                        var _v = $.trim(obj.get(i).value);
                        if (_v.length > 1) {
                            var r = false;
                            if (isNaN(_v)) {
                                r = true; // 非数字需要拼接
                            } else {
                                if (_v.length >= 11) r = true; // 长度大于等于11的数字也需要接接
                            }
                            if (r) arrVal[arrVal.length] = _v;
                        }
                    }
                });
                res = arrVal.join(str);
            } catch (ex) { };
            return res;
        },
        // 创建单行文本框拼接值控件
        createFieldForTextJoinValue: function (objform) {
            if ($('#hiddenTextBoxJoinValue').length == 0) {
                var str = '<input type="hidden" id="hiddenTextBoxJoinValue" name="hiddenTextBoxJoinValue" value="" />';
                $(objform).append(str);
            }
            var _val = $.j.getTextBoxJoinValue(':');
            $('#hiddenTextBoxJoinValue').val(_val);
        },
        // 初始化内容框提示语
        initContentTip: function (str) {
            if ($('#Content').val() == '') $('#Content').val(str).addClass('gray');
            $('#Content').bind('focus', function () {
                $('#Content').removeClass('gray');
                var val = $('#Content').val();
                if (val == str) {
                    $('#Content').val('');
                }
            }).bind('blur', function () {
                var val = $('#Content').val();
                if (val == '') {
                    $('#Content').val(str);
                    $('#Content').addClass('gray');
                } else {
                    $('#Content').removeClass('gray');
                }
            });
        },
        // 根据控件id来获取全文检索值
        getFullTextSearchVal: function (id) {
            var obj = $('#' + id);
            if (obj.length == 0) return ''; // 找不到与该id对应的元素
            if ($('#' + id + ':hidden').length > 0) return ''; // 不处理隐藏控件
            var elem = obj.get(0);
            var r = $.j.isTextBox(elem);
            if (r) return $(elem).val(); // 输入框类型
            var tagName = $(elem).get(0).tagName.toUpperCase();
            if (tagName == 'SELECT') return elem.options[elem.selectedIndex].text; // 下拉菜单
            if (tagName == 'INPUT') {
                var _type = $(elem).attr('type').toUpperCase();
                if (_type == 'CHECKBOX') {
                    if (elem.checked) {
                        var _lable = $(elem).next('label');
                        if (_lable.length > 0) {
                            return $(_lable).html(); // 多选框
                        }
                    }
                }
                if (_type == 'RADIO') {
                    if (elem.checked) {
                        var _span = $(elem).next('span');
                        if (_span.length > 0) {
                            return $(_span).html(); // 单选框
                        }
                    }
                }
            }
            return '';
        },
        // 异步调用电话
        asynPhone: function (userid, infoid, Phone, BizSelect) {
            $.ajax({
                url: '/ajax/?action=getcalldivert&userid=' + userid,
                type: 'GET',
                timeout: 3000,
                dataType: 'json',
                success: function (data) {
                    $.j.initPhone(infoid, data.ehPhone, Phone, data.rPhone, BizSelect, data.CallState);
                }
            });
        },
        // 初始化电话: id-infoID, p1-呼转号码, p2-信息号码, p3-用户原始号码, state-(1:正常,2/3/4:欠费,5:暂停)
        initPhone: function (id, p1, p2, p3, biz, state) {
            if (biz != '' && p1 == '') { return; }
            var myurl = 'http://my.flxxwang.com/calltransfermanagement/?menu=21';
            var str = (p1 == '') ? '<a href="' + myurl + '" target="_blank">使用58呼转</a>' : '<input type="checkbox" id="cbxUseEPhone" name="cbxUseEPhone" value="1" />使用58呼转';
            if (p1 != '') {
                if (state == '1' || state == '') { } else if (state == 5) { str += ' (已暂停, <a href="' + myurl + '" target="_blank">马上开启</a>)'; }
                else { str += ' (已到期, <a href="' + myurl + '" target="_blank">马上续费</a>)'; }
            }
            $('#Phone').after('&nbsp;' + str);

            if (id == '0') { // 新建
                if (p1 != '') {
                    $('#cbxUseEPhone').get(0).checked = true;
                    $('#Phone').val(p1).attr('readonly', 'true');
                    $('#Phone').attr('style', 'color:#666');
                }
            } else { // 修改
                if (p1 == p2) {
                    $('#cbxUseEPhone').get(0).checked = true;
                    $('#Phone').val(p1).attr('readonly', 'true');
                    $('#Phone').attr('style', 'color:#666');
                }
            }
            // 复选框动作
            $('#cbxUseEPhone').bind('click', function () {
                if (this.checked) {
                    $('#Phone').val(p1).attr('readonly', 'true');
                    $('#Phone').attr('style', 'color:#666');
                } else {
                    $('#Phone').val(p3).removeAttr('readonly');
                    $('#Phone').removeAttr('style');
                }
                $('#Phone').blur();
            });
            // 呼转状态
            if (id == '0') {
                if (state != '1' && p1 != '') {
                    $('#cbxUseEPhone').get(0).click();
                }
            }
        }
    }
    $.c = {
        common: {
            // 添加新的下拉菜单元素
            addOptionsToSelect: function (selectID, val, text) {
                var op = document.createElement('option');
                op.value = val;
                op.text = text;
                $('#' + selectID).get(0).options.add(op);
            },
            // 选中下拉菜单
            setSelectedOption: function (selectID, val, text) {
                $('#' + selectID + ' option').each(function () {
                    var result = false;
                    if (val != null && this.value == val) {
                        result = true;
                    } else if (text != null && this.text == text) {
                        result = true;
                    }
                    if (result) {
                        $(this).attr('selected', true);
                        return false;
                    }
                });
            },
            // 是否为ie6浏览器
            isIE6: function () {
                if ($.browser.msie) {
                    return $.browser.version == 6;
                }
                return false;
            },
            // 光标进入时的高度设置
            set_focus_height: function () {
                var _focusH = $(this).attr('focus_height');
                if (_focusH) {
                    var _preH = $(this).data('height'); // 原始高度
                    if (!_preH) $(this).data('height', $(this).height());
                    $(this).height(parseInt(_focusH));
                }
            },
            // 光标离去时的高度设置
            set_blur_height: function () {
                var _preH = $(this).data('height');
                if (_preH && _preH != $(this).height()) $(this).height(_preH);
            },
            // 获取当前选中类型的索引
            getRadioIndex: function (typeName) {
                var _index = -1;
                var objType = $(':radio[name="' + typeName + '"]');
                objType.each(function (index, elem) {
                    if (elem.checked) {
                        _index = index;
                        return false;
                    }
                });
                return _index;
            },
            // 获取下拉菜单的选中文本
            getSelectedText: function (elemID) {
                var result = null;
                var obj = $('#' + elemID);
                if (obj.length > 0) {
                    result = obj.get(0).options[obj.get(0).selectedIndex].text;
                }
                return result;
            }
        },
        xiaoqu: {
            getLineValue: function (a, b, c) {
                var d = "city=" + a + "&";
                d += "xq=" + escape(b);
                $.j.callajax("line", d, $.c.xiaoqu.setLineValue);
            },
            setLineValue: function (d) {
                var A = $("#gongjiaoxian");
                var B = $("#gongjiaozhan");
                var C = $("#ditiexian");
                var D = $("#ditiezhan");
                var E = $("#daxue");
                var F = $("#hidxiaoqu");
                var G = $("#xiaoqu");
                if (d == "") {
                    if (F) {
                        var regStr = /^\d$/;
                        var reg = new RegExp(regStr);
                        if (reg.test(G.val())) {
                            G.val("@" + G.val());
                        }
                        F.val(G.val());
                    }
                }
                else {
                    var dic = d.split('$');
                    if (A) {
                        A.val($.j.getdicvalue("busline", dic, '_'));
                    }
                    if (B) {
                        B.val($.j.getdicvalue("busstation", dic, '_'));
                    }
                    if (C) {
                        C.val($.j.getdicvalue("subline", dic, '_'));
                    }
                    if (D) {
                        D.val($.j.getdicvalue("substation", dic, '_'));
                    }
                    if (E) {
                        E.val($.j.getdicvalue("university", dic, '_'));
                    }
                    if (F) {
                        F.val($.j.getdicvalue("DicID", dic, '_'));
                    }
                }
                $.formValidator.subform("aspnetForm", "fabu");
            },
            getxiaoquname: function () {
                var value = $("#hidxiaoqu").val();
                if (/^\d+$/.test(value)) {
                    var d = "id=" + value;
                    $.j.callajax("line1", d, function (data) {
                        $("#xiaoqu").val(data);
                    });
                }
                else {
                    $("#xiaoqu").val(value);
                }
            }
        },
        verifycode: {
            showVerifyCode: function (a) {
                a = a == undefined ? "" : a;
                var A = '<input autocomplete="off" type="text" qtb="true" class="text2" name="codeText" id="codeText" onblur="$.c.verifycode.checkCode(this.value,1,\'' + a + '\')" onfocus="$.c.verifycode.checkCode(this.value)" onkeyup="$.c.verifycode.checkCode(this.value,2,\'' + a + '\')" maxlength="5" /><span id="code_Tip"></span><br>';
                document.write(A);
                var B = new Date();
                document.write('<img src="/code?infoid=' + a + '&date=' + B.getMinutes() + B.getSeconds() + B.getMilliseconds() + '" style="vertical-align: middle" id="cm" /><a href="javascript:$.c.verifycode.reloadcode(\'cm\')">看不清？</a>');
            },
            checkCode: function (code, t, finfoid) {
                try {
                    if (t == undefined) { t = 3; }
                    if (!code) {
                        code = $("#codeText").val();
                    }
                    if (code != "") {
                        code = $.formValidator.QtoB(code);
                        $("#codeText").val(code);
                    }
                    if (code.length == 5 && t != 3) {
                        var d = "infoid=" + finfoid + "&" + "code=" + code;
                        $.j.callajax("verifycode", d, function (text) {
                            if (text == "1") {
                                //$.formValidator.setTipState(null, "onCorrect", " ", "code_Tip");
                                $.formValidator.setTipState("#code_Tip", "onCorrect", " ", "code_Tip"); //lls
                                return true;
                            }
                            else {
                                if (text == "false") {
                                    $.c.verifycode.reloadcode('', finfoid);
                                }
                                else {
                                    //$.formValidator.setTipState(null, "onError", "验证码错误", "code_Tip");
                                    $.formValidator.setTipState("#code_Tip", "onError", "验证码错误", "code_Tip"); //lls
                                }
                                return false;
                            }
                        });
                    }
                    else {
                        if (code.length > 5) {
                            //$.formValidator.setTipState(null, "onError", "请输入正确的验证码", "code_Tip");
                            $.formValidator.setTipState("#code_Tip", "onError", "请输入正确的验证码", "code_Tip"); //lls
                        }
                        else {
                            try {
                                if (t == 1) {
                                    //$.formValidator.setTipState(null, "onError", "请输入正确的验证码", "code_Tip");
                                    $.formValidator.setTipState("#code_Tip", "onError", "请输入正确的验证码", "code_Tip"); //lls
                                } else {
                                    //$.formValidator.setTipState(null, "onfocus", "不区分大小写", "code_Tip");
                                    $.formValidator.setTipState("#code_Tip", "onfocus", "不区分大小写", "code_Tip"); //lls
                                }
                            } catch (E) {
                                return true;
                            }
                        }
                    }
                }
                catch (ex) {

                }
            },
            reloadcode: function (id, finfoid) {
                id = (id == undefined || id == "") ? "cm" : id;
                var img = $("#" + id).get(0);

                if (img) {
                    if (finfoid == undefined || finfoid == "") {
                        var a = img.src;
                        finfoid = $.j.geturlparam(a, "infoid");
                        if (!finfoid)
                            finfoid = "";
                    }
                    img.src = "/code?new=" + new Date() + "&infoid=" + finfoid;
                }
            }
        },
        Error: {
            errorMessage: {
                POSTTOOMORE: '<div class="sorry" id="tishi">' +
            '<p>{MESSAGE}</p></div>',
                BLACKUSER: '<div class="sorry" id="tishi"><p><span class="red"><img src="http://pic2.flxxwang.com/images/5_0/ok4848.gif" align="absmiddle" /></span></p>' +
           '<p>{MESSAGE}<br /></div>',
                SEALEDUSER: '<div class="sorry" id="tishi"><p><span class="red"><img src="http://pic2.flxxwang.com/images/5_0/ok4848.gif" align="absmiddle" /></span></p>' +
            '<p>{MESSAGE}</p><br /></div>',
                INFOREPEATE: '<div class="xiangsi"><p class="bt"><span class="red"><img src="http://pic2.flxxwang.com/images/5_0/ok4848.gif" align="absmiddle" /></span></p>' +
            '<p>{MESSAGE}</p><br /></div>',
                INFOILLEGAL: '<div class="sorry" id="tishi"><p class="bt"><span class="red"><img src="http://pic2.flxxwang.com/images/5_0/ok4848.gif" align="absmiddle" /></span></p>' +
             '<p>{MESSAGE}</p><br /></div>',
                INFOGUANSHUI: '<div class="sorry" id="tishi"><p class="bt"><span class="red"><img src="http://pic2.flxxwang.com/images/5_0/ok4848.gif" align="absmiddle" /></span></p>' +
             '<p>{MESSAGE}</p><br /></div>',
                INFOSCORE: '<div class="sorry1" id="tishi"><p class="bt"></p>' +
             '<p>{MESSAGE}</p><br /><p><input name="" type="button" value="返回修改" onclick="reclose()"/><input name="" type="button" value="继续发布" onclick="fabu()"/></p></div>',
                FORBIDDEN: '<div class="sorry1" id="tishi"><p class="bt"></p><p>{MESSAGE}</p><br /><p align=center style="margin-bottom:10px;"><input type=\'button\' value=\'知道了\' onclick=\'window.location.href=\"http://www.flxxwang.com\"\'></p></div>',
                EX: '<div class="sorry" id="tishi"><p class="bt"><span class="red"><img src="http://pic2.flxxwang.com/images/5_0/ok4848.gif" align="absmiddle" />　发布失败！</span></p>' +
             '<p>系统异常。请与管理员联系。</p><br /><p><input name="" type="button" value="确定" onclick="turnPage()"/></p></div>'
            },
            S_Message: function (obj) {
                var t = obj.t;
                if (obj.Order == 1) {
                    if (t == "unlogin") {
                        setbg('用户登录', 410, 250, 'http://my.flxxwang.com/simlogin/?type=loginclose', 'false');
                    }
                    else {
                        if (obj.cb == 0) {
                            $.c.Error.initMessage(obj);
                        }
                        else {
                            $.c.Error.initMessage1(obj);
                        }
                    }
                }
                else {
                    if (document.all) {
                        window.onload = function () {
                            $.c.Error.initMessage(obj);
                        }
                    }
                    else {
                        $.c.Error.initMessage(obj);
                    }
                }
            },
            initMessage: function (obj) {
                window.scrollTo(0, 0);
                var E = $.c.Error;
                var A = E.errorMessage[obj.t];
                var w = "450px", h = "400px";
                var msglist = [];
                switch (obj.t) {
                    case "POSTTOOMORE":
                        {
                            w = "500px";
                            if (myInfo.TopRoleMaxCount === myInfo.CurrentPostCount) {
                                h = '240px';
                                msglist.push("亲爱的 <b>{0}</b> ,今天您在 <b>{2}</b> 已达到 <b><font color='red'>{3}</font></b> 条信息的发帖上限。");
                                msglist.push('<br/>您可以：<a href="http://my.flxxwang.com/">进入用户中心</a> 或 <a href="http://www.flxxwang.com/">返回首页</a>。');
                            } else {
                                if (obj.user.ucr != 0) {
                                    msglist.push("亲爱的<b>{0}</b>,您的信用值为<font color='red'>{1}</font>,今天您在<b>{2}</b>已达到<b><font color='red'>{3}</font></b>条信息的发帖上限。您可以提高信用来增加发帖量!<br>");
                                }
                                else {
                                    msglist.push("亲爱的<b>{0}</b>,您的信用值为<font color='red'>0</font>（<a href='http://about.flxxwang.com/v5/jifenxinyong.html#g'>查看原因</a>）,目前只能提高信用才能发布信息。<br>");
                                }
                                msglist.push("<br>");
                                msglist.push("提高信用的方法：<br>");
                                msglist.push("1、<a href='http://my.flxxwang.com/userauthmail/'>验证邮箱</a>   (可获得50信用)<br/>");
                                msglist.push("2、<a href='http://my.flxxwang.com/userauthmobile/'>验证手机号码</a>   (可获得100信用)<br/>");
                                msglist.push("3、<a href='http://my.flxxwang.com/userauthrealname/'>验证身份</a>   (可获得150信用)<br/>");
                                msglist.push("4、<a href='http://my.flxxwang.com/userauthbiz/'>企业验证营业执照</a>   (可获得150信用)<br/>");
                                msglist.push("5、<a href='http://about.flxxwang.com/48.html'>查看更多办法</a><br/>");
                                msglist.push("<p align=center><input type=button value='马上验证' onclick='window.location.href=\"http://my.flxxwang.com\"'></p>");
                            }
                            break;
                        }
                    case "BLACKUSER": { break; }
                    case "SEALEDUSER":
                        {
                            msglist.push("<br>亲爱的<b>{0}</b>，您的账户已被冻结（<a href='http://about.flxxwang.com/89.html#d'>查看原因</a>）。");
                            msglist.push("<p align=center><input type='button' value='知道了' onclick='window.location.href=\"http://my.flxxwang.com\"'></p>");
                            break;
                        }
                    case "INFOREPEATE": { h = "350px"; break; }
                    case "INFOILLEGAL": { break; }
                    case "INFOGUANSHUI":
                        {
                            w = "400px";
                            h = "260px";
                            msglist.push("<br>亲爱的<b>{0}</b>，您发布信息太过频繁了，请稍候再试!<br><br>");
                            msglist.push("<p align=center><input type='button' value='知道了' onclick='window.location.href=\"http://my.flxxwang.com\"'></p>");
                            break;
                        }
                    case "FORBIDDEN":
                        {
                            h = "280px";
                            break;
                        }
                }
                if (obj.user != null) {
                    obj.msg = msglist.join("").replace("{0}", obj.user.uname).replace("{1}", obj.user.ucr).replace("{2}", obj.user.curcate).replace("{3}", obj.user.maxpostcount);
                }
                if (obj.t != "INFOSCORE") { A = A.replace(/{MESSAGE}/g, obj.msg); }
                //$.c.Error.setError(A);
                $.c.Layer.setting.MsgTitle = "<p class=\"hh\">系统提示信息</p>";
                $.c.Layer.setting.height = h;
                $.c.Layer.setting.width = w;
                $.c.Layer.setting.html = A;
                $.c.Layer.event();
            },
            initMessage1: function (obj) {
                var A = obj.msg;
                var m = [];
                m.push("<strong>发布失败</strong><br />");
                for (var i = 0; i < A.length; i++) {
                    m.push((i + 1) + "、" + A[i] + "<br/>");
                }
                m.push('<a href="javascript:void(0);" onclick="$(\'#toperro\').slideUp();" title="关闭" class="close1">&times;</a>');
                $.c.Error.setError(m.join(""));
            },
            setError: function (A) {
                var B = $("#toperro");
                B.addClass("sc");
                B.css("display", "");
                B.html(A);
                $.j.scrollToElement(B.get(0)); // 定位到错误显示控件
                flagSubmit = false;
                $.formValidator.subfalse("aspnetForm", "fabu");
                $.c.verifycode.reloadcode();
            },
            showError: function (A) {
                alert(A);
                flagSubmit = false;
                $.formValidator.subfalse("aspnetForm", "fabu");
                $.c.verifycode.reloadcode();
            },
            // 显示vip错误信息
            showVipError: function (msg) {
                var obj = $('#toperro');
                obj.addClass('sc');
                obj.show().html(msg);
                $('#fabu').attr('disabled', 'disabled');
            }
        },
        Layer: {
            setting: { MsgTitle: "", height: 500, width: 500, html: '', sBox: "<div id='ab2' class='boxout'><div id=\"divTm\" class=\"tm\"></div><div id=\"divBoxin\" class=\"boxin\">{0}<div id=\"dialogBoxContent\"></div></div></div></div>" },
            event: function () {
                this.init();
                if ($("#body_pr").length > 0) {
                    $('#body_pr').css("display", "block");
                }
                $("#dialogBoxContent").html(this.setting.html);
                $("#divTm")[0].style.height = this.setting.height;
                $('#ab_hhh').css("display", "block");
            },
            init: function () {
                this.LayerDiv();
                var oDiv;
                if ($("#ab_hhh").length <= 0) {
                    oDiv = document.createElement('div');
                    oDiv.id = "ab_hhh";
                    document.body.appendChild(oDiv);
                } else {
                    oDiv = $("#ab_hhh")[0];
                }
                oDiv.innerHTML = this.setting.sBox.replace("{0}", this.setting.MsgTitle);
                this.middle("ab_hhh");
            },
            LayerDiv: function () {
                var divobj;
                if ($("#body_pr").length <= 0) {
                    divobj = document.createElement("div");
                    divobj.id = "body_pr"; //LayerDiv_GGS
                    divobj.style.position = "absolute";
                    divobj.style.left = "0pt";
                    divobj.style.top = "0pt";
                    divobj.style.zIndex = 9999;
                    divobj.style.width = "100%";
                    divobj.style.backgroundColor = "rgb(0, 0, 0)";
                    divobj.style.height = (document.body.scrollHeight + 100) + "px";
                    divobj.style.opacity = "0.3";
                    if (document.all) {
                        divobj.style.filter = "alpha(opacity=30)";
                        divobj.innerHTML = '<iframe src="about:blank" frameborder="0" style="position:absolute; visibility:inherit; top:0px; left:0px; width:100%; height:100%; z-index:9999; filter=\'progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)\';"></iframe>';
                    }
                    document.body.appendChild(divobj);
                }
            },
            middle: function (_sId) {
                var d = document.getElementById(_sId);
                d.style.display = '';
                d.style.position = "absolute";
                d.style.width = "450px";
                d.style.zIndex = 99999;
                d.style.left = (document.body.clientWidth / 2) - (d.offsetWidth / 2) + "px";
                d.style.top = this.DialogLoc(d.offsetHeight) + "px";
            },
            DialogLoc: function (h) {
                var dde = document.documentElement;
                if (window.innerWidth) {
                    var wh = window.innerHeight;
                    var bgY = window.pageYOffset;
                }
                else {
                    var wh = dde.offsetHeight;
                    var bgY = dde.scrollTop;
                }
                t_DiglogY = (bgY + ((wh - h) / 2));
                return t_DiglogY;
            }
        },
        Disabletor: {
            paralist: [],
            initPara: function () {
                var obj = $("#formTb").get(0);
                this.initPara1(obj.getElementsByTagName("span"));
                this.initPara1(obj.getElementsByTagName("tr"));
                this.initPara1(obj.getElementsByTagName("input"));
                this.initPara1(obj.getElementsByTagName("select"));
            },
            initPara1: function (nodes) {
                for (var i = 0; i < nodes.length; i++) {
                    if ($(nodes[i]).attr("id")) {
                        this.paralist[this.paralist.length] = $(nodes[i]).attr("id");
                    }
                }
            }
            ,
            setdisable: function (A, B, E) {
                //[{a:"",b:"",c:function(){} },{}]
                $.formValidator.removetip();
                this.initPara();
                for (var i = 0; i < A.length; i++) {
                    var D = A[i];
                    if (D.v == B) {
                        this.disable(this.paralist, D.a, D.t, E);
                        D.c();
                        break;
                    }
                }
            },
            disable: function (paraArray, disabeldArray, t, up) {
                if (paraArray.length == 0) { this.initPara(); paraArray = this.paralist; }
                var A = disabeldArray;
                var D = paraArray;
                try {
                    var B = A.split('|');
                    for (var i = 0; i < D.length; i++) {
                        var C = D[i];
                        var O = $("#" + C).get(0);
                        if (O.type == "radio") { continue; }
                        if (O.type == "hidden") { continue; }
                        if (C == "Title" || C == 'UserTag1' || C == 'UserTag2' || C.indexOf('_Tip') != -1 || C == "tt") { continue; }
                        var t1 = t == 0 ? 1 : 0;
                        if (jQuery.inArray(C, B) == -1) {
                            this.changeState(C, t1, up);
                        }
                        else {
                            this.changeState(C, t, up);
                        }
                    }
                }
                catch (ex) { }
            },
            changeState: function (a, t, up) {
                var A = $("#" + a);
                var B = $("#" + a).get(0);
                if (!A) { return; }
                if (!B.style) { return; }
                if (t == 0) {
                    A.css("display", "");
                    A.attr("disabled", false);
                    if (A.attr("type") == "text" && up == "0") {
                        if (!A.attr("Except")) {
                            if ('[|#|@]' == B.value) B.value = '';
                        }
                        else {
                            if (A.attr("Except") != "null") {
                                B.value = A.attr("Except");
                            }
                            else {
                                B.value = "";
                            }
                        }
                    }
                }
                else {
                    A.css("display", "none");
                    if (B.type == "text" && up == "0") {
                        B.value = '[|#|@]';
                    }
                    else {
                        try {
                            if (B.name && B.name == "oldlevel") {
                                B.disabled = true;
                            }
                        }
                        catch (ex) { }
                    }
                }
            },
            initSubValue: function (s1, p1, p2, h, t) {
                var A = $("#" + s1), B = $("#" + p1), C = $("#" + p2), D = $("#" + h);
                if (!A || !B || !C || !D) { return true; }
                var e1 = B.attr("Except");
                var e2 = C.attr("Except");
                try { $.j.Cookie.setcookie(D.attr("Name"), "[#except#]"); }
                catch (ex) { }
                if (e1 && e1 == B.val() && B.css("display") != 'none') {
                    D.val(B.val());
                    return;
                }
                if (e2 && e2 == C.val() && C.css("display") != 'none') {

                    D.val(C.val());
                    return;
                }
                if (A.css("display") != 'none') {

                    if (t == 0) {
                        document.getElementById(h).value = document.getElementById(p2).value;
                        D.val(C.val());
                    }
                    else {
                        if (B.val() != "" && C.val() != "") {
                            D.val(B.val() + "-" + C.val());
                        }
                    }
                }
                else {
                    D.val(B.val());
                }
            },
            initValue: function (hidid, p1, p2, t, up) {
                if (up == "0") { return; }
                var A = $("#" + hidid);
                var B = $("#" + p1);
                var C = $("#" + p2);
                if (A.val() != "") {
                    B.val(A.val().split('-')[0]);
                    if (!t) {
                        if (A.val().split('-')[1]) {
                            C.val(A.val().split('-')[1]);
                        }
                    }
                }
            }
        },
        Job: {
            submitType: 0, // 0:招聘, 1:求职
            rootCateID: 0, // 大类归属ID
            currentCateID: 0, // 当前类归属ID
            subzhaopininfo: function () {
                $.c.Job.submitType = 0;
                var youxiang = $("#jieshouyouxiang");
                var email = $("#Email");
                if (youxiang && email) {
                    youxiang.val(email.val());
                }
                try { $.c.Disabletor.initSubValue("minxinzi", "minxinzi", "maxxinzi", "hidprice", 1); }
                catch (ex) { }
                var clientFrame = $("#gsInfo").get(0);
                if (!clientFrame || !clientFrame.contentWindow || !clientFrame.contentWindow.getMode) {
                    alert("提交出错,公司信息不正确");
                    return false;
                }
                var clientWin = clientFrame.contentWindow;
                if (!clientWin.getMode())//如果是展示
                {
                    $("#gongsi").val(clientWin.getCompanyId());
                    $("#hangyeyaoqiu").val(clientWin.getCompanyTradeId());
                    if (!/^[1-9]+\d+$/.test($("#gongsi").val())) {
                        var _gsid = $("#gongsi").val();
                        if (_gsid.indexOf('error:') != -1) {
                            _gsid = _gsid.substr(_gsid.indexOf('error:') + 6);
                            alert(_gsid);
                        } else {
                            alert("提交出错，请与客服联系");
                        }
                        return false;
                    }
                    return true;
                }
                if (!clientWin.checkInput()) {
                    return false;
                }
                clientWin.subform($.c.Job.subValue);
                return false;
            },
            subqiuzhiinfo: function () {
                $.c.Job.submitType = 1;
                try {
                    $.c.Disabletor.initSubValue("minxinzi", "minxinzi", "maxxinzi", "hidprice", 1);
                } catch (e) { };
                var clientFrame = $('#gsInfo').get(0);
                if (!clientFrame || !clientFrame.contentWindow || !clientFrame.contentWindow.getMode) {
                    alert("提交出错，简历填写不正确");
                    return false;
                }
                var clientWin = clientFrame.contentWindow;
                if (!clientWin.getMode())//如果是展示
                {
                    $('#gongsi').val(clientWin.getCompanyId());
                    if (!/^[1-9]+\d+$/.test($('#gongsi').val())) {
                        alert("提交出错，请与客服联系");
                        return false;
                    }
                    $.c.Job.updateResume();
                    return false;
                }
                if (!clientWin.infomationvalidate()) {
                    //alert('简历表单验证失败');
                    return false;
                }
                clientWin.subform($.c.Job.subValue);
                return false;
            },
            // 获取求职信息
            getFindJobInfo: function () {
                var _zw = '', _title = '', _xz = '0', _nr = '';
                var objZW = $('#xiaozhiwei');
                if (objZW.length > 0) {
                    _zw = objZW.get(0).options[objZW.get(0).selectedIndex].text;
                }
                _title = $('#Title').val();
                _xz = $('#maxxinzi').val();
                if (_xz == '面议') _xz = '0';
                _nr = $('#Content').val();
                return [$.c.Job.rootCateID, $.c.Job.currentCateID, _zw, _title, _xz, _nr];
            },
            // 更新求职信息，然后自动提交表单
            updateResume: function () {
                var clientFrame = $('#gsInfo').get(0);
                var clientWin = clientFrame.contentWindow;
                var arrInfo = $.c.Job.getFindJobInfo();
                //alert(arrInfo.join('|'));// return;
                clientWin.sendLastedResume(arrInfo, function (typeid, msg) {
                    //alert(typeid + ', ' + msg); return;
                    try { $('#Phone').val(clientWin.GetPhone()); } catch (e) { };
                    $.formValidator.subform("aspnetForm", "fabu");
                });
            },
            subValue: function () {
                var clientWin = $("#gsInfo").get(0).contentWindow;
                if (clientWin.xmlHttp.readyState == 4) {
                    if (clientWin.xmlHttp.status == 200) {
                        var result = clientWin.xmlHttp.responseText;
                        if (result.indexOf('error:') != -1) {
                            result = result.substr(result.indexOf('error:') + 6);
                            alert(result);
                            return false;
                        } else {
                            var retrunValue = result.split('|');
                            $("#gongsi").val(retrunValue[0]);
                            if (!/^[1-9]+\d+$/.test($("#gongsi").val())) {
                                alert("提交出错，信息不正确");
                                return false;
                            }
                            if (retrunValue[1]) $('#hangyeyaoqiu').val(retrunValue[1]);
                            if ($.c.Job.submitType == 1) {
                                $.c.Job.updateResume();
                            } else {
                                $.formValidator.subform("aspnetForm", "fabu");
                            }
                        }
                    }
                }
            }
        },
        vip: {
            clearSelectOptions: function (obj) {
                obj.options.length = 0;
            }
        },
        sale: {
            gettag: function (a, b, c, d, e, f, h) {
                var obj = $("#" + c);
                var r = $("#" + e);
                var tt = $("#" + f);
                if (obj.val() == "") { tt.css("display", "none"); return; }
                var post = "cateid=" + a + "&";
                post += "localid=" + b + "&";
                post += "o=" + escape(obj.val());
                post += "&i=-1";
                post += "&infoID=" + d;
                $.j.callajax("tag", post, function (text) {
                    r.html(text);
                    if (tt) {
                        if (text.replace(" ", "") != "") {
                            tt.css("display", "");
                            if (h) {
                                h();
                            }
                        }
                        else {
                            tt.css("display", "none");
                        }
                    }
                });
            }
        },
        fk: {
            k: "",
            i: function (c) {
                $.c.fk.k = c;
            },
            s: function (f) {
                try {
                    var a = $.c.fk.g();
                    if (a == "" || a == undefined || a == null || a == 'null') {
                        a = $.c.fk.k;
                        $.c.fk.o().pc(a); // 设置cookie
                    }
                    if ($("#fcookie").val() == undefined) {
                        $("#" + f).append('<input name="fcookie" id="fcookie" type="hidden" value="' + a + '"/>');
                    }
                    else {
                        $("#fcookie").val(a);
                    }
                }
                catch (ex) { }
            },
            g: function () {
                try {
                    return $.c.fk.o().gc(); // 获取cookie
                }
                catch (ex) { }
                return "";
            },
            o: function () {
                try {
                    var e = document.getElementById('myFlash');
                    return (navigator.appName.indexOf('Microsoft') != -1) ? e : $('#fkdiv embed').get(0);
                } catch (ex) { }
                return null;
            }
        }
    }
})(jQuery)