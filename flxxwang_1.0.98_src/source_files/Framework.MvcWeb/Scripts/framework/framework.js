/*
1、不要给Array添加成员.for(i in arr)会遍历出添加的成员.因此也不能给Object添加成员.
*/


Date.prototype.toJson = function (aspNet) {//fenlei/scripts/core.js也定义了一个toJSON(大写).
    if (aspNet) {
        this.setHours(this.getHours() + 8); //提交到asp.net时反系列化出来的时间要少8小时.
    }
    return "\/Date(" + Date.parse(this.toString()) + ")\/"
}
var $f = {
    date: {//待测试
        parseJson: function (jsonDate) {
            if (/Date\((\d+)\)/.test(jsonDate)) {
                return new Date(parseInt(RegExp.$1));
            }
        }
    },
    toJson: function (obj) {
        return Sys.Serialization.JavaScriptSerializer.serialize(obj);
    },
    evalDate: function (obj) {//待测试
        $.each(obj, function (p, v) {
            if (v && $f.isObject(v)) {
                $f.evalDate(p);
            }
            else {
                obj[p] = $f.date.parseJson(v);
            }
        });
    },
    eval: function (jsonStr) {//待测试 (jquery有$.parseJSON)
        var o = Sys.Serialization.JavaScriptSerializer.deserialize(jsonStr);
        return $f.evalDate(o);

    },
    select: function (arr, fun) {
        if (!$.isArray(arr) || !$.isFunction(fun)) {
            return undefined;
        }
        var a = [];
        $.each(arr, function (i, o) {
            a.push(fun(i, o));
        });
        return a;
    },
    clone: function (source) {//ok
        return $.extend({}, source);
        //        if (source == null) {
        //            return null;
        //        }
        //        var objClone;
        //        if (source.constructor == Object) {
        //            objClone = new source.constructor();
        //        }
        //        else {
        //            objClone = new source.constructor(source.valueOf());
        //        }
        //        for (var key in source) {
        //            if (objClone[key] != source[key]) {
        //                if (typeof (source[key]) == 'object') {
        //                    objClone[key] = this.clone(source[key]); // source[key].Clone();
        //                }
        //                else {
        //                    objClone[key] = source[key];
        //                }
        //            }
        //        }
        //        objClone.toString = source.toString;
        //        objClone.valueOf = source.valueOf;
        //        return objClone;
    },
    isObject: function (v) { return v && typeof v == "object" },
    isPrimitive: function (v) { var t = typeof v; return t == 'string' || t == 'number' || t == 'boolean' },
    isDefined: function (v) { return typeof v !== 'undefined' },
    isDate: function (v) { return toString.apply(v) === '[object Date]' },
    isObject: function (v) { return !!v && Object.prototype.toString.call(v) === '[object Object]' },
    isPrimitive: function (v) { return fe.isString(v) || fe.isNumber(v) || fe.isBoolean(v) },
    isNumber: function (v) { return typeof v === 'number' && isFinite(v) },
    isString: function (v) { return typeof v === 'string' },
    isBoolean: function (v) { return typeof v === 'boolean' }
};
