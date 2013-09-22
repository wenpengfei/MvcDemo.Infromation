//Syntax Error:在线webservice压缩js时发生错误.
//gettuangou.js
﻿/**
 * WWW58COM
 * @copyright 2010 58.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/business/gettuangou.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/4/28
 * Update Log:
 */
(function(global, DOC, undefined){
	boot.declare('business.gettuangou', 'config, dom, anim.hover, extension.string, util.js', 
	function(Namespace, Frame, config, dom, hover, string, js){		
		Namespace.gettuangou = {
			interval : null,
			currentIndex : 0,
			arrayElement : [],
			init: function(){
				var self = this,
					contianer = dom.get('tuanlist');
				if (!contianer) {
					Frame.log('business.gettuangou', 'error', '找不到tuanlist元素', '');
					return;
				}
				js.jsonp('http://track.58.com/adsys/frontpage/', {}, function (data) {
					if(!data.length) return;
		            var tghtml = [];
		            for (var i = 0, leni = data.length; i < leni; i++) {
						var shorttitle = (config.modules == 'home' && screen.width >= 1280) ? string.getShortText(data[i].title, 60) : string.getShortText(data[i].title, 40);
		                tghtml.push('<a href="' + data[i].url + '" title="' + data[i].title + '" ' + (i != 0 ? 'style="display:none;"' : '') + ' target="_blank">' + shorttitle + '</a>');
		            }
		            contianer.innerHTML = "：" + tghtml.join("");
		
		            self.arrayElement = contianer.getElementsByTagName('a');
					self.start();
		            
					hover.bind(contianer, function(){
						self.stop();
					}, function(){
						self.start();
					});
		        });
			},
			stop : function(){
				clearInterval(this.interval);
			},
			start : function(){
				var self = this,
					count = self.arrayElement.length;
				self.interval = setInterval(function () {
	                if(self.arrayElement[self.currentIndex]) self.arrayElement[self.currentIndex].style.display = 'none';
	                if (self.currentIndex >= count - 1) {
	                    self.currentIndex = 0;
	                } else {
	                    self.currentIndex++;
	                }
	                if(self.arrayElement[self.currentIndex]) self.arrayElement[self.currentIndex].style.display = '';
	            }, 5000);
			}
		};
	});
})(this, this.document);

//shortcut.js
﻿/**
 * WWW58COM
 * @copyright 2010 58.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/business/shortcut.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/5/9
 * Update Log:
 */
(function(global, DOC, undefined){
	boot.declare('business.shortcut', 'dom, anim.fixed, util.offset', function(Namespace, Frame, dom, fixed, offset){		
		var shortcut = Namespace.shortcut = {
			el : null,
			interval : null,
			init : function(){
				var self = this;
				self.el = dom.create('div', {
   					title: '返回顶部',
					className: 'gotop',
					listeners : {
						click : function(){
							offset.scroll(0, self.minTop || 0);
                			self.hide();
						}
					},
					style : Frame.isIE6 ? 'position:absolute' : 'position:fixed'
   				});
   				dom.hide(self.el);
   				document.body.appendChild(self.el);
				self.start();
			},
			start : function(){
				var self = this;
				self.interval = setInterval(function(){
					self.refresh();
				}, 500);
			},
			stop : function(){
				clearInterval(self.interval);
			},
			refresh : function(){
				var self = this,
					top = offset.getClientHeight() - 100,
					light = dom.get('footer') || dom.get('header');
					left = light ? (offset.getRect(light).right == Math.min(offset.getScrollWidth(),offset.getClientWidth()) ? offset.getRect(light).right - 17 : offset.getRect(light).right) :  offset.getClientWidth() - 17;
				
				if(offset.getScrollTop() > 0){
					self.show(top, left);
				} else {
					self.hide();
				}
		   },
		   show : function(top, left){
		   		var self = this;
				self.el.style.top = top + (Frame.isIE6 ? offset.getScrollTop() : 0) + 'px';
				self.el.style.left = left + 'px';
				//fixed.bind(self.el, top, left);
	   			dom.show(self.el);
		   },
		   hide : function(){
		   		var self = this;
		   		dom.hide(self.el);
		   }
		}
	});
})(this, this.document);

//log_list.js
﻿/**
* WWW58COM
* @copyright 2010 58.com Inc. All rights reserved.
* 
* @path: WWW58COM/log/list.js
* @author: yangfei
* @email: dubhe.yang@gmail.com
* @version: 1.1.0
* @date: 2011/5/19
* Update Log:
*/
(function (global, DOC, undefined) {
    /**
    * 2011年4月20日
    * 添加对topbar的log
    * 姚中柱
    * http://sys.58control.cn/browse/JISHU-4598
    */
    boot.require('dom, event, business.gaq', function (Frame, dom, event, gaq) {
        var feetBox = dom.get('myfeetBox');
        if (feetBox) {
            var links = feetBox.getElementsByTagName('a');
            Frame.each(links, function (link) {
                event.on(link, 'click', function () {
                    _gaq.push(['pageTracker._trackEvent', 'global-toolbar', 'click', 'history-link']);
                });
            });
        }
        var sitemap = dom.get('sitemap');
        if (sitemap) {
            var links = sitemap.getElementsByTagName('a');
            Frame.each(links, function (link) {
                event.on(link, 'click', function () {
                    _gaq.push(['pageTracker._trackEvent', 'global-toolbar', 'nav-link-click', '$' + this.innerHTML]);
                });
            });
        }
        var minsearchsearchbtn = dom.get('minsearchsearchbtn');
        if (minsearchsearchbtn) {
            event.on('minsearchsearchbtn', 'click', function () {
                var key = '';
                var input = dom.get('minsearchkeyword');
                if (input) key = input.value;
                _gaq.push(['pageTracker._trackEvent', 'global-toolbar', 'search-btn-click', '$' + key]);
            });
        }
    });

    /**
    * 2011年4月20日 
    * 北京二手电脑价格排序和二手电脑、租房列表页底部发布入口添加统计代码
    * 高文 
    * http://sys.58control.cn/browse/JISHU-4649
    * 
    * ##jquery
    */
    boot.require('config', function (Frame, config) {
        if (config.cate.listname == 'diannao') {
            jQuery("#filter>div.filterbar>span:first a").click(function () {
                _gaq.push(['pageTracker._trackEvent', 'list', 'click', 'bj-ershoudiannao-sortprice']);
            });
            jQuery('#infocont>a').click(function () {
                _gaq.push(['pageTracker._trackEvent', 'list', 'click', 'bj-ershoudiannao-post-bottom']);
            });
            jQuery("#infolist>div.pager>a:contains(最新信息)").click(function () {
                _gaq.push(['pageTracker._trackEvent', 'list', 'click', 'bj-ershoudiannao-page-newmessage']);
            });
        }
    });

    /**
    * 2011年3月7日
    * 添加无搜索结果页log
    * 姚中柱
    */
    boot.require('dom, util.uri', function (Frame, dom, uri) {
        if (Frame.isElement(dom.get("noresult"))) {			
			var key = uri.decode((new uri()).query['key']),
				re = /\/(?:key_|jh_)([\u0391-\uFFE5a-zA-Z0-9 ]*)\//i,
				m = location.pathname.match(re);
			if(m && m.length == 2) {
				key = m[1];
			}			
            _gaq.push(['pageTracker._trackEvent', '58_seach_noresult', location.pathname, key]);
        }
    });

    /**
    * 2011年1月18日
    * 添加三级地标log
    * 姚中柱
    * 
    * ##jquery
    */
    boot.require('config', function (Frame, config) {
        $("#selection>div.relative>dl:contains(区域)>dd>a").click(function () {
            _gaq.push(['pageTracker._trackEvent', '58_list_local3', config.city.listname + '_' + config.cate.listname, $(this).text()]);
        });
    });
})(this, this.document);

//defaultvalue.js
/**
 * WWW58COM
 * @copyright 2010 58.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/general/defaultvalue.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/4/25
 * Update Log:
 *  2011年4月25日 最终定版
 */
(function(global, DOC, undefined){
	boot.declare('general.defaultvalue', 'event', function(Namespace, Frame, event){
		Namespace.defaultvalue = {
			elements: [],
		    interval : null,
		    /**
		    * initialize the default value on the page
		    */
		    init: function () {
		        var self = this,
					inputs = document.getElementsByTagName("input");
		        for (var i = 0, leni = inputs.length; i < leni; i++) {
		            if (inputs[i].type == "text" && !Frame.isEmpty(inputs[i].getAttribute("fdv"))) {
		                this.elements.push(inputs[i]);
		            }
		        }
		        var textareas = document.getElementsByTagName("textarea");
		        for (var i = 0, leni = textareas.length; i < leni; i++) {
		            if (!Frame.isEmpty(textareas[i].getAttribute("fdv"))) {
		                this.elements.push(textareas[i]);
		            }
		        }
		
		        for (var i = 0, len = this.elements.length; i < len; i++) {
		            event.on(this.elements[i], "focus", this.onfocus);
		            event.on(this.elements[i], "blur", this.onblur);
		            this.onfocus.call(this.elements[i]);
		            this.onblur.call(this.elements[i]);
		        }
		
		        this.interval = setInterval(function(){
					self.refresh();
				}, 1000);
		    },
		
		    onfocus: function () {
		        this.style.color = '#000';
		        if (this.value == this.getAttribute("fdv")) {
		            this.value = "";
		        }
		    },
		    onblur: function () {
		        if (this.value == "" || this.value == this.getAttribute("fdv")) {
		            this.style.color = '#999';
		            this.value = this.getAttribute('fdv');
		        }
		    },
		
		    refresh: function(){
				var self = this;
				for (var i = 0, leni = self.elements.length; i < leni; i++) {
					if (self.elements[i].value == self.elements[i].getAttribute("fdv")) {
						self.elements[i].style.color = '#999';
					}
					else {
						self.elements[i].style.color = '#000';
					}
				}
			}
		};
		Frame.init(function(){
			if(location.search.indexOf('placeholder=debug') == -1) {
				Namespace.defaultvalue.init();
			}
		});
	});
})(this, this.document);

//getlocal.js
﻿/**
 * WWW58COM
 * @copyright 2010 58.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/business/getlocal.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/4/22
 * Update Log:
 *  2011年4月22日 最终定版
 */
(function(global, DOC, undefined){
	boot.declare('business.getlocal', 'config, dom, event, util.cookie, util.js', 
	function(Namespace, Frame, config, dom, event, cookie, js){
		/**
		 * 获取 合适的城市，并提供链接
		 * 获取规则为：1.根据ip判断，2.判断省会城市
		 * @class
		 * @alias fe.business.getlocal
		 * @requires fe.config, fe.dom, fe.event, fe.util
		 */
		Namespace.getlocal = {
		
			//不需要跳转的城市
			arr1: ['bj|北京', 'tj|天津', 'sh|上海', 'cq|重庆', 'tw|台湾', 'hk|香港', 'am|澳门', 'sz|深圳', 'dl|大连', 'su|苏州', 'cn|其他'],
			
			//城市和省会对应表
			arr2: [
				["sjz|石家庄", "bd|保定", "cangzhou|沧州", "chengde|承德", "dingzhou|定州", "gt|馆陶", "hd|邯郸", "hs|衡水", "lf|廊坊", "qhd|秦皇岛", "ts|唐山", "xt|邢台", "zjk|张家口", "zd|正定", "zx|赵县", "zhangbei|张北"], 
				["zz|郑州", "ay|安阳", "changge|长葛", "hb|鹤壁", "jiaozuo|焦作", "jiyuan|济源", "kaifeng|开封", "luoyang|洛阳", "luohe|漯河", "mg|明港", "ny|南阳", "pds|平顶山", "puyang|濮阳", "sq|商丘", "smx|三门峡", "xx|新乡", "xc|许昌", "xy|信阳", "yuzhou|禹州", "yanling|鄢陵", "zk|周口", "zmd|驻马店"], 
				["hrb|哈尔滨", "dq|大庆", "dxal|大兴安岭", "hegang|鹤岗", "heihe|黑河", "jms|佳木斯", "jixi|鸡西", "mdj|牡丹江", "qqhr|齐齐哈尔", "qth|七台河", "suihua|绥化", "sys|双鸭山", "yich|伊春"], 
				["cc|长春", "bc|白城", "baishan|白山", "jl|吉林", "liaoyuan|辽源", "songyuan|松原", "sp|四平", "th|通化", "yanbian|延边"], 
				["sy|沈阳", "as|鞍山", "benxi|本溪", "cy|朝阳", "dl|大连", "dandong|丹东", "fushun|抚顺", "fx|阜新", "hld|葫芦岛", "jinzhou|锦州", "liaoyang|辽阳", "pj|盘锦", "tl|铁岭", "wfd|瓦房店", "yk|营口", "pld|庄河"], 
				["jn|济南", "bz|滨州", "dz|德州", "dy|东营", "heze|菏泽", "jining|济宁", "kl|垦利", "linyi|临沂", "lc|聊城", "lw|莱芜", "qd|青岛", "rizhao|日照", "ta|泰安", "wf|潍坊", "weihai|威海", "yt|烟台", "zb|淄博", "zaozhuang|枣庄", "zhangqiu|章丘", "zc|诸城"], 
				["hu|呼和浩特", "alsm|阿拉善盟", "bt|包头", "bycem|巴彦淖尔盟", "chifeng|赤峰", "erds|鄂尔多斯", "hlbe|呼伦贝尔", "hlr|海拉尔", "tongliao|通辽", "wuhai|乌海", "wlcb|乌兰察布", "xl|锡林郭勒盟", "xam|兴安盟"], 
				["nj|南京", "cz|常州", "dafeng|大丰", "ha|淮安", "lyg|连云港", "nt|南通", "su|苏州", "shuyang|沭阳", "suqian|宿迁", "taizhou|泰州", "wx|无锡", "xz|徐州", "yz|扬州", "yancheng|盐城", "zj|镇江"], 
				["hf|合肥", "anqing|安庆", "bengbu|蚌埠", "bozhou|亳州", "ch|巢湖", "chizhou|池州", "chuzhou|滁州", "fy|阜阳", "hn|淮南", "huaibei|淮北", "huangshan|黄山", "hexian|和县", "hq|霍邱", "la|六安", "mas|马鞍山", "suzhou|宿州", "tongling|铜陵", "tongcheng|桐城", "wuhu|芜湖", "xuancheng|宣城"], 
				["ty|太原", "changzhi|长治", "dt|大同", "jincheng|晋城", "jz|晋中", "lvliang|吕梁", "linfen|临汾", "linyixian|临猗", "qingxu|清徐", "shuozhou|朔州", "xinzhou|忻州", "yuncheng|运城", "yq|阳泉"], 
				["xa|西安", "ankang|安康", "baoji|宝鸡", "hanzhong|汉中", "sl|商洛", "tc|铜川", "wn|渭南", "xianyang|咸阳", "yanan|延安", "yl|榆林"], 
				["lz|兰州", "by|白银", "dx|定西", "gn|甘南", "jinchang|金昌", "jyg|嘉峪关", "jq|酒泉", "linxia|临夏", "ln|陇南", "pl|平凉", "qingyang|庆阳", "tianshui|天水", "wuwei|武威", "zhangye|张掖"], 
				["hz|杭州", "huzhou|湖州", "jx|嘉兴", "jh|金华", "lishui|丽水", "nb|宁波", "quzhou|衢州", "sx|绍兴", "tz|台州", "wz|温州", "yiwu|义乌", "zhoushan|舟山"], 
				["nc|南昌", "fuzhou|抚州", "ganzhou|赣州", "jj|九江", "ja|吉安", "jdz|景德镇", "px|萍乡", "sr|上饶", "xinyu|新余", "yingtan|鹰潭", "yichun|宜春", "yxx|永新"], 
				["wh|武汉", "es|恩施", "ez|鄂州", "hshi|黄石", "hg|黄冈", "jingzhou|荆州", "jingmen|荆门", "qianjiang|潜江", "shiyan|十堰", "snj|神农架", "suizhou|随州", "tm|天门", "xf|襄阳", "xiaogan|孝感", "xiantao|仙桃", "xianning|咸宁", "yc|宜昌"], 
				["cs|长沙", "changde|常德", "chenzhou|郴州", "hy|衡阳", "hh|怀化", "ld|娄底", "shaoyang|邵阳", "xiangtan|湘潭", "xiangxi|湘西", "yy|岳阳", "yongzhou|永州", "yiyang|益阳", "zhuzhou|株洲", "zjj|张家界"], 
				["gy|贵阳", "anshun|安顺", "bijie|毕节", "lps|六盘水", "qdn|黔东南", "qn|黔南", "qxn|黔西南", "tr|铜仁", "zunyi|遵义"], 
				["cd|成都", "ab|阿坝", "bazhong|巴中", "deyang|德阳", "dazhou|达州", "ga|广安", "guangyuan|广元", "ganzi|甘孜", "ls|乐山", "luzhou|泸州", "liangshan|凉山", "mianyang|绵阳", "ms|眉山", "scnj|内江", "nanchong|南充", "panzhihua|攀枝花", "suining|遂宁", "yb|宜宾", "ya|雅安", "zg|自贡", "zy|资阳"], 
				["km|昆明", "bs|保山", "cx|楚雄", "dali|大理", "diqing|迪庆", "dh|德宏", "honghe|红河", "lj|丽江", "lincang|临沧", "nujiang|怒江", "pe|普洱", "qj|曲靖", "ws|文山", "bn|西双版纳", "yx|玉溪", "zt|昭通"], 
				["xj|乌鲁木齐", "aks|阿克苏", "ale|阿拉尔", "bygl|巴音郭楞", "betl|博尔塔拉", "changji|昌吉", "hami|哈密", "ht|和田", "klmy|克拉玛依", "kel|库尔勒", "ks|喀什", "kzls|克孜勒苏", "shz|石河子", "tlf|吐鲁番", "tmsk|图木舒克", "wjq|五家渠", "yili|伊犁"], 
				["yinchuan|银川", "guyuan|固原", "szs|石嘴山", "wuzhong|吴忠", "zw|中卫"], 
				["xn|西宁", "guoluo|果洛", "huangnan|黄南", "hx|海西", "haidong|海东", "haibei|海北", "hainan|海南", "ys|玉树"], 
				["lasa|拉萨", "al|阿里", "changdu|昌都", "linzhi|林芝", "nq|那曲", "rkz|日喀则", "sn|山南"], 
				["nn|南宁", "baise|百色", "bh|北海", "chongzuo|崇左", "fcg|防城港", "gl|桂林", "gg|贵港", "hc|河池", "hezhou|贺州", "liuzhou|柳州", "lb|来宾", "qinzhou|钦州", "wuzhou|梧州", "yulin|玉林"], 
				["gz|广州", "chaozhou|潮州", "dg|东莞", "fs|佛山", "huizhou|惠州", "heyuan|河源", "jm|江门", "jy|揭阳", "mm|茂名", "mz|梅州", "qingyuan|清远", "sd|顺德", "sz|深圳", "st|汕头", "sg|韶关", "sw|汕尾", "taishan|台山", "yj|阳江", "yangchun|阳春", "yf|云浮", "zh|珠海", "zs|中山", "zhanjiang|湛江", "zq|肇庆"], 
				["fz|福州", "ly|龙岩", "nd|宁德", "np|南平", "pt|莆田", "qz|泉州", "sm|三明", "wuyishan|武夷山", "xm|厦门", "zhangzhou|漳州"], 
				["haikou|海口", "sanya|三亚", "wzs|五指山"]
			],
			
			containerid : 'ipconfig',
			cookiekey: 'ipcity',
			
			/**
			 * 初始化城市判断，首先判断当前ip，然后判断城市省会
			 * @function
			 */
			init: function(){
				var self = this;
				var v = cookie.get(self.cookiekey);
				if (v) {
					var c = v.split('|');
					if (config.city.listname == c[0]) 
						return;
					else {
						self.addCityLink(c[0], c[1]);
					}
				}
				else {
					js.jsonp("http://user.58.com/userdata/getlocal/", null, function(data){
						if (data && data.list) {
							var now = new Date();
							var day = new Date(now.getFullYear(), now.getMonth(), now.getDate() + 1);
							cookie.set(self.cookiekey, data.list + '|' + data.local, day);
							
							if (Frame.isEmpty(data.list)) 
								return;
							
							/**
							 * 如果当前选择城市和用户ip所在地不同，则提示用户ip所在地
							 * 如果当前选择城市和用户ip相同，则判断当前选择城市是否为省会，否则提示用户省会城市
							 */
							if (config.city.listname != data.list) {
								self.addCityLink(data.list, data.local);
							}
							else {
								var re = new RegExp("^" + config.city.listname + '\\|'), sh;
								for (var i = 0, leni = self.arr1.length; i < leni; i++) {
									if (re.test(self.arr1[i])) 
										return;
								}
								for (var i = 0, leni = self.arr2.length; i < leni; i++) {
									for (var j = 0, lenj = self.arr2[i].length; j < lenj; j++) {
										if (re.test(self.arr2[i][j])) {
											if (j == 0) 
												return;
											sh = self.arr2[i][0].split('|');
											self.addCityLink(sh[0], sh[1]);
											
											cookie.set(self.cookiekey, sh[0] + '|' + sh[1], day);
											break;
										}
									}
								}
							}
						}
					});
				}
			},
			/**
			 * 添加 跳转城市 链接
			 * @arguments
			 * @param {Object} 城市listname
			 * @param {Object} 城市名
			 */
			addCityLink: function(list, local){
				//list
				var self = this, 
					element = dom.get(self.containerid);
				if (!element) 
					return;
				var a = element.getElementsByTagName('a')[0];
				var na = dom.create("A", {
					id: 'link_city_change',
					href: 'http://' + list + '.58.com/' + ((config.isList || config.isFinal) && config.cate ? config.cate.listname + "/" : ""),
					target: '_self',
					html : local,
					listeners : {
						click : function(){
							cookie.set('city', list);
							cookie.set('58home', list);
						}
					}
				});
				element.insertBefore(na, a);
				element.insertBefore(a, na);
			}
		};
	});
})(this, this.document);

//history.js
﻿/**
 * WWW58COM
 * @copyright 2010 58.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/business/history.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/4/22
 * Update Log:
 *  2011年4月22日 最终定版
 */
//(function(global, DOC, undefined){
//	boot.declare('business.history', 'config, dom, extension.array, extension.string, util.localStorage', 
//	function(Namespace, Frame, config, dom, array, string, localStorage){
//		/**
//		 * Stroage暂时不确定可用
//		 */
//		Namespace.history = {
//		    nodataText: '暂无浏览记录...',
//		    
//			containerid : 'feet_final',
//			record_key : 'business.history.record',
//			record_count : 10,
//			record : function(){
//				if(config.modules != 'final') return;
//				var self = this,
//					h1s = DOC.getElementsByTagName('h1')[0],
//					title = h1s && h1s.length == 1? h1s[0].innerHTML : DOC.title,
//					url = location.href,
//					infoid = config.infoid,
//					records = localStorage.get(self.record_key) || [],
//					record = {
//						infoid : infoid,
//						title : title,
//						url : url
//					};
//				for(var j = records.length - 1; j >= 0; j --){
//					if(records[j].infoid == infoid) records.splice(j, 1);
//				};
//				records.unshift(record);
//				records = records.slice(0, self.record_count);
//				localStorage.set(self.record_key, records);
//			},
//			
//			getRecord : function(){
//				var self = this,
//					container = dom.get(self.containerid),
//					records = localStorage.get(self.record_key);
//				if(!container) return;
//				if(!records){
//					container.innerHTML = '<li>' + self.nodataText + '</li>';
//				} else {
//					var html = '',
//	                	tpl = '<li><a href="{0}">{1}</a></li>';
//	                for (var i = 0, leni = records.length; i < leni; i++) {
//	                    html += string.format(tpl, records[i].url, records[i].title.length > 16 ? records[i].title.substring(0, 14) + '...' : records[i].title);
//	                }
//	                container.innerHTML = html;
//				}
//			}
//		};		
//})(this, this.document);


(function(global, DOC, undefined){
	boot.declare('business.history', 'dom, extension.string, util.cookie, util.js', function(Namespace, Frame, dom, string, cookie, js){
		/**
		 * Stroage暂时不确定可用
		 */
		Namespace.history = {
			loadingText: '正在加载数据',
		    nodataText: '暂无浏览记录...',
		    loadfailText: '数据加载失败...',
		
		    cookie_key_final: 'final_history',
		    data_url_final: 'http://user.58.com/userdata/getinfo/',
		
		    finalRecordCount: 5,
		
		    recordFinal: function (infoid) {
		        his = cookie.get(this.cookie_key_final) || "";
		        var re = new RegExp(infoid, 'ig');
		        his = his.replace(re, '').replace(/,+/g, ',').replace(/(^,)|(,$)/g, '');
		        //        if (his.indexOf(infoid) < 0) {
		        if (Frame.isEmpty(his)) his = infoid;
		        else his = infoid + ',' + his;
		        his = his.split(',').slice(0, this.finalRecordCount).join(',');
		        cookie.set(this.cookie_key_final, his);
		        //        }
		    },
		    getdateFinal: function () {
		        var ids = cookie.get(this.cookie_key_final),
		            container = dom.get("feet_final"),
		            self = this;
		
		        if (!container) return;
		        if (ids) {
					ids = ids.split(',').slice(0, this.finalRecordCount).join(',');
		            container.innerHTML = '<li>' + this.loadingText + '</li>';
		            js.jsonp(this.data_url_final, {
		                ids: ids,
		                type: 6
		            }, function (data) {
		                if (data && data.length) {
		                    var html = '';
		                    var tpl = '<li><a href="{0}">{1}</a></li>';
		                    for (var i = 0, leni = data.length; i < leni; i++) {
		                        html += string.format(tpl, data[i].url, data[i].title.length > 16 ? data[i].title.substring(0, 14) + '...' : data[i].title);
		                    }
		                    container.innerHTML = html;
		                } else {
		                    container.innerHTML = '<li>' + self.nodataText + '</li>';
		                }
		            }, function () {
		                container.innerHTML = '<li>' + self.loadfailText + '</li>';
		            });
		        } else {
		            container.innerHTML = '<li>' + self.nodataText + '</li>';
		        }
		    }
		};
	});
})(this, this.document);

//user.js
﻿/**
 * WWW58COM
 * @copyright 2010 58.com Inc. All rights reserved.
 * 
 * @path: WWW58COM/business/user.js
 * @author: yangfei
 * @email: dubhe.yang@gmail.com
 * @version: 1.1.0
 * @date: 2011/4/22
 * Update Log:
 *  2011年4月22日 最终定版
 */
(function(global, DOC, undefined){
	boot.declare('business.user', 'config, dom, event, extension.array, extension.string, util.cookie, util.js', 
	function(Namespace, Frame, config, dom, event, array, string, cookie, js){
	
		
		/**
		 * 封装用户处理业务
		 * 包括：
		 * 1.判断登录状态
		 * 2.弹出层登录
		 * 3.异步注销
		 * 4.获取用户cookie值（该值封装在源生cookie的WWW58COM键中
		 * 5.显示用户登录状态信息
		 */
		Namespace.user = {
			containerid: "logintext",
			loginurl: 'http://passport.58.com/login/',
			logouturl: 'http://my.58.com/ajax/loginout/',
			simloginurl: 'http://my.58.com/simlogin/?type=ajax&radom=',
			
			/**
			 * 判断用户是否登录
			 */
			isLogin: function(){
				var userid = this.get('UserID');
				if(Frame.isEmpty(userid)) return false;
				try{
					userid = parseInt(userid);
					if(userid <= 2) return false;
					else return true;
				}catch(e){
					return false;
				}
			},
			
			/**
			 * 获取用户cookie值
			 * @param {String} name
			 */
			get: function(name){
				var cookieValue = cookie.get("www58com", false);
				if (!cookieValue) return null;
				var ms = cookieValue.match(new RegExp(name + "=([^&;]+)"));
				if (ms && ms.length == 2) {
					return decodeURIComponent(ms[1]);
				}
				else {
					return null;
				}
			},
			/**
			 * 弹出层登录
			 */
			login: function(){
				var self = this;
				boot.require('widgets.window', function(Frame, win){
					win.getInstance().show("登录", self.simloginurl, 300, 200, true);	
				});
			},
			/**
			 * 异步注销
			 */
			logout: function(){
				var self = this;
				js.jsonp(this.logouturl, null, function(){
					self.show();
					Frame.log('business.user', 'success', '用户成功注销');
				}, function(){
					Frame.log('business.user', 'error', '用户注销失败');
				});
			},
			/**
			 * 显示用户登录状态栏
			 */
			show: function(){
				var self = this,
					container = dom.get(self.containerid),
					outurl = escape(location.href);
				if (!container) {
					Frame.log('business.user', 'error', '找不到父容器');
					return;
				}
				
				//2011年7月5日 姚中柱 全站上线
				var isNtalker = true;//array.indexOf(['cs', 'bj', 'sh', 'gz', 'sz'], config.city.listname) != -1 && (!dom.get('crumbs') || dom.get('crumbs').innerHTML.indexOf("黄页") == -1);
	
	            if (isNtalker) {
					if (self.isLogin()) {
						ims_siteid = '58'; //SITEID是在ntalker网站注注的帐号
						ims_userid = self.get("UserID");            //userID是当前用户ID
						ims_username = self.get("UserName");     //userName是当前用户名
						ims_sessionid = self.get('SiteKey');
						// 验证字符串
						ims_callback = function (sessionRequestCount) {
							//收会会话请求后的处理函数，返回当前页收到的会话数
							var emailCount;
							if (cookie.get('ntalker-msgTips_close')) {
								emailCount = 0;
							} else {
								emailCount = parseInt(self.get("MsgUnReadTotal")) + parseInt(self.get("SystemUnReadTotal")) + parseInt(self.get("RequireFriendUnReadTotal")) + parseInt(self.get("CommentUnReadTotal"));
							}
							var messageCount = sessionRequestCount;
							
							if (emailCount > 0 || messageCount > 0) {
								var str = '<i class="msgTips_arrow"></i><em id="ntalker-msgTips_close" class="msgTips_close"></em><div class="msgTips_con ntTips_con">';
								if (messageCount > 0) {
									str += '<span class="num">{0}</span>条即时消息，<a id="ntalker-msgTips-show" href="http://my.58.com/index/?menu=0" target="_blank">点击查看</a><br>';
								}
								if (emailCount > 0) {
									str += '<span class="num">{1}</span>条站内信，<a href="http://my.58.com/msgrev/0/0/?menu=10" target="_blank">点击查看</a><br>';
								}
								str += '</div><i class="shadow"></i>';
								var element = dom.get('ntalker-msgTips');
								element.innerHTML = string.format(str, messageCount, emailCount);
								element.style.display = '';
								event.on('ntalker-msgTips_close', 'click', function () {
									dom.hide(element);
									var now = new Date();
									var to = new Date(now.getFullYear(), now.getMonth(), now.getDate() + 1);
									cookie.set('ntalker-msgTips_close', 'true', to);
								});
								event.on('ntalker-msgTips-show', 'click', function () {
									dom.hide('ntalker-msgTips');
									__connect && __connect.clear();
								});
							}
						};
						js.append('http://pic2.58.com/ntalker/res/impresence.js');
						
						var tplUserinfo = '<span class="user_id">{0}</span>' +
						                '<span class="user_center"><a target="_self" href="http://my.58.com/">我的58</a></span>' +
						                '<span class="user_ntalker"><div id="ntalker-msgTips" class="msgTips ntTips" style="display:none;"></div></span>';
							tplUserinfo += '<span class="user_i"><a id="user-logout" target="_self" href="http://passport.58.com/logout?path={1}&back=now" title="' + (self.get('AutoLogin') == 'true' ? '安全退出，同时您的自动登录将失效。' : '') + '">退出</a></span>';
						container.innerHTML = string.format(tplUserinfo, self.get("UserName"), outurl);
						event.on('user-logout', 'click', function () {
							cookie.remove('ntalker-msgTips_close');
						});
						
						ims_callback(0);	 
					}
					else {
						var tplLogin = '<a href="http://passport.58.com/login/?path={0}" target="_self">登录</a>' +
										'<span class="gap">|</span>' +
										'<a href="http://passport.58.com/reg/?city={1}" target="_self">注册</a>';
						container.innerHTML = string.format(tplLogin, outurl, config.city.listname);
					}
					return;
				}
				else {
					var loginStr = '<a href="http://passport.58.com/login/?path={0}" target="_self">登录</a><span class="gap">|</span><a href="http://passport.58.com/reg/" target="_self">注册</a>', userinfoStr = '{0}{1}<a href="http://my.58.com/" target="_self" style="margin:0 10px">我的58</a><a href="http://passport.58.com/logout?path={2}&back=now" target="_self">退出</a>', messageStr = '(<span class="red"><a style="color:#F00;margin: 0px;" href="http://my.58.com/liuyanjieshou/" title="你有{0}条未读短信息">{0}</a></span>)', host = window.location.hostname, hosthome = host.substr(0, host.indexOf("."));
					
					/**
					 * 判断，当用户禁用cookie时，显示登录信息
					 */
					if (!(document.cookie != null && document.cookie != '' && document.cookie != 'undefined')) {
						var exp = new Date();
						exp.setTime(exp.getTime() + 30 * 24 * 60 * 60 * 1000);
						document.cookie = "supportcookie=true;domain=58.com;expires=" + exp.toGMTString();
						if (!(document.cookie != null && document.cookie != '' && document.cookie != 'undefined')) {
							container.innerHTML = string.format(loginStr, outurl, hosthome);
							return;
						}
						Frame.log('business.user', 'waring', '客户端禁用cookie，显示未登录状态');
					}
					try {
						if (this.isLogin()) {
							/**
							 * 当用户登录后，显示用户信息
							 */
							var msgcount = parseInt(this.get("MsgUnReadTotal")) +
							parseInt(this.get("SystemUnReadTotal")) +
							parseInt(this.get("RequireFriendUnReadTotal")) +
							parseInt(this.get("CommentUnReadTotal"));
							container.innerHTML = string.format(userinfoStr, this.get("UserName"), msgcount > 0 ? string.format(messageStr, msgcount) : '', outurl);
						}
						else {
							/**
							 * 当用户未登录，显示登录信息
							 */
							container.innerHTML = string.format(loginStr, outurl, hosthome);
						}
						return;
					} 
					catch (e) {
						/**
						 *  出现异常时，显示登录信息
						 */
						container.innerHTML = string.format(loginStr, outurl, hosthome);
						Frame.log('business.user', 'error', '显示用户信息异常', e);
					}
				}
			}
		};
	});
})(this, this.document);

