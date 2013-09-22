if( typeof(gLang) == 'undefined' ){
	var gLang = new Array();
}
var NtLanguage = 'zh_CN';
gLang['zh_CN'] = new (function () {
	this.zhBlank = "　";
	this.userIdHead = "guest";
	this.userNameHead = "游客";
	this.guestSessionId = "NtalkerGuestUserSessionID";
	this.pageGroupsEntranceTip = ["打开%1", "点击进入%1聊天", "点击这里开始聊天"];
	this.pageStatusTip  = "跟我聊天";
	this.toolbarGroupTip = "请点击这里开始群聊";
	this.adminUserName= "管理员";
	this.replaceExpression  = ["[表情]", "[图片]"];
	//会话|请求|窗口标题栏提示文本
	this.requestChat = ["请求与您会话", "聊天请求", "聊天消息", "群组消息"];
	this.requestAddFriend = ["加您为好友", "加好友请求"];
	this.onlineText = "刚刚上线";
	this.requestSessionTitle = "请求与你 %1";
	this.audioSession = "音视频会话";
	this.videoSession = "音频会话";
	this.fileTransfer = "传输文件";
	this.receiveMessageTitle  = "%1 说：%2";
	this.popupWindowTitle  = "聊天窗口";
	this.promptTitle = "【%1】%2 - %3";
	//面页提示相关文本
	this.noInstallFlash = "Flash插件未安装或版本过低,请重新安装.";
	this.loadFlashFailure = "Flash装载失败，请点击此处重新连接...";
	this.notLogin = "您还没有登录，请先登录！";
	this.connectErr = "连接失败，请稍候重试！";
	this.buddylistWindowTitle  = "好友列表";
	this.buddylistNotLoginAlter = "您尚未登录，请登录后再使用好友列表！";
	//统计描述文本
	this.sd_Buddylist = "好友列表";
	this.sd_closeGroupWindow = "关闭群聊窗";
	this.sd_closeNQuanWindow = "关闭能圈";
	this.sd_closeChatWindow  = "关闭一对一聊窗";
	this.sd_eventOpen   = "打开";
	this.sd_eventClose  = "关闭";
	this.sd_GroupWindow = "群聊窗";
	this.sd_NQuanWindow = "能圈";
	this.sd_ChatWindow  = "一对一聊窗";
	this.sd_eventType = ["(主)","(被)","(携)"];
	this.sd_superPromotionMessage = "收到superuser推广的nquan消息";
	this.sd_openSystemMessageBoxDesc = "打开消息盒子系统消息标签";
	//聊窗标题栏文本
	this.minWindowTitle = "与 %1 对话";
	this.sayContent = "说 %1";
	this.messageBoxTitle = "通知";
	this.CONST_siteApplication = "站内应用";
	this.LoadingText = "载入中...";
	this.buddylistButtonText = ["联系人(%1/%2)", "好友(%1/%2)"];
	this.groupButtonText = "群组(%1)";
	this.systemButtonText = "通知";
	this.scrollButtonText = ["向前滚动", "向后滚动"];
	this.myAppButtonText = "我的中心";
	this.hotFocusButtonText = ["热点聚焦", "最新帖", "最热帖"];
	this.systemMessageBoxText = ["动态消息", "系统消息"];
	this.spanSwitchButtonText = ["显示工具栏", "隐藏工具栏"];
	this.spanConfigurationText = "设置";
	this.configurationMenuDynamicMessages = ["动态消息","接收原创消息","接收评论消息"];
	this.configurationMenuGroupSetting = ["群组设置","使用群组自身消息设置","屏蔽所有群组消息"];
	this.configurationMenuOtherSettings = ["其它设置","好友上线提示","允许接收陌生人消息","系统声音提示"];
	this.configurationMenuLinkText = "查看所的聊天记录";
	//工具栏相关文本
	this.nullMessage = ["暂无%1","暂无%1消息"];
	this.viewPhotoTitle = "图片浏览";
	this.ApplicationName = {};
	this.ApplicationName['1'] = '图片浏览';
	this.ApplicationName['2'] = '团购';
	
	//10:52 2010-9-8
	//临时自定义按钮
	this.customApplicationButtonText = '直播';
	
	this.myAppButtonTextLength=6;//图片浏览的长度
	this.spanBuddylistlength=0;//联系人的长度
	this.spanGroupslength=0;//群组长度
	this.spanNoticelength=0; 
	this.sheetFileName = 'ntalkerToolbar.css';
})();
var Ntalker = {
	unKey:"imNt_uLoad_ctWind",
	ctKEY:"systemMessage",
	gpKEY:"groupMessage",
	guestUserNoKEY:"imNt_guestNo",
	tbModelKEY:"toolbarMode" 
};
Ntalker.version = {
	script_version: "[TimeOfIssue]",
	presence_flash : "3.2.16",
	buddylist_flash: "3.2.16",
	webchat_flash : "3.2.18",
	group_flash : "3.2.16",
	nquan_flash : "3.2.16",
	traing_flash : "1.0.0",
	activity_flash: "1.0.1",
	avpanel_version: "1.0.0"
};
Ntalker.variable = {
	openHistoryWindow: false,
	presenceConnet: false,
	JetLag: 0,
	ExMsg: [],
	myApp:[],
	applicationOpened: false,
	onlineChat: 10,
	offlineChatList: [],
	siteid: null,
	user_id: null,
	user_name: null,
	user_sid: null,
	userparam: null,
	popupWindow: null,
	scriptPath: "",
	buddylistTag: null,
	iframes:[]
};
Ntalker.temp = {
	webchatDataModReady: false,
	current_tag:[],
	cssLoaded: false,
	chatDataFlashReady:true,
	presenceFlashGoUrl: null,
	buddylistFlashGoUrl: null,
	notify_id: 0,
	userSpanArray: null,
	resetwintop: new Array(),
	pageId: null,
	Tip: null,
	imSid: null,
	ready: false
};
Ntalker.Config = {
	services: "http://" + "im.58.com/res",
	hotserver: "",
	waitRetuenServiceUrl: false,
	publicDIR: "",
	imagesDIR: "",
	customDIR: "",
	skin:"",
	bColor:"",
	bgColor:"",
	logo: "",
	buddylistlogo:"",
	chatlogo:"",
	nquanlogo:"",
	grouplogo:"",
	chatroomlogo:"",
	startlogo:"",
	groupstartlogo:"",
	chatWidth:384,
	chatHeight:416,
	groupWidth:460,
	groupHeight:532,
	IMWidth:248,
	IMHeight:532,
	IMtabIndex: 0,
	customtoolbarButtons: [],
	application:[], 
	customparams: []
};
Ntalker.room = {
	roomid:null,
	roomname:null
};
var chatWindowManager = null;
var promptwindow = null;
var im_myIMWindow = null;
var IMToolBar = null;
var NtLang = null;

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
	create: function(tagName, arrt, par, where){
		var doc,htmls=[], elem;
		doc = document;
		par = par || doc.body || doc.documentElement || null;
		if(par.insertAdjacentHTML && where){
			htmls.push('<' + tagName);
			for(var k in arrt) 
				k && htmls.push(' '+(k=="className" ? "class" : k)+'="' + arrt[k] + '"');
			htmls.push('></'+tagName+'>');
			htmls = htmls.join('');
			where = where? where.toLowerCase() : "afterbegin";
			switch(where){
				case "beforebegin":
					par.insertAdjacentHTML('BeforeBegin', htmls);return par.previousSibling;
				case "beforeend":
					par.insertAdjacentHTML('BeforeEnd', htmls);return par.lastChild;
				case "afterend":
					par.insertAdjacentHTML('AfterEnd', htmls);return par.nextSibling;
				default :
					par.insertAdjacentHTML('AfterBegin', htmls);return par.firstChild;
			}
		}else {
			if( tagName.toLowerCase() == 'text' )
				elem = doc.createTextNode(arrt.text);
			else{
				elem = doc.createElement(tagName);
				for(var k in arrt){
					switch(k){
						case "className": elem.className = arrt[k];break;
						case "style": elem.style.cssText = arrt[k];break;
						default : elem.setAttribute(k, arrt[k]);
					}
				}
			}
			par.appendChild(elem);
			return elem;
		}
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
			try{
				elem.className = elem.className.split(/\s+/).join(" ") + " " + className;
			}catch(e){
				DEBUG(className+' '+e.message, 4);
			}
		}
	},
	removeClass: function( elem, className ){
		if(elem && elem.className.length>0 ){
			var reg = new RegExp( "\\b" + className + "\\b", "gi" );
			elem.className = elem.className.replace( reg, "" );
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
		//过滤出指定类型节点或非空换行(firefox)、注释节点(ie)
		//@pram Nodes(Doms)
		//@pram where(string) className|tagName
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
	},
	ready: function(fn, dom){
		var isReady = false,
			d = dom ? dom : document;
		function done(){
			if(!isReady){
				isReady = true;
				fn.apply(document, arguments);
			}
		};
		/*
		if( __B.chrome && /loaded|complete/.test(document.readyState) ){
			done();
			return;
		}*/
		if ( d.addEventListener && !__B.opera){
			d.addEventListener( "DOMContentLoaded", done, false );
		}
		if ( __B.ie && window == top ) (function(){
			if (isReady) return;
			try {
				d.documentElement.doScroll("left");
			} catch( e ) {
				setTimeout( arguments.callee, 0 );
				return;
			}
			done();
		})();
		if ( __B.opera )
			document.addEventListener( "DOMContentLoaded", function () {
				if (isReady) return;
				var l = document.styleSheets.length;
				for (var i = 0; i < l; i++)
					if (document.styleSheets[i].disabled) {
						setTimeout( arguments.callee, 0 );
						return;
					}
				done();
			}, false);
		if ( __B.safari ) {
			var numStyles;
			(function(){
				if (isReady) return;
				if ( document.readyState != "loaded" && document.readyState != "complete" ) {
					setTimeout( arguments.callee, 0 );
					return;
				}
				if ( numStyles === undefined )
					numStyles = __selector("style, link").length;
				if ( document.styleSheets.length != numStyles ) {
					setTimeout( arguments.callee, 0 );
					return;
				}
				done();
			})();
		}
		
		__E.addEvent(window, 'load', done);
	}
};
__E = (function(){
	var addEvent, removeEvent, evtHash = [];
	if ( window.addEventListener ) {
		addEvent = function( elem, type, handler, useCapture){
			if( !elem ) return;
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
			if( !elem ) return;
			var key = '{FNKEY::obj_' + ieGetUniqueID(elem) + '::evt_' + type + '::fn_' + handler + '}',
				f = evtHash[key];
			if(typeof f != 'undefined') return;
			f = function(){
				handler.call(elem);
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
		if (_parent == _child) return false
		while (_child && _child != _parent) {_child = _child.parentNode;}
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
		var a=[],ta=[];
		try{ta = s.split(";");}catch(e){}
		for(i=0,l=ta.length; i<l; i++){
			if(ta[i]){
				var tta = ta[i].split(':');
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
	},
	EncodeSpecialChar: function(a){
		if (!a || !a.length) {
			return a;
		}
		a = a.replace(/&quot;/g, '"');
		a = a.replace(/&lt;/g, "<");
		a = a.replace(/&gt;/g, ">");
		a = a.replace(/&apos;/g, "'");
		a = a.replace(/&#39;/g, "'");
		a = a.replace(/&amp;/g, "&");
		return a;
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
		return __Cookie.set(b, "", new Date(), a);
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
		this.startTime = +new Date();
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
__IMG = function(src){
	var _img = new Image();
	_img.src = src;
	return _img;
};
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
		selector.each = function(select, callback, context){
			var elements = selector(select);
			for(var i=0, len = elements.length; i<len; ++i){
				callback.call(this, elements[i]);
			}
			return this;
		};
		selector.setStyle = function(select, name, value, context){
			var elements = selector(select, context);
			for(var i=0, len = elements.length; i<len; ++i){
				__D.css(elements[i], name, value);
			}
			return this;
		};
		
		// make selector globel
		window.__$$ = selector;
		window.__$  = function(id){return document.getElementById(id);};
		
		try {
			__B.ie6 && document.execCommand("BackgroundImageCache", false, true);
		} catch(e) {
			;
		}
})(window);	

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
	
	//临时添加测试按钮
	function initTestButtons(){
		var pNode = $('NtalkerDebugTestButtons');
		pNode.innerHTML = '<input type="button" value="admin" onclick="im_openWebchatWindow(\'1\', \'admin\', null, 1, \'chat\', 0, \'page\')" />'+
					'<input type="button" value="dpsing" onclick="im_openWebchatWindow(\'2\', \'dpsing\', null, 1, \'chat\', 0, \'page\')" />'+
					'<input type="button" value="chrome" onclick="im_openWebchatWindow(\'3\', \'chrome\', null, 1, \'chat\', 0, \'page\')" />'+
					'<input type="button" value="china008" onclick="im_openWebchatWindow(\'4\', \'china008\', null, 1, \'chat\', 0, \'page\')" />'+
					'<input type="button" value="ie6" onclick="im_openWebchatWindow(\'5\', \'ie6\', null, 1, \'chat\', 0, \'page\')" />'+
					'<input type="button" value="ie7" onclick="im_openWebchatWindow(\'6\', \'ie7\', null, 1, \'chat\', 0, \'page\')" />'+
					'<input type="button" value="ie8" onclick="im_openWebchatWindow(\'7\', \'ie8\', null, 1, \'chat\', 0, \'page\')" />';
	}
})(window);

String.prototype.ntFormat = function() {
    var args = arguments, pattern = /%\d+/g;
    return this.replace(pattern,
    function(capture) {
        return args[capture.match(/\d+/)];
    });
};
NtUtil = {};
NtUtil.saveValue = function(userId, key, value){
	var impresenceflash = __$('impresenceflash');
	if( impresenceflash && impresenceflash.write ){
		impresenceflash.write(userId, key, value);
	}
};
NtUtil.loadValue = function(userId, key){
	var impresenceflash = __$('impresenceflash');
	if( impresenceflash && impresenceflash.write ){
		return impresenceflash.read(userId, key);
	}
	return '';
};
NtUtil.scrollWidth = function(){
	var _doc = document, _body = _doc.documentElement || _doc.body;
	if(__B.ie6 && document.getElementsByTagName('body')[0].currentStyle["overflowY"] == 'hidden'){
		return 18;
	}else if( ( !__B.msie && _body.scrollHeight>__D.windowRect().h) || __B.mozilla && _doc.defaultView.getComputedStyle(_doc.getElementsByTagName('html')[0], null)["overflowY"]=="scroll"){
		return 18;
	}else if(__B.ie6){
		return 2;
	}else{
		return 1;
	}
};
NtUtil.disposeFlashObj = function(flashObj){
	if(!flashObj || !__B.ie)
		return;
	for(var id in flashObj){
		if(typeof(flashObj[id]) == "function"){
			if(__B.ie){
				eval("flashObj."+id+"=null");
			}
		}
	}
};
NtUtil.onlyOne = function(key, dtyp, timer){
	if(__Cookie.get(key)==="1"){
		return false;
	}else{
		var d = new Date(), od = new Date();
		switch(dtyp){
			//2010-12-10 新增规则，一天是指当天中午12点至第二天中午12点
			case "nd":
				if(d.getHours()<12 ){
					//Cookie至12点过期
					d.setDate(d.getDate());d.setHours(12);d.setMinutes(0);d.setSeconds(0);
				}else{
					//Cookie至第二天12点过期
					d.setDate(d.getDate() + timer);d.setHours(12);d.setMinutes(0);d.setSeconds(0);
				}
				break;
			case "d": d.setDate(d.getDate() + timer);d.setHours(0);d.setMinutes(0);d.setSeconds(0);break;
			case "h": d.setHours(d.getHours() + timer);d.setMinutes(0);d.setSeconds(0);break;
			case "m": d.setMinutes(d.getMinutes() + timer);d.setSeconds(0);break;
			case "s": d.setSeconds(d.getSeconds() + timer);break;
			default : __Cookie.set(key, "1"); return;
		}
		var t = d.getTime() - od.getTime();
		__Cookie.set(key, "1", t);
		return true;
	}
};
NtUtil.Flash = {
	create: function(src, parentElement, id, w, h, fvars, params, attr){
	    var swf, param, strflashvars = '';
	    for(k in fvars)
	    {
	    	if( typeof fvars[k] != 'string' ) continue;
	    	strflashvars += k + '=' + fvars[k] + '&'
	    }
	    if( __D.msie ){
		    swf = document.createElement("object");
		    swf.setAttribute("classid", "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000");
		    swf.setAttribute("codebase", "http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28");
		    swf.setAttribute("data", src);
		    
		    param = document.createElement("param");
		    param.setAttribute("name","movie");
		    param.setAttribute("value",src);
		    param = document.createElement("param");
		    param.setAttribute("name","flashvars");
		    param.setAttribute("value", strflashvars);
		    for(k in params )
		    {
		    	if( typeof params[k] != 'string' ) continue;
		    	var param=document.createElement("param");
		    	param.setAttribute("name", k);
		        param.setAttribute("value", params[k]);
		        swf.appendChild(param);
		    }
		    for(k in attr)
		    {
		    	if( typeof attr[k] != 'string' ) continue;
		    	swf.setAttribute(k, attr[k]);
		    }
		    swf.appendChild(param);
		}else{
			swf = document.createElement("embed");
		    swf.setAttribute("type","application/x-shockwave-flash");
		    swf.src = src;
		    swf.setAttribute("flashvars", strflashvars);
		    for(k in params)
		    {
		    	if( typeof params[k] != 'string' ) continue;
		    	swf.setAttribute(k, params[k]);
		    }
		    for(k in attr)
		    {
		    	if( typeof attr[k] != 'string' ) continue;
		    	swf.setAttribute(k, attr[k]);
		    }
		}
		parentElement.appendChild(swf);
		swf.setAttribute("width", w);
	    swf.setAttribute("height", h);
	    swf.setAttribute("name", id);
	    if(id) swf.id = id;
	    return swf;
	},
	PlayerVersion: function(versions){
		return {
			major: parseInt(versions[0]) || 0,
		    minor: parseInt(versions[1]) || 0,
		    rev: parseInt(versions[2]) || 0
		}
	},
	getPlayerVersion: function(_1c, _1d) {
	    var rVersion = this.PlayerVersion([0, 0, 0]);
	    if (navigator.plugins && navigator.mimeTypes.length) {
	        var x = navigator.plugins["Shockwave Flash"];
	        if (x && x.description) {
	            rVersion = this.PlayerVersion(x.description.replace(/([a-z]|[A-Z]|\s)+/, "").replace(/(\s+r|\s+b[0-9]+)/, ".").split("."));
	        }
	    } else {
	        try {
	            var axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
	            for (var i = 3; axo != null; i++) {
	                axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash." + i);
	                rVersion = this.PlayerVersion([i, 0, 0]);
	            }
	        } catch(e) {}
	        if (rVersion.major > 0) {
	            return rVersion;
	        }else{
	        	try {
	                rVersion = this.PlayerVersion(axo.GetVariable("$version").split(" ")[1].split(","));
	            } catch(e) {}
	        }
	    }
	    return rVersion;
	}
};

function im_connectIM(siteid, userid, username, sessionid, userparam, customParams, param1, param2){
	var _C = Ntalker.Config, _DIR, 
		_CP = Ntalker.Config.customparams,
		_V = Ntalker.variable;
	DEBUG('im_connectIM start');
	Ntalker.temp.pageId = String(new Date().getHours()) + String(new Date().getMinutes()) + String(new Date().getUTCSeconds()) + String(Math.floor(Math.random()*100));
	_V['siteid']	= siteid;
	_V['user_id']   = userid;
	_V['user_name'] = username;
	_V['user_sid']  = sessionid;
	_V['userparam'] = userparam;
	if( siteid == 'ntalkerpreview' && customParams['previewsiteid'] ){
		var configJsURL = _V['scriptPath'] + "/configjs/config_"+customParams['previewsiteid']+".js?rnd="+new Date().getTime();
	}else{
		var configJsURL = _V['scriptPath'] + "/configjs/config_"+siteid+".js";
	}
	
	//_V['scriptPath']
	DEBUG("im_connectIM <b>create load configjs before</b>>");
	__C.load({
		src: configJsURL,
		charset: 'utf-8',
		async: true
	}, false, function(){
		DEBUG('loaded configJs');
		if( typeof Ntalker_Config=='undefined' ){
			_C['IMWidth'] = 248;
			_C['IMHeight'] = 531;
			_C['chatWidth'] = 384;
			_C['chatHeight'] = 416;
			_C['groupWidth'] = 460;
			_C['groupHeight'] = 531;
			_C['skin'] = "hue=0";
			_C['bColor'] = "#86D09C";
			_C['bgColor'] = "#B7DDC4";
			_C['imagesDIR'] = _C['publicDIR'] + "ntalker_skin1/";
			_C['customDIR'] = _C['services'] + siteid+"/";
			_C['logo'] = _C['publicDIR'] + "buddylistlogo."+(__B.ie6 ? 'gif' : 'png');
			_C['groupstartlogo']= _C['publicDIR'] + "/group."+(__B.ie6 ? 'gif' : 'png');
			_C['buddylistlogo']= "/buddylistlogo.png";
			_C['nquanlogo'] = "/nquanlogo.png";
			_C['grouplogo'] ="/nquanlogo.png";
			_C['chatroomlogo'] = "/nquanlogo.png";
			_C['startlogo'] = _C['publicDIR'] + '%1.' + (__B.ie6?'gif':'png');
			_C['customparams'] = {
				lstupdated: new Date().getTime(),
				intact: 0,
				hiddenmode: 0,
				sys_enableguest: 1,
				introbuddy: 1,
				onlinelist: 1,
				disablegrouptip: 0,
				search: 1,
				avroom: 0,
				entrytype: "toolbar",
				imversion: "1.0",
				order: "1",
				roomtype: 0,
				localeChain: "zh_CN",
				siteurl: "http://www.ntalker.com",
				enablebuddyentry: 1,
				showmode: "show",
				build: "",
				favicon: "",
				enablegroup: 0,
				enableroom: 1,
				softwaretype: "other",
				quanflag:1
			};
		}else{
			var cfg = Ntalker_Config;
			var skinConfig = [[]];
			skinConfig.push(['#86D09C', '#B5DDC3', 'hue=0']);
			skinConfig.push(['#B9CCEC', '#DCDFEA', 'hue=92.92']);
			skinConfig.push(['#C3C6D5', '#D8E4E7', 'hue=101.19,saturation=0.75']);
			skinConfig.push(['#E3BFEF', '#DFD4E5', 'light=-13.78,hue=164.07']);
			skinConfig.push(['#DCD3AC', '#E5E0D5', 'hue=-79.78,light=9.26']);
			skinConfig.push(['#D4C1EA', '#D6D3E4', 'hue=149.96']);
			skinConfig.push(['#D5D5D5', '#C9C9C9', 'saturation=0']);
			skinConfig.push(['#BCDCB5', '#E0E6D6', 'hue=-22.5,light=10.61']);
			skinConfig.push(['#B0DDD6', '#D5E5E1', 'hue=36.73']);
			skinConfig.push(['#E9C5B7', '#E4D3D3', 'hue=-114.81']);
			skinConfig.push(['#bad3f2', '#dff3fc', 'saturation=1.34,hue=65']);
			_C['customDIR'] = _C['services'] + "/images/" + siteid+"/";
			if( cfg['dir'] ){
				_DIR = cfg['dir'];
				_C['imagesDIR'] = _C['publicDIR'] + _DIR;
			}else{
				_DIR = siteid+"/";
				_C['imagesDIR'] = _C['services'] + _DIR;
			}
			for(var i=1; i<skinConfig.length; i++){
				if( cfg["skin"] == 'ntalker_skin'+i ){
					_C['bColor'] = skinConfig[i][0];
					_C['bgColor'] = skinConfig[i][1];
					_C['skin'] = skinConfig[i][2];
				}else if( cfg["skin"] == skinConfig[i][2] ){
					_C['bColor'] = skinConfig[i][0];
					_C['bgColor'] = skinConfig[i][1];
					_C['skin'] = skinConfig[i][2];
				}
			}
			if( cfg['config'] ){
				_C['customparams'] = cfg['config'];
			}
			if( _C['customparams'] ){
				_C['IMWidth'] = _C['customparams']['IMWidth'];
				_C['IMHeight'] = _C['customparams']['IMHeight'];
				_C['chatWidth'] = _C['customparams']['chatWidth'];
				_C['chatHeight'] = _C['customparams']['chatHeight'];
				_C['groupWidth'] = _C['customparams']['groupWidth'];
				_C['groupHeight'] = _C['customparams']['groupHeight'];
			}
			var _L = cfg['logo'];
			if( _L ){
				_C['buddylistlogo'] = _L['buddylistlogo'] ? (_C['customparams']['favicon'] ? _C['customparams']['favicon'] : siteid+"/logo_big.png") : "/buddylistlogo.png";
				_C['chatlogo'] = _L['chatlogo'] ? siteid+"/logo_small.png" :  "/buddylistlogo.png";
				_C['nquanlogo'] = _L['nquanlogo'] ? siteid+"/nquanlogo.png" : "/nquanlogo.png";
				_C['grouplogo'] = _L['grouplogo'] ? siteid+"/grouplogo.png" : "/nquanlogo.png";
				_C['chatroomlogo'] = _L['chatroomlogo'] ? siteid+"/chatroomlogo.png":"/nquanlogo.png";
				if( !_L['buddylistlogo'] ){
					_C['logo'] = _C['imagesDIR'] + "buddylistlogo." + (__B.ie6 ? 'gif' : 'png');
				}else if( _C['customparams']['favicon'] ){
					_C['logo'] = _C['services'] + "/images/" + _C['customparams']['favicon'];
				}else{
					_C['logo'] = _C['customDIR'] + "/logo_big.png";
				}
			}
			_C['startlogo'] = _L['startlogo'] ? _C['customDIR']+'%1.png' : _C['publicDIR']+'%1.'+(__B.ie6?'gif':'png');
			_C['groupstartlogo']= _C['publicDIR'] + "/group."+(__B.ie6 ? 'gif' : 'png');
			if( cfg['customButtons'] ){
				_C['customtoolbarButtons'] = cfg['customButtons'];
			}
			var _B = _C['customtoolbarButtons'];
			for(var k in _B){
				if(typeof(k)=="string" && _B[k] && _B[k].style){
					_B[k].style = sprintf(_B[k].style, _C.services + "/images/");
				}
				if(typeof(k)=="string" && _B[k] && _B[k].url){
					_B[k].url = sprintf(_B[k].url, _V['user_id'], _V['user_name']);
				}
			}
			var _A = _C['application'] = cfg['application'];
			for(var k in _A){
				_A[k]['ico'] = sprintf(_A[k]['ico'], _C.services + "/images/");
				//2010-8-30
				//为兼容繁体版，应用文本替换
				if( gLang[NtLanguage]['ApplicationName'][k] ){
				    _A[k]['name'] = gLang[NtLanguage]['ApplicationName'][k];
				}
				//应用图标缓存
				_A[k]['image'] = new __IMG(_C['publicDIR'] + _A[k]['ico']);
			}
			Ntalker['traing'] = new __IMG(_C['publicDIR'] + 'traing_icon.gif');
		}
		
		__C.load({tagName:'link',rel:'stylesheet',media:'screen',href:_C['imagesDIR']+'/chat.css'}, false, null, true);
		_C['customparams']['localeChain'] = NtLanguage;
		NtLang = gLang[_C['customparams']['localeChain']];
		
		//载入网站管理员自定义设置
		if(typeof customParams=='object'){
			for(var k in customParams){
				Ntalker.Config.customparams[k] = customParams[k];
			}
		}
		DEBUG("im_connectIM get customParams");
		im_runPresence(_V['userparam'], _V['siteid'], _V['user_id'], _V['user_name'], _V['user_sid'], '', '', _CP);
		DEBUG("im_connectIM complete");
		if( typeof(page_start_time) != 'undefined' ) DEBUG('body start to toolbar end execute time=' + (parseInt(new Date().getTime()) - parseInt(page_start_time)), 1);
	});
}
function im_runPresence(userparam, siteid, userid, username, sessionid, flashserver, webchatpageurl, customParams) {
	var _C = Ntalker.Config,
		_CP = Ntalker.Config.customparams,
		_V = Ntalker.variable;
	
	//验证是否是会员,非会员且已打开游客模式时,分配临时帐号
	if( userid=='0' || userid==0 || userid=='' || sessionid=='' || typeof(userid)=='undefined' ){
		if( !_CP["sys_enableguest"] ){
			//未登录且未开启游客模式
			return;
		}
		var userNO = __Cookie.get(Ntalker.guestUserNoKEY);
		if(!userNO || userNO===null){
			var t = String(new Date().getTime());
			userNO = t.substr(t.length-8,8) + Math.round(Math.random()*1000);
			userid = NtLang['userIdHead']   + userNO;
			username = NtLang['userNameHead'] + userNO;
		}else{
			userid = NtLang['userIdHead']   + userNO;
			username = NtLang['userNameHead'] + userNO;
		}
		sessionid = NtLang['guestSessionId'];
		__Cookie.set(Ntalker.guestUserNoKEY, userNO, 1000*3600*24*7);
		_V['user_id'] = userid;
		_V['user_name'] = username;
		_V['user_sid'] = sessionid;
	}
	DEBUG("im_connectIM loaded configjs variable>");
	if( userid && sessionid ){
		__C.load({
			tagName: 'link',
			href: _C['imagesDIR'] + NtLang['sheetFileName']
		}, false,
		function(){
			Ntalker.temp.cssLoaded = true;
		});
	}
	DEBUG("im_connectIM create css element>");
	if( !username || username=='' ){
		_V['user_name'] = 'name';
	}
	DEBUG("im_runPresence get user info complete>");
	__E.addEvent(window, "unload", im_onUnload);
	im_myIMWindow = new  Ntalker.IMWindow();
	im_myIMWindow.init();
	chatWindowManager = new Ntalker.ChatWindowManager();
	window.chatWindowManager = chatWindowManager;
	DEBUG("im_runPresence <b>create toolbar before</b>");
	if(_V['user_sid'] && _V['user_name'] && _V['user_id'] && !_C['customparams'].hiddenmode){
		_CP['showmode'] = _CP['showmode'] == 'hidden' ? 'hidden' : 'show';
		IMToolBar = new ntToolbar();
		IMToolBar.init();
	}
	DEBUG("im_runPresence <b>create toolbar complete</b>");
	createGestFlashConnet(siteid);
}
function sprintf() {
	if (!arguments || arguments.length < 1 || !RegExp || !arguments[0]) {
		return
	}
	var b = arguments[0], l = arguments.length;
	for (var a = 1;a < l;a++) {
		b = b.replace(new RegExp("%" + a, "g"), (arguments[a] || "").toString() );
	}
	return b;
}
function searchTag(target, tagName){
	if(!tagName || !target) return target;
	while((target.nodeType!=1 || target.tagName.toLowerCase() != tagName.toLowerCase()) && target.parentNode){ target = target.parentNode;}
	return target;
}
function createGestFlashConnet(siteid){
	var flashvars = [], _C = Ntalker.Config,
		_CP= Ntalker.Config.customparams,
		_V = Ntalker.variable;
	_V['siteid'] = siteid;
	flashvars.push("siteid=" + siteid);
	flashvars.push('&rurl=' + _V['scriptPath']);
	flashvars.push('&surl=' + _C['services']);
	flashvars.push('&pageId=' + Ntalker.temp.pageId);
	flashvars.push('&u=' + encodeURIComponent(_V['user_id']));
	flashvars.push('&n=' + encodeURIComponent(_V['user_name']));
	flashvars.push('&s=' + encodeURIComponent(_V['user_sid']));
	flashvars.push('&p=' + _V['userparam']);
	flashvars.push('&localeChain=' + _CP['localeChain']);
	flashvars.push('&lst=' + _CP['lstupdated']);
	var flashurl  = _V['scriptPath']+"/fs/impresence.swf?version=" + Ntalker.version.presence_flash;
	var flashnode = [];
	flashnode.push('<div id=\"wdk_mini_state\" style=\"display:none;\"></div>');
	flashnode.push('<div id="im_presence_div" style=\"position:absolute;z-index:9996; top: -200px;\">');
	if(__B.ie){
		flashnode.push('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28" ');
		flashnode.push(' id="impresenceflash" width="1" height="1"> ');
		flashnode.push(	'<param name="movie" value="'+flashurl+'" /> ');
		flashnode.push(	'<param name="allowscriptaccess" value="always" /> ');
		flashnode.push(	'<param name="flashvars" value="'+flashvars.join('')+'" /> ');
		flashnode.push('</object>');
	}
	else{
		flashnode.push(	'<embed src="' + flashurl + '" id="impresenceflash" width="1" height="1" flashvars="'+flashvars.join('')+'" allowscriptaccess="always" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" >');
		flashnode.push(	'</embed>');
	}
	flashnode.push('</div>');
	DEBUG("createGestFlashConnet <b>insert.before</b>>");
	__D.insert(document.body.firstChild, flashnode.join(''), 'beforebegin');
	DEBUG("createGestFlashConnet <b>insert.complete</b>>");
}
function StartGetUsersStatus(){
	DEBUG('<b>ready: StartGetUsersStatus</b>');
	Ntalker.temp.userSpanArray = new Array();
	var statusSpans = document.getElementsByTagName("SPAN"),
		spanindex = 0,
		_arrSpan = new Array(),
		strUserIDList = "", l = statusSpans.length;
	for(i = 0; i < l; i++){
		var statusSpan = statusSpans[i];
		if(statusSpan.className=="wdk_user_status_span" && statusSpan.id){
			pos = statusSpan.id.indexOf("wdk_user_");
			if(pos>=0){
				var newStatusObj = new Object();
				newStatusObj.destuid = statusSpan.id.substring(pos+"wdk_user_".length, statusSpan.id.length);
				newStatusObj.destnick = statusSpan.title;
				newStatusObj.spanElement = statusSpan;
				_arrSpan.push(newStatusObj);
				if(_arrSpan.length>1) strUserIDList += ",";
				strUserIDList += encodeURIComponent(newStatusObj.destuid);
			}
		}
	}
	var _presenceFlash = __$("impresenceflash");
	Ntalker.temp.userSpanArray = _arrSpan;
	if( Ntalker.Config.customparams["enablebuddyentry"]){
		if(_presenceFlash && _presenceFlash.requestUserStatus){
			_presenceFlash.requestUserStatus(strUserIDList, _arrSpan.length);
		}
	}
}
function StartGetGroupEntry() {
	var _C = Ntalker.Config, _CP= Ntalker.Config.customparams;
	var enablegroup = _CP['enablegroup'];
	var statusSpans = document.getElementsByTagName("SPAN");
	var spanindex = 0, l = statusSpans.length;
	for (i = 0; i < l; i++) {
		var statusSpan = statusSpans[i];
		if (statusSpan.className == "wdk_group_chat_span" && statusSpan.id) {
			var cursorGroupType = statusSpan.getAttribute("ischatroom");
			pos = statusSpan.id.indexOf("wdk_group_");
			if (pos >= 0 && cursorGroupType=="true" ) {
				var newGroupObj = new Object();
				newGroupObj.groupid   = statusSpan.id.substring(pos + "wdk_group_".length, statusSpan.id.length);
				newGroupObj.groupnick = __S.EncodeSpecialChar(statusSpan.title);
				newGroupObj.roomtype  = 0;
				  im_conncetChatRoom(newGroupObj.groupid, newGroupObj.groupnick);
				var tiptext = sprintf(NtLang['pageGroupsEntranceTip'][0], newGroupObj.groupnick);
				chatLinkStr = "<a  href=\"#\" target=\"_blank\" style=\"display:inline;padding-left:7px; overflow:hidden;\" alt=\"" + tiptext + "\"";
				chatLinkStr += " onClick=\"javascript: im_openWebchatWindow('" + newGroupObj.groupid + "', '" + newGroupObj.groupnick + "', null, 1, 'room', "+newGroupObj.roomtype+",'pageStateEntrance'); return false;\">";
				chatLinkStr += "<img name=\"wdk_presence_image\" tip=\"" + tiptext + "\" style=\"left:0px;top:0px;\" id=\"wdk_presence_" + newGroupObj.groupid + "\" border=\"0\" style=\"display:inline;";
				chatLinkStr += "\" src=\"" + _C['groupstartlogo'] + "\" title=\"" + tiptext + "\"/></a>";
				statusSpan.innerHTML = chatLinkStr;
			}else if(pos >= 0){
				var newGroupObj = new Object();
				newGroupObj.groupid   = statusSpan.id.substring(pos + "wdk_group_".length, statusSpan.id.length);
				newGroupObj.groupnick = __S.EncodeSpecialChar(statusSpan.title);
				var tiptext = sprintf(NtLang['pageGroupsEntranceTip'][1], newGroupObj.groupnick);
				chatLinkStr = "<a href=\"#\" target=\"_blank\" style=\"display:inline;padding-left:7px; overflow:hidden;\" alt=\"" + tiptext + "\"";
				chatLinkStr += " onClick=\"javascript: im_openWebchatWindow('" + newGroupObj.groupid + "', '" + newGroupObj.groupnick + "', null, 1, 'group',0,'pageStateEntrance'); return false;\">";
				chatLinkStr += "<img name=\"wdk_presence_image\" id=\"wdk_presence_" + newGroupObj.groupid + "\" border=\"0\" style=\"display:inline;";
				chatLinkStr += "\" src=\"" + _C['groupstartlogo'] + "\" title=\"" + tiptext + "\"/></a>";
				statusSpan.innerHTML = chatLinkStr;
				__$("wdk_presence_"+newGroupObj.groupid).onerror = function(){
					__$("wdk_presence_"+newGroupObj.groupid).onerror = null;
					__$("wdk_presence_"+newGroupObj.groupid).src = errsrc;
				};
				spanindex++;
			}
		}
	}
}
function JsIM_setHotFocusData(){
	var _C = Ntalker.Config,
		_V = Ntalker.variable;
	imHotFocusJsonp = typeof(imHotFocusJsonp)!='undefined' ? imHotFocusJsonp : typeof(jsonp)!='undefined' ? jsonp : null;
	if( !imHotFocusJsonp ){
		return;
	}
	var _cHt = ['<ul style="border-top:1px solid '+_C['bColor']+';">'];
	if( imHotFocusJsonp['newactivity'].length==0 ) _cHt.push('<li><a href="#">' + sprintf(NtLang['nullMessage'][1], '') + '</a></li>');
	for(var i=0; i < imHotFocusJsonp['newactivity'].length; i++ ){
		var item = imHotFocusJsonp['newactivity'][i];
		_cHt.push('<li><a href="' + item.url + '" target="_blank" title="' + item.title + '">' + __S.cut(item.title, 18, true) + '</a></li>');
	}
	_cHt.push('</ul>');
	if( __$('newactivity') ) __$('newactivity').innerHTML = _cHt.join('');
	_cHt = ['<ul style="border-top:1px solid '+_C['bColor']+';">'];
	if( imHotFocusJsonp.hotactivity.length==0 ) _cHt.push('<li><a href="#">' + sprintf(NtLang['nullMessage'][1], '') + '</a></li>');
	for(var i=0; i < imHotFocusJsonp.hotactivity.length; i++ ){
		var item = imHotFocusJsonp.hotactivity[i];
		_cHt.push('<li><a href="' + item.url + '" title="' + item.title + '">' + __S.cut(item.title, 18, true) + '</a></li>');
	}
	_cHt.push('</ul>');
	if( __$('hotactivity') ) __$('hotactivity').innerHTML = _cHt.join('');
}
function im_openWebchatWindow(destuid, destname, chatid, OpenType, chatType, roomtype, befrom){
	var _C = Ntalker.Config, _CP= Ntalker.Config.customparams, _V = Ntalker.variable;
	var OpenType = OpenType===true||OpenType===1 ? 1 : (OpenType===-1 ? -1 : 0);
	var chatType = /^(chat|group|room|nquan|traing)$/.test(chatType) ? chatType : 'chat';
	var roomtype = roomtype ? 1 : 0;
	var befrom = /^(groupList|feedMsgList|sysMsgList|groupMsgMenu)$/.test(befrom) ? befrom : 'groupList';
		im_openWebchatInPage(destuid, destname, chatid, OpenType, chatType, roomtype, '', befrom);
	if(IMToolBar && /^(group|room|nquan|traing)$/.test(chatType) && IMToolBar.removeGroupMessage){
		IMToolBar.removeGroupMessage('group' + destuid);
	}
}
function im_openWebchatInPage(destuid, destname, chatid, OpenType, chatType, roomtype, userinfo, befrom){
	var _C = Ntalker.Config, _V = Ntalker.variable;
	if(destuid==_V['user_id'] && !/^(group|room|nquan|traing)$/.test(chatType)){
		return;
	}
	if( !Ntalker.temp.chatDataFlashReady && chatType == 'chat' ){
		DEBUG('chatDataFlashReady = false');
		return;
	}
	return chatWindowManager.addChatWindow(destuid, destname, chatid, null, null, OpenType, chatType, roomtype, userinfo, befrom);
}
function im_openBuddyListWindow(OpenType, program){
	var _C = Ntalker.Config;
	setTimeout(function(){
		if( im_myIMWindow ){
			im_myIMWindow.showWindow();
		}else{
			alert(NtLang['buddylistNotLoginAlter']);
		}
	}, 100);
	return true;
}
function IMHashtable(){
	this._hash = new Object();  
	this.add = function(key,value){
		if(typeof(key)!="undefined"){
			if(this.contains(key)==false){
				this._hash[key]=typeof(value)=="undefined"?null:value;
				return true;
			}else {
				return false;
			}
		}else {
			return false;
		}
	};
	this.remove = function(key){delete this._hash[key];};
	this.count = function(){var i=0;for(var k in this._hash){i++;} return i;};
	this.items = function(key){return this._hash[key];};
	this.contains = function(key){ return typeof(this._hash[key])!= "undefined";};
	this.clear = function(){for(var k in this._hash){delete this._hash[k];}};
}
function im_showSiteMessage(siteMsgInfoArray)
{
	Ntalker.variable.ExMsg = [];
	for(var j=0; j<siteMsgInfoArray.length; j++){
		Ntalker.variable.ExMsg.push(siteMsgInfoArray[j]);
	}
	if(IMToolBar&&IMToolBar.countMessageBox){
		IMToolBar.countMessageBox("im",null,true);
	}
}
function im_myMenu(array){
	Ntalker.variable.myApp = array;
	return;
}
function im_openBuddyWindow(type){
	index = 0;
	switch(type){
		case "buddylist":index=0;break;
		case "onlinelist":index=1;break;
		case "grouplist":index=2;break;
		default:index=0;break;
	}	
	Ntalker.Config.IMtabIndex = index;
	if(im_myIMWindow&&IMToolBar&&IMToolBar.onShowBuddylist){
		IMToolBar.onShowBuddylist(null,index);
	}else{
		setTimeout(function(){im_openBuddyWindow(type);},3000);
	}
} 
function im_conncetChatRoom(roomid, roomname)
{
	if( !roomid || !roomname || Ntalker.room.exec) return;
	var presenceFlash = __$("impresenceflash");
	try{
		if(presenceFlash && typeof(presenceFlash.conncetChatRoom)!='undefined'){
			Ntalker.room.exec = true;
			presenceFlash.conncetChatRoom(Ntalker.variable.siteid, roomid, roomname);
		}
	}catch(e){}
}
function im_openHistoryChatWindow(){
	var _V = Ntalker.variable;
	if(_V['openHistoryWindow']) return;
		_V['openHistoryWindow'] = true;
	if(IMToolBar){
		if(IMToolBar.loadMessageBox){
			IMToolBar.loadMessageBox();
		}
	}
	var k = Ntalker['unKey'] + _V['user_id'];
	var cookieValue = __Cookie.get(k);
	__Cookie.del(k);
	if(!cookieValue) return;
	var currentUid = currentNick = currentChatType = "chat";
	cookieValue = cookieValue.replace(/{/g, "").split("}");
	for(var k in cookieValue){
		if( typeof(cookieValue[k]) != "string" || cookieValue[k] === '') continue; 
		if(IMToolBar && IMToolBar.onMaximize && IMToolBar._Pattern==1){
			IMToolBar.onMaximize();
		}
		chatWindow = __S.toArray(cookieValue[k]);
		if(typeof(chatWindow)=='undefined'|| !chatWindow) continue; 
		DEBUG('im_openWebchatWindow("'+chatWindow["uid"]+'", "'+chatWindow["nick"]+'", null, -1, "'+chatWindow["type"]+'")');
		im_openWebchatWindow(chatWindow["uid"], chatWindow["nick"], null, -1, chatWindow["type"]);
		_V['onlineChat'] -= 1;
		if(chatWindow["current"]=="default"){
			currentUid = chatWindow['uid'];
			currentNick = chatWindow['nick'];
			currentChatType = chatWindow['type'];
		}
	}
	if(chatWindowManager && Ntalker.Config.layout!='cascade'){
		if( Ntalker.variable['siteid'] == 'ntalkerpreview' ){
			DEBUG('<b>im_openHistoryChatWindow</b>');
			chatWindowManager.OnTBFocusWindow(currentUid, currentChatType, currentNick);
		}else{
			chatWindowManager.OnTBFocusWindow();
		}
	}
}
function im_onUnload(){
	var _V = Ntalker.variable;
	var _presenceFlashGoUrl = Ntalker.temp.presenceFlashGoUrl;
	var chatWins = chatWindowManager._chatWndsArray;
	var minWindow = IMToolBar.minWindows._hash; 
	var cookieValue = "";
	if(_V['user_id'] && chatWindowManager && chatWins.length>0 ){
		for(var i=0; i<chatWins.length; i++){
			if(/^(group|room|nquan)$/.test(chatWins[i]._chatType) && chatWins[i]._isFlashLoadSuccess){
				cookieValue += "{uid:" + chatWins[i]._destuid+";nick:"+chatWins[i]._destnick+";type:"+chatWins[i]._chatType+";current:"+chatWins[i]._curWindMode+";}";
			}
		}
		if(minWindow){
			for ( k in minWindow){
				var temp=minWindow[k];
				if(temp._chatType=="chat"){
					cookieValue+="{uid:" + temp._destuid+";nick:"+temp._destnick+";type:"+temp._chatType+";current:"+((temp._focus)?"default":"hide")+";}";
				}
			}
		}
		if(cookieValue){
			__Cookie.set(Ntalker['unKey']+_V['user_id'], cookieValue, 1000*3600*1);
		}
	}
	if(minWindow){
		for ( k in minWindow){
			var temp=minWindow[k];
			if(temp._chatType=="chat"){
				fIM_CloseChatWindow(temp._destuid, temp._chatType);
			}
		}
	}
	if(IMToolBar){
		if( IMToolBar.saveMessageBox ){
			IMToolBar.saveMessageBox();
		}
	}
	if(_presenceFlashGoUrl){
		__C.load({src:_presenceFlashGoUrl});
	}
	if(chatWindowManager) chatWindowManager.closeAll();
	if(im_myIMWindow) im_myIMWindow.close();
	var flashobj = __$('impresenceflash');
	if(flashobj){
		if(flashobj.closePresence) flashobj.closePresence();
		NtUtil.disposeFlashObj(flashobj);
		flashobj.parentNode.removeChild(flashobj);
	}
}
function fIM_presenceFlashReady(){
	setTimeout(function(){
		if( Ntalker.temp.ready ){
			StartGetUsersStatus();
			StartGetGroupEntry();
		}
		Ntalker.temp.ready = true;
		if(__$("impresenceflash") && __$("impresenceflash").setPageFocus){
			__$("impresenceflash").setPageFocus(true);
		}
	}, 50);
	return true;
}
function fIM_chatDataFlashReady(){
	Ntalker.temp.chatDataFlashReady = true;
}
function fIM_setPackageVersion(packageVersion, bbsType, hotserver){
	var _C = Ntalker.Config,
		_V = Ntalker.variable;
	if( !hotserver ){
		DEBUG('function:: hotserver is null');
		return;
	}
	else{
		DEBUG('function:: hotserver = ' + hotserver);
		_C['hotserver'] = hotserver;
		if( _C['waitRetuenHotService'] ){
			url = _C['hotserver'] + '?query=siteactivity&siteid=' + _V['siteid'] + '&uid=' + _V['user_id'] + '&sid=' + _V['user_sid'] + '&maxnum=7&cachemode=true' ;
			__C.load({src: url}, false, JsIM_setHotFocusData);
		}
	}
	return;
}
function fIM_onGetUserStatus(responseText){
	var _C = Ntalker.Config,
		_CP= Ntalker.Config.customparams,
		_V = Ntalker.variable;
	var _temp= Ntalker.temp;
	if(responseText=="-1" || responseText=="-2" || _CP["hiddenmode"])
		return;
	var userStatusArray = responseText.split(",");
	var l = _temp.userSpanArray.length;
	for(i = 0;i < l; i++){
		var imgsrc = errsrc = '';
		switch(userStatusArray[i]){
		case "0":
			imgsrc = sprintf(_C['startlogo'], "offline");
			errsrc = _C['publicDIR'] + "/offline."+(__B.ie6?"gif":"png");
			break;
		case "1":
			imgsrc = sprintf(_C['startlogo'], "online");
			errsrc = _C['publicDIR'] + "/online."+(__B.ie6?"gif":"png");
			break;
		}
		chatLinkStr =  ' <a  href="javascript:void(0);" style="display:inline;padding:0px;overflow:visible;" alt="' + NtLang['pageStatusTip'] + '"';
		chatLinkStr += "onClick=\"javascript: im_openWebchatWindow('" + _temp.userSpanArray[i].destuid+"', '" + _temp.userSpanArray[i].destnick + "', null, 1, 'chat',0,'pageStateEntrance'); return false;\" >";
		chatLinkStr += '<img name="wdk_presence_image" style="display:inline;left:0px;top:0px;" id="wdk_presence_'+_temp.userSpanArray[i].destuid+'" border="0" src="'+imgsrc+'" />';
		chatLinkStr += '</a>';
		_temp.userSpanArray[i].spanElement.style.border = '';
		_temp.userSpanArray[i].spanElement.innerHTML = chatLinkStr;
		var spanId = "wdk_presence_"+_temp.userSpanArray[i].destuid;
		__$(spanId).onerror = function(){
			__$(spanId).onerror = null;
			__$(spanId).src = errsrc;
		};
	}
}
function fIM_readCookie(userId, key, value){
	var _CP = Ntalker.Config.customparams;
	switch(key){
		case Ntalker['ctKEY']:
			var strSystemMessage = value;
			if( strSystemMessage == null || strSystemMessage == '' ){
				return;
			}
			var jsonSystemMessage = __J.parseJSON(strSystemMessage);
			for(var k in jsonSystemMessage){
				if( typeof(jsonSystemMessage[k]) != 'object' ) continue;
				var JSON = jsonSystemMessage[k];
				try{
					if( IMToolBar && IMToolBar.addMessageBox ){
						IMToolBar.addMessageBox(JSON.id, JSON.name, JSON.content, JSON.opentype, JSON.iconurl, JSON.msgtype,JSON.activitytype,JSON.activityid,JSON.activityname,JSON.activityicon,JSON.profileurl,JSON.chatid,JSON.isRead,JSON.msgid,JSON.srcuid,JSON.msgtime,JSON.chatsid);
					}
				}catch(e){
				}
			}
			break;
		case Ntalker['gpKEY']:
			var strGroupMessage = value;
			if( strGroupMessage == null || strGroupMessage == '' ){
				return;
			}
			var jsonGroupMessage = __J.parseJSON(strGroupMessage);
			for(var k in jsonGroupMessage){
				var JSON = jsonGroupMessage[k];
				IMToolBar&&JSON.groupid && IMToolBar.addGroupMessage(JSON.groupid, JSON.groupname, '', '', '', JSON.chattype);
			}
			break;
	}
	NtUtil.saveValue(userId, key, null);
}
function fIM_setConfiguration(strJson){
	if( IMToolBar ){
		IMToolBar.loadConfiguration(strJson);
	}
}
function fIM_presenceSetMyClientID(flashGoUrl){
	Ntalker.temp.presenceFlashGoUrl = flashGoUrl;
}
function fIM_presenceSetIMSid(imsid){
	Ntalker.variable.imsid = imsid;
}
function fIM_onPresenceReceiveChatMsg(destuid, destnick, wid, flashserver, message, chatid, isNotify, isMyFriend, isOnlineMsg, logoUrl, chatsid){
	var _C = Ntalker.Config,
		_CP= Ntalker.Config.customparams,
		_V = Ntalker.variable;
	if(isMyFriend!=2 && _CP["ignoreChatInvite"])
		return;
	if(isNotify){
		if( IMToolBar && IMToolBar.addMessageBox ){
			IMToolBar.addMessageBox(destuid,destnick,destnick+NtLang['requestChat'][0],"chat",logoUrl,"request","","","","","",chatid,false,'','','',(chatid?chatid:""));
		}
	}else{
		var OpenType = isMyFriend==-1 ? 0 : 1;
		if(isOnlineMsg){
			if(_V['onlineChat']>=0){
				chatWindowManager.addChatWindow(destuid, destnick, chatid, message, logoUrl, OpenType, 'chat', 0);
				_V['onlineChat'] -= 1;
			}else if(IMToolBar && IMToolBar.addMessageBox){
				IMToolBar.addMessageBox(destuid,destnick,destnick+NtLang['requestChat'][0],"chat",logoUrl,"request","","","","","",chatid,false,'','','',(chatid?chatid:""));
			}
		}else{
			if(_V['offlineChatList'].length<6){
				chatWindowManager.addChatWindow(destuid, destnick, chatid, message, logoUrl, OpenType, 'chat', 0);
				var openOfflineChatWindow = true;
				for(var k in _V['offlineChatList']){
					if(_V['offlineChatList'][k][0]==destuid && _V['offlineChatList'][k][1]==destnick){
						openOfflineChatWindow = false; break;
					}
				}
				if(openOfflineChatWindow) {
					_V['offlineChatList'].push([destuid, destnick]);
				}
			}else{
				var openOfflineChatWindow = false;
				for(var k in _V['offlineChatList']){
					if(_V['offlineChatList'][k][0]==destuid && _V['offlineChatList'][k][1]==destnick){
						openOfflineChatWindow = true; break;
					}
				}
				if(!openOfflineChatWindow){
					if( IMToolBar && IMToolBar.addMessageBox ){
					IMToolBar.addMessageBox(destuid,destnick,destnick+NtLang['requestChat'][0],"chat",logoUrl,"request","","","","","",chatid,false,'','','',(chatid?chatid:""));
					}
				}
			}
		}
	}
	if(promptwindow){
		DEBUG('fIM_onPresenceReceiveChatMsg startPrompt');
		promptwindow.startPrompt(destnick, NtLang['requestChat'][1], true);
	}
	return true;
}
function fIM_OnPresenceReceiveGroupMsg( groupId, groupName, groupIcon, srcuid, srcnick, msg, isNotify, chattype){
	var _CP = Ntalker.Config.customparams;
	if( (!_CP["enablegroup"] && !_CP["enableroom"]) || !groupId || groupId=="" ){
		return;
	}
	chattype = /^(room|group|nquan|traing)$/.test(chattype) ? chattype : 'group';
	if(IMToolBar && IMToolBar.addGroupMessage){
		IMToolBar.addGroupMessage(groupId, groupName, srcuid, srcnick, msg, chattype);
	}
}
function fIM_onPresenceReceiveAddFriend(destuid, destnick, logoUrl, bconfirm){
	if( bconfirm ){
		if(IMToolBar && IMToolBar.addMessageBox){
			IMToolBar.addMessageBox(destuid,destnick,destnick+NtLang['requestAddFriend'][1],"chat",logoUrl,"confirm","","","","","","",false,'','','','');
		}
		if(promptwindow){promptwindow.startPrompt(destnick, NtLang['requestAddFriend'][1], true);}
	}else{
		if(IMToolBar && IMToolBar.addMessageBox){
			IMToolBar.addMessageBox(destuid,destnick,destnick+NtLang['requestAddFriend'][0],"chat",logoUrl,"alert","","","","","","",false,'','','','');
		}
		if(promptwindow){promptwindow.startPrompt(destnick, NtLang['requestAddFriend'][0], true);}
	}
}
function fIM_onPresenceReceiveUserOnline(destuid, destnick, logoUrl){
	var _C = Ntalker.Config;
	if( im_myIMWindow.isShow || _C['customparams']['enableOnlineHint']===0 ){
		return;
	}
	NotifyManager.add(destuid, destnick, NtLang['onlineText'], 0, logoUrl, "online");
}
function fIM_updateUserHead(uid, src, intStatus, chatType){
	setTimeout(function(){
		var miniWin = IMToolBar.get(uid, chatType || 'chat');
		if(miniWin) miniWin.updateUserHead(src, intStatus);
	}, 50);
}
function fIM_updateUserStatus(statusValue, message){
	setTimeout(function(){
		if(statusValue>0 && statusValue<=4){
			im_openHistoryChatWindow();
		}
	}, 50);
}
function fIM_updateUserNumber(onlineUser, totalUser){
	DEBUG('fIM_updateUserNumber("'+onlineUser+'", "'+totalUser+'")');
	setTimeout(function(){
		if(IMToolBar && IMToolBar.updateUserNumber){
			IMToolBar.updateUserNumber(onlineUser, totalUser);
		}
		if( Ntalker.variable['siteid'] == 'ntalkerpreview' && Ntalker.temp['OpenBuddyListWindow'] != true){
			Ntalker.temp['OpenBuddyListWindow'] = true;
			setTimeout(function(){
				im_openBuddyListWindow(true);
			}, 800);
		}
	}, 50);
}
function fIM_reLoadFlash(destuid, chatType){
	if( destuid &&  chatType){
		if( chatWindowManager ){
			chatWindowManager.getChatWindow(destuid,chatType).reloadFlash();
		}
	}
	else{
		if(im_myIMWindow){
			im_myIMWindow.reloadFlash();
		}
	}
	return true;
}
function fIM_CloseIMWindow(){
	setTimeout(function(){
		if(im_myIMWindow) im_myIMWindow.minimize();
	}, 50);
	return true;
}
function fIM_CloseChatWindow(destuid, chatType){
	setTimeout(function(){
		if(chatWindowManager){
			var chatWin = chatWindowManager.getChatWindow(destuid,chatType);
			chatWin && chatWin.close(destuid, chatType);
		}
	}, 50);
}
function fIM_MinMaxChatWindow(destuid, chatType){
	var _CP = Ntalker.Config.customparams;
	
	if(chatWindowManager){
		chatWindowManager.getChatWindow(destuid, chatType).MinMax();
		try{
			IMToolBar.get(destuid, chatType).onBlur();
		}catch(e){}
	}
}
function fIM_setChatGoServer(freeChatFlashGoUrl, presenceFlashGoUrl, destuid, chatid, chatType){
	var chatWindow = chatWindowManager.getChatWindow(destuid, chatType);
	if(chatWindow){
		chatWindow._freeChatFlashGoUrl = freeChatFlashGoUrl;
		chatWindow._presenceFlashGoUrl = presenceFlashGoUrl;
		chatWindow._chatid = chatid;
	}
}
function fIM_buddylistFlashInitialization(){
	return true;
}
function fIM_buddylistFlashReady(){
	var buddylistFlash = document.getElementById("wdk_buddylist_flash"),
		_V = Ntalker.variable;
	if(buddylistFlash && buddylistFlash.setBuddylistFlashParam){
		buddylistFlash.setBuddylistFlashParam(_V['user_sid'], _V['user_id'], _V['user_name'], _V['siteid'],"buddylist");
	}
	if(im_myIMWindow){
		im_myIMWindow.onFlashLoadSuccess();
	}
}
function fIM_webchatFlashInitialization(destuid, chatType){
	return true;
}
function fIM_webchatFlashReady(destuid, chatType){
	var chatWindow = chatWindowManager.getChatWindow(destuid, chatType);
	if(chatWindow){
		chatWindow.onFlashLoadSuccess();
	}
	return true;
}
function fIM_webchatDataModReady(){
	Ntalker.temp.webchatDataModReady = true;
	var current_minTag = Ntalker.temp.current_tag;
	var minWindow = IMToolBar.get(current_minTag[0], current_minTag[1]);
	var countMinWnd = 0, minWindows = IMToolBar.minWindows._hash;
	for ( k in minWindows){
		if(minWindows[k]._chatType == "chat"){
			countMinWnd ++;
		}
	}
	if( countMinWnd <=1 || !minWindow )
		return;
	setTimeout(function(){
		IMToolBar.focusTag(minWindow._destuid, minWindow._chatType);
	}, 50);
}
function fIM_setBuddylistFlashParamfunc(){
	var buddylistFlash = document.getElementById("wdk_buddylist_flash"),
		_V = Ntalker.variable;
	if(buddylistFlash && buddylistFlash.setBuddylistFlashParam){
	  buddylistFlash.setBuddylistFlashParam(_V['user_sid'], _V['user_id'], _V['user_name'], _V['siteid'], "buddylist");
	}
}
function fIM_onGetChatroomStatus(chatroominfo)
{
	if(typeof(chatroominfo) == "string")
		chatroominfo   = eval('('+chatroominfo+')');
	var parentNode = __$("wdk_group_"+chatroominfo.roomid);
	if( parentNode && parentNode.className=="wdk_group_chat_span" && parentNode.innerHTML != "")
		var parentNodeId = "wdk_group_"+chatroominfo.roomid;
}
function fIM_OnFlashFocus()
{
	if(promptwindow) promptwindow.handleFocus();
}
function fIM_OnFlashBlur()
{
	if(promptwindow) promptwindow.handleBlur();
}
function fIM_onWebchatReceiveChatMsg(destuid, destnick, message, chatType, chatid){
	chatType = /^(group|room|nquan|traing)$/.test(chatType) ? chatType : 'chat';
	if(promptwindow){
		DEBUG('fIM_onWebchatReceiveChatMsg startPrompt');
		var flashTitle = /^(group|room|nquan|traing)$/.test(chatType) ? NtLang['requestChat'][3] : NtLang['requestChat'][2];
		promptwindow.startPrompt(destnick, flashTitle, true);
		if(typeof(chatWindowManager) != "undefined"){
			if( chatType == 'chat' ){
				var miniWindow = IMToolBar.get(destuid, chatType);
				if( miniWindow ){
					miniWindow.onReceiveMiniMessage(message);
				}else{
				}
			}else{
				var chatWindow = chatWindowManager.getChatWindow(destuid, chatType);
				if(chatWindow) chatWindow.onReceiveMessage(message);
			}
		}
	}
}
function fIM_onWebchatReceiveEvent(destuid, destnick, eventname, eventcontent){
	if(promptwindow) promptwindow.startPrompt(destnick, eventcontent, true);
	var chatType = "chat";
	if(eventname=="DestOpenWindow" && IMToolBar){
		var miniWindow = IMToolBar.getMiniWindow(destuid, chatType);
		miniWindow.onReceiveMiniMessage(eventcontent);
	}
}
//------------------------------------------------------------------------------
// tChat 通信相关函数
// -----------------------------------------------------------------------------
function fIM_tchatFlashReady(destuid, chattype, userid)
//
{
	DEBUG('fIM_tchatFlashReady("'+destuid+'", "'+chattype+'", "'+userid+'")');
	setTimeout(function(){
		var chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, chattype) : null;
		if(chatWin) chatWin._tchatReady = true;
	}, 10);
	return true;
}
function fIM_onGetFlashServer(destuid, chattype, historicalMsgUrl, checkURL, avServer, manageServer, fileServer){
	DEBUG('fIM_onGetFlashServer(...)', 1);
	window.setTimeout(function(){
		var chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, chattype) : null;
		if( chatWin ){
			//chatWin._serivce['profile'] = userInfoUrl;
			chatWin._serivce['historical'] = historicalMsgUrl;
			chatWin._serivce['avserver'] = avServer;
			chatWin._serivce['fileserver'] = fileServer;
			chatWin.disable('toolbar .queryrecord', false);
		}
		
		fJS_setUploadServer(destuid, 'uploadimage');
		fJS_setUploadServer(destuid, 'uploadfile');
	}, 10);
	return true;
}
function fIM_setChatGoServer(freeChatFlashGoUrl, presenceFlashGoUrl, destuid, chatid, chatType){
	DEBUG('fIM_setChatGoServer');
	Ntalker.freeChatFlashGoUrl = freeChatFlashGoUrl;
	Ntalker.presenceFlashGoUrl = presenceFlashGoUrl;
	return true;
}
function fIM_notifyUserNumbers(destuid, chattype, num){
	DEBUG('fIM_notifyUserNumbers("'+destuid+'", "'+chattype+'", '+num+')');
	setTimeout(function(){
		chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, chattype) : null;
		if( chatWin ){
			chatWin._destOpenWindow = num==2 ? true : false;
			chatWin.disable('.toolbar .audio', num==2 ? false : true);
			chatWin.disable('.toolbar .video', num==2 ? false : true);
		}
	}, 10);
	return true;
}
function getUserLngIdOrShortId(id)
{
	var _siteid = Ntalker.variable['siteid'];
	
	if( id.indexOf('_ISME9754_')>0 && id.indexOf(_siteid)!=-1 )
	{
		//current long id
		return id.split('_ISME9754_')[1];
	}else
	{
		//current short id
		return _siteid+'_ISME9754_'+id;
	}
}
function fIM_onGetMyUserInfo(type, destuid, chattype, jsonParam, msg){
	DEBUG('fIM_onGetMyUserInfo('+type+', "'+destuid+'", "'+chattype+'", "'+jsonParam+'", "'+msg+'")');
	setTimeout(function(){
		if( window['getMyUserInfo']===true ) return;
		window['getMyUserInfo'] = true;
		
		var jsonData, chatWin, chatType;
		jsonData = jsonParam.replace("\r","").replace("\n","").replace("\r\n","");
		try{
			jsonData = __J.parseJSON(jsonData);
			Ntalker.variable['JetLag'] = new Date().getTime() - jsonData.timesample
			chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, chattype) : null;
			chatWin.updateMyUserInfo(jsonData);
		}catch(e){
			DEBUG('my info to json:'+e.message, 3);
		}
	}, 0);
	return true;
}
function fIM_onGetDestUserInfo(destuid, chattype, jsonParam){
	DEBUG('fIM_onGetDestUserInfo("'+destuid+'", "'+chattype+'", "'+jsonParam+'")');
	setTimeout(function(){
		var chatWin, chatType,
			jsonData = jsonParam.replace("\r","").replace("\n","").replace("\r\n","")
		;
		try{
			jsonData = __J.parseJSON(jsonData);
			chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, chattype) : null;
			if( chatWin ) chatWin.updataDestUserInfo(jsonData);
		}catch(e){
			DEBUG('dest info to json:'+e.message, 3);
		}
		//Ntalker.IMChat.setDestInfo(jsonData);
	}, 10);
	return true;
}
function fIM_receiveMessage(destuid, chattype, jsonParam){
	DEBUG('fIM_receiveMessage("'+destuid+'", "'+chattype+'", "'+jsonParam+'")');
	setTimeout(function(){
		var jsonData, chatWin;
		try{
			jsonData = __J.parseJSON(jsonParam);
			chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, chattype) : null;
			if( chatWin )chatWin.onReceiveMessage(jsonData);
		}catch(e){
			DEBUG('fIM_receiveMessage:'+e.message, 4);
		}
	}, 10);
	return true;
}
function fIM_receiveAV(destuid, chattype, type, state, jsonParam){
	DEBUG('fIM_receiveAV("'+destuid+'", "'+chattype+'", "'+type+'", "'+state+'", "'+jsonParam+'")');
	setTimeout(function(){
		var jsonData,
			chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, chattype) : null
		;
		chatWin && chatWin.receiveAV(type, state, (jsonParam ? __J.parseJSON(jsonParam) : null));
	}, 10);
	return true;
}
function fIM_returnMessages(destuid, chattype, result, time, msg){
	DEBUG('fIM_returnMessages("'+destuid+'", "'+chattype+'", "'+result+'", "'+time+'", "'+msg+'")');
	setTimeout(function(){
		var chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, chattype) : null;
		if( chatWin ){
			if( result ) chatWin.disable('.control .addbuddy', true);
			chatWin.showMessage({
				type: result ? 9 : 10,
				msg: msg
			});
		}
	}, 10);
	return true;
}
function fIM_isBlocks(destuid, chattype, isBlocked){
	DEBUG('fIM_isBlocks("'+destuid+'", "'+chattype+'", "'+isBlocked+'")');
	setTimeout(function(){
		var chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, chattype) : null;
		if( chatWin ){
			//if( isBlocked ) chatWin.disable('.control .refused', true);
			chatWin.showMessage({
				type: isBlocked ? 9 : 10,
				msg: isBlocked ? '已禁言' : '未禁言'
			});
		}
	}, 10);
	return true;
}
// -----------------------------------------------------------------------------
// 文件上传相关函数
// -----------------------------------------------------------------------------
function fIM_uploadFlashReady(destuid, action){
	var chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, 'chat') : null;
	chatWin._uploadReady[action] = true;
	
	if( chatWin._serivce['fileserver'] )
	{
		DEBUG('fIM_uploadFlashReady("'+destuid+'", "'+action+'")');
		fJS_setUploadServer(destuid, action);
	}
	return true;
}
function fJS_setUploadServer(destuid, action){
	DEBUG('fJS_setUploadServer("'+destuid+'", "'+action+'")');
	var chatWin;
	if(chatWindowManager) {
		chatWin = chatWindowManager.getChatWindow(destuid, 'chat');
	}
	if( !chatWin || chatWin._uploadReady[action] !== true || !chatWin._serivce['fileserver'] ) return;
	var uploadFlash = action=='uploadimage' ? chatWin._uploadImageFlash : chatWin._uploadFileFlash,
		selector = action=='uploadimage' ? '.toolbar .images' : '.toolbar .files'
	;
	
	try{
		uploadFlash.setUploadServer(chatWin._serivce['fileserver']);
		DEBUG('exec setUploadServer = ' + chatWin._serivce['fileserver']);
	}catch(e){
		DEBUG(e.message, 3);
	}
	chatWin.disable(selector, false);
	return true;
}
function fIM_uploadMouseOver(destuid, action)
{
	DEBUG('fIM_uploadMouseOver("'+destuid+'", "'+action+'")');
	
	setTimeout(function(){
		var chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, 'chat') : null,
			selector = '.toolbar .' + (action=='uploadimage' ? 'images' : 'files')
		;
		if( chatWin&&!chatWin.disable(selector) ) chatWin.overOut(selector, 'out', 'over');
	}, 10);
	return true;
}
function fIM_uploadMouseOut(destuid, action)
{
	DEBUG('fIM_uploadMouseOut("'+destuid+'", "'+action+'")');
	
	setTimeout(function(){
		var chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, 'chat') : null,
			selector = '.toolbar .' + (action=='uploadimage' ? 'images' : 'files')
		;
		if( chatWin&&!chatWin.disable(selector) ) chatWin.overOut(selector, 'over', 'out');
	}, 10);
	return true;
}
function fIM_receiveUploadProgress(destuid, type, intProgress)
//start send data
{
	DEBUG('fIM_receiveUploadProgress("'+destuid+'", "'+type+'", "'+intProgress+'")');
	
	return true;
}
function fIM_receiveUploadSuccess(destuid, type, jsonParam)
//send complete
{
	DEBUG('fIM_receiveUploadSuccess("'+destuid+'", "'+type+'", "'+jsonParam+'")');
	setTimeout(function(){
		try{
			var chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, 'chat') : null,
				jsonData = __J.parseJSON(jsonParam)
			;
		}catch(e){
			DEBUG(e.message, 4);
		}
		chatWin && chatWin.sendMessage(jsonData);
	}, 10);
	return true;
}
function fIM_receiveUploadFailure(destuid, type, strMsg)
//send failure
{
	DEBUG('fIM_receiveUploadFailure("'+destuid+'", "'+type+'", "'+strMsg+'")');
	setTimeout(function(){
		var chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, 'chat') : null;
		chatWin && chatWin.sendMessage({
			"type": 9,
			"msg": strMsg
		});
	}, 10);
	return true;
}
function OnGetItemInfo(jsonData)
//show info
{
	var num = jsonData.infos_getinfoid.summary.totalnum,
		list = jsonData.list[0],
		infoid = list['infoid'],
		chatWin = chatWindowManager ? chatWindowManager.proIDChatWindow(infoid) : null,
		html = []
	;
	if( num<=0 || !chatWin || !infoid ) return;
	chatWin.loadInfo(jsonData);
}
function IM_systemMessageReceiveAV(destuid, type, state, active)
{
	var chatWin = chatWindowManager ? chatWindowManager.getChatWindow(destuid, 'chat') : null;
	if( !chatWin ) return;
	chatWin.requestAV(type, state, active);
}

// -----------------------------------------------------------------------------
var NotifyManager = {
	_notifyWnds: new IMHashtable(),
	_NotifySPAN: __D.create('div', {id:"OnlineNotifyGroup"}, null, "afterbegin"),
	_maxNotify: 3,
	_width: 215,
	_height: 130,
	_bottom: 30,
	scroltimerID: null,
	addScrollEvent: false,
	checkonline:function(destuid, destname, type){
		var _Wnd, type = type? type:"online";;
		for(var k in this.showQueue._showList._hash){
			_Wnd = this.showQueue._showList.items(k);
			if(_Wnd.type=="online" && _Wnd.destuid==destuid && _Wnd.destname==destname) return true;
		}
		for(var k in this._notifyWnds._hash){
			_Wnd = this.get(k);
			if(_Wnd.type=="online" && _Wnd.destuid==destuid && _Wnd.destname==destname) return true;
		}
		return false;
	},
	clearonline:function(type){
		type = type ? type : "online";
		for(var k in this._notifyWnds._hash){
			if(this.get(k).type==type) this.remove(k);
		}
	},
	add: function(destuid, destname, message, chatid, headURL, type, BtnType, sendMsg){
		if(this.checkonline(destuid, destname, type)) return;
		var _V = Ntalker.variable;
		Ntalker.temp.notify_id++;
		var notifyWnd	 = new Object();
		notifyWnd.destuid = destuid;
		notifyWnd.destname= destname;
		notifyWnd.message = message;
		notifyWnd.chatid  = chatid;
		notifyWnd.logoUrl = headURL;
		notifyWnd.type	= type? type:"online";
		notifyWnd.BtnType = BtnType;
		notifyWnd.sendMsg = sendMsg;
		notifyWnd.userid  = _V['user_id'];
		if (!notifyWnd.userid)
			return;
		notifyWnd._curNotifyId  = 'Notify' + Ntalker.temp.notify_id + "TYPE" + notifyWnd.type;
		this._notifyWnds.add(notifyWnd._curNotifyId, notifyWnd);
		this.push();
	},
	remove: function(k){
		this._notifyWnds.remove(k);
	},
	get: function(k){
		return this._notifyWnds.items(k);
	},
	push:function(){
		var _sPush = false, _aPush = false;
		for(var k in this._notifyWnds._hash){
			var sLen = this.showQueue._showList.count();
			var aLen = this.alertQueue._showList.count();
			var _Wnd = this.get(k);
			if(sLen<this._maxNotify && !this.showQueue._showing && _Wnd.type=="online"){
				_sPush = true;
				this.showQueue.add(k, this.get(k));this.remove(k);
			}
			if(aLen<1 && !this.alertQueue._showing && _Wnd.type=="alert"){
				_aPush = true;
				this.alertQueue.add(k, this.get(k));this.remove(k);
			}
			if(_sPush && _aPush){break;}
		}
	},
	alertQueue:{
		_showList   : new IMHashtable(),
		_showing	: false,
		add: function(key, notifyWnd){
			var alertNotifys = __$$("div.ntalker_notify"),
				_C = Ntalker.Config,
				_CP= Ntalker.Config.customparams,
				_V = Ntalker.variable;
			for(var k in alertNotifys){
				if(alertNotifys[k].parentNode) alertNotifys[k].parentNode.removeChild(alertNotifys[k]);
			}
			if( /^(confirm|request)$/.test(notifyWnd.BtnType) || notifyWnd.type == 'alert') {
				IMToolBar && IMToolBar.focusTag();
			}
			this._showList.add(key, notifyWnd);
			var wRt = __D.windowRect();
			var _width, _height, className;
			if( notifyWnd.chattype === 'nquan' ){
				_width = 275;
				_height = 150;
				className = 'nt_notify_nquan';
			}else{
				_width = NotifyManager._width;
				_height = NotifyManager._height;
				className = 'nt_notify';
			}
			var _top = wRt.y + (wRt.h - _height)/2,
				_left = wRt.x + (wRt.w - _width)/2,
				_headURL = notifyWnd.logoUrl ? notifyWnd.logoUrl:_C['imagesDIR']+"notify_userhead.png",
				_errimg = _C['imagesDIR']+"notify_userhead.png";
			var _openChatWindow = function(){
				im_openWebchatWindow(notifyWnd.destuid, notifyWnd.destname, notifyWnd.chatid, 1, notifyWnd.chattype, 0, 'groupMsgMenu');
				NotifyManager.alertQueue.close( key, notifyWnd.BtnType, notifyWnd.type );
				IMToolBar.removeSystemMessage( notifyWnd.type + notifyWnd.destuid );
			};
			var _Ht = [];
			_Ht.push('<div id="' + key + '" class="ntalker_notify ' + className + '" style="z-index:2147483647;left:' + _left + 'px;top:' + _top + 'px;width:' + _width + 'px;height:' + _height + 'px;">');
			//标题栏
			_Ht.push(	'<div style="background: url(' + _C['logo'] + ') no-repeat 1px center;margin:8px 8px 0 8px;height:28px;padding:0;text-align:right;">');
			_Ht.push(		'<a href="javascript:NotifyManager.alertQueue.close(\''+key+'\', \'' + notifyWnd.BtnType+'\', \''+notifyWnd.type + '\');IMToolBar.removeSystemMessage(\'' + notifyWnd.type+notifyWnd.destuid + '\');" class="nt_close"></a>');
			_Ht.push(	'</div>');
			//图片
			_Ht.push(	'<div id="' + key + '_IMG" style="margin:10px 20px 0px 20px !imporant;margin-top:0px;margin-left:20px;cursor:pointer;">');
			_Ht.push(	'  <div style="margin:4px;background:#fff;width:65px;height:65px;float:left;"><img src="' + _headURL + '" style="width:61px;_width:60px;height:61px;_height:60px;border:1px solid #ccc;margin:1px;" /></div>');
			_Ht.push(	'  <br style="clear: both;" />');
			_Ht.push(	'</div>');
			_Ht.push(	'<div style="overflow: hidden; position: absolute; left: 95px; top: 40px; width: ' + (notifyWnd.chattype === 'nquan' ? 165 : 105) + 'px;color:#000000;font-size:12px;">');
			//内容
			if( notifyWnd.BtnType && notifyWnd.sendMsg )
				_Ht.push(	'<span style="height: 55px; display: block;"><B>' + __S.cut(notifyWnd.destname,6,true) + '</B><br />' + sprintf(NtLang['sayContent'], __S.cut(notifyWnd.sendMsg, 6, true) ) + '</span>' );
			else if(notifyWnd.chattype === 'nquan')
				_Ht.push(	'<span style="height: 80px; display: block;"><B>' + __S.cut(notifyWnd.destname,6,true) + '</B><br />' + __S.cut( notifyWnd.message, 40, true) + '</span>' );
			else
				_Ht.push(	'<B>' + __S.cut(notifyWnd.destname,6,true) + '</B><br />' + __S.cut( notifyWnd.message, 12, true) + '<br />' );
			//按钮
			if( /^(confirm|request)$/.test(notifyWnd.BtnType) ){
				_Ht.push(	'<a href="javascript:im_Confirm(\'' + notifyWnd.destuid + '\', \'' + key + '\', \'' + notifyWnd.BtnType + '\', 1, \'' + notifyWnd.destname + '\',\'' + notifyWnd.type + '\');" style="width:43px;display:block;height:20px;background:url(' + _C['imagesDIR'] + '/notifybtn.png) no-repeat 0 0;float:left;"></a>');
				_Ht.push(	'<a href="javascript:im_Confirm(\'' + notifyWnd.destuid + '\', \'' + key + '\', \'' + notifyWnd.BtnType + '\', 2, \'' + notifyWnd.destname + '\',\'' + notifyWnd.type + '\');" style="width:44px;display:block;height:20px;background:url(' + _C['imagesDIR'] + '/notifybtn.png) no-repeat -43px 0;float:left;"></a>');
			}
			if(notifyWnd.chattype === 'nquan'){
				_Ht.push(	'<a id="' + key + '_VIEW" href="javascript:void(0);" style="display:block;float:right;width:60px;height:20px;background:url(' + _C['imagesDIR'] + '/nquan_viewbtn.png)"></a>');
			}
			_Ht.push(	'</div>');
			_Ht.push('</div>');
			_curElement = __D.insert(document.body, _Ht.join(''));
			__$(key + '_IMG')  && __E.addEvent(__$(key + '_IMG'), 'click', _openChatWindow);
			__$(key + '_VIEW') && __E.addEvent(__$(key + '_VIEW'), 'click', _openChatWindow);
			if( __$(key + '_IMAGES') ){
				__$(key + '_IMAGES').onerror = function(){
					__$(key + '_IMAGES').onerror = null;
					__$(key + '_IMAGES').src = _C['imagesDIR']+"notify_userhead.png";
				};
			}
			this.animate(_curElement, false);
		},
		animate:function(elem, autoclose){
			this._showing = true;
			NotifyManager.alertQueue._showing = false;
			if(autoclose){
				setTimeout(function(){
					__D.animate(elem, {opacity:10}, 400, "swing", function(){
						if(elem.parentNode)elem.parentNode.removeChild(elem);
						NotifyManager.alertQueue._showList.remove(elem.id);
						setTimeout(function(){NotifyManager.push();}, 500);
					});
				}, 6000);
			}
		},
		close:function(id, btntype,type){
			var _CP= Ntalker.Config.customparams,
				_V = Ntalker.variable;
			elem = __$(id);
			__D.animate(elem, {opacity:0}, 400, "swing", function(){
				if(elem.parentNode) elem.parentNode.removeChild(elem);
				NotifyManager.alertQueue._showList.remove(elem.id);
				//if( /^(confirm|request)$/.test(btntype) || type == 'alert' ){
					//IMToolBar && IMToolBar.focusTag(_V['OnFocusWinParam'][0], _V['OnFocusWinParam'][1], _V['OnFocusWinParam'][2]);
				//}
			});
		}
	},
	showQueue:{
		_showList: new IMHashtable(),
		_showing: false,
		add: function(key, notifyWnd){
			var wRt = __D.windowRect();
			var _C = Ntalker.Config,
				_top = wRt.y + wRt.h - NotifyManager._bottom,
				_headURL = notifyWnd.logoUrl?notifyWnd.logoUrl:_C['imagesDIR']+"notify_userhead.png",
				_errimg  = _C['imagesDIR'] + "notify_userhead.png";
			this._showList.add(key, notifyWnd);
			_curElement = __D.create('div', {id:key,className:"ntalker_notify nt_notify"}, NotifyManager._NotifySPAN);
			_curElement.style.cssText = "z-index:2147483647;"+(__B.ie6 ? 'position:absolute;top:'+_top+'px;' : 'position:fixed;bottom:'+NotifyManager._bottom+'px;')+"right:10px;height:1px;width:"+NotifyManager._width+"px;background:transparent url("+_C['imagesDIR']+"notifybg."+(__B.ie?"gif":"png")+") no-repeat left top;";
			var htmls = ["<div style=\"background: url("+_C['logo']+") no-repeat 1px center; margin:8px 8px 0 8px;height:28px;padding:0;text-align:right;\"><a href=\"javascript:NotifyManager.showQueue.close('"+key+"');\" class=\"nt_close\"></a></div>",
						"<div style=\"margin:0px 10px;cursor:pointer;height:85px;\" onclick=\"im_openWebchatWindow("+notifyWnd.destuid+", '"+notifyWnd.destname+"', '"+notifyWnd.chatid+"', 1);NotifyManager.alertQueue.close('"+key+"');\">",
						"  <div style=\"margin:10px 4px 4px 14px;_margin:10px 4px 4px 4px;background:#fff;width:65px;height:65px;float:left;\"><img id=\""+key+"_IMAGES\" src=\""+_headURL+"\" style=\"width:61px;_width:60px;height:61px;_height:60px;border:1px solid #ccc;margin:1px;\" /></div>",
						"  <div style=\"padding: 10px 5px 0px 0px; float: right; width: 105px; color: #000000; font-size: 14px;font-family:宋体;\">",
						"	<B>" + __S.cut(notifyWnd.destname, 5, true) + "</B><br />" + notifyWnd.message + "",
						"  </div>",
						"</div>"].join('');
			_curElement.innerHTML = htmls;
			if( __$(key + '_IMAGES') ){
				__$(key + '_IMAGES').onerror = function(){
					__$(key + '_IMAGES').onerror = null;
					__$(key + '_IMAGES').src = _C['imagesDIR']+"notify_userhead.png";
				};
			}
			var __notifyRepos = function(){
				clearTimeout(NotifyManager.scroltimerID);
				NotifyManager.scroltimerID = setTimeout(function(){
					var count = NotifyManager.showQueue._showList.count();
					if( count == 0 ){
						__E.removeEvent(window, 'resize', __notifyRepos);
						__E.removeEvent(window, 'scroll', __notifyRepos);
						NotifyManager.addScrollEvent = false;
						DEBUG('NotifyManager removeEvent scroll&&resize ');
					}
					var list = NotifyManager.showQueue._showList._hash;
					var wRt = __D.windowRect();
					for(var k in list){
						var key = list[k]._curNotifyId;
						var notifyRect = __D.clientRect(key);
						var top = wRt.y + wRt.h - notifyRect.h - NotifyManager._bottom;
						__D.animate(__$(key), {top:top}, 'fast', 'easeInOutBounce', function(){});
					}
				}, 400);
			};
			if( !NotifyManager.addScrollEvent && __B.ie6 ){
				__E.addEvent(window, 'resize', __notifyRepos);
				__E.addEvent(window, 'scroll', __notifyRepos);
				NotifyManager.addScrollEvent = true;
				DEBUG('NotifyManager addEvent scroll&&resize ');
			}
			if(__$('impresenceflash') && __$('impresenceflash').playNotifySound){
				__$('impresenceflash').playNotifySound();
			}
			this.animate(_curElement);
		},
		animate:function(elem){
			var newY;
			if(im_myIMWindow){
				if(im_myIMWindow.isShow) return;
			}
			this._showing = true;
			var _preNodes = [];var _curEl = elem;
			while(_curEl.previousSibling){
				_preNodes.push(_curEl.previousSibling);
				_curEl = _curEl.previousSibling;
			}
			function callback(){
				NotifyManager.showQueue._showing = false;
				setTimeout(function(){NotifyManager.push();},500);
				setTimeout(function(){
					if(elem.parentNode)elem.parentNode.removeChild(elem);
					NotifyManager.showQueue._showList.remove(elem.id);
					NotifyManager.push();
				}, 15000);
			}
			for(var i=0; i<_preNodes.length; i++ ){
				if( __B.ie6 ){
					newY = parseInt(__D.css(_preNodes[i], "top")) - NotifyManager._height;
					__D.animate(_preNodes[i], {top:newY}, 400, "easeOutQuart");
				}else{
					newY = parseInt(__D.css(_preNodes[i], "bottom")) + NotifyManager._height;
					__D.animate(_preNodes[i], {bottom:newY}, 400, "easeOutQuart");
				}
			}
			if( __B.ie6 ){
				newY = parseInt(__D.css(elem, "top")) - NotifyManager._height;
				__D.animate(elem, {top:newY, height:NotifyManager._height}, 400, "easeOutQuart", callback);
			}else{
				__D.animate(elem, {height:NotifyManager._height}, 400, "easeOutQuart", callback);
			}
		},
		close:function(elem){
			elem = __$(elem);
			var _curEl = elem; var _preNodes = [];
			while(_curEl.previousSibling){
				_preNodes.push(_curEl.previousSibling);
				_curEl = _curEl.previousSibling;
			}
			if(elem.parentNode) 
				elem.parentNode.removeChild(elem);
			NotifyManager.showQueue._showList.remove(elem.id);
			for(var i=0; i<_preNodes.length; i++){
				if( __B.ie6 ){
				newY = parseInt(__D.css(_preNodes[i], "top")) + NotifyManager._height;
				__D.animate(_preNodes[i], {top:newY}, 400, "easeOutQuart", function(){
					NotifyManager.push();
					});
			}else{
			newY = parseInt(__D.css(_preNodes[i], "bottom")) - NotifyManager._height;
			__D.animate(_preNodes[i], {bottom:newY}, 400, "easeOutQuart", function(){
					NotifyManager.push();
				});
				}
			}
		}
	}
};
var _p;
Ntalker.IMWindow = function(){
	this._window = window;
	this._doc  = this._window.document;
	this._self = null;
	this.isLoad = 0;
	this.titleHeight = 0;
	this.borderWidth = 0;
	this._width = Ntalker.Config.IMWidth;
	this._height = Ntalker.Config.IMHeight;
	this.m_rlLong = 20;
	this._flashID = 'wdk_buddylist_flash';
	this.m_flashContainerID = "container_" + this._flashID;
	this._flashcontainer = null;
	this._titleid = "wdk_buddylist_title";
	this.timerID = null;
	this._flash = null;
	this.isInited = false;
	this._isFlashLoadSuccess = false;
	this._flashLoadTime = 30000; 
	this._waitFlashAutoLoad = 5000; 
	this._FlashReloadCount = 0;
	this._checkFlashTimerid = null;
	this._waitFlashAutoLoadTimeid = null;
	this._loadFlashTestTimeid = null;
	this.isShow = false;
	this.created = false;
	this._left = 0;
	this._bottom = 0;
	this._right = 0;
	this._top = 0;
};
_p = Ntalker.IMWindow.prototype;
_p.init = function(obj){
	if(this.isInited) return;
	this.isInited = true;
	this.m_jsURLPath = Ntalker.variable.scriptPath;
	this.m_funcURLPath = Ntalker.Config.services;
	var self = this;
	if(this.isLoad == 1) return;
	this.isLoad = 1;
};
_p.moveTo = function(x, y){
	var wRt = __D.windowRect();
	this._left = x - wRt.x;
	this._top = y - wRt.y;
	this._right =  wRt.x+wRt.w-x;
	this._bottom = wRt.y+wRt.h-y;
	var _CP = Ntalker.Config.customparams;
	if(__B.ie){
		this._self.style.pixelLeft = x;
		if(__B.ie6){
			DEBUG('IMWindow.moveTo ie6 setpiexTop');
			this._self.style.pixelTop  = y;
		}
	}else{
		this._self.style.left = x + "px";
	}
};
_p.resize = function(w, h){
	this._self.style.width  = w + "px";
	this._self.style.height = h + "px";
	var ch = h - 20 - this.borderWidth;
	if(this._flash){
		var fw = Math.max(w - 2 * this.borderWidth, 0);
		var fh = Math.max(h - 2 * this.borderWidth - this.titleHeight, 0);
		this._flash.setAttribute("width", fw);
		this._flash.setAttribute("height", fh);
		this._flash.style.width  = fw + "px";
		this._flash.style.height = fh + "px";
		this._flash.style.left = this.borderWidth + "px";
	}
};
_p.refreshFlashPos = function(){
	if( !this._flash  || this._curWindMode=="min" )
		return;
	var moveOffset = -1;
	if(this._isMoveLeft){
		moveOffset = 1;
		this._isMoveLeft = false;
	}
	else{
		moveOffset = -1;
		this._isMoveLeft = true;
	}
	this._flash.style.zIndex = parseInt(__D.css(this._flash, 'z-index')) + moveOffset
};
_p.createWin = function(tagIndex){
	var wRt  = __D.windowRect();
	var _r = NtUtil.scrollWidth();
	var _C = Ntalker.Config,
		_CP = Ntalker.Config.customparams,
		_V = Ntalker.variable;
	this.created = true;
	var cacheDom = document.createDocumentFragment();
	__D.css(_V['buddylistTag'], "display", "block");
	var _TabRect = __D.clientRect(_V['buddylistTag']);
	this._self = __D.create('div', {id:"buddylist_tag_con", style:"background:#fafafa;overflow:hidden;visibility:visible;"}, cacheDom);
	this.left = _TabRect.w - 10 - this._width;
	this.bottom = 0;
	this._self.style.position = "absolute";
	this._self.style.left   = this._left+'px';
	this._self.style.bottom = this._bottom+'px';
	this._self.style.zIndex = 9999;
	var flashWidth = this._width - 2*this.borderWidth;
	var flashHeight = this._height - this.titleHeight - 2*this.borderWidth;
	var bWidth = this.borderWidth;
	var sb = [];
	var infoTextSpanStyle = 'display:'+(_CP['enableJavaScriptLoading'] ? 'block' : 'none')+';';
	sb.push("<div id='" + this.m_flashContainerID + "' style='overflow:hidden;width:"+flashWidth+"px;height:"+flashHeight+"px;'>");
	sb.push(	"<div id='infoTextSpan' style='"+infoTextSpanStyle+"cursor:auto;width:"+flashWidth+"px;height:"+flashHeight+"px;line-height:" + flashHeight + "px;background:#EDF5F0 url(" + _C['publicDIR'] + "/loading.gif) no-repeat center center;text-align:center;border:0px solid "+_C['bColor']+"'></div>");
	sb.push(	"<div id='" + this._flashID + "'></div>");
	sb.push("</div>");
	if( __B.msie ) sb.push('<iframe style="position:absolute;z-index:-1;width:96%;height:92%;top:15px;left:2px;scrolling:no;" frameborder="0" src="about:blank"></iframe>');
	this._self.innerHTML = sb.join('');
	DEBUG('IMWindow.createWin::infoTextSpanStyle='+infoTextSpanStyle);
	delete sb;
	(_V['buddylistTag'] || document.body).appendChild(cacheDom);
	
	DEBUG('IMWindow.createWin::appendChild');
	this._self.style.display = "block";
	this._flashcontainer = this._doc.getElementById(this.m_flashContainerID);
	this.createFlash(tagIndex);
	this.resize(this._width, this._height);
	__D.css(this._self, 'bottom', '0px');
};
_p.createFlash = function(tagIndex){
	if(!this._flashcontainer)
		return;
	var swfSrc,
		_C = Ntalker.Config,
		_CP = Ntalker.Config.customparams,
		_V = Ntalker.variable;
	swfSrc = this.m_jsURLPath+"/fs/NtalkerWebMessager.swf";
	var flashvars = {v : Ntalker.version.buddylist_flash,
					 modname: "ContactMod",
					 pageId: Ntalker.temp.pageId,
					 r : this.m_jsURLPath,
					 su: this.m_funcURLPath,
					 k : _C['skin'] || "",
					 t : encodeURIComponent(_V['siteid']),
					 s : encodeURIComponent(_V['user_sid']),
					 u : encodeURIComponent(_V['user_id']), 
					 n : encodeURIComponent(_V['user_name']),
					 l : Ntalker.Config.buddylistlogo ? Ntalker.Config.buddylistlogo : 0,
					 i : tagIndex,
					 lst: _CP['lstupdated'],
					 localeChain: _CP['localeChain'],
					 ps: 6
					 };
	if(_V['userparam'])
		flashvars.p = encodeURIComponent(_V['userparam']);
	if(_C['buddylistlogo'] && _CP['siteurl'])
		flashvars.f = _CP['siteurl'].toLowerCase().replace("http://","");
	else
		flashvars.f = encodeURIComponent(window.location.host);
	if(_CP['previewsiteid']){
		flashvars.previewsiteid = _CP['previewsiteid'];
	}
	if(flashvars.toJSONString)
		delete flashvars.toJSONString;
	var flashmode = "Window";
	var params = {menu:"true", "salign":"LT", "allowScriptAccess":"always", "wmode":flashmode, "allowFullScreen": true};
	var attributes = {};
	var flashWidth = this._width - 2 * this.borderWidth;
	var flashHeight = this._height - 2 * this.borderWidth - this.titleHeight;
	if( parseInt(NtUtil.Flash.getPlayerVersion().major) < 9 ){
		__D.css(this._flash, 'display', 'none');
		__D.css(__$('infoTextSpan'), 'background', 'none');
		__$('infoTextSpan').innerHTML = '<a href="http://www.adobe.com/go/getflashplayer" target="_blank">' + NtLang['noInstallFlash'] + '</a>';
		return;
	}else{
		ntalker_swfobject.embedSWF(swfSrc, this._flashID, flashWidth, flashHeight, "9.0.115", _V['scriptPath']+"/fs/expressInstall.swf", flashvars, params, attributes);
		//NtUtil.Flash.create(swfSrc, this._flashcontainer, this._flashID, flashWidth, flashHeight, flashvars, params, attributes);
		DEBUG('swfobject.embedSWF');
		var self = this;
		this._loadFlashTestTimeid = setTimeout(function(){
			self.LoadFailure();
			DEBUG('IMWindow.createFlash::Not in time='+self._flashLoadTime);
			self._flashLoadTime = self._flashLoadTime*2; 
		}, self._flashLoadTime);
	}
	self._flash = __$(self._flashID);
	if( !_CP['enableJavaScriptLoading'] ){
		self.setFlashStyle();
	}else if( !__B.ie6 && !__B.opera ){
		self.setFlashStyle();
	}
};
_p.setFlashStyle = function(){  
	var fw = Math.max(this._width - 2 * this.borderWidth, 0);
	var fh = Math.max(this._height - 2 * this.borderWidth - this.titleHeight, 0);
	if(this._flash){
		this._flash.style.position = "absolute";
		if( !__B.ie6 ) this._flash.style.top = (this.borderWidth + this.titleHeight) + "px";
		if( !__B.ie6 ) this._flash.style.left = this.borderWidth + "px";
		this._flash.style.width  = fw + "px";
		this._flash.style.height = fh + "px";
		this._flashHeight = this._flash.style.height;
	}
};
_p.reloadFlash = function(){
	var _C = Ntalker.Config,
		_CP = Ntalker.Config.customparams;
	if(this._restoreFlash){
		delete this._restoreFlash;
	}
	this._flash = null;
	var _Ht = [];
	var flashWidth = this._width - 2 * this.borderWidth;
	var flashHeight = this._height - 2 * this.borderWidth - this.titleHeight;
	var infoTextSpanStyle = 'display:'+(_CP['enableJavaScriptLoading'] ? 'block' : 'none')+';'
	_Ht.push("<div id='infoTextSpan' style='"+infoTextSpanStyle+"cursor:auto;width:"+flashWidth+"px;height:"+flashHeight+"px;line-height:" + flashHeight + "px;background:#EDF5F0 url(" + _C['publicDIR'] + "/loading.gif) no-repeat center center;text-align:center;border:0px solid "+_C['bColor']+"'></div>");
	_Ht.push(	"<div id='" + this._flashID + "' style=''></div>");
	this._flashcontainer. innerHTML = _Ht.join('');
	DEBUG('IMWindow.reloadFlash::infoTextSpanStyle='+infoTextSpanStyle);
	if(this._waitFlashAutoLoadTimeid) clearTimeout(this._waitFlashAutoLoadTimeid);
	this.createFlash();
};
_p.LoadFailure = function(){
	if(this._isFlashLoadSuccess){
		return;
	}
	var self = this, _C = Ntalker.Config, _CP = Ntalker.Config.customparams;
		this._restoreFlash = this._flash;
	var flashWidth = this._width - 2*this.borderWidth;
	var flashHeight = this._height - this.titleHeight - this.borderWidth*2;
	if(self._flash){
		__D.css(this._flash, "display", "none");
		try{
			this._flash.parentNode.removeChild(this._flash);
		}catch(e){
			this._flash.style.width = 1 + 'px';
			this._flash.style.height = 1 + 'px';
		}
	}
	var closeButtonId = 'CloseIMWindowButton';
	var reLoadButtonId = 'reLoadFlashButton';
	if( _CP['enableJavaScriptLoading'] ){
		__D.css(__$('infoTextSpan'), 'backgroundImage', 'none');
		__D.css(__$('infoTextSpan'), 'display', 'block');
		DEBUG('IMWindow.LoadFailure:: infoTextSpan backgroundImage:none;display:block;');
	}
	var _Ht = [];
	_Ht.push('<div>');
	_Ht.push(	'<div name="winlogo" style="float:left;width:70px;height:20px;background:url(' + _C['logo'] + ') center center no-repeat;"></div>');
	_Ht.push(	'<div name="wintitle" style="float:left;width:132px;height:20px;background:url(' + _C['publicDIR'] + 'titleText.gif) center center no-repeat;"></div>');
	_Ht.push(	'<div id="'+closeButtonId+'" name="btnclose" style="z-index:12;float:right;margin-right:8px;width:26px;height:20px;background:url('+_C['publicDIR'] + 'closewin.gif) center top no-repeat;cursor:pointer;"></div>');
	_Ht.push('</div>');
	_Ht.push('<div style="text-align:center;clear:both;height:' + (flashHeight-20) + 'px;line-height:' + (flashHeight-20) + 'px;">');
	_Ht.push(	'<a id="'+reLoadButtonId+'" href="javascript:void(0)">' + NtLang['loadFlashFailure'] + '</a>');
	_Ht.push('</div>');
	__D.insert(__$('infoTextSpan'), _Ht.join(''));
	var self = this;
	var __clearClick  = function(e){__E.fixEvent(e).stopPropagation();};
	var __closeWaitWin = function(e){ self.close();};
	var __reloadFlash = function(){
		clearTimeout(self._waitFlashAutoLoadTimeid);
		self.reloadFlash();
		DEBUG('IMWindow.LoadFailure::Waiting time='+self._waitFlashAutoLoadTimeid);
	};
	if(this._FlashReloadCount < 2 && !this._isFlashLoadSuccess){
		this._FlashReloadCount++;
		this._waitFlashAutoLoadTimeid = setTimeout( __reloadFlash, this._waitFlashAutoLoad);
		DEBUG('IMWindow.LoadFailure:: _waitFlashAutoLoad=' + this._waitFlashAutoLoad);
	}
	if( __$('infoTextSpan') ) __$('infoTextSpan').onclick   = __clearClick;
	if( __$(closeButtonId) ) __$(closeButtonId).onclick  = __closeWaitWin;
	if( __$(reLoadButtonId) ) __$(reLoadButtonId).onclick = __reloadFlash;
};
_p.onFlashLoadSuccess = function(){
	var _CP = Ntalker.Config.customparams;
	this._isFlashLoadSuccess = true;
	clearTimeout(this._loadFlashTestTimeid);
	if( _CP['enableJavaScriptLoading'] ){
		__D.css(__$('infoTextSpan'), 'display', 'none');
   		this.setFlashStyle();
   		DEBUG('IMWindow.onFlashLoadSuccess:: display:none;setFlashStyle');
	}
};
_p.minimize = function(){
	clearTimeout(this._waitFlashAutoLoadTimeid);
	var flashDOM = __$(this._flashID);
	if(this._self)	this._self.style.visibility = "hidden";
	if(flashDOM) flashDOM.style.visibility = "hidden";
	this.isShow = false;
};
_p.close = function(isShowMini){
	var self = this, _V = Ntalker.variable;
	clearTimeout(self._waitFlashAutoLoadTimeid);
	if(!self._self)
		return;
	promptwindow && promptwindow.handleFocus();
	self.isShow = false;
	if(self._flash){
		if(self._flash.asIM_closeIMBuddyList){
			self._flash.asIM_closeIMBuddyList();
		}
		if(self._flash){
			try{
				NtUtil.disposeFlashObj(self._flash);
				__D.css(self._flash, "display", "none");
				self._flash.parentNode.removeChild(self._flash);
			}catch(e){}
		}
	}
	if(Ntalker.temp.buddylistFlashGoUrl){
		__C.load({src:Ntalker.temp.buddylistFlashGoUrl});
		Ntalker.temp.buddylistFlashGoUrl = null;
	}
	self._self.parentNode.removeChild(self._self);
	delete self._self;
	if(_V['buddylistTag']){
		_V['buddylistTag'].style.display = "none";
	}
	__C.load({tagName:'img', href:Ntalker.Config.services + '/func/statistic.php?', 
		params:{
			siteid: _V['siteid'],
			uid: _V['user_id'],
			type: 7,
			desc: encodeURIComponent(NtLang['sd_eventClose'] + NtLang['sd_Buddylist']),
			rnd: new Date().getTime()
		}, width:1,height:1
	});
};
_p.showWindow = function(){
	var _C  = Ntalker.Config,
		_CP = Ntalker.Config.customparams,
		_V = Ntalker.variable;
	if(_V['user_id']==0 || !_V['user_id']){
		alert(NtLang.notLogin);return;
	}
	if( this.isShow ){
		return;
	}
	this.isShow = true;
	if(this._self == null){
		this.createWin(Ntalker.Config.IMtabIndex);
	}
	else{
		DEBUG('IMWindow.showWindow:: flash visible');
		if(this._self) this._self.style.visibility = "visible";
		if(this._flash) this._flash.style.visibility = "visible";
		IM_BuddyListDOM = __$("wdk_buddylist_flash");
		if(IM_BuddyListDOM && IM_BuddyListDOM.switchTabIndex)
			IM_BuddyListDOM.switchTabIndex(Ntalker.Config.IMtabIndex);
	}
	if(NotifyManager) {
		NotifyManager.clearonline("online");
	}
	__C.load({tagName:'img', href:Ntalker.Config.services + '/func/statistic.php?', 
		params:{
			siteid: _V['siteid'],
			uid: _V['user_id'],
			type: 6,
			desc: encodeURIComponent(NtLang['sd_eventClose'] + NtLang['sd_Buddylist']),
			rnd: new Date().getTime()
		}, width:1,height:1
	});
};
_p.OnTBShowBuddylist =function(){
	var self = this;
	if(self.created){
		if(self._self) self._self.style.visibility = "visible";
		if(self._flash) self._flash.style.visibility = "visible";
		self.isShow = true;
		DEBUG('IMWindow.OnTBShowBuddylist:: flash visible');
		IM_BuddyListDOM = self._flash;
		if(IM_BuddyListDOM && IM_BuddyListDOM.switchTabIndex)
			IM_BuddyListDOM.switchTabIndex(Ntalker.Config.IMtabIndex);
	}else{
		DEBUG('IMWindow.OnTBShowBuddylist::showWindow(true)');
		self.showWindow(true);
	}
};
Ntalker.ntGroupWindow = function(destuid, destnick, chatid, layoutmode, chatType, roomtype, OpenType, userinfo, befrom){
	this._destuid = destuid;
	this._destnick = destnick;
	this._chatType = /^(chat|room|group|nquan|traing)$/.test(chatType) ? chatType : "chat";
	this._roomType = roomtype ? 1 : 0;
	this._openType = OpenType;
	this._userInfo = userinfo;
	this._befrom = befrom;
	this._window = window;
	this._doc = this._window.document;
	this._self = null;
	this._selfid = "webchat_window"+destuid+this._chatType;
	this._titleid = "webchat_title"+destuid+this._chatType;
	this._headerid = "webchat_header"+destuid+this._chatType;
	this._width  = (/^(room|group|nquan|traing)$/.test(this._chatType) ? Ntalker.Config.groupWidth : Ntalker.Config.chatWidth);
	this._height = (/^(room|group|nquan|traing)$/.test(this._chatType) ? Ntalker.Config.groupHeight : Ntalker.Config.chatHeight);
	this._titleHeight = 0;  
	this._borderWidth = 0;  
	this._flashHeight = null;
	this._isFlashTitle = false;
	this._flashID = "webchat_flash"+destuid+this._chatType;
	this._flash = null;
	this._flashContainerID = "webchat_container"+destuid+this._chatType;
	this._infoTextSpanID = "infoTextSpan" + destuid + this._chatType;
	this._flashcontainer = '';
	this._jsURLPath = Ntalker.variable.scriptPath;
	this.m_funcURLPath = Ntalker.Config.services;
	this._presenceFlashGoUrl = null; 
	this._freeChatFlashGoUrl = null; 
	this._defaultZIndex = -9;
	this._focusZIndex = -1;
	this._curWindMode = "default"; 
	this._flashTitleTimerID = null;
	this._iframe = null;
	this._top = 0;
	this._bottom = 0;
	this._left = 0; 
	this._right = 0; 
	this._chatid = chatid ? chatid:null;
	this.isInited = false;
	this._isFlashLoadSuccess = false;
	this._flashLoadTime = 30000; 
	this._waitFlashAutoLoad = 5000; 
	this._FlashReloadCount = 0;
	this._flashFailedDiv = null;
	this._checkFlashTimerid = null;
	this._waitFlashAutoLoadTimeid = null;
	this._loadFlashTestTimeid = null;
};
_p = Ntalker.ntGroupWindow.prototype;
_p.showWindow = function(offset, miniWinTabDOM){
	if(this.isInited) return;
	var cacheDom = document.createDocumentFragment();
	this.isInited = true;
	var wRt = __D.windowRect();
	var _C  = Ntalker.Config,
		_CP = Ntalker.Config.customparams, 
		_V  = Ntalker.variable;
	this._self = __D.create('div', {style:'background:#fafafa;'}, cacheDom);
	this._self.style.position = "absolute";
	this._self.style.outlineStyle = "none";
	this._left = offset.left;
	this._top = 0 - this._height - offset.bottom;
	this._self.style.left = this._left + "px";
	this._self.style.top  = this._top + "px";
	this._self._ptr = this;
	this._self.style.zIndex = this._defaultZIndex;
	this._self.style.width = this._width+"px";
	this._self.style.height = this._height+"px";
	this._self.tabIndex = parseInt(this._destuid);
	var titleWidth,popBtnLeft,minBtnLeft,closeBtnLeft;
	this._titleText = sprintf(NtLang['minWindowTitle'], this._destnick);
	titleWidth	= this._width; 
	minBtnLeft	= titleWidth - 39;
	closeBtnLeft  = titleWidth - 21;
	var bWidth = this._borderWidth;
	var flashWidth = this._width - this._borderWidth*2;
	var flashHeight = this._height - this._borderWidth*2;
	var infoTextSpanStyle = 'display:'+(_CP['enableJavaScriptLoading'] ? 'block' : 'none')+';'
	var sb = [];
	sb.push("<div id='" + this._flashContainerID + "' style='overflow:hidden; width:"+flashWidth+"px;height:"+flashHeight+"px;'>");
	sb.push(	"<div id='" + this._infoTextSpanID + "' style='"+infoTextSpanStyle+"cursor:auto;width:"+flashWidth+"px;height:"+flashHeight+"px;line-height:" + flashHeight + "px;background:#EDF5F0 url(" + _C['publicDIR'] + "/loading.gif) no-repeat center center;text-align:center;border:0px solid "+_C['bColor']+"'></div>");
	//
	sb.push(	"<div id='" + this._flashID + "'></div>");
	sb.push("</div>");
	this._self.innerHTML = sb.join("");
	DEBUG('ntGroupWindow.showWindow::infoTextSpanStyle='+infoTextSpanStyle);
	delete sb;
	(miniWinTabDOM || document.body).appendChild(cacheDom);
	this._flashcontainer = this._doc.getElementById(this._flashContainerID);
	this.createFlash();
	function __clearClick(e){__E.fixEvent(e).stopPropagation();};
	this._self.onclick = __clearClick;
	this.resize(this._width, this._height);
};
_p.moveTo = function(x, y, isSavePos, curHeight){
	var wRt = __D.windowRect();
	if( isNaN(x) || isNaN(y) )
		return;
	if(isSavePos){
			this._left   = x - wRt.x;
			this._top	= y - wRt.y;
			this._right  = wRt.x + wRt.w - x - this._width;
			this._bottom = wRt.y + wRt.h - y - (__S.isDefined(curHeight) ? curHeight : this._height);
	}
	if(__B.msie){
		this._self.style.pixelLeft = x;
		if(__B.ie6)
			this._self.style.pixelTop  = y;
		else
			this._self.style.bottom  = this._bottom + "px";
	}else{
		this._self.style.left = x + "px";
		this._self.style.bottom  = this._bottom + "px";
	}
};
_p.resize = function(w, h){
	this._width = w;
	this._height = h;
	this._self.style.width  = w + "px";
	this._self.style.height = h + "px";
	if(this._flash){
		this.setFlashStyle();
	}
};
_p.hide = function(){
	if(this._curWindMode=='default')
		this.MinMax();
};
_p.show = function(offsetLeft, offsetTop){
	if(this._curWindMode=='hide'){
		this.MinMax();
		if(offsetLeft && offsetTop){
			var wRt = __D.windowRect();
			this.moveTo(wRt.x + offsetLeft, wRt.y + (offsetTop-this._height) );
		}
	}
};
_p.MinMax = function(){
	var visiblestyle, displaystyle;
	var _C = Ntalker.Config,
		_CP= Ntalker.Config.customparams;
	switch(this._curWindMode){
	case "default":
		visiblestyle = "hidden";
		displaystyle = "none";
		this._curWindMode = "hide";
		this._flashcontainer.style.width = "1px";
		this._flashcontainer.style.height = "1px";
		this._flash.style.width = "1px";
		this._flash.style.height = "1px";
		this._self.style.height = this._titleHeight + "px";
		if(IMToolBar){
			var minWin = IMToolBar.get(this._destuid, this._chatType);
			if(minWin) minWin.onBlur();
		}
		this.moveTo(-2000, 0);
		break;
	case "hide":
		visiblestyle = "visible";
		displaystyle = "block";
		this._curWindMode = "default";
		this._self.style.width = this._width + "px";
		this._self.style.height = this._height+"px";
		this._flash.style.height = this._flashHeight;
		this.resize(this._width, this._height);
		var _r   = NtUtil.scrollWidth();
		var wRt = __D.windowRect();
		var tRt = __D.clientRect(IMToolBar.contentElement);
		var x = this._left,y = this._top;
		var minWin = IMToolBar.get(this._destuid, this._chatType);
		var mRt = minWin.onFocus();
		if( /0|1/.test(IMToolBar.currentToolbarMode) ){
			x = mRt.x + IMToolBar.AreaElement.scrollLeft;
			x = x < 21 ? 21 : x;
			x = Math.min(x, tRt.w - this._width - _C['IMWidth'] - 10);
		}else{
			x = mRt.x + mRt.w - this._width;
			if(__D.rect(__$('ntalkerbar-wrapper')).left<this._width){
		   		if(x<0){
					x = Math.max(x,-1*__D.rect(__$('ntalkerbar-wrapper')).left);
					if(__B.chrome) x+=20;
				}
			}
		}
		DEBUG('ntGroupWindow moveTo X=' + x);
		if(__B.QuirksModel){
			y = mRt.y-this._height + 5;
		}else{
			y = 0-this._height;
		}
		this.moveTo(x, y);
		break;
	default:
		visiblestyle = "visible";
		this._curWindMode = "default";
		break;
	}
};
_p.close = function(){
	clearTimeout(self._waitFlashAutoLoadTimeid);
	__D.css(this._self, "display", "none");
	this._flash = __$(this._flashID);
	if(this._checkFlashTimerid){
		clearTimeout(this._checkFlashTimerid);
	}
	if(this._flash){
		if(this._flash.asIM_closeChatWindow)
		   this._flash.asIM_closeChatWindow();
		//清除DOM对象上面绑定的脚本对
		NtUtil.disposeFlashObj(this._flash);
		__D.css(this._flash, "display", "none");
		this._flash.parentNode.removeChild(this._flash);
		delete this._flash;
	}
	if(this._freeChatFlashGoUrl != null && this._freeChatFlashGoUrl != ''){
		__C.load({src:this._freeChatFlashGoUrl});
	}
	if(this._presenceFlashGoUrl != null && this._presenceFlashGoUrl != ''){
	   __C.load({src:this._presenceFlashGoUrl});
	}
	chatWindowManager.removeChatWindow(this._destuid, this._chatType);
	this._self.parentNode.removeChild(this._self);
	delete this._self;
	if(IMToolBar){
		IMToolBar.remove(this._destuid, this._chatType);
	}
	__$('NtFocusElement') && __$('NtFocusElement').focus();
	var _V = Ntalker.variable, type, desc;
	if( parseInt(_V['onlineChat']) < 10 ){
		_V['onlineChat'] += 1;
	}else{
		_V['onlineChat'] = 10;
	}
	switch(this._chatType){
		case "group":
		case "room":
			type=3;desc=NtLang['sd_closeGroupWindow'];break;
		case "nquan":
			type=16;
			desc=NtLang['sd_closeNQuanWindow'];
			break;
		default:type=1;desc=NtLang['sd_closeChatWindow'];break;
	};
	__C.load({tagName:'img', href: Ntalker.Config.services + '/func/statistic.php?', 
		params:{
			siteid: _V['siteid'],
			uid: _V['user_id'],
			destid: /^(room|group|nquan|traing)$/.test(this._chatType) ? 0 : this._destuid,
			groupid: /^(room|group|nquan|traing)$/.test(this._chatType) ? this._destuid : 0,
			type: type,
			desc: encodeURIComponent(desc),
			from: this._befrom,
			rnd: new Date().getTime()
		}, width:1,height:1
	});
};
_p.createFlash = function(){
	if(!this._flashcontainer)
		return;
	var swfSrc,
		_V = Ntalker.variable, 
		_C = Ntalker.Config,
		_CP= Ntalker.Config.customparams;
	swfSrc = this._jsURLPath + "/fs/NtalkerWebMessager.swf";
	var flashvars = {
					   pageId: Ntalker.temp.pageId,
					   r : this._jsURLPath,   
					   su: this.m_funcURLPath,
					   k : _C['skin'],
					   t : encodeURIComponent(_V['siteid']),
					   s : encodeURIComponent(_V['user_sid']),
					   u : encodeURIComponent(_V['user_id']),
					   n : encodeURIComponent(_V['user_name']),
					   d : encodeURIComponent(this._destuid),
					   dn: encodeURIComponent(this._destnick),
					   m : 0,
					   localeChain: _CP['localeChain'],
					   ot: this._openType,
					   ct: this._chatType,
					   lst:_CP['lstupdated']
					};
	switch(this._chatType){
		case "chat":
			flashvars.modname = "ChatMod";
			flashvars.l  = _C['chatlogo'] || ""; 
			flashvars.v  = Ntalker.version.webchat_flash;
			if( this._userInfo ) flashvars.info = this._userInfo;
			break;
		case "group":
		case "room":
			flashvars.modname = "GroupMod";
			flashvars.l  = _C['grouplogo'] || "";					
			flashvars.v  = Ntalker.version.group_flash;			  
			if( _CP['imversion']=='2.0' && _CP.softwaretype.toLowerCase()=='phpwind' ) flashvars.iv = 'pw2.0';
			break;
		case "nquan":
			flashvars.modname = "NQuanMod";
			flashvars.l  = _C['nquanlogo'] || "";					 
			flashvars.v  = Ntalker.version.nquan_flash;			   
			flashvars.befrom = this._befrom;
			if(_V['activityid']&&_V['activitytype']){
				flashvars.activitytype=_V['activitytype'];
				flashvars.activityid=_V['activityid'];
			}
			break;
		case "traing":
			swfSrc = this._jsURLPath+"/fs/TraingMod.swf?version=" + Ntalker.version.traing_flash;
			flashvars.v  = Ntalker.version.traing_flash;
			break;
	} 
	if(_V['userparam'])
		flashvars.p = encodeURIComponent(_V['userparam']);
	if(_C['chatlogo'] && _CP['siteurl'])
		flashvars.f = _CP['siteurl'].toLowerCase().replace("http://","");
	else
		flashvars.f = encodeURIComponent(window.location.host);
	if(this._chatid) 
		flashvars.chatid	= this._chatid;
	if(_CP['previewsiteid']){
		flashvars.previewsiteid = _CP['previewsiteid'];
	}
	if(flashvars.toJSONString)
		delete flashvars.toJSONString;
	var flashmode = __B.ie?"Opaque":"Window";
	var flashmode = "Window";
	var params = {menu:"true", "salign":"LT", "allowScriptAccess":"always", "wmode":flashmode, "allowFullScreen": true};
	var attributes = {};
	var flashWidth = this._width - this._borderWidth*2;
	var flashHeight = this._height - this._borderWidth*2;
	if( parseInt(NtUtil.Flash.getPlayerVersion().major) < 9 ){
		__D.css(this._flash, 'display', 'none');
		__D.css(__$(this._infoTextSpanID), 'background', 'none');
		__$(this._infoTextSpanID).innerHTML = '<a href="http://www.adobe.com/go/getflashplayer" target="_blank">' + NtLang['noInstallFlash'] + '</a>';
		return;
	}else{
		ntalker_swfobject.embedSWF(swfSrc, this._flashID, flashWidth, flashHeight,  "9.0.115", _V['scriptPath']+"/fs/expressInstall.swf", flashvars, params, attributes);
		//NtUtil.Flash.create(swfSrc, this._flashcontainer, this._flashID, flashWidth, flashHeight, flashvars, params, attributes);
		var self = this;
		this._loadFlashTestTimeid = setTimeout(function(){
			self.LoadFailure();
			DEBUG('ntGroupWindow.createFlash::Not in time='+self._flashLoadTime);
			self._flashLoadTime = self._flashLoadTime*2; 
		}, self._flashLoadTime);
	}
	this._flash = __$(this._flashID);
	if( !_CP['enableJavaScriptLoading'] ){
		this.setFlashStyle();
	}else if( !__B.ie6 && !__B.opera ){
		this.setFlashStyle();
	}
};
_p.setFlashStyle = function(){
	this._flashcontainer.style.position = "absolute";
	this._flashcontainer.style.top	  = this._titleHeight+"px";
	this._flashcontainer.style.left	 = "0px";
	this._flashcontainer.style.width	= this._width+"px";
	this._flashcontainer.style.height   = (this._height-this._titleHeight - this._borderWidth)+"px";
	this._flashcontainer.style.overflow = "hidden";
	var flashWidth = this._width - this._borderWidth*2;
	var flashHeight = this._height - this._borderWidth*2;
	if(this._flash){
		this._flash.style.position = "relative";
		this._flash.style.width  = flashWidth + "px";
		this._flash.style.height = flashHeight + "px";
		this._flash.style.left   = this._borderWidth + "px";
		this._flash.style.top	= "0px";
		this._flashHeight		= this._flash.style.height;
	}
};
_p.restoreFlash = function(){
	if(this._flashFailedDiv){
	   this._flashcontainer.removeChild(this._flashFailedDiv);
	   delete this._flashFailedDiv;
	}
	this._flash = this._restoreFlash;
	this.resize(this._width, this._height);
	this._flash.focus();
};
_p.reloadFlash = function(){
	var _C = Ntalker.Config,
		_CP = Ntalker.Config.customparams;
	if(this._restoreFlash){
		delete this._restoreFlash;
	}
	this._flash = null;
	var _Ht = [];
	var flashWidth = this._width - 2 * this.borderWidth;
	var flashHeight = this._height - 2 * this.borderWidth;
	var infoTextSpanStyle = 'display:'+(_CP['enableJavaScriptLoading'] ? 'block' : 'none')+';'
	_Ht.push("<div id='" + this._infoTextSpanID + "' style='"+infoTextSpanStyle+"cursor:auto;width:"+flashWidth+"px;height:"+flashHeight+"px;line-height:" + flashHeight + "px;background:#EDF5F0 url(" + _C['publicDIR'] + "/loading.gif) no-repeat center center;text-align:center;border:0px solid "+_C['bColor']+"'></div>");
	_Ht.push("<div id='" + this._flashID + "' style=''></div>");
	this._flashcontainer.innerHTML = _Ht.join('');
	DEBUG('ntGroupWindow.reloadFlash::infoTextSpanStyle='+infoTextSpanStyle);
	if(this._waitFlashAutoLoadTimeid) clearTimeout(this._waitFlashAutoLoadTimeid);
	this.createFlash();
	this.setFlashStyle();
};
_p.LoadFailure = function(){
	var _V = Ntalker.variable, _C = Ntalker.Config, _CP = Ntalker.Config.customparams;
	if(this._isFlashLoadSuccess){
		return;
	}
	var self = this;
	this._restoreFlash = this._flash;
	var flashWidth = this._width - 2*this._borderWidth;
	var flashHeight = this._height - this._titleHeight;
	if(self._flash){
		__D.css(this._flash, "display", "none");
		try{
			this._flash.parentNode.removeChild(this._flash);
		}catch(e){
			this._flash.style.width = 1 + 'px';
			this._flash.style.height = 1 + 'px';
		}
	}
	var closeButtonId = 'CloseIMWindowButton';
	var reLoadButtonId = 'reLoadFlashButton';
	if( _CP['enableJavaScriptLoading'] ){
		__D.css(__$(this._infoTextSpanID), 'backgroundImage', 'none');
		__D.css(__$(this._infoTextSpanID), 'display', 'block');
		DEBUG('ntGroupWindow.LoadFailure:: infoTextSpan backgroundImage:none;display:block;');
	}
	var _Ht = [];
	_Ht.push('<div>');
	_Ht.push(	'<div name="winlogo" style="float:left;width:70px;height:20px;background:url(' + _C['logo'] + ') center center no-repeat;"></div>');
	_Ht.push(	'<div name="wintitle" style="float:left;width:280px;height:20px;background:url(' + _C['publicDIR'] + 'titleText.gif) center center no-repeat;"></div>');
	_Ht.push(	'<div id="'+closeButtonId+'" name="btnclose" style="z-index:12;float:right;margin-right:8px;width:26px;height:20px;background:url('+_C['publicDIR'] + 'closewin.gif) center top no-repeat;cursor:pointer;"></div>');
	_Ht.push('</div>');
	_Ht.push('<div style="text-align:center;clear:both;height:' + (flashHeight-20) + 'px;line-height:' + (flashHeight-20) + 'px;">');
	_Ht.push(	'<a id="'+reLoadButtonId+'" href="javascript:void(0)">' + NtLang['loadFlashFailure'] + '</a>');
	_Ht.push('</div>');
	if( __$(this._infoTextSpanID) ) __D.insert(__$(this._infoTextSpanID), _Ht.join(''));
	var self = this;
	var __clearClick  = function(e){__E.fixEvent(e).stopPropagation();};
	var __closeWaitWin = function(e){self.close();};
	var __reloadFlash = function(){
		clearTimeout(self._waitFlashAutoLoadTimeid);
		self.reloadFlash();
		DEBUG('ntGroupWindow.LoadFailure::Waiting time='+self._waitFlashAutoLoadTimeid);
	};
	if(this._FlashReloadCount < 2 && !this._isFlashLoadSuccess){
		DEBUG('ntGroupWindow.LoadFailure _waitFlashAutoLoad=' + this._waitFlashAutoLoad);
		this._waitFlashAutoLoadTimeid = setTimeout( __reloadFlash, this._waitFlashAutoLoad);
	}
	if( __$(this._infoTextSpanID) ) __$(this._infoTextSpanID).onclick = __clearClick;
	if( __$(closeButtonId) ) __$(closeButtonId).onclick = __closeWaitWin;
	if( __$(reLoadButtonId) ) __$(reLoadButtonId).onclick = __reloadFlash;
};
_p.onFlashLoadSuccess = function(){
	var _CP = Ntalker.Config.customparams;
	this._isFlashLoadSuccess = true;
	clearTimeout(this._loadFlashTestTimeid);
	if( _CP['enableJavaScriptLoading'] ){
		__D.css(__$(this._infoTextSpanID), 'display', 'none');
		if( this._curWindMode == 'default' ){
			this.setFlashStyle();
		}
	}
   	DEBUG('ntGroupWindow.onFlashLoadSuccess:: display:none;setFlashStyle');
};
_p.refreshFlashPos = function(){
	if(!this._flash || this._curWindMode=="min")
		return;
	var moveOffset = -1;
	if(this._isMoveLeft){
		moveOffset = 1;
		this._isMoveLeft = false;
	}
	else{
		moveOffset = -1;
		this._isMoveLeft = true;
	}
	this._flash.style.zIndex = parseInt(__D.css(this._flash, 'z-index')) + moveOffset;
};
_p.onFocus = function(){
	var _V = Ntalker.variable;
	this._self.style.zIndex = this._focusZIndex;
	this._flashcontainer.style.zIndex = this._focusZIndex;
	this._flash.style.zIndex = this._focusZIndex;
	try{
		this._flash.focus();
	}catch(e){}
	if( this._chatType == 'nquan' ){
		showDiv(this._chatType + '_' + this._destuid);
	}
	//_V['OnFocusWinParam'] = [this._destuid, this._chatType, this._destnick];
	chatWindowManager.focusWindow(this._destuid, this._chatType);
};
_p.onBlur = function(){
	this._self.style.zIndex = this._defaultZIndex;
	this._flashcontainer.style.zIndex = this._defaultZIndex;
	this._flash.style.zIndex = this._defaultZIndex;
	this._flash.style.visibility = "hidden";
	this._flash.style.visibility = "visible";
};
_p.onReceiveMessage = function(message){
	if(this._curWindMode=="min" || this._curWindMode=="hide"){
		var titleText = sprintf(NtLang['receiveMessageTitle'], this._destnick, message);
		if(IMToolBar){
			var miniWindow = IMToolBar.get(this._destuid, this._chatType);
			miniWindow.onReceiveMiniMessage(message);
		}
		var impresenceflash = __$('impresenceflash');
		if(impresenceflash && impresenceflash.playNotifySound){
			impresenceflash.playNotifySound();
		}
	}
};
_p.onPresenceReceiveChatMsg = function(message){
	if(this._flash && this._flash.presenceReceiveChatMsg)
		this._flash.presenceReceiveChatMsg(message);
};
/* 完整js版聊窗 */
Ntalker.ntChatWindow = function(destuid, destnick, chatid, layoutmode, chatType, roomtype, OpenType, userinfo, befrom)
//
{
	this._destuid = destuid;
	this._destnick = destnick;
	this._chatType = 'chat';
	this._roomType = roomtype ? 1 : 0;
	this._openType = OpenType;
	this._userInfo = userinfo;
	this._befrom = befrom;
	
	this._self = null;
	this._editConWin = null;
	this._chatFlash = null;
	this._avFlash = null;
	this._uploadFileFlash = null;
	this._uploadImageFlash = null;
	
	this._width  = 380;
	this._height = 405;
	this._maxwidth = 560
	this._minwidth = 380;
	this._selfId = "webchat_window"+destuid+this._chatType;
	this._flashID = "webchat_flash"+destuid+this._chatType;
	this._editorIframeID = "webchat_editor"+destuid+this._chatType;
	this._avFlashID = "webchat_avflash"+destuid+this._chatType;
	this._uploadFileFlashID = 'webchat_uploadFile'+destuid+this._chatType;
	this._uploadImageFlashID = 'webchat_uploadImage'+destuid+this._chatType;
	
	this._FACE_TEXT = [
			"惊讶","难过","色","微笑","得意","流泪","害羞","闭嘴","睡觉","大哭",
			"尴尬","愤怒","开心","发呆","玫瑰","佐罗","感冒","抓狂","呕吐","偷笑",
			"再见","闪人","鬼脸","饥饿","困","惊恐","擦汗","真棒","大兵","单挑",
			"鄙视","疑问","抗议","晕倒","大怒","衰","衰","嘘","天使","恶魔",
			"冷","爱心","发怒","小丑","大便","猪头","爱心","心碎","嘴唇","糖果",
			"蛋糕","炸弹","强","弱","握手","ok","鲜花","凋谢","礼物","吃饭"
			],
	this._hexch = new Array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'),
	this._DEFAULT_IMAGE = 'http://download.ntalker.com/res/resources/ntalkerfaces/1.jpg',
	
	this._CTRLENTER = false;
	this.bold = false;
	this.italic = false;
	this.underline = false;
	this.color = '#000000';
	this.fontsize = '12px';
	
	this._curWindMode = 'default';
	this._defaultZIndex = -9;
	this._focusZIndex = -1;
	
	this._version = Ntalker.version;
	this._isInited = false;
	this._initface = false;
	this._initcolor = false;
	this._avFlashCreated = false;
	this._uploadReady = [];
	this._tchatReady = false;
	this._d = document;
	this._db = this._d.body;
	
	this._C = Ntalker.Config;
	this._CP = Ntalker.Config.customparams;
	this._V = Ntalker.variable;
	
	this._jsURLPath = this._V.scriptPath;
	this._funcURLPath = this._C.services;
	
	this._myShowName = '\u6211';
	
	this.destInfo = {};
	this.myStreamid = null;
	this.destStreamid = null;
	this._serivce = [];
}
_p = Ntalker.ntChatWindow.prototype;
_p.showWindow = function(offset, miniTagElement) //
{
	DEBUG('showWindow', 1);
	var parent = miniTagElement || this._db;
	
	if(this._isInited) return;
	this._isInited = true;
	
	cacheDom = document.createDocumentFragment();
	this._left = offset.left || 0;
	this._self = __D.create('div', {id:this._selfId, style:'width:'+this._width+'px;height:'+this._height+'px;position:absolute;bottom:0px;_top:-415px;left:'+this._left+'px;outlineStyle:none;zIndex:'+this._defaultZIndex+';', className:'chatContainer'}, cacheDom);
	
	html = this.getChatWindowHtml();
	this._self.innerHTML = html;
	parent.appendChild(cacheDom);
	DEBUG('create chat window complete width=' + this._width);
	
	var self = this,
		_over = function(event){
			var el = __E.fixEvent(event).target,
				className = el.className;
			if( !className ) return;
			if( className.indexOf('disable') != -1 ){
				DEBUG('disable over', 1);
				return;
			}
			__D.replaceClass(el, 'out', 'over');
		},
		_out  = function(event){
			var el = __E.fixEvent(event).target,
				className = el.className;
			if( !className ) return;
			if( className.indexOf('disable') != -1 ){
				DEBUG('disable out', 1);
			}
			__D.replaceClass(el, 'over', 'out');
			if( __D.indexOfClass(el, 'select') ){
				__D.removeClass(el, 'out');
			}
		},
		_refused = function(){
			DEBUG('refused');
			if( self.destInfo['isBlocked'] ){
				self._chatFlash.JS_removeBlock();
			}else{
				self._chatFlash.JS_addBlocks();
			}
		},
		_userinfo = function(){
			DEBUG('userinfo');
			if( self._serivce['profile'] ){
				window.open(self._serivce['profile']);
			}
		},
		_addbuddy = function(){
			self._chatFlash.JS_addFriend();
			DEBUG('addbuddy');
		},
		_setempty = function(){
			var els = __$$('div.hidtoryArea ul li', this._self),
				len = els.length;
		
			for(var i=len; i>=0; i--)
			{
				try{
					if(els[i])els[i].parentNode.removeChild(els[i]);
				}catch(e){
					DEBUG(e.message, 4);
				}
			}
			DEBUG('setempty');
		},
		_queryrecord = function(){
			if(!self._serivce['historical']) return;
			
			window.open(self._serivce['historical']+'?siteid='+self._V['siteid']+'&srcuid='+self._V['user_id']+'&dstuid='+self._V['user_name']+'&sessionid='+self._V['user_sid']);
		},
		_sendAVRequest = function(type, state, active){
			self.requestAV(type, state, active);
		},
		_click = function(event){
			var el = __E.fixEvent(event).target,
				attr = el.getAttribute('current'),
				className = el.className,
				id = el.id;
			DEBUG('click className=' + className);
			
			className.indexOf('minimize') != -1 ? self.MinMax() :
			className.indexOf('close') != -1 ? self.close() :
			className.indexOf('refused') != -1 ? _refused() :
			className.indexOf('refusedok') != -1 ? _refusedok() :
			className.indexOf('userinfo') != -1 ? _userinfo() :
			className.indexOf('addbuddy') != -1 ? _addbuddy() :
			className.indexOf('font') != -1 ? self.openPanel('font') :
			
			className.indexOf('face') != -1 ? self.openPanel('face') :
			className.indexOf('audio') != -1 ? _sendAVRequest(0, 0, 1) : 
			className.indexOf('video') != -1 ? _sendAVRequest(1, 0, 1) : 
			className.indexOf('setempty') != -1 ? _setempty() : 
			className.indexOf('queryrecord') != -1 ? _queryrecord() : 
			
			className.indexOf('color') != -1 ? self.command(el, 'color') :
			className.indexOf('b') != -1 ? self.command(el, attr) :
			className.indexOf('i') != -1 ? self.command(el, attr) :
			className.indexOf('u') != -1 ? self.command(el, attr) :
			null;
		}
	;
	
	this.initEditorArea();
	
	DEBUG('create editor complete');
	
	this.createUploadFlash('uploadfile', '\u6587\u4ef6\u4e0a\u4f20', this._uploadFileFlashID);
	this.createUploadFlash('uploadimage', '\u56fe\u7247\u4e0a\u4f20', this._uploadImageFlashID);
	
	DEBUG('create upload flash complete');
	
	__$$.each('div.header div.minimize, div.header div.close, div.controlpanel div, div .font, div .face, div .audio, div .video, div .setempty, div .queryrecord, div.fontpanel span', function(el){
		__E.addEvent(el, 'mouseover', _over);
		__E.addEvent(el, 'mouseout',  _out);
		__E.addEvent(el, 'click',     _click);
	}, this._self);
	
	//show merchandise info
	this._chatFlash = __$$("#"+this._flashID)[0];
	
	DEBUG('bind event complete');
}
_p.MinMax = function()
{
	DEBUG('MinMax');
	switch(this._curWindMode){
		case 'default':
			this._curWindMode = "hide";
			__D.css(this._self, 'width', '1px');
			__D.css(this._self, 'height', '1px');
			__D.css(this._self, 'bottom', '-20px');
			break;
		case 'hide':
			this._curWindMode = "default";
			__D.css(this._self, 'width', this._width+'px');
			__D.css(this._self, 'height', this._height+'px');
			__D.css(this._self, 'bottom', '0px');
			break;
		default:
			this._curWindMode = "default";
			break;
	}
}

_p.hide = function()
{
	if(this._curWindMode=='default')
		this.MinMax();
}
_p.show = function()
{
	if(this._curWindMode=='hide')
		this.MinMax();
}
_p.close = function()
{
	if( parseInt(this._V['onlineChat']) < 10 ){
		this._V['onlineChat'] += 1;
	}else{
		this._V['onlineChat'] = 10;
	}
	
	//移除聊窗
	__D.css(this._self, "display", "none");
	try{
		this._self.parentNode.removeChild(this._self);
	}catch(e){
		;
	}
	delete this._self;
	if(this._freeChatFlashGoUrl != null && this._freeChatFlashGoUrl != ''){
		__C.load({src: this._freeChatFlashGoUrl});
	}
	if(this._presenceFlashGoUrl != null && this._presenceFlashGoUrl != ''){
	   __C.load({src: this._presenceFlashGoUrl});
	}
	
	//关闭工具条上聊窗节点
	IMToolBar.remove(this._destuid, this._chatType);
	
	chatWindowManager.removeChatWindow(this._destuid, this._chatType);
}
_p.onFocus = function()
{
	__D.css(this._self,'zIndex', this._focusZIndex);
	chatWindowManager.focusWindow(this._destuid, this._chatType);
}
_p.onBlur = function()
{
	__D.css(this._self,'zIndex', this._defaultZIndex);
}
_p.updateMyUserInfo = function(myInfo)
{
	var miniWin = IMToolBar.get(this._destuid, this._chatType);
	if(miniWin) miniWin.updateUserHead(myInfo['icon']);
}
_p.updataDestUserInfo = function(destInfo)
{
	this.destInfo = destInfo;
	//更新界面信息
	var statusDom = __$$('div.header .status', this._self)[0],
		nickDom = __$$('div.header .name', this._self)[0],
		sexDom = __$$('div.header .sex', this._self)[0],
		ageDom = __$$('div.control .age', this._self)[0],
		userinfoDom = __$$('div.controlpanel .userinfo', this._self)[0],
		addbuddyDom = __$$('div.controlpanel .addbuddy', this._self)[0],
		refusedDom = __$$('div.controlpanel .refused', this._self)[0]
	;
	
	nickDom.innerHTML = destInfo['name'];
	ageDom.innerHTML = destInfo['age']>0 ? destInfo['age']+'\u5c81' : '';
	__A.each(['online','away','busy','hide'], function(val){
		__D.removeClass(statusDom, 'val');
	});
	switch( parseInt(destInfo['status']) ){
		case 0: __D.addClass(statusDom, 'away'); break;
		case 1:__D.addClass(statusDom, 'online');break;
		case 2:__D.addClass(statusDom, 'hide');break;
		case 3:__D.addClass(statusDom, 'busy');break;
		case 4:__D.addClass(statusDom, 'away');break;
	}
	
	__A.each(['man','woman'], function(val){
		__D.removeClass(sexDom, 'val');
	});
	
	__D.addClass(sexDom, destInfo['sex']=='-1' ? 'woman' : 'man');
	
	if(this._serivce['historical']){
		this.disable('toolbar .queryrecord', false);
	}
	
	if(destInfo['profileurl']){
		__D.replaceClass(userinfoDom, 'disable', '');
	}
	if(destInfo['isFriend']){
		__D.css(addbuddyDom, 'display', 'none');
	}
	if(this._tchatReady){
		__D.replaceClass(addbuddyDom, 'disable', '');
		__D.replaceClass(userinfoDom, 'disable', '');
		__D.replaceClass(refusedDom, 'disable', '');
	}
	if(destInfo['refused']){
		__D.replaceClass(refusedDom, 'disable', '');
	}
}
_p.disable = function(selector, state)
//get|set button disable state
{
	var elem = __$$('div.'+selector, this._self)[0];
	if( typeof(state) == 'undefined' )
	{
		return __D.indexOfClass(elem, 'disable');
	}
	else{
		if( state ){
			__D.replaceClass(elem, 'disable', 'disable');
		}else{
			__D.replaceClass(elem, 'disable', '');
		}
		if( __D.indexOfClass(elem, 'files') ){
			this._uploadFileFlash.enableUpload(!state);
		}else if( __D.indexOfClass(elem, 'images') ){
			this._uploadImageFlash.enableUpload(!state);
		}
	}
}
_p.overOut = function(selector, sclass, rclass)
//from to button over or out 
{
	var elem = __$$('div.'+selector, this._self)[0];
	__D.replaceClass(elem, sclass, rclass);
}
_p.loadInfo = function(jsonData){
	var num = jsonData.infos_getinfoid.summary.totalnum,
		item = jsonData.list[0],
		infoid = item['infoid'],
		chatelement = __$$('div.infoarea', this._self)[0],
		html = []
	;
	if(!item.image) item.image = 'http://pic2.58.com/n/images/none.gif';
	html.push('<div class="proimage"><img src="'+item.image+'" onerror="this.src=\'http://pic2.58.com/n/images/none.gif\';" width="140" height="105" /></div>');
	for(var k in item)
	{
		if( typeof(item[k])=='string' && !/infoid|image|desc|url/.test(k) ){
			html.push('<div class="tit">'+item[k]+'</div>');
		}
	}
	if( item.desc )
		html.push('<div class="tcont"><a href="'+item.url+'"><span class="a_b">'+item.desc+'</span></a></div>');
	if( item.url )
		html.push('<div class="tcont"><a href="'+item.url+'">\u67e5\u770b\u66f4\u591a\u4fe1\u606f>></a></div>');
	
	chatelement.innerHTML = html.join('');
	
	this.infoVisible();
}
_p.infoVisible = function(){
	var chatcontent = __$$('div.chatcontent', this._self)[0],
		chatelement = __$$('div.infoarea', this._self)[0]
	;
	if(!chatcontent) DEBUG('chatcontent='+chatcontent, 3);
	if(!chatelement) DEBUG('chatelement='+chatelement, 3);
	this._width = this._maxwidth;
	__D.css(this._self, 'width', this._width + 'px');
	__D.css(chatcontent, 'width', (this._width - 20) + 'px');
	__D.css(chatelement, 'width', '160px');
}
_p.infoHidden = function(){
	var chatcontent = __$$('div.chatcontent', this._self)[0],
		chatelement = __$$('div.infoarea', this._self)[0]
	;
	this._width = this._minwidth;
	if(!chatcontent) DEBUG('chatcontent='+chatcontent, 3);
	if(!chatelement) DEBUG('chatelement='+chatelement, 3);
	__D.css(this._self, 'width', this._width + 'px');
	__D.css(chatcontent, 'width', (this._width - 10) + 'px');
	__D.css(chatelement, 'width', '1px');
}
//显示消息
_p.showMessage = function(json)
{
	if( !json || json==undefined ){
		DEBUG('showMessage(null);', 'ERROR');return;
	}
	DEBUG('showMessage(\''+__J.toJSONString(json)+'\');', 1);
	
	var el = __$$('div.hidtoryArea ul', this._self)[0],
		newElement = document.createElement('li'),
		icon = json.logo || this._DEFAULT_IMAGE,
		name = json.name || this._destnick,
		timer = json.timer || this.getTime(false),
		content = json.msg || '',
		type = parseInt(json.type) || 1,
		currCssText = ['word-wrap:break-word;word-break:break-all;text-align:left;'],
		nameColor = '#536ca2',
		size = json.size || '0 KB',
		url = json.url || '',
		oldfile = json.oldfile || ''
		html = '',
		m = /^(.*?)\[infoid:(\d+)\]$/.exec(content)
	;
	
	
	if( m ){
		content = m[1];
		this.infoid = m[2];
		url = 'http://api.58.com/info/id-'+this.infoid+'/?api_id=56&api_type=json&api_callback=OnGetItemInfo';
		__C.load({src: url}, false);
		this.infoVisible();
	}
	
	if( type === 1){
		currCssText.push('color:' + (json['color'].length>1 ? '#'+json['color'] : '#000000') + ';' );
		currCssText.push('text-decoration:' + (json['underline']=='true' ? 'underline' : 'none') + ';' );
		currCssText.push('font-style:' + (json['italic']=='true' ? 'italic' : 'normal') + ';' );
		currCssText.push('font-size:' + (parseInt(json['fontsize'])>0 ? json['fontsize'] : 14) + 'px;' );
		currCssText.push('font-weight:' + (json['bold']=='true' ? 'bold' : 'normal') + ';');
		content = this.formattingContent(content, 'input');
		
		newElement.innerHTML = ['<div class="title f12_blue">', name, '<div class="timer">', timer, '</div></div>', '<div class="messageContent" style="', currCssText.join(''), '">', content, '</div>'].join('');
	}else if( /1|2|3|4|9|10|11/ig.test(type) ){
		html = type === 2 ? ['<div class="system_right">' + timer + '<br />', '\u56fe\u7247 \u201c<a href="'+url+'" target="_blank">'+oldfile+'</a>\u201d ('+size+')' + content + '&nbsp;&nbsp;<br />','<div style="height:130px;width:auto;"><img src="'+url+'" /></div>', '</div>'].join('')
			:  type === 4 ? ['<div class="system_right">' + timer + '<br />', '\u6587\u4ef6 \u201c<a href="'+url+'" target="_blank">'+oldfile+'</a>\u201d ('+size+')' + content + '&nbsp;&nbsp;<a href="'+url+'" target="_blank">\u4fdd\u5b58</a><br />','</div>'].join('')
			:  type === 9 ? ['<div class="system_error">' + timer, '<br />' + content + '</div>'].join('')
			:  type === 10? ['<div class="system_right">' + timer, '<br />' + content + '</div>'].join('')
			:  type === 11? ['<div class="system_info">' + timer, '<br />' + content + '</div>'].join('') 
			:  '';
		//type === 3 ? ['<div class="system_info">' + timer, '<br />' + content + '</div>'].join('') :
		newElement.innerHTML = html;
	}else{
		DEBUG('\u672a\u77e5\u6d88\u606f\u7c7b\u578b.', 2);
		return;
	}
	el.appendChild(newElement);
	
	var historyDOM = __$$('div.hidtoryArea', this._self)[0];
	historyDOM.scrollTop = parseInt(__D.rect(el).h) - parseInt(__D.rect(historyDOM).h) + 50;
}
_p.sendMessage = function(jsonData)
{
	var userId = Ntalker.variable['user_id'],
		userName = Ntalker.variable['user_name'],
		userIcon = '',
		self = this,
		__toHex = function(n) {
			var h, l;
			n = Math.round(n);
			l = n % 16;
			h = Math.floor((n / 16)) % 16;
			return (self._hexch[h] + self._hexch[l]);
		},
		toHex = function(str){
			var m = /rgb\((\d+),\s+(\d+),\s+(\d+)\)/i.exec(str);
			return m ? (''+__toHex(m[1])+__toHex(m[2])+__toHex(m[3])) : '#000000';
		}
	;
	if(typeof jsonData != "undefined"){
		jsonData.destuid = this._destuid;
		jsonData.destname = this._destuname;
		jsonData.name = this._myShowName;
		jsonData.id = userId;
		jsonData.logo = userIcon;
		jsonData.timer= this.getTime(false);
		
		DEBUG('sendMessage(jsonData);');
		
		this.showMessage(jsonData);
		
		jsonData.name = userName;
		try{
			this._chatFlash.sendMessage(__J.toJSONString(jsonData));
			DEBUG('chatFlash.sendMessage("'+__J.toJSONString(jsonData)+'")', 1);
		}catch(e){
			DEBUG(e.message, 4);
		}
	}else{
		var content = this.getContentText(),
			json = {
				type: 1,
				destuid: this._destuid,
				destname: this._destuname,
				id: userId,
				name: this._myShowName,
				logo: userIcon,
				msg: '',
				timer: this.getTime(false)
			};
		
		editorHtml = this._editConWin.outerHTML
		json.bold = /(font\-weight:\s*bold)|<b>/ig.test(editorHtml).toString();
		json.italic = /(font\-style:\s*italic)|<i>/ig.test(editorHtml).toString();
		json.underline = /(text\-decoration:\s*underline)|<u>/ig.test(editorHtml).toString();
		json.color = /(.*)color:\s*(.*?);(.*)/ig.test(editorHtml) ? editorHtml.replace(/(.*)color:\s*(.*?);(.*)/i, "$2") : this.color;
		if( json['color'].indexOf('rgb(')!==-1 ){
			json['color'] = toHex(json['color']);
		}
		if( json['color'].indexOf('transparent')!==-1 ){
			json['color'] = '#000000';
		}
		
		json.msg = content.replace(/<.*?>/ig, '');
		
		DEBUG('sendMessage();');
		
		if( json.msg === '' ) return;
		
		this.showMessage(json);
		
		json.name = userName;
		try{
			this._chatFlash.sendMessage(__J.toJSONString(json));
			DEBUG('chatFlash.sendMessage("'+__J.toJSONString(json)+'")', 1);
		}catch(e){
			DEBUG(e.message, 4);
		}
	}
	
	try{
		this._editConWin.innerHTML = '&nbsp;';
		DEBUG('bold=' + this.bold + ', italic=' + this.italic + ', underline=' + this.underline, 1);
		this.bold && this.execute('bold');
		this.italic && this.execute('italic');
		this.underline && this.execute('underline');
		this.color && this.execute('ForeColor', this.color);
		//this.fontsize && _execute('FontSize', this.fontsize)
		this._editConWin.focus();
	}catch(e){}
}
_p.onReceiveMessage = function(json)
{
	json.timer = this.getTime(true, (json.timestamp + (isNaN(Ntalker.variable.JetLag) ? 0 : parseInt(Ntalker.variable.JetLag) ) ) );
	this.showMessage(json);
}
_p.getChatWindowHtml = function(){
	var html = [], fvars = [],
		swf = this._jsURLPath + '/fs/FlashTChat.swf?version=' + this._version.webchat_flash;
	
	fvars.push('v=' + this._version.webchat_flash);
	fvars.push('pageId=' + Ntalker.temp.pageId);
	fvars.push('r=' + this._jsURLPath);
	fvars.push('su=' + this._funcURLPath);
	fvars.push('t=' + encodeURIComponent(this._V['siteid']));
	fvars.push('u=' + encodeURIComponent(this._V['user_id']));
	fvars.push('n=' + encodeURIComponent(this._V['user_name']));
	fvars.push('s=' + encodeURIComponent(this._V['user_sid']));
	fvars.push('d=' + encodeURIComponent(this._destuid));
	fvars.push('dn=' + encodeURIComponent(this._destnick));
	
	html.push('<div style="width:1px;height:1px;font-size:1px;line-height:1px;margin:0;padding:0;">');
	if(__B.ie){
		html.push(	'<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28" id="'+this._flashID+'" width="1" height="1"> ',
					'<param name="movie" value="'+swf+'" /><param name="allowscriptaccess" value="always" /><param name="flashvars" value="'+fvars.join('&')+'" /> ',
					'</object>');
	}
	else{
		html.push(	'<embed src="' + swf + '" id="'+this._flashID+'" width="1" height="1" flashvars="'+fvars.join('&')+'" allowscriptaccess="always" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" ></embed>');
	}
	html.push(
		['</div>',
		 '<div class="header">',
			'<div class="status online"></div>',
			'<div class="name">\u6635\u79f0</div>',
			//'<div class="sex man"></div>',
			'<div class="close" title="\u5173\u95ed"></div>',
			'<div class="minimize" title="\u6700\u5c0f\u5316"></div>',
		'</div>',
		'<div class="clear"></div>',
		'<div class="control">',
			//'<span class="age">0</span>',
			'<div class="controlpanel">',
				'<div class="refused disable" title="\u7981\u8a00"></div>',
				'<div class="userinfo disable" title="\u67e5\u770b\u7528\u6237\u4fe1\u606f"></div>',
				'<div class="addbuddy disable" title="\u52a0\u4e3a\u597d\u53cb"></div>',
			'</div>',
		'</div>',
		'<div class="chatcontent" style="width:'+(this._width - 10)+'px;">',
			'<div class="chatarea">',
				'<div class="systemmessagespan"><span class="syscontent"></span><span class="sysclosebutton"></span></div>',
				'<div class="chatavwindow"></div>',
				'<div class="hidtoryArea">',
					'<ul></ul>',
				'</div>',
				'<div class="toolbar">',
					'<div class="font" title="\u5b57\u4f53\u6837\u5f0f"></div>',
					'<div class="face" title="\u8868\u60c5"></div> ',
					'<div class="files" title="\u6587\u4ef6\u4e0a\u4f20"></div>',
					'<div class="images" title="\u56fe\u7247\u4e0a\u4f20"></div>',
					//'<div class="audio" title="\u97f3\u9891\u4f1a\u8bdd"></div>',
					//'<div class="video" title="\u89c6\u9891\u4f1a\u8bdd"></div>',
					'<div class="setempty" title="\u6e05\u5c4f"></div>',
					'<div class="queryrecord disable" title="\u804a\u5929\u8bb0\u5f55"></div>',
					'<div class="clear"></div>',
					'<div class="toolbarpanel">',
						'<div class="fontpanel">',
							'<span class="b" current="bold" title="\u7c97\u4f53">B</span>',
							'<span class="i" current="italic" title="\u659c\u4f53">I</span>',
							'<span class="u" current="underline" title="\u4e0b\u5212\u7ebf">U</span>',
							'<span class="color" title="\u5b57\u4f53\u989c\u8272">',
								'<div class="currentcolor"></div>',
								'<div class="colorpanel">color panel</div>',
							'</span>',
						'</div>',
						'<div class="facepanel">face panel</div>',
					'</div>',
				'</div>',
				'<div class="clear"></div>',
				'<div class="editorArea">',
					'<div class="editor"></div>',
					'<div class="submit"></div>',
				'</div>',
			'</div>',
			'<div class="infoarea">',
				//'<div class="proimage"><img src="images/ntalker_skin1/0.jpg" width="140" height="105" /></div>',
				//'<div class="tit">价格：<span class="jia">998</span>元</div>',
				//'<div class="tit">时间：<span class="font_c">1小时前发布</span></div>',
				//'<div class="tcont"><a href="#"><span class="a_b">查看最新电脑配件/电脑配件电脑配件电脑配件电脑配件电配配件配件脑配件...</span></a></div>',
				//'<div class="tcon"><a href="#">查看更多信息>></a></div>',
			'</div>',
		'</div>'
	].join(''));
	
	return html.join('');
};
_p.openPanel = function(id)
{
	var panel = __$$('div .'+id+'panel', this._self)[0];
	if( !this._initface ) this.createFacePanel();
	if(panel && __D.css(panel, 'display') !== 'block'){
		__$$.each('div.toolbarpanel div.fontpanel, div.toolbarpanel div.facepanel', function(el){
			if( el === panel ){
				__D.css(el, 'display', 'block');
			}else{
				__D.css(el, 'display', 'none');
			}
		}, this._self);
	}else if(panel){
		__D.css(panel, 'display', 'none');
	}
}
_p.createFacePanel = function()
{
	var html = [], el = __$$('div .facepanel', this._self)[0], self = this;
	
	this._initface = true;
	
	for(var i = 1; i <= 60; i++){
		html.push('<img title="'+this._FACE_TEXT[(i-1)]+'" src="'+this._jsURLPath+'/images/faces/'+i+'.png" class="faceimage" style="border:1px solid #CCCCCC;background-color:#F7F7F7;margin:2px" />');
	}
	el.innerHTML = html.join('');
	
	__$$.each('div.facepanel img.faceimage', function(el){
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
			self.insertContentHtml('<img title="'+title+'" src="'+src+'" style="width:23px;height:23px;" />');
			__$$('div .facepanel', this._self)[0].style.display = 'none'; 
		});
	}, this._self);
}
_p.createColorPanel = function(parent)
{
	var html = [],  self = this,
		cnum = new Array(1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0),
		ash = new Array('F','E','D','C','B','A','9','8','7','6','5','4','3','2','1','0'),
		wc = function(r, g, b, n) {
			r = ((r * 16 + r) * 3 * (15 - n) + 0x80 * n) / 15;
			g = ((g * 16 + g) * 3 * (15 - n) + 0x80 * n) / 15;
			b = ((b * 16 + b) * 3 * (15 - n) + 0x80 * n) / 15;
			color = '#' + ToHex(r) + ToHex(g) + ToHex(b) + '';
			return ('<td bgcolor="'+color+'" style="border:1px solid '+color+';" height=8 width=8></td>');
		},
		ToHex = function(n) {
			var h, l;
			n = Math.round(n);
			l = n % 16;
			h = Math.floor((n / 16)) % 16;
			return (self._hexch[h] + self._hexch[l]);
		};
	
	DEBUG('_createColorPanel()');
	this._initcolor = true;
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
	parent.innerHTML = html.join('');
	
	function __overColor(event){
		var target = __E.fixEvent(event).target;
		__$$('.fontpanel div.currentcolor', this._self)[0].style.backgroundColor = target.bgColor;
	}
	function __outColor(event){
		var target = __E.fixEvent(event).target;
		__$$('.fontpanel div.currentcolor', this._self)[0].style.backgroundColor = target.bgColor;
	}
	function __clickColor(event){
		var target = __E.fixEvent(event).target,
			colorPanel = __$$('div.fontpanel .colorpanel', this._self)[0];
		__$$('.fontpanel div.currentcolor', this._self)[0].style.backgroundColor = target.bgColor;
		self.color = target.bgColor;
		self.execute('SelectAll');
		self.execute('ForeColor', self.color);
		self.execute('Unselect');
		DEBUG('FontColor '+self.color);
		__D.css(colorPanel, 'display', 'none');
	}
	__$$.each('div.colorpanel td', function(el){
		__E.addEvent(el, 'mouseover', __overColor);
		__E.addEvent(el, 'mouseout', __outColor);
		__E.addEvent(el, 'click', __clickColor);
	}, this._self);
}
_p.initEditorArea = function()
{
	DEBUG('initEditorArea');
	var self = this,
		_keyPress = function(event){
			var ev = __E.fixEvent(event);
			
			if(ev.keyCode==13){
				if(document.all) ev.returnValue=false;
				else ev.preventDefault();
			}
			if( this._CTRLENTER ){
				if( ev.keyCode==13 && ev.ctrlKey ){
					self.sendMessage();
				}else if( ev.keyCode==13 && !ev.ctrlKey ){
					self.insertContentHtml("<br />");
				}
			}else{
				if( ev.keyCode==13 && !ev.ctrlKey ){
					self.sendMessage();
				}else if( ev.keyCode==13 && ev.ctrlKey ){
					self.insertContentHtml("<br />");
				}
			}
			
			return true;
		},
		editorDOM = __$$('div .editor', this._self)[0],
		editorStyle = 'cursor:text;background:#fff; margin:0px; padding:0px; font-size:14px;overflow-x:hideen; overflow-y:auto;word-wrap: break-word; font-family: Arial;'
	;
	this._editConWin = __D.creElm({
		contentEditable: true,
		designMode: 'on',
		className: 'ntalkerChatEditorContent',
		style: 'width:310px;height:36px;background:transparent;margin:0;padding:0;display:block;cursor:text;'
	}, 'div', editorDOM);
	__E.addEvent(this._editConWin, 'keypress', _keyPress);
	__E.addEvent(this._editConWin, 'click', function(){
		__$$.setStyle('div.fontpanel, div.facepanel', 'display', 'none');
	});
	
	setTimeout(function(){
		__D.css(this._editConWin, 'display', 'block');
		__D.css(this._editConWin, 'float', 'left');
		__D.css(this._editConWin, 'overflow-y', 'auto');
		__D.css(this._editConWin, 'overflow-x', 'hidden');
	}, 0);
	
	__E.addEvent(__$$('div.submit', this._self)[0], 'click', function(event){
		var el = __E.fixEvent(event).target,
			className = el.className;
		if( className.indexOf('disable') != -1 ){
			DEBUG('disable click', 1);
			return;
		}
		self.sendMessage();
	});
	try{this._editConWin.focus()}catch(e){}
	
}
_p.createUploadFlash = function(action, alt, flashId){
	var flashswf = this._jsURLPath + '/fs/FileUpload.swf?action='+action+'&v=1.0.0&rnd=' + (new Date()).getTime(), 
		Html = __B.ie 
			? '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28" alt="'+alt+'" id="'+flashId+'" width="18" height="18"><param name="movie" value="'+flashswf+'" /><param name="allowscriptaccess" value="always" /><param name="flashvars" value="action=' + action + '&d=' + this._destuid + '&siteid=' + this._V['siteid'] + '&roomid=T2D" /></object>'
			: '<embed alt="'+alt+'" src="' + flashswf + '" id="'+flashId+'" width="18" height="18" flashvars="action=' + action + '&siteid=' + this._V['siteid'] + '&d=' + this._destuid + '&roomid=T2D" allowscriptaccess="always" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" ></embed>';
	
	if( action == 'uploadimage' ){
		__$$('div.toolbar div.images', this._self)[0].innerHTML = Html;
		this._uploadFileFlash = __$$('#'+flashId, this._self)[0];
	}else{
		__$$('div.toolbar div.files', this._self)[0].innerHTML = Html;
		this._uploadImageFlash = __$$('#'+flashId, this._self)[0];
	}
}
_p.execute = function(command, content) {
	this._editConWin.focus();
	document.execCommand(command, false, content);
}
_p.command = function(el, cmd){
	//DEBUG('el, cmd='+cmd);
	var className = el.className,
		colorPanel = __$$('div.fontpanel .colorpanel', this._self)[0]
	;
	if( className.indexOf('currentcolor') != -1 ){
		if(__D.css(colorPanel, 'display')!=='block'){
			if( !this._initcolor ) this.createColorPanel(colorPanel);
			__D.css(colorPanel, 'display', 'block');
		}else{
			__D.css(colorPanel, 'display', 'none');
		}
		return;
	}
	if( eval('(this.'+cmd+')') != true ){
		__D.addClass(el, 'select');
		eval('(this.'+cmd+' = true)');
	}else{
		__D.removeClass(el, 'select');
		eval('(this.'+cmd+' = false)');
	}
	
	this.execute(cmd.toLowerCase(), content);
	
	switch( cmd.toLowerCase() )
	{
		case 'bold': 
			__D.css(this._editConWin, 'font-weight', this.bold ? 'bold' : '');
			break;
		case 'italic':
			__D.css(this._editConWin, 'font-style', this.italic ? 'italic' : '');
			break;
		case 'underline': 
			__D.css(this._editConWin, 'text-decoration', this.underline ? 'underline' : '' );
			break;
		case 'fontcolor':
			__D.css(this._editConWin, 'color', content);
			this._fontcolor = content;
			break;
		case 'fontsize':
			__D.css(this._editConWin, 'font-size', content+'px');
			this._fontsize = content;
			break;
		case 'innerhtml':
			this._editConWin.innerHTML += content;
			break;
	}
}
_p.insertContentHtml = function(content) {
	if (__B.ie){
		this._editConWin.focus();
		this._editConWin.document.selection.createRange().pasteHTML(content);
	}else{
		this.execute("insertHTML", content);
	}
}
_p.getContentText = function(){
	var con = this._editConWin.innerHTML.replace(/^(&nbsp;)|\s*/, '');
	return this.formattingContent(con, 'output');//.replace(/<.*?>/gi, '')
},
_p.formattingContent = function(strCon, strIO){
	var self = this,
		__getFaceIndex = function(text){
			var len = self._FACE_TEXT.length;
			for(var j=0; j<len; j++){
				if( "["+self._FACE_TEXT[j]+"]" == text) return(j+1);
			}
			return 1;
		}
	;
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
			strCon = strCon.replace(match[i], match[i].replace(/\[[^(infoid:)](.*?)\]/i, "<img title=\"$1\" src=\""+this._jsURLPath+"/images/faces/"+index+".png\" style=\"width:23px;height:23px;\" />"));
		}
		return strCon;
	}
}
_p.getTime = function(serive, time){
	var d = time ? new Date(time) : new Date();
	return f(d.getHours()) + ':' + f(d.getMinutes()) + ':' + f(d.getSeconds());
	function f(n){return n<10 ? '0'+n : n };
}
_p.showSystemMessage = function(strMsg, type)
{
	var el = __$$('.systemmessagespan', this._self)[0],
		span = __$$('.systemmessagespan .syscontent', this._self)[0],
		btnclose = __$$('.systemmessagespan .sysclosebutton', this._self)[0]
	;
	__E.addEvent(btnclose, 'click', this.hideSystemMessage);
	this.msgType = type;
	span.style.backgroundImage = 'none';
	span.innerHTML = strMsg;
	el.style.display = 'block';
}
_p.hideSystemMessage = function()
{
	DEBUG('this.hideSystemMessage()');
	var el = __$$('.systemmessagespan', this._self)[0];
	el.style.display = 'none';
	this.msgType = null;
}
_p.requestAV = function(type, state, active){
	var requestObject = [['\u5bf9\u65b9','\u4f60'],['\u4f60','\u5bf9\u65b9']][active],
		RequestActive = ['\u53d1\u8d77','\u63a5\u53d7','\u62d2\u7edd','\u6302\u65ad'][state],
		requestType = ['\u97f3\u9891','\u89c6\u9891'][type],
		showMsg = requestObject[0] + RequestActive + (state>0 ? requestObject[1] : '') + requestType
	;
	try{
		this.showMessage({
			"type": 11,
			"msg": showMsg + '\u8bf7\u6c42.'
		});
		DEBUG(showMsg + '\u8bf7\u6c42. ');
		//send av request
		this._chatFlash.sendAVRequest(type, state);
		//create av flash
		if( /0|1/.test(state) )this.createAVFlash(type);
		if( state == 3 ){
			this.closeAVFlash(type);
			DEBUG('this.closeAVFlash('+type+')');
		}else if( state == 2 ){
			this.disable('toolbar .audio', false);
			this.disable('toolbar .video', false);
		}
		if( /1|2/.test(state) ) this.hideSystemMessage();
	}catch(e){
		this.showMessage({
			"type": 9,
			"msg": showMsg + '\u8bf7\u6c42\u5931\u8d25\uff0c\u8bf7\u7a0d\u5019\u91cd\u8bd5\uff01'
		});
	}
}
_p.receiveAV = function(type, state, jsonInfo)
{
	DEBUG('this.receiveAV('+type+','+state+','+jsonInfo+')');
	
	var requestType = ['\u97f3\u9891','\u89c6\u9891'][type],
		RequestActive = ['','\u60a8\u63a5\u53d7','','\u4f60\u6302\u65ad','\u5bf9\u65b9\u62d2\u7edd','\u5bf9\u65b9\u53d1\u8d77','\u5bf9\u65b9\u63a5\u53d7','\u5bf9\u65b9\u6302\u65ad'][state],
		showMsg = RequestActive + requestType
	;
	if( parseInt(state) == 7 && !this.AVPanel ){
		if( this.msgType ){
			this.hideSystemMessage();
			this.disable('toolbar .audio', false);
			this.disable('toolbar .video', false);
		}
		return;
	}
	this.showMessage({
		"type": 11,
		"msg": showMsg + '\u8bf7\u6c42.'
	});
	if( parseInt(state) == 5 ){
		this.disable('toolbar .audio', true);
		this.disable('toolbar .video', true);
		this.showSystemMessage(showMsg + '\u8bf7\u6c42, <a href="###" onclick="IM_systemMessageReceiveAV(\''+this._destuid+'\', '+type+', 1, 1);return false;">\u63a5\u53d7</a> <a href="###" onclick="IM_systemMessageReceiveAV(\''+this._destuid+'\', '+type+', 2, 1);return false;">\u62d2\u7edd</a>', type);
	}
	if( /3|4|7/.test(state) ){
		this.hideSystemMessage();
		this.closeAVFlash(type);
		DEBUG('this.closeAVFlash('+type+')');
	}
	if( state === 3 ){
		this._chatFlash.sendAVRequest(type, state);
		DEBUG('_chatFlash.sendAVRequest('+type+', '+state+');');
	}
	if( (state === 1 || state === 6) && jsonInfo ){
		this.myStreamid = jsonInfo.myStreamid;
		this.destStreamid = jsonInfo.destStreamid;
	}
}
_p.createAVFlash = function(type){
	if( this._avFlashCreated ) return;
	this._avFlashCreated = true;
	this._avFlashType = type;
	
	DEBUG('this.createAVFlash("'+type+'")');
	var html = [], 
		swf = this._jsURLPath + '/fs/AVPanel.swf?v='+Ntalker.version.avpanel_version,
		fv = ['siteid=' + this._V['siteid'], '&surl=' + this._serivce['avserver'], '&type=' + type + '&d=' + this._destuid]
	;
	__$$('.chatavwindow', this._self)[0].style.display = 'block';
	
	if(__B.ie){
		html.push('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28" ');
		html.push(' id="'+this._avFlashID+'" width="342" height="216" style="width:342px;height:216px;"> ');
		html.push('<param name="movie" value="'+swf+'" /> ');
		html.push('<param name="allowscriptaccess" value="always" /> ');
		html.push('<param name="flashvars" value="'+fv.join('')+'" /> ');
		html.push('</object>');
	}
	else{
		html.push('<embed src="' + swf + '" id="'+this._avFlashID+'" width="100%" height="216" flashvars="'+fv.join('')+'" allowscriptaccess="always" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" >');
		html.push('</embed>');
	}
	this.AVPanel = __D.insert(__$$('.chatavwindow', this._self)[0], html.join(''));
	__B.msie && __D.css(this.AVPanel, 'display', 'block');
	this._avFlash = __$$('#ntkf_chat_avflash')[0];
	return true;
}
_p.closeAVFlash = function(type)
//close av flash
{
	if( !this.AVPanel ) return;
	this._avFlashCreated = false;
	this._avFlashType = null;
	try{
		this.AVPanel.closeAV();
	}catch(e){}
	try{
		this.AVPanel.parentNode.removeChild(this.AVPanel);
		__$('chatavwindow').style.display = 'none';
	}catch(e){
		DEBUG(e.message, 3);
	}
	this.myStreamid = null;
	this.destStreamid = null;
	this.disable('toolbar .audio', false);
	this.disable('toolbar .video', false);
}
_p.onPresenceReceiveChatMsg = function(message){
	return;
}
/*聊窗管理器*/
Ntalker.ChatWindowManager = function()
//chat window manager
{
	this._chatWnds = new IMHashtable();
	this._chatWndsArray = new Array();
	//this._popupChatWnds = new IMHashtable();
	//this._creatingFlashWnds = new Array();
	this._windowWidth  = 0;
	this._windowHeight = 0;
	//this._windowTitleHeight = 20;
	//this._layoutRight = 0;
	//this._layoutLeft = 0;
	//this._layoutBottom = 0;
	//this._curLayoutTop = 0;
	//this._curLayoutBottom = 0;
	//this._curChatWindow = null;
	//this._curWindowIndex = -1;
};
_p = Ntalker.ChatWindowManager.prototype;
_p.addChatWindow = function(destuid, destnick, chatid, message, logoUrl, OpenType, chatType, roomtype, userinfo, befrom){
	var _C = Ntalker.Config, _CP= Ntalker.Config.customparams, _V = Ntalker.variable;
	var chatRect = {left:0,top:0,right:0,bottom:0};
	var _autoFocus = true;
	var chatWindowKey = /^(nquan|room|group|chat)$/.test(chatType) ? destuid + chatType : 'chat';
	this._windowWidth  = /^(nquan|room|group)$/.test(chatType) ? _C['groupWidth'] : _C['chatWidth'];
	this._windowHeight = /^(nquan|room|group)$/.test(chatType) ? _C['groupHeight'] : _C['chatHeight'];
	var chatWndsArray = chatWindowManager._chatWndsArray, 
		chatWndCount = chatWndsArray.length, 
		existMaxChatWnd = false;
	if( OpenType == -1 ){
		_autoFocus = false;
	}else if( OpenType == 0 ){
		_autoFocus = chatWndCount==0 ? true : false;
	}else {
		if( chatWndCount > 0 ){
			for(var i = 0; i < chatWndCount; i++ ){
				if( chatWndsArray[i]._curWindMode != 'hide' ){
					_autoFocus = true;
					break;
				}
			}
		}else{
			_autoFocus = true;
		}
	}
	var chatWindow = this.getChatWindow(destuid, chatType);
	if( chatWindow ){
		if( chatType == 'chat' && !IMToolBar.get(destuid, chatType) ){
			IMToolBar.add(destuid, destnick, logoUrl, _autoFocus, chatType, OpenType, userinfo);
		}
		if( _autoFocus ){
			DEBUG('<b>addChatWindow(), focusWindow</b>');
			IMToolBar.focusTag(destuid, chatType);
			this.OnTBFocusWindow(destuid, chatType, destnick);
		}
		chatWindow.onPresenceReceiveChatMsg(message);
		return;
	}
	if( chatType == 'chat' ){
		var newChatWindow = new Ntalker.ntChatWindow(destuid, destnick, chatid, this._layout, chatType, roomtype, OpenType, userinfo, befrom);
	}else{
		var newChatWindow = new Ntalker.ntGroupWindow(destuid, destnick, chatid, this._layout, chatType, roomtype, OpenType, userinfo, befrom);
	}
	var l = this._chatWndsArray.length;
	for(var i=0; i<l; i++){
		this._chatWndsArray[i].hide();
	}
	var minWnd = IMToolBar.add(destuid, destnick, logoUrl, _autoFocus, chatType, OpenType);
	var miniTagElement = minWnd.tagElement;
	DEBUG(miniTagElement);
	var mRt = minWnd.getPost();
	var tRt = __D.clientRect(IMToolBar.contentElement);
	var x;
	if( IMToolBar.currentToolbarMode == 2 ){
		x = mRt.rx - this._windowWidth - tRt.left;
	}else{
		x = Math.min(mRt.x, tRt.w - this._windowWidth - _C['IMWidth'] - 10);
	}
	var chatRect = {left:x, top:0, bottom:0, right:0};
	newChatWindow.showWindow(chatRect, miniTagElement);
	this._chatWnds.add(chatWindowKey, newChatWindow);
	this._chatWndsArray.push(newChatWindow);
	//this._curChatWindow = newChatWindow;
	var type,i,desc; 
	switch(chatType){
		case "group":
		case "room":
			type=2;desc=NtLang['sd_GroupWindow'];break;
		case "nquan":
			type=15;
			desc=NtLang['sd_NQuanWindow'];
			break;
		default:type=0;desc=NtLang['sd_ChatWindow'];break;
	}
	__C.load({tagName:'img', href:Ntalker.Config.services + '/func/statistic.php?', 
		params:{
			siteid: _V['siteid'],
			uid: _V['user_id'],
			destid: /^(room|group|nquan|traing)$/.test(this._chatType) ? 0 : this._destuid,
			groupid: /^(room|group|nquan|traing)$/.test(this._chatType) ? this._destuid : 0,
			type: type,
			desc: encodeURIComponent(desc),
			from: befrom,
			rnd: new Date().getTime()
		}, width:1,height:1
	});
};
_p.removeChatWindow = function(destuid, chatType){
	var chatWindow = this.getChatWindow(destuid, chatType);
	if (!chatWindow) return false;
	this._chatWnds.remove( destuid + chatType);
	//var isCurWindow = false;
	var deleteWindowIndex = -1;
	for (i = 0; i < this._chatWndsArray.length; i++) {
		if (this._chatWndsArray[i]._destuid == destuid && this._chatWndsArray[i]._chatType==chatType){
			this._chatWndsArray.splice(i, 1);
			deleteWindowIndex = i;
			//if (i == this._curWindowIndex) isCurWindow = true;
			break;
		}
	}
	/*
	if (this._chatWndsArray.length == 0) {
		this._curWindowIndex = -1;
		this._curLayoutTop = this._layoutBottom;
		return;
	}
	
	if(isCurWindow){
		if(this._curWindowIndex==0){
			newCurWindowIndex = this._curWindowIndex;
			this._curWindowIndex = -1;
		}
		if(this._curWindowIndex>0){
			newCurWindowIndex = this._curWindowIndex-1;
			this._curWindowIndex = -1;
		}
		this.layoutWindow(this._chatWndsArray[newCurWindowIndex]._destuid, this._chatWndsArray[newCurWindowIndex]._chatType);
	}
	else{
		if(deleteWindowIndex < this._curWindowIndex)
			this._curWindowIndex--;
		this.layoutWindow();
	}
	*/
};
/*
_p.removePopupWindow = function(destuid, chatType){
	this._popupChatWnds.remove(destuid, chatType);
};
*/
_p.focusWindow = function(destuid, chatType){
	var chatWindow = this.getChatWindow(destuid, chatType);
	var _V = Ntalker.variable;
	if(chatWindow._curWindMode == "default")
		return;
	for(var k in this._chatWnds._hash){
		chatWindow = this._chatWnds._hash[k];
		if(chatWindow._destuid!=destuid || chatWindow._chatType != chatType){
			chatWindow.onBlur();
		}
		/*
		else{
			this._curChatWindow = chatWindow;
		}
		*/
	}
};
_p.closeAll = function(){
	for(var k in this._chatWnds._hash){
		chatWindow = this._chatWnds._hash[k];
		if(chatWindow&&chatWindow.close)
			chatWindow.close();
	}
};
_p.getChatWindow = function(destuid, chatType){
	chatType = /^(group|room|nquan|traing|chat)$/.test(chatType) ? chatType : 'chat';
	return this._chatWnds.items(destuid + chatType);
};
_p.proIDChatWindow = function(infoid){
	for(var k in this._chatWnds._hash){
		chatWindow = this._chatWnds._hash[k];
		if(chatWindow&&chatWindow.infoid == infoid)
			return chatWindow;
	}
	return null;
};
_p.flashWindowTitle = function(destuid, chatType){
	var chatWindow = this.getChatWindow(destuid, chatType);
	if(chatWindow){
		titleText =  chatWindow ._isFlashTitle ? chatWindow ._flashTitleText : chatWindow ._titleText;
		chatWindow.changeTitle(titleText);
	}
};
_p.OnTBFocusWindow = function(destuid, chatType, destname, isCloseChat){
	var moveToX, l = this._chatWndsArray.length, _C = Ntalker.Config;
	isCloseChat = isCloseChat ? true : false;
	for(var i=0; i < l; i++){
		var chatWindow = this._chatWndsArray[i];
		if(chatWindow._destuid==destuid && chatWindow._chatType==chatType){
			//chatWindow._curWindMode = "hide";
			chatWindow.MinMax();
		}else{
			if(chatWindow._curWindMode == 'default'){
				chatWindow.MinMax();
			}
		}
	}
};
var NtMenu = function (debug){ 
	this._debug = debug;
	this._Hash = new IMHashtable();
	this._span = null;
	this._Button = null;
	this._over  = {};
	this._out   = {};
	this._click = {};
	this._overItem = false;
	this._className = '';
	this._overClassName = '';
	this.init = function(span, Btn, mattr, over, out, click, visibleNoneCallFunction, visibleCallFunction, openedCallFunction){
		this._span = span;
		this._Button  = Btn;
		this._mAttr = mattr;
		this._over = over;
		this._out  = out;
		this._click= click;
		this.visibleNoneCallFunction = visibleNoneCallFunction;
		this.visibleCallFunction = visibleCallFunction;
		this.openedCallFunction = openedCallFunction;
		this._timer = null;
		this._Menu = null;
		this._MenuID = mattr['id'];
		this._MenuInited = false;
		this._MenuContentElement = null;
		var self = this;
		var __showMenu = function(e){self.show();};
		__E.addEvent(this._Button, 'click', __showMenu);
	};
	this.add = function(k, obj){
		if( this._Hash.items(k) ){
			return false;
		}
		this._Hash.add(k, obj);
	};
	this.remove = function(k){
		this._Hash.remove(k);
	};
	this.get = function(k){
		return this._Hash.items(k);
	};
	this.length = function(){
		return this._Hash.count();
	};
	this.hidden = function(){
		if( this._debug ){
			return;
		}
		try{
			clearInterval(this._timer);
			this._Menu.parentNode.removeChild(this._Menu);
			this._MenuInited = false;
		}catch(e){}
	};
	this.show = function(){
		var self = this;
		var _B = this._Button,_PN = this._span, _U, 
		_mAttr = this._mAttr, _O1 = this._over, _O2 = this._out, _O3 = this._click;
		if(this._Hash.count()==0 && typeof self.visibleNoneCallFunction == 'function'){
			self.visibleNoneCallFunction.call(this);
			return;
		}
		if( this._MenuInited && typeof(self.openedCallFunction) == 'function' ){
			self.openedCallFunction.call(this);
			return;
		}
		var __menuHidden = function(){
			if(!self._overItem){
				self.hidden();
			}
		};
		var __menuOver = function(e){
			var Func = _O1.callback, event, target;
			self._overItem = true;
			event = __E.fixEvent(e);
			target= searchTag(event.target, "li");
			__D.replaceClass(target, _O2.className, _O1.className);
			if(typeof Func == 'function') Func.call(this, target);
		};
		var __menuOut = function(e){
			var Func = _O2.callback, event, target;
			self._overItem = false;
			event = __E.fixEvent(e);
			target= searchTag(event.target, "li");
			__D.replaceClass(target, _O1.className, _O2.className);
			if(typeof Func == 'function') Func.call(this, target);
		};
		var __menuClick = function(e){
			var Func = _O3.callback, Exec = _O3.exec, event, target, M = self._Menu;
			event = __E.fixEvent(e);
			target= searchTag(event.target, "li");
			if(typeof Func == 'function'){
				Func.call(this, target);
			}
			if( Exec===false ){
				return;
			}
			try{
				self.remove(target.getAttribute('k'));
				M.parentNode.removeChild(M);
			}catch(e){}
		//点击消息菜单项会移除菜单，同时必须清除定时器，否则按钮over事件会再次打开菜单，群菜单会打开群列表
			clearInterval(self._timer);
		};
		function createChildNode(attribute, parentNode){
			var tagName = attribute.tagName ? attribute.tagName : 'div';
			var className = attribute.className ? attribute.className : '';
			var styleText = attribute.style ? attribute.style : '';
			var childNode = attribute.childNode;
			parentNode = __D.create(tagName, {className:className, style:styleText}, parentNode);
			if( childNode ){
				return createChildNode(childNode, parentNode);
			}else{
				return parentNode;
			}
		}
		if( !__$(this._MenuID)){
			var _Ht = ['<' + (_mAttr.tagName ? _mAttr.tagName : 'span')];
			for(var attr in _mAttr){
				if( !/^(tagName|childNode)$/.test(attr) ){
					_Ht.push(' ' + (attr.toLowerCase()=='classname' ? 'class' : attr) + '="' + _mAttr[attr]+'"');
				}
			}
			_Ht.push('>');
			_Ht.push('</' + (_mAttr.tagName ? _mAttr.tagName : 'span') + '>');
			this._Menu = this._MenuContentElement = __D.insert(_PN, _Ht.join(''), 'beforeend');
			if( _mAttr.childNode ){
				this._MenuContentElement = createChildNode(_mAttr.childNode, this._MenuContentElement);
			}
			this._overItem = true;
			self._timer = setInterval(__menuHidden, 500);
		}
		this._MenuContentElement.innerHTML = '';
		_U = __D.insert(this._MenuContentElement, '<ul class="NtMenuMessageBox"></ul>');
		for(var k in this._Hash._hash){
			var _V1 = this._Hash._hash[k], _Ht = ['<li k="' + k + '"'], type = 'item';
			for(var ck in _V1.custom){
				if (ck.toLowerCase() == 'type' )
					type = _V1.custom[ck];
				if(ck.toLowerCase()=='classname')
					_Ht.push(' class="' + _V1.custom[ck]+' '+_O2.className + '"');
				else
					_Ht.push(' ' + ck + '="' + _V1.custom[ck] + '"');
			}
			_Ht.push('><div><a href="javascript:void(0)">' + _V1.text + '</a></div></li>');
			_L = __D.insert(_U, _Ht.join(''), 'beforeend');
			if ( type == 'item' ){
				__E.addEvent(_L, 'mouseover', __menuOver);
				__E.addEvent(_L, 'mouseout', __menuOut);
				__E.addEvent(_L, 'click', __menuClick);
			}else if(type=='close'){
				 __E.addEvent(__D.filter((__D.filter(_L.childNodes)[0]).childNodes)[0], 'click', __menuClick);
			}
		}
		this._MenuInited = true;
		//显示菜单时,执行自定义操作,添加自定义菜单项
		if( typeof self.visibleCallFunction == 'function'){
			self.visibleCallFunction.call(this, _U);
		}
		__A.each([_B,this._MenuContentElement], function(elem){
			__E.addEvent(elem, 'mouseover', function(e){self._overItem = true;});
			__E.addEvent(elem, 'mouseout', function(e){self._overItem = false;});
		});
	};
};
var ntTip = function (parent, content, k, callback){
	this._parent = parent;
	this._id = 'apptipid';
	this._element = null;
	this._content = content;
	this._key = k;
	
	this._fn = callback;
	this._timer = null;
};
ntTip.prototype.init = function(content){
	var _C = Ntalker.Config, _V = Ntalker.variable;
	
	DEBUG('nttip init');
	this._content = content;
	
	var html = '<span class="app_itemTip" style="height:75px;width:156px;cursor:pointer;overflow:hidden;display:none;position:absolute;top:0px;left:0px;background:url(' + _C['publicDIR'] + 'tb_bottom_tip.png) no-repeat 25px bottom;color:#FFFFFF; font-size:9pt;font-weight:100;display:none;z-index:2147483647;text-align:center;line-height:18px;">'
			+  '<div class="app_itemTip_close" style="height:15px;width:15px;right:8px; top: 5px;_filter:alpha(opacity:50);opacity:0.5;line-height:15px;cursor:pointer;position:absolute;">&nbsp;&nbsp;&nbsp;</div>'
			+  '<div class="app_tuan_content" Style="background:#ffff99;overflow:hidden;margin:0px;padding:1px;border:1px solid #ffcc00;line-height:18px; white-space: normal;">' + this._content + '</div></span>';
	
	var el = __D.insert(this._parent, html);
	this._element = el;
	
	__E.addEvent(el, 'mouseover',function(e){var event = __E.fixEvent(e);event.stopPropagation(e);});
	__E.addEvent(el, 'mouseout',function(e){var event = __E.fixEvent(e);event.stopPropagation(e);});
	
	//__D.css(el, 'height', '1px');
	
	//绑定关闭团购事件
	var btnClose = __D.filter(el.childNodes)[0], self = this;
	function overCloseTip(e){
		__D.css(btnClose, 'backgroundColor', '#ccc');
	};
	function outCloseTip(e){
		__D.css(btnClose, 'backgroundColor', '');
    };
	function clickCloseTip(e){
		var event = __E.fixEvent(e).stopPropagation();
		self.hiden(self._key);
	};
	function clickOpenApp(e){
		var event = __E.fixEvent(e).stopPropagation();
		if( self._fn ) self._fn(e);
		self.hiden(self._key);
	};
	__E.addEvent(this._element, 'click', clickOpenApp);
	if( btnClose ){
		__E.addEvent(btnClose, 'mouseover', overCloseTip);
		__E.addEvent(btnClose, 'mouseout', outCloseTip);
		__E.addEvent(btnClose, 'click', clickCloseTip);
	}
	
	return el;
};
ntTip.prototype.show = function(){
	var _C = Ntalker.Config, _V = Ntalker.variable;
	if( __Cookie.get('ntalkerhiddennewapplication') == '1' ){
		DEBUG('Tip has shown that had, return.');
		return;
	}
	
	//统计应用TIP显示次数
	var url = _C['services'] + "/func/statistic.php?siteid="+_V['siteid']+"&uid="+_V['user_id']+"&type=22&mode=1&from=show tip&rnd="+new Date().getTime();
	__C.load({src: url});
	
	var el = this._element;
	try{
		__D.css(el, 'display', 'block');
		__D.animate(el, {top:'-75px'}, 3000, 'easeOutElastic', function(){});
	}catch(e){}
	
	this._timer = setTimeout(function(){
		DEBUG('Tip has shown that 5 seconds, set cookie.');
		NtUtil.onlyOne('ntalkerhiddennewapplication', "nd", 1);
	}, 5000);
};
ntTip.prototype.hiden = function(k){
	var el = this._element;
	if( this._key != k || !el ) return;
	__D.css(el,'display','none');
	clearTimeout(this._timer);
	DEBUG('Hidden tip , set cookie.');
	NtUtil.onlyOne('ntalkerhiddennewapplication', "nd", 1);
};
function ntBarNode(destuid, destname, headURL, isAutoFocus, chatType, OpenType, userInfo){
	this._focus = true;
	this._destuid = destuid;
	this._destnick = destname || '';
	this._chatType = chatType || 'chat';
	this._openType = OpenType;
	this._headURL = headURL || '';
	this._userInfo = userInfo || '';
	this._tagId = 'ntalkerbarMinTag' + this._destuid + this._chatType;
	this._spanId = 'ntTagSpanWindow' + (this._chatType=='chat' ? '' : this._destuid) + this._chatType;
	this.autoFocus = isAutoFocus;
	this.Element = null;
	this.tagElement = null;
	this._counter = 0;
	this.originTitle = '';
}
ntBarNode.prototype = {
	init: function(parent){
		var _Ht = [], elem, _C = Ntalker.Config;
		this.originTitle = __S.cut(this._destnick, 5, true);
		var imgsrc = _C['publicDIR'] + '/'+this._chatType.toLowerCase()+'.' + (__B.ie6?'gif':'png');
		if( !__$(this._spanId) ){
			this.tagElement = __D.insert(__$('ntalkerbar'), '<div class="ntSpanWindow" id="' + this._spanId + '"></div>');
		}else{
			this.tagElement = __$(this._spanId);
		}
		_Ht.push( '<div class="win" id="' + this._tagId + '">' );
		_Ht.push(	 '<span class="ico"><img src="' + imgsrc + '" border="0" /></span>' );
		_Ht.push(	 '<span class="title">' );
		_Ht.push(	 this.originTitle);
		_Ht.push(	 '</span>');
		_Ht.push(	 '<span class="button" id="'+this._destuid+'" chattype="'+this._chatType+'"></span>' );
		_Ht.push( '</div>' );
		elem = this.Element = __D.insert(parent, _Ht.join(''), 'BeforeEnd');
		if(this.autoFocus){
			this.onFocus();
		}else{
			this.onBlur();
		}
		var self = this;
		Ntalker.temp.current_tag = [self._destuid, self._chatType];
		var __clickMinWindow = function(e){
			var _self = self;
			Ntalker.temp.current_tag = [_self._destuid, _self._chatType];
			DEBUG('<b>ntBarNode.init :: onClick('+_self._destuid+','+_self._destnick+', '+_self._chatType+')</b>');
			if( !_self._focus ){
				IMToolBar.focusTag(_self._destuid, _self._chatType);
			}else{
				IMToolBar.focusTag();
			}
		};
		var __overMinWindow  = function(e){
			current = e ? e.currentTarget : window.event.srcElement;
			if( current.className.indexOf("win")==-1 ) current = current.parentNode;
			if( current.className.indexOf("win")!=-1 ) __D.addClass(current, "hover");
		};
		var __outMinWindow = function(e){
			current = e ? e.currentTarget : window.event.srcElement;
			if( current.className.indexOf("win")==-1 ) current = current.parentNode;
			if( current.className.indexOf("win")!=-1 ) __D.removeClass(current, "hover", "");
		};
		var __clickClose = function(e){
			DEBUG('ntBarNode.init :: clickClose');
			var _self = self;
			__E.fixEvent(e).stopPropagation();
			fIM_CloseChatWindow(_self._destuid, _self._chatType);
		};
		var closeButton = __D.filter(elem.childNodes)[2];
		__E.addEvent(elem, 'click', __clickMinWindow);
		__E.addEvent(elem, 'mouseover', __overMinWindow);
		__E.addEvent(elem, 'mouseout',  __outMinWindow);
		__E.addEvent(closeButton, 'click',  __clickClose);
		if( this._openType == 0 ){
			this.onReceiveMiniMessage();
		}
		return elem;
	},
	updateUserHead:function(src, intStatus){
		var image = __$$("div#" + this._tagId + ">span.ico>img")[0];
		if( !image ){
			image = __D.filter(__D.filter(__$(this._tagId).childNodes)[0].childNodes)[0];
		}
		image.src = src;
		image.onload = function(){
			if(this.width>this.height){
				_width = 20;
				_height= 20/this.width*this.height;
			}else{
				_height= 20;
				_width = 20/this.height*this.width;
			}
			this.width  = _width;
			this.height = _height;
		};
	},
	getPost: function(){
		var scrollLeft = __$('nt_area').scrollLeft;
		var contentElementX = __D.clientRect( IMToolBar.contentElement ).left;
		var mRt = __D.clientRect(this.Element);
		var _x  = mRt.left-(__B.ie6 ? 2 : 0) - scrollLeft - contentElementX;
		var _rx = mRt.left+mRt.w+(__B.ie6 ? 2 : 0) - scrollLeft;
		return {x:_x, y:mRt.top, w:mRt.w, h:mRt.h,rx:_rx};
	},
	onFocus: function( ){
		var _V = Ntalker.variable;
		for(var k in IMToolBar.minWindows._hash){
			IMToolBar.minWindows._hash[k].onBlur();
		}
		this._focus = true;
		if( this._chatType=='chat' ){
			IMToolBar._currentTagId = this._tagId;
		}
		__D.removeClass(this.Element, 'flash');
		__D.replaceClass(this.Element, 'hover', "selected");
		//if(this._destuid) {
		//	_V['OnFocusWinParam'] = [this._destuid, this._chatType, this._destnick];
		//}
		//2010-5-25 聊窗获得焦点时,关闭APP菜单
		IMToolBar.leftMutex && IMToolBar.leftMutex('');
		
		var tagRect = this.getPost();
		return tagRect;
	},
	onBlur: function( ){
		this._focus = false;
		__D.removeClass(this.Element, 'flash');
		__D.replaceClass(this.Element, "selected", '');
	},
	onReceiveMiniMessage: function(message){
		var titleText;
		titleText = message ? sprintf(NtLang['sayContent'], message) : this.originTitle;
		if ( this.timerID )
			return;
		if ( this._focus ) return;
		this.promptMsg = __S.cut( titleText, 5 );
		this.flashWindowTitle();
	},
	flashWindowTitle: function(){
		var elem = this.Element;
		if(this._focus){
			clearInterval(this.timerID);
			this.timerID = null;
			this._counter = 0;
			return;
		}
		if(this._counter%2==1){
			__D.replaceClass(elem, '', "flash");
		}else{
			__D.replaceClass(elem, "flash", '');
		}
		var self = this, Timer = this._counter%2==1 ? 1000 : 500;
		this._counter = parseInt(this._counter) + 1;
		this.timerID = setTimeout(function(){
			var toolbarTag = IMToolBar.get(self._destuid, self._chatType);
			toolbarTag && toolbarTag.flashWindowTitle();
		}, Timer);
	}
};
function ntToolbar(){ 
	this._bindingScroll = false;
	this.element = null;
	this.minWidth = 700;
	this.inited = [];
	this._Hash = [];
	this._feedHeight=0;
	this._spanHeight=0;
	this._Button="";
	this._customMessageCount=0;
	this._fnum=0;
	this._inum=0;
	this._rfnum=0;
	this._rinum=0;
	
	//工具条内用于定位的节点
	this.contentElement = null;
	this.AreaElement = null;
	this.resetCurTop = false;
	this.minWindows = new IMHashtable();
	
	//工具条按钮闪烁
	this._timer = [];//延时时间
	this._flashNum = [];//闪烁次数
	this._stopFlash = [];//将要停止闪烁列表
	this._flashClassName = [];
	
	//for IE 6 onScroll
	this.InitExpression = false;
	this.scroltimerID = null;
	this.resizetimerID = null;
	this.btnSwitchWidth = 0;
	
	//当前工具条模式
	//0:精简模式|1:通栏模式|2:最小化模式
	this.initToolbarMode = 0;
	this.currentToolbarMode = 1;
	//是否是通栏模式
	this.isSpread = false;
	this.styleElement = null;
	//是否存在自定义按钮
	 this.isExisitCustomButton = false;
	//应用背景层
	this.backgroundDiv = null;
	//应用于多聊窗同一UI界面
	this._currentTagId = null;
	
	//设置菜单默认值
	this.jsonConfiguration = {
		acceptOriginalFeed: true, // 是否接收原创的动态消息
		acceptCommentFeed: true,  // 是否接收评论的动态消息
		groupSetting: false,	   // 群消息设置
		buddyLoginTip: true,	  // 好友上线提示
		acceptMsgFlag: "1",	   // 接收消息标记（1：接收所有消息，2：只接收好友消息，3：拒收所有消息，暂时不使用）
		audioOnFlag:"0"
	};
	this.newApplicationId = null;
	this.curApplicationId = null;
}
var _NtBar = ntToolbar.prototype;
_NtBar.init = function(){
	var _CP = Ntalker.Config.customparams;
	this.initToolbarMode = __Cookie.get(Ntalker.tbModelKEY);
	if(_CP["intact"] == 1){
		this.isSpread = true;
	}
	if( this.initToolbarMode == '2' ){
		this.currentToolbarMode = 2;
	}else{
		this.currentToolbarMode = _CP["intact"];
	}
	this.initToolBar();
	this.setExpression(this.currentToolbarMode);
	this.initConfigurationMenu();
	this.initFriendButton();
	this.initGroupMessage();
	this.initMessageBox();
	if ( this.isSpread ){
		this.initSiteApplication();
		this.initHotFocus();
	}
	this.initShowToolBarButton();
	this.initScroll();
	this.closeMenuOrWindow();
	this.initCustomApplication();
	DEBUG("ntToolbar.init::initCustomApplication");
};
_NtBar.closeMenuOrWindow = function(){
	var self = this;
	var __closeMenuOrWindow = function(e){
		var event = __E.fixEvent(e);
		var targetElement = event.target;
		while(targetElement){
		if( /^(ntalkerbar-wrapper|ntalkerbar)$/.test(targetElement.id) ){
				return;
			}
			targetElement = targetElement.parentNode;
		}
		//左菜单或窗口
		//siteApplication,siteHotFocus,applicationItem
		self.leftMutex('', true);
		//消息盒子
		self.closeMessagebox();
		//关闭设置菜单日
		self.hiddenConfigurationMenu();
	};
	var Element = __B.ie ? document : window;
	__E.addEvent(Element, 'click', __closeMenuOrWindow);
};
_NtBar.add = function(destuid, destname, headURL, isAutoFocus, type, customModel, userInfo){
	var Tag, k = type + destuid, 
		parentNode = __$('nt_wins'), 
		_V = Ntalker.variable, _C = Ntalker.Config,
		self = this;
	if ( this.get( k ) ) return;
	Tag = new ntBarNode(destuid, destname, headURL, isAutoFocus, type, customModel, userInfo);
	Tag.init(parentNode);
	this.minWindows.add(k, Tag);
	if( type == 'chat' ){
		this._currentTagId = Tag._tagId;
	}
	if( this.currentToolbarMode == 0 ){
		//转为通栏
		this.setToolBarMode(1, true);
	}
	this.onToolBarTextChanage();
	
	//2010-5-25 App菜单等关闭
	self.leftMutex('');
	if( /0|1/.test(self.currentToolbarMode) ){
		self.initScroll();
	}else{
		self.Mutex('');
	}
	return Tag;
};
_NtBar.getNext = function(destuid, type){
	var currentUid, currentNick, currentChatType, 
		isGetNext = false;
	for(var k in this.minWindows._hash){
		var minTag = this.minWindows._hash[k];
		if(minTag._destuid == destuid && minTag._chatType == type){
			isGetNext = true;
			if(currentUid){
				return [currentUid, currentNick, currentChatType];
			}
		}else{
			currentUid = minTag._destuid;
			currentNick = minTag._destnick;
			currentChatType = minTag._chatType;
			if(isGetNext){
				return [currentUid, currentNick, currentChatType];
			}
		}
	}
	return [0, '', 'chat'];
};
_NtBar.remove = function( destuid, type ){
	var _V = Ntalker.variable;
	//移除关闭聊窗，自动切换至下一窗口功能
	var nextParam = this.getNext(destuid, type);
	//取得将要移除的节点
	var minTag = this.get(destuid, type);
	try{
		minTag.Element.parentNode.removeChild(minTag.Element);
	}catch(e){}
	this.minWindows.remove( type + destuid );
	var tagWindowCount = IMToolBar.minWindows.count();
	if( this.currentToolbarMode == 1 && !this.isSpread && tagWindowCount==0 ){
		this.setToolBarMode(0, true);
	}
	if( /0|1/.test(this.currentToolbarMode) ){
		this.onLeftScroll();
	}else{
		this.onToolBarTextChanage();
	}
	//_V['OnFocusWinParam'] = [nextParam[0], nextParam[2], nextParam[1]];
	var isCloseChat = true;
	chatWindowManager.OnTBFocusWindow(nextParam[0], nextParam[2], nextParam[1], isCloseChat);
};
_NtBar.get = function( destuid, type ){
	return this.minWindows.items( type + destuid );
};
_NtBar.focusTag = function( destuid, type, destname){
	for(var k in this.minWindows._hash){
		var minTag = this.minWindows._hash[k];
		if(minTag._destuid == destuid && minTag._chatType == type){
			chatWindowManager.OnTBFocusWindow(minTag._destuid, minTag._chatType, minTag._destnick);
		}else{
			minTag.onBlur();
		}
	}
	if( !destuid && !type ){
		chatWindowManager.OnTBFocusWindow();
	}
};
_NtBar.getTagCount = function(chatType){
	var existTagCount = 0, chatType = chatType || 'chat';
	for(var k in this.minWindows._hash){
		var minTag = this.minWindows._hash[k];
		if( minTag._chatType == chatType ){
			existTagCount++;
		}
	}
	return existTagCount;
};
_NtBar.setExpression = function(setToolBarModeValue, clearExpression){
	var _CP = Ntalker.Config.customparams,_R5, self = this, toolBarSpan = self.element;
	var _h2 = document.body.currentStyle,_a = "fixed";
	var _O = document.documentElement, _F1 = "url(about:blank)", _a3 = _O.runtimeStyle;
	var __onscroll = function(e){self.onScroll(e);};
	if( __B.chrome && !self._bindingScroll ){
		__E.addEvent(window, 'scroll', __onscroll);
		self._bindingScroll = true;
	}else if( __B.ie6 || __B.QuirksModel ){
		if( setToolBarModeValue == 2 && !_CP['enableScroll'] ){
			DEBUG('ntToolbar.setExpression:: clearExpression, _bindingScroll='+self._bindingScroll);
			if (_O.currentStyle.backgroundImage == _F1){
				_a3.backgroundImage = "none";
				_a3.backgroundAttachment = "scroll";
			}
			toolBarSpan.style.setExpression("top", "null");
		}
		if( (setToolBarModeValue == 2 || _CP['enableScroll']) && !self._bindingScroll ){
			DEBUG("ntToolbar.setExpression:: addEvent scroll");
			__E.addEvent(window, 'scroll', __onscroll);
			self._bindingScroll = true;
			return;
		}else if( !_CP['enableScroll'] ){
			__E.removeEvent(window, 'scroll', __onscroll);
			DEBUG("ntToolbar.setExpression:: removeEvent scroll");
			DEBUG("ntToolbar.setExpression:: InitExpression=" + this.InitExpression);
			if( !self.InitExpression ){
				if (_h2.backgroundImage == "none"){
					if (__B.StrictMode) {
						if (_h2.backgroundImage == "none") {
							DEBUG("ntToolbar.<b>setExpression</b>:: set background before");
							_a3.backgroundColor = _h2.backgroundColor.indexOf("#")==-1 ? _O.currentStyle.backgroundColor : _h2.backgroundColor;
							_a3.backgroundPositionX = _h2.backgroundPositionX;
							_a3.backgroundPositionY = _h2.backgroundPositionY;
							_a3.backgroundRepeat = _h2.backgroundRepeat;
							_a3.backgroundImage = _F1;
							_a3.backgroundAttachment = _a;
							DEBUG("ntToolbar.<b>setExpression</b>:: set background complete");
						}
					} else {
						_a3.backgroundAttachment = _a;
						_a3.backgroundImage = _F1;
						DEBUG("ntToolbar.<b>setExpression</b>:: background url(about:blank) fixed");
					}
				}else if( _h2.backgroundAttachment != "fixed" ){
					_a3.backgroundAttachment = _a;
					_a3.backgroundImage = _h2.backgroundImage;
					_a3.backgroundRepeat = _h2.backgroundRepeat;
					_a3.backgroundColor = _h2.backgroundColor.indexOf("#")==-1 ? _O.currentStyle.backgroundColor : _h2.backgroundColor;
					_a3.backgroundPositionX = _h2.backgroundPositionX;
					_a3.backgroundPositionY = _h2.backgroundPositionY;
					DEBUG("ntToolbar.<b>setExpression</b>:: background "+_h2.backgroundImage+" fixed");
				}
				self.InitExpression = true;
			}
			if( __B.StrictMode ){
			_R5 = "document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight";
			if (toolBarSpan.offsetParent == document.body) {
				_R5 += "-this.offsetParent.offsetTop-this.offsetParent.clientTop";
			}
		}
		else{
			_R5 = "document.body.scrollTop+document.body.clientHeight-this.offsetHeight";
		}
		toolBarSpan.style.setExpression("top", _R5);
		}
	}
};
_NtBar.initShowToolBarButton = function(){
	if( !__$("btnSwitch") ){
		return;
	}
	var _CP = Ntalker.Config.customparams;
	var toolbarElems = __D.filter(__$('spanSwitch').parentNode.childNodes);
	var tagWindowCount = IMToolBar.minWindows.count();
	var __controlToolBarMode = function(e){
		var tagWindowCount = IMToolBar.minWindows.count();
		if( IMToolBar.currentToolbarMode == 2 && tagWindowCount == 0 ){
			if( IMToolBar.isSpread ){
				IMToolBar.setToolBarMode(1);
			}else{
				IMToolBar.setToolBarMode(0);
			}
		}else if( IMToolBar.currentToolbarMode == 2 && tagWindowCount > 0 ){
			IMToolBar.setToolBarMode(1);
		}else{
			IMToolBar.setToolBarMode(2);
		}
	};
	var __buttonOver = function(e){
		__D.addClass(__$('spanSwitch'), "hover");
	};
	var __buttonOut = function(e){
		__D.removeClass(__$('spanSwitch'), "hover");
	};
	__E.addEvent(__$("btnSwitch"), 'click', __controlToolBarMode);
	__E.addEvent(__$("btnSwitch"), 'mouseover', __buttonOver);
	__E.addEvent(__$("btnSwitch"), 'mouseout',  __buttonOut);
};
_NtBar.setToolBarMode = function(toolBarModeValue, noAnimation){
	var btnSwitch = __$("btnSwitch"), 
		toolBarSpan = this.element, 
		toolBar = __$("ntalkerbar"), 
		self = this, _V = Ntalker.variable, 
		_C = Ntalker.Config;
	DEBUG('_NtBar.setToolBarMode( '+toolBarModeValue+' )');
	var toolbarElems = __D.filter(__$('spanSwitch').parentNode.childNodes, 'span');
	toolBarModeValue = toolBarModeValue!='undefined' ? toolBarModeValue : this.currentToolbarMode;
	if( toolBarModeValue == 2 ){
		this.setExpression(toolBarModeValue, true);
		this.Mutex('');
		this.leftMutex('');
		this.focusTag();
		if( noAnimation ){
			toMinimizeToolbar();
		}else{
			__D.animate(toolBar, {top:28}, 'fast', 'easeInOutQuint', function(){
				toMinimizeToolbar();
				__D.animate(toolBar, {top:0}, 'fast', 'easeInOutQuint', function(){});
			});
		}
	}else if( toolBarModeValue == 0 ){
		if( noAnimation ){
			toSimplifyToolbar(toolBarModeValue);
			self.setExpression(toolBarModeValue);
		}else{
			this.Mutex('');
			__D.animate(toolBar, {top:28}, 'fast', 'easeInOutQuint', function(){
				toSimplifyToolbar();
				self.setExpression(toolBarModeValue);
				self.onToolBarTextChanage();
				__D.animate(toolBar, {top:0}, 'fast', 'easeInOutQuint', function(){});
			});
		}
	}else if( toolBarModeValue == 1 ){
		if( IMToolBar.currentToolbarMode != 0 ){
			this.focusTag();
		}
		if( noAnimation ){
			toMaximumToolbar();
			self.setExpression(toolBarModeValue);
		}else{
			this.Mutex('');
			__D.animate(toolBar, {top:28}, 'fast', 'easeInOutQuint', function(){
				toMaximumToolbar();
				self.setExpression(toolBarModeValue);
				self.onToolBarTextChanage();
				__D.animate(toolBar, {top:0}, 'fast', 'easeInOutQuint', function(){});
			});
		}
	}
	this.initScroll();
	function toMinimizeToolbar(){
		self.currentToolbarMode = toolBarModeValue;
		__Cookie.set(Ntalker.tbModelKEY, toolBarModeValue, 1000*3600*24*7);
		__D.replaceClass(btnSwitch, 'ntalkerbar-close', 'ntalkerbar-open');
		if( self.isExisitCustomButton ){
			__D.css(__$('nt_system'), 'borderLeft', '1px dotted '+_C['bColor']);
		}else{
			__D.css(__$('nt_system'), 'borderLeft', 'none');
		}
		var marginWidth = toolbarWidth = parseInt(__D.css(__$('ntalkerbar'), "marginLeft")) + parseInt(__D.css(__$('ntalkerbar'), "marginRight")) + parseInt(__D.css(__$('nt_content'), "borderLeftWidth")) + parseInt(__D.css(__$('nt_content'), "borderRightWidth"));
		__A.each(toolbarElems, function(elem){
			if( /^(spanSwitch|spanSystem)$/.test(elem.id) ){
				__D.css(elem, 'display', 'block');
				   self.btnSwitchWidth = __D.clientRect(elem).w;
				   toolbarWidth += self.btnSwitchWidth;
			}else{
				__D.css(elem, 'display', 'none');
			}
		});
		var tagWindowCount = IMToolBar.minWindows.count();
		var AreaWidth = parseInt(tagWindowCount * 130);
		__D.css(self.AreaElement, 'width', (AreaWidth+1) + 'px');
		if( __B.ie6 ){
			AreaWidth += 7;
		}else if( __B.chrome || __B.ie8 || __B.ie7 || __B.maxthon3 ){
			AreaWidth += 2;
		}
		toolbarWidth += AreaWidth;
		if( toolbarWidth > (__D.windowRect().w - marginWidth + 130 - _C['chatWidth']) ){
			//打开聊窗占用位置超过当前窗宽度时，自动切换至通栏模式
			self.setToolBarMode(1);
			return;
		}
		if( __D.css(self.AreaElement, 'display') == 'none' ){
			__D.css(self.AreaElement, 'display', 'block');
		}
		__D.css(toolBarSpan, 'width', toolbarWidth + 'px');
		self.AreaElement.scrollLeft = 0;
	}
	function toMaximumToolbar(){
		__D.css(toolBarSpan, 'width', '100%');
		self.currentToolbarMode = toolBarModeValue;
		__Cookie.set(Ntalker.tbModelKEY, toolBarModeValue, 1000*3600*24*7);
		__D.replaceClass(btnSwitch, 'ntalkerbar-open', 'ntalkerbar-close');
		__D.css(__$('nt_system'),'borderLeft', '1px dotted '+_C['bColor']);
		var toolBarAreaWidth = __D.windowRect().w - parseInt(__D.css(__$('ntalkerbar'), "marginLeft")) - parseInt(__D.css(__$('ntalkerbar'), "marginRight")) + parseInt(__D.css(__$('nt_content'), "borderLeftWidth")) - parseInt(__D.css(__$('nt_content'), "borderRightWidth"));
		__A.each(toolbarElems, function(elem){
			__D.css(elem, 'display', 'block');
			   toolBarAreaWidth -= parseInt(__D.clientRect(elem).w);
			   toolBarAreaWidth -= 1;
		});
		if( __B.ie6 ){
			toolBarAreaWidth -= 6; //For IE 6
		}
		__D.css(self.AreaElement, 'width',  toolBarAreaWidth + 'px');
		__D.css(self.AreaElement, 'visibility', 'visible');
		if( __D.css(self.AreaElement, 'display') == 'none' ){
			__D.css(self.AreaElement, 'display', 'block');
		}
	}
	//精简工具条
	function toSimplifyToolbar(){
		var tagWindowCount = IMToolBar.minWindows.count();
		if( tagWindowCount > 0 ){
			self.setToolBarMode(1);
			return;
		}
		self.currentToolbarMode = toolBarModeValue;
		__Cookie.set(Ntalker.tbModelKEY, toolBarModeValue, 1000*3600*24*7);
		__D.replaceClass(btnSwitch, 'ntalkerbar-open', 'ntalkerbar-close');
		if( self.isExisitCustomButton || __B.ie6 ){
			__D.css(__$('nt_system'), 'borderLeft', 'none');
		}else{
			__D.css(__$('nt_system'), 'borderLeft', '1px dotted '+_C['bColor']);
		}
		var toolbarWidth = parseInt(__D.css(__$('ntalkerbar'), "marginLeft")) + parseInt(__D.css(__$('ntalkerbar'), "marginRight")) + parseInt(__D.css(__$('nt_content'), "borderLeftWidth")) + parseInt(__D.css(__$('nt_content'), "borderRightWidth"));
		__A.each(toolbarElems, function(elem){
			if( /^(spanSwitch|ntConfiguration|spanSystem|spanGroup|spanBuddylist)$/.test(elem.id) || elem.className.indexOf('customlink') > -1 || elem.className.indexOf('applicationItem') > -1 ){
				__D.css(elem, 'display', 'block');
				toolbarWidth += __D.clientRect(elem).w;
			}else {
				__D.css(elem, 'display', 'none');
			}
		});
		var AreaWidth = 0;
		if( __B.ie6 ){
			__D.css(self.AreaElement, 'display', 'none');
			AreaWidth += 7;
		}
		__D.css(self.AreaElement, 'width', '1px');
		toolbarWidth += AreaWidth;
		__D.css(toolBarSpan, 'width', toolbarWidth+'px');
	}
};
_NtBar.initFriendButton = function(){ 
	var firendButton = __$("nt_firend");
	var _V = Ntalker.variable, self = this;
	if( _V['user_sid'] == 'NtalkerGuestUserSessionID' ){
		return;
	}
	var __buttonOver = function(e){
		__D.addClass(__$('spanBuddylist'), "hover");
	};
	var __buttonOut = function(e){
		__D.removeClass(__$('spanBuddylist'), "hover");
	};
	var __buttonClick = function(e){
		self.onShowBuddylist(e, 0);
	};
	__E.addEvent(firendButton, "click", __buttonClick);
	__E.addEvent(firendButton, 'mouseover', __buttonOver);
	__E.addEvent(firendButton, 'mouseout',  __buttonOut);
};
_NtBar.initGroupMessage = function(){ 
	var self = this, groupMenu;
	var _CP = Ntalker.Config.customparams;
	if( (!_CP['enablegroup']&&!_CP['enableroom']) || !__$("nt_group") ){
		return;
	}
	var __viewGroupMessage = function(target){self.viewGroupMessage(target);};
	var __openGrouplist = function(e){self.onShowBuddylist(e, 2);};
	var __visibleCallFunction = function(){
		self.disableFlash('spanGroup');
		var allCount = 0;
		for(var k in self._groupMessageMenu._Hash._hash){
			allCount += self._groupMessageMenu.get(k).count;
		}
		self.Mutex('group', allCount);
		var contentRect = __D.clientRect(__$('ntalkerbar-wrapper'));
		var _Right = Math.max(parseInt(contentRect.left + contentRect.w - __D.clientRect(__$("spanGroup")).left - __D.clientRect(__$("Nt-GROUP-MENU")).w), 20);
		__D.css(__$("Nt-GROUP-MENU"), "right", _Right + 'px');
	};
	this._groupMessageMenu = groupMenu = new NtMenu(parseInt(__Cookie.get("__debug") || 0));
	groupMenu.init(
		__$('nt_group').parentNode, 
		__$('nt_group'),
		{id:'Nt-GROUP-MENU',className:'ntalkerbar-menuright  messageMenu',style:''},
		{className:'nt-message-over icotype'},
		{className:'nt-message-out icotype'},
		{callback:__viewGroupMessage},
		__openGrouplist,
		__visibleCallFunction
	);
	var __buttonOver = function(e){
		__D.addClass(__$('spanGroup'), "hover");
	};
	var __buttonOut = function(e){
		__D.removeClass(__$('spanGroup'), "hover");
	};
	__E.addEvent(__$("nt_group"), 'mouseover', __buttonOver);
	__E.addEvent(__$("nt_group"), 'mouseout',  __buttonOut);
};
_NtBar.addGroupMessage = function(groupId, groupName, srcuid, srcnick, msg, chattype){
	var groupMenu = this._groupMessageMenu, _CP = Ntalker.Config.customparams;
	var allCount = itemCount = 0;
	var key = chattype + groupId;
	if( !groupMenu ){
		return;
	}
	if( groupMenu.get(key) ){
		//此群已存在时，取得当前已收到消息数
		itemCount = groupMenu.get(key).count;
		//移除当前群
		groupMenu.remove(key);
	}
	itemCount++;
	groupMenu.add(key, {
		text:__S.cut(groupName,8) + '('+itemCount+')',
		groupid:groupId,
		groupname:groupName,
		srcuid:srcuid,
		srcnick:srcnick,
		msg:msg,
		chattype:chattype,
		custom:{
			groupid:groupId, 
			groupname:groupName,
			className:'nt-message-out icotype'
		},
		count:itemCount
	});
	for(var k in groupMenu._Hash._hash){
		allCount += groupMenu.get(k).count;
	}
	if(allCount>0){
		this.enableflash('spanGroup', '', 'flash');
	}else{
		this.disableFlash('spanGroup');
	}
	allCount = allCount>99 ? '99' : allCount;
	groupMenu._Button.innerHTML = sprintf(NtLang['groupButtonText'], String(allCount) );
};
_NtBar.removeGroupMessage = function(k){
	var groupMenu = this._groupMessageMenu, allCount = 0;
	if( !groupMenu ){
		return;
	}
	groupMenu.remove(k);
	//统计群消息总数
	for(var k in groupMenu._Hash._hash){
		allCount += groupMenu.get(k).count;
	}
	allCount = allCount>99 ? '99' : allCount;
	groupMenu._Button.innerHTML = sprintf(NtLang['groupButtonText'] , String(allCount) );
};
_NtBar.viewGroupMessage = function(target){
	var groupMenu = this._groupMessageMenu, allCount, _groupObject, groupId, groupName;
	var k = target.getAttribute('k');
	if( !groupMenu ){
		return;
	}
	_groupObject = groupMenu.get(k);
	im_openWebchatWindow(_groupObject.groupid, _groupObject.groupname, null, 1, _groupObject.chattype, 0, 'groupMsgMenu');
	this.removeGroupMessage(k);
};
_NtBar.viewCurstomSystemMessage = function(url, e){
	var _ExtMsg = Ntalker.variable.ExMsg;
	var event = __E.fixEvent(e);
	event.stopPropagation();
	var target = searchTag(event.target, "li");
	if(target.parentNode.childNodes.length<=1){
		setTimeout(function(){
			target.innerHTML="<div class='nt_box_null'>"+sprintf(NtLang['nullMessage'][0], NtLang['systemMessageBoxText'][1])+"</div>";
		},100);
	}else{
		target.parentNode.removeChild(target);
	}
	for(var i=0; i<_ExtMsg.length; i++){
		if(_ExtMsg[i].url==url)_ExtMsg[i].msgnumber = 0;
	}
	Ntalker.variable.ExMsg = _ExtMsg;
	this.countMessageBox("im",false,true);
	window.open(url);
};
_NtBar.initToolBar = function(){
	var _Ht = [], elem, first = true, initSimplifyToolbarWidth = 0, initMinimizeToolbarWidth = 0;
	var _CP = Ntalker.Config.customparams,
		_C = Ntalker.Config,
		_V = Ntalker.variable,
		_A = Ntalker.Config.application,
		_B = Ntalker.Config.customtoolbarButtons;
	   
	//按钮初始状态
	var toolbarElemStyle = _CP['showmode']=='hidden' ? 'visibility:hidden;' : 'visibility:visible;';
	var myAppButtonStyle = /1/.test(this.currentToolbarMode) ? 'display:block;' : 'display:none;';
	var hotFocusButtonStyle = /1/.test(this.currentToolbarMode) ? 'display:block;' : 'display:none;';
	var applicationButtonStyle = /1|0/.test(this.currentToolbarMode) ? 'display:block;' : 'display:none;';
	var customHyperlinkStyle = /0|1/.test(this.currentToolbarMode) ? 'display:block' : 'display:none';
	var scrollButtonStyle = /1/.test(this.currentToolbarMode) ? 'display:block' : 'display:none';
	var areaElementStyle = /1|2/.test(this.currentToolbarMode) ? 'visibility:visible;' : 'visibility:hidden;';
	var systemButtonStyle = /0|1|2/.test(this.currentToolbarMode) ? 'display:block' : 'display:none';
	var groupButtonStyle = /0|1/.test(this.currentToolbarMode) ? 'display:block' : 'display:none';
	var buddylistButtonStyle = /0|1/.test(this.currentToolbarMode) ? 'display:block' : 'display:none';
	var settingButtonStyle = /0|1/.test(this.currentToolbarMode) ? 'display:block' : 'display:none';
	var switchButtonClassName = /0|1/.test(this.currentToolbarMode) ? 'ntalkerbar-close' : 'ntalkerbar-open';
	var switchButtonText = /0|1/.test(this.currentToolbarMode) ? '' : '(0)';
	for(var k in Ntalker.Config.customtoolbarButtons){
		if( k ) this.isExisitCustomButton = true;
	}
	if( this.currentToolbarMode==1 )
		var systemSpanBorder = 'border-left:1px dotted '+_C['bColor'];
	else
		var systemSpanBorder = '';
	//17:06 2010-12-13
	//_Ht.push('<iframe style="display:none;width:100%;z-index:9999;"></iframe>');
	_Ht.push('<div id="ntalkerbar" class="ntalkerbar">');
	_Ht.push(	'<div class="ntalkerbar-ui cc" id="nt_content">');
	if ( this.isSpread ){
		//我的中心
		_Ht.push('<span class="fl" id="siteApplication" style="'+myAppButtonStyle+'">');
		_Ht.push(	'<span id="nt_app" class="app-l nt_app">' + NtLang['myAppButtonText'] + '</span>');
		_Ht.push('</span>');
		//热点聚焦
		_Ht.push('<span class="fl" id="siteHotFocus" style="'+hotFocusButtonStyle+'">');
		_Ht.push(	'<span id="nt_hot" class="app-l nt_hot">' + NtLang['hotFocusButtonText'][0] + '</span>');
		_Ht.push('</span>');
	}
	//自定义Application
	for(var k in _A ){
		if( typeof(_A[k]) == 'object' ){
			var customAppWidth = 34 + (NtLang['myAppButtonTextLength'] * __S.len(_A[k]['name']));
			this.newApplicationId = _A[k]['id'] + '_button';
            _Ht.push('<span k="'+k+'" id="' + _A[k]['id'] + '_button" class="applicationItem fl" style="'+applicationButtonStyle+';">');
			_Ht.push(	'<span class="app_item" style="position:relative;width:'+(customAppWidth-1)+'px;_width:'+(customAppWidth-1)+'px;">');
			_Ht.push(		'<span class="app_itemImg" style="background:url(' + _A[k]['image'].src + ') no-repeat center center;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true, sizingMethod=noscale, src=' + _A[k]['image'].src + ');"></span>');
			_Ht.push(		'<span class="app_itemText">' + _A[k]['name'] + '</span>');
			_Ht.push(	'</span>');
			_Ht.push('</span>');
			initSimplifyToolbarWidth += customAppWidth;
		}
	}
	if( _CP['enableTraing'] ){
		_Ht.push('<span id="ntalkerCustomTempButton" class="applicationItem fl" style="'+applicationButtonStyle+'">');
		_Ht.push(	'<span class="app_item">');
		_Ht.push(		'<span class="app_itemImg" style="background:url(' + Ntalker['traing'].src + ') no-repeat center center;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true, sizingMethod=noscale, src=' + Ntalker['traing'].src + ');"></span>');
		_Ht.push(		'<span class="app_itemText">'+NtLang['customApplicationButtonText']+'</span>');
		_Ht.push(	'</span>');
		_Ht.push('</span>');
		initSimplifyToolbarWidth += 34 + (6 * __S.len(NtLang['customApplicationButtonText']));
	}
	
	//自定义超链接
	for(var k in _B){
		if( typeof(_B[k])=="object" && _B[k]["float"]=="left" ){
			var firstHyperlinkBorder = "";
			_Ht.push('<span class="customlink fl" style="'+customHyperlinkStyle+'">');
			_Ht.push(	'<span class="customhyperlink" style="'+firstHyperlinkBorder+'">');
			_Ht.push(		'<a href="' + _B[k]['url'] + '" title="' + _B[k]['tip'] + '" target="_blank" style="' + _B[k]['style'] + '"></a>');
			_Ht.push(	'</span>');
			_Ht.push('</span>');
			first = false;
			initSimplifyToolbarWidth += 29;
		}
	}
	_Ht.push('<span class="fl" style="'+scrollButtonStyle+'">');
	_Ht.push(	'<span id="nt_forward" class="scroll_pre" title="' + NtLang['scrollButtonText'][0] + '"></span>');
	_Ht.push('</span>');
	_Ht.push('<span class="fr" id="spanSwitch" style="width:29px;">');
	_Ht.push(	'<span id="btnSwitch" class="'+switchButtonClassName+'"><span></span></span>');
	_Ht.push('</span>');
	initSimplifyToolbarWidth += 29;
	initMinimizeToolbarWidth += 29;
	if( _V['user_sid'] != 'NtalkerGuestUserSessionID' ){
		_Ht.push('<span class="fr" id="ntConfiguration" style="' + settingButtonStyle + '">');
		_Ht.push(	'<span id="nt_setting" class="app-l"></span>');
		_Ht.push('</span>');
		initSimplifyToolbarWidth += 33;
	}
	
	//好友列表
	if( _V['user_sid'] != 'NtalkerGuestUserSessionID' ){
		_Ht.push('<span class="fr" id="spanBuddylist" style="'+buddylistButtonStyle+'">');
		_Ht.push(	'<span id="nt_firend" class="app-r nt_firend">' + sprintf(NtLang['buddylistButtonText'][0], '0', '0') + '</span>');
		_Ht.push('</span>');
		initSimplifyToolbarWidth = initSimplifyToolbarWidth + 111 + NtLang['spanBuddylistlength'];
	}
	//群按钮
	if( _CP['enablegroup']||_CP['enableroom'] ){
		_Ht.push('<span class="fr" id="spanGroup" style="'+groupButtonStyle+'">');
		_Ht.push(	'<span id="nt_group" class="app-r nt_group">' + sprintf(NtLang['groupButtonText'], '0') + '</span>');
		_Ht.push('</span>');
		initSimplifyToolbarWidth = initSimplifyToolbarWidth + 83 +  NtLang['spanGroupslength'];
	}
	//通知按钮
	_Ht.push('<span class="fr" id="spanSystem" style="'+systemButtonStyle+'">');
	_Ht.push(	'<span id="nt_system" class="app-r nt_system" style="'+systemSpanBorder+'">' + sprintf(NtLang['systemButtonText']+"(%1)", '0') + '</span>');
	_Ht.push('</span>');
	initSimplifyToolbarWidth = initSimplifyToolbarWidth + 83 + NtLang['spanNoticelength'];
	initMinimizeToolbarWidth = initMinimizeToolbarWidth + 83 + NtLang['spanNoticelength'];
	_Ht.push('<span class="fr" style="'+scrollButtonStyle+'">');
	_Ht.push(	'<span id="nt_back" class="scroll_next" title="' + NtLang['scrollButtonText'][1] + '"></span>');
	_Ht.push('</span>');
	
	//聊窗显示区，要加上滚动条
	_Ht.push('<div class="nt_area" id="nt_area" style="'+areaElementStyle+'">');
	_Ht.push(	'<div class="nt_wins" id="nt_wins">');
	_Ht.push(	'</div>');
	_Ht.push('</div>');
	_Ht.push(	'</div>');
	_Ht.push(	'<div id="buddylistFlashSpan" class="ntalkerbar-menuright" style="border:none;width:' + _C['IMWidth'] + 'px;right:20px;' + (__B.ie6 ? 'right:0px;' : '') + 'display:none;"></div>');
	!__B.ie6 && _Ht.push(	'<div style="width:1px;height:1px;overflow:hidden;display:block;"><input type="text" id="NtFocusElement" /></div>');
	_Ht.push('</div>');
	if( this.currentToolbarMode==0 ){
		initSimplifyToolbarWidth += 42 + (__B.ie6 ? 7 : (__B.ie7 ? 2 :0));
		DEBUG('initToolBar setToolbarWidth = '+ initSimplifyToolbarWidth);
		toolbarElemStyle += 'width:'+initSimplifyToolbarWidth+'px;';
	}else if( this.currentToolbarMode==2 ){
		initMinimizeToolbarWidth += 42 + (__B.ie6 ? 7 : (__B.ie7 ? 2 :0));
		DEBUG('initToolBar setToolbarWidth = '+ initMinimizeToolbarWidth);
		toolbarElemStyle += 'width:'+initMinimizeToolbarWidth+'px;';
	}else{
		var scrollWidth = NtUtil.scrollWidth();
		var winRt = __D.windowRect();
		if( winRt.w - scrollWidth < this.minWidth ){
			__D.css(__$("ntalkerbar-wrapper"), 'width', this.minWidth + 'px');
			DEBUG('initToolBar setToolbarWidth = '+ this.minWidth);
		}
	}
	toolbarElemStyle += 'height:32px;right:0;overflow:visible;z-index:2147483647;' + (__B.ie6 ? 'position:absolute;bottom:0px;' : 'position:fixed;bottom:0px;');
	DEBUG('initToolBar insert html before');
	var toolbarHtml = '<div id="ntalkerbar-wrapper" class="ntalkerbar-wrapper fixed" style="'+toolbarElemStyle+'">'+_Ht.join('')+'</div>';
	this.element = __D.insert(document.body.firstChild, toolbarHtml, 'beforeBegin');
	DEBUG('initToolBar insert html complete');
	if( this.currentToolbarMode==2 ){
		this.onScroll();
	}
	
	//常用定位节点对像
	this.contentElement = __$('nt_content');
	Ntalker.variable.buddylistTag = __$('buddylistFlashSpan');
	this.AreaElement = __$('nt_area');
	__D.css(__$('nt_area'), 'width', '1px');
	__D.css(__$('nt_wins'), 'width', '2000px');
	var self = this;
	var __onresize = function(e){self.onResize(e);};
	__E.addEvent(window, "resize", __onresize);
	var _onLeft  = function(e){self.onLeftScroll(e);};
	var _onRight = function(e){self.onRightScroll(e);};
	__$('nt_forward') && __E.addEvent(__$('nt_forward'), 'click', _onLeft);
	__$('nt_back') && __E.addEvent(__$('nt_back'), 'click',   _onRight);
	var btnCustom = __$('ntalkerCustomTempButton');
	var __over = function(){
		__D.addClass(btnCustom, 'hover');
	};
	var __out = function(){
		__D.removeClass(btnCustom, 'hover');
	};
	var __onOpenNewTraingWindow = function(){
		self.onOpenNewTraingWindow();
	};
	btnCustom && __E.addEvent(btnCustom, 'mouseover', __over);
	btnCustom && __E.addEvent(btnCustom, 'mouseout', __out);
	btnCustom && __E.addEvent(btnCustom, 'click', __onOpenNewTraingWindow);
};
_NtBar.onOpenNewTraingWindow = function(){
	var _Ht = [], 
		_V = Ntalker.variable,
		_C = Ntalker.Config,
		_CP= Ntalker.Config.customparams,
		destuid = '3000000',
		chatType= 'traing'
		flashId = "webchat_flash"+destuid+chatType;
	var width  = window.screen.width;
	var height = window.screen.height;
	var flashsrc = _V['scriptPath'] + "/fs/TraingMod.swf?version=" + Ntalker.version.traing_flash;
	var flashvars = [];
	flashvars.push("r="  + _V['scriptPath'] );
	flashvars.push("su=" + _C['services'] );
	flashvars.push("k="  + _C['skin'] );
	flashvars.push("t="  + encodeURIComponent(_V['siteid']) );
	flashvars.push("s="  + encodeURIComponent(_V['user_sid']) );
	flashvars.push("u="  + encodeURIComponent(_V['user_id']) );
	flashvars.push("n="  + encodeURIComponent(_V['user_name']) );
	flashvars.push("d="  + encodeURIComponent(destuid) );
	flashvars.push("dn=" + encodeURIComponent(NtLang['customApplicationButtonText']) );
	flashvars.push("m=0" );
	flashvars.push("localeChain=" + _CP['localeChain'] );
	flashvars.push("ot=1" );
	flashvars.push("ct=" + chatType );
	flashvars.push("lst="+ _CP['lstupdated'] );
	flashvars.push("v="+ Ntalker.version.traing_flash );
	_Ht.push('<html>');
	_Ht.push(	'<head>');
	_Ht.push(		'<title>'+NtLang['customApplicationButtonText']+'</title>');
	_Ht.push(		'<script language="javascript" type="text/javascript">');
	_Ht.push(		'function maximizeWindow() {');
	_Ht.push(		'	if(window.top != window) return;');
	_Ht.push(		'	try{');
	_Ht.push(		'		var offset = (navigator.userAgent.indexOf("Mac") != -1 || navigator.userAgent.indexOf("Gecko") != -1 || navigator.appName.indexOf("Netscape") != -1) ? 0 : 4;');
	_Ht.push(		'		window.moveTo(-offset, -offset);');
	_Ht.push(		'		window.resizeTo(screen.availWidth + (2 * offset), screen.availHeight + (2 * offset));');
	_Ht.push(		'	}catch(e){}');
	_Ht.push(		'}');
	_Ht.push(		'</script>');
	_Ht.push(	'</head>');
	_Ht.push(	'<body style="margin:0;padding:0;" onload="maximizeWindow();">');
	_Ht.push(		'<object width="100%" height="100%" id="'+flashId+'"');
	if( __B.msie ){
		_Ht.push(' classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" >');
		_Ht.push('<param name="movie" value="'+flashsrc+'">');
	}else{
		_Ht.push(' type="application/x-shockwave-flash" data="'+flashsrc+'">');
	}
	_Ht.push(		'<param name="menu" value="true">');
	_Ht.push(		'<param name="salign" value="LT">');
	_Ht.push(		'<param name="allowScriptAccess" value="always">');
	_Ht.push(		'<param name="wmode" value="Window">');
	_Ht.push(		'<param name="allowFullScreen" value="true">');
	_Ht.push(		'<param name="flashvars" value="'+flashvars.join('&')+'">');
	_Ht.push(		'</object>');
	_Ht.push(	'</body>');
	_Ht.push('</html>');
	var photoWallWindow = window.open('about:blank', "", "left=0, top=0, width="+width+",height="+height+",toolbar=no,directories=no,menubar=no,status=no,location=no,scrollbars=no,resizable=no,channelmode=yes" );
	try{
		var windowContent = photoWallWindow.document || photoWallWindow.contentWindow.document;
	}catch(e){}
	function writeHtml(){
		windowContent.charset = "utf-8";
		windowContent.write(_Ht.join(''));
		windowContent.close();
		photoWallWindow.focus();
	}
	if( __B.mozilla ){
		writeHtml();
	}else{
		setTimeout(writeHtml, 100);
	}
};
//滚动条滚动且IE6下工具条隐藏时，显隐按钮自动隐藏
_NtBar.onScroll = function(e){
	var _CP = Ntalker.Config.customparams;
	var openButton = __$("ntalkerbar"), toolbarTop, toolBarSpan = IMToolBar.element;
	if( __B.chrome && toolBarSpan ){
		clearTimeout(IMToolBar.scroltimerID);
		IMToolBar.scroltimerID = setTimeout(function(){
		var setNewZIndex = __D.css(toolBarSpan, 'z-index') == '2147483647' ? '2147483646' : '2147483647';
			DEBUG('ntToolbar.onScroll:: chrome setzIndex = ' + setNewZIndex);
			__D.css(toolBarSpan, 'z-index', setNewZIndex);
		}, 400);
	}else if( __B.ie6 && ( _CP['enableScroll'] || IMToolBar.currentToolbarMode==2 ) ){
		//IE6下已打开平滑滚动或工具条是最小模式时，实现平滑滚动
		//已打开聊窗或好友列表时
 		var openedChat = chatWindowManager ? chatWindowManager._chatWndsArray.length : 0;
		var openedBuddy = im_myIMWindow && im_myIMWindow.isShow ? true : false;
		if( openedChat > 0 || openedBuddy ){
			if( __B.StrictMode ){
				toolbarTop = document.documentElement.scrollTop + document.documentElement.clientHeight - toolBarSpan.offsetHeight;
				if (toolBarSpan.offsetParent == document.body) {
					toolbarTop = toolbarTop - toolBarSpan.offsetParent.offsetTop - toolBarSpan.offsetParent.clientTop;
				}
			}
			else{
				toolbarTop = document.body.scrollTop + document.body.clientHeight - toolBarSpan.offsetHeight;
			}
			__D.css(toolBarSpan, "top", toolbarTop+'px');
			return;
		}
		clearTimeout(IMToolBar.scroltimerID);
		__D.css(__$("ntalkerbar"), "visibility", "hidden");
		IMToolBar.scroltimerID = setTimeout(function(){
			if( __B.StrictMode ){
				toolbarTop = document.documentElement.scrollTop + document.documentElement.clientHeight - toolBarSpan.offsetHeight;
				if (toolBarSpan.offsetParent == document.body) {
					toolbarTop = toolbarTop - toolBarSpan.offsetParent.offsetTop - toolBarSpan.offsetParent.clientTop;
				}
			}
			else{
				toolbarTop = document.body.scrollTop + document.body.clientHeight - toolBarSpan.offsetHeight;
			}
			__D.css(toolBarSpan, "top", toolbarTop+'px');
			//此处聊窗或好友列表可能已打开，使用display会导致Flash重载
			DEBUG('<i>onScroll visibility:visible;</i>');
			__D.css(__$("ntalkerbar"), "visibility", "visible");
			__D.animate(__$("ntalkerbar"), {opacity:100}, 1000, 'easeOutCubic',function(){
				__$("ntalkerbar").style.filter="";
			});
		}, 800);
	}
};
_NtBar.onResize = function(e){
	var openedChat = chatWindowManager ? chatWindowManager._chatWndsArray.length : 0;
	var openedBuddy = im_myIMWindow && im_myIMWindow.isShow ? true : false;
	if( __B.ie6 && openedChat <= 0 && !openedBuddy ){
		clearTimeout(IMToolBar.resizetimerID);
		//__D.css(__$("ntalkerbar"), "visibility", "hidden");
		IMToolBar.resizetimerID = setTimeout(function(){
			DEBUG('<b>IMToolBar.onResize:: Exec onToolBarTextChanage()</b>');
			if( Ntalker.temp.cssLoaded ) IMToolBar.onToolBarTextChanage();
			IMToolBar.initScroll();
			DEBUG('IMToolBar.onResize:: Exec onScroll()');
			IMToolBar.onScroll();
		}, 400);
	}else{
		DEBUG('<b>IMToolBar.onResize:: Exec onToolBarTextChanage()</b>');
		if( Ntalker.temp.cssLoaded ) IMToolBar.onToolBarTextChanage();
		IMToolBar.initScroll();
		DEBUG('IMToolBar.onResize:: Exec onScroll()');
		IMToolBar.onScroll();
	}
	var appWindElem = __$(IMToolBar.curApplicationId);
	DEBUG('IMToolBar.resize::5, curApplicationId=' + IMToolBar.curApplicationId);
	if( appWindElem && __B.ie6 ){
		var winRt = __D.windowRect();
		var appWindRt = __D.clientRect(appWindElem);
		var appWindRight = Math.round((winRt.w-appWindRt.w)/2);
		__D.css(appWindElem, 'right', appWindRight + 'px');
		DEBUG('IMToolBar.resize:: window.width='+winRt.w+', appRight='+appWindRight);
	}
};
//工具条文本变化时，工具条,可滚动区域宽度应改变
_NtBar.onToolBarTextChanage = function(){
	var _C = Ntalker.Config;
	var toolbarWidth, AreaWidth;
	var friendButton=__$("nt_firend");
	if( this.currentToolbarMode == 1 ){
		//修改当前宽度
		if(friendButton){
			__D.css(friendButton,"width","auto");
			var tempWidth=parseInt(__D.clientRect(friendButton).w)-parseInt(__D.css(friendButton, "paddingLeft"))-parseInt(__D.css(friendButton, "paddingRight"));
			__D.css(friendButton,"width",tempWidth+"px");
		}
		//通栏模式
		var scrollWidth = NtUtil.scrollWidth();
		var winRt = __D.windowRect();
		var width = __D.clientRect(__$("ntalkerbar-wrapper")).w;
		if( winRt.w - scrollWidth < this.minWidth ){
			DEBUG('ntToolbar.onToolBarTextChanage:: width='+width+', setToolbarWidth = '+this.minWidth);
			__D.css(__$("ntalkerbar-wrapper"), 'width', this.minWidth + 'px');
			width = this.minWidth;
		}else{
			DEBUG('ntToolbar.onToolBarTextChanage:: width='+width+', setToolbarWidth = 100%');
			__D.css(__$("ntalkerbar-wrapper"), 'width', '100%');
			width = winRt.w - scrollWidth;
		}
		toolbarWidth = width - parseInt(__D.css(__$('ntalkerbar'), "marginLeft")) - parseInt(__D.css(__$('ntalkerbar'), "marginRight")) + parseInt(__D.css(__$('nt_content'), "borderLeftWidth")) - parseInt(__D.css(__$('nt_content'), "borderRightWidth"));
		__A.each(__D.filter(this.contentElement.childNodes, 'span'), function(elem){
			if( __D.css(elem, 'display') != 'none' ){
				toolbarWidth -= parseInt( __D.clientRect(elem).w );
				toolbarWidth -= 1;
			}
		});
		AreaWidth = toolbarWidth - (__B.ie6 ? 9 : 0);
	if( !isNaN(AreaWidth) && AreaWidth > 0 ){
		__D.css(this.AreaElement, 'width', AreaWidth + 'px');
	}
	}else if( this.currentToolbarMode == 0 ){
		//修改当前宽度
		if(friendButton){
			__D.css(friendButton,"width","auto");
			var tempWidth=parseInt(__D.clientRect(friendButton).w)-parseInt(__D.css(friendButton, "paddingLeft"))-parseInt(__D.css(friendButton, "paddingRight"));
			__D.css(friendButton,"width",tempWidth+"px");
		}
		//精简模式时
		toolbarWidth = parseInt(__D.css(__$('ntalkerbar'), "marginLeft")) + parseInt(__D.css(__$('ntalkerbar'), "marginRight")) + parseInt(__D.css(__$('nt_content'), "borderLeftWidth")) + parseInt(__D.css(__$('nt_content'), "borderRightWidth"));
		__A.each(__D.filter(this.contentElement.childNodes, 'span'), function(elem){
		   if( /^(spanSwitch|ntConfiguration|spanSystem|spanGroup|spanBuddylist)$/.test(elem.id) || elem.className.indexOf('customlink') > -1 || elem.className.indexOf('applicationItem') > -1 ){
				__D.css(elem, 'display', 'block');
				toolbarWidth += __D.clientRect(elem).w;
			}
		});
		if( __B.ie6 ){
			__D.css(this.AreaElement, 'width', '1px');
			toolbarWidth += 2;
		}
		toolbarWidth = toolbarWidth + (__B.ie6 ? 5 : 0);
		DEBUG('ntToolbar.onToolBarTextChanage:: setToolbarWidth='+toolbarWidth+'');
		!isNaN(toolbarWidth) && __D.css(this.element, 'width', toolbarWidth + 'px');
	}else if( this.currentToolbarMode == 2 ){
		if(__D.css(__$('ntalkerbar'), "display")=="none") return;
		toolbarWidth = parseInt(__D.css(__$('ntalkerbar'), "marginLeft")) + parseInt(__D.css(__$('ntalkerbar'), "marginRight")) + parseInt(__D.css(__$('nt_content'), "borderLeftWidth")) + parseInt(__D.css(__$('nt_content'), "borderRightWidth"));
		__A.each(__D.filter(this.contentElement.childNodes, 'span'), function(elem){
		   if( /^(spanSwitch|spanSystem)$/.test(elem.id) ){
				toolbarWidth += __D.clientRect(elem).w;
			}
		});
		var tagWindowCount = IMToolBar.minWindows.count();
		AreaWidth = tagWindowCount * 130;
		__D.css(this.AreaElement, 'width', (AreaWidth + 1) + 'px');
		if( __B.ie6 ){
			AreaWidth += 6;
		}else if( __B.chrome || __B.ie8 || __B.ie7 ){
			AreaWidth += 2;
		}
		toolbarWidth += AreaWidth;
		__D.css(this.element, 'width', (isNaN(toolbarWidth) ? 160 : toolbarWidth) + 'px');
	}
};
//滚动控制函数
//@desc 初始化滚动控制按钮
_NtBar.initScroll = function(){
	var _V = Ntalker.variable, _C = Ntalker.Config,
		ForwardElemt = __$('nt_forward'), 
		BackElemt = __$('nt_back'),
		AreaElement = this.AreaElement,
		WinsElemt = __$('nt_wins'), WinsWidth = 0,
		AreaWidth = __D.clientRect(AreaElement).w;
	if( AreaWidth==0 ){
		//2010-5-25  工具条隐藏时,聊窗节点区域宽度取不到,不初始化滚动按钮状态
		return;
	}
	__A.each(__D.filter(WinsElemt.childNodes ), function(win){
		//工具条上聊窗节点总宽度
		WinsWidth += parseInt( __D.css(win, 'width') );
	});
	if( WinsWidth <= AreaWidth ){
		//聊窗节点总宽小于可视区域，滚动按钮不可见
		__D.replaceClass(ForwardElemt, 'scroll_pre', 'scroll_pre_disable');
		__D.replaceClass(BackElemt, 'scroll_next', 'scroll_next_disable');
	}
	else{
		//已向后滚动，向前按钮可用(见)
		if( AreaElement.scrollLeft > 0 ){
			__D.replaceClass(ForwardElemt, 'scroll_pre_disable', 'scroll_pre');
		}
		else{
			__D.replaceClass(ForwardElemt, 'scroll_pre', 'scroll_pre_disable');
		}
		
		//可视区域未完整显示聊窗节点，向后按钮可用(见)
		if( WinsWidth - AreaElement.scrollLeft > AreaWidth ){
			__D.replaceClass(BackElemt, 'scroll_next_disable', 'scroll_next');
		}
		else{
			__D.replaceClass(BackElemt, 'scroll_next', 'scroll_next_disable');
		}
	}
};
_NtBar.onLeftScroll = function(e){
	var self = this;
	__D.animate(self.AreaElement, {scrollLeft:"-130"}, 'slow', 'easeInOutQuint', function(){ 
		self.initScroll();
	});
};
_NtBar.onRightScroll = function(e){
	var self = this;
	var _C = Ntalker.Config,
		ForwardElemt = __$('nt_forward'), 
		BackElemt = __$('nt_back'),
		AreaElement = this.AreaElement,
		WinsElemt = __$('nt_wins'), WinsWidth = 0,
		AreaWidth = __D.clientRect(AreaElement).w;
	if( AreaWidth==0 ){
		//2010-5-25  工具条隐藏时,聊窗节点区域宽度取不到,不初始化滚动按钮状态
		return;
	}
	__A.each(__D.filter(WinsElemt.childNodes ), function(win){
		//工具条上聊窗节点总宽度
		WinsWidth += parseInt( __D.css(win, 'width') );
	});
	if( WinsWidth - AreaElement.scrollLeft <= AreaWidth ){
		return;
	}
	__D.animate(self.AreaElement, {scrollLeft:"+130"}, 'slow', 'easeInOutQuint', function(){ 
		self.initScroll();
	});
};
_NtBar.onShowBuddylist = function(e, index){
	if( !im_myIMWindow ) return;
	DEBUG('onShowBuddylist' );
	index = index!=null ? index : 0;
	Ntalker.Config.IMtabIndex = index;
	im_myIMWindow.OnTBShowBuddylist(true);
	DEBUG('OnTBShowBuddylist OK');
	IMToolBar.closeMessagebox();
	DEBUG('closeMessagebox OK');
	IMToolBar.hiddenConfigurationMenu();
	DEBUG('hiddenConfigurationMenu OK');
	IMToolBar.leftMutex('');
	
};
_NtBar.Mutex = function(type, _MCount){
	var groupMessageCount = _MCount ? _MCount : 0;
	type = type == 'undefined' ? '' : type;
	if( type.indexOf('buddylist') == -1 ){
		//关闭群、好友列表、群菜单
		if(im_myIMWindow) {
			im_myIMWindow.minimize();
		}
	}
	if( type.indexOf('group') == -1 ){
		//有群消息时关闭群列表
		if(groupMessageCount>0 && im_myIMWindow) {
			im_myIMWindow.minimize();
		}
	}
	if( type.indexOf('system') == -1 ){
		this.closeMessagebox();
	}
	if( type.indexOf('setting') == -1 ){
		//关闭设置菜单日
		this.hiddenConfigurationMenu();
	}
};
_NtBar.leftMutex = function(type, isClickPage){
	if( type != 'siteApplication' ){
		this.closeSiteApplication();
	}
		//关闭热点聚焦
	if( type != 'siteHotFocus' ){
		this.closeHotFocus();
	}
		//关闭Application
	if( type != 'applicationItem' && !(isClickPage === true) ){
		this.closeApplicationWindow();
	}
};
_NtBar.enableflash = function(key, className, FclassName, auto){
	var target = __$(key), self = this;
	this._flashClassName[key] = [className, FclassName];
	if( this._timer[key] && !auto) return;
	if( (this._stopFlash[key]==true || this._flashNum[key] == 6)){
		this._stopFlash[key] = false;
		this._flashNum[key] = 0;
		return;
	}
	if(this._timer[key] == 500){
		this._timer[key] = 1000;
		__D.replaceClass(target, className, FclassName);
	}else{
		this._timer[key] = 500;
		__D.replaceClass(target, FclassName, className);
	}
	this._flashNum[key] = !__S.isDefined(this._flashNum[key]) ? 1 : parseInt(this._flashNum[key]) + 1;
	setTimeout(function(){
		self.enableflash(key, className, FclassName, true);
	},  self._timer[key]);
};
_NtBar.disableFlash = function(key){
	try{
		var className = this._flashClassName[key][1] || '';
		var FclassName = this._flashClassName[key][0] || '';
	}catch(e){}
	__D.replaceClass(__$(key), className, FclassName);
	this._stopFlash[key] = true;
	this._flashNum[key] = 0;
};
//@desc 初始化站点应用
_NtBar.initSiteApplication = function(){
	var self = this, _C = Ntalker.Config;
	if( !__$('nt_app') ){
		return;
	}
	var __buttonOver = function(e){
		__D.addClass(__$('siteApplication'), "hover");
	};
	var __buttonOut = function(e){
		__D.removeClass(__$('siteApplication'), "hover");
	};
	__E.addEvent(__$('nt_app'), 'mouseover', __buttonOver);
	__E.addEvent(__$('nt_app'), 'mouseout',  __buttonOut);
	this.t_menu = new NtMenu(true);
	var __viewNoneMyAppMenu = function(e){
		self.loadSiteApplication();
		self.t_menu.show();
		self.inited['myapp'] = true;
	};
	var __visibleCallFunction = function(e){
		__D.addClass(__$('siteApplication'), 'selected');
		self.leftMutex("siteApplication");
		//执行显示菜单动画
		var menuElem = self.t_menu._Menu;
		var menuRect = __D.clientRect(menuElem);
		__D.css(menuElem, 'height', '1px');
		__D.animate(menuElem, {height:(menuRect.h - 2)}, 'fast', 'easeInOutQuint', function(){});
	};
	var __openMyAppItem = function(o){
		if(o.attributes['k'].value=='app_close'){
			self.closeSiteApplication();
		}else{
			window.open(o.attributes["url"].nodeValue);
		}
	};
	var __openedCallFunction = function(){
		self.closeSiteApplication();
	};
	this.t_menu.init(
		__$('ntalkerbar'), 
		__$('nt_app'), 
		{
			id: 'siteApplicationMenu',
			className:'ntalkerbar-menuleft',
			style:'left:0px;width:120px;', 
			childNode:{
					tagName:'div', 
					className:'TopGradient', 
					childNode:{tagName:'div', className:'BottomGradient'}
			}
		},
		{className: 'nt-item-over'},
		{className: 'nt-item-out'},
		{callback:__openMyAppItem, exec: false},
		__viewNoneMyAppMenu,
		__visibleCallFunction,
		__openedCallFunction
	);
};
_NtBar.closeSiteApplication = function(){
	var self = this;
	var menuElem = __$('siteApplicationMenu');
	if( !menuElem ){
		return;
	}
	var menuRect = __D.clientRect(menuElem);
	__D.animate(menuElem, {height:1}, 'fast', 'easeInOutQuint', function(){
		menuElem.parentNode.removeChild(menuElem);
		self.t_menu._MenuInited = false;
		__D.removeClass(__$('siteApplication'), 'selected');
	});
	this.inited['myapp'] = false;
};
_NtBar.loadSiteApplication=function(){
	var _C  = Ntalker.Config;
	var t_menu = this.t_menu, self=this;
	var count=0; padding='';
	var array = Ntalker.variable.myApp;
	t_menu.add('app_close',{text:'&nbsp;&nbsp;',custom:{type:'close', className:"siteApplicationClose",style:''}});
	for(k in array){
		if( array[k].menuitems.length > 0){
			t_menu.add('app_line_' + k, {text:'',custom:{style:'border-top:1px #cccccc dotted;magin:1 1 0 0;font-size:0px;height:1px;line-height:1px;',type:'line',className:'nt-item-out'}});
			}
		for(v in array[k].menuitems){ 
			padding='6px';
			if(count>10) break;
			var icon = array[k].menuitems[v].icon ? array[k].menuitems[v].icon : _C['publicDIR'] + 'app_ico.gif';
				t_menu.add('app_' +k+ v, {
					  text : array[k].menuitems[v].title,
					custom:{
					style:'background-image:url(' + icon + ');background-repeat:no-repeat;overflow:hidden;background-position: 5px 50%;padding-left:'+padding+';',
						url : array[k].menuitems[v].url,
						className:'nt-item-out',
						type:'item'
						}
					}
				);
			if(array[k].groupname==NtLang['CONST_siteApplication'])count++;
		}
	}
};
_NtBar.initHotFocus = function(){
	var self = this, _C = Ntalker.Config;
	if( !__$('nt_hot') ){
		return;
	}
	var __visibleActivity = function(e){
		__E.fixEvent(e).stopPropagation();
		self.showHotFocus(e);
	};
	var __buttonOver = function(e){
		__D.addClass(__$('siteHotFocus'), "hover");
	};
	var __buttonOut = function(e){
		__D.removeClass(__$('siteHotFocus'), "hover");
	};
	__E.addEvent(__$('nt_hot'), 'click', __visibleActivity);
	__E.addEvent(__$('nt_hot'), 'mouseover', __buttonOver);
	__E.addEvent(__$('nt_hot'), 'mouseout',  __buttonOut);
};
_NtBar.showHotFocus = function(e){
	this.leftMutex('siteHotFocus');
	if( this.inited['activity'] ){
		this.closeHotFocus();
		return;
	}
	var url, HotButton = __$('nt_hot'), 
		self = this, _Ht = [],
		_C = Ntalker.Config,
		_V = Ntalker.variable;
	var left = __D.clientRect(HotButton).left - __D.clientRect(HotButton.parentNode.parentNode).left - 1;
	this.focusTag();
	_Ht.push('<span id="hotFocusMenu" class="ntalkerbar-menuleft" style="">');
	_Ht.push(	'<div class="TopGradient">');
	_Ht.push(		'<div class="BottomGradient">');
	_Ht.push(			'<div style="height:30px;">');
	_Ht.push(				'<span id="newactivity_tag" class="newactivity_tag newactivity_tag_select">' + NtLang['hotFocusButtonText'][1] + '</span>');
	_Ht.push(				'<span id="hotactivity_tag" class="hotactivity_tag">' + NtLang['hotFocusButtonText'][2] + '</span>');
	_Ht.push(				'<span id="activity_close" class="ntclose"></span>');
	_Ht.push(				'<br class="clearfloat" />');
	_Ht.push(			'</div>');
	_Ht.push(			'<div id="newactivity" class="nt-tagcontent" style="display:block;"><div style="padding:5px;">' + NtLang['hotFocusButtonText'][1] + NtLang['LoadingText'] + '...</div></div>');
	_Ht.push(			'<div id="hotactivity" class="nt-tagcontent" style="display:none;"><div style="padding:5px;">' + NtLang['hotFocusButtonText'][2] + NtLang['LoadingText'] + '...</div></div>');
	_Ht.push(		'</div>');
	_Ht.push(	'</div>');
	_Ht.push('</span>');
	var menuElem = __D.insert(__$('ntalkerbar'), _Ht.join(''), 'beforeEnd');
	__D.addClass(__$('siteHotFocus'), "selected");
	
	//载入数据
	__getHotFocusData();
	
	function __getHotFocusData(){
		if( !_C['hotserver'] ){
			_C['waitRetuenServiceUrl'] = true;
		 	return;
		}
		url = _C['hotserver'] + '?query=siteactivity&siteid=' + _V['siteid'] + '&uid=' + _V['user_id'] + '&sid=' + _V['user_sid'] + '&maxnum=7&cachemode=true' ;
		__C.load({src: url}, false, JsIM_setHotFocusData);
	};
	__$('newactivity_tag').onclick = function(e){
		__E.fixEvent(e).stopPropagation();
		__D.replaceClass(__$('newactivity_tag'), '', 'newactivity_tag_select');
		__D.css(__$('newactivity'), 'display', 'block');
		__D.replaceClass(__$('hotactivity_tag'), 'hotactivity_tag_select', '');
		__D.css(__$('hotactivity'), 'display', 'none');
	};
	__$('hotactivity_tag').onclick = function(e){
		__E.fixEvent(e).stopPropagation();
		__D.replaceClass(__$('newactivity_tag'), 'newactivity_tag_select', '');
		__D.css(__$('newactivity'), 'display', 'none');
		__D.replaceClass(__$('hotactivity_tag'), '', 'hotactivity_tag_select');
		__D.css(__$('hotactivity'), 'display', 'block');
	};
	var __closeHotFocus = function(){
		self.closeHotFocus();
	};
	__E.addEvent(__$('activity_close'), 'click', __closeHotFocus);
	this.inited['activity'] = true;
	__D.css(menuElem, 'display', 'block');
	var menuHeight = __D.clientRect(menuElem).h - 2;
	__D.css(menuElem, 'height', '1px');
	__D.animate(menuElem, {height:menuHeight}, 'fast', 'easeInOutQuint', function(){});
};
_NtBar.closeHotFocus = function(){
	var menuElem = __$('hotFocusMenu');
	if( !menuElem ){
		return;
	}
	__D.animate(menuElem, {height:1}, 'fast', 'easeInOutQuint', function(){ 
		menuElem.parentNode.removeChild(menuElem);
		__D.removeClass(__$('siteHotFocus'), "selected");
	});
	this.inited['activity'] = false;
};
_NtBar.initCustomApplication = function(){
	var self = this, 
		_V = Ntalker.variable,
		_A = Ntalker.Config.application;
	/*
	var showNewTip = __Cookie.get("ntalkerhiddennewapplication");
	if( showNewTip != '1' && this.newApplicationId && this.newApplicationId.indexOf('groupPurchase_2')>-1  ){
		try{
			var newTip = __$$('#'+this.newApplicationId+' .app_itemTip')[0];
			if(!newTip) newTip = NtUtil.$$(".app_itemTip", __$(this.newApplicationId))[0];
			__D.css(newTip, 'display', 'block');
			var url = Ntalker.Config.services + "/func/statistic.php?siteid="+_V['siteid']+"&uid="+_V['user_id']+"&type=22&mode=1&from=show tip&rnd="+new Date().getTime();
			__C.load({tagName:'img', href: url});
		}catch(e){}
	}
	*/
	var __openApplicationWindow = function(e){
		var event = __E.fixEvent(e);
		event.stopPropagation();
		var targetElement = event.target;
		while(targetElement){
			if( /applicationItem/.test(targetElement.className) ){break;}
			targetElement = targetElement.parentNode;
		}
		return targetElement.getAttribute('k');
	};
	var __buttonClick = function(e){
		var k = __openApplicationWindow(e);
		self.openApplicationWindow(k, 'toolbar');
	};
	var __tipCallBack = function(e){
		var k = __openApplicationWindow(e);
		self.openApplicationWindow(k, 'tip');
	};
	var __buttonOver = function(e){
		var event = __E.fixEvent(e);
        event.stopPropagation(e);
		var targetElement = event.target;
		while(targetElement){
			if( /applicationItem/.test(targetElement.className) ){break;}
			targetElement = targetElement.parentNode;
		}
		__D.addClass(targetElement, "hover");
	};
	var __buttonOut = function(e){
		var event = __E.fixEvent(e);
        event.stopPropagation(e);
		var targetElement = event.target;
		while(targetElement){
			if( /applicationItem/.test(targetElement.className) ){break;}
			targetElement = targetElement.parentNode;
		}
		__D.removeClass(targetElement, "hover");
	};
	for(var k in _A ){
		if( __$(_A[k]['id'] + '_button') ){
			__E.addEvent(__$(_A[k]['id'] + '_button'), 'click', __buttonClick);
			__E.addEvent(__$(_A[k]['id'] + '_button'), 'mouseover', __buttonOver);
			__E.addEvent(__$(_A[k]['id'] + '_button'), 'mouseout',  __buttonOut);
		}
		if( _A[k]['tip']=='1' && !this.Tip ){
			//, __tipCallBack
			Ntalker.temp.Tip = new ntTip(__D.filter(__$(_A[k]['id'] + '_button').childNodes)[0], _A[k]['content'] || '', k);
			//Date: 2011-09-19
			//Desc: load tip Content
			__C.load({src: 'http://cpa.ntalker.com/ntalkerad.php?siteid='+Ntalker.variable.siteid}, false, function(){
				if( typeof(NTALKER_AD_SHOW)!=='undefined' ){
					//app_tuan_content
					Ntalker.temp.Tip.init(NTALKER_AD_SHOW);
					setTimeout(function(){
						Ntalker.temp.Tip.show();
					}, 1000);
				}else{
					DEBUG('NTALKER_AD_SHOW is undefined');
				}
			});
		}
	}
};
_NtBar.openApplicationWindow = function(k, from){
	if( !k ){
		return;
	}
	DEBUG('ntToolbar.openApplicationWindow start');
	var appWidth,appHeight,iframeWidth,iframeHeight;
	var isAutoPosition = false,_A = Ntalker.Config.application,
		_V = Ntalker.variable, 
		_C = Ntalker.Config, self = this,
		_Ht = [],
		winRt = __D.windowRect();
	var curId = this.curApplicationId = _A[k]['id'];
	var appWin = __$(curId);
	var appLoadingID = curId + '_loading';
	var appIfrID = curId + '_iframe';
	var appBtnID = curId + '_button';
	var appCloseBtnID = curId + '_close';
	var appURL = _A[k]['url'] + '?siteid=' + _V['siteid'] + '&m=User&a=remoteLogin&uid=' + _V['user_id'] + '&username=' +encodeURIComponent(_V['user_name']) + '&sessionid=' + _V['user_sid'] + '&r=' + _V['scriptPath'] + '&imsid=' + Ntalker.variable.imsid;
	var appType = _A[k]['type'];
	
	//关闭其它应用
	var openedApp = false;
	/*
	if( applicationButtonId == this.newApplicationId && this.newApplicationId.indexOf('groupPurchase_2')>-1 ){
		try{
			var newTip = __$$('#'+this.newApplicationId+' .app_itemTip')[0];
			if(!newTip) newTip = NtUtil.$$(".app_itemTip", __$(this.newApplicationId))[0];
			__D.css(newTip, 'display', 'none');
		}catch(e){}
		__Cookie.set('ntalkerhiddennewapplication', '1', 1000*3600*24);
	}
	*/
	if( _A[k]['mutex']=='1' ){
		for(var i in _A ){
			if( __$(_A[k]['id']) ) openedApp = true;
		}
	}
	//关闭TIP
	if( Ntalker.temp.Tip ) Ntalker.temp.Tip.hiden(k);
	
	if( !openedApp ){
		//统计App打开次数
		var url = _C['services'] + "/func/statistic.php?siteid="+_V['siteid']+"&uid="+_V['user_id']+"&type=21&mode=1&from="+from+"&destid="+k+"&rnd="+new Date().getTime();
		__C.load({tagName:'img', href:url});

		_V['applicationOpened'] = true;
		
		//关闭消息盒子、群菜单|群列表、好友列表等
		this.Mutex('');
		//关闭站点应用(我的中心)、热点聚焦、Ntalker应用
		this.leftMutex('');
		//最小化所有聊窗
		this.focusTag();
		var winHeight = Math.max(document.body.scrollHeight || document.documentElement.scrollHeight, document.documentElement.clientHeight);
		if( !__$('ntApplicationBackground') ){
			this.backgroundDiv = __D.create('div', {id:"ntApplicationBackground", className:'ntalker_application_background', style:"z-index:99;position:absolute;left:0px;top:0px;background:#000000;opacity:0;filter:alpha(opacity:0);width:100%;height:"+winHeight+"px;"});
		}
		if( _A[k]['height']=='auto' || _A[k]['width']=='auto' ){
			appHeight = _A[k]['height']=='auto' ? parseInt(winRt.h*0.8) : parseInt(_A[k]['height']);
			appWidth = _A[k]['width']=='auto' ? parseInt(appHeight/3*4) : parseInt(_A[k]['width']);
			iframeHeight = appHeight - 24 - 11;
			iframeWidth = appWidth;
			isAutoPosition  = true;
		}else{
			iframeHeight = parseInt(_A[k]['height']);
			iframeWidth = parseInt(_A[k]['width']);
			appHeight = iframeHeight + 24;
			appWidth = iframeWidth;
		}
		appURL += (_A[k]['Parameters'] ? '&'+_A[k]['Parameters'] : '');
		appURL += '&height=' + iframeHeight;
		
		var appWindRight = Math.round((winRt.w-appWidth)/2);
		DEBUG('NtDiscuzTbar.openApplicationWindow::isAutoPosition='+isAutoPosition+',iframeHeight='+iframeHeight+', iframeWidth='+iframeWidth+', setLeft=' + appWindRight);
		var winBottom = _A[k]['align'] == 'bottom' ? 28 : (winRt.h - appHeight)/2;
		var appWinBackgroundStyle = !isAutoPosition ? 'background:transparent;' : 'background:#AAAAAA;';
		_Ht.push('<div id="' + curId + '" class="app_win" style="'+appWinBackgroundStyle+'position:fixed !important; _position:absolute;width:'+appWidth+'px;height:'+appHeight+'px;right:'+appWindRight+'px;bottom:'+winBottom+'px;">');
		if( isAutoPosition ){
		_Ht.push(	'<div class="app_win_header">');
		_Ht.push(		'<span class="app_itemImg"><img src="' + _A[k]['image'].src + '" border="0" /></span>');
		_Ht.push(		'<span class="app_itemText">' + _A[k]['name'] + '</span>');
		_Ht.push(		'<span id="'+appCloseBtnID+'" class="app_itemClose"></span>');
		_Ht.push('</div>');
		}else{
			_Ht.push('<div class="app_win_header" style="overflow:visible;">');
			_Ht.push('<span id="'+appCloseBtnID+'" class="app_itemClose" style=""></span>');
			_Ht.push('</div>');
		}
		
		_Ht.push(	'<div id="span' + appIfrID + '" class="app_win_body">');
		_Ht.push(		'<div id="' + appLoadingID + '" style="background:url(' + _C['publicDIR'] + '/loading.gif) no-repeat ' + (iframeWidth - 32)/2 + 'px ' + (iframeHeight - 32)/2 + 'px; width:' + iframeWidth + 'px;height:' + iframeHeight + 'px;"></div>');
		if( appType == 'iframe' ){
			_Ht.push(	'<iframe id="' + appIfrID + '" width="' + iframeWidth + '" height="' + iframeHeight + '" src="' + appURL + '" frameborder="0" style="overflow: hidden;display:none;z-index:9999;" allowtransparency="true" scrolling="No"></iframe>');
		}else{
			appURL += "&from=" + from + "&activity_flash=" + Ntalker.version.activity_flash;
			_Ht.push(	'<div style="display:block;width:'+iframeWidth+'px;height:'+iframeHeight+'px;" id="' + appIfrID + '"></div>');
		}
		_Ht.push(	'</div>');
		if( isAutoPosition ){
			_Ht.push(	'<div class="app_win_footer">');
			_Ht.push(	 'Powered by Ntalker');
			_Ht.push(	'</div>');
		}
		_Ht.push('</div>');
		__D.insert(__$('ntalkerbar'), _Ht.join(''), 'beforeEnd');
		
		if( appType == 'flash' ){
			__D.css(__$(appLoadingID),'display', 'none');
			var flashvars = {siteid: _V['siteid'], uid: _V['user_id'], username: encodeURIComponent(_V['user_name']), sessionid: _V['user_sid'] }, 
				params = {menu:"true", "salign":"LT", "allowScriptAccess":"always", "wmode":"Window", "allowFullScreen": true}, 
				attributes = {};
			ntalker_swfobject.embedSWF(_V['scriptPath'] + appURL, appIfrID, iframeWidth, iframeHeight, "9.0.115", _V['scriptPath']+"/fs/expressInstall.swf", flashvars, params, attributes);
			//NtUtil.Flash.create(_V['scriptPath'] + appURL, __$('span'+appIfrID), appIfrID, iframeWidth, iframeHeight, flashvars, params, attributes);
			__D.css(__$(appIfrID), 'display', 'block');
		}
		appWin = __$(_A[k]['id']);
		
		__C.ready( __$(appIfrID), function(){
			__D.css(__$(appLoadingID), 'display', 'none');
			__D.css(__$(appIfrID), 'display', 'block');
		});
		var __closeApplicationWindow = function(){
			self.closeApplicationWindow(k);
		};
		var __overApplicationCloseButton = function(){
			__D.replaceClass(__$(appCloseBtnID), 'app_itemClose', 'app_itemClose_over');
		};
		var __outApplicationCloseButton = function(){
			__D.replaceClass(__$(appCloseBtnID), 'app_itemClose_over', 'app_itemClose');
		};
		__E.addEvent(__$(appCloseBtnID), 'click', __closeApplicationWindow);
		__E.addEvent(__$(appCloseBtnID), 'mouseover', __overApplicationCloseButton);
		__E.addEvent(__$(appCloseBtnID), 'mouseout', __outApplicationCloseButton);
	}else{
		_A[k]['mutex']=="1" && this.closeApplicationWindow(k);
		return;
	}
	
	__D.addClass(__$(appBtnID), 'selected');
	__D.animate(this.backgroundDiv, {opacity:75}, 400, "swing", function(){});
	__D.animate(appWin, {opacity:100}, 'fast', "easeOutQuint", function(){});
	DEBUG('ntToolbar.openApplicationWindow::opend');
};
_NtBar.closeApplicationWindow = function(k){
	var _A = Ntalker.Config.application;
	if( !k ){
		for(var k in _A ){
			_A[k]['mutex']=="1" && this.closeApplicationWindow(k);
		}
		return;
	}
	var _A = Ntalker.Config.application,
		appBtnID = _A[k]['id'] + '_button',
		winElem = __$(_A[k]['id']),
	applicationButton = __$(appBtnID),
	appIfrID = _A[k]['id'] + '_iframe';
	if( winElem ){
		__D.removeClass(__$(appBtnID), 'selected');
		//__D.animate([winElem, __$('ntApplicationBackground')], {opacity:1}, 'fast', "easeOutQuint", function(elem){
			try{
				if( __B.ie8 ) __$(appIfrID).src = '';
				winElem && winElem.parentNode.removeChild(winElem);
				__$('ntApplicationBackground').parentNode.removeChild(__$('ntApplicationBackground'));
				Ntalker.variable.applicationOpened = false;
			}catch(e){
				winElem && winElem.parentNode.removeChild(winElem);
				__$('ntApplicationBackground') && __$('ntApplicationBackground').parentNode.removeChild(__$('ntApplicationBackground'));
				try{
					var rootElements = __D.filter(document.body.childNodes);
					for(i=0; i<rootElements.length; i++){
						if(rootElements[i].className == 'ntalker_application_background' && rootElements[i].id == 'ntApplicationBackground') 
							rootElements[i].parentNode.removeChild(rootElements[i]);
					}
				}catch(e){}
			}
		//});
	}
};
_NtBar.updateUserNumber = function(onlineUser, totalUser){
	if( __$('nt_firend') ){
		__$('nt_firend').innerHTML = sprintf(NtLang['buddylistButtonText'][0], String(onlineUser), String(totalUser));
	}
	var strOnline = String(onlineUser) + '' + String(totalUser);
	if( strOnline.length>2 ){
		this.onToolBarTextChanage();
	}
};
_NtBar.initMessageBox=function(){
	var self = this, _C = Ntalker.Config;
	if( !__$('nt_system') ){
		return;
	}
	var currentTag='divFeedContent',current_feed_Page=1,current_im_page=1;
	var __visibleActivity=function(currentTag,current_feed_Page,current_im_page){
		self.Mutex('system');
		self.leftMutex('');
		self.showMessageBox(currentTag,current_feed_Page,current_im_page);
	};
	var __hiddenActivity=function(e){
		if(IMToolBar&&IMToolBar.closeMessagebox){
			IMToolBar.closeMessagebox();
		}
	};
	var __buttonClick = function(){
		self.disableFlash('spanSystem');
		if(!__$('feed_ul')&&!__$('im_ul')){
			__visibleActivity.call(this);
			__D.addClass(__$('spanSystem'), 'selected');
			__D.css(__$('messageboxmenu'), 'height', '1px');
			var menuHeight = self._feedHeight <= 80 ? 119 : (self._feedHeight +38);
			menuHeight=(self._spanHeight||menuHeight);
			__D.animate(__$('messageboxmenu'), {height:menuHeight}, 'fast', 'easeInOutQuint', function(){});
		}else{
			__hiddenActivity.call(this);
		}
	};
	var __buttonOver = function(e){
		__D.addClass(__$('spanSystem'), "hover");
	};
	var __buttonOut = function(e){
		__D.removeClass(__$('spanSystem'), "hover");
	};
	__E.addEvent(__$('nt_system'), 'click', __buttonClick);
	__E.addEvent(__$('nt_system'), 'mouseover', __buttonOver);
	__E.addEvent(__$('nt_system'), 'mouseout',  __buttonOut);
	this.countMessageBox("im",false,true);
};
_NtBar.closeMessagebox = function(height){
	var self = this;
	var height=height;
	if( !__$('messageboxmenu') ){
		return;
	}
	__D.removeClass(__$('spanSystem'), 'selected');
	__D.animate(__$('messageboxmenu'), {height:1}, 'fast', 'easeInOutQuint', function(){
		__$('messageboxmenu').parentNode.removeChild(__$('messageboxmenu'));
		if(height){
			self._feedHeight=height;
		}else{
		self._feedHeight=0;
		}
	});
	this._Button="";
	this.countMessageBox('im',null,true);
};
_NtBar.contentMessageBox=function(currentTag,current_feed_Page,current_im_page,e){
	var _C = Ntalker.Config, _V = Ntalker.variable;
	var MessageBox=__$('nt_system');
	this.countMessageBox();
	var self=this;
	var perPage=5;
	var _fnum=this._fnum;
	var _inum=this._inum;
	var _anum=this._fnum*1+this._inum*1+this._customMessageCount*1;
	var _feedPage=Math.ceil((_fnum*1)/(perPage*1));
	var _sysPage=Math.ceil((_inum*1)/(perPage*1));
	var _hash=this._Hash;
	var _feedHT=['<ul id="feed_ul">'],_sysHT=['<ul id="im_ul">'];
	var im_show,feed_show;
	var current_feed_Page=typeof(current_feed_Page)=="number"?current_feed_Page:1;
	var current_im_page=typeof(current_im_page)=="number"?current_im_page:1;
	this._current_feed_Page=current_feed_Page;
	this._current_im_page=current_im_page;
	this._currentTag=currentTag;
	var feed_page_content,im_page_content;
	var feed_nex_page,feed_pre_page,im_nex_page,im_pre_page;
	if(current_feed_Page>_feedPage)current_feed_Page=_feedPage;
	if(current_im_page>_sysPage)current_im_page=_sysPage;
	if(current_feed_Page<_feedPage)feed_nex_page=current_feed_Page*1+1;else feed_nex_page=current_feed_Page;
	if(current_feed_Page>1)feed_pre_page=current_feed_Page*1-1;else feed_pre_page=current_feed_Page;
	if(current_im_page<_sysPage)im_nex_page=current_im_page*1+1;else im_nex_page=current_im_page;
	if(current_im_page>1)im_pre_page=current_im_page*1-1;else im_pre_page=current_im_page;
	if(feed_nex_page==current_feed_Page){
		feed_page_content='<span class="nt_box_page"><span class="nt_box_pre" onClick="IMToolBar.contentMessageBox(\'ntFeedTag\','+feed_pre_page+','+current_im_page+',event)" >&nbsp;&nbsp;</span><span style="margin-left:4px;" class="nt_box_nexnone" >&nbsp;&nbsp;</span></span>';
	}else if(feed_pre_page==current_feed_Page){
		feed_page_content='<span class="nt_box_page"><span class="nt_box_prenone" >&nbsp;&nbsp;</span><span class="nt_box_nex" style="margin-left:4px;" onClick="IMToolBar.contentMessageBox(\'ntFeedTag\','+feed_nex_page+','+current_im_page+',event)">&nbsp;&nbsp;</span></span>';
	}else{
		feed_page_content='<span class="nt_box_page"><span class="nt_box_pre" onClick="IMToolBar.contentMessageBox(\'ntFeedTag\','+feed_pre_page+','+current_im_page+',event)">&nbsp;&nbsp;</span><span style="margin-left:4px;" class="nt_box_nex" onClick="IMToolBar.contentMessageBox(\'ntFeedTag\','+feed_nex_page+','+current_im_page+',event)">&nbsp;&nbsp;</span></span>';
	}
	if(im_nex_page==current_im_page){
		im_page_content='<span class="nt_box_page"><span class="nt_box_pre" onClick="IMToolBar.contentMessageBox(\'ntIMTag\','+current_feed_Page+','+im_pre_page+',event)">&nbsp;&nbsp;</span><span style="margin-left:4px;" class="nt_box_nexnone" >&nbsp;&nbsp;</span></span>';
	}else if(im_pre_page==current_im_page){
		im_page_content='<span class="nt_box_page"><span class="nt_box_prenone">&nbsp;&nbsp;</span><span style="margin-left:4px;" class="nt_box_nex" onClick="IMToolBar.contentMessageBox(\'ntIMTag\','+current_feed_Page+','+im_nex_page+',event)">&nbsp;&nbsp;</span></span>';
	}else{
		im_page_content='<span class="nt_box_page"><span class="nt_box_pre" onClick="IMToolBar.contentMessageBox(\'ntIMTag\','+current_feed_Page+','+im_pre_page+',event)">&nbsp;&nbsp;</span><span style="margin-left:4px;" class="nt_box_nex" onClick="IMToolBar.contentMessageBox(\'ntIMTag\','+current_feed_Page+','+im_nex_page+',event)">&nbsp;&nbsp;</span></span>';
	}
	var feed_flag=0,im_flag=0,lineClass="nt_box_line",have_feed=false;
	for(var k=0;k<_hash.length;k++){
		var _V1 = _hash[k];
		var unread="";
		if(_V1.msgtype=='feed'){
			if(feed_flag>=(current_feed_Page-1)*perPage&&feed_flag<(current_feed_Page*1-1)*perPage+perPage*1){
				if(currentTag=="ntFeedTag"){
					if(!_V1.isRead){
						this._rfnum++;unread='style=\"font-weight: bold;\"';
						var _V = Ntalker.variable;
						var desc="feedmsg";
						var siteurl=Ntalker.Config['services'] + "/func/statistic.php?siteid="+_V['siteid']+"&uid="+_V['user_id']+"&destid=0&groupid=0&type=18&mode=2&source=0&desc="+encodeURIComponent(desc)+"&from=sysMsgList&rnd="+new Date().getTime();
						__C.load({tagName:'img', href:siteurl});
					}
					_V1.isRead=true;
				}
				_feedHT.push('<li style="cursor:pointer;" k="' + _V1.key + '" class="' + lineClass + ' nt_box_out" onClick=\'fIM_navigateToModuleView("'+_V1.id+'", "'+_V1.name+'","'+_V1.opentype+'" ,"'+_V1.activitytype+'", "'+_V1.activityid+'", "'+_V1.key+'", "feed_ul", "feedMsgList","'+_V1.chatid+'","'+_V1.msgtype+'",event)\'>');
				_feedHT.push(	'<div class="nt_box_ico"><img onerror=\'this.src="'+_C['imagesDIR'] + '/notify_userhead.png"\'  src="' + (_V1.iconurl ? _V1.iconurl : _C['imagesDIR'] + '/notify_userhead.png') + '" width=38 height=38 border=0 /></div>');
				_feedHT.push(	'<div class="nt_box_content_big" '+unread+'>');
				_feedHT.push(	_V1.content);
				_feedHT.push(	'</div>');
				_feedHT.push(	'<div class="nt_item_box_close" onClick="IMToolBar.removeMessageBox(\''+_V1.key+'\', \'feed_ul\', false, event)"></div>');
				_feedHT.push(	'<span class="clearfloat"></span>');
				_feedHT.push('<div class="nt_box_button" style="width:100%"></div>');
				_feedHT.push('</li>');
				feed_flag++;
			}else{
				feed_flag++;
			}
		}
		else{
			if(!_V1.msgtype) {continue;}
			if(im_flag>=(current_im_page-1)*perPage&&im_flag<(current_im_page*1-1)*perPage+perPage*1){
				if(currentTag=="ntIMTag"){
					if(!_V1.isRead){
						this._rinum++;unread='style=\"font-weight: bold;\"';
						if(_V1.msgtype=="notify"){
							var _V = Ntalker.variable;
							var desc="msgid_is_"+_V1.msgid;
							var siteurl=Ntalker.Config['services'] + "/func/statistic.php?siteid="+_V['siteid']+"&uid="+_V['user_id']+"&destid=0&groupid=0&type=17&mode=2&source=0&desc="+encodeURIComponent(desc)+"&from=sysMsgList&rnd="+new Date().getTime();
							__C.load({tagName:'img', href:siteurl});
						}
					}
					 _V1.isRead=true;
				}
				if(_V1.id&&_V1.name&&_V1.opentype!="img"){
					_sysHT.push('<li style="cursor:pointer;" k="' + _V1.key + '" class="' + lineClass + ' nt_box_out" onClick=\'fIM_navigateToModuleView("'+_V1.id+'", "'+_V1.name+'","'+_V1.opentype+'","'+_V1.activitytype+'","'+_V1.activityid+'", "'+_V1.key+'", "im_ul", "sysMsgList","'+_V1.chatid+'","'+_V1.msgtype+'",event,"'+_V1.msgid+'")\'>');
				}else if(_V1.opentype=="img"){
					_sysHT.push('<li style="cursor:pointer;" k=\'' + _V1.key + '\' class=\'' + lineClass + ' nt_box_out\' onClick=\'javascript:window.open("'+(_V1.profileurl?_V1.profileurl:"")+'");IMToolBar.removeMessageBox("'+_V1.key+'","im_ul",false,event);\'>');
			}else{
					_sysHT.push('<li k="' + _V1.key + '" class="' + lineClass + ' nt_box_out" >');
				}
				_sysHT.push(	'<div class="nt_box_ico"><img onerror=\'this.src="'+_C['imagesDIR'] + '/notify_userhead.png"\'  src="' + (_V1.iconurl ? _V1.iconurl : _C['imagesDIR'] + '/notify_userhead.png') + '" width=38 height=38 border=0 /></div>');
				_sysHT.push(	'<div class="nt_box_content_big" ' +unread+'>');
				_sysHT.push(	_V1.content);
				_sysHT.push(	'</div>');
				if(_V1.chatid&&_V1.id&&_V1.msgtype=="request"&&_V1.opentype=="chat")
				{	 
					 _sysHT.push('<div class="nt_item_box_close" onClick="IMToolBar.removeMessageBox(\''+_V1.key+'\', \'im_ul\', false, event);fiM_RefuseRequest(\''+_V1.id+'\',\''+_V1.chatid+'\',\''+_V1.chatsid+'\')"></div>');
				}else{
					_sysHT.push('<div class="nt_item_box_close" onClick="IMToolBar.removeMessageBox(\''+_V1.key+'\', \'im_ul\', false, event)";></div>');
				}
				_sysHT.push(	'<span class="clearfloat"></span>');
				switch(_V1.msgtype){
				case 'notify':
					_sysHT.push('<div class="nt_box_button"></div>');
					break;
				case 'confirm':
					_sysHT.push('<div class="nt_box_button"><input type="button" class="nt_box_ignore" onclick="IMToolBar.removeMessageBox(\''+_V1.key+'\',\'im_ul\',false,event)"><input type="button" class="nt_box_approve" onclick="im_boxConfrim(\''+_V1.id+'\',1,\''+_V1.key+'\',\'im_ul\', event);fIM_navigateToModuleView(\''+_V1.id+'\',\''+_V1.name+'\',\''+_V1.opentype+'\' ,\''+_V1.activitytype+'\', \''+_V1.activityid+'\', \''+_V1.key+'\', \'feed_ul\', \'feedMsgList\',\''+_V1.chatid+'\',\''+_V1.msgtype+'\',event);"></div>');
						break;
				case 'request':
					_sysHT.push('<div class="nt_box_button"><input type="button" class="nt_box_ignore" onclick="fiM_RefuseRequest(\''+_V1.id+'\',\''+_V1.chatid+'\',\''+_V1.chatsid+'\');IMToolBar.removeMessageBox(\''+_V1.key+'\',\'im_ul\',false,event)"><input type="button" class="nt_box_approve" onclick="fIM_navigateToModuleView(\''+_V1.id+'\',\''+_V1.name+'\',\''+_V1.opentype+'\' ,\''+_V1.activitytype+'\', \''+_V1.activityid+'\', \''+_V1.key+'\', \'feed_ul\', \'feedMsgList\',\''+_V1.chatid+'\',\''+_V1.msgtype+'\',event);IMToolBar.removeMessageBox(\''+_V1.key+'\',\'im_ul\',false,event);"></div>');
					break;
				}
				_sysHT.push('</li>');
				im_flag++;
			}else{
					im_flag++;
			}
		}
	}
	for(var i=0;i<Ntalker.variable.ExMsg.length;i++){
		var _ExtMsg=Ntalker.variable.ExMsg[i];
		if(_ExtMsg.msgnumber>0){
			_sysHT.push('<LI class="nt_box_single nt_box_out" onclick="IMToolBar.viewCurstomSystemMessage(\'' + _ExtMsg.url + '\',event);" class="act nt-item-out" url="' + _ExtMsg.url + '"><DIV><a href="javascript:void(0);">' + _ExtMsg.name + ' (' + _ExtMsg.msgnumber + ')</a></DIV></LI>');	
		}
	}
	if(_fnum==0){
		_feedHT.push('<li class="nt_box_single nt_box_out"><div class="nt_box_null">' + sprintf(NtLang['nullMessage'][0], NtLang['systemMessageBoxText'][0]) + '</div></li>');
			_feedHT.push('</ul>');
	}else{
			_feedHT.push('</ul>');
		if(_feedPage>1)
		_feedHT.push(feed_page_content);
	}
	if( _anum - _fnum == 0){
		_sysHT.push('<li class="nt_box_single nt_box_out"><div class="nt_box_null">' + sprintf(NtLang['nullMessage'][0], NtLang['systemMessageBoxText'][1]) + '</div></li>');
			_sysHT.push('</ul>');
	}else{
			_sysHT.push('</ul>');
		if(_sysPage>1)
		_sysHT.push(im_page_content);
	}
	__$('divFeedContent').innerHTML=_feedHT.join('');
	__$('divIMContent').innerHTML=_sysHT.join('');
		if(__$('divFeedContent').scrollHeight!=0&&__$('divFeedContent').scrollHeight>this._feedHeight) {
			this._feedHeight=__$('divFeedContent').scrollHeight;
		}
		var feedHeight = (__$('divFeedContent').scrollHeight>this._feedHeight)?(__$('divFeedContent').scrollHeight):(this._feedHeight);
		var imHeight   = __$('divIMContent').scrollHeight ? (__$('divIMContent').scrollHeight):(_inum>perPage?perPage*50+20*1:_inum*50+20*1);
		if( feedHeight > imHeight ){
			var paddingHeight = parseInt(__D.css(__$('divFeedContent'), 'paddingTop')) + parseInt(__D.css(__$('divFeedContent'), 'paddingBottom'));
			feedHeight=feedHeight-paddingHeight;
			if(this._feedHeight<feedHeight){
				this._feedHeight=feedHeight+paddingHeight;
			}
			var menuContentHeight = Math.max(80, feedHeight);
			var spanHeight=feedHeight>80 ? menuContentHeight+48 : menuContentHeight+39;
			if(__B.chrome){
				if(_feedPage>1){
					menuContentHeight-=15;
					spanHeight-=15;
					this._feedHeight-=15;
				}
			}
			this._spanHeight=spanHeight;
			if(currentTag=="ntFeedTag"){
				__D.css(__$('divFeedContent'), 'height', menuContentHeight + 'px' );
			}else{
				__D.css(__$('divIMContent'), 'height', menuContentHeight + 'px' );
			}
			if(!this._Button){
				this._Button=(__$("messageboxmenu")||"");
			}
			__D.css(this._Button, 'height', spanHeight + 'px' );
		}else{
			var paddingHeight = parseInt(__D.css(__$('divIMContent'), 'paddingTop')) + parseInt(__D.css(__$('divIMContent'), 'paddingBottom'));
			imHeight=imHeight-paddingHeight;
			if(this._feedHeight<imHeight){
				this._feedHeight=imHeight+paddingHeight;
			}
			var menuContentHeight = Math.max(80, imHeight);
		   	var spanHeight=imHeight>80 ? menuContentHeight+48 : menuContentHeight+39;
		   	if(__B.chrome){
				if(_sysPage>1){
					menuContentHeight-=15;
					spanHeight-=15;
					this._feedHeight-=15;
				}
			}
			   this._spanHeight=spanHeight;
			if(currentTag=="ntFeedTag"){
				__D.css(__$('divFeedContent'), 'height', menuContentHeight + 'px' );
			}else{
				__D.css(__$('divIMContent'), 'height', menuContentHeight + 'px' );
		}
			if(!this._Button){
				this._Button=(__$("messageboxmenu")||"");
			}
			__D.css(this._Button, 'height', spanHeight + 'px' );
	}
	var __mouseOver = function(e){
		e = __E.fixEvent(e);
		target= searchTag(e.target, "li");
		__D.replaceClass(target, 'nt_box_out', 'nt_box_over');
		for(var k in target.childNodes ){
			var itemCloseButton = target.childNodes[k];
			if( itemCloseButton && itemCloseButton.className == 'nt_item_box_close' ){
				__D.css(itemCloseButton, 'background', 'url('+_C['imagesDIR']+'/nt_box_bj.gif) -20px -140px');
			}
		}
	};
	var __mouseOut = function(e){
		e = __E.fixEvent(e);
		target= searchTag(e.target, "li");
		__D.replaceClass(target,'nt_box_over','nt_box_out');
		for(var k in target.childNodes ){
			var itemCloseButton = target.childNodes[k];
			if( itemCloseButton && itemCloseButton.className == 'nt_item_box_close' ){
				__D.css(itemCloseButton, 'background', 'none');
			}
		}
	};
	var __onClick=function(e){
		e = __E.fixEvent(e);
		target= searchTag(e.target, "li");
		for(var k in target.childNodes ){
			var itemCloseButton = target.childNodes[k];
			if( itemCloseButton && itemCloseButton.className == 'nt_box_content_big' ){
				__D.css(itemCloseButton, 'font-weight', 'normal');
			}
		}
	};
	for(k in __$('feed_ul').childNodes){
		var elem = __$('feed_ul').childNodes[k];
		if( elem.nodeName && elem.nodeName.toUpperCase()== "LI"){
			__E.addEvent(elem, 'mouseover', __mouseOver);
			__E.addEvent(elem, 'mouseout', __mouseOut);
			__E.addEvent(elem, 'click', __onClick);
		}
	}
	for(k in __$('im_ul').childNodes){
		var elem = __$('im_ul').childNodes[k];
		if( elem.nodeName &&elem.nodeName.toUpperCase() == "LI"){
			__E.addEvent(elem, 'mouseover', __mouseOver);
			__E.addEvent(elem, 'mouseout', __mouseOut);
			__E.addEvent(elem, 'click', __onClick);
		}
	}
	this.countMessageBox('im',null,true);
};
_NtBar.showMessageBox = function(currentTag,current_feed_Page,current_im_page){
	var _C = Ntalker.Config;
	var _CP = Ntalker.Config.customparams;
	var MessageBox = __$('nt_system');
	var self=this;
	var _inum=this._inum;
	var _fnum=this._fnum;
	var _rfnum=this._rfnum;
	var _rinum=this._rinum;
	var _anum=this._fnum*1+this._inum*1+this._customMessageCount*1;
	var _Ht=[];
	var isShowFeed="";
	this.focusTag();
	if(!currentTag){
		var _urfnum=this._fnum-this._rfnum;
		var _urinum=this._inum-this._rinum;
		if(_urfnum>0&&_urinum==0){
			currentTag="ntFeedTag";
		}else{
			currentTag="ntIMTag";
	}
	}else{
		currentTag=currentTag;
	}
	if(_CP['quanflag']==0){
		currentTag="ntIMTag";
		isShowFeed="style=\"display:none\"";
	}
	if(currentTag=='ntIMTag'){im_show="block";feed_show="none";im_current="nt_box_currenttag";feed_current="nt_box_tag";}else{im_show="none";feed_show="block";feed_current="nt_box_currenttag";im_current="nt_box_tag";}
	var feed_str=(_fnum-_rfnum>0)?'<span style="color:red" id="feed_num" ><span style="color:black">(</span>'+(_fnum-_rfnum)+'<span style="color:black">)</span></span>':"";
	var im_str=((_inum-_rinum)*1+this._customMessageCount*1>0)?'<span style="color:red" id="im_num" ><span style="color:black">(</span>'+((_inum-_rinum)*1+this._customMessageCount*1)+'<span style="color:black">)</span></span>':"";
	var temp=__D.clientRect("nt_content").left+__D.clientRect("nt_content").w-__D.clientRect("nt_system").left;
	if(temp>300){
		temp=temp-301;
	}else{
		temp=0;
	}
	_Ht.push('<span id="messageboxmenu" class="nt_box_menu" style="right:'+temp+'px;" >');
	_Ht.push('<div class="nt_box_top">');
	_Ht.push('<div class="nt_box_bottom">');
	_Ht.push('	<span id="ntFeedTag" '+isShowFeed+' class=" nt_box_feed '+feed_current+'">' + NtLang['systemMessageBoxText'][0] + feed_str + '</span>');
	_Ht.push('	<span id="ntIMTag" class=" nt_box_im '+im_current+'">' + NtLang['systemMessageBoxText'][1] + im_str + '</span>');
	_Ht.push('	<span class="nt_box_close" onClick="IMToolBar.closeMessagebox();">&nbsp;</span>');
	_Ht.push('<br class="clearfloat" />');
	_Ht.push('<div id="divFeedContent" style="display:'+feed_show+';" class="nt_box_feed_content">' + NtLang['systemMessageBoxText'][0] + NtLang['LoadingText'] + '</div>');
	_Ht.push('<div id="divIMContent" style="display:'+im_show+';" class="nt_box_im_content">' + NtLang['systemMessageBoxText'][1] + NtLang['LoadingText'] + '</div>');
	_Ht.push('</div></div>');
	_Ht.push('</span>');
	this._Button=(__D.insert(__$("ntalkerbar"), _Ht.join(''), 'beforeEnd')||__$("messageboxmenu"));
	var _V = Ntalker.variable;
	var desc="messagebox";
	var siteurl=Ntalker.Config['services'] + "/func/statistic.php?siteid="+_V['siteid']+"&uid="+_V['user_id']+"&destid=0&groupid=0&type=19&mode=2&source=0&desc="+encodeURIComponent(desc)+"&from=sysMsgList&rnd="+new Date().getTime();
	__C.load({tagName:'img', href:siteurl});
	this.contentMessageBox(currentTag,current_feed_Page,current_im_page);
	function changetag(type){
		if(type=="feed"){
			__D.replaceClass(__$('ntFeedTag'),'nt_box_tag','nt_box_currenttag');
			__D.css(__$('divFeedContent'),'display','block');
			__D.replaceClass(__$('ntIMTag'),'nt_box_currenttag','nt_box_tag');
			__D.css(__$('divIMContent'),'display','none');
		}else{
			__D.replaceClass(__$('ntFeedTag'),'nt_box_currenttag','nt_box_tag');
			__D.css(__$('divFeedContent'),'display','none');
			__D.replaceClass(__$('ntIMTag'),'nt_box_tag','nt_box_currenttag');
			__D.css(__$('divIMContent'),'display','block');
		}
		}
	__$('ntFeedTag').onclick = function(e){
		__E.fixEvent(e).stopPropagation();
		self._currentTag = "ntFeedTag";
		changetag('feed');
		self.contentMessageBox(self._currentTag,self._current_feed_Page,self._current_im_page);
	};
	__$('ntIMTag').onclick = function(e){
		__E.fixEvent(e).stopPropagation();
		self._currentTag="ntIMTag";
		changetag('im');
		self.contentMessageBox(self._currentTag,self._current_feed_Page,self._current_im_page);
	};
};
_NtBar.countMessageBox=function(type,isread,isnew){
	var _hash=this._Hash;
	var imMsgCount=0;
	var _inum=this._inum;
	var _fnum=this._fnum;
	this._customMessageCount=0;
	for(var i=0;i<Ntalker.variable.ExMsg.length;i++){
		var _ExtMsg=Ntalker.variable.ExMsg[i];
		if(_ExtMsg.msgnumber>0){
			this._customMessageCount=_ExtMsg.msgnumber*1+this._customMessageCount*1;
		}
	}
	if(__$('nt_system')&&isnew==true){
		var unum=(this._fnum-this._rfnum)*1+(this._inum-this._rinum)*1+this._customMessageCount*1;
		var _uinum=this._inum-this._rinum;
		if(_uinum>0){
			__$('nt_system').innerHTML=NtLang['systemButtonText']+'<span class="nt_box_tip2">('+unum+')</span>';
			var allCount = this._Hash.length;
			if(allCount>0){
				this.enableflash('spanSystem', '', 'flash');
			}else{
				this.disableFlash('spanSystem');
			}
		}else if(unum>=0){
			__$('nt_system').innerHTML=NtLang['systemButtonText']+'<span class="nt_box_tip2">('+unum+')</span>';
		}
	}
	if(__$('feed_num')&&_fnum-this._rfnum>0){
		__$('feed_num').innerHTML="<span style='color:black'>(</span>"+(_fnum-this._rfnum)+'<span style="color:black">)</span>';
	}else if(__$('feed_num')){
		__$('feed_num').innerHTML="";
	}
	if(__$('im_num')&&(_inum-this._rinum)*1+this._customMessageCount*1>0) {
		__$('im_num').innerHTML="<span style='color:black'>(</span>"+((_inum-this._rinum)*1+this._customMessageCount*1)+'<span style="color:black">)</span>';
	}else if(__$('im_num')){
		__$('im_num').innerHTML="";
	}
	if(type=="all") return this._customMessageCount*1+_hash.length*1;
};
_NtBar.addMessageBox=function(id,name,content,opentype,iconurl,msgtype,activitytype,activityid,activityname,activityicon,profileurl,chatid,isread,msgid,srcuid,msgtime,chatsid){
	var _hash=this._Hash;
	var _CP = Ntalker.Config.customparams;
	var rand=1, isupdate = false;
	var temp=0;
	var _fnum=this._fnum;
	var _inum=this._inum;
	var _tipTime=1800;
	if(_CP['quanflag']==0){
		if(msgtype=="feed"){
			return;
		}
	}
	function contains(_hash,msgtype,rand){
		for(var i=0;i<_hash.length;i++){if (_hash[i]&&_hash[i].key==msgtype+rand){ temp++; return true;}}
	}
	while(contains(_hash,msgtype,rand)){
		rand=Math.floor(Math.random()*99);
		if(temp>=99) break;
		if(msgtype=="feed"){
			if(_fnum>=50) break;
		}else{
			if(_inum>=50) break;
		}
	}
	for(var i=0;i<_hash.length;i++){
		var tmp=_hash[i];
		if(tmp&&tmp.id==id&&msgtype==tmp.msgtype){
			if(msgtype=="confirm"||msgtype=="request"){
				if(_hash[i].isRead){this._rinum--;isread=true;}
				this._inum--;
				_hash.splice(i,1);
				break;
			}else if(msgtype=="feed"){
				if((srcuid&&tmp.srcuid==srcuid)||tmp.activityid==activityid){
					if(_hash[i].isRead){
						this._rfnum--;
					}
					this._fnum--;
					if((Date.parse(new Date()))/1000-tmp.msgtime>_tipTime){
						isread=false;
						msgtime=Date.parse(new Date())/1000;
					}else{
						isread=tmp.isRead;
						msgtime=tmp.msgtime;
					}
					_hash.splice(i,1);
					break;
				}
				}
			}
		}
	if(_fnum>=50||_inum>=50){
		for(var i=_hash.length-1;i>=0;i--){
			var tmp=_hash[i];
		if(msgtype=="feed"&&_fnum>=50){
				if(tmp&&tmp.msgtype==msgtype){
				this._fnum--;
				if(tmp.isRead) this._rfnum--;
					_hash.splice(i,1);
				break;
			}
		}else{
				if(tmp&&tmp.msgtype==msgtype&&_inum>=50){
				this._inum--;
				if(tmp.isRead) this._rinum--;
					_hash.splice(i,1);
				break;
			}
		}
	}
	}
	if(!isupdate){
		_hash.unshift({
				key:msgtype+rand,
				id:id,
				name:name,
				content:content,
				opentype:opentype,
				iconurl:iconurl,
				msgtype:msgtype,
				activitytype:activitytype,
				activityid:activityid,
				activityname:activityname,
				activityicon:activityicon,
				profileurl:profileurl,
				chatid:chatid,
				isRead:isread,
				msgid:msgid,
				srcuid:srcuid,
				msgtime:msgtime,
				chatsid:chatsid
			}
		);
		if(msgtype=="feed"){ 
			this._fnum++;
			if(isread) this._rfnum++;
		}
		else{
			if(isread) this._rinum++;
			 this._inum++;
		}
	}
	if(!this._Button){
		this.countMessageBox('im',null,true);
	}
};
_NtBar.removeMessageBox=function(k,ulid,keepHt,e){
	__E.fixEvent(e).stopPropagation();
	var _hash=this._Hash;
	for(var i=0;i<_hash.length;i++){
		if(_hash[i].key==k){
			if(_hash[i].msgtype=="feed"){ 
				if(_hash[i].isRead) this._rfnum--;
				this._fnum--;
			}
			else{ 
				if(_hash[i].isRead) this._rinum--;
				this._inum--; 
			}	
		_hash.splice(i,1);
		}
	}
	if(keepHt!=true){
	var span=__$(ulid);
	for(i in span.childNodes){
		var child=span.childNodes[i];
			if(child&&child.nodeName=="LI"&&child.attributes['k']&&child.attributes['k'].nodeValue==k){
			span.removeChild(child);
			break;
		}
	}
	}
	this.countMessageBox('im',null,true);
	if(this._Button)
		this.contentMessageBox(this._currentTag,this._current_feed_Page,this._current_im_page);
};
_NtBar.saveMessageBox=function(){
	var _V = Ntalker.variable;
	if( !this._Hash ){
		return;
	}
	var _hash=this._Hash,feed=0,im=0,flag=[];
	for(var i=0; i<_hash.length;i++){
		var _V1=_hash[i];
		if(_V1.msgtype=="feed"){
			if( feed<20 ){
				flag.push(_V1);feed++;
			}
			}else {
			if( im<20 ){flag.push(_V1); im++;
			}
		}
	}
	if( flag.length == 0 ){
		cookieValue = null;
	}else{
		cookieValue = __J.toJSONString(flag);
	}
	NtUtil.saveValue(_V['user_id'], Ntalker['ctKEY'], cookieValue);
};
_NtBar.loadMessageBox=function(){
	var _V = Ntalker.variable;
	NtUtil.loadValue(_V['user_id'], Ntalker['ctKEY']);
};
_NtBar.initConfigurationMenu = function(){
	var _V = Ntalker.variable;
	if( _V['user_sid'] == 'NtalkerGuestUserSessionID' || !__$('nt_setting') ){
		return;
	}
	var self = this;
	var __buttonOver = function(e){
		__D.addClass(__$('ntConfiguration'), "hover");
	};
	var __buttonOut = function(e){
		__D.removeClass(__$('ntConfiguration'), "hover");
	};
	var __visibleConfigurationMenu = function(){
		self.visibleConfigurationMenu();
	};
	__E.addEvent(__$('nt_setting'), 'mouseover', __buttonOver);
	__E.addEvent(__$('nt_setting'), 'mouseout',  __buttonOut);
	__E.addEvent(__$('nt_setting'), 'click',  __visibleConfigurationMenu);
};
_NtBar.visibleConfigurationMenu = function(){
	var _Ht = [], _CP = Ntalker.Config.customparams;
	if( __$('configurationMenu') ){
		this.hiddenConfigurationMenu();
		return;
	}
	IMToolBar.Mutex('');
	/*for(var i=0, l = chatWindowManager._chatWndsArray.length; i < l; i++){
		if(chatWindowManager._chatWndsArray[i]._chatType == 'traing'){
			chatWindowManager._chatWndsArray[i].minimize();
		}
	}*/
	_Ht.push('<span id="configurationMenu" class="ntalkerbar-menuright" style="">');
	_Ht.push(	'<div class="TopGradient">');
	_Ht.push(		'<div class="BottomGradient">');
	_Ht.push(			'<div class="ntMenuTitle">');
	_Ht.push(				'<span class="ntConfigMenuText"></span>');
	_Ht.push(				'<span class="ntConfigMenuClose" id="ntConfigMenuClose"></span>');
	_Ht.push(			'</div>');
	_Ht.push(			'<div class="ntMenuLine"></div>');
	_Ht.push(			'<div class="ntMenuContent" id="ntConfigMenuList">');
	if( _CP['quanflag'] ){
		_Ht.push(			'<div class="ntMenuItemtTitle">' + NtLang['configurationMenuDynamicMessages'][0] + '</div>');
		_Ht.push(			'<div cusname="acceptOriginalFeed" cusgroupname="dynamicMessages" class="ntMenuItemtText dynamicMessages" custype="Checkbox">' + NtLang['configurationMenuDynamicMessages'][1] + '</div>');
		_Ht.push(			'<div cusname="acceptCommentFeed" cusgroupname="dynamicMessages" class="ntMenuItemtText dynamicMessages" custype="Checkbox">' + NtLang['configurationMenuDynamicMessages'][2] + '</div>');
		_Ht.push(			'<div class="ntMenuLine"></div>');
	}
	if( _CP['enablegroup'] || _CP['enableroom'] ){
		_Ht.push(			'<div class="ntMenuItemtTitle">' + NtLang['configurationMenuGroupSetting'][0] + '</div>');
		_Ht.push(			'<div cusgroupname="groupSetting" class="ntMenuItemtText groupSetting" custype="Radio" cusvalue="0">' + NtLang['configurationMenuGroupSetting'][1] + '</div>');
		_Ht.push(			'<div cusgroupname="groupSetting" class="ntMenuItemtText groupSetting" custype="Radio" cusvalue="1">' + NtLang['configurationMenuGroupSetting'][2] + '</div>');
		_Ht.push(			'<div class="ntMenuLine"></div>');
	}
	_Ht.push(				'<div class="ntMenuItemtTitle">' + NtLang['configurationMenuOtherSettings'][0] + '</div>');
	if( !(_CP['enableOnlineHint']===0) ){
		_Ht.push(			'<div cusname="buddyLoginTip" cusgroupname="otherSettings" class="ntMenuItemtText otherSettings" custype="Checkbox">' + NtLang['configurationMenuOtherSettings'][1] + '</div>');
	}
	_Ht.push(				'<div cusname="acceptMsgFlag" cusgroupname="otherSettings" class="ntMenuItemtText otherSettings" custype="Checkbox">' + NtLang['configurationMenuOtherSettings'][2] + '</div>');
	if( _CP['playsound'] ){
		_Ht.push(			'<div cusname="audioOnFlag" cusgroupname="otherSettings" class="ntMenuItemtText otherSettings" custype="Checkbox">' + NtLang['configurationMenuOtherSettings'][3] + '</div>');
	}
	_Ht.push(			'</div>');
	_Ht.push(		'</div>');
	_Ht.push(	'</div>');
	_Ht.push('</span>');
	var menuElem = __D.insert(__$('ntalkerbar'), _Ht.join(''), 'beforeEnd');
	__D.addClass(__$('ntConfiguration'), "selected");
	__D.css(menuElem, 'display', 'block');
	var menuHeight = __D.clientRect(menuElem).h - 2;
	__D.css(menuElem, 'height', '1px');
	__D.animate(menuElem, {height:menuHeight}, 'fast', 'easeInOutQuint', function(){});
	var impresenceflash = __$('impresenceflash');
	if( impresenceflash && impresenceflash.getSetting ){
		impresenceflash.getSetting( );
	}
	var self = this;
	var __menuItemOver = function(e){
		var event = __E.fixEvent(e);
		var current = event.target;
		__D.addClass(current, "hover");
	};
	var __menuItemOut = function(e){
		var event = __E.fixEvent(e);
		var current = event.target;
		__D.removeClass(current, "hover");
	};
	var __menuItemClick = function(e){
		var event = __E.fixEvent(e);
		var current = event.target;
		self.setConfiguration(current);
	};
	var __hiddenConfigurationMenu = function(e){
		self.hiddenConfigurationMenu();
	};
	__E.addEvent(__$('ntConfigMenuClose'), 'click', __hiddenConfigurationMenu);
	var menuItems = __D.filter(__$('ntConfigMenuList').childNodes);
	__A.each(menuItems, function(elem){
		if( elem.className.indexOf("ntMenuItemtText") > -1 ){
			__E.addEvent(elem, 'mouseover', __menuItemOver);
			__E.addEvent(elem, 'mouseout',  __menuItemOut);
			__E.addEvent(elem, 'click',  __menuItemClick);
		}
	});
};
_NtBar.hiddenConfigurationMenu = function(){
	__D.removeClass(__$('ntConfiguration'), "selected");
	if( !__$('configurationMenu') ){
		return;
	}
	__D.animate(__$('configurationMenu'), {height:1}, 'fast', 'easeInOutQuint', function(){
		__$('configurationMenu').parentNode.removeChild(__$('configurationMenu'));
	});
};
_NtBar.setConfiguration = function(clickElement){
	var custype, cusGroupName,groupItems, modifyIndex = 0;
	if( !clickElement ){
		return;
	}
		custype = clickElement.getAttribute('custype');
		cusGroupName = clickElement.getAttribute('cusgroupname');
	if( cusGroupName == 'dynamicMessages' ){
		modifyIndex = 0;
	}else if( cusGroupName == 'groupSetting' ){
		modifyIndex = 1;
	}else{
		modifyIndex = 2;
	}
	if( custype.toLowerCase() == 'radio' ){
		groupItems = __D.filter(__$('ntConfigMenuList').childNodes, '.'+cusGroupName);
		__A.each(groupItems, function(elem){
			if( clickElement == elem ){
				__D.addClass(elem, 'selected_radio');
			}else{
				__D.removeClass(elem, 'selected_radio');
			}
		});
	}else if( custype.toLowerCase() == 'checkbox' ){
		if( !__D.indexOfClass(clickElement, 'selected_checkbox') ){
			__D.addClass(clickElement, 'selected_checkbox');
		}else{
			__D.removeClass(clickElement, 'selected_checkbox');
		}
	}else if( custype.toLowerCase() == 'checkbox' ){
		return;
	}
	this.saveConfiguration(modifyIndex);
};
_NtBar.loadConfiguration = function(strJson){
	var jsonConfiguration = {};
	jsonConfiguration = this.jsonConfiguration = __J.parseJSON(strJson);
	if( !__$('ntConfigMenuList') ){
		return;
	}
	var Items = __D.filter(__$('ntConfigMenuList').childNodes, '.ntMenuItemtText');
	__A.each(Items, function(elem){
		var custype = elem.getAttribute('custype');
		if( custype.toLowerCase() == 'radio' ){
			if( elem.getAttribute('cusvalue') == jsonConfiguration.groupSetting ){
				__D.addClass(elem, 'selected_radio');
			}else{
				__D.removeClass(elem, 'selected_radio');
			}
		}else if( custype.toLowerCase() == 'checkbox' ){
			if( jsonConfiguration[elem.getAttribute('cusname')] === true || jsonConfiguration[elem.getAttribute('cusname')] === elem.getAttribute('cusvalue') ){
				__D.addClass(elem, 'selected_checkbox');
			}else{
				__D.removeClass(elem, 'selected_checkbox');
			}
		}
	});
};
_NtBar.saveConfiguration = function(modifyIndex){
	var jsonConfiguration = {modifyIndex:modifyIndex};
	var Items = __D.filter(__$('ntConfigMenuList').childNodes, '.ntMenuItemtText');
	__A.each(Items, function(elem){
		var custype = elem.getAttribute('custype');
		if( custype.toLowerCase() == 'radio' && __D.indexOfClass(elem, 'selected_radio') ){
			jsonConfiguration[elem.getAttribute('cusgroupname')] = elem.getAttribute('cusvalue');
		}else if( custype.toLowerCase() == 'checkbox' ){
			jsonConfiguration[elem.getAttribute('cusname')] = __D.indexOfClass(elem, 'selected_checkbox');
		}
	});
	if( typeof(jsonConfiguration.acceptOriginalFeed)=='undefined' ) jsonConfiguration.acceptOriginalFeed = true;
	if( typeof(jsonConfiguration.acceptCommentFeed)=='undefined' )  jsonConfiguration.acceptCommentFeed = true;
	this.jsonConfiguration = jsonConfiguration;
	var strJson = __J.toJSONString(jsonConfiguration);
	var impresenceflash = __$('impresenceflash');
	if( impresenceflash && impresenceflash.setSetting ){
		impresenceflash.setSetting( strJson );
	}
};
function im_boxConfrim(id, confirmStr, key, ulid, e){
	__E.fixEvent(e).stopPropagation();
	var impresence = __$('impresenceflash');
	if(impresence && impresence.addFriendConfirmResult){
	   impresence.addFriendConfirmResult(id, confirmStr);
	}
	if(IMToolBar&&IMToolBar.removeMessageBox){
		IMToolBar.removeMessageBox(key,ulid,false, e);
	}
}
function fIM_navigateToModuleView(id, name,opentype, activitytype,activityid, key, ulid, befrom,chatid,msgtype,e,msgid){
	__E.fixEvent(e).stopPropagation();
	if(chatWindowManager && /chat|group|room|nquan/.test(opentype) ){
		var quan=chatWindowManager.getChatWindow(id, opentype);
		if(quan&&quan._isFlashLoadSuccess&&opentype=="nquan"){
			chatWindowManager.OnTBFocusWindow(id,opentype);
			if(quan._flash.navigateToModuleView)
			quan._flash.navigateToModuleView(activityid,activitytype);
		}else{
			Ntalker.variable.activityid=activityid;
			Ntalker.variable.activitytype=activitytype;
			im_openWebchatWindow(id, name, chatid, 1, opentype, 0, befrom);
			Ntalker.variable.activityid=Ntalker.variable.activitytype="";
		}
	}else if(opentype == 'application'){
		//打开应用
		IMToolBar.openApplicationWindow(id, 'sysMsgList');
	}
	if(msgid){
		var _V = Ntalker.variable;
		var desc="msgid_is_"+msgid;
		var siteurl=Ntalker.Config['services'] + "/func/statistic.php?siteid="+_V['siteid']+"&uid="+_V['user_id']+"&destid=0&groupid=0&type=20&mode=1&source=0&desc="+desc+"&from=sysMsgList&rnd="+new Date().getTime();
		__C.load({tagName:'img', href: siteurl});
	}
	if(IMToolBar&&IMToolBar.currentToolbarMode==2){
		IMToolBar.closeMessagebox();
	}
}
function fiM_RefuseRequest(destuid,chatid,chatsid){
	var impresenceflash = __$('impresenceflash');
	if(impresenceflash&&impresenceflash.hangupAVChat){
		impresenceflash.hangupAVChat(destuid,chatid,chatsid);
	}
}
function fIM_onPresenceReceiveSysMessage(msgtype,strMsg){
	var _M = strMsg, _Index = _M.indexOf('ntalker://'), _JSON;
	var _V = Ntalker.variable;
	if( _Index == -1 ){
		DEBUG('Not ntalker protocol standard news');
	}else{
		try{
			_Message = _M.substring(0, _Index);
			if(_M.substr(_Index+10).length>0){
				_JSON = __J.parseJSON(_M.substr(_Index+10));
			}else{
				var str='{"id":"","name":"","iconurl":"","opentype":"","activitytype":"","activityid":"","activityname":"","activityicon":"","profileurl":"","chatid":"","srcuid":"","msgtime":""}';
				_JSON = __J.parseJSON(str);
			}
			_Message = _Message ? _Message : _JSON.name;
			if(typeof(msgtype)!="string")msgtype=_JSON.msgtype;
			switch(msgtype)
			{
				case "nquan":
					IMToolBar.addSystemMessage(_JSON.id, _JSON.name, _Message, 0, _JSON.iconurl, '', 'alert', '','','nquan');
					break;
				case "group":
					break;
				case "notify":
				case "feed":
				case "application":
					if(msgtype!="feed"){
						//superuser推送消息统计
						//2010-12-4
						var desc="msgid_is_"+ ( _JSON.msgid ? _JSON.msgid : _JSON.id);
						var siteurl=Ntalker.Config['services'] + "/func/statistic.php?siteid="+_V['siteid']+"&uid="+_V['user_id']+"&destid=0&groupid="+(_JSON.id?_JSON.id:"")+"&type=13&mode=2&source=0&desc="+desc+"&from=sysMsgList&rnd="+new Date().getTime();
						__C.load({tagName:'img', href: siteurl});
					}
					IMToolBar.addMessageBox(_JSON.id?_JSON.id:"",_JSON.name?_JSON.name:"",_Message?_Message:"",_JSON.opentype?_JSON.opentype:"", _JSON.iconurl?_JSON.iconurl:"",msgtype?msgtype:"",_JSON.activitytype?_JSON.activitytype:"",_JSON.activityid?_JSON.activityid:"",_JSON.activityname?_JSON.activityname:"",_JSON.activityicon?_JSON.activityicon:"",_JSON.profileurl?_JSON.profileurl:"",_JSON.chatid?_JSON.chatid:"",_JSON.isRead?_JSON.isRead:false,_JSON.msgid?_JSON.msgid:'',_JSON.srcuid?_JSON.srcuid:"",_JSON.msgtime?_JSON.msgtime:(Date.parse(new Date())/1000),_JSON.chatsid?_JSON.chatsid:"" );
					break;
			}
		}catch(e){}
	}
}
function startGetMyIMStatus(imStatusUrl){
	var _V = Ntalker.variable;
	if(imStatusUrl && _V['user_id']){
		__C.load({src:imStatusUrl+"?query=onlinenum&sitid="+_V['siteid']+"&uid="+_V['user_id']+"&imsid="+_V['imsid']});
	}
}
Ntalker.PromptWindow = function(){
	this.isfocus = false;
	this.isprompting = false;
	this.timerID = null;
	this.promptMsg = null;
	this.promptMsg2 = null;
	this.originTitle = document.title;
	this.counter = 0;
	this.autostop = true; 
};
var _proWindow = Ntalker.PromptWindow.prototype;
_proWindow.init = function(){
	var self = this;
	function _handleFocus(e){
		self.handleFocus(e);
	}
	function _handleBlur(e){
		self.handleBlur(e);
	}
	if(__B.ie){
		document.attachEvent("onfocusin", _handleFocus);
		document.attachEvent("onfocusout", _handleBlur);
	}
	__E.addEvent(window, 'focus', _handleFocus);
	__E.addEvent(window, 'blur', _handleBlur);
};
_proWindow.dispose = function(){
};
_proWindow.handleFocus = function(e){
	this.isfocus = true;
	var presenceFlash = __$("impresenceflash");
	if(presenceFlash && presenceFlash.setPageFocus){
		try{
			presenceFlash.setPageFocus(true);
		}catch(e){}
	}
	if(this.autostop)
		this.stopPrompt();
};
_proWindow.handleBlur = function(e){
	var newvar = 1;
	this.isfocus = false;
	var presenceFlash = __$("impresenceflash");
	if(presenceFlash && presenceFlash.setPageFocus){
		try{
			presenceFlash.setPageFocus(false);
		}catch(e){}
	}
};
_proWindow.startPrompt = function(destnick, proMsg, autostop){
	if(this.isprompting || this.isfocus)
		return;
	if(proMsg && proMsg.length>0){
		this.promptMsg = sprintf(NtLang['promptTitle'], proMsg, "", this.originTitle);
		this.promptMsg2 = "";
		for(var i=0,l=Math.ceil(__S.len(proMsg)/2); i<l; i++){
		  this.promptMsg2+=NtLang.zhBlank;
		}
		this.promptMsg2 = sprintf(NtLang['promptTitle'], this.promptMsg2, "", this.originTitle);
	}
	var impresenceflash = document.getElementById('impresenceflash');
	if(impresenceflash && impresenceflash.playNotifySound){
		impresenceflash.playNotifySound();
	}
	if(autostop!=null)
		this.autostop = autostop;
	var self = this;
	var _changeWindowTitle = function(){ self.changeWindowTitle(); };
	this.timerID = setInterval(_changeWindowTitle, 800);
	this.isprompting = true;
};
_proWindow.changeWindowTitle = function(){
	this.counter++;
	if(this.counter%2==0)
	   document.title = this.promptMsg2;
	else
	   document.title = this.promptMsg;
	try{
		if(top!=self){
			if(this.counter%2==0)
				top.document.title = this.promptMsg2;
			else
				top.document.title = this.promptMsg;
		}
	}catch(e){}
};
_proWindow.stopPrompt = function(){
	if(!this.isprompting)
		return;
	window.clearInterval(this.timerID);
	this.timerID = null;
	this.counter = 0;
	document.title = this.originTitle;
	this.isprompting = false;
	try{
		if(top!=self) top.document.title = this.originTitle;
	}catch(e){}
};
(function(){
	if(typeof(promptwindow)=="undefined" || !promptwindow){
		promptwindow = new Ntalker.PromptWindow();
		promptwindow.init();
	}
	var path, scripts = window.document.getElementsByTagName("script"),src,mts;
	for(var i = 0; i<scripts.length; i++ ){
		src = scripts[i].getAttribute("src");
		mts = /(.*?)\/+imfunction(_utf8)?(_(.*?))?\.js/gi.exec(src);
		if( mts && mts[1] ){ path = mts[1];break;}
	}
	if( !path ) path = 'http://download.ntalker.com/res';
	Ntalker.variable.scriptPath = path;
	Ntalker.Config.publicDIR = path+"/images/";
	Ntalker.temp.ready = true;
})();
function fIM_OpenPostThreadWindow(str){
	var url="http://www.ntalker.com/postthread/?"+str;
	var width  = window.screen.width;
	var height = window.screen.height;
	var _Ht = [];
	_Ht.push('<html>');
	_Ht.push(	'<head>');
	_Ht.push(		'<title>\u53d1\u5e16</title>');
	_Ht.push(		'<script language="javascript" type="text/javascript">');
	_Ht.push(		'function maximizeWindow() {');
	_Ht.push(		'	if(window.top != window) return;');
	_Ht.push(		'	try{');
	_Ht.push(		'		var offset = (navigator.userAgent.indexOf("Mac") != -1 || navigator.userAgent.indexOf("Gecko") != -1 || navigator.appName.indexOf("Netscape") != -1) ? 0 : 4;');
	_Ht.push(		'		window.moveTo(-offset, -offset);');
	_Ht.push(		'		window.resizeTo(screen.availWidth + (2 * offset), screen.availHeight + (2 * offset));');
	_Ht.push(		'	}catch(e){}');
	_Ht.push(		'}');
	_Ht.push(		'</script>');
	_Ht.push(	'</head>');
	_Ht.push(	'<body style="margin:0;padding:0;" onload="maximizeWindow();">');
	_Ht.push(		'<iframe src="'+url+'" width="100%" height="100%">');
	_Ht.push(		'</iframe>');
	_Ht.push(	'</body>');
	_Ht.push('</html>');
	if(str.indexOf("bbs_tiexue")!=-1){
		window.open(url, "", "left=0, top=0, width="+width+",height="+height+",toolbar=no,directories=no,menubar=no,status=no,location=no,scrollbars=yes,resizable=no" );
		return;
	}
	var photoWallWindow = window.open('about:blank', "", "left=0, top=0, width="+width+",height="+height+",toolbar=no,directories=no,menubar=no,status=no,location=no,scrollbars=no,resizable=no" );
	try{
	var windowContent = photoWallWindow.document || photoWallWindow.contentWindow.document;
	}catch(e){}
	function writeHtml(){
	windowContent.charset = "utf-8";
	windowContent.write(_Ht.join(''));
	windowContent.close();
	photoWallWindow.focus();
}
	if( __B.mozilla ){
		writeHtml();
	}else{
		setTimeout(writeHtml(), 100);
	}
}
function fIM_openPhotoWallWindow(fileServer, siteId, roomId, selectFileName, viewSource){
	var flashvars, selectURL, swfUrl;
	var width, height, _Ht = [];;
	if( !fileServer ){
		return;
	}
	if( viewSource == 'nquan' && selectFileName ){
		siteId = selectFileName.split("_")[0] || siteId;
	}
	flashvars = 'feed=' + fileServer + '/imageupload.php%3Faction=rss%26siteid='+siteId+'%26roomid='+roomId;
	flashvars += '&style=light&numRows=3&showItemEmbed=false&showReflections=false&showNavArrows=true&showSearch=false&showDescription=false&showEmbed=false&backgroundColor=#000000';
	selectURL = fileServer + '/imageupload.php?action=index&siteid='+siteId+'&roomid='+roomId+'&indexfile=' + selectFileName;
	swfUrl = Ntalker.variable.scriptPath;
	swfUrl += '/fs/cooliris.swf';
	width  = window.screen.width;
	height = window.screen.height;
	_Ht.push('<html>');
	_Ht.push(	'<head>');
	_Ht.push(		'<title>' + NtLang['viewPhotoTitle'] + '</title>');
	_Ht.push(		'<script language="javascript" type="text/javascript">');
	_Ht.push(		'function maximizeWindow() {');
	_Ht.push(		'	if(window.top != window) return;');
	_Ht.push(		'	try{');
	_Ht.push(		'		var offset = (navigator.userAgent.indexOf("Mac") != -1 || navigator.userAgent.indexOf("Gecko") != -1 || navigator.appName.indexOf("Netscape") != -1) ? 0 : 4;');
	_Ht.push(		'		window.moveTo(-offset, -offset);');
	_Ht.push(		'		window.resizeTo(screen.availWidth + (2 * offset), screen.availHeight + (2 * offset));');
	_Ht.push(		'	}catch(e){}');
	_Ht.push(		'}');
	_Ht.push(		'</script>');
	_Ht.push(	'</head>');
	_Ht.push(	'<body style="margin:0;padding:0;" onload="maximizeWindow();">');
	_Ht.push(		'<object id="photoWall" width="100%" height="100%" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">');
	_Ht.push(		'<param name="movie" value="'+swfUrl+'" />');
	_Ht.push(		'<param name="allowFullScreen" value="true" />');
	_Ht.push(		'<param name="allowScriptAccess" value="always" />');
	_Ht.push(		'<param name="flashvars" value="'+flashvars+'" />');
	_Ht.push(		'<embed id="photoWall" src="'+swfUrl+'" flashvars="'+flashvars+'" width="100%" height="100%" type="application/x-shockwave-flash" allowFullScreen="true" allowScriptAccess="always"></embed>');
	_Ht.push(		'</object>');
	_Ht.push(		'<script type="text/javascript">');
	_Ht.push(			'setTimeout(function(){document.getElementById("photoWall").style.display = "block";}, 100);');
	_Ht.push(		'</script>');
	if( selectFileName ){
		_Ht.push(	'<script type="text/javascript" src="' + selectURL + '"></script>');
	}
	_Ht.push(	'</body>');
	_Ht.push('</html>');
	var photoWallWindow = window.open('about:blank', "", "left=0, top=0, width="+width+",height="+height+",toolbar=no,directories=no,menubar=no,status=no,location=no,scrollbars=no,resizable=no" );
	try{
		var windowContent = photoWallWindow.document || photoWallWindow.contentWindow.document;
	}catch(e){}
	function writeHtml(){
		windowContent.charset = "utf-8";
		windowContent.write(_Ht.join(''));
		windowContent.close();
		photoWallWindow.focus();
	}
	if( __B.mozilla ){
		writeHtml();
	}else{
		setTimeout(writeHtml(), 100);
	}
}
function fIM_OpenChatWindow(destuid, destname, myuid, myname, mysid, siteid, userparam, userinfo, type){
	setTimeout(function(){
		if( !im_openWebchatInPage ) return;
		var chatType = /^(group|room|nquan|chat)$/.test(type) ? type : 'chat';
		im_openWebchatInPage(destuid, destname, null, 1, chatType, 0, userinfo, 'buddyList');
	}, 10);
	return true;
}
function fIM_OpenIMWindow(source){
	if(im_myIMWindow){
		im_myIMWindow.showWindow();
	}
	return;
}
function fIM_OnGroupOpenChatWindow(destuid, destname, myuid, myname, mysid, siteid, userparam, chattype){
	setTimeout(function(){
		if( !im_openWebchatInPage ) return;
		im_openWebchatInPage(destuid, destname, null, 1, 'chat');
	}, 10);
	return true;
}
function fIM_OnGroupListOpenGroupWindow(groupid, groupname, myuid, myname, mysid, siteid, userparam, chattype, befrom){
	chattype = /^(nquan|room|group)$/.test(chattype) ? chattype : 'group';
	im_openWebchatWindow(groupid, groupname, null, 1, chattype);
}

function createIFrame(frameID, webChatID)
{
	Ntalker.Config.iframes[frameID] = frameID;
	var parentID = __$(webChatID) || document.getElementsByTagName("body")[0];
	if( __$(frameID) )
		return false;
	var newDiv = document.createElement("DIV");
	newDiv.id = frameID;
	newDiv.style.position = 'absolute';
	newDiv.style.backgroundColor = '#FFFFFF';
	newDiv.style.border = '0px';
	newDiv.style.overflow = 'auto';
	newDiv.style.display = 'none';
	if(parentID) parentID.appendChild(newDiv);
	window.onerror = function(){return true;};
	return true;
}
function moveIFrame(frameID, iframeID, x, y, w, h, objectID)
{
	try{
		var frameRef = document.getElementById(frameID); 
		var swfObject = document.getElementById(objectID); 
		frameRef.style.left = x + swfObject.offsetLeft + 'px';  
		frameRef.style.top = y + swfObject.offsetTop + 'px'; 
		frameRef.style.width = w + 'px'; 
		frameRef.style.height = h + 'px'; 
		var iFrameRef = document.getElementById(iframeID); 
		iFrameRef.width = w;
		iFrameRef.height = h;
		var loadRef = document.getElementById(iframeID + "Loading");
		if( loadRef ){
			loadRef.style.width = w + 'px';
			loadRef.style.height = h + 'px';
			loadRef.style.backgroundPosition = (w-32)/2 + 'px ' + (h-32)/2 + 'px';
		}
	}catch(e){}
}
function hideIFrame(frameID, iframeID)
{
	var iframeRef = document.getElementById(iframeID);
	var iframeDoc;
	if (iframeRef.contentWindow) {
		iframeDoc = iframeRef.contentWindow.document;
	} else if (iframeRef.contentDocument) {
		iframeDoc = iframeRef.contentDocument;
	} else if (iframeRef.document) {
		iframeDoc = iframeRef.document;
	}
	if (iframeDoc) {
		iframeDoc.body.style.display = 'none';
	}
	if (__$(frameID)) {
		__$(frameID).style.display = 'none';
	}
}
function showIFrame(frameID, iframeID)
{
	var iframeRef = document.getElementById(iframeID);
	if (__$(frameID)) {
		__$(frameID).style.display='block';
	}
	var iframeDoc;
	if (iframeRef.contentWindow) {
		iframeDoc = iframeRef.contentWindow.document;
	} else if (iframeRef.contentDocument) {
		iframeDoc = iframeRef.contentDocument;
	} else if (iframeRef.document) {
		iframeDoc = iframeRef.document;
	}
	if (iframeDoc) {
		iframeDoc.body.style.display='block';
	}
}
function hideDiv(frameID)
{
	if (__$(frameID)) {
		__$(frameID).style.display='none';
	}
}
function showDiv(frameID)
{
	if (__$(frameID)) {
		__$(frameID).style.display = 'block';
	}
}
function loadIFrame(frameID, iframeID, url, embedID, frameType){
	var frame= __$(frameID);
	var _C = Ntalker.Config;
	var loadId = iframeID + "Loading";
	if ( !frame ) return;
	var math = /\w+\.(swf|aspx|asp|jsp|php|htm|html|shtml)/ig.exec(url);
	var src, _Ht = [], iframe;
	if( __B.ie6&&frameType=='video' ){
		src = 'about:blank';
		_Ht.push("<iframe id='" + iframeID + "' src='"+src+"' name='"+iframeID+"' onLoad='"+embedID+"."+frameID+"_load();' frameborder='0' scrolling='no'></iframe>");
		iframe = __D.insert(frame, _Ht.join(''));
		var iFrameContent = iframe.contentWindow.document;
		iFrameContent.designMode = 'On';
		iFrameContent.contentEditable = true;
		iFrameContent.open();
		var _ht = [];
		_ht.push('<html>');
		_ht.push(	'<head>');
		_ht.push(	'</head>');
		_ht.push(	'<body marginwidth="0" marginheight="0">');
		_ht.push(		'<embed height="100%" width="100%" name="plugin" src="' + url + '" type="application/x-shockwave-flash">');
		_ht.push(	'</body>');
		_ht.push('</html>');
		iFrameContent.write(_ht.join(''));
		iFrameContent.close();
		iFrameContent.designMode = 'Off';
		iFrameContent.contentEditable = false;
	}else if( frameType=='video' ){
		src = url;
		_Ht.push("<iframe id='" + iframeID + "' src='"+src+"' name='"+iframeID+"' onLoad='"+embedID+"."+frameID+"_load();' frameborder='0' scrolling='no'></iframe>");
		iframe = __D.insert(frame, _Ht.join(''));
	}else{
		src = url;
		_Ht.push('<div id="' + loadId + '" style="display:none;background:url(' + _C['publicDIR'] + '/loading.gif) no-repeat center #FAFAFA;"></div>');
		_Ht.push("<iframe id='" + iframeID + "' style='display:block;' src='"+src+"' name='"+iframeID+"' onLoad='"+embedID+"."+frameID+"_load();' frameborder='0' scrolling='no'></iframe>");
		iframe = __D.insert(frame, _Ht.join(''));
	}
}
function reloadIFrame(frameID, iframeID, url, embedID){
	var frame= __$(frameID);
	var loadId = iframeID + "Loading";
	if ( !frame ) 
		return;
	var math = /\w+\.(swf|aspx|asp|jsp|php|htm|html|shtml)/ig.exec(url);
	if( __B.ie6&&math&&math[1]=='swf' ){
		return;
	}
	__$(iframeID).src = url;
	__D.css(__$(iframeID), 'display', 'none');
	__D.css(__$(loadId),   'display', 'block');
	__C.ready(__$(iframeID), function(){
		__D.css(__$(loadId),   'display', 'none');
		__D.css(__$(iframeID), 'display', 'block');
	});
}
function loadDivContent(frameID, iframeID, content)
{
	if (__$(frameID)) {
		__$(frameID).innerHTML = "<div id='"+iframeID+"' frameborder='0'>"+content+"</div>";
	}
}
function callIFrameFunction(iframeID, functionName, args)
{
	var iframeRef=document.getElementById(iframeID);
	var iframeDoc;
	if (iframeRef.contentDocument) {
		iframeDoc = iframeRef.contentDocument;
	} else if (iframeRef.contentWindow) {
		iframeDoc = iframeRef.contentWindow.document;
	} else if (iframeRef.document) {
		iframeDoc = iframeRef.document;
	}
	if (iframeDoc.wrappedJSObject != undefined) {
		iframeDoc = iframeDoc.wrappedJSObject;
	}
	return iframeDoc[functionName](args);
}
function removeIFrame(frameID)
{
	var iFrameDiv = document.getElementById(frameID);
	if ( __B.ie6 ){
		iframe = __$('iframe_' + frameID);
		var iFrameContent = iframe.contentWindow.document;
		iFrameContent.designMode = 'On';
		iFrameContent.contentEditable = true;
		iFrameContent.open();
		iFrameContent.write('');
		iFrameContent.close();
		iFrameContent.designMode = 'Off';
		iFrameContent.contentEditable = false;
		iFrameDiv.parentNode.removeChild(iFrameDiv);
	}
	else{
		iFrameDiv.parentNode.removeChild(iFrameDiv);
	}
}
function bringIFrameToFront(frameID)
{
	var frameRef=document.getElementById(frameID);
	if (oldFrame!=frameRef) {
		if (oldFrame) {
			oldFrame.style.zIndex="99";
		}
		frameRef.style.zIndex="100";
		oldFrame = frameRef;
	}
}
function askForEmbedObjectId(randomString)
{
	var embeds = document.getElementsByTagName('embed');
	for (var i = 0; i < embeds.length; i++) {
		try {
			var isTheGoodOne = embeds[i].checkObjectId(embeds[i].getAttribute('id'),randomString);
			if(isTheGoodOne) {
				return embeds[i].getAttribute('id');
			}
		}catch(e){}
	}
	var objects = document.getElementsByTagName('object');
	for(i = 0; i < objects.length; i++) {
		try{
			var isTheGoodOne = objects[i].checkObjectId(objects[i].getAttribute('id'),randomString);
			if(isTheGoodOne) {
				return objects[i].getAttribute('id');
			}
		} catch(e) {}
	}
	return null;
}
function getBrowserMeasuredWidth(objectID)
{
	return document.getElementById(objectID).offsetWidth;
}
function setupResizeEventListener(frameId)
{
	if(!frameId) return;
	var resizeTimeout = []; 
	__E.addEvent(window, "resize", function(e, frameId){
		window.clearTimeout(resizeTimeout[frameId]);
		resizeTimeout[frameId] = window.setTimeout(function(){
			 eval("document.getElementById('" + Ntalker.Config.iframes[frameId] + "')." + frameId + "_resize();");
		 }, 10);
	});
}
function printIFrame(iframeID)
{
	try
	{
		if (navigator.appName.indexOf('Microsoft') != -1)
		{
			document[iframeID].focus();
			document[iframeID].print();
		}
		else
		{
			for (var i=0; i < window.frames.length; i++)
			{
				if (window.frames[i].name == iframeID)
				{
					window.frames[i].focus();
					window.frames[i].print();
				}
			}
		}
	}
	catch(e){}
}
function historyBack(iframeID)
{
	frames[iframeID].history.go(-1);
}
function historyForward(iframeID)
{
	frames[iframeID].history.go(1);
}

var ntalker_swfobject=function(){var D="undefined",r="object",S="Shockwave Flash",W="ShockwaveFlash.ShockwaveFlash",q="application/x-shockwave-flash",R="SWFObjectExprInst",x="onreadystatechange",O=window,j=document,t=navigator,T=false,U=[h],o=[],N=[],I=[],l,Q,E,B,J=false,a=false,n,G,m=true,M=function(){var aa=typeof j.getElementById!=D&&typeof j.getElementsByTagName!=D&&typeof j.createElement!=D,ah=t.userAgent.toLowerCase(),Y=t.platform.toLowerCase(),ae=Y?/win/.test(Y):/win/.test(ah),ac=Y?/mac/.test(Y):/mac/.test(ah),af=/webkit/.test(ah)?parseFloat(ah.replace(/^.*webkit\/(\d+(\.\d+)?).*$/,"$1")):false,X=!+"\v1",ag=[0,0,0],ab=null;if(typeof t.plugins!=D&&typeof t.plugins[S]==r){ab=t.plugins[S].description;if(ab&&!(typeof t.mimeTypes!=D&&t.mimeTypes[q]&&!t.mimeTypes[q].enabledPlugin)){T=true;X=false;ab=ab.replace(/^.*\s+(\S+\s+\S+$)/,"$1");ag[0]=parseInt(ab.replace(/^(.*)\..*$/,"$1"),10);ag[1]=parseInt(ab.replace(/^.*\.(.*)\s.*$/,"$1"),10);ag[2]=/[a-zA-Z]/.test(ab)?parseInt(ab.replace(/^.*[a-zA-Z]+(.*)$/,"$1"),10):0}}else{if(typeof O.ActiveXObject!=D){try{var ad=new ActiveXObject(W);if(ad){ab=ad.GetVariable("$version");if(ab){X=true;ab=ab.split(" ")[1].split(",");ag=[parseInt(ab[0],10),parseInt(ab[1],10),parseInt(ab[2],10)]}}}catch(Z){}}}return{w3:aa,pv:ag,wk:af,ie:X,win:ae,mac:ac}}(),k=function(){if(!M.w3){return}if((typeof j.readyState!=D&&j.readyState=="complete")||(typeof j.readyState==D&&(j.getElementsByTagName("body")[0]||j.body))){f()}if(!J){if(typeof j.addEventListener!=D){j.addEventListener("DOMContentLoaded",f,false)}if(M.ie&&M.win){j.attachEvent(x,function(){if(j.readyState=="complete"){j.detachEvent(x,arguments.callee);f()}});if(O==top){(function(){if(J){return}try{j.documentElement.doScroll("left")}catch(X){setTimeout(arguments.callee,0);return}f()})()}}if(M.wk){(function(){if(J){return}if(!/loaded|complete/.test(j.readyState)){setTimeout(arguments.callee,0);return}f()})()}s(f)}}();function f(){if(J){return}try{var Z=j.getElementsByTagName("body")[0].appendChild(C("span"));Z.parentNode.removeChild(Z)}catch(aa){return}J=true;var X=U.length;for(var Y=0;Y<X;Y++){U[Y]()}}function K(X){if(J){X()}else{U[U.length]=X}}function s(Y){if(typeof O.addEventListener!=D){O.addEventListener("load",Y,false)}else{if(typeof j.addEventListener!=D){j.addEventListener("load",Y,false)}else{if(typeof O.attachEvent!=D){i(O,"onload",Y)}else{if(typeof O.onload=="function"){var X=O.onload;O.onload=function(){X();Y()}}else{O.onload=Y}}}}}function h(){if(T){V()}else{H()}}function V(){var X=j.getElementsByTagName("body")[0];var aa=C(r);aa.setAttribute("type",q);var Z=X.appendChild(aa);if(Z){var Y=0;(function(){if(typeof Z.GetVariable!=D){var ab=Z.GetVariable("$version");if(ab){ab=ab.split(" ")[1].split(",");M.pv=[parseInt(ab[0],10),parseInt(ab[1],10),parseInt(ab[2],10)]}}else{if(Y<10){Y++;setTimeout(arguments.callee,10);return}}X.removeChild(aa);Z=null;H()})()}else{H()}}function H(){var ag=o.length;if(ag>0){for(var af=0;af<ag;af++){var Y=o[af].id;var ab=o[af].callbackFn;var aa={success:false,id:Y};if(M.pv[0]>0){var ae=c(Y);if(ae){if(F(o[af].swfVersion)&&!(M.wk&&M.wk<312)){w(Y,true);if(ab){aa.success=true;aa.ref=z(Y);ab(aa)}}else{if(o[af].expressInstall&&A()){var ai={};ai.data=o[af].expressInstall;ai.width=ae.getAttribute("width")||"0";ai.height=ae.getAttribute("height")||"0";if(ae.getAttribute("class")){ai.styleclass=ae.getAttribute("class")}if(ae.getAttribute("align")){ai.align=ae.getAttribute("align")}var ah={};var X=ae.getElementsByTagName("param");var ac=X.length;for(var ad=0;ad<ac;ad++){if(X[ad].getAttribute("name").toLowerCase()!="movie"){ah[X[ad].getAttribute("name")]=X[ad].getAttribute("value")}}P(ai,ah,Y,ab)}else{p(ae);if(ab){ab(aa)}}}}}else{w(Y,true);if(ab){var Z=z(Y);if(Z&&typeof Z.SetVariable!=D){aa.success=true;aa.ref=Z}ab(aa)}}}}}function z(aa){var X=null;var Y=c(aa);if(Y&&Y.nodeName=="OBJECT"){if(typeof Y.SetVariable!=D){X=Y}else{var Z=Y.getElementsByTagName(r)[0];if(Z){X=Z}}}return X}function A(){return !a&&F("6.0.65")&&(M.win||M.mac)&&!(M.wk&&M.wk<312)}function P(aa,ab,X,Z){a=true;E=Z||null;B={success:false,id:X};var ae=c(X);if(ae){if(ae.nodeName=="OBJECT"){l=g(ae);Q=null}else{l=ae;Q=X}aa.id=R;if(typeof aa.width==D||(!/%$/.test(aa.width)&&parseInt(aa.width,10)<310)){aa.width="310"}if(typeof aa.height==D||(!/%$/.test(aa.height)&&parseInt(aa.height,10)<137)){aa.height="137"}j.title=j.title.slice(0,47)+" - Flash Player Installation";var ad=M.ie&&M.win?"ActiveX":"PlugIn",ac="MMredirectURL="+O.location.toString().replace(/&/g,"%26")+"&MMplayerType="+ad+"&MMdoctitle="+j.title;if(typeof ab.flashvars!=D){ab.flashvars+="&"+ac}else{ab.flashvars=ac}if(M.ie&&M.win&&ae.readyState!=4){var Y=C("div");X+="SWFObjectNew";Y.setAttribute("id",X);ae.parentNode.insertBefore(Y,ae);ae.style.display="none";(function(){if(ae.readyState==4){ae.parentNode.removeChild(ae)}else{setTimeout(arguments.callee,10)}})()}u(aa,ab,X)}}function p(Y){if(M.ie&&M.win&&Y.readyState!=4){var X=C("div");Y.parentNode.insertBefore(X,Y);X.parentNode.replaceChild(g(Y),X);Y.style.display="none";(function(){if(Y.readyState==4){Y.parentNode.removeChild(Y)}else{setTimeout(arguments.callee,10)}})()}else{Y.parentNode.replaceChild(g(Y),Y)}}function g(ab){var aa=C("div");if(M.win&&M.ie){aa.innerHTML=ab.innerHTML}else{var Y=ab.getElementsByTagName(r)[0];if(Y){var ad=Y.childNodes;if(ad){var X=ad.length;for(var Z=0;Z<X;Z++){if(!(ad[Z].nodeType==1&&ad[Z].nodeName=="PARAM")&&!(ad[Z].nodeType==8)){aa.appendChild(ad[Z].cloneNode(true))}}}}}return aa}function u(ai,ag,Y){var X,aa=c(Y);if(M.wk&&M.wk<312){return X}if(aa){if(typeof ai.id==D){ai.id=Y}if(M.ie&&M.win){var ah="";for(var ae in ai){if(ai[ae]!=Object.prototype[ae]){if(ae.toLowerCase()=="data"){ag.movie=ai[ae]}else{if(ae.toLowerCase()=="styleclass"){ah+=' class="'+ai[ae]+'"'}else{if(ae.toLowerCase()!="classid"){ah+=" "+ae+'="'+ai[ae]+'"'}}}}}var af="";for(var ad in ag){if(ag[ad]!=Object.prototype[ad]){af+='<param name="'+ad+'" value="'+ag[ad]+'" />'}}aa.outerHTML='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'+ah+">"+af+"</object>";N[N.length]=ai.id;X=c(ai.id)}else{var Z=C(r);Z.setAttribute("type",q);for(var ac in ai){if(ai[ac]!=Object.prototype[ac]){if(ac.toLowerCase()=="styleclass"){Z.setAttribute("class",ai[ac])}else{if(ac.toLowerCase()!="classid"){Z.setAttribute(ac,ai[ac])}}}}for(var ab in ag){if(ag[ab]!=Object.prototype[ab]&&ab.toLowerCase()!="movie"){e(Z,ab,ag[ab])}}aa.parentNode.replaceChild(Z,aa);X=Z}}return X}function e(Z,X,Y){var aa=C("param");aa.setAttribute("name",X);aa.setAttribute("value",Y);Z.appendChild(aa)}function y(Y){var X=c(Y);if(X&&X.nodeName=="OBJECT"){if(M.ie&&M.win){X.style.display="none";(function(){if(X.readyState==4){b(Y)}else{setTimeout(arguments.callee,10)}})()}else{X.parentNode.removeChild(X)}}}function b(Z){var Y=c(Z);if(Y){for(var X in Y){if(typeof Y[X]=="function"){Y[X]=null}}Y.parentNode.removeChild(Y)}}function c(Z){var X=null;try{X=j.getElementById(Z)}catch(Y){}return X}function C(X){return j.createElement(X)}function i(Z,X,Y){Z.attachEvent(X,Y);I[I.length]=[Z,X,Y]}function F(Z){var Y=M.pv,X=Z.split(".");X[0]=parseInt(X[0],10);X[1]=parseInt(X[1],10)||0;X[2]=parseInt(X[2],10)||0;return(Y[0]>X[0]||(Y[0]==X[0]&&Y[1]>X[1])||(Y[0]==X[0]&&Y[1]==X[1]&&Y[2]>=X[2]))?true:false}function v(ac,Y,ad,ab){if(M.ie&&M.mac){return}var aa=j.getElementsByTagName("head")[0];if(!aa){return}var X=(ad&&typeof ad=="string")?ad:"screen";if(ab){n=null;G=null}if(!n||G!=X){var Z=C("style");Z.setAttribute("type","text/css");Z.setAttribute("media",X);n=aa.appendChild(Z);if(M.ie&&M.win&&typeof j.styleSheets!=D&&j.styleSheets.length>0){n=j.styleSheets[j.styleSheets.length-1]}G=X}if(M.ie&&M.win){if(n&&typeof n.addRule==r){n.addRule(ac,Y)}}else{if(n&&typeof j.createTextNode!=D){n.appendChild(j.createTextNode(ac+" {"+Y+"}"))}}}function w(Z,X){if(!m){return}var Y=X?"visible":"hidden";if(J&&c(Z)){c(Z).style.visibility=Y}else{v("#"+Z,"visibility:"+Y)}}function L(Y){var Z=/[\\\"<>\.;]/;var X=Z.exec(Y)!=null;return X&&typeof encodeURIComponent!=D?encodeURIComponent(Y):Y}var d=function(){if(M.ie&&M.win){window.attachEvent("onunload",function(){var ac=I.length;for(var ab=0;ab<ac;ab++){I[ab][0].detachEvent(I[ab][1],I[ab][2])}var Z=N.length;for(var aa=0;aa<Z;aa++){y(N[aa])}for(var Y in M){M[Y]=null}M=null;for(var X in ntalker_swfobject){ntalker_swfobject[X]=null}ntalker_swfobject=null})}}();return{registerObject:function(ab,X,aa,Z){if(M.w3&&ab&&X){var Y={};Y.id=ab;Y.swfVersion=X;Y.expressInstall=aa;Y.callbackFn=Z;o[o.length]=Y;w(ab,false)}else{if(Z){Z({success:false,id:ab})}}},getObjectById:function(X){if(M.w3){return z(X)}},embedSWF:function(ab,ah,ae,ag,Y,aa,Z,ad,af,ac){var X={success:false,id:ah};if(M.w3&&!(M.wk&&M.wk<312)&&ab&&ah&&ae&&ag&&Y){w(ah,false);K(function(){ae+="";ag+="";var aj={};if(af&&typeof af===r){for(var al in af){aj[al]=af[al]}}aj.data=ab;aj.width=ae;aj.height=ag;var am={};if(ad&&typeof ad===r){for(var ak in ad){am[ak]=ad[ak]}}if(Z&&typeof Z===r){for(var ai in Z){if(typeof am.flashvars!=D){am.flashvars+="&"+ai+"="+Z[ai]}else{am.flashvars=ai+"="+Z[ai]}}}if(F(Y)){var an=u(aj,am,ah);if(aj.id==ah){w(ah,true)}X.success=true;X.ref=an}else{if(aa&&A()){aj.data=aa;P(aj,am,ah,ac);return}else{w(ah,true)}}if(ac){ac(X)}})}else{if(ac){ac(X)}}},switchOffAutoHideShow:function(){m=false},ua:M,getFlashPlayerVersion:function(){return{major:M.pv[0],minor:M.pv[1],release:M.pv[2]}},hasFlashPlayerVersion:F,createSWF:function(Z,Y,X){if(M.w3){return u(Z,Y,X)}else{return undefined}},showExpressInstall:function(Z,aa,X,Y){if(M.w3&&A()){P(Z,aa,X,Y)}},removeSWF:function(X){if(M.w3){y(X)}},createCSS:function(aa,Z,Y,X){if(M.w3){v(aa,Z,Y,X)}},addDomLoadEvent:K,addLoadEvent:s,getQueryParamValue:function(aa){var Z=j.location.search||j.location.hash;if(Z){if(/\?/.test(Z)){Z=Z.split("?")[1]}if(aa==null){return L(Z)}var Y=Z.split("&");for(var X=0;X<Y.length;X++){if(Y[X].substring(0,Y[X].indexOf("="))==aa){return L(Y[X].substring((Y[X].indexOf("=")+1)))}}}return""},expressInstallCallback:function(){if(a){var X=c(R);if(X&&l){X.parentNode.replaceChild(l,X);if(Q){w(Q,true);if(M.ie&&M.win){l.style.display="block"}}if(E){E(B)}}a=false}}}}();
var im_flashVersion = ntalker_swfobject.getFlashPlayerVersion().major;
var im_installFlashActionX = im_flashVersion<9 ? true : false;
