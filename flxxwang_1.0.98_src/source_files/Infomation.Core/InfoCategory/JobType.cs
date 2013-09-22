using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public enum JobType //注意：最大值只能设为255,数据库中对应字段为tinyint类型.
    {
        None=0,
        /// <summary>
        /// 销售.
        /// </summary>
        Yewu=1,
        /// <summary>
        /// 客服.
        /// </summary>
        Kefu=2,
        /// <summary>
        /// 人事/行政/后勤
        /// </summary>
        Renli=3,
        /// <summary>
        /// 财务/审计/统计
        /// </summary>
        CaiwuShenji=4,
        /// <summary>
        /// 普工/技工/生产
        /// </summary>
        ShengchanKaifa=5,
        /// <summary>
        /// 餐饮/酒店/旅游
        /// </summary>
        LvyouJiudian=6,
        /// <summary>
        /// 美容/美发/保健/健身
        /// </summary>
        MeirongJianshen=7,
        /// <summary>
        /// 零售/促销
        /// </summary>
        ChaoshiShangye=8,
        /// <summary>
        /// 家政保洁/安保
        /// </summary>
        JiazhengBaojie=9,
        /// <summary>
        /// 司机.
        /// </summary>
        Siji=10,
        /// <summary>
        /// 市场营销/公关媒介
        /// </summary>
        ShiChang=11,
        /// <summary>
        /// 广告/设计/咨询
        /// </summary>
        GuangGao=12,
        /// <summary>
        /// 教育培训
        /// </summary>
        JiaoyuPeixun=13,
        /// <summary>
        /// 法律
        /// </summary>
        FalvZixun=14,
        /// <summary>
        /// 翻译
        /// </summary>
        FanYi=15,
        /// <summary>
        /// 编辑/出版/印刷
        /// </summary>
        XiezuoChuban=16,
        /// <summary>
        /// 汽车
        /// </summary>
        Qiche=17,
        /// <summary>
        /// 计算机/互联网/通信
        /// </summary>
        Jisuanji=18,
        /// <summary>
        /// 建筑/房产/装修/物业
        /// </summary>
        FangchanJianzhu=19,
        /// <summary>
        /// 金融/银行/证券/投资
        /// </summary>
        JinrongTouzi=20,
        /// <summary>
        /// 医疗/制药/医疗器械
        /// </summary>
        YiyuanYiliao=21,
        /// <summary>
        /// 电子/仪表仪器/机械
        /// </summary>
        JixieYiqi=22,
        /// <summary>
        /// 保险
        /// </summary>
        JinrongBaoxian=23,
        /// <summary>
        /// 贸易/采购/商务
        /// </summary>
        ShangwuMaoyi=24,
        /// <summary>
        /// 仓储/物流
        /// </summary>
        WuliuCangchu=25,
        /// <summary>
        /// 影视/娱乐/KTV
        /// </summary>
        WentiYingshi=26,
        /// <summary>
        /// 其他职位
        /// </summary>
        Qita=27,

        /// <summary>
        /// 兼职-计算机/网络
        /// </summary>
        JianZhiJisuanji=28,
        /// <summary>
        /// 兼职-图形/影像/设计
        /// </summary>
        JianZhiPingMian=29,
        /// <summary>
        /// 兼职-翻译/编辑
        /// </summary>
        JianZhiYuyanWenzi=30,
        /// <summary>
        /// 兼职-销售/促销
        /// </summary>
        JianZhiXiaoshouCuxiao=31,
        /// <summary>
        /// 兼职-客服/市场调查
        /// </summary>
        JianZhiKefuShichang=32,
        /// <summary>
        /// 兼职-财务/法律
        /// </summary>
        JianZhiCaiwuFalv=33,
        /// <summary>
        /// 兼职-教育培训
        /// </summary>
        JianZhiJiaoyuPeixun=34,
        /// <summary>
        /// 兼职-餐饮/服务/旅游
        /// </summary>
        JianZhiCanyinFuwu=35,
        /// <summary>
        /// 兼职-礼仪/演艺
        /// </summary>
        JianZhiLiyiYanyi=36,
        /// <summary>
        /// 兼职-加工制作
        /// </summary>
        JianZhiJiagongZhizuo=37,
        /// <summary>
        /// 兼职-学生兼职/实习
        /// </summary>
        JianZhiXuesheng=38,
        /// <summary>
        /// 兼职-其他兼职
        /// </summary>
        JianZhiQita=39,
    }
}
