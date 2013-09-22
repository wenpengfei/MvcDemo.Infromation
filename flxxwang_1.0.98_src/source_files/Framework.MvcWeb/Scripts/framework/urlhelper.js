if (!$f) {
    $f = {};
}
$f.url = {
    addUrlParam: function (url, key, value) {
        if (url.indexOf("/p") == -1) {
            if (url.substr(url.length - 1) != "/") {
                url += "/";
            }
            url += "p/" + key + "_" + value;
            return url;
        }

        if (url.indexOf("/p/") == -1) {
            url += "/";
        }
        var params = url.substr(url.indexOf("/p/") + 3);
        if (params == "") {
            url += key + "_" + value;
            return url;
        }

        var path = url.substr(0, url.lastIndexOf("/p/") + 2);
        var paramArray = params.split("/");
        for (var i = 0; i < paramArray.length; i++) {
            var param = paramArray[i];
            if (param == "") {
                continue;
            }
            var paramName = null;
            if (param.indexOf("_") == -1) {
                paramName = param;
            }
            else {
                paramName = param.substr(0, param.indexOf("_"));
            }
            if (paramName == key) {
                paramArray[i] = paramName + "_" + value;
                for (var j = 0; j < paramArray.length; j++) {
                    var p = paramArray[j];
                    if (p == "") {
                        continue;
                    }
                    if (p.indexOf("_") != -1) {
                        var k = p.substr(0, p.indexOf("_"));
                        var v = p.substr(p.indexOf("_") + 1);
                        path += "/" + k + "_" + v;
                    }
                }
                return path;

            }
        }
        if (url.substr(url.length - 1) != "/") {
            url += "/";
        }
        url += key + "_" + value;
        return url;
    },

    removeUrlParam: function (url, key) {
        if (url.indexOf("/p/") == -1) {
            return url;
        }
        var params = url.substr(url.indexOf("/p/") + 3);
        if (params == "") {
            return url;
        }

        var path = url.substr(0, url.lastIndexOf("/p/") + 2);
        var paramArray = params.split("/");
        var findName = null;
        for (var i = 0; i < paramArray.length; i++) {
            var param = paramArray[i];
            if (param == "") {
                continue;
            }
            var paramName = null;
            if (param.indexOf("_") == -1) {
                paramName = param;
                if (paramName == key) {
                    findName = paramName;
                }
            }
            else {
                paramName = param.substr(0, param.indexOf("_"));
                if (paramName == key) {
                    findName = paramName;
                }
            }
        }
        if (findName != null) {
            for (var j = 0; j < paramArray.length; j++) {
                var param = paramArray[j];
                if (param == "") {
                    continue;
                }
                var paramName = null;
                var value = null;
                if (param.indexOf("_") == -1) {
                    paramName = param;
                    value = null;
                }
                else {
                    paramName = param.substr(0, param.indexOf("_"));
                    value = param.substr(param.indexOf("_") + 1);

                }
                if (paramName != key) {
                    path += "/" + paramName + "_" + value;
                }

            }
            url = path;

            if (url.substr(url.length - 2) == "/p") {
                url = url.substr(0, url.indexOf("/p"));
            }
            else if (url.substr(url.length - 3) == "/p/") {
                url = url.substr(0, url.indexOf("/p/"));
            }
            return url;
        }
        return url;
    },

    getUrlParam: function (url, key) {
        if (url.indexOf("/p/") == -1) {
            return "";
        }
        var params = url.substr(url.indexOf("/p/") + 3);
        if (params == "") {
            return "";
        }

        var paramArray = params.split("/");
        for (var i = 0; i < paramArray.length; i++) {
            var param = paramArray[i];
            if (param == "") {
                continue;
            }
            var paramName = null;
            if (param.indexOf("_") == -1) {
                paramName = param;
                if (paramName == key) {
                    return "";
                }
            }
            else {
                paramName = param.substr(0, param.indexOf("_"));
                if (paramName == key) {
                    return param.substr(param.indexOf("_") + 1);
                }
            }
        }
        return "";
    }
}