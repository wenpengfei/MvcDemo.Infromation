if (!$info) {
    $info = {};
}
$info.Uploader = {
    MaxNum: 8,
    SavedNum: 0,
    UploadPanel: null,
    PicUrls: [],
    // 初始化
    init: function () {
        // 上传区域
        $info.Uploader.UploadPanel = $('#uploadPic');
        if ($info.Uploader.UploadPanel.length == 0) {
            return; // 找不到上传区域
        }

        // 初始化最大上传数
        var a = $info.Uploader.UploadPanel.attr('maxNum');
        if (a != undefined) {
            if (!isNaN(a)) {
                $info.Uploader.MaxNum = parseInt(a, 10);
            }
        }

        // 创建帧窗口
        var strFrame = '<div style="display:none;" id="divframe">';
        for (var i = 0; i < $info.Uploader.MaxNum; i++) {
            strFrame += '<iframe id="formSubmitPic_' + i + '" name="formSubmitPic_' + i + '"></iframe>';
        }
        strFrame += '</div>';
        $info.Uploader.UploadPanel.append(strFrame);


        // 创建图片显示区域
        var strPic = '<ul></ul>';
        $info.Uploader.UploadPanel.append(strPic);

        // 绘制页面
        var b = '<div name="divUploader" class="cls_divUploader"><div class="loadbutton"><input id="fileUploadInput" name="fileUploadInput" type="file"></div>';
        b += '&nbsp;<span class="upload_ok">可上传 <font color="red" name="limitNum">' + $info.Uploader.MaxNum + '</font> 张图片，每张最大2M，支持jpg/gif/bmp/png格式</span>';
        b += '<span class="upload_error" style="display:none;"></span>';
        b += '<span class="upload_ing" style="display:none;"></span>';
        b += '<span class="upload_maxnum" style="display:none;">上传成功。您已经上传了' + $info.Uploader.MaxNum + '张图片，如果您还想上传，只能删除已上传的图片。</span>';
        b += '</div>';
        b += '<input type="hidden" id="backFunction" name="backFunction" value="$info.Uploader.finish" />';
        b += '<input type="hidden" name="Pic" id="Pic" value="" />';
        b += '<input type="hidden" name="PicDesc" id="PicDesc" value="" />';
        b += '<input type="hidden" name="PicPos" id="PicPos" value="0" />'; // 上传索引标记，关联元素（li、pic上传、iframe）
        $info.Uploader.UploadPanel.append(b);

        // 绑定
        $('#uploadPic :file').bind('change', $info.Uploader.upload);

        // 加载默认图片
        $info.Uploader.loadDefaultPics();
    },
    // 加载默认图片
    loadDefaultPics: function () {
        var val = $info.Uploader.UploadPanel.attr('value');
        if (val != null && val != undefined && val != '') {
            var pics = val.split('|');
            $(pics).each(function (i, n) {
                var r = $info.Uploader.isNetPic(n);
                if (r) {
                    var _p = $info.Uploader.cutRootUrl(n);
                    $info.Uploader.finish(1, _p);
                    $info.Uploader.SavedNum++; // 已保存的
                }
            });
        }
        $info.Uploader.showLimitNum();
    },

    // 判断是否为网络图片
    isNetPic: function (url) {
        var pattern = new RegExp('http://', 'i');
        return url.match(pattern) != null;
    },

    // 去掉根url路径
    cutRootUrl: function (url) {
        var pattern = new RegExp('http://pic.taojen', 'i');
        return url.replace(pattern, '');
    },

    // 显示图片(pos==null时，新建li)
    showPic: function (pos, typeid, url) {
        var _u = url;
        switch (typeid) {
            case -1:
                _u = 'http://pic2.taojen/n/images/post/05043120.gif'; // 上传中
                break;
            case 0:
                _u = 'http://pic2.taojen/n/images/post/05043121.gif'; // 上传失败
                break;
            case 1:
                _u = $info.Uploader.setViewMode(2, url); // 上传成功
                break;
        }
        var htm = '<li' + $info.Uploader.appendDataAttr(typeid, url, pos) + '><div class="displayimg"><img src="' + _u + '" onerror="$info.Uploader.reloadPic(this);" /></div>';
        htm += '<input type="text" class="picDesc" onblur="$info.Uploader.joinPicDesc(this);" /><a class="previous" href="javascript:void(0);" onclick="$info.Uploader.changePos(this, -1);" title="前移">上一张</a><span class="front-cover">&nbsp;</span><a class="next" href="javascript:void(0);" onclick="$info.Uploader.changePos(this, 1);" title="后移">下一张</a><a class="delete" href="javascript:void(0);" title="删除该图片" onclick="$info.Uploader.deletePic(this, \'' + url + '\');">删除该图片</a></li>';

        var objUL = $('#uploadPic ul');
        if (pos == null) {
            objUL.append(htm);
            $info.Uploader.setPos(); // 设置新的上传索引
            $.log('设置新的上传索引:' + $info.Uploader.getPos());
            $('#uploadPic ul li:last').attr('pos', $info.Uploader.getPos());
        } else {
            $.log('重绘上传索引区域:' + pos);
            $('#uploadPic ul li[pos=' + pos + ']').replaceWith(htm);
            $('#uploadPic div iframe[pos=' + pos + ']').removeAttr('loading');
        }

        $info.Uploader.joinPicUrl();
        $info.Uploader.joinPicDesc(null);
        $info.Uploader.markCover();
    },
    // 追加数据属性
    appendDataAttr: function (typeid, url, pos) {
        var r = '';
        if (typeid == -1) {
            r = ' uploading=1'; // 上传状态标识
        } else if (typeid == 1) {
            r = ' picUrl="' + url + '"';
        }
        if (pos != null)
            r += ' pos=' + pos;
        return r;
    },
    // 标记第一张为封面
    markCover: function () {
        $('#uploadPic .front-cover').html('&nbsp;');
        $('#uploadPic .front-cover:eq(0)').html('封面');
    },
    // 开始上传
    upload: function () {
        if (!$info.Uploader.checkLimitNum()) return;
        var a = $('#uploadPic :file');
        if (a.val().length > 0) {
            var pos = null; // pos为null表示新增
            $info.Uploader.showPic(pos, -1, null); // 设置为上传中
            pos = $info.Uploader.getPos(); // 获取当前上传索引标识
            var objframe = $info.Uploader.getiframe(); // 获取一个可用的iframe窗口
            var framename = objframe.attr('name');
            if (objframe.attr('src') == '/fenlei/fileupload/SkinPart/submit.htm') {
                $info.Uploader.startUpload(framename, pos);
            } else {
                objframe.bind('load', function () {
                    $info.Uploader.startUpload(framename, pos);
                });
                objframe.attr("src", "/fenlei/fileupload/SkinPart/submit.htm");
            }
        }
    },
    // 获取一个可用的iframe窗口
    getiframe: function () {
        var objframe = $('#uploadPic div iframe:not(#uploadPic div iframe[loading=1]):first');
        $.log('已获取到一个有用的iframe窗口：' + objframe.attr('id'));
        return objframe;
    },
    // 获取当前上传索引
    getPos: function () {
        try {
            var r = $('#PicPos').val();
            if (r == null || r == '') return 0;
            return parseInt(r);
        } catch (e) { return 0; };
    },
    // 设置新的上传索引
    setPos: function () {
        var i = $info.Uploader.getPos() + 1;
        $('#PicPos').val(i);
    },
    // 开始上传
    startUpload: function (iframeName, pos) {
        var objframe = $('iframe[name="' + iframeName + '"]');
        objframe.unbind('load');
        objframe.attr('loading', 1); // 标识为正在上传中，其他事件不允许占用该窗口
        objframe.attr('pos', pos); // 标识当前上传索引
        $.log('%s : 已卸载load事件、已标记loading=1、已标记pos=%s', iframeName, pos);

        var f = document.getElementById("aspnetForm");
        //                f.action = "/upload";
        f.action = "/fenlei/fileupload/upload.aspx";
        f.target = iframeName;
        f.submit();
        $info.Uploader.setUploading();
        $info.Uploader.SavedNum++;
        setTimeout($info.Uploader.clearFileValue, 800); // 清空
    },
    // 正在上传中
    setUploading: function () {
        $info.Uploader.showUploadTip(1, '正在上传中，请稍等……');
    },
    // 设置显示模式
    setViewMode: function (typeid, path) {
        if (typeid > 0) {
            var s = ['big', 'small', 'tiny'];
            path = path.replace(new RegExp('/big/', 'i'), '/' + s[typeid] + '/');
        }
        //                if (!$info.Uploader.isNetPic(path))
        //                    path = 'http://pic.taojen' + path;
        return path
    },
    // 上传完成
    finish: function (state, msg, pos) {
        if (state == 1) {
            var _d = $info.Uploader.getDelayByFileName(msg);
            setTimeout(function () {
                $info.Uploader.showPic(pos, 1, msg);
                $info.Uploader.showLimitNum();
                $info.Uploader.showUploadTip(0, null);
            }, _d);
        } else {
            $info.Uploader.showPic(pos, 0, null); // 上传失败
            $info.Uploader.showUploadTip(2, msg);
        }
    },
    // 改变位置
    changePos: function (obj, typeid) {
        var objLI = $('#uploadPic ul li');
        if (objLI.length == 1) return;
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

        $info.Uploader.joinPicUrl();
        $info.Uploader.joinPicDesc(null);
        $info.Uploader.markCover();
    },
    // 是否处于上传状态
    isLoadingState: function () {
        var r = false;
        var objLI = $('#uploadPic ul li');
        $(objLI).each(function (i, n) {
            if ($(n).attr('uploading') == 1) {
                r = true;
                return false;
            }
        });
        return r;
    },
    // 重新加载图片
    reloadPic: function (objImg) {
        var _url = $info.Uploader.getRightPicUrl(objImg.src);
        var err = $(objImg).data("reload");
        var trytime = 0; // 重试次数
        if (err) {
            trytime = parseInt(err, 10);
        }
        if (trytime < 3) { // 重试3次
            trytime++;
            setTimeout(function () {
                objImg.src = _url + '?rnd=' + Math.random();
                $(objImg).data("reload", trytime);
            }, 1500);
        }
    },
    // 显示上传提示
    showUploadTip: function (typeid, msg) {
        $('span.upload_ok').hide();
        $('span.upload_ing').hide();
        $('span.upload_error').hide();
        $('span.upload_maxnum').hide();
        switch (typeid) {
            case 0:
                // 默认成功
                if ($info.Uploader.SavedNum == $info.Uploader.MaxNum) {
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
    showLimitNum: function () {
        var n = $info.Uploader.MaxNum - $info.Uploader.SavedNum;
        $('#uploadPic font[name="limitNum"]').html(n);
        $('span.upload_ok').show();
        $('span.upload_error').hide();
    },
    // 判断剩余上传数
    checkLimitNum: function () {
        var n = $info.Uploader.MaxNum - $info.Uploader.SavedNum;
        return n > 0;
    },
    // 拼接图片URL
    joinPicUrl: function () {
        var objLI = $('#uploadPic ul li');
        var arrPic = [];
        objLI.each(function (i, n) {
            var _v = $(n).attr('picUrl');
            if (_v) {
                arrPic[arrPic.length] = _v;
            }
        });
        $('#Pic').val(arrPic.join('|'));
    },
    // 拼接图片描述
    joinPicDesc: function (sender) {
        if (sender != null)
            $(sender).val(sender.value.substring(0, 6));

        var s = [];
        $('#uploadPic .picDesc').each(function (i, n) {
            s[s.length] = $(n).val();
        });
        $('#PicDesc').val(s.join('|'));
    },
    // 删除图片
    deletePic: function (obj, url) {
        //if ($info.Uploader.isLoadingState()) return;
        var objLi = $(obj).parent();
        var picUrl = objLi.attr('picUrl');
        if (picUrl) {
            var u = '/delpic';
            $.post(u, { picurl: escape(url) }, function () { });
        }
        var pos = objLi.attr('pos');
        $('#uploadPic div iframe[pos=' + pos + ']').removeAttr('loading').removeAttr('pos');
        $.log('删除图片- 恢复对应窗口的可上传属性, pos=%s', pos);
        objLi.remove();
        $info.Uploader.SavedNum--;
        $info.Uploader.showLimitNum();
        $info.Uploader.joinPicUrl();
        $info.Uploader.joinPicDesc(null);
        $info.Uploader.markCover();
        $info.Uploader.showUploadTip(0, null);
    },
    // 清空上传控件中的值
    clearFileValue: function () {
        if (document.all) {
            var _h = '<input type="file" name="fileUploadInput" id="fileUploadInput">';
            $('#uploadPic :file').get(0).outerHTML = _h;
        } else {
            $('#uploadPic :file').val('');
        }
        $('#uploadPic :file').bind('change', $info.Uploader.upload);
    },
    // 中止上传
    stopUploading: function () {
        if ($info.Uploader.isLoadingState() == false) return;
        var ifrms = $('#uploadPic div iframe');
        ifrms.removeAttr('src').unbind('load');
        var lis = $('#uploadPic ul li');
        lis.removeAttr('uploading');
    },
    // 获取延迟毫秒数
    getDelayByFileName: function (f) {
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
    getRightPicUrl: function (url) {
        url = url.replace(new RegExp("\\?rnd=(.*)", "i"), '');
        return url;
    }
}