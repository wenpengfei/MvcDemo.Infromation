if (!$f) {
    $f = {};
}
$f.cookie = {
    get: function (name) {
        var values = document.cookie.match(new RegExp(name + "=([^&;]+)"));
        if (values != null) {
            return decodeURI(values[1]);
        } return null;
    },
    setcookie: function (name, value) {
        $f.cookie.set(name, value);
    },
    set: function (name, value, domain, expireDays, path) {
        //                var strCookie = name + "=" + escape(value) + ";";
        var strCookie = name + "=" + encodeURI(value) + ";";
        if (domain && domain != '') {
            strCookie = strCookie + "domain=" + domain + ";";
        }
        if (expireDays && expireDays > 0) {
            var exp = new Date();
            exp.setTime(exp.getTime() + (86400 * 1000 * expireDays));
            strCookie = strCookie + "expires=" + exp.toGMTString() + ";";
        }
        else {
            var exp = new Date();
            exp.setTime(exp.getTime() + (86400 * 1000 * 365));
            strCookie = strCookie + "expires=" + exp.toGMTString() + ";";
        }
        if (path && path != '') {
            strCookie = strCookie + "path=" + path + ";";
        }
        document.cookie = strCookie;
    },
    del: function (name) {
        $f.cookie.set(name, ' ', '', -1, '/');
    }
}
//示例:$f.cookie.set("minprice", 50, '', 0, "/fenlei/");