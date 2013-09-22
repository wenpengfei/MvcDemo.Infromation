//Syntax Error:在线webservice压缩js时发生错误.
//mingdian.js
function admouse(ul, num) {
    var list = ul.getElementsByTagName("li");
    if (num == 0) {
        list[0].style.display = "block";
        list[1].style.display = "none";
    } else {
        list[1].style.display = "block";
        list[0].style.display = "none";
    }
}
function admousedown(ul) {
    var list = ul.getElementsByTagName("a");
    var newwindow = window.open(list[0].href, name, 'height=768,width=1024,resizable=yes,scrollbars=yes,toolbar=yes,status=yes,menubar=yes,location=yes');
    if (window.focus)
        newwindow.focus();
}
$(function () {

    //推广图标的控制
    if ($("#icon_1 span.tui") != null) {
        try {
            if ((typeof (isopen) == "undefined" || !isopen) && $("#icon_1 span.tui").length > 0 && $("#icon_1 span.tui").html() == "推广")
                $("#icon_1 span.tui")[0].style.display = "none";
        } catch (e) { }
    }
//    if ($("#top_google_ad").length > 0 && $("#top_google_ad").html() == '')
//        $("#top_google_ad").css("display", "none");
//    if ($("#bottom_google_ad").length > 0 && $("#bottom_google_ad").html() == '')
//        $("#bottom_google_ad").css("display", "none");
});

function mdshow() {
    for (var i = 1; i < 10; i++) {//循环有内容的名店显示
        var mingdian = $("#md" + i);
        if (mingdian.length > 0 && mingdian.find("a").length > 0) {
            $("#adtop_1")[0].className = 'cb';
            $(".mdul").find("li").hover(
                    function () {
                        $(this).addClass("focus");
                    },
                    function () {
                        $(this).removeClass("focus");
                    }
                ); //鼠标焦点效果
            //判断默认广告是否会造成换行
            var mdul = document.getElementById("adtop_1");
            var mdulcont = mdul.getElementsByTagName("li").length;
            if (mdulcont % 5 == 1 && document.getElementById("adtel"))
                document.getElementById("adtel").style.display = "none";
            ////判断默认广告是否会造成换行
        } else
            mingdian.addClass("hc");
    }
}
//$(function () {
//    window.md5_html = '';
//    if (typeof (ad_json) != "undefined") {
//        if (ad_json.topyplistad && document.getElementById("top_google_ad")) {
//            //document.getElementById("top_google_ad").innerHTML = '';
//            for (var i = 0; i < ad_json.topyplistad.length; i++) {
//                document.getElementById("top_google_ad").innerHTML += ad_json.topyplistad[i].AD;
//            }            
//        }
//        if (ad_json.bottomyplistad && document.getElementById("bottom_google_ad")) {
//            for (var i = 0; i < ad_json.bottomyplistad.length; i++) {
//                document.getElementById("bottom_google_ad").innerHTML += ad_json.bottomyplistad[i].AD;
//            }
//        }
//        if (ad_json.recommendad && document.getElementById("ad19")) {
//            var len = ad_json.recommendad.length;
//            for (var i = 0; i < len; i++) {
//                document.getElementById("ad19").innerHTML += ad_json.recommendad[i].AD;
//            }
//            if (len > 0) {
//                
//                var left = document.getElementById('infolist'),
//                    right = document.getElementById('rightframe');
//                if (left && right) {
//                    $(left).addClass('cleft');
//                    $(right).addClass('cright');
//                }
//            }
//        }
//        if (ad_json.toprcmdad) {
//            var len = ad_json.toprcmdad.length;
//            for (var i = 0; i < len; i++) {
//                md5_html += ad_json.toprcmdad[i].AD;
//            }
//        }
//    }
//    if ($("#md5").length > 0) {
//        $("#md5")[0].innerHTML = md5_html;
//        var pw = pw || 0;
//        if (pw == 237) $("#md5").addClass("wider");

//    }

//    mdshow();
//    //手机下载弹窗

//    if (typeof (newdiv) == "undefined") {
//        newdiv = document.createElement("div"), contentdiv = document.createElement("div");
//        newdiv.onclick = function () { closeopendiv(); };
//    }

//    //推广图标的控制

//    if ((typeof (isopen) == "undefined" || !isopen) && $("#icon_1 span.tui").length > 0 && $("#icon_1 span.tui").html() == "推广")
//        $("#icon_1 span.tui")[0].style.display = "none";
//    if ($("#top_google_ad").length > 0 && $("#top_google_ad").html() == '')
//        $("#top_google_ad").css("display", "none");
//    else $("#top_google_ad").css("display", "block");
//    if ($("#bottom_google_ad").length > 0 && $("#bottom_google_ad").html() == '')
//        $("#bottom_google_ad").css("display", "none");
//});

//offset.js
﻿/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/util/offset.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/3/25
 * Update Log:
 *  2011-03-25 移植新版本
 */
(function(global, DOC, undefined){
	boot.declare('util.offset', 'dom', function(Namespace, Frame, dom){
		Namespace.offset = {
			/**
			 * 设置滚动条的位置
			 * 参数可选类型：
			 * 1,当参数为空时，不移动该轴滚动条
			 * 2,当参数为指定数字时，移动该轴滚动条至指定位置
			 * 3,当参数为+1或者-1时，移动该轴滚动条至相对位置
			 * @param {Object} x x轴滚动条的移动参数
			 * @param {Object} y y轴滚动条的移动参数
			 */
			scroll: function(x, y){
				if (Frame.isEmpty(x)) x = "";
				if (Frame.isEmpty(y)) y = "";
				x = x + "", y = y + "";
				var ix, iy, ox = this.getScrollLeft(), oy = this.getScrollTop();
				if (Frame.isEmpty(x)) ix = ox;
				else 
					if (x.substring(0, 1) == "+") 
						ix = ox + parseInt(x.substring(1));
					else 
						if (x.substring(0, 1) == "-") 
							ix = ox - parseInt(x.substring(1));
						else 
							ix = parseInt(x);
				if (Frame.isEmpty(y)) iy = oy;
				else 
					if (y.substring(0, 1) == "+") 
						iy = oy + parseInt(y.substring(1));
					else 
						if (y.substring(0, 1) == "-") 
							iy = oy - parseInt(y.substring(1));
						else 
							iy = parseInt(y);
				
				this.setScrollLeft(ix);
				this.setScrollTop(iy);
			},
			/**
			 * 获取页面可滚动宽度
			 * @return {Int} 
			 */
			getScrollWidth: function(){
				return Math.max(document.documentElement.scrollWidth, document.body.scrollWidth);
			},
			/**
			 * 获取页面可滚动高度
			 * @return {Int}
			 */
			getScrollHeight: function(){
				return Math.max(document.documentElement.scrollHeight, document.body.scrollHeight);
			},
			/**
			 * 获取页面的可视宽度
			 */
			getClientWidth : function(){
				return DOC.documentElement.clientWidth == 0 ? 
					DOC.body.clientWidth : 
					Math.min(DOC.body.clientWidth, DOC.documentElement.clientWidth);
			},
			/**
			 * 获取页面的可视高度
			 */
			getClientHeight : function(){
				return DOC.documentElement.clientHeight == 0 ? 
					DOC.body.clientHeight : 
					Math.min(DOC.body.clientHeight, DOC.documentElement.clientHeight);
			},			
			/**
			 * 获取滚动条当前x轴位置
			 * @return {Int}
			 */
			getScrollLeft: function(){
				return document.documentElement.scrollLeft + document.body.scrollLeft;
			},
			/**
			 * 获取滚动条当前y轴位置
			 * @return {Int}
			 */
			getScrollTop: function(){
				return document.documentElement.scrollTop + document.body.scrollTop;
			},
			/**
			 * 设置滚动条的x轴位置
			 * @param {Object} l x轴位置参数
			 */
			setScrollLeft: function(l){
				document.documentElement.scrollLeft = l;
				document.body.scrollLeft = l;
			},
			/**
			 * 设置滚动条的y轴位置
			 * @param {Object} t y轴位置参数
			 */
			setScrollTop: function(t){
				document.documentElement.scrollTop = t;
				document.body.scrollTop = t;
			},
			/**
			 * 获取元素的实际位置
			 * @param {HTMLElement} e 元素
			 * @return {Object} 元素的位置
			 * {
			 * 	x : left,
			 * 	y : top
			 * }
			 */
			getXY: function(el){
				var element = dom.get(el);
				if (!element) return null;
				var left = 0,
					top = 0;
				while (element.offsetParent) {
					left += element.offsetLeft + (element.currentStyle ? (parseInt(element.currentStyle.borderLeftWidth)) || 0 : 0);
					top += element.offsetTop + (element.currentStyle ? (parseInt(element.currentStyle.borderTopWidth)) || 0 : 0);
					element = element.offsetParent;
				}
				left += element.offsetLeft + (element.currentStyle ? (parseInt(element.currentStyle.borderLeftWidth)) || 0 : 0);
				top += element.offsetTop + (element.currentStyle ? (parseInt(element.currentStyle.borderTopWidth)) || 0 : 0);
				return {
					x: left,
					y: top
				};
			},
			/**
			 * 获取元素的实际尺寸
			 * @param {HTMLElement} el 元素
			 * @return {Object} 元素的尺寸
			 * {
			 * 	height : height,
			 * 	width : width
			 * }
			 */
			getHW: function(el){
				var element = dom.get(el);
				if (!element) return null;
				return {
					height: element.offsetHeight,
					width: element.offsetWidth
				};
			},
			/**
			 * 获取元素的区域信息
			 * @param {HTMLELement} el 元素
			 * @params {Object} 元素的区域信息
			 * {
			 * 	top : top,
			 *  bottom : bottom,
			 *  left : left,
			 *  right : right,
			 *  width : width,
			 *  height : height
			 * }
			 */
			getRect: function(el){
				var element = dom.get(el);
				if (!element) return null;
				var xy = this.getXY(element);
				var hw = this.getHW(element);
				return {
					top: xy.y,
					bottom: xy.y + hw.height,
					left: xy.x,
					right: xy.x + hw.width,
					height : hw.height,
					width : hw.width
				};
			},
			/**
			 * 在指定的容器下，查找指定位置的元素
			 * @param {HTMLElement} p 容器
			 * @param {Int} x x坐标
			 * @param {Int} y y坐标
			 * @return {Object} 指定位置的元素
			 * {
			 * 	target : {HTMLELement},
			 *  point : {String} L/R + T/B
			 * } 
			 */
			getEl: function(p, x, y){
				var cns = p.children, cnrs = [];
				var c = null;
				for (var i = 0; i < cns.length; i++) {
					var rect = this.getRect(cns[i]);
					var diffX = Math.abs(rect.left - x) < Math.abs(rect.right - x) ? Math.abs(rect.left - x) : Math.abs(rect.right - x);
					var diffY = Math.abs(rect.top - y) < Math.abs(rect.bottom - y) ? Math.abs(rect.top - y) : Math.abs(rect.bottom - y);
					cnrs.push({
						rect: rect,
						target: cns[i],
						diffX: diffX,
						diffY: diffY,
						diff: diffX + diffY
					});
					if (rect.top <= y && y <= rect.bottom && rect.left <= x && x <= rect.right) {
						c = cnrs[i];
						break;
					}
				}
				if (!c) {
					var minDiff = cnrs[0];
					for (var i = 1; i < cnrs.length; i++) {
						if (cnrs[i].diff < minDiff.diff) {
							minDiff = cnrs[i];
						}
					}
					c = minDiff;
				}
				if (!c) {
					return null;
				}
				else {
					return {
						target: c.target,
						point: (x < (c.rect.left + c.rect.right) / 2 ? 'L' : 'R') + (y < (c.rect.top + c.rect.bottom) / 2 ? 'T' : 'B')
					};
				}
			}
		};
	});
})(this, this.document);

//box.js
﻿/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/widgets/box.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/3/25
 * Update Log:
 *  2011-03-25 移植新版本
 *  2011年4月21日
 */
(function(global, DOC, undefined){
	boot.declare('widgets.box', 'observable,dom,event', function(Namespace, Frame, observable, dom, event){
		Namespace.box = function(config){
			Frame.apply(this, config);
			this.init();
			Namespace.box.superclass.constructor.call(this);
		};
		
		Frame.extend(Namespace.box, observable, {
		
			id: null,
			rendered: false,
			hidden: true,
			disabled: false,
			
			container: null,
			
			title: "",
			
			__statuslist: [],
			status: null,
			
			el : null,
			items : null,
			
			init: function(){
				this.status = {};
				//        fe.cache(this, this.getId());
				
				this.getId();
				
				this.__extendFn("render");
				this.__extendFn("show");
				this.__extendFn("hide");
				this.__extendFn("enable");
				this.__extendFn("disable");
				this.__extendFn("destory");
				
				this.items = {};
			},
			
			__extendFn: function(fn){
				if (typeof(fn) != "string" || Frame.isEmpty(fn)) 
					return false;
				fn = fn.toLowerCase();
				var camelCase = fn.substring(0, 1).toUpperCase() + fn.substring(1).toLowerCase();
				
				var beforeEvent = 'onbefore' + fn;
				var onEvent = 'on' + fn;
				this.addEvents(beforeEvent, onEvent);
				
				var beforeFn = 'before' + camelCase;
				var Fn = fn;
				var onFn = 'on' + fn;
				var obj = {};
				obj[beforeFn] = Frame.emptyFn;
				obj[Fn] = Frame.emptyFn;
				obj[onFn] = Frame.emptyFn;
				Frame.applyIf(this, obj);
			},
			
			__initStatus: function(sn, v){
			
			},
			getStatus: function(sn){
			
			},
			setStatus: function(sn, v){
			
			},
			getId: function (qualifier) {
		        if (qualifier) {
		            return this.getId().replace(/(\-\d+$)/, '-' + qualifier + '$1');
		        } else {
		            return this.id || (this.id = Frame.id("comp-"));
		        }
		    },
			
			render: function(container, position){
				
				if (!this.rendered && this.fireEvent("beforerender", this) !== false) {
					if (this.beforeRender) 
						this.beforeRender();
					this.rendered = true;
					//            head, bwrap, tbar, bbar, footer, mask
					
					
					this.onRender(this.container, position || null);
					this.fireEvent("render", this);
					if (this.hidden) {
						this.hide();
					}
					if (this.disabled) {
						this.disable();
					}
				}
				return this;
			},
			destory: function(){
				if (!this.rendered && this.fireEvent("beforedestory", this) !== false) {
					if (this.beforeDestory) 
						this.beforeDestory();
					this.onDestory();
					this.fireEvent("destory", this);
				}
				return this;
			},
			onDestory: function(){
				if (this.rendered) {
					event.un(this.el, "");
					dom.remove(this.el);
				}
				this.purgeListeners();
			},
			show: function () {
				if (!this.rendered) {
					this.render();
				}
		        if (this.fireEvent("beforeshow", this) !== false) {
		            if (this.beforeShow) this.beforeShow();
		            if (this.rendered) {
		                this.onShow();
		                this.hidden = false;
		                this.fireEvent("show", this);
		            }
		        }
		        return this;
		    },
			onShow: function(){
				dom.show(this.el);
			},
			hide: function(){
				if (this.fireEvent("beforehide", this) !== false) {
					if (this.beforeHide) 
						this.beforeHide();
					if (this.rendered) {
						this.onHide();
						this.hidden = true;
						this.fireEvent("hide", this);
					}
				}
				return this;
			},
			onHide: function(){
				dom.hide(this.el);
			},
			isHidden: function(){
				return this.hidden === true;
			},			
			enable: function(){
				if (this.fireEvent("beforeenable", this) !== false) {
					if (this.beforeEnable) 
						this.beforeEnable();
					if (!this.disabled) {
						this.onEnable();
						this.disabled = false;
						this.fireEvent("enable", this);
					}
				}
				return this;
			},
			onEnable: function(){
				dom.enable(this.el);
			},
			disable: function(){
				if (this.fireEvent("beforedisable", this) !== false) {
					if (this.beforeDisable) 
						this.beforeDisable();
					if (this.disabled) {
						this.onDisable();
						this.disabled = true;
						this.fireEvent("disable", this);
					}
				}
				return this;
			},
			onDisable: function(){
				dom.disable(this.el);
			}
		});
	});
})(this, this.document);

//window.js
﻿(function(global, DOC, undefined) {
    boot.declare('widgets.window', 'dom,event,business.user, extension.string,widgets.box', 
    function(Namespace, Frame, dom, event, user, string, box) {
        var win = Namespace.window = function(title, url, width, height, closeable) {
            this.title = title;
            this.width = width;
            this.height = height;
            this.url = url;
            this.closeable = !!closeable;
            win.superclass.constructor.call(this)
        };
        win.__win = null;
        win.getInstance = function() {
            if (Frame.isEmpty(this.__win)) {
                this.__win = new fe.widgets.window("", "", 300, 200, true);
            }
            return this.__win;
        };
        Frame.extend(win, box, {
            id: 'fe_window_' + Frame.id(),
            title: null,
            url: null,
            width: 400,
            minWidth: 300,
            height: 200,
            minHeight: 200,
            top: 0,
            left: 0,
            closeable: true,
            mask: null,
            form: null,
            _topheight: 26,
            _bottomheight: 0,
            _framepadding: 8,
            _containsarea: null,
            _frame: null,
            _toparea: null,
            _titleid: null,
            _iframeareaid: null,
            _loadarea: null,
            _bottomarea: null,
            _cssform: 'display:none;left:50%;margin:-{0}px 0px 0px -{1}px;' + (Frame.isIE6 ? 'top:expression((document.documentElement.scrollTop || document.body.scrollTop) + Math.round(50 * (document.documentElement.offsetHeight || document.body.clientHeight) / 100));': 'top:45%;'),
            init: function() {
                win.superclass.init.call(this);
            },
            createMask: function() {
                var self = this,
	                mask = dom.create('div', {
	                    style: Frame.isIE ? "display:none;position:absolute;width:" + screen.width + "px;height:" + screen.height + "px;": "display:none;position:fixed;width:" + screen.width + "px;height:" + screen.height + "px;",
	                    className: 'fe_window_mask'
	                }),
	                maskIframe = dom.create('IFRAME');
                maskIframe.style.backgroundColor = '#000000';
                maskIframe.style.width = '100%';
                maskIframe.style.height = '100%';
                maskIframe.style.filter = 'Alpha(Opacity=0)';
                maskIframe.style.opacity = 0;
                mask.appendChild(maskIframe);
                document.body.appendChild(mask);
                Frame.apply(self, {
                    mask: mask,
                    maskIframe: maskIframe
                });
            },
            createForm: function() {
                var self = this,
	                form = dom.create('div', {
	                    id: self.id + '_form',
	                    className: "fe_window",
	                    style: string.format(self._cssform, self.height / 2, self.width / 2)
	                }),
	                _outerarea = dom.create("div", {
	                    id: self.id + '_outer',
	                    className: "outer"
	                }),
	                _frame = dom.create("div", {
	                    style: string.format("width: {0}px; height: {1}px; padding: {2}px; ", self.width, self.height, self._framepadding),
	                    className: 'frame'
	                }),
	                _toparea,
	                _title,
	                _closebtn;
                if (self._topheight) {
                    _toparea = document.createElement("DIV");
                    _toparea.className = "topbar";
                    _toparea.style.cssText = string.format("height:{0}px;", self._topheight);
                    self._titleid = self.id + "_title";
                    _title = dom.create("span", {
                        id: self._titleid,
                        className: 'title',
                        html: self.title || ""
                    });
                    _closebtn = dom.create('a', {
                        id: self.id + '_closebtn',
						target : '_self',
                        className: 'closebtn',
                        href: 'javascript:void(0);',
						listeners : {
							click : function(){
								self.hide();
							}
						}
                    });
                    if (!self.closeable) {
                        _closebtn.style.display = 'none';
                    }
                }
                var _containsarea = dom.create('div', {
                    style: string.format("width: {0}px; height:{1}px; top: {2}px; left: {2}px; ", self.width - 30, self.height, self._framepadding),
                    className: 'contains'
                });
                var _loadarea = dom.create('div', {
                    className: 'load',
                    style: string.format("display:block;height:{0}px;background:zhaopin_files/loading.gif;z-index:9998;", self.height - self._topheight - self._bottomheight),
                    html: '加载中...'
                });
                var loadAction = self.id + "_loadAction";
                window[loadAction] = function() {
                    var _iframearea = dom.get(self._iframeareaid);
                    try {
                        _iframearea.style.cssText = string.format("height:{0}px;width:100%;", self.minHeight - self._topheight - self._bottomheight);
                        var width = Math.max(_iframearea.contentWindow.document.documentElement.scrollWidth, _iframearea.contentWindow.document.body.scrollWidth),
                        height = Math.max(_iframearea.contentWindow.document.documentElement.scrollHeight, _iframearea.contentWindow.document.body.scrollHeight);
                        self.resize(width, height + self._topheight + self._bottomheight);
                    } catch(e) {}
                    self.showLoad(false);
                    self.center();
                };
                self._iframeareaid = self.id + "_iframe";
                var strIframe = string.format('<iframe id="{0}" frameborder="0" scrolling="no" style="height: {1}px; width: 100%;" class="fe_window_iframe" onload="{2}();"></iframe>', self._iframeareaid, self.height - self._topheight - self._bottomheight, loadAction, self.url);
                var _bottomarea;
                if (self._bottomheight > 0) {
                    _bottomarea = dom.create("div", {
                        className: 'bottombar',
                        style: string.format("height:{0}px;", self._bottomheight)
                    });
                }
                form.appendChild(_outerarea);
                _outerarea.appendChild(_frame);
                _outerarea.appendChild(_containsarea);
                _containsarea.innerHTML = strIframe;
                if (self._topheight) {
                    _containsarea.insertBefore(_toparea, _containsarea.lastChild);
                    _toparea.appendChild(_closebtn);
                    _toparea.appendChild(_title);
                }
                _containsarea.insertBefore(_loadarea, _containsarea.lastChild);
                if (self._bottomheight > 0) {
					_containsarea.appendChild(_bottomarea);
				}
                document.body.appendChild(form);
                Frame.apply(self, {
                    form: form,
                    _frame: _frame,
                    _loadarea: _loadarea,
                    _containsarea: _containsarea,
                    _toparea: _toparea,
                    _bottomarea: _bottomarea
                });
            },
            showMask: function(s) {
                var self = this;
                if (s) {
                    self.mask.style.display = "block";
                    if (Frame.isIE) {
                        document.getElementsByTagName("html")[0].style.overflow = "hidden";
                        document.getElementsByTagName("html")[0].style.paddingRight = "17px";
                    } else {
                        document.body.style.overflow = "hidden";
                        document.body.style.paddingRight = "16px";
                    }
                    if (Frame.isIE) {
                        self.mask.style.top = (document.documentElement.scrollTop || document.body.scrollTop) + "px";
                    }
                } else {
                    self.mask.style.display = "none";
                    if (Frame.isIE) {
                        document.getElementsByTagName("html")[0].style.overflow = "";
                        document.getElementsByTagName("html")[0].style.paddingRight = "";
                    } else {
                        document.body.style.overflow = "";
                        document.body.style.paddingRight = "";
                    }
                }
            },
            showLoad: function(s) {
                var self = this;
                if (s) {
                    self._loadarea.style.display = "block";
                    document.getElementById(self._iframeareaid).style.display = "none";
                } else {
                    self._loadarea.style.display = "none";
                    document.getElementById(self._iframeareaid).style.display = "block";
                }
            },
            showForm: function(s) {
                this.form.style.display = s ? "block": "none";
            },
            setTitle: function(title) {
                if (Frame.isEmpty(this._titleid)) return false;
                this.title = title;
                document.getElementById(this._titleid).innerHTML = this.title;
            },
            setUrl: function(url) {
                if (Frame.isEmpty(document.getElementById(this._iframeareaid))) return false;
                document.getElementById(this._iframeareaid).src = url ? url: this.url;
            },
            show: function(title, url, width, height, closeable) {
                this.closeable = closeable;
                if (dom.get(this.id + '_closebtn')) {
                    if (closeable) {
                        dom.get(this.id + '_closebtn').style.display = '';
                    } else {
                        dom.get(this.id + '_closebtn').style.display = 'none';
                    }
                }
                if (Frame.isEmpty(this.mask)) {
					this.createMask();
				}
                if (Frame.isEmpty(this.form)) {
					this.createForm();
				}
                this.showLoad(true);
                if (!Frame.isEmpty(title)) {
                    this.title = title;
                }
                this.setTitle(this.title);
                if (!Frame.isEmpty(url)) {
                    this.url = url;
                }
                this.setUrl(this.url);
                if (Frame.isNumber(width)) {
                    this.minWidth = width;
                }
                if (Frame.isNumber(height)) {
                    this.minHeight = height;
                }
                this.resize(0, 0);
                this.showMask(true);
                this.showForm(true);
                this.center();
                this._isLogin = user.isLogin();
            },
            showDIV: function() {
				
			},
            hide: function() {
                this.showMask(false);
                this.showForm(false);
                if (this._isLogin === false && user.isLogin()) {
                    this._isLogin = null;
                    user.show(true);
                }
            },
            close: function() {
                document.body.removeChild(this.form);
                this.form = null;
                document.body.removeChild(this.mask);
                this.mask = null;
            },
            move: function(top, left) {
                this.top = top;
                this.left = left;
                this.form.style.top = this.top + "px";
                this.form.style.left = this.left + "px";
            },
            center: function() {
                this.form.style.margin = string.format("-{0}px 0px 0px -{1}px", this.height / 2, this.width / 2);
            },
            resize: function(width, height) {
                width = Math.max(this.minWidth, width);
                height = Math.max(this.minHeight, height);
                this.width = width;
                this.height = height;
                this._frame.style.width = this.width + "px";
                this._frame.style.height = this.height + "px";
                this._frame.style.padding = this._framepadding + "px";
                this._containsarea.style.width = this.width + "px";
                this._containsarea.style.height = this.height + "px";
                this._containsarea.style.top = this._framepadding + "px";
                this._containsarea.style.left = this._framepadding + "px";
                this._loadarea.style.height = this.height - this._topheight - this._bottomheight + "px";
                this._loadarea.style.lineHeight = this.height - this._topheight - this._bottomheight + "px";
                document.getElementById(this._iframeareaid).style.height = this.height - this._topheight - this._bottomheight + "px";
            }
        });
        window.setbg = function(title, width, height, src, closeable) {
            if (closeable == 'false' || closeable == false) closeable = false;
            else closeable = true;
            win.getInstance().show(title, src, width, height, closeable);
        };
        window.closeopendiv = function(){
			win.getInstance().hide();
		};
    });
})(this, this.document);﻿ 

//19h.js

var isFrameComplete = false;
isFrameComplete = true;
var is_cur_window_load_complete = false;
is_cur_window_load_complete = true;

var cacheinputvalue = {};
function getel(id) {
    return document.getElementById(id);
}
function GetCookieValue(name) {
    var arr = document.cookie.match(new RegExp(name + "=([^&;]+)"));
    return arr == null ? "" : decodeURI(arr[1]);
}
function SetTipsCookie() {
    document.cookie = "closetooltip=1;domain=.flxxwang.com;";
}
function FilterHtml(val) {
	
	var v = val.replace(/(<cite.*?>.*?<.cite>)/ig, '').replace(/(<.*?>)/ig, '');
    if (val && val != '') {
		v = val.replace(/(<cite.*?>.*?<.cite>)/ig, '').replace(/(<span.*?>.*?<.span>)/ig, '').replace(/(<.*?>)/ig, '');
	}
	else{
		v = '';
	} 
//	console.log(val, v);
	return v;
}
function QuanToBan(val) {
    if (!val || val == '') {
        return '';
    }
    var result = "";
    for (var i = 0; i < val.length; i++) {
        if (val.charCodeAt(i) == 12288) {
            result += String.fromCharCode(val.charCodeAt(i) - 12256);
            continue;
        }
        if (val.charCodeAt(i) > 65280 && val.charCodeAt(i) < 65375)
            result += String.fromCharCode(val.charCodeAt(i) - 65248);
        else result += String.fromCharCode(val.charCodeAt(i));
    }
    return result;
}
function SetMouseOver(obj, toolWindowID) {
    var wins = getel(toolWindowID);
    if (!wins) return;
    var lis = wins.getElementsByTagName('li');
    var i = 0;
    if (lis && lis.length > 0) {
        for (; i < lis.length; i++) {
            lis[i].className = 'unselected';
        }
    }
    obj.className = 'selected';
}
function getElementPositionX(elem) {
    //    var item = $(elem);
    //    if (item && item.length)
    //        return item.offset().left;
    //    else
    //        return 0;
    var offsetTrail = elem;
    var offsetLeft = 0;
    while (offsetTrail) {
        offsetLeft += offsetTrail.offsetLeft;
        offsetTrail = offsetTrail.offsetParent;
    }
    if (navigator.userAgent.indexOf("Mac") != -1 && typeof (document.body.leftMargin) != "undefined") {
        offsetLeft += document.body.leftMargin;
    }
    return offsetLeft;
}
function getElementPositionY(elem) {
    var offsetTrail = elem;
    var offsetTop = 0;
    while (offsetTrail) {
        offsetTop += offsetTrail.offsetTop;
        offsetTrail = offsetTrail.offsetParent;
    }
    if (navigator.userAgent.indexOf("Mac") != -1 && typeof (document.body.leftMargin) != "undefined") {
        offsetTop += document.body.topMargin;
    }
    return offsetTop + elem.clientHeight + 4;
}
function ShowSelectedItem(itemID) {
    if (itemID && itemID != null && itemID != '') {
        var arr = itemID.split('|');
        var i = 0;
        if (arr.length > 0 && arr[0] == '0') i = 2;
        for (; i < arr.length; i++) {
            $("#" + arr[i]).css("display", "inline");
        }
    }
    else $("select").css("display", "inline");
}
function HideSelectedItem(itemID) {
    if (itemID && itemID != null && itemID != '') {
        var arr = itemID.split('|');
        var i = 0;
        if (arr.length > 0 && arr[0] == '0') i = 2;
        for (; i < arr.length; i++) {
            $("#" + arr[i]).css("display", "none");
        }
    }
    else $("select").css("display", "none");
}


//类别	iType
//小区	1
//地域词	2
//类别词	3
//公交	4
//地铁	5
//大学	6
//列车车站	7
//列车车次	8
//车辆词	9
//酷车类别词	10
//post类别词	11
//货运 12
//切换城市 13
//列表页公交数据 14
function GetToolTipWindow(tooltipWindowID, inputbox, tooptipType, cityid, selid, showhot, iType) {
    
    var arr = tooltipWindowID.split('|');
    if (arr.length > 1 && arr[1] == '1') {
        this.tooltipWindowID = arr[0];
        this.showInstruction = true;
    } else {
        this.tooltipWindowID = tooltipWindowID;
        this.showInstruction = false;
    }
    this.inputbox = inputbox;
    this.tooptipType = tooptipType;
    this.cityid = cityid;
    if (selid) this.selid = selid;
    else this.selid = '';
    this.notHideTips = false;
    this.buttonID = '';
    if (showhot) this.showhot = true;
    else this.showhot = false;
    this.iType = iType;
    this.trainTip = '';
    if (tooptipType == '8') this.trainTip = 'T1|D3|Z4|D98|C2001|Y563';
    if (tooptipType == '7') this.trainTip = '北京|上海|深圳|广州|武汉|西安';
    cacheinputvalue[tooltipWindowID] = {};
}


function SetToolTipData(contentData, tooltipWindowID, inputbox, tooltipType, selid, showInstruction, buttonID, showhot) {
    var arr1 = selid.split('|');

    if (arr1.length > 1 && arr1[0] == '0')
        if (getel(arr1[1])) getel(arr1[1]).value = FilterHtml(contentData);
    //    var iframe = getel("frm" + tooltipWindowID);
    if (contentData && contentData.w && contentData.w.length) {
        var arr = contentData.w;
        var i = 0;
        if (getel(tooltipWindowID)) getel(tooltipWindowID).style.display = 'block';
        else return;
        var obj = getel(tooltipWindowID).getElementsByTagName('ul');
        var result = "";
        var clsName = '';
        var re;
        var hot = '';
        for (i = 0; i < arr.length; i++) {

            if (!arr[i])
                continue;
            result += "<li class='" + clsName + "' onmouseover=\"SetMouseOver(this,'" + tooltipWindowID + "')\" onmouseout=\"this.className='unselected'\" onmousedown=\"SetInputValue(this,'" + inputbox + "','" + tooltipWindowID + "','" + selid + "','" + buttonID + "');return false\">";


            var key = arr[i].k;
            for(var j = 0, lenj = arr[i].h.length; j < lenj; j ++) {
                key = key.replace(arr[i].h[j].v, '<b>' + arr[i].h[j].v + '</b>');
            }
            
			if(showhot && arr[i].n) {
				result += '<span class="tool_r">约&nbsp;' + arr[i].n + '&nbsp;条</span>'
			}
			result = result + "<a href='javascript:void(0)'>" + key;
            if (arr[i].s) {
                result += '<cite>' + arr[i].s + '</cite>';
            }
			result += "</a>";

            result += "</li>";
        }
        obj[0].innerHTML = result;
        if (selid && selid != '') HideSelectedItem(selid);
        //        iframe.style.width = getel(tooltipWindowID).clientWidth + "px";
        //        iframe.style.height = getel(tooltipWindowID).clientHeight + "px";
    } else {
        if (getel(tooltipWindowID)) {
            getel(tooltipWindowID).style.display = 'none';
            var obj = getel(tooltipWindowID).getElementsByTagName('ul');
            obj[0].innerHTML = "";
            if (selid && selid != '') ShowSelectedItem(selid);
        } else {
            if (selid && selid != '') ShowSelectedItem(selid);
            return;
        }
    }
}
function SetInputValue1(obj, inputbox, tooltipWindowID, selid, buttonID) {
    var val = '';
    if (obj) {
        obj = obj.getElementsByTagName('a');
        if (obj.length > 0) {
            obj = obj[0];
        }
    }
    val = obj.innerHTML;
    if (val && val != '') {
        val = FilterHtml(val);
    }
    var arr = inputbox.split('|');
    if (arr.length > 1) {
        if (getel(arr[0])) getel(arr[0]).value = val;
        if (getel(arr[1])) {
            if (obj.innerHTML.match(/<cite.*?>(.*?)<.cite>/ig) && obj.innerHTML.match(/<cite.*?>(.*?)<.cite>/ig).length > 0) {
                getel(arr[1]).value = obj.innerHTML.match(/<cite.*?>(.*?)<.cite>/ig)[0].replace(/(<.*?>)/ig, '');
            }
            else {
                getel(arr[1]).value = '';
            }
        }
    }
    else {
        if (getel(inputbox)) {
            if (getel(inputbox)) getel(inputbox).value = val;
        }
    }
} 
function SetInputValue(obj, inputbox, tooltipWindowID, selid, buttonID) {
    SetInputValue1(obj, inputbox, tooltipWindowID, selid, buttonID);
    if (getel(tooltipWindowID)) getel(tooltipWindowID).style.display = 'none';
    if (buttonID != '' && getel(buttonID)) getel(buttonID).click();
    if (selid && selid != '') {
        ShowSelectedItem(selid);
    }
}
GetToolTipWindow.prototype = {
    openToolTipWindow: function () {
        var input = getel(this.inputbox.split('|')[0]);
        var m = this.tooltipWindowID + "mask";
        var tooltipid = this.tooltipWindowID;
        var selid = this.selid;
        this.closeToolTipWindow();
        var newDiv = document.createElement("div");
        newDiv.id = this.tooltipWindowID;
        newDiv.style.position = "absolute";
        newDiv.style.zIndex = "9999";
        newDiv.style.display = 'none';
        newDiv.style.top = getElementPositionY(input) + "px";
        newDiv.style.left = getElementPositionX(input) + "px";
        newDiv.className = 'tooltip';
        newDiv.innerHTML = "<ul></ul>";
        document.body.appendChild(newDiv);


        var element = input, me = this;
        if (element.addEventListener) {
            element.addEventListener("blur", function () {
                me.closeToolTipWindow();
            }, false);
        } else if (element.attachEvent) {
            element.attachEvent("onblur", function () {
                me.closeToolTipWindow();
            });
        }
    },
    GetContentData: function () {
//        if (!isFrameComplete || !is_cur_window_load_complete) return;
        if (GetCookieValue('closetooltip') == '1' && !this.notHideTips) return;
        var evt = null;
        if (document.all) evt = window.event;
        else evt = arguments[0] || arguments.callee.caller.arguments[0];
        if (evt != null) {
            switch (evt.keyCode) {
                case 13:
                    var temp = getel(this.tooltipWindowID);
                    if (temp && temp.style.display != 'none') {
                        var list = temp.getElementsByTagName('li');
                        var i = 0;
                        if (list.length > 0)
                            for (i = 0; i < list.length; i++)
                                if (list[i].className && list[i].className == 'selected')
                                    SetInputValue1(list[i], this.inputbox, '', '', '');
                    }
                    if (this.selid && this.selid != '') ShowSelectedItem(this.selid);
                    this.closeToolTipWindow();
//                    if (this.buttonID != '' && getel(this.buttonID)) getel(this.buttonID).click();
                    if (this.buttonID != '' && getel(this.buttonID) && getel(this.buttonID).type == 'button') {
                        getel(this.buttonID).click();
                    }
                    return;
                case 38:
                    var temp = getel(this.tooltipWindowID);
                    if (temp && temp.style.display != 'none') {
                        var list = temp.getElementsByTagName('li');
                        var i = 0;
                        var hasselected = false;
                        if (list.length > 0) {
                            for (i = 0; i < list.length; i++) {
                                if (list[i].className && list[i].className == 'selected') {
                                    hasselected = true;
                                    list[i].className = 'unselected';
                                    if (i > 0) {
                                        list[i - 1].className = 'selected';
                                        if (getel(this.inputbox.split('|')[0])) {
                                            if (list[i - 1]) {
                                                SetInputValue1(list[i - 1], this.inputbox, '', '', '');
                                            }
                                            getel(this.inputbox.split('|')[0]).focus();
                                        }
                                        return;
                                    } else {
                                        list[list.length - 1].className = 'selected';
                                        if (getel(this.inputbox.split('|')[0])) {
                                            if (list[list.length - 1]) SetInputValue1(list[list.length - 1], this.inputbox, '', '', '');
                                            getel(this.inputbox.split('|')[0]).focus();
                                        }
                                        return;
                                    }
                                }
                            }
                            if (!hasselected) {
                                list[list.length - 1].className = 'selected';
                                if (getel(this.inputbox.split('|')[0])) {
                                    if (getel(this.inputbox.split('|')[0])) {
                                        if (list[list.length - 1]) SetInputValue1(list[list.length - 1], this.inputbox, '', '', '');
                                        getel(this.inputbox.split('|')[0]).focus();
                                    }
                                    getel(this.inputbox.split('|')[0]).focus();
                                }
                                return;
                            }
                        }
                    }
                    return;
                case 40:
                    var temp = getel(this.tooltipWindowID);
                    if (temp && temp.style.display != 'none') {
                        var list = temp.getElementsByTagName('li');
                        var i = 0;
                        var hasselected = false;
                        if (list.length > 0) {
                            for (i = 0; i < list.length; i++) {
                                if (list[i].className && list[i].className == 'selected') {
                                    hasselected = true;
                                    list[i].className = 'unselected';
                                    if (i < list.length - 1) {
                                        list[i + 1].className = 'selected';
                                        if (getel(this.inputbox.split('|')[0])) {
                                            if (list[i + 1]) SetInputValue1(list[i + 1], this.inputbox, '', '', '');
                                            getel(this.inputbox.split('|')[0]).focus();
                                        }
                                        return;

                                    }
                                    else {
                                        list[0].className = 'selected';
                                        if (getel(this.inputbox.split('|')[0])) {
                                            if (list[0]) SetInputValue1(list[0], this.inputbox, '', '', '');
                                            getel(this.inputbox.split('|')[0]).focus();
                                        }
                                        return;
                                    }
                                }
                            }
                            if (!hasselected) {
                                list[0].className = 'selected';
                                if (getel(this.inputbox.split('|')[0])) {
                                    if (list[0]) SetInputValue1(list[0], this.inputbox, '', '', '');
                                    getel(this.inputbox.split('|')[0]).focus();
                                }
                                return;
                            }
                        }
                    }
                    return;
            }
        }
        if (getel(this.inputbox.split('|')[0]).value == '') {
            if (this.tooptipType == '7' || this.tooptipType == '8') {
                if (!getel(this.tooltipWindowID)) this.openToolTipWindow();
                SetToolTipData(this.trainTip, this.tooltipWindowID, this.inputbox, this.tooptipType, this.selid, this.showInstruction, this.buttonID, this.showhot);
                return;
            }
            if (this.selid && this.selid != '') ShowSelectedItem(this.selid);
            this.closeToolTipWindow();
            return;
        }
        if (!getel(this.tooltipWindowID)) this.openToolTipWindow();

        //        GetToolTipInfoData(this.tooltipWindowID, this.inputbox, this.tooptipType, this.cityid, this.selid, this.showInstruction, this.buttonID, this.showhot);
        GetToolTipInfoData(this.tooltipWindowID, this.inputbox, this.tooptipType, this.cityid, this.selid, this.showInstruction, this.buttonID, this.showhot, this.iType);
    },
    closeToolTipWindow: function () {
        if (this.selid && this.selid != '') ShowSelectedItem(this.selid);
        var m = this.tooltipWindowID + "mask";
        if (getel(this.tooltipWindowID)) document.body.removeChild(getel(this.tooltipWindowID));
        if (getel(m)) document.body.removeChild(getel(m));
    },
    setNothideTips: function () {
        this.notHideTips = true;
    },
    setSearchButton: function (buttonID) {
        this.buttonID = buttonID;
    },
    getSearchURL: function () {
        var url = window.location.href;
        if (getel(this.inputbox.split('|')[0]).value != '') {
            if (url.match(/key=[^&]+/ig))
                url = url.replace(/key=[^&]+/ig, 'key=' + encodeURI(getel(this.inputbox.split('|')[0]).value));
            else {
                if (url.indexOf('?') > 0)
                    url = url + '&key=' + encodeURI(getel(this.inputbox.split('|')[0]).value);
                else
                    url = url + '?key=' + encodeURI(getel(this.inputbox.split('|')[0]).value);
            }
        }
        return url;
    }
};



function GetToolTipInfoData(tooltipWindowID, inputbox, tooltipType, cityid, selid, showInstruction, buttonID, showhot, iType) {
    
    var inputvalue = QuanToBan(document.getElementById(inputbox.split('|')[0]).value);

    if (cacheinputvalue[tooltipWindowID][inputvalue] != undefined) {
        SetToolTipData(cacheinputvalue[tooltipWindowID][inputvalue], tooltipWindowID, inputbox, tooltipType, selid, showInstruction, buttonID, showhot);
    } else {
        var showh = false;
        if (showhot) { showh = true; }
        var cateid;

        if (typeof ____json4fe != 'undefined') {
            var j = ____json4fe,
            m = j.modules,
            city = j.locallist && j.locallist.length ? j.locallist[0] : j.locallist,
            cate = j.catentry && j.catentry.length ? j.catentry[Math.min(j.catentry.length - 1, 1)] : j.catentry;

            cityid = city.dispid;
            cateid = cate.dispid;
        }
        var url = '',
            path = '';
        if (Math.random() > 0.5) {
            url = 'http://211.151.64.39:8080';
        } else {
            url = 'http://211.151.77.230:8080';
        }
//        url = 'http://192.168.105.100:8080';
//        if (m == 'post') {
//            path = '/releasesuggest.do';
//        } else {
            path = '/searchsuggest_' + (iType ? iType : 1) + '.do';
//        }

            url += path + "?inputbox=" + encodeURIComponent(inputvalue) + "&cityid=" + cityid + "&catid=" + (cateid ? cateid : '0');//  + "&topType=1" + "&showhot=false&showInstruction=" + showInstruction;
//        if (this.iType) {
//            url += '&itype=' + this.iType;
//        }


//type=1 表示只提示小区
//type=2 只提示写字楼
//type=3 提示小区和写字楼

        var callback = "callback" + Math.random().toString().substring(2, 6);
        window[callback] = function (data) {
            cacheinputvalue[tooltipWindowID][inputvalue] = data;
            SetToolTipData(data, tooltipWindowID, inputbox, tooltipType, selid, showInstruction, buttonID, showh);
            window[callback] = null;
        };
        url += "&callback=" + callback;

        var script = document.createElement("SCRIPT");
        script.src = url;
        document.body.appendChild(script);
    }
}

//zpzhushou.js
//        function showzpzhushou(url) {
//			try
//			{
//		    var src = document.createElement("script");
//            src.type = "text/javascript";
//            src.src = url;
//            src.id = "scriptid";
//			var div = document.getElementById("zpzs");
//            if (div != null) {
//                div.innerHTML = '';
//                div.appendChild(src);             
//				}
//			}
//			catch (e){}
//        }
        var lastScrollY = 0;
        function heartBeat() {
			try
			{
				 var diffY;
            if (document.documentElement && document.documentElement.scrollTop)
                diffY = document.documentElement.scrollTop;
            else if (document.body)
                diffY = document.body.scrollTop;
            percent = .1 * (diffY - lastScrollY);
            if (percent > 0) percent = Math.ceil(percent);
            else percent = Math.floor(percent);
            document.getElementById("zpzs").style.top = (parseInt(document.getElementById("zpzs").style.top) + percent) + "px";
			document.getElementById("zpzs").style.right = ((document.body.clientWidth - 1000) / 2) - 125 + "px";
            lastScrollY = lastScrollY + percent;
			}
			catch (e){}
        }
        function callback(str) {
			try
			{
			if(str!=null&&str!=""){
			   document.getElementById("zpzs").innerHTML = str;
			   document.getElementById("zpzs").style.display = "";
               document.getElementById("zpzs").style.right = ((document.body.clientWidth - 1000) / 2) - 125 + "px";
			   window.setInterval("heartBeat()", 1);
			   }
			}
			catch (e){}
        }

//highlight.js
﻿/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/business/highlight.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/5/9
 * Update Log:
 */
(function (global, DOC, undefined) {
    boot.declare('business.highlight', 'extension.string', function (Namespace, Frame, string) {
        Namespace.highlight = {
            init: function (objs, key) {
                key = key || "";
                key = string.trim(key);
                if (Frame.isEmpty(key))
                    return false;
                if (Frame.isEmpty(objs))
                    return false;
                var strarr = key.split(" "),
                    textnodes = [];

//                for (var i = 0, leni = objs.length; i < leni; i++) {
//                    if (objs[i].nodeType == 3) {
//                        textnodes.push(objs[i]);
//                    } else if (objs[i].childNodes && objs[i].childNodes.length) {
//                        for (var j = 0, lenj = objs[i].childNodes.length; j < lenj; j++) {
//                            if (objs[i].childNodes[j].nodeType == 3) {
//                                textnodes.push(objs[i].childNodes[j]);
//                            }
//                        }
//                    }
//                }

//                for (var i = 0, leni = strarr.length; i < leni; i++) {
//                    var e = new RegExp(string.format("({0})", strarr[i].replace(/[\$\(\)\*\+\.\[\?\\\^\{\|]/, '\$1')), "ig");
//                    for (var j = 0, lenj = textnodes.length; j < lenj; j++) {
//                        if (e.test(textnodes[j].nodeValue)) {
//                            textnodes[j].parentNode.innerHTML = textnodes[j].parentNode.innerHTML.replace(textnodes[j].nodeValue, textnodes[j].nodeValue.replace(e, "<b>$1</b>"));
//                        }
//                    }
//                }
                Frame.each(objs, function (i) {
                    var ht = this.innerHTML;
                    for (var j = 0; j < strarr.length; j++) {
                        if (Frame.isEmpty(strarr[j])) {
                            continue;
                        }
                        var e = new RegExp(string.format("({0})", strarr[j].replace(/[\$\(\)\*\+\.\[\?\\\^\{\|]/, '\$1')), "ig");
                        ht = ht.replace(e, "<b>$1</b>");
                    }
                    this.innerHTML = ht;
                });
            }
        };
    });
})(this, this.document);

//gaq.js
﻿/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/name.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/5/9
 * Update Log:
 * 2011/5/31 yaozz add regexp rule
 */
(function(global, DOC, undefined){
	boot.declare('business.gaq', 'util.uri', function(Namespace, Frame, uri){
	    Namespace.gaq = function (rootName, trackURL) {
	        var zhaopin_exp = "|job|jianzhi|zhaojianzhi|searchjob|";
	        var ershou_exp = "|piaowu|sale|pets|";
	        var huangye_exp = "|zhaoshang|canyin|jiaoyu|yiliaobaojian|banjiawuliu|lvyouxiuxian|jiazhengbaojie|shejichuanmei|hunjiehunqing|weixiushutong|baozhuangyinshua|gongsijianshe|falvjinrong|shangcheng|shenghuo|shangwu|";
	        if (zhaopin_exp.indexOf("|" + rootName + "|") != -1) {
	            trackURL = trackURL.replace(rootName, "zhaopin/" + rootName);
	        } else if (ershou_exp.indexOf("|" + rootName + "|") != -1) {
	            trackURL = trackURL.replace(rootName, "ershou/" + rootName);
	        } else if (huangye_exp.indexOf("|" + rootName + "|") != -1) {
	            trackURL = trackURL.replace(rootName, "huangye/" + rootName);
	        }

	        var params = [], s = window.location.search;
	        //    params.push(/utm_source=[^\&]*/i.exec(s));
	        //    params.push(/utm_medium=[^\&]*/i.exec(s));
	        //    params.push(/utm_campaign=[^\&]*/i.exec(s));
	        //    params.push(/utm_term=[^\&]*/i.exec(s));
	        //    params.push(/utm_content=[^\&]*/i.exec(s));
	        //var keyvalue = /key=[^\&]*/i.exec(s);
	        try {
				var keyvalue = /key=[^\&]*/i.exec(s);
				if(Frame.isEmpty(keyvalue)){
					var mkeyvalue = /\/(?:key_|jh_)([^\&]*)\//i.exec(location.href);
					if(mkeyvalue.length == 2) {
						keyvalue = 'key=' + mkeyvalue[1];
					}
				}
				if (!Frame.isEmpty(keyvalue)) {
					keyvalue = uri.decode(keyvalue);
					params.push(keyvalue);
				}
	        } catch (e) {
	        };
	        var str = params.join("&");
	        str = str.replace(/\&+/g, "&");
	        str = str.replace(/\&$/, "");
	        return trackURL + (str == "" ? "" : "?" + str);
	    }
	});
})(this, this.document);

//navbar.js
﻿/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/business/navbar.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/5/19
 * Update Log:
 */
(function(global, DOC, undefined){
	boot.declare('business.navbar', '', function(Namespace, Frame){
		Namespace.navbar = {
			init : function(){}
		};
	});
})(this, this.document);

//list.js
﻿/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/page/list.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/5/9
 * Update Log:
 */
function leftPad(num) {
    if (num < 10) return '0' + num;
    else return num + '';
}

 //提供简洁的筛选条件
function ep(obj2) {
    obj2 = obj2 || {};
    if (obj2.postdate) {
        var now = new Date();
        var time = new Date();
        time.setDate(time.getDate() - parseInt(obj2.postdate + ''));
        var str = time.getUTCFullYear() + '' + leftPad(time.getUTCMonth() + 1) + leftPad(time.getUTCDate()) + '00';
        str += "_";
        str += now.getUTCFullYear() + '' + leftPad(now.getUTCMonth() + 1) + leftPad(now.getUTCDate()) + '23';

        obj2.postdate = str;
    }
    return obj2;
}
function g(obj1, obj2) {	
    obj1.page = null;
    obj2 = ep(obj2);
    boot.require('util.uri', function(Frame, uri){
		var u = new uri();
		u.setPath(obj1);
		u.setQuery(obj2);
		location.href = u.toString();
	});
}
function g1(obj1) {
    obj1.page = null;
    boot.require('util.uri', function(Frame, uri){
		var u = new uri();
		u.setPath(obj1);
		u.setQuery(null);
		location.href = u.toString();
	});
}
function g2(obj2) {
	obj2 = ep(obj2);
	boot.require('util.uri', function(Frame, uri){
		var u = new uri();
		u.setPath({
			page : null
		});
		u.setQuery(obj2);
		location.href = u.toString();
	});
}
function g3(obj1) {
	boot.require('util.uri', function(Frame, uri){
		var u = new uri();
		u.setPath({
			page : null
		});
		u.setPath(obj1);
		location.href = u.toString();
	});
}
function b_query(args) {
    boot.require('config, dom, business.sift, extension.array, util.uri', function (Frame, config, dom, sift, array, uri) {
        var sourange_0 = dom.get('sourange_0'),//本类搜
			sourange_1 = dom.get('sourange_1');//全站搜
        if (sourange_1 && sourange_1.checked) {
            var queryInputs = document.getElementsByName("b_q"),
				keyInputs = array.filter(queryInputs, function (input) {
				    return input.getAttribute('para') == 'key';
				});
            if (!keyInputs || !keyInputs.length) return;
            var key = sift.getValue(keyInputs[0]);
            key = uri.decode(key);
			key = key.replace(/([^\u0391-\uFFE5a-zA-Z0-9 ])/ig, '');
            if (Frame.isEmpty(key)) {
                window.location.reload();
                return;
            }
            location.href = 'http://' + config.city.listname + '.flxxwang.com/sou/jh_' + key + '/final_1/';
        } else {
            if (args) {
                sift.search(Frame.urlDecode(args));
            }
            else {
                sift.search();
            }
        }
    });
}

function urlEncode(obj) {
	var temp = [''];
	for (var key in obj) {
		temp.push(key + '_' + obj[key]); 
	}
	temp.push('');  
	return temp.join('/');
}
function sou_query(arg) {
	boot.require('dom', function(Frame, dom, uri){
		var params = {},
			keyInput = dom.get('keyword'),
			fdv = keyInput.getAttribute('fdv'),
			value = '';
		if(keyInput.value == fdv) {
			window.location.reload();
		} else {
			keyInput.value = keyInput.value.replace(/([^\u0391-\uFFE5a-zA-Z0-9 ])/ig, '');
			value = keyInput.value;
		}
		
		if (arg) {
			Frame.apply(params, Frame.urlDecode(arg));
		}
		location.href = location.protocol + '//' + location.host + location.pathname.substring(0, location.pathname.indexOf('sou') + 3) + (Frame.isEmpty(value) ? '' : urlEncode(params) + 'jh_' + value + '/final_1/');
	});
}

(function(global, DOC, undefined){
	/**
	 * 搜索功能
	 */
	// boot.require('business.sift, util.uri', function(Frame, sift, uri){
		// Frame.apply(global, {
			// g : function(obj1, obj2) {
// 				
			    // // obj2 = ep(obj2);
			    // obj1.page = null;
			    // // location.href = fe.util.url.pakeage(obj1, obj2);
// 			    
		    	// var u = new uri();
		    	// u.setPath(obj1);
		    	// u.setQuery(obj2);
		    	// location.href = u.toString();
			// },
			// g1 : function(obj1) {
			    // obj1.page = null;
			    // // location.href = fe.util.url.pakeage(obj1, {});
		    	// var u = new uri();
		    	// u.setPath(obj1);
		    	// u.setQuery(null);
		    	// location.href = u.toString();
			// },
			// g2 : function(obj2) {
			    // // var pp = fe.util.url.analyze(location.href),
			        // // sp = fe.util.url.formatting(location.search);
			    // // pp.page = null;
			    // // obj2 = ep(obj2);
			    // // location.href = fe.util.url.pakeage(pp, fe.apply(sp, obj2));
		    	// var u = new uri();
		    	// u.setPath({
		    		// page : null
				// });
		    	// u.setQuery(obj2);
		    	// location.href = u.toString();
			// },
			// b_query : function(args) {
		    	// if (args){
		    		// sift.search(Frame.urlDecode(args));
		        // }
		    	// else {
		    		// sift.search();
		    	// }
			// }
		// });
	// });
	/**
	 * 初始化搜索值
	 * 显示取消按钮
	 */
	boot.require('business.sift', function(Frame, sift){
		Frame.init(function(){
			sift.init();
			sift.showsiftbar();
		});
	});
	
	/**
	  *  listHistory 初始化
	  
	boot.require("business.listHistory,config", function(Frame, q ,config){
		Frame.init(function(){
			var timerSelectOne = setInterval(function(){
				if(document.getElementById('selected').getElementsByTagName('div').length > 0){
					clearInterval(timerSelectOne);

					if (config.catelist.length < 2) return;
					//var isList = config.isList && (!!document.getElementById('selected').getElementsByTagName('div').length);
					var isList = config.isList;
					var key = config.catelist[1].listname || config.rootcate;
					var p = document.title, m = location.href, o;
					p = p.split("|")[0].substring(1) || "暂无信息";
					o = {
						local: p,
						url: m
					};

					q.setcurrentData(o).init(isList , key);


				}
			},100);

		});
	});
*/


	/**
	 * 处理列表页广告分栏显示 李生
	 */
	boot.require('dom', function(Frame, dom){
        Frame.init(function(){
            var right = dom.get('rightframe'), 
				flag = false;
            if(!right) return;
	        if (right && right.children) {
	            var divs = right.children;
	            for (var i = 0, leni = divs.length; i < leni; i++) {
	                if (divs[i] && divs[i].innerHTML != '') {
	                    flag = true;
	                    break;
	                }
	            }
	        }
	        if (flag) {
	            var left = dom.get('infolist');
	            if (left) {
	                dom.addClass(right, 'cright');
                    dom.addClass(left, 'cleft');
	            }
	        }
        });
	});
	
	/**
	 * 回到顶部
	 */
	boot.require('business.shortcut', function(Frame, shortcut){
		Frame.init(function(){
			shortcut.init();
		});
	});
	
	/**
	 * 
	 */
	boot.require('extension.array', function(Frame, array){
		Frame.init(function(){
			var inputs = document.getElementsByTagName('input'),
				texts = array.filter(inputs, function(input){
					return input.type == 'text';
				});
			for(var i = 0, leni = texts.length;i < leni; i ++){
				texts[i].setAttribute('autocomplete', 'off');	
			}
		});
	});
})(this, this.document);

//fixed.js
/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/anim/fixed.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/5/9
 * Update Log:
 */
(function(global, DOC, undefined){
	boot.declare('anim.fixed', 'dom, event', function(Namespace, Frame, dom, event){
		/**
		 * 模拟ie6 fixed效果
		 */
		Namespace.fixed = {
			
			bind: function(id, top, left){
				var element = dom.get(id);
				if(!element) return;
				if(Frame.isIE6){
//					var interval = setInterval(function(){
//						var el = dom.get(id);
//						if(!el) {
//							clearInterval(interval);
//							return;
//						}else {
//							el.style.top = DOC.documentElement.scrollTop + DOC.body.scrollTop + top + 'px';
//							el.style.left = DOC.documentElement.scrollLeft + DOC.body.scrollLeft + left + 'px';
//						}
//					}, 200);
					
					var cssText = element.style.cssText,
						styles = cssText.split(';'),
						newstyles = [];
					Frame.each(styles, function(item){
						if(!/^\s*(top|left|position)/i.test(item)){
					        newstyles.push(item);
					    }
					});
					newstyles.push('position:absolute');
					newstyles.push('top:expression(eval(document.compatMode && document.compatMode=="CSS1Compat") ? documentElement.scrollTop+(' + top + ') : document.body.scrollTop+(' + top + '))');
					newstyles.push('left:expression(eval(document.compatMode && document.compatMode=="CSS1Compat") ? documentElement.scrollLeft+(' + left + ') : document.body.scrollLeft+(' + left + '))');
//					element.style.position = 'absolute';
//					element.style.top = 'expression(eval(document.compatMode && document.compatMode=="CSS1Compat") ? documentElement.scrollTop+(' + top + ') : document.body.scrollTop+(' + top + '));';
//					element.style.left = 'expression(eval(document.compatMode && document.compatMode=="CSS1Compat") ? documentElement.scrollLeft+(' + left + ') : document.body.scrollLeft+(' + left + '));';
					// alert(newstyles.join(';'));
					element.style.cssText = newstyles.join(';');
				}else {
					element.style.position = 'fixed';
					element.style.top = top + 'px';
					element.style.left = left + 'px';
				}
			}
		};
	});
})(this, this.document);

//uri.js
﻿/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/util/url.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/3/22
 * Update Log:
 * 	2011-03-18 添加支持对 多次多种编码格式字符串 的解码函数
 *  2011-03-22 移植新版本
 *  2011-03-24 添加 url组装函数，用来拼装适用于首页和列表页的url
 *  2011年6月21日 添加二手手机url规则，添加url解析
 */
(function(global, DOC, undefined){
	boot.declare('util.uri', 'config, extension.string', function(Namespace, Frame, config, string){
		var uri = Namespace.uri = function(url){
			if(url) {
				Frame.apply(this, uri.resolve(url));
			} else {
				Frame.apply(this, {
					protocol: location.protocol,
					host: location.host,
					hostname: location.hostname,
					port: location.port,
					pathname: location.pathname,
					search: location.search,
					hash: location.hash
				});
			}
		
			if(!url) url = location.href;
			var obj = uri.shred(url);
			this.path = obj.pp;
			this.query = obj.sp;
		};
		uri.prototype = {
			
			path : null,
			query : null,
			set : function(path, query){
				return this.setPath(path).setQuery(query);
			},
			setQuery : function(queryname, value){
				if(arguments.length == 1 && Frame.isEmpty(arguments[0])){
					this.query = {};
				} else if(arguments.length == 2){
					this.query[queryname] = value;
				} else if(arguments.length == 1 && Frame.isObject(queryname)){
					Frame.apply(this.query, queryname);
				}
				return this;
			},
			setPath : function(pathname, value){
				if(arguments.length == 1 && Frame.isEmpty(arguments[0])){
					this.path = {};
				} else if(arguments.length == 2){
					this.path[pathname] = value;
				} else if(arguments.length == 1 && Frame.isObject(pathname)){
					Frame.apply(this.path, pathname);
				}
				return this;
			},
			toString : function(){
				return uri.create({
					pp : this.path,
					sp : this.query
				});
			}
		};

		if(config.rootcate.listname == 'house') {
			//<Rule>
			//	<LookFor>^(/([a-z_|A-Z_]+))/([zufang|hezu|ershoufang]+)(((/(sub))?(/l(\d+))?(/s([\d_]+))?(/t(\d+))?)|((/(bus))?(/l([^/]+))?(/s([\d_]+))?))(/(0|1))?(/(([a-z|A-Z]\d+)+))?(/pn(\d+))?(/size(\d+))?(/sort-([a-z|A-Z|0-9]+_[a-z|A-Z]+))?/?$</LookFor>
			//	<SendTo><![CDATA[/Default.aspx?LocalName=$2&CateName=$3&xianluzhoubian=$7$16&ditiexian=$9&ditiezhan=$11&distancetime=$13&gongjiaoxian=$18&gongjiaozhan=$20&biz=$22&Paras=$24&Page=$27&PageSize=$29&sort=$31&UrlConfigID=FangList]]></SendTo>
			//</Rule>

			Frame.apply(uri, {
				urlpathRegExp: /^http:\/\/([^.]+)\.58\.com\/(?:([a-zA-Z_]+)\/)?([a-zA-Z]+)\/(?:(bus|sub)\/)?(?:l([^\/]+)\/)?(?:s([0-9_]+)\/)?(?:t(\d)\/)?(?:(0|1)\/)?(?:([a-zA-Z][0-9]+[a-zA-Z0-9]*)\/)?(?:pn(\d+)\/)?(?:size(\d+)\/)?(?:sort-([a-z|A-Z|0-9]+_[a-z|A-Z]+)\/)?/i,
				urlpathFormat: 'http://{0}.flxxwang.com/{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11}',
				urlpathParams: [
					{
						name: 'city',
						tpl: '{0}'
					}, 
					'local', 
					'cate', 
					'type',
					{
						name: 'line',
						tpl: 'l{0}/'
					}, 
					{
						name: 'station',
						tpl: 's{0}/'
					},
					{
						name: 'time',
						tpl: 't{0}/'
					}, 
					'biz', 
					'paras', 
					{
						name: 'page',
						tpl: 'pn{0}/'
					}, 
					{
						name: 'pagesize',
						tpl: 'size{0}/'
					}, 
					{
						name: 'sort',
						tpl: 'sort-{0}/'
					}
				],
				pathFormatter : {},
				searchFormatter: {
					key: { encode: function(v){return uri.encode(v);} }
				}
			});

		} else if(config.catelist.length >= 2 && config.catelist[1].listname == 'shouji') {
			Frame.apply(uri, {
				urlpathRegExp: /^http:\/\/([^.]+)\.58\.com\/(?:([a-zA-Z]+)\/)?(?:([a-zA-Z]+)\/)(?:(0|1)\/)?(?:([a-zA-Z][0-9]+[a-zA-Z0-9]*)\/)?(?:pn(\d+)\/)?(?:size(\d+)\/)?(?:sort-([a-z|A-Z|0-9]+_[a-z|A-Z]+))?(?:\/)?(?:(pve_[^\/]+))?/i,
				urlpathFormat: 'http://{0}.flxxwang.com/{1}{2}{3}{4}{5}{6}{7}{8}',
				urlpathParams: [
					{
						name: 'city',
						tpl: '{0}'
					}, 
					'local', 
					'cate', 
					'biz', 
					'paras', 
					{
						name: 'page',
						tpl: 'pn{0}/'
					}, 
					{
						name: 'pagesize',
						tpl: 'size{0}/'
					}, 
					{
						name: 'sort',
						tpl: 'sort-{0}/'
					},
					'pve'
				],
				pathFormatter : {},
				searchFormatter: {
					key: { encode: function(v){return uri.encode(v);} }
				}
			});
		} else {
			Frame.apply(uri, {
				urlpathRegExp: /^http:\/\/([^.]+)\.58\.com\/(?:([a-zA-Z]+)\/)?(?:([a-zA-Z]+)\/)(?:(0|1)\/)?(?:([a-zA-Z][0-9]+[a-zA-Z0-9]*)\/)?(?:pn(\d+)\/)?(?:size(\d+)\/)?(?:sort-([a-z|A-Z|0-9]+_[a-z|A-Z]+))?(?:\/)?/i,
				urlpathFormat: 'http://{0}.flxxwang.com/{1}{2}{3}{4}{5}{6}{7}',
				urlpathParams: [
					{
						name: 'city',
						tpl: '{0}'
					}, 
					'local', 
					'cate', 
					'biz', 
					'paras', 
					{
						name: 'page',
						tpl: 'pn{0}/'
					}, 
					{
						name: 'pagesize',
						tpl: 'size{0}/'
					}, 
					{
						name: 'sort',
						tpl: 'sort-{0}/'
					}
				],
				pathFormatter : {},
				searchFormatter: {
					key: { encode: function(v){return uri.encode(v);} }
				}
			});
		}

		Frame.apply(uri, {
			/**
		     * encode keyword
		     **/
		    encode: function (value) {
		        return (Frame.isEmpty(value) ? "" : encodeURI(escape(value)));
		    },
		    /**
		     * @alias {util.url.decode} decode keyword
		     * @param {String} value 
		     * @return {String} decoded value	
			 * 针对escape、encodeURI、encodeURIComponent三种编码方式，根据其编码特征来处理
			 * 
			 * 1、escape，特征最为明显，对于值小与255的字符编码格式为%[a-zA-Z0-9]{2}，对值大于255的字符编码格式为%u[a-zA-Z0-9]{4}，
			 * 	  escape不进行编码的字符有69个： *，+，-，.，/，@，_，0-9，a-z，A-Z
			 * 2、encodeURI，编码格式为%[a-zA-Z0-9]{2},
			 * 	  encodeURI不进行编码的字符有82个：!，#，$，&，'，(，)，*，+，,，-，.，/，:，;，=，?，@，_，~，0-9，a-z，A-Z
			 * 3、encodeURIComponent三种编码方式，编码格式为%[a-zA-Z0-9]{2},
			 * 	  encodeURIComponent不进行编码的字符有71个：!， '，(，)，*，-，.，_，~，0-9，a-z，A-Z
			 * 
			 * 提取三种编码方式不同的部分：
			 * 当字符的值小于255时，三种编码方式结果相同，可以任意使用一种解码方式
			 * 当字符的值大于255时，escape编码的结果与另外两者不同，可根据其编码特征来处理，
			 * 即当编码格式为%u[a-zA-Z0-9]{4}时，使用unescape解码，
			 * 当编码格式为%[a-zA-Z0-9]{2}时，因为encodeURIComponent不进行编码的字符少于encodeURI，
			 * 则可判断decodeURIComponent可以同时针对encodeURI和因为encodeURIComponent两种编码方式进行解码
			 * 
			 * 记录解码结果，如果解码后与原字符串相同，则结束递归
			 */
		    decode: function (value) {				
		        var ov = value, nv;		
		        //if (/^((%u[a-zA-Z0-9]{4})|(%[a-zA-Z0-9]{2})|([\*\+-\./@_0-9a-zA-Z]*))*$/ig.test(ov)) nv = unescape(ov);
		
		        var re4escape = new RegExp("%u[a-zA-Z0-9]{4}", 'ig');
		        var re4decodeuri = new RegExp("^((%[a-zA-Z0-9]{2})|([!#\$&'\(\)\*\+,-\./:;=\?@_~a-zA-Z0-9]))*$", '');
		
				if(re4escape.test(ov)) nv= unescape(ov);
				else if (re4decodeuri.test(ov)) nv = decodeURIComponent(ov);
				else nv = ov;
				if (ov != nv) return this.decode(nv);
				else return nv;
		    },
			/**
			  * @alias {util.uri.resolve}
			  *	@params {String} url
			  * @returns {Object} {
			  *		protocol: location.protocol,
			  *		host: location.host,
			  *		hostname: location.hostname,
			  *		port: location.port,
			  *		pathname: location.pathname,
			  *		search: location.search,
			  *		hash: location.hash
			  *	}
			  */
			resolve: function (url) {
		        var self = this,
					u = url,
					re = /^(http|ftp|https):\/\/(\w*\.)+(\w*)/i,
					full = re.test(u),
					protocol = host = hostname = port = pathname = search = hash = '';
				
				var index = -1,
					str = u,
					parts = [];
				if(full) {
					index = str.indexOf(':');
					protocol = index != -1 ? str.substring(0, index + 1) : '';
					str = str.substring(index + 3);
					
					index = str.indexOf('/');
					if(index != -1) {
						parts = str.substring(0, index).split(':');
						if(parts[0]){
							host = parts[0];
							hostname = parts[0];
						}
						if(parts[1]){
							port = parts[1];
						}
					}
					str = str.substring(index + 1);
				}
				var index1 = str.indexOf('?'),
					index2 = str.indexOf('#');
				if(index1 != -1) {
					pathname = str.substring(0, index1);
					if(index2 != -1) {
						search = str.substring(index1, index2 - index1);
						host = str.substring(index2);
					} else{
						search = str.substring(index1);
						host = '';
					}
				}
				if(index1 == -1){
					if(index2 != -1) {
						pathname = str.substring(0, index2);
						host = str.substring(index2);
					} else{
						pathname = str;
					}
				}
				return {
					protocol : protocol,
					host : host,
					hostname : hostname,
					port : port,
					pathname : pathname,
					search : search,
					hash : hash
				};
		    },
			/**
			 * 分割url，返回相对应的参数
			 * pp，path params
			 * sp，search params
			 * @param {String} url
			 * @return {Object} 
			 * {
			 * 	pp : pp,
			 * 	sp : sp
			 * }
			 */
		    shred: function (url) {
		        var self = this,
	        		arr = url.split('?'),
					path = arr.length > 0 ? arr[0] : '',
					search = arr.length > 1 ? arr[1] : '',
					pp = {},
					sp = {};
				/**
				 * 根据配置的url正则来分解path params
				 * 如果没有对应的解码器，则用默认的decodeURIComponent方法
				 */
				if(path.charAt(path.length -1) != '/') {
					path += '/';
				}
		        if (path && self.urlpathRegExp) {
		            var m = self.urlpathRegExp.exec(path);
		            if(m){
			            for (var i = 0, leni = self.urlpathParams.length, lenm = m .length - 1; i < leni && i < lenm; i++) {
			                if (m[i + 1]) {
								var v = m[i + 1],
									name = '';
			                    if (Frame.isString(self.urlpathParams[i])) {
			                        name = self.urlpathParams[i];
			                    } else {
			                        name = self.urlpathParams[i].name;
			                    }
								if(!Frame.isEmpty(name) && !Frame.isEmpty(v)){
									if(self.pathFormatter[name] && self.pathFormatter[name].decode)
										pp[name] = self.pathFormatter[name].decode(v);
									else
										pp[name] = decodeURIComponent(v);
								}
			                }
			            }
		            }
		        }
				/**
				 * 分解search params参数
				 * 如果没有对应的解码器，则用默认的decodeURIComponent方法
				 */
		        if (search) {
		            var querys = search.split('&');
		            for (var i = 0, leni = querys.length; i < leni; i++) {
						var temp = querys[i].split('=');
						if (temp.length != 2) continue;
						var name = temp[0], v = temp[1];
						if(!Frame.isEmpty(name) && !Frame.isEmpty(v)){
							if(self.searchFormatter[name] && self.searchFormatter[name].decode){
								sp[name] = self.searchFormatter[name].decode(v);
							} else {
								sp[name] = decodeURIComponent(v);
							}
						}
		            }
		        }
		        return {
		            pp: pp,
		            sp: sp
		        };
		    },
			/**
			 * 根据参数创建一个url
			 * @param {Object} obj {pp:pp, sp:sp}
			 * @return {String} url
			 */
		    create: function(obj){
				if (!obj || !obj.pp) 
					return '';
				var pp = obj.pp, 
					sp = obj.sp, 
					url, 
					path, 
					search, 
					ppp = [], 
					spp = [];
				/**
				 * 根据path params创建url 路径部分
				 * 如果没有对应的编码器，则用默认的encodeURIComponent方法
				 *
				 * 如果配置了单独的tpl，则对参数进行格式化
				 */
				ppp.push(this.urlpathFormat);
				for (var i = 0, leni = this.urlpathParams.length; i < leni; i++) {
					var name, v;
					if (Frame.isString(this.urlpathParams[i])) {
						name = this.urlpathParams[i];
						v = pp[name];
					}
					else {
						name = this.urlpathParams[i].name;
						v = pp[name];
					}
					if (!Frame.isEmpty(name) && !Frame.isEmpty(v)) {
						if (this.pathFormatter[name] && this.pathFormatter[name].encode) {
							v = this.pathFormatter[name].encode(v);
						}
						else {
							v = encodeURIComponent(v);
						}
						if (Frame.isString(this.urlpathParams[i])) 
							ppp.push(v + '/');
						else 
							ppp.push(string.format(this.urlpathParams[i].tpl, v));
					}
					else 
						ppp.push('');
				}
				path = string.format.apply(null, ppp);
				
				/**
				 * 根据search params创建url 查询部分
				 * 如果没有对应的编码器，则用默认的encodeURIComponent方法
				 */
				for (var query in sp) {
					if (!Frame.isEmpty(sp[query])) {
						if (this.urlsearchParams && this.urlsearchParams[query]) {
							spp.push(query + '=' + this.urlsearchParams[query](sp[query]));
						}
						else {
							spp.push(query + '=' + encodeURIComponent(sp[query]));
						}
					}
				}
				search = spp.join('&');
				
				url = path + (Frame.isEmpty(search) ? '' : '?' + search);
				return url;
			}
		});
	});
})(this, this.document);

//cookie.js
﻿/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/util/cookie.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/3/24
 * Update Log:
 *  2011-03-24 移植新版本
 *  2011年4月21日 最终定版
 */
(function(global, DOC, undefined){	
	boot.declare('util.cookie', '', function(Namespace, Frame){
		Namespace.cookie = {
		    get: function (name, encode) {
		        var arg = name + "=";
		        var alen = arg.length;
		        var clen = document.cookie.length;
		        var i = 0;
		        var j = 0;
		        while (i < clen) {
		            j = i + alen;
		            if (document.cookie.substring(i, j) == arg)
		                return this.getCookieVal(j, encode);
		            i = document.cookie.indexOf(" ", i) + 1;
		            if (i == 0)
		                break;
		        }
		        return null;
		    },
		    set: function (name, value, expires, path, domain, secure) {
		        var argv = arguments;
		        var argc = arguments.length;
		        //        var expires = (argc > 2) ? argv[2] : null;
		        var now = new Date();
		        var expires = (argc > 2) ? argv[2] : new Date(now.getFullYear(), now.getMonth() + 1, now.getUTCDate());
		        var path = (argc > 3) ? argv[3] : '/';
		        var domain = (argc > 4) ? argv[4] : '.flxxwang.com';
		        var secure = (argc > 5) ? argv[5] : false;
		        document.cookie = name + "=" + escape(value) + ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) + ((path == null) ? "" : ("; path=" + path)) + ((domain == null) ? "" : ("; domain=" + domain)) + ((secure == true) ? "; secure" : "");
		    },
		    remove: function (name) {
		        //if (this.get(name)) 
		        //    document.cookie = name + "=" + "; expires=Thu, 01-Jan-70 00:00:01 GMT";
		        if (this.get(name)) this.set(name, "", new Date(1970, 1, 1));
		    },
			
			getCookieVal : function(offset, encode){
			    var endstr = document.cookie.indexOf(";", offset);
			    if (endstr == -1) {
			        endstr = document.cookie.length;
			    }
			    if (encode == false) return document.cookie.substring(offset, endstr);
			    else return unescape(document.cookie.substring(offset, endstr));
			}
		};
	});
})(this, this.document);

//selector.js

function getid(id) {
    return document.getElementById(id);
}

function rSelects() {

    if (typeof (selects) != "undefined" && selects.length < 1) return;
    for (i = 0; i < selects.length; i++) {
        optionsWidth.push(selects[i].offsetWidth);
        selects[i].style.display = 'none';
        select_tag = document.createElement('div');
        select_tag.id = 'select_' + selects[i].id; select_tag.className = 'select_box';
        selects[i].parentNode.insertBefore(select_tag, selects[i]); //插入当前select位置
        select_info = document.createElement('div');
        select_info.id = 'select_info_' + selects[i].id; select_info.className = 'tag_select'; select_info.style.cursor = 'pointer';
        select_tag.appendChild(select_info);
        select_ul = document.createElement('ul'); select_ul.id = 'options_' + selects[i].id; select_ul.className = 'tag_options';
        select_ul.style.cssText += 'position:absolute;display:none;z-index:998;overflow:hidden;zoom:1;top:23px';
        select_tag.appendChild(select_ul);
        rOptions(i, selects[i].id);
        if (select_ul.getElementsByTagName("li").length > 10) {
            select_ul.className = "tag_options cols";
            select_ul.style.width = parseInt((selects[i].getAttribute("sWidth") || 5) * (optionsWidth[i] - 21)) + "px";
        } else {
            select_ul.style.width = optionsWidth[i] - 1 + "px";
            select_ul.style.left = 0;
        }
        function pageX(elem) { return elem.offsetParent ? elem.offsetLeft + pageX(elem.offsetParent) : elem.offsetLeft; }
        function pageY(elem) { return elem.offsetParent ? elem.offsetTop + pageY(elem.offsetParent) : elem.offsetTop; }
        var select_ulposX = pageX(document.getElementById('select_' + selects[i].id));
        if (select_ulposX + parseInt(select_ul.style.width) < document.body.scrollWidth)
            select_ul.style.left = 0;
        else
            select_ul.style.right = 0;
        mouseSelects(selects[i].id);
    }
}
function rOptions(i, id) {
    var options = selects[i].getElementsByTagName('option');
    var options_ul = 'options_' + id;
    for (n = 0; n < selects[i].options.length; n++) {
        option_li = document.createElement('li');
        option_li.className = 'open';
        getid(options_ul).appendChild(option_li);
        option_li.innerHTML = '<span style="width:' + parseInt(optionsWidth[i] - 27) + 'px">' + selects[i].options[n].text + '</span>'; //设置下拉条宽度
        option_selected = selects[i].options[n].selected;
        if (option_selected) {
            option_li.className = 'open_selected';
            option_li.id = 'selected_' + id;
            getid('select_info_' + id).innerHTML = option_li.innerHTML;
            select_dev = document.createElement('div');
            select_dev.id = 'dev_' + selects[i].id;
            select_dev.className = 'select_dev';
            select_dev.style.cssText += "height:1px;font:400 0/0 arial;background:#fff;position:absolute;z-index:999;top:23px;left:1px;overflow:hidden;";
            select_dev.style.width = optionsWidth[i] - 1 + "px";
            getid('select_info_' + id).appendChild(select_dev);
        }
        option_li.onmouseover = function () { this.className = 'open_hover'; };
        option_li.onmouseout = function () {
            if (this.id == 'selected_' + id)
                this.className = 'open_selected';
            else
                this.className = 'open';
        };
        
        option_li.onclick = new Function("clickOptions(" + i + "," + n + ",'" + selects[i].id + "')");
    }
}
function mouseSelects(id) {
    var sincn = 'select_info_' + id;
    getid(sincn).onmouseover = function () { if (this.className == 'tag_select') this.className = 'tag_select_hover'; };
    getid(sincn).onmouseout = function () { if (this.className == 'tag_select_hover') this.className = 'tag_select'; };
    getid(sincn).onclick = function () { clickSelects(id); };
    if($('#select_info_' + id)) 
        $('#select_info_' + id).click(function (e) { e.stopPropagation(); });  //冒泡
} //鼠标经过效果
function clickSelects(id) {//鼠标点击select
    hiddenshit(); //隐藏筛选框
    var sincn = 'select_info_' + id;
    var sinul = 'options_' + id;
    for (i = 0; i < selects.length; i++) {
        if (selects[i].id == id) {
            if (getid(sincn).className == 'tag_select_hover') {
                getid(sincn).className = 'tag_select_open';
                getid(sinul).style.display = '';
            } else if (getid(sincn).className == 'tag_select_open') {
                getid(sincn).className = 'tag_select_hover';
                getid(sinul).style.display = 'none';
            }
        }
        else {
            getid('select_info_' + selects[i].id).className = 'tag_select';
            getid('options_' + selects[i].id).style.display = 'none';
        }
    }
}
function clickOptions(i, n, id) {
    var li = getid('options_' + id).getElementsByTagName('li');
    getid('selected_' + id).className = 'open';
    getid('selected_' + id).id = '';
    li[n].id = 'selected_' + id;
    li[n].className = 'open_hover';
    getid('select_' + id).removeChild(getid('select_info_' + id));
    select_info = document.createElement('div');
    select_info.id = 'select_info_' + id;
    select_info.className = 'tag_select';
    select_info.style.cursor = 'pointer';
    getid('options_' + id).parentNode.insertBefore(select_info, getid('options_' + id));
    mouseSelects(id);
    getid('select_info_' + id).innerHTML = li[n].innerHTML;
    getid('options_' + id).style.display = 'none';
    getid('select_info_' + id).className = 'tag_select';
    selects[i].options[n].selected = 'selected';
    var goUrl = getid(id);
    var lurl = "";
    if ($("#schangeu").attr("par") != undefined) {
        lurl = SearchUrlUtility.GetUrlPara();
    } else {
        lurl = SearchUrlUtility.GetUrlPara(window.location.href, goUrl);
    }
    if (!goUrl.getAttribute("paratype")) {
        lurl = SearchUrlUtility.GetUrlPara(window.location.href);
    }

    //2011年2月21日 杨飞 去掉页码参数，在添加新的筛选条件时，返回第一页。
    lurl = lurl.replace(/pn\d+\//, '');

    window.location.href = lurl;
}
function hiddenselect() {//隐藏selects层
    if (selects && selects.length > 0) {
        for (i = 0; i < selects.length; i++) {
            getid('select_info_' + selects[i].id).className = 'tag_select';
            getid('options_' + selects[i].id).style.display = 'none';
        }
    }
}
function hiddenshit() { $(".focusbox").toggleClass("focusbox"); } //隐藏shitbox层
function addListener(element, e, fn) { element.addEventListener ? element.addEventListener(e, fn, false) : element.attachEvent("on" + e, fn); }
function hiddenTopMycoomix() { hiddenselect(); hiddenshit(); }
function click_Ispic(obj) {
    if (obj.checked) {
        if (paraString.indexOf("ispic") == -1) {
            if (paraString != "") {
                paraString = paraString + "&"
            }
            window.location.href = "?" + paraString + "ispic=1";
        }
    } else {
        if (paraString.indexOf("ispic") != -1) {
            if (urlString.indexOf("?ispic=1&") != -1) {
                urlString = urlString.replace("ispic=1&", "");
            }
            urlString = urlString.replace("?ispic=1", "");
            urlString = urlString.replace("&ispic=1", "");
            urlString = urlString.replace("ispic=1", "");
            window.location.href = urlString;
        }
    }
}


var isIE = (document.all && window.ActiveXObject && !window.opera) ? true : false;
var optionsWidth = []; //保存select的最大宽度
$(function () {
    if (document.getElementById("sift")) {
        window.selects = document.getElementById("sift").getElementsByTagName('select'); //筛选下面的select空间

        if (selects.length == 1 && selects[0].id == "train") {
            window.selects = [];    
        }
    } else {
        window.selects = [];
    }
    if (document.getElementById("sift")) {
        rSelects();
    }; //加载select变化主函数

    addListener(document.body, "click", hiddenTopMycoomix);
    if ($(".inputbox input[type=text]"))
        $(".inputbox input[type=text]").focus(function () {
            var topspan = $(this).parent().parent().parent();
            $(".inputbox").parent().removeClass("focusbox");
            topspan.addClass("focusbox");
            hiddenselect();
        });
    if ($('.shif'))
        $('.shif').click(function (e) {
            e.stopPropagation();
        });
    //是否有图筛选
    window.ispic = document.getElementById("ispic");
    window.urlString = location.href;
    window.paraString = "";
    if (ispic != undefined) {
        if (urlString.indexOf("?") != -1) { paraString = urlString.substring(urlString.indexOf("?") + 1, urlString.length); }
        if (urlString.indexOf("ispic=") != -1) { ispic.checked = true; }
    }
});

//tipselect.js
function getId(id){
    if (typeof(id) == "string") 
        return document.getElementById(id);
}

//tips效果
function pageX(elem){
    return elem.offsetParent ? elem.offsetLeft + pageX(elem.offsetParent) : elem.offsetLeft;
}

function pageY(elem){
    return elem.offsetParent ? elem.offsetTop + pageY(elem.offsetParent) : elem.offsetTop;
}

function showTip(obj, tagName, attr){//识别函数,限定区域ID,类型,标识符
    var tipNum = [], tipsbox = "", arrow;
    if (!tipsbox) {
        var tipsbox = document.createElement("div");
        tipsbox.id = "tipsbox";
        tipsbox.innerHTML = '<div class="xsnazzy"><b class="xb1"></b><b class="xb2"></b><b class="xb3"></b><b class="xb4"></b><b class="xb5"></b><b class="xb6"></b><b class="xb7"></b><div id="arrow"><em></em><span></span></div><div class="xboxcontent"></div><b class="xb7"></b><b class="xb6"></b><b class="xb5"></b><b class="xb4"></b><b class="xb3"></b><b class="xb2"></b><b class="xb1"></b></div>';
        document.body.appendChild(tipsbox);
    }
    obj = getId(obj);
    var reg = /[<|b|>|\/|B|\s]/ig;
    if (obj) {
        var temp = obj.getElementsByTagName(tagName) || [];
        for (var j = 0; j < temp.length; j++) {
            if (temp[j].getAttribute(attr)) {
                tipNum.push(temp[j]);
            }
        };
    }
    arrow = document.getElementById("arrow");
    for (var n = 0; n < tipNum.length; n++) {
        var me = tipNum[n];
        me.onmouseover = function () {
            var metit = this.innerHTML.replace(reg, ""), medes = this.nextSibling.innerHTML; //取得标题与描述;
            if (this.nextSibling.firstChild && this.nextSibling.firstChild.tagName && this.nextSibling.firstChild.tagName.toLowerCase() == "h2") {
                tipsbox.getElementsByTagName("div")[2].innerHTML = medes;
            } else {
                tipsbox.getElementsByTagName("div")[2].innerHTML = '<h2>' + metit + '</h2><p>' + medes + '</p>';
            }

            tipsbox.style.display = "block";
            tipsbox.style.textAlign="left";//by lls
            //var top = pageY(this) - 31;
            var top = pageY(this) - 25;
            var left = pageX(this) + this.offsetWidth;

            var scrollTop = document.documentElement.scrollTop + document.body.scrollTop;
            var clientHeight = document.documentElement.clientHeight;

            if (clientHeight == 0) {
                tipsbox.style.top = top + "px";
                tipsbox.style.left = left + "px";
                arrow.style.top = "14px";
            } else {
                if (tipsbox.offsetHeight + top > scrollTop + clientHeight) {
                    var newtop = scrollTop + clientHeight - tipsbox.offsetHeight;
                    var atop = top - newtop + 14;

                    if (atop > tipsbox.offsetHeight - 50) {
                        newtop += 30;
                        atop -= 30;
                    }
                    //                    if (top > scrollTop + clientHeight - 50) {
                    //                        newtop += 50;
                    //                    } 
                    tipsbox.style.top = newtop + "px";
                    tipsbox.style.left = left + "px";
                    arrow.style.top = atop + "px";

                } else {
                    tipsbox.style.top = top + "px";
                    tipsbox.style.left = left + "px";
                    arrow.style.top = "14px";
                }
            }
            //document.documentElement.clientHeight 
        };
        me.onmouseout = function(){
            tipsbox.style.display = "none";
        };
    }
}

$(function(){
    showTip("infolist", "a", "tips");
});
$("#searchitem li").each(function(i){//隐藏为零的项目
    var obj = $(this);
    var cite = obj.children("cite");
    if (cite != undefined && cite.html() == "(0)") {
        obj.hide();
    }
});

//a8y.js
(function ($, $D, $L, $Q) {
    $.Jos41 = {
        loaddata: [],
        init: function (d) {
            d == undefined ? $D = $Q : $D = d;
            $(".container").each(function (i) {
                var obj = $(this);
                var objatt = { cm: obj.children(".pophead"), dev: obj.children(".popdev"), bm: obj.children(".popcontent"), c: obj };
                obj.hover(
					function (e) {
					    $(".container").removeClass("hover");
					    obj.removeClass("hover");
					    obj.addClass("hover");
					    objatt.dev.css({ width: objatt.cm.innerWidth() });

					    var cd = d["D" + (i + 1)];

					    if (!$.Jos41.loaddata[i]) {
					        if (cd.t == "getCity") {
					            if (cd.d == cd.pd) {
					                $.Jos41.databind(i, objatt);
					            } else {
					                $.Jos41.databind(i, objatt, true, { cateid: cd.d, catename: cd.catename, catelist: cd.catelist });
					                var lev1 = objatt.bm.children(".lev1_list");
					                var lev2 = objatt.bm.children(".lev2_list");
					                lev1.hide();
					                lev2.show();
					            }
					        } else {
					            $.Jos41.databind(i, objatt);
					        }
					        $.Jos41.loaddata[i] = true;
					    }
					},
					function (e) {
					    $(".container").removeClass("hover");
					    obj.removeClass("hover");
					}
				);

                //				//初始化当前的页面

                $(function () {
                    (function (d, i, obj) {
                        $.Jos41.initdata(d, i, obj);
                    })(d, i, obj);
                });
            });
        },

        initdata: function (d, i, obj) {
            //初始化当前的页面
            var cd = d["D" + (i + 1)];

            var objatt = { cm: obj.children(".pophead"), dev: obj.children(".popdev"), bm: obj.children(".popcontent"), c: obj };
            if (cd.t == "data") {
                $.each(cd.d, function (i) {
				
					if(i == 0 && /不限|全部/.test(this.t)) {
						return;
					}
					
                    //通过url获取当前值
                    if (this.u && this.t + "" != "" && window.location.pathname.replace(/\/pn\d+\//ig, '/') == this.u.substring(0, this.u.indexOf("?") == -1 ? this.u.length : this.u.indexOf("?"))) {
                        obj.children(".pophead").text(this.t);
                        obj.children(".pophead").addClass("popactive");
                    }
                    //通过参数获取当前值
                    else if (this.p && this.p.length > 0) {
                        var pars = [];
                        //先获取需要匹配的条件
                        $.each(this.p, function (k) {
                            if (this.v != undefined) {
                                if (this.f != undefined && this.f != "") {
                                    pars.push(this.v + "=" + $.Jos41.getParType(this.f));
                                } else {
                                    if (this.t != "") {
                                        pars.push(this.v + "=" + this.t);
                                    }
                                }
                            }
                        });
                        var count = 0, selectindex;
                        for (var i = 0; i < pars.length; i++) {
                            if (window.location.search.indexOf(pars[i]) != -1) {
                                count++;
                                selectindex = i;
                            }
                        }
                        if (count == pars.length && count != 0) {
                            obj.children(".pophead").text(this.t);
                            obj.children(".pophead").addClass("popactive");
                        }
                    }
                });
                //                $.Jos41.databind(i, objatt);
            }
        },
        databind: function (i, objatt, isparent, d) {
            var lev1 = objatt.bm.children(".lev1_list");
            var lev2 = objatt.bm.children(".lev2_list");
            if (lev1.html().toLowerCase() == "<i>&nbsp;</i>" || lev1.html().length < 1 || isparent) {
                if ($D["D" + (i + 1)] != undefined) {
                    switch ($D["D" + (i + 1)].t) {
                        case "getCity":
                            $.Jos41.getCityJson(i, objatt, isparent, d, lev1, lev2);
                            break;
                        default:
                            var _datas = $D["D" + (i + 1)].d;
                            $.Jos41.getData(lev1, _datas);
                            $.Jos41.setLayerPos(_datas.length, objatt, lev1, i);
                            $.Jos41.setBodyPos(objatt);
                            break;
                    }
                }
            }
        },
        setLayerPos: function (length, objatt, lev1, i) {
            var p = $D["D" + (i + 1)].p;
            var l = $D["D" + (i + 1)].l;
            if (p == undefined) p = 10;
            if (l == undefined) l = 5;
            var le = lev1.innerWidth();
//            objatt.bm[0].style.cssText += ";width:" + le + "px;_width:" + (le - 6) + "px";
            if (length > p) {
//                objatt.bm.width((le - 14) * l);
                objatt.bm.addClass("cols");
                lev1.children("a").width(le - 20);
            }
            if (objatt.bm.attr("city") != undefined) {
                objatt.bm.addClass("cols");
//                objatt.bm.width(66 * l);
                lev1.children("a").width(60);
            }
        },
        setBodyPos: function (objatt) {
            if (objatt.c.offset().left + objatt.bm.width() > $(document.body).width() - 20)
                objatt.bm.css("left", objatt.cm.width() - objatt.bm.width() + 14 + "px");
        },
        getData: function (lev1, _datas) {
            lev1.html("");
            $.each(_datas, function (j) {
                var _ipar = false;
                if (this.t == undefined) return true;
                if (this.ispar == undefined) this.ispar = true;

                var elea = $("<a>");
                if (this.u != undefined || this.p != undefined) {
                    var _spar = "", _opar = "";
                    if (this.u == undefined) this.u = "";
                    if (this.ispar) {
                        if (this.p != undefined) {
                            $.each(this.p, function (k) {
                                var _firstStr = "&";
                                if (k == 0) _firstStr = "?";
                                if (this.v != undefined) {
                                    $.query.REMOVE(this.v);
                                    if (this.f != undefined && this.f != "") {
                                        _spar += _firstStr + this.v + "=" + $.Jos41.getParType(this.f);
                                    } else {
                                        if (this.t != "") {
                                            _spar += _firstStr + this.v + "=" + this.t;
                                        }
                                    }
                                }
                            });
                        }
                        _opar = String($.query.copy());
                        if (_spar != "") {
                            _opar = _opar.replace("?", "&");
                            _spar += _opar;
                        } else {
                            _spar = _opar;
                        }
                    }
                    var urlString = "";
                    if (this.u == "") {
                        urlString = location.href;
                        if (urlString.indexOf("?") != -1) {
                            urlString = urlString.substring(0, urlString.indexOf("?"));
                        }
                    } else {
                        urlString = this.u;
                    }
                    urlString = urlString.replace(/\/pn\d+/, "");
                    elea.attr({ href: urlString + _spar });

                }
                elea.html(this.t);
                lev1.append(elea);
                elea = null;
            });
        },
        getParType: function (f) {
            var rString = "";
            switch (f.t) {
                case "tq": //当前时间减几天或者几月几年

                    var oldDA = f.d.DA;
                    var q = $.DataFactory.set(f.d);
                    f.d.DA = (f.d.DA != undefined ? f.d.DA = 1 : f.d.DA = f.d.DA);
                    var j = $.DataFactory.set(f.d);
                    rString = q + "_" + j;
                    f.d.DA = oldDA;
                    break;
            }
            return rString;
        },
        getCityJson: function (i, objatt, isparent, d, lev1, lev2) {
            var datas = $D["D" + (i + 1)];
            var _url = "http://api.flxxwang.com/comms/?api_callback=?";
            var _pid = 0;
            if (datas.d != undefined) {
                _pid = isparent == true ? d.cateid : datas.d;
            }
            $.getJSON(
				_url,
				{ api_method: "comflxxwang.comms.getcitylist", api_type: "json", api_pid: _pid },
				function (data) {
				    var url = window.location.toString();
				    var _tmpUrl = "http://" + datas.par + ".flxxwang.com/";
				    if (isparent == undefined) {
				        var _namestr = ""; if (datas.parname != undefined) { _namestr = $L[1] + datas.parname } else { _namestr = objatt.cm.html() }
				        lev1.html("<a href='" + url.replace("/" + datas.par + "/", "/") + "'>" + _namestr + "</a>");
				    } else {
				        var _tu = "";
				        if (url.indexOf(_tmpUrl) == -1) {
				            _tu = url.replace("/" + datas.par + "/", "/" + d.catelist + "/");
				        } else {
				            var _temLength = url.indexOf(_tmpUrl) + _tmpUrl.length;
				            var _tempV = url.substring(_temLength);
				            _tu = _tmpUrl + d.catelist + "/" + _tempV;
				        }
				        lev2.html('<div id="returnall"><b>' + d.catename + '</b><span>&nbsp;&nbsp;&laquo;&nbsp;' + $L[2] + $L[1] + datas.parname + '</span><span>&nbsp;&nbsp;&laquo;&nbsp;' + $L[3] + '</span></div><a href="' + _tu + '">' + $L[1] + d.catename + '</a>');

				        var spans = $("#returnall span");
				        if (spans.length == 2) {
				            $(spans[0]).bind("click", function () {
				                window.location.href = location.pathname.replace('/' + l, '');
				            });
				            $(spans[1]).bind("click", function () {
				                lev2.hide();
				                lev1.show();
				                var od = datas.d;
				                datas.d = datas.pd;
				                $.Jos41.databind(i, objatt);
				                datas.d = od;
				            });
				        }
				    }
				    var maxNum = data["comms_getcitylist"].length;
				    if (isparent) {
				        lev1.hide();
				        lev2.show();
				    } else {

				    }
				    $.each(data["comms_getcitylist"], function (j, list) {
				        var elea = $("<a>");
				        elea.html(list.catename);
				        if (isparent) {
				            if (url.indexOf(_tmpUrl) == -1) {
				                elea.attr({ href: url.replace("/" + datas.par + "/", "/" + list.catelist + "/") });
				            } else {
				                var _temLength = url.indexOf(_tmpUrl) + _tmpUrl.length;
				                var _tempV = url.substring(_temLength);
				                elea.attr({ href: _tmpUrl + list.catelist + "/" + _tempV });
				            }
				            lev2.append(elea);
				            lev1.hide(); lev2.show();

				        } else {
				            if (url.indexOf(_tmpUrl) == -1) {
				                elea.attr({ href: url.replace("/" + datas.par + "/", "/" + list.catelist + "/") });
				            } else {
				                var _temLength = url.indexOf(_tmpUrl) + _tmpUrl.length;
				                var _tempV = url.substring(_temLength);
				                elea.attr({ href: _tmpUrl + list.catelist + "/" + _tempV });
				            }
				            lev1.append(elea);
				        }
				        elea = null;
				    });
				    if (!isparent) {
				        $.Jos41.setLayerPos(maxNum, objatt, lev1, i);
				    } else {
				        $.Jos41.setLayerPos(maxNum, objatt, lev2, i);
				    }
				    $.Jos41.setBodyPos(objatt);
				});
        }
    };
    $.Jos41u = {
        init: function (url1, url2, d) {
            var urlString = location.href;
            if (urlString.indexOf("?") != -1) {
                urlString = urlString.substring(0, urlString.indexOf("?"));
            }
            var text = $.trim($("#keyword1").val());
            var newUrl = "";
            if (text != "" && text != $L[0]) {
                newUrl = urlString.substring(0, urlString.indexOf("/" + d.p));
                if (urlString.indexOf("/" + d.p + "/") != -1) { newUrl = urlString.substring(0, urlString.indexOf("/" + d.p + "/")); }
                if (d.f == "job" || d.f == "searchjob") {
                    newUrl = newUrl + "/" + url1 + "/";
                } else {
                    newUrl = newUrl + "/" + url2 + "/";
                }
                if (d.l != undefined) newUrl = newUrl.replace("/" + d.l + "/", "/");
                newUrl = newUrl + "?key=" + escape(escape(text)) + "&final=1&jump=2";
                window.location.href = newUrl;
            } else {
                if ($.Common.Contains(urlString, ["/job", "/searchjob", "/jianzhi", "/zhaojianzhi"])) {
                    newUrl = urlString.substring(0, urlString.indexOf(".com") + 4) + "/";
                    if (d.f == "job" || d.f == "searchjob") {
                        newUrl = newUrl + url1;
                    } else {
                        newUrl = newUrl + url2;
                    }
                } else {
                    newUrl = urlString;
                }
                window.location.href = newUrl;
            }
        }
    };
    $.Common = {
        Contains: function (s, v) {
            var b = false;
            $.each(v, function () {
                b = s.indexOf(this) != -1 ? true : false;
                if (b) return false;
            });
            return b;
        }
    }
})(jQuery, {}, '请输入职位名称|全|返回|选择区域'.split('|'));

//20.js
(function($){
	$.DataFactory={
		set:function(d){var newNow=new Date();var formatStr="",formatOldStr="yyyy-MM-dd";if(d.MS!=undefined){newNow=new Date(newNow.setMilliseconds(newNow.getMilliseconds()+d.MS));}if(d.SE!=undefined){newNow=new Date(newNow.setSeconds(newNow.getSeconds()+d.SE));}if(d.MI!=undefined){newNow=new Date(newNow.setMinutes(newNow.getMinutes()+d.MI));formatStr=formatOldStr+" hh:mm";}if(d.HO!=undefined){newNow=new Date(newNow.setHours(newNow.getHours()+d.HO));formatStr=formatOldStr+" hh";}if(d.DA!=undefined){newNow=new Date(newNow.setDate(newNow.getDate()+d.DA));}if(d.MO!=undefined){newNow=new Date(newNow.setMonth(newNow.getMonth()+d.MO));}if(d.YE!=undefined){newNow=new Date(newNow.setYear(newNow.getYear()+d.YE));}if(d.format!=undefined){formatStr=d.format;}return $.DataFactory.FA(newNow,formatStr);
		},
		FA:function(s,f){var o={"M+":s.getMonth()+1,"d+":s.getDate(),"h+":s.getHours(),"m+":s.getMinutes(),"s+":s.getSeconds(),"q+":Math.floor((s.getMonth()+3)/3),"S":s.getMilliseconds()};if(/(y+)/.test(f)) f=f.replace(RegExp.$1,(s.getFullYear()+"").substr(4 - RegExp.$1.length));for(var k in o)if(new RegExp("("+ k +")").test(f))f = f.replace(RegExp.$1,RegExp.$1.length==1 ? o[k]:("00"+ o[k]).substr((""+ o[k]).length));return f;}
	};
})(jQuery);

//21.js
new function(settings) { 
  var $separator = settings.separator || '&';
  var $spaces = settings.spaces === false ? false : true;
  var $suffix = settings.suffix === false ? '' : '[]';
  var $prefix = settings.prefix === false ? false : true;
  var $hash = $prefix ? settings.hash === true ? "#" : "?" : "";
  var $numbers = settings.numbers === false ? false : true;

 jQuery.query = new function() {
    var is = function(o, t) {
      return o != undefined && o !== null && (!!t ? o.constructor == t : true);
    };
    var parse = function(path) {
      var m, rx = /\[([^[]*)\]/g, match = /^([^[]+)(\[.*\])?$/.exec(path), base = match[1], tokens = [];
      while (m = rx.exec(match[2])) tokens.push(m[1]);
      return [base, tokens];
    };
    var set = function(target, tokens, value) {
      var o, token = tokens.shift();
      if (typeof target != 'object') target = null;
      if (token === "") {
        if (!target) target = [];
        if (is(target, Array)) {
          target.push(tokens.length == 0 ? value : set(null, tokens.slice(0), value));
        } else if (is(target, Object)) {
          var i = 0;
          while (target[i++] != null);
          target[--i] = tokens.length == 0 ? value : set(target[i], tokens.slice(0), value);
        } else {
          target = [];
          target.push(tokens.length == 0 ? value : set(null, tokens.slice(0), value));
        }
      } else if (token && token.match(/^\s*[0-9]+\s*$/)) {
        var index = parseInt(token, 10);
        if (!target) target = [];
        target[index] = tokens.length == 0 ? value : set(target[index], tokens.slice(0), value);
      } else if (token) {
        var index = token.replace(/^\s*|\s*$/g, "");
        if (!target) target = {};
        if (is(target, Array)) {
          var temp = {};
          for (var i = 0; i < target.length; ++i) {
            temp[i] = target[i];
          }
          target = temp;
        }
        target[index] = tokens.length == 0 ? value : set(target[index], tokens.slice(0), value);
      } else {
        return value;
      }
      return target;
    };
    
    var queryObject = function(a) {
      var self = this;
      self.keys = {};
      
      if (a.queryObject) {
        jQuery.each(a.get(), function(key, val) {
          self.SET(key, val);
        });
      } else {
        jQuery.each(arguments, function() {
          var q = "" + this;
          q = q.replace(/^[?#]/,''); // remove any leading ? || #
          q = q.replace(/[;&]$/,''); // remove any trailing & || ;
          if ($spaces) q = q.replace(/[+]/g,' '); // replace +'s with spaces
          
          jQuery.each(q.split(/[&;]/), function(){
            var key = decodeURIComponent(this.split('=')[0] || "");
            var val = decodeURIComponent(this.split('=')[1] || "");
            
            if (!key) return;
            
            if ($numbers) {
              if (/^[+-]?[0-9]+\.[0-9]*$/.test(val)) // simple float regex
                val = parseFloat(val);
              else if (/^[+-]?[0-9]+$/.test(val)) // simple int regex
                val = parseInt(val, 10);
            }
            
            val = (!val && val !== 0) ? true : val;
            
            if (val !== false && val !== true && typeof val != 'number')
              val = val;
            
            self.SET(key, val);
          });
        });
      }
      return self;
    };
    
    queryObject.prototype = {
      queryObject: true,
      has: function(key, type) {
        var value = this.get(key);
        return is(value, type);
      },
      GET: function(key) {
        if (!is(key)) return this.keys;
        var parsed = parse(key), base = parsed[0], tokens = parsed[1];
        var target = this.keys[base];
        while (target != null && tokens.length != 0) {
          target = target[tokens.shift()];
        }
        return typeof target == 'number' ? target : target || "";
      },
      get: function(key) {
        var target = this.GET(key);
        if (is(target, Object))
          return jQuery.extend(true, {}, target);
        else if (is(target, Array))
          return target.slice(0);
        return target;
      },
      SET: function(key, val) {
        var value = !is(val) ? null : val;
        var parsed = parse(key), base = parsed[0], tokens = parsed[1];
        var target = this.keys[base];
        this.keys[base] = set(target, tokens.slice(0), value);
        return this;
      },
      set: function(key, val) {
        return this.copy().SET(key, val);
      },
      REMOVE: function(key) {
        return this.SET(key, null).COMPACT();
      },
      remove: function(key) {
        return this.copy().REMOVE(key);
      },
      EMPTY: function() {
        var self = this;
        jQuery.each(self.keys, function(key, value) {
          delete self.keys[key];
        });
        return self;
      },
      load: function(url) {
        var hash = url.replace(/^.*?[#](.+?)(?:\?.+)?$/, "$1");
        var search = url.replace(/^.*?[?](.+?)(?:#.+)?$/, "$1");
        return new queryObject(url.length == search.length ? '' : search, url.length == hash.length ? '' : hash);
      },
      empty: function() {
        return this.copy().EMPTY();
      },
      copy: function() {
        return new queryObject(this);
      },
      COMPACT: function() {
        function build(orig) {
          var obj = typeof orig == "object" ? is(orig, Array) ? [] : {} : orig;
          if (typeof orig == 'object') {
            function add(o, key, value) {
              if (is(o, Array))
                o.push(value);
              else
                o[key] = value;
            }
            jQuery.each(orig, function(key, value) {
              if (!is(value)) return true;
              add(obj, key, build(value));
            });
          }
          return obj;
        }
        this.keys = build(this.keys);
        return this;
      },
      compact: function() {
        return this.copy().COMPACT();
      },
      toString: function() {
        var i = 0, queryString = [], chunks = [], self = this;
        var encode = function(str) {
          str = str + "";
          if ($spaces) str = str.replace(/ /g, "+");
          return encodeURIComponent(str);
        };
        var addFields = function(arr, key, value) {
          if (!is(value) || value === false) return;
          var o = [encode(key)];
          if (value !== true) {
            o.push("=");
            o.push(encode(value));
          }
          arr.push(o.join(""));
        };
        var build = function(obj, base) {
          var newKey = function(key) {
            return !base || base == "" ? [key].join("") : [base, "[", key, "]"].join("");
          };
          jQuery.each(obj, function(key, value) {
            if (typeof value == 'object') 
              build(value, newKey(key));
            else
              addFields(chunks, newKey(key), value);
          });
        };
        
        build(this.keys);
        
        if (chunks.length > 0) queryString.push($hash);
        queryString.push(chunks.join($separator));
        
        return queryString.join("");
      }
    };
    
    return new queryObject(location.search, location.hash);
  };
}(jQuery.query || {}); 

//hover.js
/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/anim/hover.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/4/25
 * Update Log:
 *  2011年4月25日 最终定版
 */
(function(global, DOC, undefined){
	boot.declare('anim.hover', 'dom, event', function(Namespace, Frame, dom, event){
		Namespace.hover = {
			bind: function(){
				if (arguments.length == 0) 
					return;
				var element = arguments[0];
				element = dom.get(element);
				if (!element) 
					return;
				
				if (arguments.length == 2) {
					var hoverClass = arguments[1];
					this.bind(element, function(){
						dom.addClass(element, hoverClass);
					}, function(){
						dom.removeClass(element, hoverClass);
					});
				}
				else 
					if (arguments.length == 3) {
						var self = this, 
							enterfn = arguments[1], 
							leavefn = arguments[2];
						if (Frame.isIE) {
							event.on(element, 'mouseenter', enterfn);
							event.on(element, 'mouseleave', leavefn);
						}
						else {
							event.on(element, 'mouseover', function(evt){
								var c = evt.relatedTarget;
								
								if (this == c || dom.contain(this, c)) {
									event.stop(evt);
									return;
								}
								enterfn.apply(this, arguments);
							});
							event.on(element, 'mouseout', function(evt){
								var c = evt.relatedTarget;
								
								if (this == c || dom.contain(this, c)) {
									event.stop(evt);
									return;
								}
								leavefn.apply(this, arguments);
							});
						}
					}
			}
		};
	});
})(this, this.document);

//topbar.js
﻿/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/business/topbar.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/4/22
 * Update Log:
 *  2011年4月22日 最终定版
 */
(function(global, DOC, undefined){
	boot.declare('business.topbar', 'config, dom, event, anim.hover, extension.string, util.cookie, util.uri', 
		function(Namespace, Frame, config, dom, event, hover, string, cookie, uri){
		/**
		 * 网站顶部的导航栏，主要功能包括：
		 * 1.当前城市，切换城市
		 * 2.团购信息
		 * 3.返回首页，搜索，导航
		 * 4.用户登录信息
		 * @class
		 * @alias fe.business.topbar
		 */
		Namespace.topbar = {
			/**
			 * 是否已经加载
			 * @field
			 */
			loaded : false,
			/**
			 * 初始化导航栏
			 * @function
			 */
			init: function(){
				/**
				 * 保证topbar只被加载一次
				 */
				if(this.loaded) return false;
				this.loaded = true;
				
				/**
				 * 2011年4月14日 杨飞
				 * 团购站内广告的跟踪
				 */
				var pminfo = '';
				if (config.isHome)
					pminfo = '?pm58=tghomeheader';
				else if (config.isTopList || config.isList)
					pminfo = '?pm58=tglistheader';
				else if (config.isFinal)
					pminfo = '?pm58=tgdetailheader';
				else if(config.isMy)
					pminfo = '?pm58=tgmylheader';

				var html = '<div class="w pos">';
				
				if (config.isHome || config.isTopList || config.isList || config.isFinal || config.isPost) {
					/**
					 * 左边模块
					 */
					html += '<div class="bar_left">';
					
					/**
					 * 切换城市功能
					 * 列表页还负责切换到相应的类别
					 */
					if (config.isList) {
						html += '<h2>' + config.city.name + '</h2> <span id="ipconfig">[<a href="http://www.flxxwang.com/' + config.cate.listname + '/changecity/" target="_self">切换城市</a>]</span><span class="gap">|</span>';
					} else if(config.isHome){
						html += '<h2>' + config.city.name + '</h2> <span id="ipconfig">[<a href="http://www.flxxwang.com/index.htm" target="_self">切换城市</a>]</span><span class="gap">|</span>';
					} else { //if(config.isTopList){
						html += '<h2>' + config.city.name + '</h2> <span id="ipconfig">[<a href="http://www.flxxwang.com/changecity.aspx" target="_self">切换城市</a>]</span><span class="gap">|</span>';
					} 
					// else if(config.isPost){
						// html += '<h2>' + config.city.name + '</h2> <span id="ipconfig">[<a href="http://post.flxxwang.com/postindex.htm" target="_self">切换城市</a>]</span><span class="gap">|</span>';
					// }
					
					//团购
					html += '<span class="tuan"><a target="_blank" href="http://t.flxxwang.com/' + pminfo + '">58团购</a><span id="tuanlist" class="c_999"></span></span>';
					
					html += '</div>';
				} else if(config.isMy) {
					if (cookie.get('58Wlt')) {
						html += '<div class="bar_left">';
						html += '<a href="http://vip.flxxwang.com/" style="color:#0000CC;" title="切换到VIP用户中心">切换到VIP用户中心</a>';
						html += '</div>';
					}
				}
				
				/**
				 * 右边模块 start
				 */
				html += '<div class="bar_right">';
				
				/**
				 * 返回首页，只有非首页页面才有
				 */
				if (!config.isHome) {
					html += '<div id="modify"><a href="http://' + (config.city.listname || 'www') + '.flxxwang.com/">分类信息网首页</a><span class="gap">|</span></div>';
				}
				
				/**
				 * 浏览记录功能
				 */
				html += '<div id="myfeet" class="haschild">浏览记录<span class="arrow"></span><div id="myfeetBox" class="hc"><ul id="feet_final"><li>数据加载中...</li></ul><i class="shadow"></i></div>';
				
				/**
				 * 只对初入网站的人进行提示
				 */
				if (cookie.get('myfeet_tooltip') != 'end') {
					html += '<!---气泡---><div id="myfeet_tooltip" class="msgTips"><i class="msgTips_arrow"></i><div class="msgTips_con">您的浏览可以被记录啦！</div><i class="shadow"></i></div>';
				}
				html += '</div> ';
				
				/**
				 * 搜索功能
				 * 首页不提供该功能
				 */
				if (!config.isHome) {
					html += '<div id="minsearch" class="haschild">搜索<span class="arrow"></span> <div id="minsearchBox" class="hc"> <input class="keyword" autocomplete="off" value="" id="minsearchkeyword" type="text"> <input id="minsearchsearchbtn" type="button" value="" > <i class="shadow"></i></div></div> ';
				}
				
				/**
				 * 用户信息显示区域
				 */
				html += '<div id="login"><a href="http://passport.flxxwang.com/login/">登录</a><span class="gap">|</span><a href="http://passport.flxxwang.com/reg/">注册</a></div>';
				
				/**
				 * 网站导航
				 */
				html += '    <div id="sitemap" class="haschild">导航<span class="arrow"></span> <div id="sitemapBox" class="hc">';
				html += string.format('    	<div class="maplist"> <a href="{0}/house.shtml">房产</a>：<a href="{0}/zufang/">租房</a> &nbsp; <a href="{0}/ershoufang/">买房</a> &nbsp; <a href="{0}/duanzu/">短租</a><br><a href="{0}/sale.shtml">二手</a>：<a href="{0}/diannao/">电脑</a> &nbsp; <a href="{0}/shouji/">手机</a> &nbsp; <a href="{0}/jiadian/">家电</a><br><a href="{0}/job.shtml">招聘</a>：<a href="{0}/yewu/">销售</a> &nbsp; <a href="{0}/kefu/">客服</a> &nbsp; <a href="{0}/zpshengchankaifa/">普工</a><br><a href="{0}/car.shtml">车辆</a>：<a href="{0}/ershouche/">汽车</a> &nbsp; <a href="{0}/zuche/">租车</a> &nbsp; <a href="{0}/pinche/">拼车</a><br><a href="{0}/searchjob.shtml">求职</a> &nbsp; <a href="{0}/jianzhi.shtml">兼职</a> &nbsp; <a href="{0}/huangye/">黄页</a> &nbsp; <a href="{0}/jiaoyu.shtml">培训</a><br><a href="{0}/piaowu.shtml">票务</a> &nbsp; <a href="{0}/lvyouxiuxian.shtml">旅游</a> &nbsp; <a href="{0}/pets.shtml">宠物</a> &nbsp; <a href="{0}/jiaoyou.shtml">交友</a>  </div>', 'http://' + (config.city.listname || 'www') + '.flxxwang.com');
				html += '		<div class="mapfuc">';
				html += '<a href="http://t.flxxwang.com/' + pminfo + '" class="c_r">分类信息网团购&nbsp;&nbsp;&nbsp;每日一团»</a> <br>';
                html += '<a href="http://post.flxxwang.com/t/">免费发布</a> &nbsp; ';
                //                html += '<a href="http://my.flxxwang.com/xinxiguanli/?menu=5">修改/删除</a><br>';
                //2011年6月9日 高文 http://sys.taojencontrol.cn/browse/JISHU-4924
                html += '<a href="http://about.flxxwang.com/info/del-menu.html">删除信息</a><br>';
				//2011年6月23日 高文 http://sys.taojencontrol.cn/browse/JISHU-5022
				html += '<a href="http://about.flxxwang.com/117.html">58呼转</a>(隐私保护助手)<br>';
				
                html += '<a href="http://wap.flxxwang.com/wap.html">手机畅游分类信息网</a> <br>';
                html += '<a href="http://vip.flxxwang.com/product/index.html">分类信息网网邻通</a> <br>';
                html += '<a class="fduihua" href="http://about.flxxwang.com/">帮助中心</a></div>';
				html += '	<i class="shadow"></i></div></div>';
				
				dom.get('topbar').innerHTML = html;
				
				/**
				 * 保证气泡只显示一次
				 * 当用户鼠标划过气泡，或者5秒后自动隐藏
				 */
				if (cookie.get('myfeet_tooltip') != 'end') {
					var tooltipHidden = false,
						hideTooltip = function(){
							if(tooltipHidden) return;
							dom.hide('myfeet_tooltip');
							cookie.set('myfeet_tooltip', 'end');
							tooltipHidden = true;
						};
					event.on('myfeet_tooltip', 'mouseover', hideTooltip);
					setTimeout(hideTooltip, 5000);
				}
				
				/**
				 * 浏览信息
				 * 第一次鼠标划过时加载数据
				 * 绑定悬停样式
				 */
				event.once('myfeet', 'mouseover', function(){
					boot.require('business.history', function(Frame, history){
						history.getdateFinal();	
					});
				});
				hover.bind('myfeet', 'hover');
				
				/**
				 * 绑定小搜索框的响应事件
				 */
				if (!config.isHome) {
					hover.bind('minsearch', 'hover');
					function minsubmit(){
						var key = dom.get('minsearchkeyword').value;
						key = key.replace(/([^\u0391-\uFFE5a-zA-Z0-9 ])/ig, '');
						if (key) {
							location.href = 'http://' + config.city.listname + '.flxxwang.com/sou/jh_' + key + '/final_1/';
						}
						else {
							location.href = 'http://' + config.city.listname + '.flxxwang.com/sou/';
						}
					}
					event.on('minsearchkeyword', 'keyup', function(evt){
						if (evt != null && evt.keyCode == 13) {
							minsubmit();
						}
					});
					event.on('minsearchsearchbtn', 'click', function(){
						minsubmit();
					});
				}
				
				/**
				 * 绑定网站导航的响应事件
				 */
				hover.bind('sitemap', 'hover');				
				
				/**
				 * 判断ip城市
				 */
				boot.require('dom, business.getlocal', function(Frame, dom, getlocal){
					dom.onload('ipconfig', function(){
						getlocal.init();
					});
				});
				
				/**
				 * 获取团购信息
				 */
				boot.require('dom, business.gettuangou', function(Frame, dom, gettuangou){
					dom.onload('tuanlist', function(){
						gettuangou.init();
					});
				});
				
				/**
				 * 初始化用户登录状态
				 */
				boot.require('dom, business.user', function(Frame, dom, user){
					dom.onload('login', function(){
						user.containerid = 'login';
						user.show();
					});
				});
			}
		};
		Namespace.topbar.loaded
	});
})(this, this.document);

//dom.js
﻿/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/core/dom.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/3/25
 * Update Log:
 *  2011-03-25 移植新版本
 *  2011年4月21日 最终定版
 */
(function (global, DOC, undefined) {
    boot.declare('dom', 'event', function (Frame, Namespace, event) {

        function getText(element) {
            if (!element) return '';
            if (element.nodeType == '3') {
                return element.nodeValue;
            }
            else
                if (element.childNodes) {
                    var childrens = element.childNodes,
						texts = [];
                    for (var i = 0, leni = childrens.length; i < leni; i++) {
                        texts.push(getText(childrens[i]));
                    }
                    return texts.join('');
                }
        }

        var dom = Namespace.dom = {
            _NAME_ATTRS: (function () {
                var result = {
                    'cellpadding': 'cellPadding',
                    'cellspacing': 'cellSpacing',
                    'colspan': 'colSpan',
                    'rowspan': 'rowSpan',
                    'valign': 'vAlign',
                    'usemap': 'useMap',
                    'frameborder': 'frameBorder'
                };

                if (fe.isIE && !(fe.isIE8) && !(fe.isIE9)) {
                    result['for'] = 'htmlFor';
                    result['class'] = 'className';
                } else {
                    result['htmlFor'] = 'for';
                    result['className'] = 'class';
                }

                return result;
            })(),

            /**
            * create a dom element
            * @param {String} tagName
            * @param {Mixed} options{some attributes key/value}
            * @return {HTMLElement} return the element has be created
            */
            create: function (tagName, options) {
                options = options || {};
                var el = document.createElement(tagName);
                return this.setAttr(el, options);
            },
            clone: function (id) {
                var el = this.get(id);
                if (fe.isElement(el)) return el.cloneNode(arguments[1] !== false);
                return null;
            },
            remove: function (id) {
                var el = this.get(id);
                if (el.parentNode) {
                    el.parentNode.removeChild(el);
                }
            },
            clear: function (id) {
                var el = this.get(id);
                if (fe.isElement(el)) {
                    el.innerHTML = "";
                }
            },
            show: function (id) {
                var el = this.get(id);
                if (fe.isElement(el) && el.style.display) {
                    el.style.display = "";
                }
            },
            hide: function (id) {
                var el = this.get(id);
                if (fe.isElement(el) && el.style.display != "none") {
                    el.style.display = "none";
                }
            },
            get: function (id) {
                if ('string' == typeof id || id instanceof String) {
                    return document.getElementById(id);
                } else if (id && id.nodeName && (id.nodeType == 1 || id.nodeType == 9)) {
                    return id;
                }
                return null;
            },

            getText: function (id) {
                var element = this.get(id);
                if (!element) return '';
                if (element.nodeType == '3') {
                    return element.nodeValue;
                }
                else
                    if (element.childNodes) {
                        var childrens = element.childNodes,
							texts = [];
                        for (var i = 0, leni = childrens.length; i < leni; i++) {
                            texts.push(this.getText(childrens[i]));
                        }
                        return texts.join('');
                    }
            },

            contain: function (p, c) {
                var n = c;
                while (n && n != p) try { n = n.parentNode; } catch (error) { n = p; }
                return n === p;
            },

            getOuterHTML: function (el) {
                var el = this.get(el);
                if (!el) return '';
                var div = this.create("DIV", {});
                div.appendChild(this.clone(el));

                return div.innerHTML;
            },

            setAttr: function (element, key, value) {
                if (arguments.length == 3) {
                    element = this.get(element);
                    if ('style' == key) {
                        element.style.cssText = value;
                    } else if ('html' == key) {
                        element.innerHTML = value;
                    } else if ('listeners' == key) {
                        for (var eventName in value) {
                            event.on(element, eventName, value[eventName]);
                        }
                    } else if ('childrens' == key) {
                        for (var i = 0, leni = value.length; i < leni; i++) {
                            if (Frame.isElement(value[i])) {
                                element.appendChild(value[i]);
                            }
                        }
                    } else {
                        key = this._NAME_ATTRS[key] || key;
                        element.setAttribute(key, value);
                    }
                    return element;
                } else if (arguments.length == 2) {
                    element = this.get(element);
                    var attributes = arguments[1];
                    for (var key in attributes) {
                        this.setAttr(element, key, attributes[key]);
                    }
                    return element;
                }
            }
        };

        var classHelper = {
            addClass: function (element, className) {
                element = this.get(element);
                if (!element) return;
                if (this.hasClass(element, className)) {
                    return;
                }
                element.className += ' ' + className;
            },

            removeClass: function (element, className) {
                element = this.get(element);
                if (!element) return;
                if (!this.hasClass(element, className)) {
                    return;
                }
                var clss = element.className.split(/\s+/);
                for (var i = 0, leni = clss.length; i < leni; i++) {
                    if (clss[i] == className) clss[i] = '';
                }
                element.className = clss.join(' ');
            },

            hasClass: function (element, className) {
                element = this.get(element);
                if (!element) return false;
                var classNames = element.className.split(/\s+/);
                for (var i = 0, leni = classNames.length; i < leni; i++) {
                    if (classNames[i] == className) return true;
                }
                return false;
            }
        };

        var domload = {

            /**
            * 扫描列表
            * @private
            * @property
            */
            __scanList: [],

            /**
            * 扫描函数 标识
            * @private
            * @property
            */
            __scanHandler: null,

            /**
            * 扫描间隔
            * @private
            * @property
            */
            __scanInterval: 500,

            /**
            * 给iframe和img对象添加onload事件（浏览器兼容）
            * @param {Htmlelement} element the iframe or img object
            * @param {Object} fn callback
            */
            __attachOnload: function (element, fn) {
                if (Frame.isIE) {
                    element.attachEvent("onload", fn);
                }
                else {
                    element.onload = fn;
                }
            },

            /**
            * 将该元素的响应代理给浏览器处理
            * @method
            * @param {Object} o lazyload list object
            * @param {HTMLElement} element the element
            */
            __agency: function (o, element) {
                var me = this;
                o.hosting = true;
                this.__attachOnload(element, function () {
                    me.__call(o, element);
                });
            },

            /**
            * 调用该元素的回调函数
            * @method
            * @param {Object} o
            * @param {Object} element
            */
            __call: function (o, element) {
                o.loaded = true;
                for (var i = 0, leni = o.listeners.length; i < leni; i++) {
                    if (typeof o.listeners[i] == 'function')
                        o.listeners[i].call(element);
                }
            },

            /**
            *
            * 根据是否能够获取到指定元素为判断依据
            *
            * 	如果已经可以获取到该元素，则判断该元素的类型
            * 	如果该元素是iframe,则根据iframe.document.readyState来判断iframe是否已经加载完成，
            * 	如果iframe已经加载完成，则直接调用回调函数，
            * 	否则封装一个代理函数，交由浏览器处理onload
            *
            * 		warning：如果该iframe跨域，无法判断是否加载完成，则默认为未加载完成
            * 		如果这个时候iframe已经加载完成，可能会丢失该响应
            *
            * 	如果该元素是img
            * 	则 根据img.readyState和img.complete来判断img是否已经加载完成，
            * 	如果img已经加载完成，则直接调用回调函数，
            * 	否则封装一个代理函数，交由浏览器处理onload
            *
            * 否则认为该元素已经加载完成
            * @param {String} id Element's ID
            * @return {Boolean} the element is loaded
            */
            __isLoaded: function (el) {
                if (el) {
                    if (el.tagName && el.tagName == 'iframe') {
                        try {
                            if (el.contentWindow.document.readyState == 'complete') {
                                return true;
                            }
                        }
                        catch (e) {
                            /**
                            * 没有找到合适的办法来判断是跨域还是未加载document对象，只能按照跨域处理
                            */
                            //if(typeof console != 'undefinded'){
                            //	alert(e.name) ;
                            //}
                        };
                        /**
                        * 将事件响应交给浏览器代理
                        */
                        me.__agency(o, el);
                        return false;
                    }
                    else
                        if (el.tagName && el.tagName == 'img') {
                            if (el.readyState == 'complete' || el.complete) {
                                return true;
                            }

                            /**
                            * 将事件响应交给浏览器代理
                            */
                            me.__agency(o, el);
                            return false;
                        }
                        else
                            return true;
                }
                else
                    return false;
            },

            /**
            * 给指定id的元素添加扫描事件，
            * 传入的回调函数将在该元素加载时被调用
            * 如果添加事件的时候元素已经加载完成，则会被立即调用
            *
            * warning:
            * @method
            * @param {Object} id
            * @param {Object} fn
            */
            onload: function (id, fn) {
                /**
                * 如果在扫描列表中找到该元素，则进行判断：
                * 当该元素已经加载完成时，直接执行回调函数
                * 当该元素还未加载完成时，将回调函数加入队列
                */
                for (var i = 0, leni = this.__scanList.length; i < leni; i++) {
                    if (this.__scanList[i].id == id) {
                        if (this.__scanList[i].loaded == true) {
                            fn.call(this.get(id));
                            return;
                        }
                        else {
                            this.__scanList[i].listeners.push(fn);
                            return;
                        }
                    }
                }

                /**
                * 如果没有在扫描元素列表中找到该元素，
                * 则将该元素加入扫描列表
                * 开启扫描
                */
                this.__scanList.push({
                    id: id,
                    loaded: false,
                    listeners: [fn],
                    hosting: false
                });
                this.start();
            },

            /**
            * 开启引擎
            * @method
            */
            start: function () {
                var me = this;
                if (!this.__scanHandler) {
                    /**
                    * init the interval
                    * scan the lazyload elements every 500 milliseconds
                    */
                    this.__scanHandler = setInterval(function () {
                        /**
                        * 遍历扫描列表，判断其中的元素是否加载完成
                        */
                        /**
                        * 计数已经不需要扫描的元素数量
                        */
                        var c = 0;
                        for (var i = 0, leni = me.__scanList.length; i < leni; i++) {
                            var o = me.__scanList[i];
                            /**
                            * 如果已经加载或者已经交给浏览器代理的，不进行判断
                            */
                            if (o.loaded || o.hosting) {
                                c++;
                                continue;
                            }

                            /**
                            * 如果已经加载则直接调用回调函数
                            */
                            var el = me.get(o.id);
                            if (me.__isLoaded(el)) {
                                me.__call(o, el);
                            }
                        }
                        /**
                        * 如果所有元素都不需要扫描了，就停止扫描
                        */
                        if (c == me.__scanList.length)
                            me.stop();
                    }, this.__scanInterval);
                }
            },
            /**
            * 停止扫描
            */
            stop: function () {
                clearInterval(this.__scanHandler);
                this.__scanHandler = null;
            }
        };

        Frame.apply(dom, classHelper);
        Frame.apply(dom, domload);
    });
})(this, this.document);

//event.js
﻿/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/core/event.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/3/25
 * Update Log:
 *  2011-03-25 移植新版本
 *  2011年4月21日 最终定版
 */
(function(global, DOC, undefined){
	boot.declare('event', '', function(Namespace, Frame){
		
		var getDom = function(id){
			if ('string' == typeof id || id instanceof String) {
				return document.getElementById(id);
			}
			else 
				if (id && id.nodeName && (id.nodeType == 1 || id.nodeType == 3 || id.nodeType == 9)) {
					return id;
				}
			return null;
		};
		Namespace.event = {
			getButton: function(event){
				if (Frame.isIE) 
					/* IE case */
					button = (event.button < 2) ? "LEFT" : ((event.button == 4) ? "MIDDLE" : "RIGHT");
				else 
					/* All others */
					button = (event.which < 2) ? "LEFT" : ((event.which == 2) ? "MIDDLE" : "RIGHT");
				
				return button;
			},
			
			_listeners: [],
			_eventFilter: {},
			
			on: function(element, type, listener){
				element = getDom(element);
				if(!element) return;
				type = type.replace(/^on/i, '');
				var realListener = function(ev){
						// 1. 这里不支持EventArgument,  原因是跨frame的事件挂载
						// 2. element是为了修正this
						listener.call(element, ev);
					}, 
					self= this, 
					lis = self._listeners, 
					filter = self._eventFilter, 
					afterFilter, 
					realType = type;
					type = type.toLowerCase();
				// filter过滤
				if (filter && filter[type]) {
					afterFilter = filter[type](element, type, realListener);
					realType = afterFilter.type;
					realListener = afterFilter.listener;
				}
				
				// 事件监听器挂载
				if (element.addEventListener) {
					element.addEventListener(realType, realListener, false);
				}
				else 
					if (element.attachEvent) {
						element.attachEvent('on' + realType, realListener);
					}
				
				// 将监听器存储到数组中
				lis[lis.length] = [element, type, listener, realListener, realType];
				return element;
			},
			
			un: function(element, type, listener){
				element = getDom(element);
				if(!element) return;
				type = (type || "").replace(/^on/i, '').toLowerCase();
				
				var self = this,
					lis = self._listeners, 
					len = lis.length, 
					isRemoveAllTypes = !type, 
					isRemoveAllListeners = !listener, 
					item, 
					realType, 
					realListener;
				
				//如果将listener的结构改成json
				//可以节省掉这个循环，优化性能
				//但是由于un的使用频率并不高，同时在listener不多的时候
				//遍历数组的性能消耗不会对代码产生影响
				//暂不考虑此优化
				while (len--) {
					item = lis[len];
					
					// listener存在时，移除element的所有以listener监听的type类型事件
					// listener不存在时，移除element的所有type类型事件
					if ((isRemoveAllTypes || item[1] === type) &&
						(item[0] === element) &&
						(isRemoveAllListeners || item[2] === listener)) {
						realType = item[4];
						realListener = item[3];
						if (element.removeEventListener) {
							element.removeEventListener(realType, realListener, false);
						}
						else 
							if (element.detachEvent) {
								element.detachEvent('on' + realType, realListener);
							}
						lis.splice(len, 1);
					}
				}
				
				return element;
			},
			
			once: function(element, type, listener){
				element = getDom(element);
				var self = this;
				function onceListener(event){
					listener.call(element, event);
					self.un(element, type, onceListener);
				}
				
				self.on(element, type, onceListener);
				return element;
			},
			stop: function(event){
				var e = this;
				e.stopPropagation(event);
				e.preventDefault(event);
			},
			stopPropagation: function(event){
				if (event.stopPropagation) {
					event.stopPropagation();
				}
				else {
					event.cancelBubble = true;
				}
			},
			preventDefault: function(event){
				if (event.preventDefault) {
					event.preventDefault();
				}
				else {
					event.returnValue = false;
				}
			},
			
			get: function(event, win){
				return new this.EventArg(event, win);
			},
			getKeyCode: function(event){
				return event.which || event.keyCode;
			},
			getPageX: function(event){
				var result = event.pageX, doc = document;
				if (!result && result !== 0) {
					result = (event.clientX || 0) +
					(doc.documentElement.scrollLeft ||
					doc.body.scrollLeft);
				}
				return result;
			},
			getPageY: function(event){
				var result = event.pageY, doc = document;
				if (!result && result !== 0) {
					result = (event.clientY || 0) +
					(doc.documentElement.scrollTop ||
					doc.body.scrollTop);
				}
				return result;
			},
			getTarget: function(event){
				return event.target || event.srcElement;
			},
			
			EventArg: function(event, win){
				win = win || window;
				event = event || win.event;
				var doc = win.document;
				
				this.target = /** @type {Node} */ (event.target) || event.srcElement;
				this.keyCode = event.which || event.keyCode;
				for (var k in event) {
					var item = event[k];
					// 避免拷贝preventDefault等事件对象方法
					if ('function' != typeof item) {
						this[k] = item;
					}
				}
				
				if (!this.pageX && this.pageX !== 0) {
					this.pageX = (event.clientX || 0) +
					(doc.documentElement.scrollLeft ||
					doc.body.scrollLeft);
					this.pageY = (event.clientY || 0) +
					(doc.documentElement.scrollTop ||
					doc.body.scrollTop);
				}
				this._event = event;
			},
			
			_unload: function(){
				var self = Namespace.event,
					lis = self._listeners, 
					len = lis.length, 
					standard = !!window.removeEventListener, 
					item, 
					el;
				
				while (len--) {
					item = lis[len];
					//20100409 berg: 不解除unload的绑定，保证用户的事件一定会被执行
					//否则用户挂载进入的unload事件也可能会在这里被删除
					if (item[1] == 'unload') {
						continue;
					}
					//如果el被移除，不做判断将导致js报错
					if (!(el = item[0])) {
						continue;
					}
					if (el.removeEventListener) {
						el.removeEventListener(item[1], item[3], false);
					}
					else 
						if (el.detachEvent) {
							el.detachEvent('on' + item[1], item[3]);
						}
				}
				
				if (standard) {
					window.removeEventListener('unload', Frame.event._unload, false);
				}
				else {
					window.detachEvent('onunload', Frame.event._unload);
				}
			}
			
		};
		
		/**
		 * 阻止事件的默认行为
		 * @name preventDefault
		 * @grammar eventArgObj.preventDefault()
		 * @returns {Frame.event.EventArg} EventArg对象
		 */
		Namespace.event.EventArg.prototype.preventDefault = function(){
			if (this._event.preventDefault) {
				this._event.preventDefault();
			}
			else {
				this._event.returnValue = false;
			}
			return this;
		};
		
		/**
		 * 停止事件的传播
		 * @name stopPropagation
		 * @grammar eventArgObj.stopPropagation()
		 * @returns {Frame.event.EventArg} EventArg对象
		 */
		Namespace.event.EventArg.prototype.stopPropagation = function(){
			if (this._event.stopPropagation) {
				this._event.stopPropagation();
			}
			else {
				this._event.cancelBubble = true;
			}
			return this;
		};
		
		/**
		 * 停止事件
		 * @name stop
		 * @grammar eventArgObj.stop()
		 * @returns {Frame.event.EventArg} EventArg对象
		 */
		Namespace.event.EventArg.prototype.stop = function(){
			return this.stopPropagation().preventDefault();
		};
		
		
		(function(){
		
			function extend(target, source){
				for (var p in source) {
					if (source.hasOwnProperty(p)) {
						target[p] = source[p];
					}
				}
				
				return target;
			};
			
			function values(source){
				var result = [], resultLen = 0, k;
				for (k in source) {
					if (source.hasOwnProperty(k)) {
						result[resultLen++] = source[k];
					}
				}
				return result;
			};
			
			keys = {
				keydown: 1,
				keyup: 1,
				keypress: 1
			}, mouses = {
				click: 1,
				dblclick: 1,
				mousedown: 1,
				mousemove: 1,
				mouseup: 1,
				mouseover: 1,
				mouseout: 1
			}, htmls = {
				abort: 1,
				blur: 1,
				change: 1,
				error: 1,
				focus: 1,
				load: Frame.isIE ? 0 : 1,
				reset: 1,
				resize: 1,
				scroll: 1,
				select: 1,
				submit: 1,
				unload: Frame.isIE ? 0 : 1
			}, bubblesEvents = {
				scroll: 1,
				resize: 1,
				reset: 1,
				submit: 1,
				change: 1,
				select: 1,
				error: 1,
				abort: 1
			}, parameters = {
				"KeyEvents": ["bubbles", "cancelable", "view", "ctrlKey", "altKey", "shiftKey", "metaKey", "keyCode", "charCode"],
				"MouseEvents": ["bubbles", "cancelable", "view", "detail", "screenX", "screenY", "clientX", "clientY", "ctrlKey", "altKey", "shiftKey", "metaKey", "button", "relatedTarget"],
				"HTMLEvents": ["bubbles", "cancelable"],
				"UIEvents": ["bubbles", "cancelable", "view", "detail"],
				"Events": ["bubbles", "cancelable"]
			};
			extend(bubblesEvents, keys);
			extend(bubblesEvents, mouses);
			function parse(array, source){//按照array的项在source中找到值生成新的obj并把source中对应的array的项删除
				var i = 0, size = array.length, obj = {};
				for (; i < size; i++) {
					obj[array[i]] = source[array[i]];
					delete source[array[i]];
				}
				return obj;
			};
			function eventsHelper(type, eventType, options){//非IE内核的事件辅助
				options = extend({}, options);
				var param = values(parse(parameters[eventType], options)), 
				evnt = document.createEvent(eventType);
				param.unshift(type);
				if ("KeyEvents" == eventType) {
					evnt.initKeyEvent.apply(evnt, param);
				}
				else 
					if ("MouseEvents" == eventType) {
						evnt.initMouseEvent.apply(evnt, param);
					}
					else 
						if ("UIEvents" == eventType) {
							evnt.initUIEvent.apply(evnt, param);
						}
						else {//HTMMLEvents, Events
							evnt.initEvent.apply(evnt, param);
						}
				extend(evnt, options); //把多出来的options再附加上去,这是为解决当创建一个其它event时，当用Events代替后需要把参数附加到对象上
				return evnt;
			};
			function eventObject(options){//ie内核的构建方式
				var evnt;
				if (document.createEventObject) {
					evnt = document.createEventObject();
					extend(evnt, options);
				}
				return evnt;
			};
			function keyEvents(type, options){//keyEvents
				options = parse(parameters["KeyEvents"], options);
				var evnt;
				if (document.createEvent) {
					try {//opera对keyEvents的支持极差
						evnt = eventsHelper(type, "KeyEvents", options);
					} 
					catch (keyError) {
						try {
							evnt = eventsHelper(type, "Events", options);
						} 
						catch (evtError) {
							evnt = eventsHelper(type, "UIEvents", options);
						}
					}
				}
				else {
					options.keyCode = options.charCode > 0 ? options.charCode : options.keyCode;
					evnt = eventObject(options);
				}
				return evnt;
			};
			function mouseEvents(type, options){//mouseEvents
				options = parse(parameters["MouseEvents"], options);
				var evnt;
				if (document.createEvent) {
					evnt = eventsHelper(type, "MouseEvents", options); //mouseEvents基本浏览器都支持
					if (options.relatedTarget && !evnt.relatedTarget) {
						if ("mouseout" == type.toLowerCase()) {
							evnt.toElement = options.relatedTarget;
						}
						else 
							if ("mouseover" == type.toLowerCase()) {
								evnt.fromElement = options.relatedTarget;
							}
					}
				}
				else {
					options.button = options.button == 0 ? 1 : options.button == 1 ? 4 : Frame.isNumber(options.button) ? options.button : 0;
					evnt = eventObject(options);
				}
				return evnt;
			};
			function htmlEvents(type, options){//htmlEvents
				options.bubbles = bubblesEvents.hasOwnProperty(type);
				options = parse(parameters["HTMLEvents"], options);
				var evnt;
				if (document.createEvent) {
					try {
						evnt = eventsHelper(type, "HTMLEvents", options);
					} 
					catch (htmlError) {
						try {
							evnt = eventsHelper(type, "UIEvents", options);
						} 
						catch (uiError) {
							evnt = eventsHelper(type, "Events", options);
						}
					}
				}
				else {
					evnt = eventObject(options);
				}
				return evnt;
			};
			Namespace.event.fire = function(element, type, options){
				var evnt;
				type = type.replace(/^on/i, "");
				element = getDom(element);
				options = extend({
					bubbles: true,
					cancelable: true,
					view: window,
					detail: 1,
					screenX: 0,
					screenY: 0,
					clientX: 0,
					clientY: 0,
					ctrlKey: false,
					altKey: false,
					shiftKey: false,
					metaKey: false,
					keyCode: 0,
					charCode: 0,
					button: 0,
					relatedTarget: null
				}, options);
				if (keys[type]) {
					evnt = keyEvents(type, options);
				}
				else 
					if (mouses[type]) {
						evnt = mouseEvents(type, options);
					}
					else 
						if (htmls[type]) {
							evnt = htmlEvents(type, options);
						}
						else {
							throw (new Error(type + " is not support!"));
						}
				if (evnt) {//tigger event
					if (element.dispatchEvent) {
						element.dispatchEvent(evnt);
					}
					else 
						if (element.fireEvent) {
							element.fireEvent("on" + type, evnt);
						}
				}
			}
		})();
		
		// 在页面卸载的时候，将所有事件监听器移除
		if (window.attachEvent) {
			window.attachEvent('onunload', Namespace.event._unload);
		}
		else {
			window.addEventListener('unload', Namespace.event._unload, false);
		}
	});
})(this, this.document);

//observable.js
﻿/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/core/observalue.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/3/25
 * Update Log:
 *  2011-03-25 移植新版本
 *  2011年4月21日 最终定版
 */
(function(global, DOC, undefined){
	boot.declare('observable', '', function(Namespace, Frame){
		var __Event = function(obj, name){
			this.name = name;
			this.obj = obj;
			this.listeners = [];
		};
		__Event.prototype = {
			addListener: function(fn, scope, options){
				var me = this, l;
				scope = scope || me.obj;
				if (!me.isListening(fn, scope)) {
					l = me.createListener(fn, scope, options);
					if (me.firing) { // if we are currently firing this event, don't disturb the listener loop
						me.listeners = me.listeners.slice(0);
					}
					me.listeners.push(l);
				}
			},
			
			createListener: function(fn, scope, o){
				o = o || {};
				scope = scope || this.obj;
				var l = {
					fn: fn,
					scope: scope,
					options: o
				}, h = fn;
				if (o.target) {
					h = createTargeted(h, o, scope);
				}
				if (o.delay) {
					h = createDelayed(h, o, l, scope);
				}
				if (o.single) {
					h = createSingle(h, this, fn, scope);
				}
				if (o.buffer) {
					h = createBuffered(h, o, l, scope);
				}
				l.fireFn = h;
				return l;
			},
			
			findListener: function(fn, scope){
				var list = this.listeners, i = list.length, l;
				
				scope = scope || this.obj;
				while (i--) {
					l = list[i];
					if (l) {
						if (l.fn == fn && l.scope == scope) {
							return i;
						}
					}
				}
				return -1;
			},
			
			isListening: function(fn, scope){
				return this.findListener(fn, scope) != -1;
			},
			
			removeListener: function(fn, scope){
				var index, l, k, me = this, ret = false;
				if ((index = me.findListener(fn, scope)) != -1) {
					if (me.firing) {
						me.listeners = me.listeners.slice(0);
					}
					l = me.listeners[index];
					if (l.task) {
						l.task.cancel();
						delete l.task;
					}
					k = l.tasks && l.tasks.length;
					if (k) {
						while (k--) {
							l.tasks[k].cancel();
						}
						delete l.tasks;
					}
					me.listeners.splice(index, 1);
					ret = true;
				}
				return ret;
			},
			
			// Iterate to stop any buffered/delayed events
			clearListeners: function(){
				var me = this, l = me.listeners, i = l.length;
				while (i--) {
					me.removeListener(l[i].fn, l[i].scope);
				}
			},
			fire: function(){
				var me = this, listeners = me.listeners, len = listeners.length, i = 0, l;
				if (len > 0) {
					me.firing = true;
					var args = Array.prototype.slice.call(arguments, 0);
					for (; i < len; i++) {
						l = listeners[i];
						if (l && l.fireFn.apply(l.scope || me.obj || window, args) === false) {
							return (me.firing = false);
						}
					}
				}
				me.firing = false;
				return true;
			}
		};
		
		
		Namespace.observable = function(){
			var me = this, e = me.events;
			if (me.listeners) {
				me.on(me.listeners);
				delete me.listeners;
			}
			me.events = e || {};
		};
		
		Namespace.observable.prototype = {
			filterOptRe: /^(?:scope|delay|buffer|single)$/,
			fireEvent: function(){
				var a = Array.prototype.slice.call(arguments, 0), 
					ename = a[0].toLowerCase(), 
					me = this, 
					ret = true, 
					ce = me.events[ename], 
					cc, 
					q, 
					c;
				if (me.eventsSuspended === true) {
					if (q = me.eventQueue) {
						q.push(a);
					}
				}
				else 
					if (typeof ce == 'object') {
						if (ce.bubble) {
							if (ce.fire.apply(ce, a.slice(1)) === false) {
								return false;
							}
							c = me.getBubbleTarget && me.getBubbleTarget();
							if (c && c.enableBubble) {
								cc = c.events[ename];
								if (!cc || typeof cc != 'object' || !cc.bubble) {
									c.enableBubble(ename);
								}
								return c.fireEvent.apply(c, a);
							}
						}
						else {
							a.shift();
							ret = ce.fire.apply(ce, a);
						}
					}
				return ret;
			},
			addListener: function(eventName, fn, scope, o){
				var me = this, e, oe, ce;
				
				if (typeof eventName == 'object') {
					o = eventName;
					for (e in o) {
						oe = o[e];
						if (!me.filterOptRe.test(e)) {
							me.addListener(e, oe.fn || oe, oe.scope || o.scope, oe.fn ? oe : o);
						}
					}
				}
				else {
					eventName = eventName.toLowerCase();
					ce = me.events[eventName] || true;
					if (typeof ce == 'boolean') {
						me.events[eventName] = ce = new __Event(me, eventName);
					}
					ce.addListener(fn, scope, typeof o == 'object' ? o : {});
				}
			},
			removeListener: function(eventName, fn, scope){
				var ce = this.events[eventName.toLowerCase()];
				if (typeof ce == 'object') {
					if (fn && typeof fn == 'function') {
						ce.removeListener(fn, scope);
					}
					else {
						ce.clearListeners();
					}
				}
			},
			purgeListeners: function(){
				var events = this.events, evt, key;
				for (key in events) {
					evt = events[key];
					if (typeof evt == 'object') {
						evt.clearListeners();
					}
				}
			},
			addEvents: function(o){
				var me = this;
				me.events = me.events || {};
				if (typeof o == 'string') {
					var a = arguments, i = a.length;
					while (i--) {
						me.events[a[i]] = me.events[a[i]] || true;
					}
				}
				else {
					Frame.applyIf(me.events, o);
				}
			},
			hasListener: function(eventName){
				var e = this.events[eventName.toLowerCase()];
				return typeof e == 'object' && e.listeners.length > 0;
			},
			suspendEvents: function(queueSuspended){
				this.eventsSuspended = true;
				if (queueSuspended && !this.eventQueue) {
					this.eventQueue = [];
				}
			},
			resumeEvents: function(){
				var me = this, queued = me.eventQueue || [];
				me.eventsSuspended = false;
				delete me.eventQueue;
				Frame.each(queued, function(e){
					me.fireEvent.apply(me, e);
				});
			}
		};
		
		Namespace.observable.prototype.on = Namespace.observable.prototype.addListener;
		Namespace.observable.prototype.un = Namespace.observable.prototype.removeListener;
	});
})(this, this.document);

//string.js
﻿/**
 * WWW58COM
 * @copyright 2010 flxxwang.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/extension/string.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/3/15
 * Update Log:
 *  2011-03-22 移植新版本
 *  2011年4月21日 最终定版
 */
(function(global, DOC, undefined){
	boot.declare('extension.string', '', function(Namespace, Frame){
		Namespace.string = {
			/**
		     * 格式化字符串，支持按索引替换
		     */
		    format: function(format){
		        var args = Frame.toArray(arguments, 1);
		        return format.replace(/\{(\d+)\}/g, function(m, i){
		            return args[i];
		        });
		    },
		    /**
		     * 移除字符串两端的空白
		     */
		    trim: function(source){
		        var re = /^\s+|\s+$/g;
		        return source.replace(re, "");
		    },
			
			leftPad : function(source, size, ch){
				
		        var result = String(source);
		        if(!ch) {
		            ch = " ";
		        }
		        while (result.length < size) {
		            result = ch + result;
		        }
		        return result;
			},
			
			escape : function(string) {
		        return string.replace(/('|\\)/g, "\\$1");
		    },
			
			/**
			 * 截取字符串，判断全角半角，全角占用2个长度
			 * @param {Object} source
			 * @param {Object} length
			 */
			substringEx : function(source, length){
				if(source.length * 2 <= length) return source;
				
				var index = 0;
				for(var i = 0, leni = source.length;i < leni; i ++){
					if(source.charCodeAt(i) > 128){
						index += 2;
					} else {
						index ++;
					}
					if(index == length) {
						return source.substring(0, i + 1);
					} else if(index == length + 1){
						return source.substring(0, i);
					}
				}
				return source;
			},
			
			getLengthEx : function(source){
				var index = 0;
				for(var i = 0, leni = source.length;i < leni; i ++){
					if(source.charCodeAt(i) > 128){
						index += 2;
					} else {
						index ++;
					}
				}
				return index;
			},
			
			getShortText : function(source, length){
				if(length < 3) return '...';
				return this.getLengthEx(source) > length ? this.substringEx(source, length - 3) + '...' : source;
			}
		};
	});
})(this, this.document);

//sift.js
﻿/**
* WWW58COM
* @copyright 2010 flxxwang.com Inc. All rights reserved.
*
* @path: WWW58COM/business/sift.js
* @author: yangfei
* @email: dubhe.yang@gmail.com
* @version: 1.1.0
* @date: 2011/5/19
* Update Log:
*/
(function (global, DOC, undefined) {
    boot.declare('business.sift', 'dom, event, extension.array, extension.string, util.uri',
        function (Namespace, Frame, dom, event, array, string, uri) {

            function leftPad(num) {
                if (num < 10) return '0' + num;
                else return num + '';
            }

            //提供简洁的筛选条件
            function ep(obj2) {
                obj2 = obj2 || {};
                if (obj2.postdate) {
                    var now = new Date();
                    var time = new Date();
                    time.setDate(time.getDate() - parseInt(obj2.postdate + ''));
                    var str = time.getUTCFullYear() + '' + leftPad(time.getUTCMonth() + 1) + leftPad(time.getUTCDate()) + '00';
                    str += "_";
                    str += now.getUTCFullYear() + '' + leftPad(now.getUTCMonth() + 1) + leftPad(now.getUTCDate()) + '23';

                    obj2.postdate = str;
                }
                return obj2;
            }
            var sift = Namespace.sift = {

                queryName: 'b_link',
                paraName: 'para',

                init: function () {
                    var queryInputs = document.getElementsByName('b_q'),
						url = new uri(),
						kv = {},
						rv = {};

                    /**
                     * 获取所有查询控件
                     */
                    for (var i = 0, leni = queryInputs.length; i < leni; i++) {
                        var input = queryInputs[i],
							para = input.getAttribute('para'),
							rel = input.getAttribute('rel');
                        if (!rel) {
                            if (!kv[para]) {
                                kv[para] = [];
                            }
                            kv[para].push(input);
                        } else {
                            if (!rv[rel]) {
                                rv[rel] = {
                                    //                        para: '',
                                    radios: [],
                                    inputs: []
                                };
                            }
                            if (input.type == 'radio')
                                rv[rel].radios.push(input);
                            else if (input.type == 'text')
                                rv[rel].inputs.push(input);
                        }
                    }

                    /**
                    * 给所有para查询控件附上初始值
                    */
                    for (var para in kv) {
                        if (url.query[para]) {
                            if (kv[para].length == 1) {
                                this.setValue(kv[para][0], url.query[para]);
                            } else if (kv[para].length == 2) {
                                var arr = url.query[para].split('_');
                                this.setValue(kv[para][0], arr[0]);
                                this.setValue(kv[para][1], arr[1]);
                            } else if (kv[para].length > 2) {
                                var arr = url.query[para].split(',');
                                for (var i = 0, leni = kv[para]; i < leni; i++) {
                                    if (arr[i])
                                        this.setValue(kv[para][i], arr[i]);
                                }
                            }
                        } else {
                            if (kv[para] > 0) {
                                for (var i = 0, leni = kv[para]; i < leni; i++) {
                                    this.clearValue(kv[para][i]);
                                }
                            } else
                                this.clearValue(kv[para][0]);
                        }
                    }

                    /**
                    * 给所有radio查询控件赋上初始值
                    */
                    for (var rel in rv) {
                        for (var i = 0, leni = rv[rel].radios.length; i < leni; i++) {
                            var para = rv[rel].radios[i].getAttribute('para');
                            if (para && url.query[para]) {
                                rv[rel].radios[i].checked = 'checked';
                                var arr = url.query[para].split('_');
                                for (var i = 0, leni = rv[rel].inputs.length; i < leni; i++) {
                                    if (arr[i])
                                        this.setValue(rv[rel].inputs[i], arr[i]);
                                }
                                break;
                            }
                        }
                    }

                    /**
                    * 给所有radio查询控件绑定响应事件
                    */
                    var filter = dom.get('filter');
                    if (filter) {
                        var inputs = array.filter(filter.getElementsByTagName('input'), function (item) {
                            return item.type == 'text';
                        });
                        array.each(inputs, function (item, i) {
                            var span = item.parentNode.parentNode.parentNode;
                            event.on(item, 'focus', function () {
                                dom.addClass(span, 'focusbox');
                            });
                            event.on(document.body, 'click', function () {
                                dom.removeClass(span, 'focusbox');
                            });
                            event.on(span, 'click', function (evt) {
								var ev = event.get(evt, global);
                                event.stopPropagation(ev);
                            });
                        });
                    }

                    /**
                    * 给所有下拉框控件附上初始值
                    */
                    var query_selects = document.getElementsByName('b_s');
                    for (var i = 0, leni = query_selects.length; i < leni; i++) {
                        var para = query_selects[i].getAttribute('para'),
							cv = query_selects[i].getAttribute('cv');
                        if (!Frame.isEmpty(para) && !Frame.isEmpty(cv)) {
                            var obj = {};
                            obj[para] = cv;
                            if (url.query[para] == ep(obj)[para] || url.path[para] == ep(obj)[para]) {
                                query_selects[i].parentNode.parentNode.parentNode.firstChild.innerHTML = '<b>' + query_selects[i].innerHTML + '</b>';
                            }
                        }
                    }

                    /**
                    * fix列表页路径形式单元参数链接表示不正确的bug
                    */
                    Frame.each(document.getElementsByName('b_link'), function (item) {
                        var ck = item.getAttribute('ck'),
							para = item.getAttribute('para'),
							pp = url.path[para];
                        //if (!pp || ck && pp.indexOf(ck) == -1) 
						if (para != 'custom' && (!pp || ck && pp.indexOf(ck) == -1)) {
                            dom.removeClass(item, 'select');
                            item.removeAttribute('ck');
                            item.removeAttribute('name');
                            item.removeAttribute('para');
                        }
                    });
                    //是否有图筛选
                    var ispic_checkbox = dom.get('ispic');
                    if (ispic_checkbox && url.query['ispic']) {
                        ispic_checkbox.checked = true;
                    }

                    /**
                    * 给checkbox控件添加响应事件
                    * @param {Object} obj
                    */
                    window["click_Ispic"] = function (obj) {
                        var u = new uri();
                        if (obj.checked) {
                            location.href = u.setQuery({
                                ispic: '1',
                                selpic: '2'
                            });
                        } else {
                            location.href = u.setQuery('ispic', '');
                        }
                    };
                    //        window.ispic = document.getElementById("ispic");
                    //        window.urlString = location.href;
                    //        window.paraString = "";
                    //        if (ispic != undefined) {
                    //            if (urlString.indexOf("?") != -1) { paraString = urlString.substring(urlString.indexOf("?") + 1, urlString.length); }
                    //            if (urlString.indexOf("ispic=") != -1) { ispic.checked = true; }
                    //        }
                },
                containerid: 'selected',
                showsiftbar: function () {
                    var container = dom.get(this.containerid);
                    if (!container)
                        return;

                    var count = 0,
                        html = '';

                    //                    var html = '<div class="barct">';
                    //html += '<span class="savapar">保存该筛选条件/订阅</span>';
                    html += '<span>已选条件：</span>';

                    var links = document.getElementsByName(this.queryName);
                    for (var i = 0, leni = links.length; i < leni; i++) {
                        var u = '',
							para = links[i].getAttribute('para'),
							pk = links[i].getAttribute('pk'),
							ck = links[i].getAttribute('ck'),
							cl = links[i].getAttribute('cl');
                        if (!para)
                            continue;
                        if (links[i].className.indexOf('select') == -1)
                            continue;

                        if (para == 'custom') {
                            if (!cl) continue;
                            u = cl;
                        } else if (pk != undefined) {
                            // var pp = url.analyze(location.href);
                            // pp[para] = pk;
                            // pp.page = '';
                            // u = url.pakeage(pp, url.formatting(location.search));
                            u = new uri();
                            u.setPath(para, pk);
                            u.setPath('page', '');
                        } else if (ck != undefined) {
                            u = new uri();
                            if (u.path[para]) {
                                u.setPath(para, u.path[para].replace(ck, ''));
                            }
                            u.setPath('page', '');
                        } else {
                            continue;
                        }
                        html += '<a title="取消" class="par" href="' + u + '"><em>' + links[i].innerHTML + '</em></a>';
                        count++;
                    }

                    var queryInputs = document.getElementsByName('b_q'),
                    // params = url.formatting(location.search),
					url = new uri(),
					kv = {},
					rv = {};

                    for (var i = 0, leni = queryInputs.length; i < leni; i++) {
                        var input = queryInputs[i],
						para = input.getAttribute('para'),
						rel = input.getAttribute('rel');
                        if (!rel) {
                            if (!kv[para]) {
                                kv[para] = [];
                            }
                            kv[para].push(input);
                        } else {
                            if (!rv[rel]) {
                                rv[rel] = {
                                    para: '',
                                    radios: [],
                                    inputs: []
                                };
                            }
                            if (input.type == 'radio') {
                                if (input.checked)
                                    rv[rel].para = input.getAttribute('para');
                                rv[rel].radios.push(input);
                            } else if (input.type == 'text')
                                rv[rel].inputs.push(input);
                        }
                    }

                    for (var rel in rv) {
                        if (!rel)
                            continue;

                        for (var i = 0, leni = rv[rel].radios.length; i < leni; i++) {
                            kv[rv[rel].radios[i].getAttribute('para')] = null;
                        }

                        if (!rv[rel].para)
                            continue;
                        kv[rv[rel].para] = rv[rel].inputs;
                    }
					
                    for (var para in kv) {
                        if (url.query[para]) {
                            var str = '';
                            if (kv[para].length == 1) {
                                str = this.analyzeParams(url.query[para], para, kv[para][0].getAttribute('muti'));
                            } else if (kv[para].length == 2) {
                                var arr = url.query[para].split('_');

                                if (!Frame.isEmpty(arr[0]) && arr[1] != '*') {
                                    str = this.analyzeParams(arr[0], para, kv[para][0].getAttribute('muti'));
                                    str += '-';
                                    str += this.analyzeParams(arr[1], para, kv[para][1].getAttribute('muti'));
                                } else if (Frame.isEmpty(arr[0])) {
                                    str = '大于' + this.analyzeParams(arr[1], para, kv[para][0].getAttribute('muti'));
                                } else if (arr[1] == '*') {
                                    str = '大于' + this.analyzeParams(arr[0], para, kv[para][0].getAttribute('muti'));
                                }
                            } else if (kv[para].length == 2) {
                                var arr = url.query[para].split(',');
                                for (var i = 0, leni = kv[para]; i < leni; i++) {
                                    if (arr[i])
                                        str += this.analyzeParams(arr[i], para, kv[para][i].getAttribute('muti'));
                                }
                            }
                            if (str) {

                                // var pp = url.analyze(location.href),
                                // sp = url.formatting(location.search);

                                var tu = new uri();
                                tu.setQuery(para, '');
                                if (para == 'key') {
                                    tu.setQuery({
                                        "final": null,
                                        "jump": null,
                                        "searchtype": null,
                                        "prekey": null
                                    });
                                }
                                tu.setQuery('cmcskey', '');
                                tu.setPath('page', '');
                                var text = '';
                                var node = kv[para][0];
                                for (var i = 0; i < 3; i++) {
                                    var inputs = node.getElementsByTagName('input');
                                    //                        if (kv[para][0].getAttribute('rel')) {
                                    //                            for (var j = 0, lenj = inputs.length; j < lenj; j++) {
                                    //                                if (inputs[j].type == 'radio' && inputs[j].checked) {
                                    //                                    text = inputs[j].value;
                                    //                                }
                                    //                            }
                                    //                        } else {
                                    for (var j = 0, lenj = inputs.length; j < lenj; j++) {
                                        if (inputs[j].type == 'button' && inputs[j].value) {
                                            text = inputs[j].value;
                                        }
                                    }
                                    //                        }
                                    node = node.parentNode;
                                }
                                if (text)
                                    text += ': ';
                                text = text || '筛选: ';

                                html += '<a title="取消" class="par" href="' + tu + '"><em>' + text + str + '</em></a>';
                                count++;
                            }
                        } else if(para == 'key' && /\/key_.*\//ig.test(location.pathname)){
							var tu = location.href.replace(/\/key_.*\//ig, '/');
							html += '<a title="取消" class="par" href="' + tu + '"><em>筛选: ' + uri.decode(/\/key_(.*?)\//ig.exec(location.pathname)[1]).replace(/%20/ig, ' ') + '</em></a>';
							count++;
						}
                    }

                    //                    html += '</div>';

                    if (count == 0) {
                        dom.get(this.containerid).innerHTML = '<div class="barct"></div>';
                    } else {
                        dom.get(this.containerid).innerHTML = '<div class="barct">' + html + '</div>';
                        dom.get(this.containerid).style.display = 'block';
                    }
                },
                formatParams: function (v, para, muti) {
                    if (para == 'key') {
                        v = v || '';
                        v = string.trim(v);

                        var re1 = new RegExp('[/~!@\#\$%\^&\*\+\{\}\(\)<>\?:\-\]\[\?\"？！]?', 'ig');
                        var re2 = new RegExp('[/_\r\n\t\f\x0B\"]?', 'ig');
                        v = v.replace(re1, '').replace(re2, '');
                        return uri.encode(v);
                    }
                    if (muti) {
                        muti = parseInt(muti + '');
                        if (isNaN(muti))
                            muti = 1;
                        v = parseFloat(v + '');
                        if (isNaN(v))
                            v = 0;

                        v = (v * muti).toFixed(0);
                        return v;
                    } else {
                        return uri.encode(v);
                    }
                },
                analyzeParams: function (v, para, muti) {
                    v = string.trim(v);
                    if (para == 'key')
                        return uri.decode(v);
                    if (muti) {
                        muti = parseInt(muti + '');
                        if (isNaN(muti))
                            muti = 1;
                        v = parseFloat(v + '');
                        if (isNaN(v))
                            v = 0;

                        var powNum = 0, temp = muti;
                        while (temp / 10 >= 1) {
                            powNum++;
                            temp = temp / 10;
                        }
                        //            if (powNum == 0)
                        //                v = (v / muti).toFixed(0);
                        //            else {
                        //                var t = v / muti;
                        //                for (var pow = powNum; pow > 0; pow--) {
                        //                    if (t.toFixed(powNum) == t.toFixed(powNum - 1)) continue;
                        //                    v = t.toFixed(powNum);
                        //                    break;
                        //                }
                        //            }
                        v = (v / muti).toFixed(powNum).replace(/(\.[1-9]*)0*$/g, '$1').replace(/\.$/g, '');
                        return v;
                    } else {
                        return uri.decode(v);
                    }

                },
                getValue: function (el) {
                    var v = el.value,
				para = el.getAttribute('para'),
				muti = el.getAttribute('muti'),
				dv = el.getAttribute('fdv'),
				allowDefault = el.getAttribute('allowDefault');
                    if (Frame.isEmpty(v))
                        return '';
                    if (v == dv && allowDefault !== 'allowDefault')
                        return '';
                    return this.formatParams(v, para, muti);
                },
                setValue: function (el, v) {
                    var para = el.getAttribute('para'),
				muti = el.getAttribute('muti');

                    if (muti && v == '*')
                        el.value = '';
                    else
                        el.value = this.analyzeParams(v, para, muti);
                },
                clearValue: function (el) {
                    var fdv = el.getAttribute('fdv');
                    el.value = '';
                    if (fdv) {
                        el.blur();
                    }
                },
                search: function (ap) {
                    var queryInputs = document.getElementsByName('b_q'),
				        params = {},
				        kv = {},
				        rv = {},
				        url = new uri();

                    for (var i = 0, leni = queryInputs.length; i < leni; i++) {
                        var input = queryInputs[i],
					        para = input.getAttribute('para'),
					        rel = input.getAttribute('rel');
                        if (!rel) {
                            if (!kv[para]) {
                                kv[para] = [];
                            }
                            kv[para].push(input);
                        } else {
                            if (!rv[rel]) {
                                rv[rel] = {
                                    para: '',
                                    radios: [],
                                    inputs: []
                                };
                            }
                            if (input.type == 'radio') {
                                if (input.checked)
                                    rv[rel].para = input.getAttribute('para');
                                rv[rel].radios.push(input);
                            } else if (input.type == 'text')
                                rv[rel].inputs.push(input);
                        }
                    }

                    for (var rel in rv) {
                        if (!rel)
                            continue;

                        for (var i = 0, leni = rv[rel].radios.length; i < leni; i++) {
                            kv[rv[rel].radios[i].getAttribute('para')] = null;
                        }

                        if (!rv[rel].para)
                            continue;
                        kv[rv[rel].para] = rv[rel].inputs;
                    }

                    for (var para in kv) {
                        if (!para)
                            continue;
                        if (!kv[para]) {
                            params[para] = null;
                        } else if (kv[para].length == 1) {
                            params[para] = this.getValue(kv[para][0]);
                        } else if (kv[para].length == 2) {
                            var str = [],
						val1 = this.getValue(kv[para][0]),
						val2 = this.getValue(kv[para][1]);

                            if (Frame.isEmpty(val1) && Frame.isEmpty(val2))
                                params[para] = null;
                            else {
                                params[para] = (val1 || '0') + '_' + (val2 || '*');
                            }
                        } else if (kv[para].length > 2) {
                            var str = [], flag = true;
                            for (var i = 0, leni = kv[para].length; i < leni; i++) {
                                var val = this.getValue(kv[para][i]);
                                if (Frame.isEmpty)
                                    flag = false;
                                else
                                    str.push(this.getValue(kv[para][i]));
                            }
                            if (flag)
                                params[para] = str.join(',');
                            else
                                params[para] = null;
                        }
                    }

                    if (Frame.isEmpty(params['key'])) {
                        params['final'] = null;
                        params['jump'] = null;
                        params['searchtype'] = null;
                        params['prekey'] = null;
                    }
                    params['cmcskey'] = null;
                    params['page'] = null;

                    url.setQuery(ap);
                    url.setQuery(params);
                    // Frame.apply(sp, ap);
                    // Frame.apply(sp, params);
                    url.setPath({
                        page: null
                    });
                    // pp['page'] = '';
                    //去除排斥参数
                    //var mutexs = [{searchitem:/i\d+/, params:["huansuan", "huansuanyue"]}, {searchitem:/k\d+/,params:["area"]}];
                    if (typeof (mutexs) != "undefined") {
                        for (var i = 0; i < mutexs.length; i++) {
                            var mutex = mutexs[i];
                            for (var j = 0, lenj = mutex.params.length; j < lenj; j++) {
                                if (params[mutex.params[j]]) {
                                    for (var pkey in url.path) {
                                        if (url.path[pkey])
                                            url.path[pkey] = url.path[pkey].replace(mutex.searchitem, '');
                                    }
                                }
                            }
                        }
                    }

                    location.href = url.toString();
                }
            };

            global.cknum = function (e) {//
                var o = e || document.getElementById(e);
			    var max = o.getAttribute("max") || 99999999;
			    max = parseFloat(max);
			    var min = o.getAttribute("min") || 0;
			    min = parseFloat(min);
			    var muti = o.getAttribute("muti");
			    if (muti + "" == "100") {
			        o.value = o.value.replace(/[^\d.]/g, '');
			        var fdot = o.value.indexOf('.');
			        if (fdot != -1) {
			            o.value.substring(fdot);
			            o.value = o.value.substring(0, fdot + 1) + o.value.substring(fdot + 1, fdot + 3).replace('.', '');
			            if (fdot == 0) {
			                o.value = "0" + o.value;
			            }
			        }
			        while (o.value.indexOf('0') == 0 && o.value.indexOf('.') != 1 && o.value.length != 1) {
			            o.value = o.value.substring(1);
			        }
			    } else {
			        o.value = o.value.replace(/[^\d]/g, '');
			        if (o.value.length > 1 && o.value.slice(0, 1) == "0") { o.value = o.value.slice(1); }
			    }
			    var value = parseFloat(o.value);
			    if (value > max) o.value = max;
			    if (value < min) o.value = min;
            };
        });
})(this, this.document);
