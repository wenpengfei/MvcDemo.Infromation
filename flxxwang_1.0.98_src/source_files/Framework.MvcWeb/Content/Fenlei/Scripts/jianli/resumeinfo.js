(function($) {
    $._58common =
{
    subform: function(fi, i, v) {
        var f = $("#" + fi).get(0);
        if (!f.onsubmit || (f.onsubmit() != false)) {
            if (i) {
                $("#" + i).val(v);
            }
            var emai = document.getElementById("txtemail");
            var codes = document.getElementById("validatecode");
            if (this.IsMailValidate(emai) && this.checkAuthInputforLogin(codes)) {
                f.submit();
            }
        }
    },
    keydownsend: function(evt) {
        evt = (evt) ? evt : ((window.event) ? window.event : "")
        keyCode = evt.keyCode ? evt.keyCode : (evt.which ? evt.which : evt.charCode);
        if (keyCode == 13) {
            $("#submitForm").submit();
        }
    },
    //简历操作
    ResumeOperation: function(ids, states, types) {
        var infos = "";
        if (types == "refresh") {
            infos = "简历刷新";
        }
        if (types == "delete") {
            infos = "简历删除";
        }
        if (types == "state") {
            infos = "更改简历状态";
            var rstate = "公开";
            if (states == "0")
                rstate = "关闭";
            if (!window.confirm("您确定要" + rstate + "简历状态吗？")) {
                return;
            }
        }
        $.ajax({
            type: "post",
            dataType: "html",
            url: "http://jianli.flxxwang.com/ajax/action_ajaxresume/?id=" + ids + "&type=" + types + "&openstate=" + states,
            success: function(data, textStatus) {
                if (parseInt(data) == 0) {
                    alert(infos + "操作失败！");
                } else {
                    if (parseInt(data) == 1) {
                        setbg('简历刷新成功', 600, 200, 'http://jianli.flxxwang.com/template/default/userresume/refreshresumesuccess.htm')
                        var today = new Date();
                        var day = today.getDate();
                        var month = today.getMonth() + 1;
                        var year = today.getYear();
                        year = year < 1900 ? (1900 + year) : year;
                        var date = year.toString().substr(2, 2) + "-" + month + "-" + day;
                        $("#updDate").html(date);
                    } else {
                        alert(infos + "操作成功！");
                        if (types == "delete") {
                            window.parent.location.reload();
                            window.parent.closeopendiv();
                        } else {
                            location.href = location.href;
                        }
                    }
                }
            }
        });
    },
    IsMailValidate: function(obj) {
        try {
            var txtMail = obj.value;
            var check = true;
            var re = /^[_\.0-9a-zA-Z-]+[0-9a-zA-Z]@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,3}$/;
            var emtip = document.getElementById("checkemail");
            var emails = txtMail.split(';');
            $(emails).each(function(i, n) {
                if (n != "" && !n.match(re)) {
                    check = false;
                }
            });
            if (!check) {
                emtip.style.display = "block";
                return false;
            } else {
                emtip.style.display = "none";
                return true;
            }
        } catch (e) {
            return true;
        }
    },
    checkAuthInputforLogin: function(thisinput) {
        var re = /([a-zA-Z0-9]){5}/;
        var count = thisinput.value.length;
        var codetip = document.getElementById("checkcode");
        if ((thisinput.value == '')) {
            codetip.style.display = "block";
            return false;
        } else if (!thisinput.value.match(re) || count != 5) {
            codetip.style.display = "block";
            return false;
        } else {
            codetip.style.display = "none";
            return true;
        }
        return true;
    },
    SelectAllCheckBox: function(obj) {
        $("input[type=checkbox][^disabled]").attr("checked", obj ? obj.checked : this.checked);
    },
    DeleApply: function(ids) {
        if (confirm('你确认要删除吗?')) {
            $.ajax({
                url: "http://jianli.flxxwang.com/ajax/delapply/?id=" + ids,
                type: "post",
                dataType: "html",
                success: function(data) {
                    if (data == "true") {
                        alert("删除成功！");
                        location.href = location.href;
                    } else {
                        alert("删除失败！");
                    }
                }
            });
        }
    }
};
})(jQuery);

var UrlUtility = {
    DecordKey: function(v) {
        if (v && v != '') {
            return unescape(decodeURI(v));
        }
        return v;
    },
    EncordKey: function(v) {
        if (v && v != '') {
            return encodeURI(escape(v));
        }
        return v;
    },
    AddPara: function(url, name, value) {
        if (url.toString().indexOf('?') >= 0) {
            var re = new RegExp("([&?])" + name + "=([^&?]*)", "ig");
            return ((re.test(url)) ? (url.replace(re, RegExp.$1 + name + '=' + value)) : url + '&' + name + '=' + value);
        } else {
            return url + '?' + name + '=' + value;
        }
    },
    AddKeyPara: function(url, value, key) {
        if (!(key && key != '')) {
            key = 'key';
        }
        if (value && value != '') {
            value = UrlUtility.EncordKey(value);
            return UrlUtility.AddPara(url, key, value);
        } else {
            return UrlUtility.DelPara(url, key);
        }
    },
    GetKeyPara: function(url, key) {
        return UrlUtility.DecordKey(UrlUtility.GetParaValue(url, key));
    },
    DelPara: function(url, name) {
        var re = new RegExp("([&?])" + name + "=([^&?]*)(&|$)", "ig");
        if (re.test(url)) {
            url = url.replace(re, RegExp.$1);
            if (url.indexOf('?') == url.length - 1 || url.charAt(url.length - 1) == '&') {
                url = url.substring(0, url.length - 1);
            }
        }
        return url;
    },
    GetParaValue: function(url, name) {
        var re = new RegExp("[&?]" + name + "=([^&?]*)", "ig");
        return ((url.match(re)) ? (url.match(re)[0].substr(name.length + 2)) : '');
    }
}; 