using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public enum YellowPageBigType
    {
        None = 0,
        /// <summary>
        /// 生活服务
        /// </summary>
        ShengHuo=1,
        /// <summary>
        /// 商务服务
        /// </summary>
        ShangWu=2,
        /// <summary>
        /// 维修/装修
        /// </summary>
        WeiXiuZhuangXiu=3,
        /// <summary>
        /// 旅游/住宿
        /// </summary>
        LvYouXiuXian=4,
        /// <summary>
        /// 公司注册/法律/财税
        /// </summary>
        ZhuceFalvCaiShui=5,
        /// <summary>
        /// 便民服务
        /// </summary>
        BianMin=6,
        /// <summary>
        /// 招商加盟
        /// </summary>
        ZhaoShang=7,
        /// <summary>
        /// 婚庆服务
        /// </summary>
        HunQing=8,
    }
    public enum YellowPageType //注意：最大值只能设为255,数据库中对应字段为tinyint类型.
    {
        None = 0,

        #region 生活服务
        /// <summary>
        /// 搬家
        /// </summary>
        BanJia=1,
        /// <summary>
        /// 家政
        /// </summary>
        JiaZheng=2,
        /// <summary>
        /// 保洁
        /// </summary>
        BaoJie=3,
        /// <summary>
        /// 管道疏通
        /// </summary>
        ShuTong=4,
        /// <summary>
        /// 二手回收
        /// </summary>
        HuiShou=5,
        /// <summary>
        /// 租车
        /// </summary>
        ZuChe=6,
        /// <summary>
        /// 租赁
        /// </summary>
        ZuLin=7,
        /// <summary>
        /// 礼品/鲜花
        /// </summary>
        LiPinXianHua=8,
        /// <summary>
        /// 生活配送
        /// </summary>
        ShengHuoPeiSong=9,
        /// <summary>
        /// 餐饮
        /// </summary>
        CanYin=10,
        /// <summary>
        /// 食品
        /// </summary>
        ShiPin=11,
        /// <summary>
        /// 娱乐休闲
        /// </summary>
        YuLeXiuXian=12,
        /// <summary>
        /// 美发/美体
        /// </summary>
        MeiFaMeiTi=13,
        /// <summary>
        /// 运动健身
        /// </summary>
        YunDongJianShen=14,
        /// <summary>
        /// 户外
        /// </summary>
        HuWaiYundong= 15,
        /// <summary>
        /// 专科医院
        /// </summary>
        ZhuanKeYiYuan=16,
        /// <summary>
        /// 其他生活服务
        /// </summary>
        QiTaShengHuoFuWu=17,
        #endregion

        #region 商务服务
        /// <summary>
        /// 设计策划
        /// </summary>
        SheJiCeHua=30,
        /// <summary>
        /// 翻译/速记
        /// </summary>
        FanYi=31,
        /// <summary>
        /// 广告传媒
        /// </summary>
        ChuanMei= 32,
        /// <summary>
        /// 网站建设/推广
        /// </summary>
        WangZhan=33,
        /// <summary>
        /// 网络维护及布线
        /// </summary>
        WangLuoWeiHu= 34,
        /// <summary>
        /// 咨询服务
        /// </summary>
        ZiXunFuWu=35,
        /// <summary>
        /// 快递
        /// </summary>
        KuaiDi=36,
        /// <summary>
        /// 物流服务
        /// </summary>
        WuLiu=37,
        /// <summary>
        /// 货运专线
        /// </summary>
        HuoYun=38,
        /// <summary>
        /// 印刷包装
        /// </summary>
        YinShua= 39,
        /// <summary>
        /// 喷绘招牌
        /// </summary>
        PenHui= 40,
        /// <summary>
        /// 制卡
        /// </summary>
        ZhiKa=41,
        #endregion

        #region 维修/装修
        /// <summary>
        /// 家电维修
        /// </summary>
        JiaDianWeiXiu=60,
        /// <summary>
        /// 电脑维修
        /// </summary>
        DianNaoWeiXiu=61,
        /// <summary>
        /// 办公设备维修
        /// </summary>
        BGSBWX= 62,
        /// <summary>
        /// 家居维修
        /// </summary>
        JiaJuWeiXiu=63,
        /// <summary>
        /// 装修装饰
        /// </summary>
        ZhuangXiu=64,
        /// <summary>
        /// 房屋维修/防水
        /// </summary>
        FangWeiXiu= 65,
        /// <summary>
        /// 建材
        /// </summary>
        JianCai=66,
        #endregion

        #region 旅游/住宿
        /// <summary>
        /// 旅行社
        /// </summary>
        LvXingShe=80,
        /// <summary>
        /// 国内旅游线路
        /// </summary>
        GuoNeiLvYou=81,
        /// <summary>
        /// 出国旅游线路
        /// </summary>
        ChuGuoLvYou=82,
        /// <summary>
        /// 港澳台游
        /// </summary>
        GangAoTaiYou=83,
        /// <summary>
        /// 周边游
        /// </summary>
        ZhouBianYou=84,
        /// <summary>
        /// 度假村/农家乐
        /// </summary>
        DuJia=85,
        /// <summary>
        /// 酒店预订
        /// </summary>
        Jdyd= 86,
        /// <summary>
        /// 代办签证/签注
        /// </summary>
        Visa= 87,
        #endregion

        #region 公司注册/法律/财税
        /// <summary>
        /// 工商注册
        /// </summary>
        ZhuCe=100,
        /// <summary>
        /// 法律咨询
        /// </summary>
        Lvshi= 101,
        /// <summary>
        /// 担保/保险/投资
        /// </summary>
        DanBaoBaoXianTouZi=102,
        /// <summary>
        /// 财务会计/评估
        /// </summary>
        CaiShui= 103,
        /// <summary>
        /// 商标专利
        /// </summary>
        ShangBiaoZhuanLi=104,
        #endregion

        #region 招商加盟
        /// <summary>
        /// 餐饮加盟
        /// </summary>
        CanYinJia=120,
        /// <summary>
        /// 服装加盟
        /// </summary>
        FuZhuangJia=121,
        /// <summary>
        /// 礼品饰品
        /// </summary>
        LiPinShiPin=123,
        /// <summary>
        /// 机械加盟
        /// </summary>
        JiXieJiaGong= 124,
        /// <summary>
        /// 家居/环保项目
        /// </summary>
        JiaJuHuanBao=125,
        /// <summary>
        /// 教育项目
        /// </summary>
        JiaoYuJm= 126,
        /// <summary>
        /// 美容保健
        /// </summary>
        MeiRongBaoJian=127,
        /// <summary>
        /// 鞋加盟
        /// </summary>
        XieJm=128,
        /// <summary>
        /// 建材加盟
        /// </summary>
        JianCaiJm=129,
        /// <summary>
        /// 干洗加盟
        /// </summary>
        GanXiJm=130,
        /// <summary>
        /// 其他加盟
        /// </summary>
        QiTaJiaMeng=131,
        /// <summary>
        /// 箱包加盟
        /// </summary>
        XiangBaoJm=132,
        #endregion

        #region 婚庆服务
        /// <summary>
        /// 婚庆
        /// </summary>
        HunQing=150,
        /// <summary>
        /// 摄影摄像
        /// </summary>
        SheYing=151,
        /// <summary>
        /// 礼仪庆典
        /// </summary>
        QingDian=152,
        #endregion

        #region 便民服务
        /// <summary>
        /// 便民服务
        /// </summary>
        BianMin=200,
        #endregion
    }
}
