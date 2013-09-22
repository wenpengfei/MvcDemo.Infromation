(function (global, DOC, FrameName, undefined) {
    global[FrameName] = global[FrameName] || {};
    var Frame = global[FrameName], reg_module_name = /(?:^|\/)([^(\/]+)(?=\(|$)/, reg_module_url = /\(([^)]+)\)/, reg_readystate = /loaded|complete/i, scripts = DOC.getElementsByTagName("script"), bases = DOC.getElementsByTagName("base"), kMap = {}, loadedList = [], allDependList = []; var array = { indexOf: function (source, o) { for (var i = 0, len = source.length; i < len; i++) { if (source[i] == o) return i } return -1 }, remove: function (source, o) { var index = this.indexOf(source, o); if (index != -1) { source.splice(index, 1) } return source }, each: function (source, iterator) { var returnValue, item, i, len = source.length; if ('function' == typeof iterator) { for (i = 0; i < len; i++) { item = source[i]; returnValue = iterator.call(source, item, i); if (returnValue === false) { break } } } return source }, filter: function (source, iterator) { var result = [], resultIndex = 0, len = source.length, item, i; if ('function' == typeof iterator) { for (i = 0; i < len; i++) { item = source[i]; if (true === iterator.call(source, item, i)) { result[resultIndex++] = item } } } return result }, map: function (source, iterator) { var results = [], i = 0, l = source.length; for (; i < l; i++) { results[i] = iterator(source[i], i) } return results } }; 
    var loglist = [], 
    log = function (object, type, msg, context) { loglist.push([object, type, msg, context, new Date()]) }; 
    log.get = function (object, type) { var ret = loglist, arg; if (arguments.length == 0) 
    return ret; for (var i = 0, leni = Math.min(4, arguments.length); i < leni; i++) { if (arg = arguments[i]) 
    { ret = array.filter(ret, function (item) { return item[i] == arg }) } } return ret 
    }; 
    var boot = Frame.boot = { require: function (dependList, callback, errback) 
    { this.reg('', dependList, callback); log('boot', 'success', '声明模块依赖调用', dependList) 
    }, 
    declare: function (name, dependList, callback) 
    { var arg = arguments, self = this; self.reg(name, dependList, function () { 
    callback.apply(arguments[3], arguments); self.fire(name) }); 
    log('boot', 'success', '注册模块', 'name:' + name + ',depengList:' + dependList) }, 
    namespace: function (ns) { if (ns == '' || ns == FrameName) 
    return global[FrameName]; var nss = ns.split('.'), o = global[FrameName]; 
    for (var i = 0, leni = nss.length; i < leni; i++) o = o[nss[i]] = o[nss[i]] || {}; return o }, 
    reg: function (name, dependList, callback) { 
    var arg = arguments, self = this, dl, wl; 
    if (dependList) { 
    dl = [FrameName].concat(dependList.replace(/\s/ig, '').split(',')) 
    } 
    else 
    { 
    dl = [FrameName] 
    } 
    if (name == FrameName) 
    dl = []; 
    allDependList = allDependList.concat(array.filter(dl, function (d) { 
    return array.indexOf(allDependList, d) < 0 })); 
    var map = { name: name, dependList: dl, waitList: [], callback: callback }; 
    var wl = array.filter(map.dependList, function (depend) 
    { return array.indexOf(loadedList, depend) < 0 });
     map.waitList = wl; 
     if (wl.length == 0) {
      self.call(map); return 
     } 
     else { array.each(map.waitList, function (name) { kMap[name] = kMap[name] || []; kMap[name].push(map) }) 
     } 
     log('boot', 'success', '注册到依赖列表', (name ? 'name:' + name + ',' : '') + 'dependList:' + dependList) 
     }, 
     call: function (map) { 
     var arg = arguments, self = this, error = '', objs = array.map(map.dependList, function (depend) 
    { 
    return self.namespace(depend) }); 
    if (map.name == '') { try { map.callback.apply(null, objs) 
    } catch (e) { error = e } } else { var ns = self.namespace(map.name.replace(/.[^.]*$/, '')); 
    try { map.callback.apply(ns, [ns].concat(objs)) } catch (e) { error = e } } if (Frame.isEmpty(error)) { log('boot', 'success', '调用指定的模块', (map.name ? 'name:' + map.name + ',' : '') + 'dependList:' + map.dependList) 
    } 
    else {
     log('boot', 'error', '调用指定的模块出错:' + error, (map.name ? 'name:' + map.name + ',' : '') + 'dependList:' + map.dependList) } }, fire: function (name) { var maps = kMap[name], arg = arguments, self = this; loadedList.push(name); if (maps) { array.each(maps, function (map) { array.remove(map.waitList, name); if (map.waitList.length == 0) { self.call(map) } }) } kMap[name] = null; delete kMap[name]; log('boot', 'success', '重新计算依赖列表中的依赖项', name) }, getWaitList: function () { return kMap }, getLoadedList: function () { return loadedList }, getDependList: function () { return allDependList } }; global.boot = boot; boot.declare('extension.array', '', function (Namespace, Frame) { Namespace.array = array }); boot.require('', function (Frame) { Frame.log = log })
})(this, this.document, 'fe'); ; 
(function (global, DOC, undefined) {
    boot.declare('fe', '', function (Frame) {
        Frame.apply = function (o, c, defaults) 
        { if (defaults) Frame.apply(o, defaults); if (o && c && typeof c == 'object') { for (var p in c) { o[p] = c[p] } } return o }; (function () {
            var idSeed = 0, ua = navigator.userAgent.toLowerCase(), 
            check = function (r) { 
            return r.test(ua) }, 
            isStrict = document.compatMode == "CSS1Compat", 
            isOpera = check(/opera/), isChrome = check(/chrome/), 
            isWebKit = check(/webkit/), 
            isSafari = !isChrome && check(/safari/), 
            isSafari3 = isSafari && check(/version\/3/), 
            isSafari4 = isSafari && check(/version\/4/), 
            isIE = !isOpera && check(/msie/), 
            isIE6 = isIE && check(/msie 6/), 
            isIE7 = isIE && check(/msie 7/), 
            isIE8 = isIE && check(/msie 8/), 
            isIE9 = isIE && check(/msie 9/), 
            isGecko = !isWebKit && check(/gecko/), 
            isGecko3 = isGecko && check(/rv:1\.9/), 
            isBorderBox = isIE && !isStrict, isWindows = check(/windows|win32/), 
            isMac = check(/macintosh|mac os x/), isAir = check(/adobeair/), 
            isLinux = check(/linux/), 
            isSecure = /^https/i.test(global.location.protocol); 
            if (isIE6) { 
            try { 
            document.execCommand("BackgroundImageCache", false, true) } catch (e) { } 
            } 
            var id = Math.floor(Math.random() * 10000); 
            Frame.apply(Frame, { isStrict: isStrict, isSecure: isSecure, isOpera: isOpera, isWebKit: isWebKit, isChrome: isChrome, isSafari: isSafari, isSafari3: isSafari3, isSafari4: isSafari4, isSafari2: isSafari && !isSafari3, isIE: isIE, isIE6: isIE6, isIE7: isIE7, isIE8: isIE8, isIE9: isIE9, isGecko: isGecko, isGecko2: isGecko && !isGecko3, isGecko3: isGecko3, isBorderBox: isBorderBox, isLinux: isLinux, isWindows: isWindows, isMac: isMac, isAir: isAir, enableGarbageCollector: true, enableListenerCollection: false, USE_NATIVE_JSON: false, TRUE: true, FALSE: false, 
            emptyFn: function () { }, 
            isEmpty: function (v, allowBlank) { return v === null || v === undefined || ((Frame.isArray(v) && !v.length)) || (!allowBlank ? v === '' : false) }, 
            isArray: function (v) { 
            return Object.prototype.toString.apply(v) === '[object Array]' }, 
            isObject: function (v) { return v && typeof v == "object" }, 
            isPrimitive: function (v) { var t = typeof v; return t == 'string' || t == 'number' || t == 'boolean' 
            }, 
            isFunction: function (v) { return typeof v == "function" }, 
            isDefined: function (v) { return typeof v !== 'undefined' }, 
            isDate: function (v) { return Object.prototype.toString.apply(v) === '[object Date]' }, isObject: function (v) { return !!v && Object.prototype.toString.call(v) === '[object Object]' }, 
            isPrimitive: function (v) { return Frame.isString(v) || Frame.isNumber(v) || Frame.isBoolean(v) }, isFunction: function (v) { return toString.apply(v) === '[object Function]' }, isNumber: function (v) { return typeof v === 'number' && isFinite(v) }, isString: function (v) { return typeof v === 'string' }, isBoolean: function (v) { return typeof v === 'boolean' }, isElement: function (v) { return v ? !!v.tagName : false }, id: function (qualifier) { if (qualifier) { return qualifier + (id++) } else { return id++ } }, newGuid: function () { var guid = ""; for (var i = 1; i <= 32; i++) { var n = Math.floor(Math.random() * 16.0).toString(16); guid += n; if ((i == 8) || (i == 12) || (i == 16) || (i == 20)) guid += "-" } return guid }, applyIf: function (o, c) { if (o) { for (var p in c) { if (Frame.isEmpty(o[p])) { o[p] = c[p] } } } return o }, extend: function () {
                var io = function (o) { for (var m in o) { this[m] = o[m] } }; var oc = Object.prototype.constructor; return function (sb, sp, overrides) {
                    if (Frame.isObject(sp))
  { overrides = sp; sp = sb; sb = overrides.constructor != oc ? overrides.constructor : function () { sp.apply(this, arguments) } } var F = function () { }, sbp, spp = sp.prototype; F.prototype = spp; sbp = sb.prototype = new F(); sbp.constructor = sb; sb.superclass = spp; if (spp.constructor == oc) { spp.constructor = sp } sb.override = function (o) { Frame.override(sb, o) }; sbp.superclass = sbp.supr = (function () { return spp }); sbp.override = io; Frame.override(sb, overrides); sb.extend = function (o) { Frame.extend(sb, o) 
}; return sb 
} 
} (), override: function (origclass, overrides) 
{ if (overrides) { var p = origclass.prototype; Frame.apply(p, overrides); 
if (Frame.isIE && overrides.toString != origclass.toString) { p.toString = overrides.toString
 }
 }
 }, namespace: function () { var o, d; Frame.each(arguments, function (v) 
 { d = v.split("."); o = window[d[0]] = window[d[0]] || {}; Frame.each(d.slice(1), function (v2) 
 { o = o[v2] = o[v2] || {} }) }); return o }, urlEncode: function (o, pre) 
 { var buf = [], key, 
 e = encodeURIComponent; for (key in o) { Frame.each(o[key] || key, function (val, i) { buf.push("&", e(key), "=", val != key ? e(val) : "") }) } if (!pre) { buf.shift(); pre = "" } return pre + buf.join('') }, urlDecode: function (string, overwrite) { var obj = {}, pairs = string.split('&'), d = decodeURIComponent, name, value; 
 Frame.each(pairs, function (pair) { pair = pair.split('='); name = d(pair[0]); value = d(pair[1]); obj[name] = overwrite || !obj[name] ? value : [].concat(obj[name]).concat(value) }); return obj }, toArray: function (a, i, j, res) { res = []; Frame.each(a, function (v) { res.push(v) }); if (arguments.length > 1) return res.slice(i || 0, j || res.length); else return res }, each: function (array, fn, scope) { if (Frame.isEmpty(array, true)) return; if (typeof array.length == "undefined" || typeof array == "string") { array = [array] } for (var i = 0, len = array.length; i < len; i++) { if (fn.call(scope || array[i], array[i], i, array) === false) { return i } } } }) })(); 
 (function () { Frame.apply(Frame, { isReady: false, readyList: [], DOMContentLoaded: null, readyBound: false, readyWait: 1, ready: function (wait) { if (wait === true) { this.readyWait-- } if (!this.readyWait || (wait !== true && !this.isReady)) { if (!document.body) { return setTimeout(this.ready, 1) } this.isReady = true; if (wait !== true && --this.readyWait > 0) { return } if (this.readyList) { var fn, i = 0, ready = this.readyList; this.readyList = null; while ((fn = ready[i++])) { fn.call(document, Frame) } } } }, bindReady: function () { if (this.readyBound) { return } this.readyBound = true; if (document.readyState === "complete") { return setTimeout(this.ready, 1) } 
 if (document.addEventListener) { document.addEventListener("DOMContentLoaded", this.DOMContentLoaded, false); global.addEventListener("load", this.ready, false); } else if (document.attachEvent) { document.attachEvent("onreadystatechange", this.DOMContentLoaded); global.attachEvent("onload", this.ready); var toplevel = false; try { toplevel = global.frameElement == null } catch (e) { } if (document.documentElement.doScroll && toplevel) { doScrollCheck() } } }, 
 init: function (fn) { this.bindReady(); if (this.isReady) { fn.call(document, Frame); } else if (this.readyList) { this.readyList.push(fn) } return } }) })(); (function () { Frame.apply(Frame, { domload: (function () { var load_events = [], load_timer, script, done, exec, old_onload, 
 init = function () { done = true; clearInterval(load_timer); while (exec = load_events.shift()) exec(); if (script) script.onreadystatechange = '' }; return function (func) { if (done) return func(); if (!load_events[0]) { if (document.addEventListener) document.addEventListener("DOMContentLoaded", init, false); if (/WebKit/i.test(navigator.userAgent)) { load_timer = setInterval(function () { if (/loaded|complete/.test(document.readyState)) init(); }, 10) } old_onload = global.onload; global.onload = function () { init(); if (old_onload) old_onload() } } load_events.push(func) } })() }); if (document.addEventListener) { Frame.DOMContentLoaded = function () { document.removeEventListener("DOMContentLoaded", Frame.DOMContentLoaded, false); Frame.ready() } } else if (document.attachEvent) { Frame.DOMContentLoaded = function () { if (document.readyState === "complete") { 
 document.detachEvent("onreadystatechange", Frame.DOMContentLoaded); Frame.ready() 
 } 
 } 
 } global.doScrollCheck = function () { if (Frame.isReady) { return } try { document.documentElement.doScroll("left") 
 } catch (e) { setTimeout(doScrollCheck, 1); return 
 } Frame.ready() } })(); (function () { Frame.apply(Frame, { isTopReady: false, topReadyList: [], topReady: function (fn) { if (Frame.isTopReady) { fn.call(document, Frame) } else if (Frame.topReadyList) { Frame.topReadyList.push(fn) } return this }, OnTopReady: function () { Frame.isTopReady = true; if (Frame.topReadyList) { var fn, i = 0; while ((fn = Frame.topReadyList[i++])) { fn.call(document, Frame) } Frame.topReadyList = null } } }) })(); Frame.domload(function () { }); Frame.init(function () { if (!Frame.isTopReady) Frame.OnTopReady() }); Frame.topReady(function () { }) }) })(this, this.document); (function (global, DOC, undefined) { boot.declare('modules', 'config, extension.array, util.js', 
 function (Namespace, Frame, config, array, js) { Namespace.modules = { init: function (params) { var bp = "http://pic2.flxxwang.com/js/v6/source/", path = this.getConfigPath(params), cf = params.configs[path], version = cf.version || config.version; this.path = path; this.params = params; if (cf) { if (cf.jsFiles) { if (cf.jsFiles.just) { window.document.writeln('<script type="text/javascript" charset="utf-8"  src="' + bp + cf.jsFiles.just + '?version=' + version + '"></script>') } if (cf.jsFiles.domload) { Frame.init(function () { js.append(bp + cf.jsFiles.domload + '?version=' + version) }) } } } }, 
 getConfigPath: function (params) { var cf, configlist = [], list1 = [], list2 = []; 
 for (var key in params.configs) { configlist.push(key) 
 } for (var i = config.catelist.length - 1; i >= 0; i--) 
 { list1 = array.filter(configlist, function (key) { return (key && array.indexOf(key.split('_')[1].split('|'), config.catelist[i].listname) >= 0) }); if (list1 && list1.length) break } if (list1.length == 0) { list1 = array.filter(configlist, function (key) { return (key && key.split('_')[1] == '') }) } for (var i = config.locallist.length - 1; i >= 0; i--) { list2 = array.filter(list1, function (key) { return (key && array.indexOf(key.split('_')[2].split('|'), config.locallist[i].listname) >= 0) }); if (list2 && list2.length) break 
 } if (list2.length == 0) { list2 = array.filter(list1, function (key) 
 { return (key && key.split('_')[2] == '') }) 
 } if (list2 && list2.length) return list2[0]; else return null } } }) 
 })(this, this.document); (function (global, DOC, undefined) 
 { if (typeof ____json4fe == 'undefined') return; boot.declare('config', '', function (Namespace, Frame) { 
 var j = ____json4fe, city = cate = locallist = catelist = null; if (j.locallist) { if (Frame.isArray(j.locallist)) { city = j.locallist[0]; locallist = j.locallist } else { city = j.locallist; locallist = [city] } } if (j.catentry) { if (Frame.isArray(j.catentry)) { cate = j.catentry[j.catentry.length - 1]; catelist = j.catentry } else { cate = j.catentry; catelist = [cate] } if (j.rootcatentry) { catelist.unshift(j.rootcatentry) } rootcate = catelist[0] } var m = j.modules, isHome = m == 'home' || m == 'homepage', isList = m == 'list' || m == 'listpage', isFinal = m == 'final' || m == 'finalpage', isMy = m == 'my' || m == 'mypage', isPost = m == 'post' || m == 'postpage'; Namespace.config = { j: j, city: city, cate: cate, rootcate: rootcate, locallist: locallist, catelist: catelist, isHome: isHome, isList: isList, isFinal: isFinal, isMy: isMy, isPost: isPost }; }) })(this, this.document); ; 
 (function (global, DOC) { boot.declare('util.js', '', function (NS, Frame) { NS.js = { cache: [], push: function (src, onsuccess, onerror, refresh) { if (arguments.length == 1 && Frame.isObject(arguments[0])) { this.cache.push(arguments[0]) } else { this.cache.push({ src: src, onsuccess: onsuccess, onerror: onerror }) } }, flush: function () { var self = this; Frame.array.each(this.cache, function (item) { self.appendScript(item) }) }, append: function (src, onsuccess, onerror, refresh) { if (arguments.length == 1 && Frame.isObject(arguments[0])) { this.appendScript(arguments[0]) } else { this.appendScript({ src: src, onsuccess: onsuccess, onerror: onerror, refresh: refresh }) } }, jsonp: function (url, params, onsuccess, onerror, refresh) { if (arguments.length == 1 && Frame.isObject(arguments[0])) { this.appendScript(arguments[0]) } else { this.appendScript({ src: url, params: params, type: 'jsonp', onsuccess: onsuccess, onerror: onerror, refresh: refresh }) } }, 
 appendScript: function (config) { var script, self = this, config = config || {}, src = config.src, params = config.params || {}, onsuccess = config.onsuccess, onerror = config.onerror, refresh = config.refresh, jsonpflag = false, HEAD = DOC.head || DOC.getElementsByTagName("head")[0], reg_readystate = /loaded|complete|undefined/i, method = DOC.dispatchEvent ? "onload" : "onreadystatechange"; 
 if (Frame.isEmpty(src)) return; if (config.type == 'jsonp') { var paramsName = params.callbackName || 'callback', callback = params.callback || Frame.id('jsonp'); src.indexOf('?') == -1 ? src += '?' : src += '&'; src += paramsName + '=' + callback; delete params.callbackName; delete params.callback; window[callback] = function () { jsonpflag = true; config.onsuccess && config.onsuccess.apply(this, arguments); Frame.log('util.js', 'success', 'script脚本正确加载,callback被正确调用', src) } 
 } if (refresh === true) { src += (src.indexOf('?') == -1) ? '?' : '&'; src += 'refreah=' + Math.random() } if (params) { var strp = Frame.isString(params) ? params : Frame.urlEncode(params); if (strp) { src += (src.indexOf('?') == -1) ? '?' : '&'; src += strp } } script = document.createElement("script"); script.charset = "utf-8"; script.type = "text/javascript"; script.defer = true; script.async = true; script.onerror = function () { onerror && onerror.apply(this, arguments); Frame.log('util.js', 'error', 'script脚本加载失败', src); self.removeScript(this) 
 }; script[method] = function () 
 { if (reg_readystate.test(this.readyState)) 
 { if (config.type == 'jsonp') 
 { setTimeout(function () 
 { !jsonpflag && onerror && onerror.apply(this, arguments);
  Frame.log('util.js', 'waring', 'script脚本正确加载，但是callback没有被正确调用', src) }, 100) } else { onsuccess && onsuccess.apply(this, arguments); Frame.log('util.js', 'success', 'script脚本正确加载', src) } self.removeScript(this) } 
  }; script.src = src; HEAD.insertBefore(script, HEAD.firstChild) 
  }, 
  removeScript: function (script) { var WIN = window, DOC = WIN.document, method = DOC.dispatchEvent ? "onload" : "onreadystatechange", parent = script.parentNode; if (parent && parent.nodeType === 1) { script.clearAttributes ? script.clearAttributes() : script[method] = script.onerror = null; script.parentNode.removeChild(script) } } } }) })(this, this.document); 
  (function (global, DOC, undefined) 
  { 
  boot.require('modules', function (Frame, modules) { 
  modules.init({ "version": 1310031868125, "configs": { "listpage_shouji__": { "version": "0.4.2", "css": "", "jsFiles": { "just": "a5050074665ff27c9c1ca4ded1da6b0c.js", "domload": "75148a2ae6f40eb1b710bad27cbf54bd.js"} }, "listpage_petstemp__": { "version": "0.1.5", "css": "", "jsFiles": { "just": "238d9521b16919e4cb498298dcab5cbe.js", "domload": "2a69cddc84a7268f308b72a5f64cde55.js"} }, "listpage_pets|car|sale|house__": { "version": "0.7.12", "css": "", "jsFiles": { "just": "44a369c90963be7e1a80646a01777a47.js", "domload": "e5b6c68c178151bdc0a620baaf758575.js"} }, "listpage_huochepiao__": { "version": "0.3.12", "css": "", "jsFiles": { "just": "f19f46e94cde852c9281cdfa9197b605.js", "domload": "00c722a8c39d758aa81cb9b15d694c58.js"} }, "listpage_pinche__": { "version": "0.2.7", "css": "", "jsFiles": { "just": "1042d887ab39516d17bbf7b4fb7c6234.js", "domload": "326d1debe2eec664253796f4d8dd2c21.js"} }, "listpage_job|searchjob|jianzhi|zhaojianzhi__": { "version": "0.4.2", "css": "", "jsFiles": { "just": "a6dcb394cdabecc1ea4ef10385e63cdb.js", "domload": "44e6fd12e45082e643085eca82b132ea.js"} 
  }, "listpage___": { "version": "0.7.3", "css": "", "jsFiles": { "just": "43ebee4c467475e610c6ba156f995440.js", "domload": "a96edfdb6818e283cca43b861c9ad53e.js"
 }}
 } 
}) 
}) 
})(this, this.document);