var NTIM = {};
__A = function(){
	var ret = {
		isArray: function( b ) {
			return b instanceof Array;
		},
		each: function( array, callback){
			if ( array.length == undefined ){
				for ( var name in array ){
					callback.apply(this, [array[name], name]);
				}
			} else {
				for ( var i = 0, len = array.length; i < len; i++ ) {
					callback.apply(this, [array[i], i]);
				}
			}
		}
	};
	return ret;
}();
__B = (function(ua){
	var b = {
		msie: /msie/.test(ua) && !/opera/.test(ua),
		opera: /opera/.test(ua),
		safari: /webkit/.test(ua) && !/chrome/.test(ua),
		mozilla: /mozilla/.test(ua) && !/(compatible|webkit)/.test(ua),
		firefox: /firefox/.test(ua),
		chrome: /chrome/.test(ua),
		maxthon3: /maxthon/.test(ua) && /safari/.test(ua)
	};
	var vMark = "";
	for (var i in b) {
		if (b[i]) { vMark = "safari" == i ? "version" : i; break; }
	}
	b.version = vMark && RegExp("(?:" + vMark + ")[\\/: ]([\\d.]+)").test(ua) ? RegExp.$1 : "0";
	b.safari2 = b.safari && parseInt(b.version) < 522 && !/adobeair/i.test(ua);
	b.ie = b.msie;
	b.ie6 = b.msie && parseInt(b.version) == 6;
	b.ie7 = b.msie && parseInt(b.version) == 7;
	b.ie8 = b.msie && parseInt(b.version) == 8;
	b.QuirksModel = b.msie && document.compatMode=="BackCompat";
	b.StrictMode = document.compatMode=="CSS1Compat";
	try{
		b.maxthon = external&&external.max_version!=undefined;
	}catch(e){}
	b.se3 = b.ie7 && /360se/.test(ua);
	b.se = b.ie7 && /se/.test(ua);
	b.tt = b.ie7 && /tencenttraveler/.test(ua);
	return b;
})(window.navigator.userAgent.toLowerCase());
__F = {
	isFunction:function(fn){
		return typeof(fn) == "function";
	}
};
__D = {
	creElm: function(o, t, a) {
		var d = document, db = d.body,
			b = d.createElement(t || 'div');
		for (var p in o) {
			p == 'style' ? b[p].cssText = o[p] : b[p] = o[p]
		}
		return (a || db).insertBefore(b, (a || db).firstChild)
	},
	insert: function(elem, h, where) {
		where = where ? where.toLowerCase() : 'afterbegin';
		if (elem.insertAdjacentHTML) {
			switch (where) {
				case "beforebegin":elem.insertAdjacentHTML('BeforeBegin', h);return elem.previousSibling;
				case "afterbegin": elem.insertAdjacentHTML('AfterBegin', h);return elem.firstChild;
				//case "beforeend":elem.insertAdjacentHTML('BeforeEnd', h);return elem.lastChild;
				case "afterend":elem.insertAdjacentHTML('AfterEnd', h); return elem.nextSibling;
				default :elem.insertAdjacentHTML('BeforeEnd', h);return elem.lastChild;
			}
			throw 'Illegal insertion point -> "' + where + '"';
		}
		var range = elem.ownerDocument.createRange();
		var frag;
		switch (where) {
		case "beforebegin":range.setStartBefore(elem);frag = range.createContextualFragment(h);elem.parentNode.insertBefore(frag, elem);return elem.previousSibling;
		case "afterbegin":
			if (elem.firstChild) {
				range.setStartBefore(elem.firstChild);frag = range.createContextualFragment(h);elem.insertBefore(frag, elem.firstChild);return elem.firstChild;
			} else {
				elem.innerHTML = h;return elem.firstChild;
			}
		case "beforeend":
			if (elem.lastChild) {
				range.setStartAfter(elem.lastChild);frag = range.createContextualFragment(h);elem.appendChild(frag);return elem.lastChild;
			} else {
				elem.innerHTML = h;return elem.lastChild;
			}
		case "afterend":range.setStartAfter(elem);frag = range.createContextualFragment(h);elem.parentNode.insertBefore(frag, elem.nextSibling);return elem.nextSibling;
		}
		throw 'Illegal insertion point -> "' + where + '"';
	},
	getScrollTop: function(elem){
		var doc = elem==document||!elem ? document : elem.ownerDocument;
		return Math.max(doc.documentElement.scrollLeft, doc.body.scrollLeft);
	},
	getScrollLeft: function(elem){
		var doc = elem==document||!elem ? document : elem.ownerDocument;
		return Math.max(doc.documentElement.scrollTop, doc.body.scrollTop);
	},
	rect: function(elem){
		var parent = elem.parentNode, 
			offsetChild  = elem,
			offsetParent = elem.offsetParent,
			doc = elem.ownerDocument,
			fixed = __D.css(elem, "position") == "fixed";
		var left = 0, top = 0, right = 0, bottom = 0, width = 0, height = 0, x = 0, y = 0;
		if ( elem.getBoundingClientRect ) {
			var box = elem.getBoundingClientRect();
			left = box.left + this.getScrollLeft(elem);
			top  = box.top + this.getScrollTop(elem);
			left -= doc.documentElement.clientLeft;
			top -= doc.documentElement.clientTop;
		}else{
			left = elem.offsetLeft;
			top  = elem.offsetTop;
			while (offsetParent) { 
				left += offsetParent.offsetLeft; 
				top  += offsetParent.offsetTop; 
				if ( __B.mozilla && !/^t(able|d|h)$/i.test(offsetParent.tagName) || __B.safari && !__B.safari2 ){
					left += (parseInt(__D.css(offsetParent, "borderLeftWidth")) || 0 ); 
					top  += (parseInt(__D.css(offsetParent, "borderLeftTop")) || 0 ); 
				}
				if ( !fixed && __D.css(offsetParent, "position") == "fixed" )
					fixed = true;
				offsetChild  = /^body$/i.test(offsetParent.tagName) ? offsetChild : offsetParent;
				offsetParent = offsetParent.offsetParent;
			};
			while ( parent && parent.tagName && !/^body|html$/i.test(parent.tagName) ) {
				if ( !/^inline|table.*$/i.test(__D.css(parent, "display")) ){
					left -= parent.scrollLeft; top  -= parent.scrollTop;
				}
				if ( __B.mozilla && __D.css(parent, "overflow") != "visible" ){
					left += (parseInt(__D.css(parent, "borderLeftWidth")) || 0 ); 
					top  += (parseInt(__D.css(parent, "borderLeftTop")) || 0 ); 
				}
				parent = parent.parentNode;
			}
			if ( (__B.safari2 && (fixed || __D.css(offsetChild, "position") == "absolute")) || 
			(__B.mozilla && __D.css(offsetChild, "position") != "absolute") ){
					left -= doc.body.offsetLeft; top  -= doc.body.offsetTop;
			}
			if ( fixed ){
				left += this.getScrollLeft(elem); top  += this.getScrollTop(elem);
			}
			right = left + elem.offsetWidth; 
			bottom = top + elem.offsetHeight;
		};
		try{
			width = elem.offsetWidth || 0;
			height = elem.offsetHeight || 0;
		}catch(e){}
		return {
			left: left,
			top: top,
			right: right,
			bottom: bottom,
			w: width,
			h: height
		};
	},
	clientRect: function(elem){
		var doc = document;
		elem = typeof elem=='string' ? doc.getElementById(elem) : elem;
		var rect = this.rect(elem), 
			sLeft = this.getScrollLeft(elem), 
			sTop = this.getScrollTop(elem);
		rect.left -= sLeft; 
		rect.top -= sTop; 
		rect.right -= sLeft;
		rect.bottom -= sTop;
		return rect;
	},
	getWH:function(){
		var db = __B.StrictMode ? document.documentElement : document.body;
		return {
			h: db.clientHeight,
			w: db.clientWidth
		}
	},
	windowRect: function(obj){
		var win = window, doc = document, d = {x: 0,y: 0,w: 0,h: 0,_w:0};
		d.x = win.pageXOffset || doc.documentElement.scrollLeft || doc.body.scrollLeft || 0;
		d.y = win.pageYOffset || doc.documentElement.scrollTop || doc.body.scrollTop || 0;
		d.w = win.innerWidth || doc.body.clientWidth || doc.body.clientWidth || 0;
		d.h = win.innerHeight || doc.documentElement.clientHeight || doc.body.clientHeight || 0;
		d._w = d.w;
		return d;
	},
	css: function(elem, name, value){
		if(!elem) return;
		if(typeof value != 'undefined'){
			if (typeof name == "string") { var s = name; style = {}; style[s] = value; }
			for (var name in style) {
				var value = style[name];
				switch(name.toLowerCase()){
					case "float": elem.style[ __B.ie ? "styleFloat" : "cssFloat" ] = value;break;
					case "scrollleft":elem.scrollLeft = value;break;
					case "scrolltop":elem.scrollTop = value;break;
					case "opacity": 
						if( __B.ie ){
							elem.style.filter = (elem.currentStyle.filter || "").replace( /alpha\([^)]*\)/, "" ) + "alpha(opacity=" + value * 100 + ")";
							break;
						}
					default: 
						if( elem.style ) elem.style[__S.camelize( name )] = value;
				}
			};
			return value;
		}else{
			if( 'scrollleft' == name.toLowerCase() )
				return elem.scrollLeft || 0;
			else if( 'scrolltop' == name.toLowerCase() )
				return elem.scrollTop || 0;
			else if(document.defaultView){
				var style = document.defaultView.getComputedStyle(elem, null);
				return name in style ? style[ name ] : style.getPropertyValue( name );
			}else{
				var style = elem.currentStyle;
				if (name == "opacity") {
					if ( /alpha\(opacity=(.*)\)/i.test(style.filter) ) {
						return parseFloat(RegExp.$1)/100 || 1;
					}
					return 1;
				}
				if (name == "float") { name = "styleFloat"; }
				var ret = style[ name ] || style[__S.camelize( name )];
				if ( !/^\-?\d+(px)?$/i.test( ret ) && /^\-?\d/.test( ret ) ) {
					style = elem.style; left = style.left; rsLeft = elem.runtimeStyle.left;
					elem.runtimeStyle.left = elem.currentStyle.left;
					style.left = ret || 0;
					ret = style.pixelLeft + "px";
					style.left = left;
					elem.runtimeStyle.left = rsLeft;
				}
				return ret;
			}
		}
	},
	addClass: function( elem, className ){
		if( !this.indexOfClass(elem, className) ){
			elem.className = elem.className.split(/\s+/).join(" ") + " " + className;
		}
	},
	removeClass: function( elem, className ){
		if(elem && elem.className.length>0 ){
			var reg = new RegExp( "\\b" + className + "\\b", "gi" );
			elem.className = elem.className.replace(reg, "").replace(/^ +| +$/g, "");
		}
	},
	replaceClass:function( elem, oldclassName, className){
		this.addClass(elem, className);
		this.removeClass(elem, oldclassName);
	},
	indexOfClass: function(elem, className){
		if(!elem || !elem.className ){
			return false;
		}else{
			var reg = new RegExp( "\\b" + className + "\\b", "gi" );
			return reg.test(elem.className);
		}
	},
	filter: function(Nodes, where){
		var reg, className, cNodes = [], Ns = [];
		for(var i=0; i<Nodes.length; i++){
			Nodes[i].tagName && Nodes[i].nodeType!=8 && cNodes.push(Nodes[i]);
		}
		   if( where != undefined ){
			   var m = /^\s*?(\w+)$|^\.(\w+)$/.exec( where );
			if (m[1]){
				for(var i=0; i<cNodes.length; i++){
					cNodes[i].tagName.toLowerCase()==m[1].toString().toLowerCase() && Ns.push(cNodes[i]);
				}
				cNodes = Ns;
			}
			else if (m[2]){
				className = m[2].replace(/\-/g, "\\-");
				reg = new RegExp("\\b" + className + "\\b");
				for(var i=0; i<cNodes.length; i++){
					reg.test(cNodes[i].className) && Ns.push(cNodes[i]);
				}
				cNodes = Ns;
			}
		}
		cNodes.first = function(){
			return !cNodes.length ? null : cNodes[0];
		};
		cNodes.last = function(){
			return !cNodes.length ? null : cNodes.slice(-1)[0];
		};
		return cNodes;
	},
	//@pram elements(dom)		 
	//@pram prams(JSON)		  动画改变对像的属性
	//@pram [speed](string|int)  速度 slow|fast|400(default)
	//@pram [easing](string)	 效果 linear|swing(default)
	//@pram [callback](function) 动画完成时执行的函数
	//@example animate
	animate: function(elements, prams, speed, easing, callback ) {
		var elements = !__A.isArray( elements ) ? [elements] : elements;
		var opt = {
			complete: callback || !callback && easing || __F.isFunction(speed) && speed,
			duration: speed,
			easing: callback && easing || easing && easing.constructor != Function && easing
		};
		opt.duration = (opt.duration && opt.duration.constructor == Number ? 
			opt.duration : 
			{ slow: 600, fast: 200 }[opt.duration]) || 400;
		var self = this;
		__A.each(elements, function(elem){
			if( !__D.queue.add(elem) || elem.nodeType != 1){
				return false;
			}
			for ( var p in prams ){
				if ( p == "height" || p == "width" ){
					opt.display = __D.css(elem, "display");
					opt.overflow = __D.css(elem, "overflow");
				}
				if ( __A.isArray( prams[p] ) ) {
					(opt.specialEasing = opt.specialEasing || {})[p] = prams[p][1];
					opt[p] = prams[p] = prams[p][0];
				}
			}
			opt.curAnim = prams;
			__A.each(prams, function(val, name){
				var obj = new __D.animExt( elem,  opt, name);
				var parts = val.toString().match(/^([+-]=?)?([\d+-.]+)(.*)$/),
					start = parseFloat( __D.css(elem, name) ) || 0;
				if( name == 'opacity' ){
					start = __B.msie ? start : start*100;
				}
				if( parts ){
					var end = parseFloat(parts[2]),
						unit = parts[3] || "px";
					if( parts[1] )
						end = ((parts[1].indexOf('-')>-1 ? -1 : 1) * end) + (parts[1].indexOf('=')>-1 ? 0 : start);
					obj.custom(start, end, unit);
				}
				else
					obj.custom(start, val, "");
			});
		});
	},
	easing: {
		linear: function( p, n, firstNum, diff ) {
            return firstNum + diff * p;
        },
		swing: function( p, n, firstNum, diff ) {
			return ((-Math.cos(p*Math.PI)/2) + 0.5) * diff + firstNum;
		},
		easeOutCubic: function (x, t, b, c, d) {
			return c*((t=t/d-1)*t*t + 1) + b;
		},
		easeInOutCubic: function (x, t, b, c, d) {
            if ((t/=d/2) < 1) return c/2*t*t*t + b;
            return c/2*((t-=2)*t*t + 2) + b;
        },
		easeOutQuart: function (x, t, b, c, d) {
			return -c * ((t=t/d-1)*t*t*t - 1) + b;
		},
		easeOutQuint: function (x, t, b, c, d) {
			return c*((t=t/d-1)*t*t*t*t + 1) + b;
		},
		easeInOutQuint: function (x, t, b, c, d) {
			if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
			return c/2*((t-=2)*t*t*t*t + 2) + b;
		},
		easeInOutElastic: function (x, t, b, c, d) {
			var s=1.70158;var p=0;var a=c;
			if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
			if (a < Math.abs(c)) { a=c; var s=p/4; }
			else var s = p/(2*Math.PI) * Math.asin (c/a);
			if (t < 1) return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
			return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )*.5 + c + b;
		},
		easeOutElastic: function (x, t, b, c, d) {
			var s=1.70158;var p=0;var a=c;
			if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
			if (a < Math.abs(c)) { a=c; var s=p/4; }
			else var s = p/(2*Math.PI) * Math.asin (c/a);
			return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
		},
		easeInBounce: function (x, t, b, c, d) {
			return c - __D.easing.easeOutBounce (x, d-t, 0, c, d) + b;
		},
		easeOutBounce: function (x, t, b, c, d) {
			if ((t/=d) < (1/2.75)) {
				return c*(7.5625*t*t) + b;
			} else if (t < (2/2.75)) {
				return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
			} else if (t < (2.5/2.75)) {
				return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
			} else {
				return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
			}
		},
		easeInOutBounce: function (x, t, b, c, d) {
			if (t < d/2) return __D.easing.easeInBounce (x, t*2, 0, c, d) * .5 + b;
			return __D.easing.easeOutBounce (x, t*2-d, 0, c, d) * .5 + c*.5 + b;
		}
	},
	queue: {
		queue: [],
		add: function(obj){
			var Q = this.queue;
			for(var i = 0; i < Q.length; i++ ){
				if ( Q[i] == obj ) return false;
			}
			Q.push(obj);
			return true;
		},
		remove:function(obj){
			var Q = this.queue, NQ = [];
			for(var i = 0; i < Q.length; i++ ){
				 Q[i] != obj && NQ.push(Q[i]);
			}
			this.queue = NQ;
		}
	},
	timers: [],
	timerId: null,
	animExt: function( elem, options, prop ){
		this.options = options;
		this.elem = elem;
		this.prop = prop;
	}
};
__E = (function(){
	var addEvent, removeEvent, evtHash = [];
	if ( window.addEventListener ) {
		addEvent = function( elem, type, handler, useCapture){
			if( type=='mouseenter' )
				elem.addEventListener('mouseover', mouseEnter(handler), useCapture);
			else if( type=='mouseleave' )
				elem.addEventListener('mouseout', mouseEnter(handler), useCapture);
			else
				elem.addEventListener(type, handler, useCapture);
		};
		removeEvent = function( elem, type, handler, useCapture){
			elem.removeEventListener(type, handler, useCapture);
		};
	} else {
		addEvent = function( elem, type, handler ){
			var key = '{FNKEY::obj_' + ieGetUniqueID(elem) + '::evt_' + type + '::fn_' + handler + '}',
				f = evtHash[key];
			if(typeof f != 'undefined') return;
			f = function(e){
				handler.call(elem, e);
			};
			evtHash[key] = f;
			elem.attachEvent( "on"+type, f);
			window.attachEvent('onunload', function() {
				elem.detachEvent('on' + type, f);
			});
			key = null;
		};
		removeEvent = function( elem, type, handler ){
			var key = '{FNKEY::obj_' + ieGetUniqueID(elem) + '::evt_' + type + '::fn_' + handler + '}',
				f = evtHash[key];
			if(typeof f != 'undefined'){
				elem.detachEvent('on' + type, f);
				delete evtHash[key];
			}
			key = null;
		};
	}
	function ieGetUniqueID(elem) {
		return elem===window ? 'theWindow' : elem===document ? 'theDocument' : elem.uniqueID
	}
	function mouseEnter(_pFn) {
		return function(_evt) {
			var relTarget = _evt.relatedTarget;
			if (this == relTarget || isAChildOf(this, relTarget)) {
				return;
			}
			_pFn.call(this, _evt);
		}
	};
	function isAChildOf(_parent, _child) {
		if (_parent == _child) return false;
		while (_child && _child != _parent) _child = _child.parentNode;
		return _child == _parent;
	};
	function fixEvent(event) {
		if (event && event.target) return event;
		event = event || window.event;
		event.pageX = event.clientX + __D.getScrollLeft();
		event.pageY = event.clientY + __D.getScrollTop();
		event.target = event.srcElement;
		event.stopPropagation = stopPropagation;
		event.preventDefault = preventDefault;
		switch (event.type) {
			case "mouseout" :
				event.relatedTarget = event.toElement; break;
			case "mouseover" :
				event.relatedTarget = event.fromElement; break;
		};
		return event;
	};
	function stopPropagation() { this.cancelBubble = true; };
	function preventDefault() { this.returnValue = false; };
	function fireEvent(elem, type) {
		if( !elem ) return;
		if( __B.ie ){
			elem.fireEvent("on" + type);
		}else{
			var e = document.createEvent('HTMLEvents');
			e.initEvent(type, true, true);
			elem.dispatchEvent(e);
		}
	};
	return {
		"addEvent": addEvent,
		"removeEvent": removeEvent,
		"fixEvent": fixEvent,
		"fireEvent":fireEvent
	};
})();
__S = {
	isDefined: function(a){
		return typeof a != "undefined";
	},
	camelize: function(s){
		return s.replace(/-([a-z])/ig, function(all, letter) { return letter.toUpperCase(); });
	},
	toArray: function(s){
		var a=[],ta=[],tta=[],l;
		ta = s.split(";");l  = ta.length;
		for(i=0; i<l; i++){
			if(ta[i]){
				tta = ta[i].split(':');
				a[tta[0]] = tta[1];
			}
		}
		return a;
	},
	len: function(s){
		if(!s) return 0;
		var c = 0, l = s.length;
		for(var i=0; i<l; i++){
			if(s.charCodeAt(i)>255) c += 2;else c += 1;
		}
		return c;
	},
	cut: function(s,l,e){
		if(!s) return 0;
		var c = 0, ml = l*2, l = s.length, cl = __S.len(s);
		var cs = "";
		if(cl<=ml)
			return cl%2>0 ? s+" " : s;
		else{
			for(var i=0; i<l; i++){
				if(s.charCodeAt(i)>255){ c += 2;}else{ c += 1;}
				if(c==ml || (e&&c==ml-2) ){
					cs = s.substring(0, i+1) + (e?"..":"");
					break;
				}else if(c>ml || (e&&c>ml-2)){
					cs = s.substring(0, i)+" " + (e?"..":"");
					break;
				}
			}
			return cs;
		}
	},
	unicodeToChar: function(source)
	{
		var reg = /\\u([0-9a-zA-Z]{2,4})|&#(\d+);/gi;
		var arrs = source.match(reg),
		strOutScript = source;
		
		if (!arrs) {
			return strOutScript;
		}else{
			for(var i=0; i <= arrs.length; i++ )
			{
				if (!arrs[i]) continue;
				
				var strHex, strDec, strChar, isError = false;
				
				strHex = arrs[i].replace("\\u", "");
				for (var j = 0; j < strHex.length; j++) {
					if ("0123456789abcdef".indexOf(strHex.charAt(j)) == -1) {
						isError = true;
					}
				}
				
				if (!isError) {
					strChar = String.fromCharCode( parseInt( strHex , 16 ) );
					
					strOutScript = strOutScript.replace(arrs[i], strChar);
				}
			}
		}
		
		return strOutScript;
	}
};
__C = {
	load: function(param, remove, callback, validation){
		var head = param.parent || document.getElementsByTagName('HEAD')[0], 
			elem, done = false,
			href = param.href ? param.href : param.src,
			pattern = /(.*\/){0,}([^.]+\.[^?]{1,}).*/ig;
		if( param.params ){
			for(var k in param.params){
				href += k + '=' + param.params[k] + '&';
			}
		}
		if(!param.charset) param.charset = 'utf-8';
		switch( (param.tagName || 'script').toLowerCase()){
			case 'img':
				param.src = href;
				break;
			case 'link':
				param.href = href;
				param.type = 'text/css';
				param.rel = 'stylesheet';
				break;
			default:
				param.tagName = 'script';
				param.src = href;
				param.type = 'text/javascript';
				param.language = 'javascript';
		}
		if( validation === true && this.indexOf(param.tagName, href.replace(pattern, "$2"))) return null;
		elem = document.createElement(param.tagName);
		for(var k in param){
			if( !/tagName|parent/.test(k) ){
				try{elem.setAttribute(k, param[k]);}catch(e){}
			}
		}
		elem.onload = elem.onreadystatechange = function(){
			if ( !done && ( !this.readyState || /loaded|complete/.test(this.readyState) ) ) {
				done = true;
				if( __F.isFunction(callback) ){callback();}
				if( remove !== false ){
					try{head.removeChild( elem );}catch(e){}
				}
			}
		};
		head.appendChild(elem);
		return elem;
	},
	indexOf: function(tagName, fileName){
		var elements = document.getElementsByTagName(tagName),
			len = elements.length,
			pattern = /(.*\/){0,}([^.]+\.[^?]{1,}).*/ig;
		
		for(var i=0; i<len; i++){
			if(elements[i].src && elements[i].src.replace(pattern, "$2") === fileName) return true;
		}
		return false;
	},
	ready: function(srcElement, callback){
		var done = false;
		if( !srcElement ){
			return;
		}
		srcElement.onload = srcElement.onreadystatechange = function(){
			if ( !done && ( !this.readyState || /loaded|complete/.test(this.readyState) ) ) {
				done = true;
				if( __F.isFunction(callback) ) callback();
			}
		};
	}
};
__J = (function(){
	function f(n) {
		return n < 10 ? '0' + n : n;
	}
	if (typeof String.prototype.toJSON !== 'function') {
		Date.prototype.toJSON = function (key) {
			return this.getUTCFullYear()   + '-' +
				 f(this.getUTCMonth() + 1) + '-' +
				 f(this.getUTCDate())	  + ' ' +
				 f(this.getUTCHours())	 + ':' +
				 f(this.getUTCMinutes())   + ':' +
				 f(this.getUTCSeconds())   + '';
		};
		String.prototype.toJSON =
		Number.prototype.toJSON =
		Boolean.prototype.toJSON = function (key) {
			return this.valueOf();
		};
	}
	var toJSONString, parseJSON, gap, indent, rep, 
		cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
		escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
		meta = {'\b': '\\b', '\t': '\\t', '\n': '\\n', '\f': '\\f', '\r': '\\r', '"' : '\\"', '\\': '\\\\'};
	function quote(string) {
		escapable.lastIndex = 0;
		return escapable.test(string) ?
			'"' + string.replace(escapable, function (a) {
				var c = meta[a];
				return typeof c === 'string' ? c :
					'\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
			}) + '"' :
			'"' + string + '"';
	}
	function str(key, holder) {
		var i, k, v, length, partial,
			mind = gap,
			value = holder[key];
		if (value && typeof value === 'object' && typeof value.toJSON === 'function') {
			value = value.toJSON(key);
		}
		if (typeof rep === 'function') {
			value = rep.call(holder, key, value);
		}
		switch (typeof value) {
		case 'string':
			return quote(value);
		case 'number':
			return isFinite(value) ? String(value) : 'null';
		case 'boolean':
		case 'null':
			return String(value);
		case 'object':
			if (!value) {
				return 'null';
			}
			gap += indent;
			partial = [];
			if (Object.prototype.toString.apply(value) === '[object Array]') {
				length = value.length;
				for (i = 0; i < length; i += 1) {
					partial[i] = str(i, value) || 'null';
				}
				v = partial.length === 0 ? '[]' :
					gap ? '[\n' + gap +
							partial.join(',\n' + gap) + '\n' +
								mind + ']' :
						  '[' + partial.join(',') + ']';
				gap = mind;
				return v;
			}
			if (rep && typeof rep === 'object') {
				length = rep.length;
				for (i = 0; i < length; i += 1) {
					k = rep[i];
					if (typeof k === 'string') {
						v = str(k, value);
						if (v) {
							partial.push(quote(k) + (gap ? ': ' : ':') + v);
						}
					}
				}
			} else {
				for (k in value) {
					if (Object.hasOwnProperty.call(value, k)) {
						v = str(k, value);
						if (v) {
							partial.push(quote(k) + (gap ? ': ' : ':') + v);
						}
					}
				}
			}
			v = partial.length === 0 ? '{}' : 
				   gap ? '{\n' + gap + partial.join(',\n' + gap) + '\n' + mind + '}' : 
				   '{' + partial.join(',') + '}';
			gap = mind;
			return v;
		}
	}
	toJSONString = function(value, replacer, space){
		var i, gap = '', indent = '';
		if (typeof space === 'number') {
			for (i = 0; i < space; i += 1) {
				indent += ' ';
			}
		} else if (typeof space === 'string') {
			indent = space;
		}
		rep = replacer;
		if (replacer && typeof replacer !== 'function' &&
				(typeof replacer !== 'object' ||
				 typeof replacer.length !== 'number')) {
			throw new Error('JSON.toString');
		}
		return str('', {'': value});
	};
	parseJSON = function(text, reviver){
		var j;
		function walk(holder, key) {
			var k, v, value = holder[key];
			if (value && typeof value === 'object') {
				for (k in value) {
					if (Object.hasOwnProperty.call(value, k)) {
						v = walk(value, k);
						if (v !== undefined) {
							value[k] = v;
						} else {
							delete value[k];
						}
					}
				}
			}
			return reviver.call(holder, key, value);
		}
		text = String(text).replace(/\r|\n/ig, '');
		cx.lastIndex = 0;
		if (cx.test(text)) {
			text = text.replace(cx, function (a) {
				return '\\u' +
					('0000' + a.charCodeAt(0).toString(16)).slice(-4);
			});
		}
		if (/^[\],:{}\s]*$/.test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@')
						   .replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']')
						   .replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
			j = eval('(' + text + ')');
			return typeof reviver === 'function' ?
				walk({'': j}, '') : j;
		}
		throw new SyntaxError('JSON.toJSON');
	};
	return {
		'toJSONString': toJSONString,
		'parseJSON': parseJSON
	};
})();
__Cookie = {
	set: function(a, f, d, c) {
		if (typeof d != "number" && !(d instanceof Date)) {
			d = (1 * 24 * 60 * 60 * 1000);
		}
		var b, e;
		if (d instanceof Date) {
			b = d;
			e = b ? "expires=" + b.toGMTString() + "; ": "";
		} else {
			if ( d == 0 ){
				b = 0;
				e = __B.ie ? " " : "expires=0; ";
			}else if (d > 0) {
				b = new Date();
				b.setTime(b.getTime() + d);
				e = b ? "expires=" + b.toGMTString() + "; ": "";
			}
		}
		var k = a + "=" + encodeURIComponent(f) + "; ";
		var g = /([^\.]+(\.com(\.cn)?|\.net(\.cn)?|\.org(\.cn)?|\.gov(\.cn)?|\.cn|\.mobi|\.tel|\.asia|\.me|\.info|\.hk|\.cc|\.biz|\.tv))$/i.exec(document.domain);
		g = c || (g ? g[0] : document.domain);
		var c = "domain=" + g + "; ";
		var h = "path=/; ";
		document.cookie = k + e + c + h;
		return f;
	},
	del: function(b, a) {
		return NtUtil.setCookie(b, "", new Date(), a);
	},
	get: function(b) {
		var c = document.cookie;
		if (c.length) {
			var a = new RegExp("(?:^|;)\\s*" + b + "=(.*?)(?:;|$)").exec(c);
			if (a && a.length) {
				return decodeURIComponent(a[1]);
			}
		}
		return null;
	}
};
__D.animExt.prototype = {
	update: function(){
		switch(this.prop.toLowerCase()){
			case "scrollleft":
				this.elem.scrollLeft = this.now;break;
			case "scrolltop":
				this.elem.scrollTop = this.now;break;
			case "opacity":
				if ( __B.msie ) 
					this.elem.style.filter = "alpha(opacity:"+(this.now)+")";
				else if ( __B.mozilla ) 
					this.elem.style.MozOpacity = this.now/100;
				else{
					this.elem.style.opacity = this.now/100;
				}
				break;
			default: this.elem.style[this.prop] = this.now + this.unit;
		}
	},
	custom: function(from, to, unit){
		this.startTime = +new Date(); //(new Date()).getTime();
		this.start = from;
		this.end = to;
		this.unit = unit || "px";
		this.now = this.start;
		this.pos = this.state = 0;
		this.update();
		var self = this;
		function t(gotoEnd){
			return self.step(gotoEnd);
		}
		t.elem = this.elem;
		if ( t() && __D.timers.push(t) && __D.timerId == null ) {
			__D.timerId = setInterval(function(){
				var timers = __D.timers;
				for ( var i = 0; i < timers.length; i++ ){
					if ( !timers[i]() )
						timers.splice(i, 1);
				}
				if ( !timers.length ) {
					clearInterval( __D.timerId );
					__D.timerId = null;
				}
			}, 13);
		}
	},
	step: function(gotoEnd){
		var t = +new Date();
		if( gotoEnd || t > this.options.duration + this.startTime ){
			this.now = this.end;
			this.pos = this.state = 1;
			this.update();
			this.options.curAnim[ this.prop ] = true;
			var done = true;
			for ( var i in this.options.curAnim )
				if ( this.options.curAnim[i] !== true )
					done = false;
			__D.queue.remove(this.elem);
			
			if ( done && typeof( this.options.complete )=='function' ){
				this.options.complete.apply(this, [this.elem] );
			}
			return false;
		}
		else{
			var n = t - this.startTime;
			this.state = n / this.options.duration;
			var specialEasing = this.options.specialEasing && this.options.specialEasing[this.prop];
			var defaultEasing = this.options.easing || (__D.easing.swing ? "swing" : "linear");
			this.pos = __D.easing[specialEasing || defaultEasing](this.state, n, 0, 1, this.options.duration);
			this.now = this.start + ((this.end - this.start) * this.pos);
			this.update();
		}
		return true;
	}
};
/**
 * selector JavaScript Library
 * http://mojo-js.appspot.com
 * 
 * Copyright (c) 2010 scott.cgi
 * Released under MIT License (http://mojo-js.appspot.com/MIT-License.txt)
 * 
 * Since  2009-11-11
 * Current Release Date: 2011-01-25 18:23 (UTC+08:00)
 */
(function(window){
	
	var 
		document = window.document,
		
		selector = function(selector, context) {
			return joQuery.query(selector, context);
		},
		
		// inner assist object
		joQuery = {
		    // Identifies HTMLElement whether matched in one query
		    tagGuid: 1,			
			
			attrMap: {
				"class": "className",
				"for": "htmlFor"
			},
			
			rex: {
				R_RULE: /[ +>~]/g,
				NR_RULE: /[^ +>~]+/g,
				TRIM_LR: /^ +| +$/g,
				TRIM_ALL: / *([ +>~,]) */g,
				PSEU_PARAM: /\([^()]+\)/g,
				ATTR_PARAM: /[^\[]+(?=\])/g,
				ATTR: /=|!=|\^=|\$=|\*=|~=|\|=/,
				CLS: /\./g,
				PSEU: /[^:]+/g,
				NUM: /\d+/,
				NTH: /(-?\d*)n([+-]?\d*)/,
				RULES: /((?:#.+)*)([a-zA-Z*]*)([^\[:]*)((?:\[.+\])*)((?::.+)*)/
			},

			/**
			 * Get HTMLElement array by selector and context
			 * 
			 * @param {String} selector  
			 * @param {Undefined | String | HTMLElement | Array | NodeList} context
			 */
			query: function(selector, context) {
				var 
					results = [], 
					selectors, contexts, rules,
					i, j, n, m;
				
				switch (typeof context) {
					case "undefined":
						contexts = [document];
						break;
						
					case "string":
						selector = context + " " + selector; 
						contexts = [document];
						break;
						
					case "object":
						if (context.nodeType) {
							// HTMLElement
							contexts = [context];							
						} else {
							// HTMLElement Array or NodeList
                            contexts = context;
						}
				}				
									 
				selectors = this.format(selector);
				
				context = contexts;
							
				// each selector split by comma
				for (i = 0, j = selectors.length; i < j; i++) {
					selector = selectors[i];
					
					// relative rule array 
					// add defalut rule " "
					rules = (" " + selector).match(this.rex.R_RULE);
										
					// selector on both sides of relative rule  
					selector = selector.match(this.rex.NR_RULE);
					
					// each iteration, use before parse result as this context
					contexts = context;
					
					// parse selector by each relative rule
					for (n = 0, m = rules.length; n < m; n++) { 
						contexts = this.parse(selector[n], contexts, rules[n]);
					}
				
					// concat results of comma delimited selector
					results = results.concat(contexts);
				}
				
				if(j > 1) {
					// if here, may hava duplicate HTMLElement
					// remove duplicate
					return this.makeDiff(results);
				}
				
				return results;				
			},
			
			/**
			 * Format selector
			 * 
			 * @param  {String} selector  
			 * @return {Array}  Selector split by comma
			 */
			format: function(selector){
				var 
					pseuParams = [],
					attrParams = [];
				
				this.pseuParams = pseuParams;
				this.attrParams = attrParams;
				
				selector = selector
								// trim left and right space
								.replace(this.rex.TRIM_LR, "")	
						
								// trim relative rule both sides space
								.replace(this.rex.TRIM_ALL, "$1")	
								
								// remove attribute selector parameter and put in array
								.replace(this.rex.ATTR_PARAM, function(match){
									return attrParams.push(match) - 1;
								});
				
				// remove pseudo selector parameter and put in array
				while(selector.indexOf("(") !== -1) {
					selector = selector.replace(this.rex.PSEU_PARAM, function(match){
						return pseuParams.push(match.substring(1, match.length - 1)) - 1;
					});
				}
				
				return selector.split(",");					
			},				
			
		   /**
		 	* Parse selector and get matched HTMLElement array
		 	* 
		 	* @param  {String} selector      
		 	* @param  {Array}  contexts      
		 	* @param  {String} rule         
		 	* @return {Array}  Matched HTMLElement array
		 	*/
			parse: function(selector, contexts, rule){
				var 
					matched, rules, id, tag, cls, attrs, pseudos;
				
				// rules[1]: id selector 
				// rules[2]: tag selector
				// rules[3]: class selecotr
				// rules[4]: attribute selector
				// rules[5]: pseudo selector  									
				rules = this.rex.RULES.exec(selector);;
				
				// id selector
				if (id = rules[1]) { 
					if (id = document.getElementById(id.substring(1))) {
						return [id];
					}
					
					return [];
				}
				
				matched = Relative[rule](contexts, rules[2] || "*", this);
				
				if(cls = rules[3]) {
					matched = this.filterClass(matched, cls.replace(this.rex.CLS, ""));
				}
				
				if(attrs = rules[4]) {
					matched = this.filterAttr(matched, this.getAttrRules(attrs.match(this.rex.ATTR_PARAM), this.attrParams));
				}
				
				if(pseudos = rules[5]) {
					matched = this.filterPseudo(matched, this.getPseudoRules(pseudos.match(this.rex.PSEU), this.pseuParams));
				}
				
				return matched; 
			},
			
			/**
			 * Parse selector and  get complex selector
			 * 
			 * @param  {String} selector
			 * @return {Array}  Parsed selector rules array
			 */
			getRules : function(selector) {
				var	
					rules, attrs, pseudos; 
				
				// rules[1]: id selector 
				// rules[2]: tag selector
				// rules[3]: class selecotr
				// rules[4]: attribute selector
				// rules[5]: pseudo selector  	
				rules = this.rex.RULES.exec(selector);
				
				if(!rules[2]) {
					rules[2] = "*";
				}
				
				rules[3] = rules[3].replace(this.rex.CLS, "");
				
				if (attrs = rules[4]) {
					// attritubte rules parse function array
					rules[4] = this.getAttrRules(attrs.match(this.rex.ATTR_PARAM), this.attrParams);
				}
				
				if (pseudos = rules[5]) {
					// pseudo rules parse function array
					 rules[5] = this.getPseudoRules(pseudos.match(this.rex.PSEU), this.pseuParams)
				}				
				
				return rules;	
			},			
			
			/**
			 * Get attribute rules 
			 * 
			 * @param  {Array} attrs       
			 * @param  {Array} attrParams  
			 * @return {Array} Array of attribute rules    
			 */
			getAttrRules: function(attrs, attrParams) {
				var
					arr = [],
					len = attrs.length,
					rex = this.rex.ATTR,
					i   = 0,
					attr, rule;
				
				for(; i < len; i++) {
					attr = attrParams[attrs[i]];
					// rule
					rule = attr.match(rex) || " ";
					// attribute key-value
					attr = attr.split(rex);					
					
					// attribute parse function
					arr.push(Attrs[rule]);
					arr.push(attr);					
				}	
				
				return arr;
			},		
			
			/**
			 * Get pesudo rules
			 * 
			 * @param  {Array} pseudos
			 * @param  {Array} pseuParams
			 * @return {Array} Array of pseudo rules
			 */
			getPseudoRules: function(pseudos, pseuParams) {
				var 
					arr  = [],
					i    = 0,
					len  = pseudos.length,
					guid = this.tagGuid++,
					name, param, rules;
				
				for(; i < len; i++) {
					name = pseudos[i];
					if(this.rex.NUM.test(name)) {
						// pesudo parameter
						param = pseuParams[RegExp["$&"]];
						// pesudo name
						name  = RegExp["$`"];
						
						switch(name) {
							case "nth-child":
								if (this.rex.NTH.test(param === "odd" && "2n+1" ||
													  param === "even" && "2n"  || param)) {
									param = RegExp.$1;
									
									param === "" ? 
									param = 1 : 
									param === "-" ? 
									param = -1 : 
									param = param * 1;
									
									// param[0]: Identifies HTMLElement
									// param[1]: whether "nth-child()" has "n" parameter
									// param[2]: parameter before "n"
									// param[3]: paramter after "n"
									param = [guid, true, param, RegExp.$2 * 1];
									
									// optimize "nth:child(n)" 
									// this pseudo means all child nodes fit
									// so no need execute this pseudo filter
									if (param[2] === 1 && param[3] === 0) {
										continue;
									}
								} else {
									// param[2]: number in like "nth-child(5)"
									param = [guid, false, param * 1];
								}						
								
								break;
								
						 	case "not":
							    // ":not()" may has "," in parameter
								// like: ":not(a, p)"
								rules = param.split(",");
								param = [];
								while(rules.length) {
									param.push(this.getRules(rules.pop()));
								}
						}

					}
					
					// parse pseudo selector funtion
					arr.push(Pseudos[name]);
					arr.push(param);
				}	

				return arr;
			},
			
			/**
			 * Filter HTMLElement whether matched pseudo rules
			 * 
			 * @param  {Array} els
			 * @param  {Array} pseudoRules
			 * @return {Array} Matched HTMLElement array   
			 */
			filterPseudo: function(els, pseudoRules){
				var 
					len = els.length, 
					i   = 0, 
					m   = pseudoRules.length,
					matched = [],
					n, el, pseudo, param;
				
				for(; i < len; i++) {
					el = els[i];
					for (n = 0; n < m; n += 2) {
						pseudo = pseudoRules[n];
						param  = pseudoRules[n + 1];
						
						if (!pseudo(el, param, this)) {
							break;
						}
					}
					
					if(n === m) {
						matched.push(el);
					}
				}

				return matched;
			},	
			
			/**
			 * Filter HTMLElement whether matched attribute rule
			 * 
			 * @param  {Array}  els
			 * @param  {Array}  attrRules
			 * @return {Array}  Matched HTMLElement array
			 */
			filterAttr: function(els, attrRules){
				var 
					len = els.length,
					i = 0, 
					m = attrRules.length,
					matched = [],
					n, el, attr, rule, val, name;
				
				for(; i < len; i++) {
					el = els[i];
					for (n = 0; n < m; n += 2) {
						rule = attrRules[n];
						attr = attrRules[n + 1];
						name = attr[0];
						
						if (!(val = (name === "href" ? el.getAttribute(name, 2) : el.getAttribute(name)))) {
							if (!(val = el[this.attrMap[name] || name])) {
								break;
							}
						}
						
						if (!rule(val + "", attr[1])) {
							break;
						}
					}
					
					if(n === m) {
						matched.push(el);
					}
				}

				return matched;
			},	
			
		   	/**
		 	 * Filter HTMLElement whether matched class attribute
		 	 * 
		 	 * @param  {Array}   els
		 	 * @param  {String}  cls
		 	 * @return {Array}   Matched HTMLElement array
		 	 */ 
		    filterClass: function(els, cls){
				var 
					i = 0,
					len = els.length,
					matched = [],
					clsName, rex;
				
				for(; i < len; i++) {
					el = els[i];
					if(clsName = el.className) {
						rex = new RegExp(clsName.replace(" ", "|"), "g");
						if(!cls.replace(rex, "")) {
							matched.push(el);
						}
					}
				}

				return matched;
			},										
			
			/**
			 * Filter HTMLElement 
			 * 
			 * @param  {HTMLElement} el
			 * @param  {String}      tag
			 * @param  {String}      cls
			 * @param  {Array}       attrRules
			 * @param  {Array}       pseudoRules
			 * @return {Boolean}     Whether HTMLElement matched
			 */
			filterEl: function(el, tag, cls, attrRules, pseudoRules) {
				if (tag !== "*" && el.nodeName.toLowerCase() !== tag) {
					return false;
				}
				
				if (cls && !this.filterClass([el], cls).length) {
					return false;
				}
				
				if (attrRules && !this.filterAttr([el], attrRules).length) {
					return false;
				}
				
				if (pseudoRules && !this.filterPseudo([el], pseudoRules).length) {
					return false;
				}				
				
				return true;
			},

		   /**
		 	* Reomve duplicate HTMLElement
		 	* 
		 	* @param  {Array} arr
		 	* @return {Array} Unique HTMLElement array
		 	*/
			makeDiff : function(arr){
				var 
					guid  = this.tagGuid++,
					len   = arr.length, 
					diff  = [], 
					i     = 0, 
					el, data;
				
				for (; i < len; i++) {
					el = arr[i];
					data = this.getElData(el);
					if (data.tagGuid !== guid) {
						diff.push(el);
						data.tagGuid = guid;
					}
				}
				
				return diff;
			},
			
			/**
			 * Get the data bind in HTMLElement
			 * 
			 * @param  {HTMLElement} el
			 * @return {Object}      Data bind in HTMLElement
			 */
			getElData: function(el) {
				var 
					data = el.mojoExpando;
					
				if(!data) {
					data = el.mojoExpando = {
						mQuery: {
							tagGuid: 0
						}
					};
				}
				
				if(!(data = data.mQuery)) {
					data = {
						tagGuid: 0
					};
				}
				
				return data;
			}			
		}, 
		
		Relative = {
		   /**
 			* Get matched HTMLElement
 			*
 			* @param  {Array}  contexts   
 			* @param  {String} tag        
		  	* @return {Array}  Matched HTMLElement array
 			*/			
			" " : function(contexts, tag, joQuery) {
				var 
					guid  = joQuery.tagGuid++,
					len   = contexts.length,
					arr   = [],
					i     = 0,
					n, m, nodes, el, pel;			
					
				for(; i < len; i++) {
					el  = contexts[i];
					if(pel = el.parentNode) {
						if(joQuery.getElData(pel).tagGuid === guid) {
							continue;
						}
						joQuery.getElData(el).tagGuid = guid;
					}
					
					nodes = el.getElementsByTagName(tag);	
					for(n = 0, m = nodes.length; n < m; n++) {
						arr.push(nodes[n]);
					}
				}
				
				return arr;
			},
			
		   /**
 			* Get matched HTMLElement
 			*
 			* @param  {Array}  contexts   
 			* @param  {String} tag        
		  	* @return {Array}  Matched HTMLElement array
 			*/					
			">" : function(contexts, tag) {
				var 
					arr = [], 
					len = contexts.length,
					i   = 0, el;			
				
				for(; i < len; i++) {
					el = contexts[i].firstChild;	
					while(el) {
						if(el.nodeType === 1) {
							if(el.nodeName.toLowerCase() === tag || tag === "*") {
								arr.push(el);
							}
						}
						el = el.nextSibling;							
					}												
				}
				
				return arr;					
			},	
			
		   /**
 			* Get matched HTMLElement
 			*
 			* @param  {Array}  contexts   
 			* @param  {String} tag        
		  	* @return {Array}  Matched HTMLElement array
 			*/					
			"+" : function(contexts, tag) {
				var 
					arr = [], 
					len = contexts.length,
					i   = 0, el;	
					
				for (; i < len; i++) {
					el = contexts[i];
					while(el = el.nextSibling) {
						if(el.nodeType === 1) {
							if(el.nodeName.toLowerCase() === tag || tag === "*") {
								arr.push(el);
							}
							break;
						}
					}
				}
				
				return arr;											
			},					
			
		   /**
 			* Get matched HTMLElement
 			*
 			* @param  {Array}  contexts   
 			* @param  {String} tag        
		  	* @return {Array}  Matched HTMLElement array
 			*/					
			"~" : function(contexts, tag, joQuery) {
				var 
					guid  = joQuery.tagGuid++,
					len   = contexts.length,
					arr   = [], 
					i     = 0,
					el, pel, data;

				for (; i < len; i++) {
					el = contexts[i];
					if (pel = el.parentNode) {
						if((data = joQuery.getElData(pel)).tagGuid === guid) {
							continue;
						}
						data.tagGuid = guid;
					}
					
					while(el = el.nextSibling) {
						if (el.nodeType === 1) {
							if(el.nodeName.toLowerCase() === tag || tag === "*") {
								arr.push(el);
							}
						}
					}
				}
						
				return arr;											
			}			
		},
		
		Attrs = {
			" " : function() { 
				return true;
			},
			
			"=" : function(attrVal, inputVal) {
				return attrVal === inputVal;
			},
			
			"!=" : function(attrVal, inputVal) {
				return attrVal !== inputVal;
			},
			
			"^=" : function(attrVal, inputVal) {
				return attrVal.indexOf(inputVal) === 0;
			},
			
			"$=" : function(attrVal, inputVal) {
				return attrVal.substring(attrVal.length - inputVal.length) === inputVal;
			},
			
			"*=" : function(attrVal, inputVal) {
				return attrVal.indexOf(inputVal) !== -1
			},
			
			"~=" : function(attrVal, inputVal) {
				return (" " + attrVal + " ").indexOf(" " + inputVal + " ") !== -1;
			},
			
			"|=" : function(attrVal, inputVal) {
				return attrVal === inputVal || attrVal.substring(0, inputVal.length + 1) === inputVal + "-";
			}
		},
		
		Pseudos = {
			"first-child": function(el) {
				while (el = el.previousSibling)	 {
					if (el.nodeType === 1) { 
						return false; 
					}
				}
				
				return true;
			},
			
			"last-child": function(el) {
				while (el = el.nextSibling)	 {
					if (el.nodeType === 1) { 
						return false; 
					}
				}
				
				return true;					
			},
			
			"only-child": function(el) {
				var	
					next = el.nextSibling,
					pre  = el.previousSibling;
				
				while(next) {
					if(next.nodeType === 1) {
						return false;
					}
					next = next.nextSibling;
				}	
				
				while(pre) {
					if(pre.nodeType === 1) {
						return false;
					}
					pre = pre.previousSibling;
				}			
				
				return true;		
			},
			
			"nth-child": function(el, param, joQuery) {
				var
				    pel, index, node, i, data;
				
				if ((pel = el.parentNode) && (data = joQuery.getElData(pel)).tagGuid !== param[0]) { 
					node = pel.firstChild;
					i = 1;
					while (node) {
						if (node.nodeType === 1) {
							joQuery.getElData(node).nodeIndex = i++;
						}
						node = node.nextSibling
					}
					data.tagGuid = param[0];
				}
					
				index = joQuery.getElData(el).nodeIndex;
				
				if (param[1]) {
					index = index - param[3];
					param = param[2];
					return index * param >= 0 && index % param === 0;
				}
				
				return index === param[2];
			},
			
			not: function(el, params, joQuery) {
				var 
					i   = 0,
					len = params.length,
					param;
					
				for(; i < len; i++) {
					param = params[i];
					
					if(param[1]) {
						if("#" + el.id !== param[1]) {
							continue;
						}
						
						return false;
					}
					
					if(joQuery.filterEl(el, param[2], param[3], param[4], param[5])) {
						return false;
					}
				}	
				
				return true;	
			},
			
			enabled: function(el) {
				return el.disabled === false;
			},
			
			disabled: function(el) {
				return el.disabled === true;
			},
			
			checked: function(el) {
				return el.checked === true;
			},
			
			empty: function(el){
				return !el.firstChild;
			}
		};
		//context
		selector.each = function(select, callback){
			var elements = selector(select);
			for(var i=0, len = elements.length; i<len; ++i){
				callback.call(this, elements[i]);
			}
			return this;
		};
		selector.setStyle = function(select, name, value){
			var elements = selector(select);
			for(var i=0, len = elements.length; i<len; ++i){
				__D.css(elements[i], name, value);
			}
			return this;
		};
		
		// make selector globel
		window.__$ = selector;
		
		try {
			__B.ie6 && document.execCommand("BackgroundImageCache", false, true);
		} catch(e) {
			;
		}
})(window);	

//debug
(function(window){
	var win = window,
		d = document,
		_Line = 1,
		_element = null,
		_id = 'ntalkerDebugSpan',
		_float = 'left',
		_headId = 'ntalkerDebugLogHeader',
		_bodyId = 'ntalkerDebugLogBody',
		_footerId = 'ntalkerDebugLogFooter',
		_LevelText = '',
		_LevelIndex = 0,
		_debug,_level,
		_left= 0,x = 0,
		_top = 0,y = 0,
		dragMove = false,
		isBlock = d.all ? true : false,
		_stimer = (new Date()).getTime(),
		_etimer = 0,
		_CONFIG = [],
		html = [],
		CFG,
		cookie = __Cookie.get('__ntalkerdebug'),
		_CONST = {
			'LEVEL':['DEBUG','INFO','WARN','ERROR','FATAL','NONE'],
			'DEBUG': '#64C864',
			'INFO':  '#000000',
			'WARN':  '#0000FF',
			'ERROR': '#FF8C00',
			'FATAL': '#FF0000',
			'NONE':  '#CCCCCC'
		},
		initDebug = function(){
			if(_element) return _element;
			_element = d.createElement('div');
			_element.id = _id;
			_element.style.cssText = 'background:#FFFFFF;line-height:150%;position:absolute;'+_float+':0px;left:'+_left+'px;top:'+_top+'px;height:320px;width:420px;z-index:2147483647;border:1px solid #ccc;';
			btnCssText = 'cursor:pointer;display:block;background:#eee;widht:20px;height:20px;position:absolute;font-size:12px;';
			html.push('<div id="'+_headId+'" style="text-align:right;color:#fff;height:20px;background:#ccc;">&nbsp;</div>');
			html.push('<div id="NtalkerDebugHide" style="'+btnCssText+'right:40px;top:0px;">HIDE</div>');
			html.push('<div id="ntalkerDebugClear" style="'+btnCssText+'right:10px;top:0px;">CLS</div>');
			html.push('<div id="'+_bodyId+'" style="color:#00FF00;height:300px;width:420px;overflow-y:scroll;overflow-x:hidden;text-align:left;opacity:0.7;filter:alpha(opacity=70);"></div>');
			html.push('<div id="'+_footerId+'"></div>');
			_element.innerHTML = html.join('');
			d.body.appendChild(_element);
			setInterval(function(){
				NtalkerDebugLock();
			}, 20);
			__E.addEvent(__$$('#'+_headId)[0], 'mousedown', NtalkerDebugStartDrag);
			__E.addEvent(document, 'mousemove', NtalkerDebugDrag);
			__E.addEvent(document, 'mouseup', NtalkerDebugStopDrag);
			__E.addEvent(__$$('#'+'NtalkerDebugHide')[0], 'click', function(){
				_element.style.display = 'none';
				_debug = 0;
				return saveCookie();
			});
			__E.addEvent(__$$('#ntalkerDebugClear')[0], 'click', function(){
				__$$('#'+_bodyId)[0].innerHTML = '';
			});
		},
		createLog = function(info, Level){
			var cssText, date, logText, color,
				DebugElem = __$$('#'+_bodyId)[0],
				elem = d.createElement('div'),
				backgroundColor = _Line%2==0 ? '#eeeeee' : '#ffffff';
				date = new Date(),
				h = date.getHours(),
				m = date.getMinutes(),
				s = date.getSeconds();
			_LevelText = _CONST['LEVEL'][Level] || Level,
			_LevelIndex = getLevelIndex(),
			color = _CONST[_CONST['LEVEL'][_LevelIndex]] || _CONST[_LevelText];
			if(_LevelIndex < _level) return false;
			if(DebugElem.style.display != 'block') DebugElem.style.display = 'block';
			if(DebugElem) DebugElem.appendChild(elem);
			if (h < 10) h = "0" + h;
			if (m < 10) m = "0" + m;
			if (s < 10) s = "0" + s;
			_Line++;
			cssText = 'color:'+color+';font-size:12px;background-color:' + backgroundColor + ';';
			date = '[' + h + ":" + m + ":" + s + " " + date.getMilliseconds() + ']';
			logText = date + '-[' + _LevelText + ']- '  + info;
			elem.style.cssText = cssText;
			elem.innerHTML = logText;
			DebugElem.scrollTop = DebugElem.scrollHeight;
			return logText;
		},
		winLog = function(info){
			var date = new Date(),
				h = date.getHours(),
				m = date.getMinutes(),
				s = date.getSeconds();
			if (h < 10) h = "0" + h;
			if (m < 10) m = "0" + m;
			if (s < 10) s = "0" + s;
			date = '[' + h + ":" + m + ":" + s + " " + date.getMilliseconds() + ']';
			_LevelText = _CONST['LEVEL'][Level] || Level,
			logText = date + '-[' + _LevelText + ']- '  + info;
			win.console.log(logText);
			return logText;
		},
		getLevelIndex = function(){
			for(var i=0, l=_CONST['LEVEL'].length; i<l; i++){
				if(_CONST['LEVEL'][i] == _LevelText) return i;
			}
		},
		lock = function(){
			var top = Math.max(d.body.scrollTop, d.documentElement.scrollTop),
				pageHeight = Math.max(d.body.scrollHeight, d.documentElement.scrollHeight);
			lockTop(_element, top, pageHeight);
		},
		lockTop = function(el, top, pageHeight){
			var y = top + _top,
				offsetTop = (y - parseInt(el.style.top)) / 10;
	        if (isBlock) {
	            offsetTop = (y - parseInt(el.style.top));
	        }
	        var topSide = parseInt(el.style.top) + offsetTop;
	        if ((topSide + el.offsetHeight) < pageHeight) {
	            el.style.top = topSide + "px";
	        }
		},
		startDrag = function(e){
			var event = __E.fixEvent(e);
			dragMove = true;
			__B.ie ? _element.setCapture() : win.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP);
			__D.css(__$$('#'+_headId)[0], 'cursor', 'move');
			__D.css(_element, 'z-Index', 2147483647);
			__D.css(_element, 'opacity', 0.4);
			x = event.clientX - parseInt(__D.clientRect(_element).left);
			y = event.clientY - parseInt(__D.clientRect(_element).top) - parseInt(__D.windowRect().y);
		},
		drag = function(e){
			var event = __E.fixEvent(e);
			if(!dragMove) return;
			var _x = event.clientX - x;
			var _y = event.clientY - y;
			_left = _x - __D.windowRect().x;
			_top = _y - __D.windowRect().y;
			_element.style.left = _x + 'px';
			_element.style.top = _y + 'px';
			return saveCookie();
		},
		stopDrag = function(){
			if(!dragMove) return;
			dragMove = false;
			__B.ie ? _element.releaseCapture() : win.releaseEvents(Event.MOUSEMOVE|Event.MOUSEUP)
	  		__D.css(_element, 'opacity', 1);
	  		__D.css(__$$('#'+_headId)[0], 'cursor', 'default');
		},
		saveCookie = function(){
			var cookie = __J.toJSONString({'debug':_debug, 'float':_float, 'left':_left, 'top':_top, 'level':_level});
			__Cookie.set('__ntalkerdebug', cookie);
			return cookie;
		},
		Log = function(info, level){
			if(!_debug) return null;
			Level = typeof level != "undefined" ? level : 0;
			if(_debug==2 && win.console){
				return winLog(info);
			}
			initDebug();
			return createLog(info, Level);
		};
	Log.setOnOff = function(level, debug){
		_debug = debug ? debug : _debug ? 0 : 1;
		_level = level ? level : 0;
		return saveCookie();
	};
	if(!cookie||cookie===undefined){
		CFG = {'debug':0, 'float':"left", 'left':0, 'top':0, 'level':_level}
	}else{
		CFG = __J.parseJSON(cookie)
	}
	_debug = CFG['debug'] ? CFG['debug'] : 0;
	_float = CFG['float']=='left' ? 'left'  : 'right';
	_left = CFG['left'] || 0;
	_top = CFG['top'] || 0;
	_level = typeof(CFG['level'])=="undefined" ? 5 : CFG['level'];
	win.NtalkerDebugStartDrag = startDrag;
	win.NtalkerDebugDrag = drag;
	win.NtalkerDebugStopDrag = stopDrag;
	win.NtalkerDebugLock = lock;
	win.DEBUG = Log;
})(window);

window['__uploadReady'] = [];
window['uploadFlash'] = [];
NTIM.IMChat = (function(){
	// --------------------------------------------------------------------
	//Private variables
	// --------------------------------------------------------------------
	var 
		uploadVersion = '1.0.1',
		_chatVersion = '0.1.6',
		_doc = document,
		_body = _doc.body, _inited = false,
		_DEFAULT_IMAGE = 'http://im.58.com/res/resources/ntalkerfaces/1.jpg',
		_serverurl = 'http://im.58.com/res',
		_rooturl = 'http://downtest.ntalker.com/58',
		
		_CTRLENTER = false,
		
		_FACE_TEXT = [
			"\u60ca\u8bb6","\u96be\u8fc7","\u8272","\u5fae\u7b11","\u5f97\u610f","\u6d41\u6cea","\u5bb3\u7f9e","\u95ed\u5634","\u7761\u89c9","\u5927\u54ed",
			"\u5c34\u5c2c","\u6124\u6012","\u5f00\u5fc3","\u53d1\u5446","\u73ab\u7470","\u4f50\u7f57","\u611f\u5192","\u6293\u72c2","\u5455\u5410","\u5077\u7b11",
			"\u518d\u89c1","\u95ea\u4eba","\u9b3c\u8138","\u9965\u997f","\u56f0","\u60ca\u6050","\u64e6\u6c57","\u771f\u68d2","\u5927\u5175","\u5355\u6311",
			"\u9119\u89c6","\u7591\u95ee","\u6297\u8bae","\u6655\u5012","\u5927\u6012","\u8870","\u8870","\u5618","\u5929\u4f7f","\u6076\u9b54",
			"\u51b7","\u7231\u5fc3","\u53d1\u6012","\u5c0f\u4e11","\u5927\u4fbf","\u732a\u5934","\u7231\u5fc3","\u5fc3\u788e","\u5634\u5507","\u7cd6\u679c",
			"\u86cb\u7cd5","\u70b8\u5f39","\u5f3a","\u5f31","\u63e1\u624b","\u006f\u006b","\u9c9c\u82b1","\u51cb\u8c22","\u793c\u7269","\u5403\u996d"
			],
		_hexch = new Array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'),
		//聊窗状态
		_state = 'enable',
		_disable = ['refused','userinfo','addbuddy', 'queryrecord'],
		_fontsize = 12,
		_fontcolor = '#000000',
		_bold = false,
		_italic = false,
		_underline = false,
		
		_initface = false,
		_initcolor = false,
		
		_ListenContentText = '',
		_listentime = null,
		
		//聊窗信息
		_siteid,
		_userid,_username,_sessionid,
		_destid,_destname,_infoid,
		_isFirst = false,
		
		_chatFlash = null,
		_chatElement = null,
		_chatWidth = 0,
		_chatHeight = 0,
		_chatID = 'chatContainerElement',
		_editorIframeID = 'editor_iframe',
		_editConWin = null,
		_destInfo = {},
		_myInfo = {};
	
	// --------------------------------------------------------------------
	//Private function
	// --------------------------------------------------------------------
	function __over(event){
		var el = __E.fixEvent(event).target,
			className = el.className;
		if( className.indexOf('disable') != -1 ){
			DEBUG('disable over', 1);
			return;
		}
		__D.replaceClass(el, 'out', 'over');
	}
	function __out(event){
		var el = __E.fixEvent(event).target,
			className = el.className;
		if( className.indexOf('disable') != -1 ){
			DEBUG('disable out', 1);
		}
		__D.replaceClass(el, 'over', 'out');
	}
	
	function initChatWindow(){
		__C.load({tagName:'link',rel:'stylesheet',media:'screen',href:_rooturl+'/images/chat.css'}, false, null, true);
		_chatElement = __D.creElm({id:_chatID, 
			style: 'width:370px;height:405px;padding-left:10px;padding-top:10px;margin:0 auto;background-color:#FFF;position:fixed;_position:absolute;bottom:0px;_bottom:none;_top:0px;right:17px;z-index:2147483647;',
			className:'chatContainer',
			innerHTML: ['<div class="header">',
				'<div class="status online"></div>',
				//'<!--离开--><!--<div class="status away"></div>-->','<!--忙碌--><!--<div class="status busy"></div>-->','<!--隐身--><!--<div class="status hide"></div>-->',
				'<div class="name">'+_destname+'(\u5728\u7ebf)</div>',
				//'<div class="sex man"></div>','<!--性别=女--><!--<div class="woman"></div>-->',
				'<div class="close"></div>',
				//'<div class="minimize"></div>',
			'</div>',
			'<div class="clear"></div>',
			'<div class="control">',
				'<span class="age"></span>',
				'<div class="controlpanel">','<div class="userinfo disable" title="\u67e5\u770b\u7528\u6237\u4fe1\u606f"></div>','<div class="addbuddy disable" title="加为好友"></div></div>',
				//<div class="refused disable" title="\u7981\u8a00"></div>
			'</div>',
			'<div class="hidtoryArea"><ul></ul></div>',
			'<div class="toolbar"></div>',
			'<div class="clear"></div>',
			'<div class="editorArea">',
				'<div class="editor" id="editor"></div><div class="submit"></div>',
			'</div>'].join('')
			});
		
		
		var rect = __D.clientRect(_chatElement);
			_chatWidth = rect.w;
			_chatHeight = rect.h;
		
		if(__B.ie){
			_chatElement.style.position = 'absolute';
		}
		var btnClose = __$("div.header div.close")[0];
		__E.addEvent(btnClose, 'click', closeChatWindow);
		__E.addEvent(btnClose, 'mouseover', __over);
		__E.addEvent(btnClose, 'mouseout',  __out);
		_forIE6_on_scroll();
		__E.addEvent(window, 'scroll', _forIE6_on_scroll);
		__E.addEvent(window, 'resize', _forIE6_on_scroll);
	}
	
	function _forIE6_on_scroll(e){
		if(!__B.ie) return;
		var el = _chatElement, 
			x = _doc.documentElement.scrollTop || _doc.body.scrollTop;
		if (el.offsetParent == _body && __B.StrictMode){
			x = x - el.offsetParent.offsetTop - el.offsetParent.clientTop;
		}
		x = x + __D.windowRect().h - _chatHeight;
		DEBUG('scroll top='+x, 4);
		__D.css(el, 'top', x + 'px');
	}
	
	/**
	 * @desc 创建Flash连接
	 */
	function connectServer(){
		var swf = _rooturl + '/fs/ChatFlash.swf?version='+_chatVersion+(__B.ie7||__B.ie8||__B.maxthon||__B.tt ? '&rnd='+(new Date()).getTime() : ''),
			fvars = [], _h = [];
		fvars.push('t=' + _siteid);
		fvars.push('r=' + _rooturl);
		fvars.push('su=' + _serverurl);
		fvars.push('u=' + encodeURIComponent(_userid));
		fvars.push('n=' + encodeURIComponent(_username));
		fvars.push('s=' + encodeURIComponent(_sessionid));
		fvars.push('d=' + _destid);
		fvars.push('dn=' + _destname);
		
		if( __$('#ntalker_chat_div') ){
			try{
				__$('#ntalker_chat_div')[0].parentNode.removeChild(__$('#ntalker_chat_div')[0]);
			}catch(e){
				
			}
		}
		__D.creElm({id: 'ntalker_chat_div', style:'position:absolute;top:-200px;left:-200px;',
			innerHTML: (
			__B.ie 
			? '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28" id="tchatflash" width="1" height="1"><param name="movie" value="'+swf+'" /><param name="allowscriptaccess" value="always" /><param name="flashvars" value="'+fvars.join('&')+'" /></object>' 
			: '<embed src="' + swf + '" id="tchatflash" width="1" height="1" flashvars="'+fvars.join('&')+'" allowscriptaccess="always" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" ></embed>'
			)});
		
		_chatFlash = __$("#tchatflash")[0];
		
		return _chatFlash;
	}
	
	/**
	 * @desc 初始化头部控制面板
	 */
	function initHeadControl(){
		function __click(event){
			var el = __E.fixEvent(event).target,
				className = el.className;
			
			if( className.indexOf('disable') != -1 ){
				DEBUG('disable click', 1);
				return;
			}
			
			if( className.indexOf('addbuddy') !== -1 ){
				try{
					_chatFlash.JS_addFriend();
					DEBUG('_chatFlash.JS_addFriend()', 1);
				}catch(e){
					DEBUG('_chatFlash.JS_addFriend:'+e.message, 4);
				}
			}else if( className.indexOf('userinfo') !== -1 ){
				window.open(_destInfo.profileurl);
				DEBUG('open("'+_destInfo.profileurl+'")', 1);
			}else if( className.indexOf('refusedok') !== -1 ){
				try{
					_chatFlash.JS_addBlocks();
					DEBUG('_chatFlash.JS_addBlocks()', 1);
				}catch(e){
					DEBUG('_chatFlash.JS_addBlocks:'+e.message, 4);
				}
			}
		}
		
		__$.each('div.controlpanel div', function(el){
			__E.addEvent(el, 'mouseover', __over);
			__E.addEvent(el, 'mouseout',  __out);
			__E.addEvent(el, 'click',  __click);
		});
	}
	/**
	 * @desc 初始化消息列表 
	 */
	function initHistoryList(){
		_clearHistoryList();
	}
	function _clearHistoryList(){
		var els = __$('div.hidtoryArea ul li'),
			len = els.length;
		
		for(var i=len; i>=0; i--)
			try{
				if(els[i])els[i].parentNode.removeChild(els[i]);
			}catch(e){
				DEBUG(e.message, 4);
			}
	}
	function _showMessage(json){
		if( !json || json==undefined ){
			DEBUG('_showMessage(null);', 'ERROR');return;
		}
		//DEBUG('_showMessage(\''+__J.toJSONString(json)+'\');', 1);
		
		var el = __$('div.hidtoryArea ul')[0],
			newElement = document.createElement('li'),
			icon = json.logo || _DEFAULT_IMAGE,
			name = json.name==_username ? '\u6211' : json.name,
			timer = json.timer || '00:00',
			content = json.msg || '',
			type = parseInt(json.type) || 1,
			currCssText = ['word-wrap:break-word;word-break:break-all;text-align:left;'],
			nameColor = '#536ca2',//#038f36
			size = json.size || '0',
			url = json.url || '',
			oldfile = json.oldfile || ''
			html = ''
		;
		content = content.replace(/\[infoid:(\d+)\]/, '');
		if( type === 1){
			json.color = json.color&&json.color.length>=6 ? (json.color.indexOf('#')==0 ? json.color : '#'+json.color) : '#000000';
			json.fontsize = json.fontsize&&parseInt(json.fontsize)>10 ? json.fontsize : 14;
			
			currCssText.push('color:' + json.color + ';' );
			currCssText.push('text-decoration:' + (json.underline=='true' ? 'underline' : 'none') + ';' );
			currCssText.push('font-style:' + (json.italic=='true' ? 'italic' : 'normal') + ';' );
			currCssText.push('font-size:' + json.fontsize + 'px;' );
			currCssText.push('font-weight:' + (json.bold=='true' ? 'bold' : 'normal') + ';');
			content = _formattingContent(content, 'input');
			
			newElement.innerHTML = ['<div class="title f12_blue">', name, '<div class="timer">', timer, '</div></div>', '<div class="messageContent" style="', currCssText.join(''), '">', content, '</div>'].join('');
		}else if( /2|3|4|9|10|11/ig.test(type) ){
			html = type === 2 ? ['<div class="system_right">' + timer + '<br />', '\u56fe\u7247 \u201c<a href="'+url+'" target="_blank">'+oldfile+'</a>\u201d ('+size+')' + content + '&nbsp;&nbsp;<br />','<div style="height:130px;width:auto;"><img src="'+url+'" /></div>', '</div>'].join('')
				:  type === 4 ? ['<div class="system_right">' + timer + '<br />', '\u6587\u4ef6 \u201c<a href="'+url+'" target="_blank">'+oldfile+'</a>\u201d ('+size+')' + content + '&nbsp;&nbsp;<a href="'+url+'" target="_blank">\u4fdd\u5b58</a><br />','</div>'].join('')
				:  type === 9 ? ['<div class="system_error">' + timer, '<br />' + content + '</div>'].join('')
				:  type === 10? ['<div class="system_right">' + timer, '<br />' + content + '</div>'].join('')
				:  type === 11? ['<div class="system_info">' + timer, '<br />' + content + '</div>'].join('') 
				:  type === 3 ? ['<div class="system_info">' + timer, '<br />' + content + '</div>'].join('') : '';
			newElement.innerHTML = html;
		}else{
			DEBUG('未知消息类型.', 2);
			return;
		}
		el.appendChild(newElement);
		
		var historyDOM = __$('div.hidtoryArea')[0];
		historyDOM.scrollTop = parseInt(__D.rect(el).h) - parseInt(__D.rect(historyDOM).h) + 50;
	}
	
	/**
	 * @desc 初始化工具条按钮
	 */
	function initToolbarButtons(){
		function __click(event){
			var el = __E.fixEvent(event).target,
				id = el.id,
				panel = __$('div #'+id+'panel')[0];
			if(panel && __D.css(panel, 'display') !== 'block'){
				__$.each('#fontpanel, #facepanel', function(el){
					if(el.id=='facepanel' && !_initface) _createFacePanel();
					if(el === panel) __D.css(el, 'display', 'block');
					else __D.css(el, 'display', 'none');
				})
			}else if(panel){
				__D.css(panel, 'display', 'none');
			}
		}
		
		function __comment(event){
			var el = __E.fixEvent(event).target,
				attr = el.getAttribute('current');
			if(attr){
				DEBUG(NTIM.IMChat.get(attr));
				if( String(NTIM.IMChat.get(attr)) === "true" ){
					__D.removeClass(el, 'select');
					NTIM.IMChat.set(attr, false);
				}else{
					__D.addClass(el, 'select');
					NTIM.IMChat.set(attr, true)
				}
				_execute(attr);
			}
		}
		
		function __createButton(){
			var h = [], elem = __$('div.toolbar')[0];
			h.push('<div id="font" class="font" title="\u5b57\u4f53\u6837\u5f0f"></div> ');
			h.push('<div id="face" class="face" title="\u8868\u60c5"></div> ');
			h.push('<div id="files" class="files" title="\u6587\u4ef6\u4e0a\u4f20"></div>');
			h.push('<div id="images" class="images" title="\u56fe\u7247\u4e0a\u4f20"></div>');
			//h.push('<div id="audio" class="audio" title="\u97f3\u9891\u4f1a\u8bdd"></div>');
			//h.push('<div id="video" class="video" title="\u89c6\u9891\u4f1a\u8bdd"></div>');
			h.push('<div id="setempty" class="setempty" title="\u6e05\u5c4f"></div>');
			h.push('<div id="queryrecord" class="queryrecord disable" title="\u804a\u5929\u8bb0\u5f55"></div>');
			h.push('<div class="clear"></div>');
			h.push('<div class="toolbarpanel">');
				h.push('<div id="fontpanel" class="fontpanel">');
					h.push('<span class="b" current="bold" title="\u7c97\u4f53">B</span>');
					h.push('<span class="i" current="italic" title="\u659c\u4f53">I</span>');
					h.push('<span class="u" current="underline" title="\u4e0b\u5212\u7ebf">U</span>');
					h.push('<span class="color" title="\u5b57\u4f53\u989c\u8272">');
						h.push('<div class="currentcolor"></div>');
						h.push('<div id="colorpanel" class="colorpanel">color panel</div>');
					h.push('</span>');
				h.push('</div>');
				h.push('<div id="facepanel" class="facepanel">face panel</div>');
			h.push('</div>');
			if(!elem)
				Log('Can\'t find toolbar HTMLElement', 'FATAL');
			else
				elem.innerHTML = h.join('');
		}
		
		function __createUploadFlash(parentId, id, action, alt){
			var flashswf = _rooturl + '/fs/FileUpload.swf?action='+action+'&v=' + uploadVersion + '&rnd=' + (new Date()).getTime(), 
				Html = __B.ie 
					? '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28" alt="'+alt+'" id="'+id+'" width="18" height="18"><param name="movie" value="'+flashswf+'" /><param name="allowscriptaccess" value="always" /><param name="flashvars" value="action=' + action + '&siteid=' + _siteid + '&d=' + _destid + '&roomid=T2D" /></object>'
					: '<embed alt="'+alt+'" src="' + flashswf + '" id="'+id+'" width="18" height="18" flashvars="action=' + action + '&siteid=' + _siteid + '&d=' + _destid + '&roomid=T2D" allowscriptaccess="always" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" ></embed>'
			;
			
			__$('#'+parentId)[0].innerHTML = Html;
			
			DEBUG('create upload flash', 1);
			window['uploadFlash'][action] = __$('#'+id)[0];
		}
		function _downloadRecord(){
			if(!NTIM.historicalMsgUrl) return;
			DEBUG(NTIM.historicalMsgUrl, 1);
			window.open(NTIM.historicalMsgUrl+'?siteid='+_siteid+'&srcuid='+_userid+'&dstuid='+_destid+'&sessionid='+_sessionid);
		}
		
		__createButton();
		
		__$.each('div #font,div #face, div #setempty, div #queryrecord, div #files, div #images, div #audio, div #video', function(el){
			__E.addEvent(el, 'mouseover', __over);
			__E.addEvent(el, 'mouseout',  __out);
			__E.addEvent(el, 'click',  __click);
		});
		__$.each('div.fontpanel span', function(el){
			__E.addEvent(el, 'click', __comment);
		});
		
		__E.addEvent(__$('div.fontpanel div.currentcolor')[0], 'click', function(event){
			var target = __E.fixEvent(event).target,
				colorPanel = __$('div.fontpanel #colorpanel')[0];
			
			if(__D.css(colorPanel, 'display')!=='block'){
				if( !_initcolor ) _createColorPanel(colorPanel);
				__D.css(colorPanel, 'display', 'block');
			}else{
				__D.css(colorPanel, 'display', 'none');
			}
		});
		
		__E.addEvent(__$('div.setempty')[0], 'click', _clearHistoryList);
		__E.addEvent(__$('div #queryrecord')[0], 'click', _downloadRecord)
		
		__createUploadFlash('images', 'flashImages', 'uploadimage', '\u56fe\u7247\u4e0a\u4f20');
		__createUploadFlash('files', 'flashFiles', 'uploadfile', '\u6587\u4ef6\u4e0a\u4f20');
	}
	/**
	 * @desc 初始化表情面板
	 */
	function _createFacePanel(){
		var html = [], el = __$('div #facepanel')[0];
		
		_initface = true;
		
		for(var i = 1; i <= 60; i++){
			html.push('<img title="'+_FACE_TEXT[(i-1)]+'" src="'+_rooturl+'/images/faces/'+i+'.png" class="faceimage" style="border:1px solid #CCCCCC;width:23px;height:23px;background-color:#F7F7F7;margin:2px" />');
		}
		el.innerHTML = html.join('');
		
		__$.each('div.facepanel img.faceimage', function(el){
			__E.addEvent(el, 'mouseover', function(event){
				var element = __E.fixEvent(event).target;
				element.style.border = '1px solid #D01E3B';
			});
			__E.addEvent(el, 'mouseout', function(event){
				var element = __E.fixEvent(event).target;
				element.style.border = '1px solid #CCCCCC';
			});
			__E.addEvent(el, 'click', function(event){
				var element = __E.fixEvent(event).target,
					title = element.getAttribute('title'),
					src = element.getAttribute('src');
				_insertContentHtml('<img title="'+title+'" src="'+src+'" style="width:23px;height:23px;" />');
				__$('div #facepanel')[0].style.display = 'none'; 
			});
		});
	}
	/**
	 * @desc 创建颜色面板
	 */
	function _createColorPanel(el){
		var html = [], 
			cnum = new Array(1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0),
			ash = new Array('F','E','D','C','B','A','9','8','7','6','5','4','3','2','1','0');
		DEBUG('_createColorPanel()');
		_initcolor = true;
		html.push('<table width=240 border=0 cellpadding=0 cellspacing=0 id=GrayTable style="CURSOR: pointer;">');
		
		for (i = 0; i < 16; i++) {
			html.push('<tr>');
			html.push('<td bgColor="#'+ash[i]+ash[i]+ash[i]+'" style="border:1px solid #'+ash[i]+ash[i]+ash[i]+';" width=8 height=8></td>');
			for (j = 0; j < 30; j++) {
				n1 = j % 5;
				n2 = Math.floor(j / 5) * 3;
				n3 = n2 + 3;
				html.push( wc((cnum[n3] * n1 + cnum[n2] * (5 - n1)), (cnum[n3 + 1] * n1 + cnum[n2 + 1] * (5 - n1)), (cnum[n3 + 2] * n1 + cnum[n2 + 2] * (5 - n1)), i) );
			}
			html.push('</tr>');
		}
		html.push('<table>');
		el.innerHTML = html.join('');
		
		function __overColor(event){
			var target = __E.fixEvent(event).target;
			//__D.css(target, 'border' , '1px solid #fff');
			__$('#fontpanel div.currentcolor')[0].style.backgroundColor = target.bgColor;
		}
		function __outColor(event){
			var target = __E.fixEvent(event).target;
			//__D.css(target, 'border' , '1px solid '+target.bgColor);
			__$('#fontpanel div.currentcolor')[0].style.backgroundColor = target.bgColor;
		}
		function __clickColor(event){
			var target = __E.fixEvent(event).target,
				colorPanel = __$('div.fontpanel #colorpanel')[0];
			__$('#fontpanel div.currentcolor')[0].style.backgroundColor = target.bgColor;
			_execute('FontColor', target.bgColor);
			DEBUG('FontColor '+target.bgColor);
			__D.css(colorPanel, 'display', 'none');
		}
		__$.each('div.colorpanel td', function(el){
			__E.addEvent(el, 'mouseover', __overColor);
			__E.addEvent(el, 'mouseout', __outColor);
			__E.addEvent(el, 'click', __clickColor);
		});
	}
	
	function wc(r, g, b, n) {
		r = ((r * 16 + r) * 3 * (15 - n) + 0x80 * n) / 15;
		g = ((g * 16 + g) * 3 * (15 - n) + 0x80 * n) / 15;
		b = ((b * 16 + b) * 3 * (15 - n) + 0x80 * n) / 15;
		color = '#' + ToHex(r) + ToHex(g) + ToHex(b) + '';
		return ('<td bgcolor="'+color+'" style="border:1px solid '+color+';" height=8 width=8></td>');
	}
	function ToHex(n) {
		var h, l;
		n = Math.round(n);
		l = n % 16;
		h = Math.floor((n / 16)) % 16;
		return (_hexch[h] + _hexch[l]);
	}
	
	/**
	 * @desc 创建输入框 
	 */
	function initEditorArea(){
		var 
			editorDOM = __$('div #editor')[0],
			editorStyle = 'cursor:text;background:#fff; margin:0px; padding:0px; font-size:14px; overflow:auto;word-wrap: break-word; font-family: Arial;';
		
		_editConWin = __D.creElm({
			contentEditable: true,
			designMode: 'on',
			id: 'ntalkerChatEditorContent',
			style: 'width:310px;height:36px;overflow-y:auto;overflow-x:hidden;background:transparent;float:left;margin:0;padding:0;'
		}, 'div', editorDOM);
		__E.addEvent(_editConWin, 'keypress', _keyPress);
		__E.addEvent(_editConWin, 'click', function(){
			__$.setStyle('div.fontpanel, div.facepanel', 'display', 'none');
		});
		/*
		editorDOM.innerHTML = '<iframe id="'+_editorIframeID+'" frameborder="0" scrolling="auto;" marginwidth="0" style="width:310px;height:36px;overflow-y:hidden;background:transparent;float:left;margin:0;padding:0;"></iframe>';
		_editConWin = __$('iframe #' + _editorIframeID)[0].contentWindow;
		_editConWin.document.designMode = "on";
		_editConWin.document.contentEditable = true;
		_editConWin.document.open();
		_editConWin.document.writeln('<html><head>');
		_editConWin.document.writeln('</head>');
		_editConWin.document.writeln('<body style="'+editorStyle+'" oncontextmenu="return false">&nbsp;</body>');
		_editConWin.document.writeln('</html>');
		_editConWin.document.close();
		__E.addEvent(_editConWin.document, 'keypress', _keyPress);
		__E.addEvent(_editConWin.document, 'click', function(){
			__$.setStyle('div.fontpanel, div.facepanel', 'display', 'none');
		});
		*/
		__E.addEvent(__$('div.submit')[0], 'click', function(event){
			var el = __E.fixEvent(event).target,
				className = el.className;
			if( className.indexOf('disable') != -1 ){
				DEBUG('disable click', 1);
				return;
			}
			_sendMessage();
		});
		try{_editConWin.focus()}catch(e){}
	}
	/**
	 * @desc 发送消息 
	 */
	function _keyPress(event){
		var ev = __E.fixEvent(event);
		
		if(ev.keyCode==13){
			if(document.all) ev.returnValue=false;
			else ev.preventDefault();
		}
		if( _CTRLENTER ){
			if( ev.keyCode==13 && ev.ctrlKey ){
				_sendMessage();
			}else if( ev.keyCode==13 && !ev.ctrlKey ){
				_insertContentHtml("<br />");
			}
		}else{
			if( ev.keyCode==13 && !ev.ctrlKey ){
				_sendMessage();
			}else if( ev.keyCode==13 && ev.ctrlKey ){
				_insertContentHtml("<br />");
			}
		}
		return true;
	}
	/**
	 * @desc 消息预知
	 */
	function _listenKeyPress(){
		_listentime = setInterval(function(){
			var listenText = _getContentText().replace(/<.*?>/gi, ''),
				cacheText = _ListenContentText;
			if( (cacheText != listenText && listenText) || (cacheText && !listenText) ){
				try{
					DEBUG('_chatFlash.predictMessage("'+listenText+'")');
				}catch(e){
					DEBUG(e.message, 'ERROR');
				}
			}
			_ListenContentText = listenText;
		}, 500);
	}
	function _execute(command, content) {
		switch( command.toLowerCase() )
		{
			case 'bold': 
				__D.css(_editConWin, 'font-weight', _bold ? 'bold' : '');
				break;
			case 'italic':
				__D.css(_editConWin, 'font-style', _italic ? 'italic' : '');
				break;
			case 'underline': 
				__D.css(_editConWin, 'text-decoration', _underline ? 'underline' : '' );
				break;
			case 'fontcolor':
				__D.css(_editConWin, 'color', content);
				_fontcolor = content;
				break;
			case 'fontsize':
				__D.css(_editConWin, 'font-size', content+'px');
				_fontsize = content;
				break;
			case 'innerhtml':
				_editConWin.innerHTML += content;
				break;
		}
		try{
			_editConWin.focus();
		}catch(e){
			DEBUG(e.message);
		}
	}
	function _insertContentHtml(content) {
		_execute('innerHTML', content);
	}
	/**
	 * @desc 
	 */
	function _getContentText(){
		if(!_editConWin) return '';
		var con = _editConWin.innerHTML.replace(/^(&nbsp;)|\s*/, '');
		return _formattingContent(con, 'output');//.replace(/<.*?>/gi, '')
	}
	
	/**
	 * @desc 格式化消息内容 
	 * @param strCon(string) 消息内容above
	 * @param strIO(string) 输入输出[input/output]
	 */
	function _formattingContent(strCon, strIO){
		function __getFaceIndex(text){
			var len = _FACE_TEXT.length;
			for(var j=0; j<len; j++){
				if( "["+_FACE_TEXT[j]+"]" == text) return(j+1);
			}
			return 1;
		}
		
		if( !strCon || strCon == null ){
			return '';
		}else if( strIO == 'output' ){
			var match = strCon.match(/<img.*?\s+title=\"?(.*?)\"?\s+.*?src=\".*?\/(\d{1,})\.png\".*?>/ig);
			if( !match ) return strCon;
			for(var i=0; i<match.length; i++){
				strCon = strCon.replace(match[i], match[i].replace(/<img.*?\s+title=\"?(.*?)\"?\s+.*?src=\".*?\/(\d{1,})\.png\".*?>/i, "[$1]"));
			}
			return strCon;
		}else if( strIO == 'input'){
			var index=0, match = strCon.match(/\[[^(infoid:)](.*?)\]/ig);
			if( !match ) return strCon;
			for(var i=0; i<match.length; i++){
				index = __getFaceIndex(match[i]);
				strCon = strCon.replace(match[i], match[i].replace(/\[[^(infoid:)](.*?)\]/i, "<img title=\"$1\" src=\""+_rooturl+"/images/faces/"+index+".png\" style=\"width:19px;height:19px;\" />"));
			}
			return strCon;
		}
	}
	
	/**
	 * @desc 发送消息 
	 */
	function _sendMessage(jsonData){
		window['send_message_num'] = (window['send_message_num'] ? parseInt(window['send_message_num']) : 0) + 1;
		if(typeof jsonData != "undefined"){
			jsonData.name = '\u6211';
			jsonData.id = _myInfo.myuid;
			jsonData.logo = _myInfo.mylogo;
			jsonData.timer= _getTime(false);
			_showMessage(jsonData);
			
			jsonData.name = _myInfo.myuname;
			
			if( window['send_message_num'] === 1 && _infoid.length>0 )
			//发贴人发第一条消息且infoid不为空时，在第一条消息后带上infoid
			//Date: 2011-09-15
			{
				json.msg += '[infoid:'+_infoid+']';
			}
			try{
				_chatFlash.sendMessage(__J.toJSONString(jsonData));
				DEBUG('_chatFlash.sendMessage("'+__J.toJSONString(jsonData)+'")', 1);
			}catch(e){
				DEBUG('_chatFlash.sendMessage:'+e.message, 4);
			}
		}else{
			var content = _getContentText(),
				json = {
					type: 1,
					id: _myInfo.myuid,
					name: '\u6211',
					logo: _myInfo.mylogo,
					msg: '',
					timer: _getTime(false)
				};
			_bold = json.bold = !!_editConWin.style.fontWeight+""
			_italic = json.italic = (__D.css(_editConWin, 'font-style') == 'italic') + "";
			_underline = json.underline = (__D.css(_editConWin, 'text-decoration') == 'underline') + "";
			json.color = _fontcolor;//__D.css(_editConWin, 'color')
			_fontsize = json.fontsize = parseInt(__D.css(_editConWin, 'font-size'));
			json.msg = content.replace(/<.*?>/ig, '');
			
			DEBUG('_sendMessage();');
			
			if( json.msg === '' ) return;
			
			_showMessage(json);
			
			json.name = _myInfo.myuname;
			if( window['send_message_num'] === 1 && _infoid.length>0 )
			//发贴人发第一条消息且infoid不为空时，在第一条消息后带上infoid
			//Date: 2011-09-15
			{
				json.msg += '[infoid:'+_infoid+']';
			}
			try{
				_chatFlash.sendMessage(__J.toJSONString(json));
				DEBUG('_chatFlash.sendMessage("'+__J.toJSONString(json)+'")', 1);
			}catch(e){
				DEBUG('_chatFlash.sendMessage:'+e.message, 4);
			}
			
			if( window['send_message_num'] === 1 && window['online_status']===0 )
			//Desc: 帖子发布者离线，帖子浏览者发送第一条消息时，自动回复消息  
			//Data: 2011-08-31
			{
				_showMessage({
					type: 1,
					id: _destid,
					name: _destname,
					logo: _DEFAULT_IMAGE,
					msg: '\u60a8\u597d\uff0c\u6211\u73b0\u5728\u4e0d\u5728\u7535\u8111\u65c1\uff0c\u8bf7\u60a8\u7559\u4e0b\u8054\u7cfb\u65b9\u5f0f\uff0c\u56de\u5934\u6211\u4f1a\u8054\u7cfb\u60a8\u3002\u8c22\u8c22\uff01',
					timer: _getTime(false)
				});
			}
		}
		
		try{
			_editConWin.innerHTML = '&nbsp;';
		}catch(e){}
		try{_editConWin.focus()}catch(e){}
	}
	
	function _getTime(serive, time){
		var d = time ? new Date(time) : new Date();
		return f(d.getHours()) + ':' + f(d.getMinutes()) + ':' + f(d.getSeconds());
		function f(n){return n<10 ? '0'+n : n };
	}
	
	function closeChatWindow(){
		clearInterval(_listentime);
		try{
			_chatFlash.closeChat();
		}catch(e){
			DEBUG('close chat window1:'+e.message, 4);
		}
		try{
			_chatFlash.parentNode.removeChild(_chatFlash);
		}catch(e){
			DEBUG('close chat window2:'+e.message, 4);
		}
		try{
			_chatElement.parentNode.removeChild(_chatElement);
		}catch(e){
			DEBUG('close chat window3:'+e.message, 4);
		}
		if(NTIM.freeChatFlashGoUrl)__C.load({src:NTIM.freeChatFlashGoUrl});
		if(NTIM.presenceFlashGoUrl)__C.load({src:NTIM.presenceFlashGoUrl});
		_inited = false;
	}
	
	function updateDestUserInfo(json){
		_destInfo = json;
		var name = __$('div.header div.name')[0],
			//sex = __$('div.header div.sex')[0],
			age = __$('div.control span.age')[0],
			userinfo = __$('div.control div.userinfo')[0],
			addbuddy = __$('div.control div.addbuddy')[0],
			status = __$('div.header div.status')[0];
		//json.sex=="0" ? __D.replaceClass(sex, 'man', 'woman') : __D.replaceClass(sex, 'woman', 'man');
		//age.innerHTML = json.age;
		
		DEBUG('updateDestUserInfo("'+__J.toJSONString(json)+'")');
		
		if(json.profileurl){
			__D.replaceClass(userinfo, 'disable', '');
		}
		if(json.isFriend){
			__D.css(addbuddy, 'display', 'none');
		}else if(NTIM.tchatReady){
			__D.replaceClass(addbuddy, 'disable', '');
		}
		if( typeof json.status != "undefined" && status ){
			status.className = 'status';
			switch( parseInt(json.status) ){
				case 0: __D.addClass(status, 'hide');name.innerHTML = _destname+'(\u79bb\u7ebf)'; break;
				case 1:__D.addClass(status, 'online');name.innerHTML = _destname+'(\u5728\u7ebf)';break;
				case 2:__D.addClass(status, 'online');name.innerHTML = _destname+'(\u5728\u7ebf)';break;
				case 3:__D.addClass(status, 'online');name.innerHTML = _destname+'(\u5728\u7ebf)';break;
				case 4:__D.addClass(status, 'hide');name.innerHTML = _destname+'(\u79bb\u7ebf)';break;
			}
			window['online_status'] = parseInt(json.status);
			window['send_message_num'] = 0;
		}
		
		__D.replaceClass(__$('div.editorArea div.submit')[0], 'disable', '');
	}
	function updateMyUserInfo(json){
		_myInfo = json;
	}
	
	// --------------------------------------------------------------------
	//Public function
	// --------------------------------------------------------------------
	return {
		set: function(name, value){
			eval("(_"+name+"="+(typeof(value)=="string" ? "'"+value+"'" : value)+")");
			return eval("(_"+name+")");
		},
		get: function(name){
			return eval("(_"+name+")");
		},
		init: function(siteid, userid, username, sessionid, destid, destname, infoid){
			if(_inited || (!userid && !username)) return;
			_inited = true;
			
			_initface = false;
			_initcolor = false;
			_fontsize = 12,
			_fontcolor = '#000000',
			_bold = false,
			_italic = false,
			_underline = false,
			
			_siteid = siteid;
			_userid = userid;
			_username = username;
			_sessionid = sessionid;
			_destid = destid;
			_destname = destname;
			_infoid = infoid;
			
			DEBUG("impresenceReady = " + __connect.get("ready"));
			DEBUG("logined = " + __connect.get("logined"));
			
			DEBUG('start init chat.', 'DEBUG');
			initChatWindow();
			DEBUG('init chat html');
			
			//初始化控制按钮区
			initHeadControl();
			DEBUG('init head control.', 'DEBUG');
			
			//初始化消息区
			initHistoryList();
			DEBUG('init history list.', 'DEBUG');
			
			//初始化输入框
			initEditorArea();
			DEBUG('init editor area.', 'DEBUG');
			
			//初始化工具条
			initToolbarButtons();
			DEBUG('init toolbar buttons.', 'DEBUG');
			
			//创建连接
			result = connectServer();
			DEBUG('connect server' + result);
		},
		close: function(){
			closeChatWindow();
		},
		send: function(json){
			_sendMessage(json);
		},
		receive: function(json){
			json.timer = _getTime(true, (json.timestamp + (isNaN(NTIM.JetLag) ? 0 : parseInt(NTIM.JetLag) ) ) );
			_showMessage(json);
		},
		execute: function(command, content){
			_execute(command, content);
		},
		picturesAbnormal: function(e){
			var el = __E.fixEvent(e).target;
			el.onerror = null;
			el.src = _DEFAULT_IMAGE;
		},
		setDestInfo: function(json){
			updateDestUserInfo(json);
		},
		setMyInfo: function(json){
			updateMyUserInfo(json);
		},
		setDisable: function(OclassName, state){
			var elem = __$('#chatContainerElement div.'+OclassName)[0];
			if( state ){
				__D.replaceClass(elem, 'disable', 'disable');
			}else{
				__D.replaceClass(elem, 'disable', '');
			}
		}
	};
})();

function fIM_onGetFlashServer(historicalMsgUrl, checkURL, avServer, manageServer, fileServer){
	DEBUG('fIM_onGetFlashServer("'+historicalMsgUrl+'", "'+checkURL+'","'+avServer+'","'+manageServer+'","'+fileServer+'")');
	NTIM.historicalMsgUrl = historicalMsgUrl;
	NTIM.checkURL = checkURL;
	NTIM.avServer = avServer;
	NTIM.manageServer = manageServer;
	NTIM.fileServer = fileServer;
	
	var historyButton = __$('div #queryrecord')[0];
	if(NTIM.historicalMsgUrl)__D.replaceClass(historyButton, 'disable', '');
	
	fJS_setUploadServer('uploadimage');
	fJS_setUploadServer('uploadfile');
}
function fIM_setChatGoServer(freeChatFlashGoUrl, presenceFlashGoUrl, destuid, chatid, chatType){
	DEBUG('fIM_setChatGoServer("'+freeChatFlashGoUrl+'","'+presenceFlashGoUrl+'")');
	NTIM.freeChatFlashGoUrl = freeChatFlashGoUrl;
	NTIM.presenceFlashGoUrl = presenceFlashGoUrl;
}
function fIM_tchatFlashReady(){
	DEBUG('fIM_tchatFlashReady', 1);
	NTIM.tchatReady = true;
	return true;
}
function fIM_notifyUserNumbers(num){
	DEBUG('fIM_notifyUserNumbers('+num+')');
}
function fIM_ConnectResult(type, jsonParam, msg){
	DEBUG('fIM_ConnectResult('+type+', "'+jsonParam+'", "'+msg+'")');
	var jsonData;
	setTimeout(function(){
		if( type == 0 ){
			DEBUG(msg, 3);
		}else if( type == 1){
			try{
				jsonData = __J.parseJSON(jsonParam);
			}catch(e){
				DEBUG('parseJSON:'+e.message, 4);
			}
			NTIM.JetLag = new Date().getTime() - jsonData.timesample;
			DEBUG('JetLag= ' + NTIM.JetLag, 1);
			NTIM.IMChat.setMyInfo(jsonData);
		}
	}, 10);
}
//@param jsonData = {id:"",name:"",sex:1,age:20,infourl:"", recordurl:""};
function fIM_getSessionCustomerServiceInfo(jsonParam){
	DEBUG('fIM_getSessionCustomerServiceInfo("'+jsonParam+'")');
	setTimeout(function(){
		var jsonData;
		jsonData = jsonParam.replace("\r","").replace("\n","").replace("\r\n","");
		try{
			jsonData = __J.parseJSON(jsonData);
		}catch(e){
			DEBUG('destInfo to json:'+e.message, 3);
		}
		NTIM.IMChat.setDestInfo(jsonData);
	}, 10);
	return true;
}
function fIM_receiveMessage(json){
	DEBUG('fIM_receiveMessage("'+json+'")');
	setTimeout(function(){
		var jsonData;
		try{
			jsonData = __J.parseJSON(json);
		}catch(e){
			DEBUG('parseJSON:'+e.message, 4);
		}
		if(jsonData) NTIM.IMChat.receive(jsonData);
	}, 10);
	return true;
}
function fIM_uploadFlashReady(destuid, action){
	DEBUG('fIM_uploadFlashReady("'+action+'")', 1);
	setTimeout(function(){
		window['__uploadReady'][action] = true;
		if( NTIM.fileServer ){
			fJS_setUploadServer(action);
		}
	}, 10);
	return true;
}
function fJS_setUploadServer(action){
	DEBUG('fJS_setUploadServer("'+action+'")', 1);
	if( window['__uploadReady'][action] !== true || !NTIM.fileServer  ) return;
	
	var uploadFlash = window['uploadFlash'][action];
	
	try{
		uploadFlash.setUploadServer(NTIM.fileServer);
		uploadFlash.enableUpload(true);
		DEBUG('exec setUploadServer = ' + NTIM.fileServer, 1);
	}catch(e){
		DEBUG(e.message, 4);
	}
}
function fIM_uploadMouseOver(destuid, action){
	if( action == 'uploadimage' ){
		__D.replaceClass(NTIM.Editor.uploadImage.DOM, 'out', 'over');
	}else if( action == 'uploadfile' ){
		__D.replaceClass(NTIM.Editor.uploadFile.DOM, 'out', 'over');
	}
}
function fIM_uploadMouseOut(destuid, action){
	if( action == 'uploadimage' ){
		__D.replaceClass(NTIM.Editor.uploadImage.DOM, 'over', 'out');
	}else if( action == 'uploadfile' ){
		__D.replaceClass(NTIM.Editor.uploadFile.DOM, 'over', 'out');
	}
}
function fIM_receiveUploadSuccess(destuid, type, jsonParam){
	DEBUG('fIM_receiveUploadSuccess("'+type+'", "'+jsonParam+'")');
	var jsonData;
	setTimeout(function(){
		try{
			jsonData = __J.parseJSON(jsonParam);
		}catch(e){
			DEBUG('parseJSON:'+e.message, 4);
		}
		NTIM.IMChat.send(jsonData);
	}, 10);
	return;
}
function fIM_receiveUploadFailure(destuid, type, strMsg){
	DEBUG('fIM_receiveUploadFailure("'+type+'", "'+strMsg+'")');
	NTIM.IMChat.receive({
		"type": 9,
		"msg": strMsg
	});
	return;
}
function fIM_receiveUploadProgress(destuid, type, intProgress){
	return true;
}
function fIM_returnMessages(isok, timestamp, strMsg){
	DEBUG('fIM_returnMessages('+isok+', '+timestamp+', '+strMsg+')');
	setTimeout(function(){
		NTIM.IMChat.receive({
			"type": 11,
			"timestamp": timestamp,
			"msg": strMsg
		});
	}, 10);
	return true;
}
function fIM_isBlocks(isBoolean){
	DEBUG('fIM_isBlocks('+isBoolean+')');
	if( isBoolean )
		__D.replaceClass(__$('div .refused')[0], 'refused', 'refusedok');
	else
		__D.replaceClass(__$('div .refusedok')[0], 'refusedok', 'refused');
}