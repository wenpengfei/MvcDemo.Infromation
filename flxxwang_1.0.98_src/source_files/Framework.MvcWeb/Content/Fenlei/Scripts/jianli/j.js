//document.domain = "flxxwang.com";
var autoHight = 400;
if (window.name != "ContainerFrame") {
    autoHight = 320;
}
function setIf() {
    if (parent.document.getElementById("ContainerFrame") != null) {
        parent.document.getElementById("ContainerFrame").height = autoHight + "px";
    }
    if (parent.document.getElementById("gsInfo") != null) {
        parent.document.getElementById("gsInfo").height = autoHight + "px";
    }
}
(function($) {
    $.c = {
        Uploader: {
            LoadCount: [],
            MaxNum: 8,
            SavedNum: 0,
            UploadPanel: null,
            PicUrls: [],
            // 初始化
            init: function() {
                // 上传区域
                $.c.Uploader.UploadPanel = $('#uploadPic');
                if ($.c.Uploader.UploadPanel.length == 0) {
                    return; // 找不到上传区域
                }
                // 初始化最大上传数
                var a = $.c.Uploader.UploadPanel.attr('maxNum');
                if (a != undefined) {
                    if (!isNaN(a)) {
                        $.c.Uploader.MaxNum = parseInt(a, 10);
                    }
                }
                // 创建帧窗口
                var strFrame = '<div style="display:none;" id="divframe">';
                for (var i = 0; i < $.c.Uploader.MaxNum; i++) {
                    $.c.Uploader.LoadCount[i] = 0;
                    strFrame += '<iframe id="formSubmitPic_' + i + '" name="formSubmitPic_' + i + '"></iframe>';
                }
                strFrame += '</div>';
                $.c.Uploader.UploadPanel.append(strFrame);
                // 创建图片显示区域
                var strPic = '<ul></ul>';
                $.c.Uploader.UploadPanel.append(strPic);
                // 绘制页面
                var b = '<div name="divUploader" class="cls_divUploader"><div class="loadbutton"><input id="fileUploadInput" class="fileUploadInput" name="fileUploadInput" type="file"></div>';
                b += '&nbsp;<span class="upload_ok">可上传 <font color="red" name="limitNum">' + $.c.Uploader.MaxNum + '</font> 张图片，每张最大2M，支持jpg/gif/bmp/png格式，上传图片的帖子效果提高60%</span>';
                b += '<span class="upload_error" style="display:none;"></span>';
                b += '<span class="upload_ing" style="display:none;"></span>';
                b += '<span class="upload_maxnum" style="display:none;">上传成功。您已经上传了' + $.c.Uploader.MaxNum + '张图片，如果您还想上传，只能删除已上传的图片。</span>';
                b += '</div>';
                b += '<input type="hidden" id="backFunction" name="backFunction" value="$.c.Uploader.finish" />';
                b += '<input type="hidden" name="Pic" id="Pic" value="" />';
                b += '<input type="hidden" name="PicDesc" id="PicDesc" value="" />';
                b += '<input type="hidden" name="PicPos" id="PicPos" value="0" />';
                $.c.Uploader.UploadPanel.append(b);
                // 绑定
                if ($.browser.msie) {
                    $('#uploadPic :file').bind('propertychange', $.c.Uploader.upload);
                } else {
                    $('#uploadPic :file').bind('change', $.c.Uploader.upload);
                }
                // 加载默认图片
                $.c.Uploader.loadDefaultPics();
                if ($.c.Uploader.SavedNum > 0) {
                    if (parent.document.getElementById("gsInfo") != null) {
                        setTimeout("setIf()", 1000);
                    }
                }
            },
            // 加载默认图片
            loadDefaultPics: function() {
                var val = $.c.Uploader.UploadPanel.attr('value');
                if (val != null && val != undefined && val != '') {
                    var pics = val.split('|');
                    $(pics).each(function(i, n) {
                        var r = $.c.Uploader.isNetPic(n);
                        if (r) {
                            var _p = $.c.Uploader.cutRootUrl(n);
                            $.c.Uploader.finish(1, _p);
                            $.c.Uploader.SavedNum++;
                        }
                    });
                }
                $.c.Uploader.showLimitNum();
            },
            // 判断是否为网络图片
            isNetPic: function(url) {
                var pattern = new RegExp('http://', 'i');
                return url.match(pattern) != null;
            },
            // 去掉根url路径
            cutRootUrl: function(url) {
                var pattern = new RegExp('http://pic.flxxwang.com', 'i');
                return url.replace(pattern, '');
            },
            // 显示图片(pos==null时，新建li)
            showPic: function(pos, typeid, url) {
                var _u = url;
                switch (typeid) {
                    case -1:
                        _u = '/Content/Fenlei/images/post/05043120.gif'; // 上传中
                        break;
                    case 0:
                        _u = '/Content/Fenlei/images/post/05043121.gif'; // 上传失败
                        break;
                    case 1:
                        _u = $.c.Uploader.setViewMode(2, url); // 上传成功
                        break;
                }
                var htm = '<li' + $.c.Uploader.appendDataAttr(typeid, url) + '><div class="displayimg"><img src="' + _u + '" onerror="$.c.Uploader.reloadPic(this);" /></div>';
                htm += '<input type="text" class="picDesc" onblur="$.c.Uploader.joinPicDesc(this);" /><a class="previous" href="javascript:void(0);" onclick="$.c.Uploader.changePos(this, -1);">上一张</a><span class="front-cover">&nbsp;</span><a class="next" href="javascript:void(0);" onclick="$.c.Uploader.changePos(this, 1);">下一张</a><a class="delete" href="javascript:void(0);" title="删除该图片" onclick="$.c.Uploader.deletePic(this, \'' + url + '\');">删除该图片</a></li>';

                var objUL = $('#uploadPic ul');
                if (pos == null) {
                    objUL.append(htm);
                } else {
                    $('#uploadPic ul li:eq(' + pos + ')').replaceWith(htm);
                }
                $.c.Uploader.joinPicUrl();
                $.c.Uploader.joinPicDesc(null);
                $.c.Uploader.markCover();
            },
            // 追加数据属性
            appendDataAttr: function(typeid, url) {
                var r = '';
                if (typeid == -1) {
                    r = ' uploading=1';
                } else if (typeid == 1) {
                    r = ' picUrl="' + url + '"';
                }
                return r;
            },
            // 标记第一张为封面
            markCover: function() {
                $('#uploadPic .front-cover').html('&nbsp;');
                $('#uploadPic .front-cover:eq(0)').html('封面');
            },
            // 开始上传
            upload: function() {
                if (!$.c.Uploader.checkLimitNum()) return;
                var a = $('#uploadPic :file');
                if (a.val().length > 0) {
                    var pos = null; // pos为null表示新增
                    $.c.Uploader.showPic(pos, -1, null);
                    var objLI = $('#uploadPic ul li');
                    if (pos == null) pos = objLI.length - 1;
                    $('#PicPos').val(pos); // 设置上传索引
                    var fs = $("#formSubmitPic_" + pos);
                    if (fs.attr("src") != "/Template/SkinPart/submit.htm") {
                        fs.bind("load", function() {
                            if ($.c.Uploader.LoadCount[pos] > 0) {
                                return;
                            }
                            $.c.Uploader.iframonloadupload(pos);
                            $.c.Uploader.LoadCount[pos] = 1;
                        });
                        fs.attr("src", "/Template/SkinPart/submit.htm");
                    }
                    else {
                        $.c.Uploader.iframonloadupload(pos);
                    }
                }
            },
            iframonloadupload: function(pos) {
                // 开始上传
                var f = document.getElementById("aspnetForm");
//                f.action = "/template/skinpart/uppicweb2.aspx";
                f.action = "/fenlei/fileupload/upload.aspx";
                f.target = 'formSubmitPic_' + pos;
                f.submit();
                $.c.Uploader.setUploading();
                $.c.Uploader.SavedNum++;

                // 清空
                setTimeout($.c.Uploader.clearFileValue, 800);
                if (parent.document.getElementById("ContainerFrame") != null) {
                    parent.ResizeFrame(parent.document.getElementById("ContainerFrame"));
                }
                if (parent.document.getElementById("gsInfo") != null) {
                    parent.document.getElementById("gsInfo").height = autoHight + "px";
                }
            },
            // 正在上传中
            setUploading: function() {
                $.c.Uploader.showUploadTip(1, '正在上传中，请稍等……');
            },
            // 设置显示模式
            setViewMode: function(typeid, path) {
                if (typeid > 0) {
                    var s = ['big', 'small', 'tiny'];
                    path = path.replace(new RegExp('/big/', 'i'), '/' + s[typeid] + '/');
                }
                if (!$.c.Uploader.isNetPic(path))
                    path = 'http://pic.flxxwang.com' + path;
                return path
            },
            // 上传完成
            finish: function(state, msg, pos) {
                if (state == 1) {
                    var _d = $.c.Uploader.getDelayByFileName(msg);
                    //alert(_d);
                    setTimeout(function() {
                        $.c.Uploader.showPic(pos, 1, msg);
                        $.c.Uploader.showLimitNum();
                        $.c.Uploader.showUploadTip(0, null);
                    }, _d);
                } else {
                    $.c.Uploader.showPic(pos, 0, null); // 上传失败
                    $.c.Uploader.showUploadTip(2, msg);
                }
            },
            // 改变位置
            changePos: function(obj, typeid) {
                var objLI = $('#uploadPic ul li');
                if (objLI.length == 1) return;
                if ($.c.Uploader.isLoadingState()) return;
                var li = $(obj).parent();
                var index = objLI.index(li);
                var index2 = index + typeid;
                if (index2 < 0) {
                    index2 = (objLI.length - 1);
                } else if (index2 == $('#uploadPic ul li').length) {
                    index2 = 0;
                }
                var li2 = $('#uploadPic ul li:eq(' + index2 + ')');

                li.css('opacity', 0.5);
                if (typeid < 0) {
                    if (index == 0) {
                        $(li2).after(li);
                    }
                    else {
                        $(li2).before(li);
                    }
                }
                else {
                    if (index == objLI.length - 1) {
                        li2.before(li);
                    } else {
                        $(li2).after(li);
                    }
                }
                li.animate({ opacity: 1 }, 450);

                $.c.Uploader.joinPicUrl();
                $.c.Uploader.joinPicDesc(null);
                $.c.Uploader.markCover();
            },
            // 是否处于上传状态
            isLoadingState: function() {
                var r = false;
                var objLI = $('#uploadPic ul li');
                $(objLI).each(function(i, n) {
                    if ($(n).attr('uploading') == 1) {
                        r = true;
                        return false;
                    }
                });
                return r;
            },
            // 重新加载图片
            reloadPic: function(objImg) {
                var _url = $.c.Uploader.getRightPicUrl(objImg.src);
                var err = $(objImg).data("reload");
                var trytime = 0; // 重试次数
                if (err) {
                    trytime = parseInt(err, 10);
                }
                if (trytime < 3) { // 重试3次
                    trytime++;
                    setTimeout(function() {
                        objImg.src = _url + '?rnd=' + Math.random();
                        $(objImg).data("reload", trytime);
                    }, 1500);
                }
            },
            // 显示上传提示
            showUploadTip: function(typeid, msg) {
                $('span.upload_ok').hide();
                $('span.upload_ing').hide();
                $('span.upload_error').hide();
                $('span.upload_maxnum').hide();
                switch (typeid) {
                    case 0:
                        // 默认成功
                        if ($.c.Uploader.SavedNum == $.c.Uploader.MaxNum) {
                            $('span.upload_maxnum').show();
                        } else {
                            $('span.upload_ok').show();
                        }
                        break;
                    case 1:
                        // 上传中
                        $('span.upload_ing').show().html(msg);
                        break;
                    case 2:
                        // 上传失败
                        $('span.upload_error').show().html(msg);
                        break;
                }
            },
            // 显示剩余上传数
            showLimitNum: function() {
                var n = $.c.Uploader.MaxNum - $.c.Uploader.SavedNum;
                $('#uploadPic font[name="limitNum"]').html(n);
                $('span.upload_ok').show();
                $('span.upload_error').hide();
            },
            // 判断剩余上传数
            checkLimitNum: function() {
                var n = $.c.Uploader.MaxNum - $.c.Uploader.SavedNum;
                return n > 0;
            },
            // 拼接图片URL
            joinPicUrl: function() {
                var objLI = $('#uploadPic ul li');
                var arrPic = [];
                objLI.each(function(i, n) {
                    var _v = $(n).attr('picUrl');
                    if (_v) {
                        arrPic[arrPic.length] = _v;
                    }
                });
                $('#Pic').val(arrPic.join('|'));
            },
            // 拼接图片描述
            joinPicDesc: function(sender) {
                if (sender != null)
                    $(sender).val(sender.value.substring(0, 6));

                var s = [];
                $('#uploadPic .picDesc').each(function(i, n) {
                    s[s.length] = $(n).val();
                });
                $('#PicDesc').val(s.join('|'));
            },
            // 删除图片
            deletePic: function(obj, url) {
                if ($.c.Uploader.isLoadingState()) return;
                var objLi = $(obj).parent();
                var picUrl = objLi.attr('picUrl');
                if (picUrl) {
                    var u = '/template/skinpart/delpic.aspx';
                    $.post(u, { picurl: escape(url) }, function() { });
                }
                objLi.remove();
                $.c.Uploader.SavedNum--;
                $.c.Uploader.showLimitNum();
                $.c.Uploader.joinPicUrl();
                $.c.Uploader.joinPicDesc(null);
                $.c.Uploader.markCover();
                $.c.Uploader.showUploadTip(0, null);
                if (parent.document.getElementById("gsInfo") != null) {
                    if ($.c.Uploader.SavedNum == 0)
                        parent.document.getElementById("gsInfo").height = 250 + "px";
                }
            },
            // 清空上传控件中的值
            clearFileValue: function() {
                if (document.all) {
                    var _h = '<input type="file" name="fileUploadInput" class="fileUploadInput" id="fileUploadInput">';
                    $('#uploadPic :file').get(0).outerHTML = _h;
                } else {
                    $('#uploadPic :file').val('');
                }
                if ($.browser.msie) {
                    $('#uploadPic :file').bind('propertychange', $.c.Uploader.upload);
                } else {
                    $('#uploadPic :file').bind('change', $.c.Uploader.upload);
                }
            },
            // 获取延迟毫秒数
            getDelayByFileName: function(f) {
                var arr = [1500, 2500];
                var index = 0;
                if ($.browser.msie) {
                    var v = $.browser.version;
                    if (v == 7 || v == 8) {
                        f = f.toLowerCase();
                        var i = f.indexOf('.gif');
                        if (i > 0) index = 1;
                    }
                }
                return arr[index];
            },
            getRightPicUrl: function(url) {
                url = url.replace(new RegExp("\\?rnd=(.*)", "i"), '');
                return url;
            }
        },
        Uploader1: {
            LoadCount: [],
            MaxNum: 1,
            SavedNum: 0,
            UploadPanel: null,
            PicUrls: [],
            // 初始化
            init: function() {
                // 上传区域
                $.c.Uploader1.UploadPanel = $('#uploadPic1');
                if ($.c.Uploader1.UploadPanel.length == 0) {
                    return; // 找不到上传区域
                }
                // 初始化最大上传数
                var a = $.c.Uploader1.UploadPanel.attr('maxNum');
                if (a != undefined) {
                    if (!isNaN(a)) {
                        $.c.Uploader1.MaxNum = parseInt(a, 10);
                    }
                }
                // 创建帧窗口
                var strFrame = '<div style="display:none;" id="divframe1">';
                for (var i = 0; i < $.c.Uploader1.MaxNum; i++) {
                    $.c.Uploader1.LoadCount[i] = 0;
                    strFrame += '<iframe id="formSubmitPic1_' + i + '" name="formSubmitPic1_' + i + '"></iframe>';
                }
                strFrame += '</div>';
                $.c.Uploader1.UploadPanel.append(strFrame);
                // 创建图片显示区域
                var strPic = '<ul></ul>';
                $.c.Uploader1.UploadPanel.append(strPic);
                // 绘制页面
                var b = '<div name="divUploader1" class="cls_divUploader"><div class="loadbutton"><input id="fileUploadInput" class="fileUploadInput" name="fileUploadInput" type="file"></div>';
                b += '&nbsp;<span class="upload_ok">可上传 <font color="red" name="limitNum1">' + $.c.Uploader1.MaxNum + '</font> 张图片，每张最大2M，支持jpg/gif/bmp/png格式，上传图片的帖子效果提高60%</span>';
                b += '<span class="upload_error" style="display:none;"></span>';
                b += '<span class="upload_ing" style="display:none;"></span>';
                b += '<span class="upload_maxnum" style="display:none;">上传成功。您已经上传了' + $.c.Uploader1.MaxNum + '张图片，如果您还想上传，只能删除已上传的图片。</span>';
                b += '</div>';
                b += '<input type="hidden" id="backFunction" name="backFunction" value="$.c.Uploader1.finish" />';
                b += '<input type="hidden" name="Pic1" id="Pic1" value="" />';
                b += '<input type="hidden" name="PicDesc" id="PicDesc" value="" />';
                b += '<input type="hidden" name="PicPos" id="PicPos" value="0" />';
                $.c.Uploader1.UploadPanel.append(b);
                // 绑定
                if ($.browser.msie) {
                    $('#uploadPic1 :file').bind('propertychange', $.c.Uploader1.upload);
                } else {
                    $('#uploadPic1 :file').bind('change', $.c.Uploader1.upload);
                }
                // 加载默认图片
                $.c.Uploader1.loadDefaultPics();
            },
            // 加载默认图片
            loadDefaultPics: function() {
                var val = $.c.Uploader1.UploadPanel.attr('value');
                if (val != null && val != undefined && val != '') {
                    var pics = val.split('|');
                    $(pics).each(function(i, n) {
                        var r = $.c.Uploader1.isNetPic(n);
                        if (r) {
                            var _p = $.c.Uploader1.cutRootUrl(n);
                            $.c.Uploader1.finish(1, _p);
                            $.c.Uploader1.SavedNum++;
                        }
                    });
                }
                $.c.Uploader1.showLimitNum();
            },
            // 判断是否为网络图片
            isNetPic: function(url) {
                var pattern = new RegExp('http://', 'i');
                return url.match(pattern) != null;
            },
            // 去掉根url路径
            cutRootUrl: function(url) {
                var pattern = new RegExp('http://pic.flxxwang.com', 'i');
                return url.replace(pattern, '');
            },
            // 显示图片(pos==null时，新建li)
            showPic: function(pos, typeid, url) {
                var _u = url;
                switch (typeid) {
                    case -1:
                        _u = '/Content/Fenlei/images/post/05043120.gif'; // 上传中
                        break;
                    case 0:
                        _u = '/Content/Fenlei/images/post/05043121.gif'; // 上传失败
                        break;
                    case 1:
                        _u = $.c.Uploader1.setViewMode(2, url); // 上传成功
                        break;
                }
                var htm = '<li' + $.c.Uploader1.appendDataAttr(typeid, url) + '><div class="displayimg"><img src="' + _u + '" onerror="$.c.Uploader1.reloadPic(this);" /></div>';
                htm += '<input type="text" class="picDesc" onblur="$.c.Uploader1.joinPicDesc(this);" /><a class="delete" href="javascript:void(0);" title="删除该图片" onclick="$.c.Uploader1.deletePic(this, \'' + url + '\');">删除该图片</a></li>';
                //htm += '<input type="text" class="picDesc" onblur="$.c.Uploader1.joinPicDesc(this);" /><a class="previous" href="javascript:void(0);" onclick="$.c.Uploader1.changePos(this, -1);">上一张</a><span class="front-cover">&nbsp;</span><a class="next" href="javascript:void(0);" onclick="$.c.Uploader1.changePos(this, 1);">下一张</a><a class="delete" href="javascript:void(0);" title="删除该图片" onclick="$.c.Uploader1.deletePic(this, \'' + url + '\');">删除该图片</a></li>';

                var objUL = $('#uploadPic1 ul');
                if (pos == null) {
                    objUL.append(htm);
                } else {
                    $('#uploadPic1 ul li:eq(' + pos + ')').replaceWith(htm);
                }
                $.c.Uploader1.joinPicUrl();
                $.c.Uploader1.joinPicDesc(null);
                $.c.Uploader1.markCover();
            },
            // 追加数据属性
            appendDataAttr: function(typeid, url) {
                var r = '';
                if (typeid == -1) {
                    r = ' uploading=1';
                } else if (typeid == 1) {
                    r = ' picUrl="' + url + '"';
                }
                return r;
            },
            // 标记第一张为封面
            markCover: function() {
                $('#uploadPic1 .front-cover').html('&nbsp;');
                $('#uploadPic1 .front-cover:eq(0)').html('封面');
            },
            // 开始上传
            upload: function() {
                if (!$.c.Uploader1.checkLimitNum()) return;
                var a = $('#uploadPic1 :file');
                if (a.val().length > 0) {
                    var pos = null; // pos为null表示新增
                    $.c.Uploader1.showPic(pos, -1, null);
                    var objLI = $('#uploadPic1 ul li');
                    if (pos == null) pos = objLI.length - 1;
                    $('#PicPos').val(pos); // 设置上传索引
                    var fs = $("#formSubmitPic1_" + pos);
                    if (fs.attr("src") != "/Template/SkinPart/submit.htm") {
                        fs.bind("load", function() {
                            if ($.c.Uploader1.LoadCount[pos] > 0) {
                                return;
                            }
                            $.c.Uploader1.iframonloadupload(pos);
                            $.c.Uploader1.LoadCount[pos] = 1;
                        });
                        fs.attr("src", "/Template/SkinPart/submit.htm");
                    }
                    else {
                        $.c.Uploader1.iframonloadupload(pos);
                    }
                }
            },
            iframonloadupload: function(pos) {
                // 开始上传
                var f = document.getElementById("aspnetForm1");
                f.action = "/template/skinpart/uppicweb2.aspx";
                f.target = 'formSubmitPic1_' + pos;
                f.submit();
                $.c.Uploader1.setUploading();
                $.c.Uploader1.SavedNum++;

                // 清空
                setTimeout($.c.Uploader1.clearFileValue, 800);
            },
            // 正在上传中
            setUploading: function() {
                $.c.Uploader1.showUploadTip(1, '正在上传中，请稍等……');
            },
            // 设置显示模式
            setViewMode: function(typeid, path) {
                if (typeid > 0) {
                    var s = ['big', 'small', 'tiny'];
                    path = path.replace(new RegExp('/big/', 'i'), '/' + s[typeid] + '/');
                }
                if (!$.c.Uploader1.isNetPic(path))
                    path = 'http://pic.flxxwang.com' + path;
                return path
            },
            // 上传完成
            finish: function(state, msg, pos) {
                if (state == 1) {
                    var _d = $.c.Uploader1.getDelayByFileName(msg);
                    //alert(_d);
                    setTimeout(function() {
                        $.c.Uploader1.showPic(pos, 1, msg);
                        $.c.Uploader1.showLimitNum();
                        $.c.Uploader1.showUploadTip(0, null);
                    }, _d);
                } else {
                    $.c.Uploader1.showPic(pos, 0, null); // 上传失败
                    $.c.Uploader1.showUploadTip(2, msg);
                }
            },
            // 改变位置
            changePos: function(obj, typeid) {
                var objLI = $('#uploadPic1 ul li');
                if (objLI.length == 1) return;
                if ($.c.Uploader1.isLoadingState()) return;
                var li = $(obj).parent();
                var index = objLI.index(li);
                var index2 = index + typeid;
                if (index2 < 0) {
                    index2 = (objLI.length - 1);
                } else if (index2 == $('#uploadPic1 ul li').length) {
                    index2 = 0;
                }
                var li2 = $('#uploadPic1 ul li:eq(' + index2 + ')');

                li.css('opacity', 0.5);
                if (typeid < 0) {
                    if (index == 0) {
                        $(li2).after(li);
                    }
                    else {
                        $(li2).before(li);
                    }
                }
                else {
                    if (index == objLI.length - 1) {
                        li2.before(li);
                    } else {
                        $(li2).after(li);
                    }
                }
                li.animate({ opacity: 1 }, 450);

                $.c.Uploader1.joinPicUrl();
                $.c.Uploader1.joinPicDesc(null);
                $.c.Uploader1.markCover();
            },
            // 是否处于上传状态
            isLoadingState: function() {
                var r = false;
                var objLI = $('#uploadPic1 ul li');
                $(objLI).each(function(i, n) {
                    if ($(n).attr('uploading') == 1) {
                        r = true;
                        return false;
                    }
                });
                return r;
            },
            // 重新加载图片
            reloadPic: function(objImg) {
                var _url = $.c.Uploader1.getRightPicUrl(objImg.src);
                var err = $(objImg).data("reload");
                var trytime = 0; // 重试次数
                if (err) {
                    trytime = parseInt(err, 10);
                }
                if (trytime < 3) { // 重试3次
                    trytime++;
                    setTimeout(function() {
                        objImg.src = _url + '?rnd=' + Math.random();
                        $(objImg).data("reload", trytime);
                    }, 1500);
                }
            },
            // 显示上传提示
            showUploadTip: function(typeid, msg) {
                $('span.upload_ok').hide();
                $('span.upload_ing').hide();
                $('span.upload_error').hide();
                $('span.upload_maxnum').hide();
                switch (typeid) {
                    case 0:
                        // 默认成功
                        if ($.c.Uploader1.SavedNum == $.c.Uploader1.MaxNum) {
                            $('span.upload_maxnum').show();
                        } else {
                            $('span.upload_ok').show();
                        }
                        break;
                    case 1:
                        // 上传中
                        $('span.upload_ing').show().html(msg);
                        break;
                    case 2:
                        // 上传失败
                        $('span.upload_error').show().html(msg);
                        break;
                }
            },
            // 显示剩余上传数
            showLimitNum: function() {
                var n = $.c.Uploader1.MaxNum - $.c.Uploader1.SavedNum;
                $('#uploadPic1 font[name="limitNum1"]').html(n);
                $('span.upload_ok').show();
                $('span.upload_error').hide();
            },
            // 判断剩余上传数
            checkLimitNum: function() {
                var n = $.c.Uploader1.MaxNum - $.c.Uploader1.SavedNum;
                return n > 0;
            },
            // 拼接图片URL
            joinPicUrl: function() {
                var objLI = $('#uploadPic1 ul li');
                var arrPic = [];
                objLI.each(function(i, n) {
                    var _v = $(n).attr('picUrl');
                    if (_v) {
                        arrPic[arrPic.length] = _v;
                    }
                });
                $('#Pic1').val(arrPic.join('|'));
            },
            // 拼接图片描述
            joinPicDesc: function(sender) {
                if (sender != null)
                    $(sender).val(sender.value.substring(0, 6));

                var s = [];
                $('#uploadPic1 .picDesc').each(function(i, n) {
                    s[s.length] = $(n).val();
                });
                $('#PicDesc').val(s.join('|'));
            },
            // 删除图片
            deletePic: function(obj, url) {
                if ($.c.Uploader1.isLoadingState()) return;
                var objLi = $(obj).parent();
                var picUrl = objLi.attr('picUrl');
                if (picUrl) {
                    var u = '/template/skinpart/delpic.aspx';
                    $.post(u, { picurl: escape(url) }, function() { });
                }
                objLi.remove();
                $.c.Uploader1.SavedNum--;
                $.c.Uploader1.showLimitNum();
                $.c.Uploader1.joinPicUrl();
                $.c.Uploader1.joinPicDesc(null);
                $.c.Uploader1.markCover();
                $.c.Uploader1.showUploadTip(0, null);
            },
            // 清空上传控件中的值
            clearFileValue: function() {
                if (document.all) {
                    var _h = '<input type="file" name="fileUploadInput" class="fileUploadInput" id="fileUploadInput">';
                    $('#uploadPic1 :file').get(0).outerHTML = _h;
                } else {
                    $('#uploadPic1 :file').val('');
                }
                if ($.browser.msie) {
                    $('#uploadPic1 :file').bind('propertychange', $.c.Uploader1.upload);
                } else {
                    $('#uploadPic1 :file').bind('change', $.c.Uploader1.upload);
                }
            },
            // 获取延迟毫秒数
            getDelayByFileName: function(f) {
                var arr = [1500, 2500];
                var index = 0;
                if ($.browser.msie) {
                    var v = $.browser.version;
                    if (v == 7 || v == 8) {
                        f = f.toLowerCase();
                        var i = f.indexOf('.gif');
                        if (i > 0) index = 1;
                    }
                }
                return arr[index];
            },
            getRightPicUrl: function(url) {
                url = url.replace(new RegExp("\\?rnd=(.*)", "i"), '');
                return url;
            }
        }
    }
})(jQuery)