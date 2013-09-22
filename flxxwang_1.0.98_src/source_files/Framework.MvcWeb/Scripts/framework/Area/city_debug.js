if (!$f) {
    $f = {};
}
$f.area = {
    _provinces:
[
	[1, '北京',
		[
			[1, '北京', 'bj', 'B']
		]
	],
	[2, '天津',
		[
			[2, '天津', 'tj', 'T']
		]
	],
	[3, '上海',
		[
			[3, '上海', 'sh', 'S']
		]
	],
	[4, '重庆',
		[
			[4, '重庆', 'cq', 'C']
		]
	],
	[5, '河北',
		[
			[10, '保定', 'bd', 'B'],
			[6, '唐山', 'ts', 'T'],
			[7, '秦皇岛', 'qhd', 'Q'],
			[11, '张家口', 'zjk', 'Z'],
			[14, '廊坊', 'lf', 'L'],
			[5, '石家庄', 'sjz', 'S'],
			[13, '沧州', 'cangzhou', 'C'],
			[9, '邢台', 'xt', 'X'],
			[398, '馆陶', 'gt', 'G'],
			[8, '邯郸', 'hd', 'H'],
			[395, '定州', 'dingzhou', 'D'],
			[12, '承德', 'chengde', 'C'],
			[15, '衡水', 'hs', 'H'],
			[425, '正定', 'zd', 'Z'],
			[427, '赵县', 'zx', 'Z'],
			[429, '张北', 'zhangbei', 'Z']
		]
	],
	[6, '山西',
		[
			[16, '太原', 'ty', 'T'],
			[17, '大同', 'dt', 'D'],
			[26, '吕梁', 'lvliang', 'L'],
			[20, '晋城', 'jincheng', 'J'],
			[19, '长治', 'changzhi', 'C'],
			[23, '运城', 'yuncheng', 'Y'],
			[24, '忻州', 'xinzhou', 'X'],
			[25, '临汾', 'linfen', 'L'],
			[22, '晋中', 'jz', 'J'],
			[410, '清徐', 'qingxu', 'Q'],
			[18, '阳泉', 'yq', 'Y'],
			[404, '临猗', 'linyixian', 'L'],
			[21, '朔州', 'shuozhou', 'S']
		]
	],
	[7, '台湾'
	],
	[8, '辽宁',
		[
			[52, '鞍山', 'as', 'A'],
			[51, '大连', 'dl', 'D'],
			[60, '盘锦', 'pj', 'P'],
			[53, '抚顺', 'fushun', 'F'],
			[50, '沈阳', 'sy', 'S'],
			[58, '阜新', 'fx', 'F'],
			[55, '丹东', 'dandong', 'D'],
			[54, '本溪', 'benxi', 'B'],
			[61, '铁岭', 'tl', 'T'],
			[59, '辽阳', 'liaoyang', 'L'],
			[416, '瓦房店', 'wfd', 'W'],
			[57, '营口', 'yk', 'Y'],
			[62, '朝阳', 'cy', 'C'],
			[56, '锦州', 'jinzhou', 'J'],
			[430, '庄河', 'pld', 'Z'],
			[63, '葫芦岛', 'hld', 'H']
		]
	],
	[9, '吉林',
		[
			[64, '长春', 'cc', 'C'],
			[65, '吉林', 'jl', 'J'],
			[71, '白城', 'bc', 'B'],
			[72, '延边', 'yanbian', 'Y'],
			[67, '辽源', 'liaoyuan', 'L'],
			[68, '通化', 'th', 'T'],
			[69, '白山', 'baishan', 'B'],
			[70, '松原', 'songyuan', 'S'],
			[66, '四平', 'sp', 'S']
		]
	],
	[10, '黑龙江',
		[
			[73, '哈尔滨', 'hrb', 'H'],
			[80, '牡丹江', 'mdj', 'M'],
			[74, '齐齐哈尔', 'qqhr', 'Q'],
			[78, '大庆', 'dq', 'D'],
			[81, '佳木斯', 'jms', 'J'],
			[77, '鸡西', 'jixi', 'J'],
			[82, '七台河', 'qth', 'Q'],
			[84, '绥化', 'suihua', 'S'],
			[85, '大兴安岭', 'dxal', 'D'],
			[75, '鹤岗', 'hegang', 'H'],
			[79, '伊春', 'yich', 'Y'],
			[76, '双鸭山', 'sys', 'S'],
			[83, '黑河', 'heihe', 'H']
		]
	],
	[11, '江苏',
		[
			[86, '南京', 'nj', 'N'],
			[87, '无锡', 'wx', 'W'],
			[88, '徐州', 'xz', 'X'],
			[90, '苏州', 'su', 'S'],
			[95, '扬州', 'yz', 'Y'],
			[89, '常州', 'cz', 'C'],
			[94, '盐城', 'yancheng', 'Y'],
			[91, '南通', 'nt', 'N'],
			[92, '连云港', 'lyg', 'L'],
			[97, '泰州', 'taizhou', 'T'],
			[96, '镇江', 'zj', 'Z'],
			[93, '淮安', 'ha', 'H'],
			[411, '沭阳', 'shuyang', 'S'],
			[98, '宿迁', 'suqian', 'S'],
			[396, '大丰', 'dafeng', 'D']
		]
	],
	[12, '浙江',
		[
			[99, '杭州', 'hz', 'H'],
			[100, '宁波', 'nb', 'N'],
			[102, '嘉兴', 'jx', 'J'],
			[101, '温州', 'wz', 'W'],
			[105, '金华', 'jh', 'J'],
			[108, '台州', 'tz', 'T'],
			[106, '衢州', 'quzhou', 'Q'],
			[104, '绍兴', 'sx', 'S'],
			[103, '湖州', 'huzhou', 'H'],
			[109, '丽水', 'lishui', 'L'],
			[107, '舟山', 'zhoushan', 'Z'],
			[424, '义乌', 'yiwu', 'Y']
		]
	],
	[13, '安徽',
		[
			[114, '马鞍山', 'mas', 'M'],
			[117, '安庆', 'anqing', 'A'],
			[110, '合肥', 'hf', 'H'],
			[120, '阜阳', 'fy', 'F'],
			[112, '蚌埠', 'bengbu', 'B'],
			[111, '芜湖', 'wuhu', 'W'],
			[121, '宿州', 'suzhou', 'S'],
			[124, '亳州', 'bozhou', 'B'],
			[126, '宣城', 'xuancheng', 'X'],
			[116, '铜陵', 'tongling', 'T'],
			[122, '巢湖', 'ch', 'C'],
			[125, '池州', 'chizhou', 'C'],
			[119, '滁州', 'chuzhou', 'C'],
			[415, '桐城', 'tongcheng', 'T'],
			[123, '六安', 'la', 'L'],
			[113, '淮南', 'hn', 'H'],
			[115, '淮北', 'huaibei', 'H'],
			[118, '黄山', 'huangshan', 'H'],
			[400, '和县', 'hexian', 'H'],
			[401, '霍邱', 'hq', 'H']
		]
	],
	[14, '福建',
		[
			[127, '福州', 'fz', 'F'],
			[128, '厦门', 'xm', 'X'],
			[131, '泉州', 'qz', 'Q'],
			[129, '莆田', 'pt', 'P'],
			[132, '漳州', 'zhangzhou', 'Z'],
			[135, '宁德', 'nd', 'N'],
			[130, '三明', 'sm', 'S'],
			[133, '南平', 'np', 'N'],
			[134, '龙岩', 'ly', 'L'],
			[417, '武夷山', 'wuyishan', 'W']
		]
	],
	[15, '江西',
		[
			[136, '南昌', 'nc', 'N'],
			[138, '萍乡', 'px', 'P'],
			[142, '赣州', 'ganzhou', 'G'],
			[145, '抚州', 'fuzhou', 'F'],
			[139, '九江', 'jj', 'J'],
			[141, '鹰潭', 'yingtan', 'Y'],
			[144, '宜春', 'yichun', 'Y'],
			[143, '吉安', 'ja', 'J'],
			[137, '景德镇', 'jdz', 'J'],
			[140, '新余', 'xinyu', 'X'],
			[146, '上饶', 'sr', 'S'],
			[423, '永新', 'yxx', 'Y']
		]
	],
	[16, '山东',
		[
			[147, '济南', 'jn', 'J'],
			[148, '青岛', 'qd', 'Q'],
			[152, '烟台', 'yt', 'Y'],
			[157, '日照', 'rizhao', 'R'],
			[154, '济宁', 'jining', 'J'],
			[153, '潍坊', 'wf', 'W'],
			[160, '德州', 'dz', 'D'],
			[151, '东营', 'dy', 'D'],
			[155, '泰安', 'ta', 'T'],
			[159, '临沂', 'linyi', 'L'],
			[162, '滨州', 'bz', 'B'],
			[149, '淄博', 'zb', 'Z'],
			[161, '聊城', 'lc', 'L'],
			[156, '威海', 'weihai', 'W'],
			[403, '垦利', 'kl', 'K'],
			[150, '枣庄', 'zaozhuang', 'Z'],
			[163, '菏泽', 'heze', 'H'],
			[426, '章丘', 'zhangqiu', 'Z'],
			[158, '莱芜', 'lw', 'L'],
			[428, '诸城', 'zc', 'Z']
		]
	],
	[17, '河南',
		[
			[164, '郑州', 'zz', 'Z'],
			[167, '平顶山', 'pds', 'P'],
			[166, '洛阳', 'luoyang', 'L'],
			[168, '安阳', 'ay', 'A'],
			[165, '开封', 'kaifeng', 'K'],
			[172, '濮阳', 'puyang', 'P'],
			[176, '南阳', 'ny', 'N'],
			[405, '明港', 'mg', 'M'],
			[170, '新乡', 'xx', 'X'],
			[171, '焦作', 'jiaozuo', 'J'],
			[173, '许昌', 'xc', 'X'],
			[177, '商丘', 'sq', 'S'],
			[179, '周口', 'zk', 'Z'],
			[180, '驻马店', 'zmd', 'Z'],
			[394, '长葛', 'changge', 'C'],
			[174, '漯河', 'luohe', 'L'],
			[178, '信阳', 'xy', 'X'],
			[175, '三门峡', 'smx', 'S'],
			[419, '禹州', 'yuzhou', 'Y'],
			[420, '鄢陵', 'yanling', 'Y'],
			[169, '鹤壁', 'hb', 'H'],
			[181, '济源', 'jiyuan', 'J']
		]
	],
	[18, '湖北',
		[
			[182, '武汉', 'wh', 'W'],
			[198, '恩施', 'es', 'E'],
			[188, '鄂州', 'ez', 'E'],
			[186, '宜昌', 'yc', 'Y'],
			[187, '襄阳', 'xf', 'X'],
			[190, '孝感', 'xiaogan', 'X'],
			[184, '十堰', 'shiyan', 'S'],
			[185, '荆州', 'jingzhou', 'J'],
			[183, '黄石', 'hshi', 'H'],
			[196, '潜江', 'qianjiang', 'Q'],
			[191, '黄冈', 'hg', 'H'],
			[195, '天门', 'tm', 'T'],
			[189, '荆门', 'jingmen', 'J'],
			[194, '仙桃', 'xiantao', 'X'],
			[192, '咸宁', 'xianning', 'X'],
			[193, '随州', 'suizhou', 'S'],
			[197, '神农架', 'snj', 'S']
		]
	],
	[19, '湖南',
		[
			[199, '长沙', 'cs', 'C'],
			[201, '湘潭', 'xiangtan', 'X'],
			[200, '株洲', 'zhuzhou', 'Z'],
			[204, '岳阳', 'yy', 'Y'],
			[202, '衡阳', 'hy', 'H'],
			[205, '常德', 'changde', 'C'],
			[208, '郴州', 'chenzhou', 'C'],
			[203, '邵阳', 'shaoyang', 'S'],
			[206, '张家界', 'zjj', 'Z'],
			[209, '永州', 'yongzhou', 'Y'],
			[210, '怀化', 'hh', 'H'],
			[212, '湘西', 'xiangxi', 'X'],
			[207, '益阳', 'yiyang', 'Y'],
			[211, '娄底', 'ld', 'L']
		]
	],
	[20, '广东',
		[
			[213, '广州', 'gz', 'G'],
			[229, '东莞', 'dg', 'D'],
			[214, '深圳', 'sz', 'S'],
			[215, '珠海', 'zh', 'Z'],
			[218, '佛山', 'fs', 'F'],
			[221, '茂名', 'mm', 'M'],
			[219, '江门', 'jm', 'J'],
			[230, '中山', 'zs', 'Z'],
			[216, '汕头', 'st', 'S'],
			[223, '惠州', 'huizhou', 'H'],
			[224, '梅州', 'mz', 'M'],
			[228, '清远', 'qingyuan', 'Q'],
			[232, '揭阳', 'jy', 'J'],
			[220, '湛江', 'zhanjiang', 'Z'],
			[222, '肇庆', 'zq', 'Z'],
			[217, '韶关', 'sg', 'S'],
			[227, '阳江', 'yj', 'Y'],
			[412, '顺德', 'sd', 'S'],
			[414, '台山', 'taishan', 'T'],
			[418, '阳春', 'yangchun', 'Y'],
			[231, '潮州', 'chaozhou', 'C'],
			[225, '汕尾', 'sw', 'S'],
			[233, '云浮', 'yf', 'Y'],
			[226, '河源', 'heyuan', 'H']
		]
	],
	[21, '甘肃',
		[
			[234, '兰州', 'lz', 'L'],
			[241, '平凉', 'pl', 'P'],
			[237, '天水', 'tianshui', 'T'],
			[243, '庆阳', 'qingyang', 'Q'],
			[247, '甘南', 'gn', 'G'],
			[244, '定西', 'dx', 'D'],
			[246, '临夏', 'linxia', 'L'],
			[235, '金昌', 'jinchang', 'J'],
			[236, '白银', 'by', 'B'],
			[239, '武威', 'wuwei', 'W'],
			[238, '嘉峪关', 'jyg', 'J'],
			[242, '酒泉', 'jq', 'J'],
			[240, '张掖', 'zhangye', 'Z'],
			[245, '陇南', 'ln', 'L']
		]
	],
	[22, '四川',
		[
			[248, '成都', 'cd', 'C'],
			[253, '绵阳', 'mianyang', 'M'],
			[250, '攀枝花', 'panzhihua', 'P'],
			[256, '内江', 'scnj', 'N'],
			[259, '眉山', 'ms', 'M'],
			[257, '乐山', 'ls', 'L'],
			[261, '广安', 'ga', 'G'],
			[254, '广元', 'guangyuan', 'G'],
			[258, '南充', 'nanchong', 'N'],
			[266, '阿坝', 'ab', 'A'],
			[252, '德阳', 'deyang', 'D'],
			[267, '甘孜', 'ganzi', 'G'],
			[262, '达州', 'dazhou', 'D'],
			[264, '巴中', 'bazhong', 'B'],
			[249, '自贡', 'zg', 'Z'],
			[260, '宜宾', 'yb', 'Y'],
			[251, '泸州', 'luzhou', 'L'],
			[265, '资阳', 'zy', 'Z'],
			[263, '雅安', 'ya', 'Y'],
			[255, '遂宁', 'suining', 'S'],
			[268, '凉山', 'liangshan', 'L']
		]
	],
	[23, '贵州',
		[
			[269, '贵阳', 'gy', 'G'],
			[276, '黔东南', 'qdn', 'Q'],
			[272, '安顺', 'anshun', 'A'],
			[277, '黔南', 'qn', 'Q'],
			[275, '黔西南', 'qxn', 'Q'],
			[273, '铜仁', 'tr', 'T'],
			[271, '遵义', 'zunyi', 'Z'],
			[274, '毕节', 'bijie', 'B'],
			[270, '六盘水', 'lps', 'L']
		]
	],
	[24, '海南',
		[
			[278, '海口', 'haikou', 'H'],
			[279, '三亚', 'sanya', 'S'],
			[280, '五指山', 'wzs', 'W']
		]
	],
	[25, '云南',
		[
			[296, '昆明', 'km', 'K'],
			[308, '大理', 'dali', 'D'],
			[406, '普洱', 'pe', 'P'],
			[297, '曲靖', 'qj', 'Q'],
			[298, '玉溪', 'yx', 'Y'],
			[299, '保山', 'bs', 'B'],
			[310, '怒江', 'nujiang', 'N'],
			[304, '文山', 'ws', 'W'],
			[311, '迪庆', 'diqing', 'D'],
			[307, '楚雄', 'cx', 'C'],
			[309, '德宏', 'dh', 'D'],
			[306, '西双版纳', 'bn', 'X'],
			[301, '丽江', 'lj', 'L'],
			[305, '红河', 'honghe', 'H'],
			[303, '临沧', 'lincang', 'L'],
			[300, '昭通', 'zt', 'Z']
		]
	],
	[26, '青海',
		[
			[312, '西宁', 'xn', 'X'],
			[317, '果洛', 'guoluo', 'G'],
			[318, '玉树', 'ys', 'Y'],
			[315, '黄南', 'huangna', 'H'],
			[319, '海西', 'hx', 'H'],
			[316, '海南', 'hainan', 'H'],
			[313, '海东', 'haidong', 'H'],
			[314, '海北', 'haibei', 'H']
		]
	],
	[27, '陕西',
		[
			[320, '西安', 'xa', 'X'],
			[325, '延安', 'yanan', 'Y'],
			[328, '安康', 'ankang', 'A'],
			[322, '宝鸡', 'baoji', 'B'],
			[324, '渭南', 'wn', 'W'],
			[326, '汉中', 'hanzhong', 'H'],
			[321, '铜川', 'tc', 'T'],
			[327, '榆林', 'yl', 'Y'],
			[323, '咸阳', 'xianyang', 'X'],
			[329, '商洛', 'sl', 'S']
		]
	],
	[28, '广西',
		[
			[332, '桂林', 'gl', 'G'],
			[330, '南宁', 'nn', 'N'],
			[337, '贵港', 'gg', 'G'],
			[335, '防城港', 'fcg', 'F'],
			[333, '梧州', 'wuzhou', 'W'],
			[336, '钦州', 'qinzhou', 'Q'],
			[331, '柳州', 'liuzhou', 'L'],
			[339, '百色', 'baise', 'B'],
			[334, '北海', 'bh', 'B'],
			[341, '河池', 'hc', 'H'],
			[343, '崇左', 'chongzuo', 'C'],
			[338, '玉林', 'yulin', 'Y'],
			[342, '来宾', 'lb', 'L'],
			[340, '贺州', 'hezhou', 'H']
		]
	],
	[29, '西藏',
		[
			[348, '日喀则', 'rkz', 'R'],
			[349, '阿里', 'al', 'A'],
			[344, '拉萨', 'lasa', 'L'],
			[345, '那曲', 'nq', 'N'],
			[346, '昌都', 'changdu', 'C'],
			[347, '山南', 'sn', 'S'],
			[350, '林芝', 'linzhi', 'L']
		]
	],
	[30, '宁夏',
		[
			[354, '固原', 'guyuan', 'G'],
			[351, '银川', 'yinchuan', 'Y'],
			[353, '吴忠', 'wuzhong', 'W'],
			[355, '中卫', 'zw', 'Z'],
			[352, '石嘴山', 'szs', 'S']
		]
	],
	[31, '新疆',
		[
			[357, '克拉玛依', 'klmy', 'K'],
			[368, '库尔勒', 'kel', 'K'],
			[356, '乌鲁木齐', 'xj', 'W'],
			[364, '喀什', 'ks', 'K'],
			[363, '阿克苏', 'aks', 'A'],
			[402, '克孜勒苏', 'kzls', 'K'],
			[359, '阿拉尔', 'ale', 'A'],
			[362, '吐鲁番', 'tlf', 'T'],
			[360, '图木舒克', 'tmsk', 'T'],
			[392, '巴音郭楞', 'bygl', 'B'],
			[393, '博尔塔拉', 'betl', 'B'],
			[361, '五家渠', 'wjq', 'W'],
			[369, '昌吉', 'changji', 'C'],
			[365, '哈密', 'hami', 'H'],
			[358, '石河子', 'shz', 'S'],
			[422, '伊犁', 'yili', 'Y'],
			[366, '和田', 'ht', 'H']
		]
	],
	[32, '内蒙古',
		[
			[383, '鄂尔多斯', 'erds', 'E'],
			[379, '包头', 'bt', 'B'],
			[378, '呼和浩特', 'hu', 'H'],
			[381, '赤峰', 'chifeng', 'C'],
			[389, '阿拉善盟', 'alsm', 'A'],
			[380, '乌海', 'wuhai', 'W'],
			[382, '通辽', 'tongliao', 'T'],
			[385, '巴彦淖尔盟', 'bycem', 'B'],
			[399, '海拉尔', 'hlr', 'H'],
			[386, '乌兰察布', 'wlcb', 'W'],
			[387, '锡林', 'xl', 'X'],
			[388, '兴安盟', 'xam', 'X'],
			[431, '呼伦贝尔', 'hlbe', 'H'],
			[384, '呼伦贝尔', 'hlbe', 'G']
		]
	],
	[33, '澳门',
		[
			[390, '澳门', 'am', 'A']
		]
	],
	[34, '香港',
		[
			[391, '香港', 'hk', 'X']
		]
	]
],

    getProvinces: function () {
        var provinces = [];
        for (var i = 0; i < $f.area._provinces.length; i++) {
            var p = $f.area._provinces[i];
            var _cities = [];
            if (p.length > 2) {
                for (var j = 0; j < p[2].length; j++) {
                    var city = p[2][j];
                    _cities[j] = { Id: city[0], ShortName: city[1], Code: city[2], Aleph: city[3] };
                }
            }
            provinces[i] = { Id: p[0], ShortName: p[1], Cities: _cities };
        }
        return provinces;
    },
    getAllCities: function () {
        var cities = [];
        for (var i = 0; i < $f.area._provinces.length; i++) {
            var p = $f.area._provinces[i];
            if (p.length > 2) {
                for (var j = 0; j < p[2].length; j++) {
                    var city = p[2][j];
                    var _city = { Id: city[0], ShortName: city[1], Code: city[2], Aleph: city[3] };
                    cities.push(_city);
                }
            }
        }
        return cities;
    },
    getProvince: function (provinceid) {
        //            for (var i = 0; i < $f.area._provinces.length; i++) {
        //                if ($f.area._provinces[i][0] == provinceid) {
        //                    //return $f.area.Provinces[i];
        //                    var p = $f.area._provinces[i];
        //                    return { Id: p[0], ShortName: p[1] };
        //                }
        //            }
        var provinces = $f.area.getProvinces();
        for (var i = 0; i < provinces.length; i++) {
            if (provinces[i].Id == provinceid) {
                return provinces[i];
            }
        }
    },
    getCities: function (provinceid) {
        //            var province = $f.area.getProvince(provinceid);
        //            var cities = province[2];
        //            var result = [];
        //            for (var i = 0; i < cities.length; i++) {
        //                var city = cities[i];
        //                //result.push({ Id: city[0], ShortName: city[1], Code: city[2], Aleph: city[3] });
        //                result[i] = { Id: city[0], ShortName: city[1], Code: city[2], Aleph: city[3] };
        //            }
        //            return result;
        return $f.area.getProvince(provinceid).Cities;
    },
    getCity: function (provinceid, cityid) {
        //            var cities = $f.area.getCities(provinceid);
        //            for (var i = 0; i < cities.length; i++) {
        //                if (cities[i].Id == cityid) {
        //                    return cities[i];
        //                }
        //            }
        var cities = $f.area.getCities(provinceid);
        for (var i = 0; i < cities.length; i++) {
            if (cities[i].Id == cityid) {
                return cities[i];
            }
        }
    },
    GetCitiesRange: function (startAleph, endAleph) {
        var citiesResult = [];
        var cities = $f.area.getAllCities();
        for (var i = 0; i < cities.length; i++) {
            var city = cities[i];
            if (city.Aleph >= startAleph && city.Aleph <= endAleph) {
                citiesResult.push(city);
            }
        }
        return citiesResult;
    }

}
