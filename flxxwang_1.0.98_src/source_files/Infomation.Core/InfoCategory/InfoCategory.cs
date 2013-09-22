using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    //注意：YellowPageType、JobType、ObjectType、Tag都不能大于255,因为数据库字段类型为tinyint.
    public class InfoCategory
    {
        //public byte Id
        //{
        //    get;
        //    set;
        //}
        public string Code
        {
            get;
            //private set;
            set;
        }
        public string Name
        {
            get;
            //private set;//private系列化时将没有这个字段.
            set;
        }
        public IInfo Singleton
        {
            get;
            private set;
        }
        public InfoCategory Parent
        {
            get;
            private set;
        }
        public IEnumerable<InfoCategory> Children
        {
            get;
            //private set;//系列化时不会有Children
            set;
        }
        public List<ObjectType> ObjectTypeCollection
        {
            get;
            set;
        }
        public List<InfoTag> TagCollection
        {
            get;
            set;
        }
        private static List<InfoCategory> _categories;
        public static List<InfoCategory> Categories
        {
            get
            {
                if (_categories == null)
                {
                    _categories = new List<InfoCategory>();

                    #region 房屋信息
                    var houseCategory = new HouseCategory()
                    {
                        Code = "FangChan",
                        Name = "房屋信息",
                    };
                    houseCategory.Children = new List<HouseCategory>()
                    {
                        new HouseCategory()
                        {
                            Code="zufang",
                            Name="租房",
                            Parent=houseCategory,
                            Singleton=HouseRent.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="平房"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="普通住宅"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="商住两用"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="公寓"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="别墅"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="其他"
                                },
                            }
                        },
                        new HouseCategory()
                        {
                            Code="hezu",
                            Name="合租房",
                            Parent=houseCategory,
                            Singleton=HouseShare.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="平房"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="普通住宅"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="商住两用"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="公寓"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="别墅"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="其他"
                                },

                            }
                        },
                        new HouseCategory()
                        {
                            Code="bed",
                            Name="合租床位",
                            Parent=houseCategory,
                            Singleton=HouseBed.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="平房"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="普通住宅"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="商住两用"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="公寓"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="别墅"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="其他"
                                },
                            }
                        },
                        new HouseCategory()
                        {
                            Code="qiuzu",
                            Name="求租房",
                            Parent=houseCategory,
                            Singleton=HouseHire.Singleton
                        },
                        new HouseCategory()
                        {
                            Code="duanzu",
                            Name="短租房/日租房",
                            Parent=houseCategory,
                            Singleton=HouseShort.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="家庭旅馆"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="酒店式公寓"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="经济型酒店"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="宾馆招待所"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="特色客栈"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="星级酒店"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="青年旅社"
                                }
                            }
                        },
                        new HouseCategory()
                        {
                            Code="ershoufang",
                            Name="二手房",
                            Parent=houseCategory,
                            Singleton=HouseSecond.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="地下室"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="平房"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="普通住宅"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="商住两用"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="公寓"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="别墅"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="其他"
                                },

                            }
                        },
                        new HouseCategory()
                        {
                            Code="xiezilou",
                            Name="写字楼",
                            Parent=houseCategory,
                            Singleton=HouseOffice.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="写字楼"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="商务中心"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="商住公寓"
                                },
                            }
                        },
                        new HouseCategory()
                        {
                            Code="shangpu",
                            Name="生意/商铺转让",
                            Parent=houseCategory,
                            Singleton=HouseShop.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="商业街卖场"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="摊位柜台"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="住宅底商"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="其他"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="写字楼配套"
                                }
                            }
                        },
                        new HouseCategory()
                        {
                            Code="qita",
                            Name="厂房/仓库/土地",
                            Parent=houseCategory,
                            Singleton=HouseOther.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="仓库"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="车库"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="土地"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="厂房"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="其他"
                                },
                            }
                        }
                        //new HouseCategory()
                        //{
                        //    Code="yws",
                        //    Name="找房愿望树",
                        //    Parent=houseCategory,
                        //    //Singleton=
                        //}
                                
                    }.Select(item=>item as InfoCategory);
                    _categories.Add(houseCategory);
                    #endregion

                    #region 跳蚤市场(二手)
                    var saleCategory = new SaleCategory()
                    {
                        Code = "TiaoZao",
                        Name = "二手市场"
                    };
                    saleCategory.Children = new List<SaleCategory>()
                    {
                        #region 二手电脑/配件
                        new SaleCategory()
                        {
                            Code="diannao",
                            Name="二手电脑/配件",
                            Parent=saleCategory,
                            Singleton=SaleComputer.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id = 1,
                                    Name = "台式机"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "笔记本"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "服务器"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "硬件"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "外设产品"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "其他"
                                }
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="惠普/康柏",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="戴尔",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="富士通",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="东芝",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="华硕",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="宏基",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="三星",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="神舟",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="光驱/刻录",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="音响",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="IBM",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="联想",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="索尼",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="cpu",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="主板",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="显卡",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="内存条",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="硬盘",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="显示器/液晶",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="网卡/无线网卡",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=21,
                                    Name="鼠标/键盘",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=22,
                                    Name="摄像头",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=23,
                                    Name="掌上电脑",
                                    ObjectTypeId=6,
                                },
                                new InfoTag()
                                {
                                    Id=24,
                                    Name="品牌机",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=25,
                                    Name="组装机",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=26,
                                    Name="耳麦",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=27,
                                    Name="不间断电源",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=28,
                                    Name="路由器",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=29,
                                    Name="U盘",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=30,
                                    Name="闪存卡",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=31,
                                    Name="移动硬盘",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=32,
                                    Name="苹果",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=33,
                                    Name="台式服务器",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=34,
                                    Name="机架式服务器",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=35,
                                    Name="机柜式服务器",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=36,
                                    Name="上网本",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=37,
                                    Name="平板电脑",
                                    ObjectTypeId=6,
                                },
                            }
                        },
                        #endregion
                        #region 二手手机
                        new SaleCategory()
                        {
                            Code="shouji",
                            Name="二手手机",
                            Parent=saleCategory,
                            Singleton=SaleMobile.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="诺基亚"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "摩托罗拉"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "索尼爱立信"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "三星"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "HTC/多普达"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "手机配件"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "小灵通"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "苹果"
                                },
                                new ObjectType()
                                {
                                    Id = 9,
                                    Name = "其他手机品牌"
                                }
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="N97",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="5230",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="5800XM",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="6700s",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="N95",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="C7",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="E7",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="N8",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="其他",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="XT800",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="XT301",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="Miles",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="ME811",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="XT702",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="XT720",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="ME722",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="ME600",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="CLIQ",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="ME525",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="其他",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=21,
                                    Name="X10",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=22,
                                    Name="T70",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=23,
                                    Name="U10",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=24,
                                    Name="U1i",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=25,
                                    Name="U51",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=26,
                                    Name="U8i",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=27,
                                    Name="X8",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=28,
                                    Name="其他",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=29,
                                    Name="W899",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=30,
                                    Name="T959",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=31,
                                    Name="S5830 Gal",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=32,
                                    Name="I909",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=33,
                                    Name="I900",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=34,
                                    Name="I8000",
                                    ObjectTypeId=4,
                                },

                                new InfoTag()
                                {
                                    Id=35,
                                    Name="I5800",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=36,
                                    Name="I5700",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=37,
                                    Name="Galaxy Ta",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=38,
                                    Name="I900",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=39,
                                    Name="其他",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=40,
                                    Name="Aria",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=41,
                                    Name="Wildfire",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=42,
                                    Name="Legend",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=43,
                                    Name="Incredible",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=44,
                                    Name="HD2",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=45,
                                    Name="Hero",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=46,
                                    Name="HD7",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=47,
                                    Name="Desire",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=48,
                                    Name="Desire Z",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=51,
                                    Name="Desire HD",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=52,
                                    Name="其他",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=53,
                                    Name="iPhone 4",
                                    ObjectTypeId=8,
                                },
                                new InfoTag()
                                {
                                    Id=54,
                                    Name="iPhone 5",
                                    ObjectTypeId=8,
                                },
                                new InfoTag()
                                {
                                    Id=55,
                                    Name="其他",
                                    ObjectTypeId=8,
                                },
                            }
                        },
                        #endregion
                        #region 手机号码
                        new SaleCategory()
                        {
                            Code="shoujihao",
                            Name="手机号码",
                            Parent=saleCategory,
                            Singleton=SaleMobileNumber.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="全球通"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "动感地带"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "神州行"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "联通"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "电信"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "铁通"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "小灵通"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "其他"
                                },
                            }
                        },
                        #endregion
                        #region 数码产品
                        new SaleCategory()
                        {
                            Code="shuma",
                            Name="数码产品",
                            Parent=saleCategory,
                            Singleton=SaleDigital.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="数码相机"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "数码摄像机"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "MP3/MP4"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "口袋数码"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "游戏机"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "其他数码产品"
                                }
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="数码相框",
                                    ObjectTypeId=6,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="相机配件",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="奥林巴斯",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="索尼",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="索尼",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="佳能",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="佳能",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="JVC",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="松下",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="松下",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="三星",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="PSP",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="爱国者",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="富士",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="柯达",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="尼康",
                                    ObjectTypeId=1,
                                },
                            }
                        },
                        #endregion
                        #region 通讯业务
                        new SaleCategory()
                        {
                            Code="tongxunyw",
                            Name="通讯业务",
                            Parent=saleCategory,
                            Singleton=SaleCommunication.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id = 1,
                                    Name = "充值卡"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "手机上网卡"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "手机业务"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "其他"
                                }
                            }  
                        },
                        #endregion
                        #region 办公用品/设备
                        new SaleCategory()
                        {
                            Code="bangong",
                            Name="办公用品/设备",
                            Parent=saleCategory,
                            Singleton=SaleOffice.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="办公设备"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "办公耗材"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "桌面文具"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "办公家具"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "其他办公用品"
                                }
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="打印机",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="复印机",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="传真机",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="多功能一体机",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="墨盒/墨水",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="碳粉/硒鼓",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="扫描仪",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="投影仪",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="会议桌",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="文件柜",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="保险柜",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="办公桌",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="办公椅",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="沙发/茶几",
                                    ObjectTypeId=4,
                                },
                            }
                        },
                        #endregion
                        #region 二手家电
                        new SaleCategory()
                        {
                            Code="jiadian",
                            Name="二手家电",
                            Parent=saleCategory,
                            Singleton=SaleElectric.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="电视机"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "洗衣机"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "空调"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "冰箱/冰柜"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "微波炉"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "饮水机"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "其他家电"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "家电配件"
                                },
                                new ObjectType()
                                {
                                    Id = 9,
                                    Name = "电暖气"
                                }
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="热水器",
                                    ObjectTypeId=7,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="电风扇",
                                    ObjectTypeId=7,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="榨汁机",
                                    ObjectTypeId=7,
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="电磁炉",
                                    ObjectTypeId=7,
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="DVD机",
                                    ObjectTypeId=7,
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="等离子彩电",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="液晶电视机",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="高清电视机",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="全自动洗衣机",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="滚筒洗衣机",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="柜式",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="壁挂式",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="净水器",
                                    ObjectTypeId=7,
                                },
                            }
                        },
                        #endregion
                        #region 二手家具/家居
                        new SaleCategory()
                        {
                            Code="ershoujiaju",
                            Name="二手家具/家居",
                            Parent=saleCategory,
                            Singleton=SaleHome.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="床/床垫"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "柜子"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "桌子"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "椅子/沙发"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "居家用品/家纺"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "其他家具/家居"
                                }
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="双人床",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="单人床",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="双层床",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="童床",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="折叠床",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="床垫",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="衣柜",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="床头柜",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="书柜",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="电视柜",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="餐桌",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="写字桌",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="折叠桌",
                                    ObjectTypeId=3,
                                },
                       
                            }
                        },
                        #endregion
                        #region 母婴/儿童用品
                        new SaleCategory()
                        {
                            Code="yingyou",
                            Name="母婴/儿童用品",
                            Parent=saleCategory,
                            Singleton=SaleBaby.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id = 1,
                                    Name = "孕妇用品"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "婴幼/儿童用品"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "玩具"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "其他母婴用品"
                                }
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="防辐射服",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="孕妇装",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="卫生护理",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="纸尿裤",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="婴儿洗护",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="奶粉",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="婴儿服饰",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="出生纪念品",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="婴儿车",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="婴儿床",
                                    ObjectTypeId=2,
                                },
                        
                            }
                        },
                        #endregion
                        #region 服装/鞋帽/箱包
                        new SaleCategory()
                        {
                            Code="fushi",
                            Name="服装/鞋帽/箱包",
                            Parent=saleCategory,
                            Singleton=SaleClothing.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id = 1,
                                    Name = "服装"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "配饰"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "箱包"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "鞋帽"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "其他"
                                }
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="裙子/连衣裙",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="品牌服装",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="童装",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="皮鞋",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="休闲鞋",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="运动鞋",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="帽子",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="男装",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="女装",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="手套",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="围巾",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="外贸服装",
                                    ObjectTypeId=1,
                                },
                            }
                        },
                        #endregion
                        #region 美容/保健
                        new SaleCategory()
                        {
                            Code="meirong",
                            Name="美容/保健",
                            Parent=saleCategory,
                            Singleton=SaleFacial.Singleton
                        },
                        #endregion
                        #region 文体用品
                        new SaleCategory()
                        {
                            Code="wenti",
                            Name="文体用品",
                            Parent=saleCategory,
                            Singleton=SaleAthletics.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id = 1,
                                    Name = "户外用品"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "健身器材"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "文教用品"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "球类用品"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "乐器"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "游泳用品"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "瑜伽用品"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "钓鱼用具"
                                },
                                new ObjectType()
                                {
                                    Id = 9,
                                    Name = "各类棋牌"
                                },
                                new ObjectType()
                                {
                                    Id = 10,
                                    Name = "其他"
                                }
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="钢琴",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="吉他",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="古筝",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="电子琴",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="游泳用品",
                                    ObjectTypeId=6,
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="足球用品",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="篮球用品",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="羽毛球用品",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="乒乓球用品",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="溜冰/滑板",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="台球用品",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="手风琴",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="二胡",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="乐器配件",
                                    ObjectTypeId=5,
                                },


                                new InfoTag()
                                {
                                    Id=15,
                                    Name="学生文具",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="教学用具",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="提琴",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="踏步机",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="跑步机",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="按摩椅",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=21,
                                    Name="健身车",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=22,
                                    Name="健腹器",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=23,
                                    Name="活力板",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=24,
                                    Name="哑铃",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=25,
                                    Name="麻将",
                                    ObjectTypeId=9,
                                },
                                new InfoTag()
                                {
                                    Id=26,
                                    Name="长笛",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=27,
                                    Name="单簧管",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=28,
                                    Name="萨克斯",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=29,
                                    Name="台球桌",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=30,
                                    Name="网球用品",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=31,
                                    Name="高尔夫球用品",
                                    ObjectTypeId=4,
                                },
                        
                            }
                        },
                        #endregion
                        #region 图书/音像/软件
                        new SaleCategory()
                        {
                            Code="tushu",
                            Name="图书/音像/软件",
                            Parent=saleCategory,
                            Singleton=SaleBook.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id = 1,
                                    Name = "书籍"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "影片/电视剧"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "音乐"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "软件"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "其他图书/音像/软件"
                                }
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="欧美经典",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="国产老片",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="管理类",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="专业/技术",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="工具书/辅导书",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="考试/教材/论文",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="生活类",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="小说/文学",
                                    ObjectTypeId=1,
                                },
                       
                            }
                        },
                        #endregion
                        #region 艺术品/收藏品
                        new SaleCategory()
                        {
                            Code="yishu",
                            Name="艺术品/收藏品",
                            Parent=saleCategory,
                            Singleton=SaleArt.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id = 1,
                                    Name = "古董古玩"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "书法绘画"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "珠宝玉器"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "纪念品"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "工艺品"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "其他"
                                }
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="十字绣",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="珠宝首饰",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="玉器",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="贵金属首饰",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="书法",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="山水画",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="人物画",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="花鸟画",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="装饰画",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="奥运纪念品",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="世博会纪念品",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="邮票邮品",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="钱币",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="雕品",
                                    ObjectTypeId=5,
                                },
                            }
                        },
                        #endregion
                        #region 网游/虚拟物品
                        new SaleCategory()
                        {
                            Code="wangyou",
                            Name="网游/虚拟物品",
                            Parent=saleCategory,
                            Singleton=SaleGame.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="网游点卡"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "装备"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "金币"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "帐号"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "其他"
                                }
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="魔兽世界",
                                    ObjectTypeId=null,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="天龙八部",
                                    ObjectTypeId=null,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="梦幻西游",
                                    ObjectTypeId=null,
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="完美国际",
                                    ObjectTypeId=null,
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="地下城与勇士",
                                    ObjectTypeId=null,
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="诛仙",
                                    ObjectTypeId=null,
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="挑战",
                                    ObjectTypeId=null,
                                },
                        
                            }
                        },
                        #endregion
                        #region 二手设备
                        new SaleCategory()
                        {
                            Code="ershoushebei",
                            Name="二手设备",
                            Parent=saleCategory,
                            Singleton=SaleEquipment.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="化工"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "纺织"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "印刷"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "工程机械"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "塑料"
                                },

                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "机床"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "发电"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "仪器仪表"
                                },
                                new ObjectType()
                                {
                                    Id = 9,
                                    Name = "木工"
                                },
                                new ObjectType()
                                {
                                    Id = 10,
                                    Name = "农业"
                                },
                                new ObjectType()
                                {
                                    Id = 11,
                                    Name = "食品加工"
                                },
                                new ObjectType()
                                {
                                    Id = 12,
                                    Name = "其他"
                                },
                            }
                        },
                        #endregion
                        #region 成人用品 (Google广告不允许，暂时禁用)
                        //new SaleCategory()
                        //{
                        //    Code="chengren",
                        //    Name="成人用品",
                        //    Parent=saleCategory,
                        //    Singleton=SaleSex.Singleton,
                        //    ObjectTypeCollection=new List<ObjectType>()
                        //    {
                        //        new ObjectType()
                        //        {
                        //            Id=1,
                        //            Name="男性用品"
                        //        },
                        //        new ObjectType()
                        //        {
                        //            Id=2,
                        //            Name="女性用品",
                        //        },
                        //        new ObjectType()
                        //        {
                        //            Id=3,
                        //            Name="情趣内衣",
                        //        },
                        //        new ObjectType()
                        //        {
                        //            Id=4,
                        //            Name="安全用品",
                        //        },
                        //        new ObjectType()
                        //        {
                        //            Id=5,
                        //            Name="其他",
                        //        },
                        //    }
                            
                        //},
                        #endregion
                        #region 物品交换
                        new SaleCategory()
                        {
                            Code="huanwu",
                            Name="物品交换",
                            Parent=saleCategory,
                            Singleton=SaleSwap.Singleton
                        },
                        #endregion
                        #region 创意服务交易
                        new SaleCategory()
                        {
                            Code="fuwujy",
                            Name="创意服务交易",
                            Parent=saleCategory,
                            Singleton=SaleService.Singleton
                        },
                        #endregion
                        #region 5元以下物品
                        //new SaleCategory()
                        //{
                        //    Code="wuyuanwupin",
                        //    Name="5元以下物品",
                        //    Parent=saleCategory,
                        //    //Singleton=
                        //},
                        #endregion
                        #region 免费赠送
                        //new SaleCategory()
                        //{
                        //    Code="ershoufree",
                        //    Name="免费赠送",
                        //    Parent=saleCategory,
                        //    //Singleton=
                        //},
                        #endregion
                        #region 校园二手
                        //new SaleCategory()
                        //{
                        //    Code="xiaoyuan",
                        //    Name="校园二手",
                        //    Parent=saleCategory,
                        //    //Singleton=
                        //},
                        #endregion
                        #region 其它跳蚤信息
                        new SaleCategory()
                        {
                            Code="qita",
                            Name="其它跳蚤信息",
                            Parent=saleCategory,
                            Singleton=SaleOther.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="闲置礼品"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "特殊/残疾人用品"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "通讯器材"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "杂七杂八"
                                },
                        
                            }
                        },
                        #endregion
                    }.Select(item=>item as InfoCategory);
                    _categories.Add(saleCategory);
                    #endregion

                    #region 车辆买卖与服务
                    var carCategory = new CarCategory()
                    {
                        Code = "Che",
                        Name = "车辆买卖与服务"
                    };
                    
                    carCategory.Children = new List<CarCategory>()
                    {
                        #region 二手汽车转让
                        new CarCategory()
                        {
                            Code="ershouche",
                            Name="二手汽车转让",
                            Parent=carCategory,
                            Singleton=CarSecondHand.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="轿车/跑车"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="越野车/SUV"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "面包车/MPV"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "客车/货车"
                                },
                            }
                        },
                        #endregion
                        #region 二手汽车求购
                        new CarCategory()
                        {
                            Code="ershoucheqg",
                            Name="二手汽车求购",
                            Parent=carCategory,
                            Singleton=CarBuy.Singleton,
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="经济轿车",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="中级轿车",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="高档轿车",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="商务车",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="越野车",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="面包车",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="客车/中巴",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="货车/皮卡",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="厢式货车",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="其他车型",
                                    ObjectTypeId=null
                                },
                            }
                        },
                        #endregion
                        #region 拼车/顺风车
                        new CarCategory()
                        {
                            Code="pinche",
                            Name="拼车/顺风车",
                            Parent=carCategory,
                            Singleton=Carpool.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="上下班拼车"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "长途拼车"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "拼车自驾游"
                                },
                                //春节拼车，在春节前后在启用.
                                //new ObjectType()
                                //{
                                //    Id = 4,
                                //    Name = "春节拼车"
                                //},
                            }
                        },
                        #endregion
                        #region 二手摩托车
                        new CarCategory()
                        {
                            Code="danche",
                            Name="二手摩托车",
                            Parent=carCategory,
                            Singleton=CarMotor.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="阿普利亚"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "本田"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "宝马"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "比亚乔"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "春兰"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "长铃"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "春风"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "川崎"
                                },
                                new ObjectType()
                                {
                                    Id = 9,
                                    Name = "大阳"
                                },
                                new ObjectType()
                                {
                                    Id = 10,
                                    Name = "丰田"
                                },
                                new ObjectType()
                                {
                                    Id = 11,
                                    Name = "光阳"
                                },
                                new ObjectType()
                                {
                                    Id = 12,
                                    Name = "豪爵"
                                },
                                new ObjectType()
                                {
                                    Id = 13,
                                    Name = "豪爵铃木"
                                },
                                new ObjectType()
                                {
                                    Id = 14,
                                    Name = "哈雷"
                                },
                                new ObjectType()
                                {
                                    Id = 15,
                                    Name = "豪光"
                                },
                                new ObjectType()
                                {
                                    Id = 16,
                                    Name = "黄河川崎"
                                },
                                new ObjectType()
                                {
                                    Id = 17,
                                    Name = "华日"
                                },
                                new ObjectType()
                                {
                                    Id = 18,
                                    Name = "洪都"
                                },
                                new ObjectType()
                                {
                                    Id = 19,
                                    Name = "金城"
                                },
                                new ObjectType()
                                {
                                    Id = 20,
                                    Name = "金城铃木"
                                },
                                new ObjectType()
                                {
                                    Id = 21,
                                    Name = "嘉陵"
                                },
                                new ObjectType()
                                {
                                    Id = 22,
                                    Name = "嘉陵本田"
                                },
                                new ObjectType()
                                {
                                    Id = 23,
                                    Name = "建设"
                                },
                                new ObjectType()
                                {
                                    Id = 24,
                                    Name = "建设雅马哈"
                                },
                                new ObjectType()
                                {
                                    Id = 25,
                                    Name = "金舰"
                                },
                                new ObjectType()
                                {
                                    Id = 26,
                                    Name = "吉利"
                                },
                                new ObjectType()
                                {
                                    Id = 27,
                                    Name = "力帆"
                                },
                                new ObjectType()
                                {
                                    Id = 28,
                                    Name = "隆鑫"
                                },
                                new ObjectType()
                                {
                                    Id = 29,
                                    Name = "铃木"
                                },
                                new ObjectType()
                                {
                                    Id = 30,
                                    Name = "凌云"
                                },
                                new ObjectType()
                                {
                                    Id = 31,
                                    Name = "南方"
                                },
                                new ObjectType()
                                {
                                    Id = 32,
                                    Name = "钱江"
                                },
                                new ObjectType()
                                {
                                    Id = 33,
                                    Name = "轻骑"
                                },
                                new ObjectType()
                                {
                                    Id = 34,
                                    Name = "轻骑铃木"
                                },
                                new ObjectType()
                                {
                                    Id = 35,
                                    Name = "轻骑木兰"
                                },
                                new ObjectType()
                                {
                                    Id = 36,
                                    Name = "三铃"
                                },
                                new ObjectType()
                                {
                                    Id = 37,
                                    Name = "五羊本田"
                                },
                                new ObjectType()
                                {
                                    Id = 38,
                                    Name = "新大洲"
                                },
                                new ObjectType()
                                {
                                    Id = 39,
                                    Name = "新大洲本田"
                                },
                                new ObjectType()
                                {
                                    Id = 40,
                                    Name = "幸福"
                                },
                                new ObjectType()
                                {
                                    Id = 41,
                                    Name = "雅马哈"
                                },
                                new ObjectType()
                                {
                                    Id = 42,
                                    Name = "宗申"
                                },
                                new ObjectType()
                                {
                                    Id = 43,
                                    Name = "其他"
                                },
                                new ObjectType()
                                {
                                    Id = 44,
                                    Name = "不限"
                                },
                            },
                            TagCollection = new List<InfoTag>()
                           {
                               new InfoTag()
                               {
                                   Id=1,
                                   Name="弯梁车",
                                   ObjectTypeId=null
                               },
                               new InfoTag()
                               {
                                   Id=2,
                                   Name="踏板车",
                                   ObjectTypeId=null
                               },
                               new InfoTag()
                               {
                                   Id=3,
                                   Name="骑式车",
                                   ObjectTypeId=null
                               },
                               new InfoTag()
                               {
                                   Id=4,
                                   Name="太子车",
                                   ObjectTypeId=null
                               },
                               new InfoTag()
                               {
                                   Id=5,
                                   Name="迷你车",
                                   ObjectTypeId=null
                               },
                               new InfoTag()
                               {
                                   Id=6,
                                   Name="越野摩托",
                                   ObjectTypeId=null
                               },
                               new InfoTag()
                               {
                                   Id=7,
                                   Name="沙滩车",
                                   ObjectTypeId=null
                               },
                               new InfoTag()
                               {
                                   Id=8,
                                   Name="大排量",
                                   ObjectTypeId=null
                               },
                               new InfoTag()
                               {
                                   Id=9,
                                   Name="公路赛车",
                                   ObjectTypeId=null
                               },
                               new InfoTag()
                               {
                                   Id=10,
                                   Name="三轮摩托",
                                   ObjectTypeId=null
                               },
                           }
                        },
                        #endregion
                        #region 自行车/电动车
                        new CarCategory()
                        {
                            Code="zixingche",
                            Name="自行车/电动车",
                            Parent=carCategory,
                            Singleton=CarBicycle.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="自行车"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "电动车"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "三轮车"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "配件/装备"
                                },
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="公路自行车",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="场地自行车",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="山地自行车",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="自行车赛车",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="折叠自行车",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="自行车配件",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="电动车电池",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="电动车配件",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="迷你自行车",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="普通自行车",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="电动自行车",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="电动摩托车",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="折叠电动车",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="迷你电动车",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="助动车",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="电动观光车",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="脚踏三轮车",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="电动三轮车",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="助力三轮车",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="助动车配件",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=21,
                                    Name="修车工具",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=22,
                                    Name="骑行装备",
                                    ObjectTypeId=4
                                },
                            }
                        },
                        #endregion
                        #region 汽车配件
                        new CarCategory()
                        {
                            Code="peijian",
                            Name="汽车配件",
                            Parent=carCategory,
                            Singleton=CarFitting.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="发动机配件"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "汽车底盘"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "车身附件"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "电子电器"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "视听设备"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "养护用品"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "汽车用品"
                                },
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="外部用品",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="发动机",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="制动器",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="汽车饰品",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="车灯",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="安全用品",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="行走系统",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="传动轴",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="维护用品",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="脚垫",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="轮胎",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="汽车贴膜",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="发电机",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="起动机",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="节油器",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="散热器",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="轮毂",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="轴承",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="齿轮",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="GPS导航",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=21,
                                    Name="蓄电池",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=22,
                                    Name="倒车雷达",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=23,
                                    Name="电磁阀",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=24,
                                    Name="逆变器",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=25,
                                    Name="逆变电源",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=26,
                                    Name="后视镜",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=27,
                                    Name="喇叭",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=28,
                                    Name="雨刷",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=29,
                                    Name="氙气灯",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=30,
                                    Name="座椅",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=31,
                                    Name="天线",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=32,
                                    Name="汽车空调",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=33,
                                    Name="车载MP3",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=34,
                                    Name="车载DVD",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=35,
                                    Name="汽车音响",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=36,
                                    Name="机油",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=37,
                                    Name="润滑油",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=38,
                                    Name="防冻液",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=39,
                                    Name="玻璃水",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=40,
                                    Name="汽车坐垫",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=41,
                                    Name="车位锁",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=42,
                                    Name="防盗器",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=43,
                                    Name="刹车片",
                                    ObjectTypeId=2
                                },
                            }
                        },
                        #endregion
                        #region 汽车服务/过户
                        new CarCategory()
                        {
                            Code="cheliangfuwu",
                            Name="汽车服务/过户",
                            Parent=carCategory,
                            Singleton=CarService.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="汽车检修"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "汽车保养"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "4S店/经销商"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "保险理赔过户"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "汽车服务"
                                },
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="汽车维修",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="汽车检测",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="汽车装饰",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="洗车",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="汽车打蜡",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="汽车烤漆",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="货运车",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="吉普车",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="旅行车",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="面包车",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="跑车",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="商务车",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="小轿车",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="汽车保险",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="汽车理赔",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="代办过户",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="二手车行",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="汽车美容",
                                    ObjectTypeId=2
                                },
                            }
                        },
                        #endregion
                        //new CarCategory()//租车已放入黄页
                        //{
                        //    Code="zuche",
                        //    Name="租车",
                        //    Parent=carCategory,
                        //    Singleton=CarRent.Singleton
                        //},
                        #region 代驾/陪练/驾校
                        new CarCategory()
                        {
                            Code="peijia",
                            Name="代驾/陪练/驾校",
                            Parent=carCategory,
                            Singleton=CarAccompany.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="代驾"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "陪练"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "驾校"
                                },
                            }
                        },
                        #endregion
                        #region 其它
                        new CarCategory()
                        {
                            Code="qita",
                            Name="其它",
                            Parent=carCategory,
                            Singleton=CarOther.Singleton
                        },
                        #endregion
                    }.Select(item=>item as InfoCategory);
                    _categories.Add(carCategory);
                    #endregion

                    #region 黄页
                    var yellowCategory = new YellowPageCategory()
                    {
                        Code = "HuangYe",
                        Name = "黄页",
                    };
                    yellowCategory.Children = new List<YellowPageCategory>()
                    {
                        #region 生活服务
                        #region 搬家
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.BanJia),
                            Code="banjia",
                            Name="搬家",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="空调拆装"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="公司搬家"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="搬家搬场"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="长途搬家搬运"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="起重吊装"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="设备搬迁"
                                },
                            }
                        },
                        #endregion

                        #region 家政
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.JiaZheng),
                            Code="jiazheng",
                            Name="家政",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="月嫂/育婴师"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="保姆"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="钟点工"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="家庭护理"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="管家"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="医疗陪护"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="涉外家政"
                                },
                                        
                            }
                        },
                        #endregion

                        #region 保洁清洗
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.BaoJie),
                            Code="baojie",
                            Name="保洁清洗",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="日常保洁"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="开荒保洁"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="外墙清洗"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="工程保洁"
                                },
                            }
                        },
                        #endregion

                        #region 管道疏通
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ShuTong),
                            Code="shutong",
                            Name="管道疏通",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="管道疏通"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="下水道疏通"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="马桶疏通"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="化粪池清理"
                                },
                            }
                        },
                        #endregion

                        #region 二手回收
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.HuiShou),
                            Code="huishou",
                            Name="二手回收",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="手机回收"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="电器回收"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="电脑回收"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="家具家居回收"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="办公用品回收"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="数码电子回收"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="资源回收"
                                },

                                new ObjectType()
                                {
                                    Id=8,
                                    Name="金属回收"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="设备回收"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="其他回收"
                                },
                            }
                        },
                        #endregion

                        #region 租车
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ZuChe),
                            Code="zuche",
                            Name="租车",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="租车行"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="旅游租车"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="商务租车"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="司机"
                                },
                            }
                        },
                        #endregion

                        #region 生活配送
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ShengHuoPeiSong),
                            Code="ShengHuoPeiSong",
                            Name="生活配送",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="送气"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="送米"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="送水"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="跑腿服务"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="蔬菜配送"
                                },
                            }
                        },
                        #endregion

                        #region 礼品/鲜花
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.LiPinXianHua),
                            Code="lipinxianhua",
                            Name="礼品/鲜花",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="礼品"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="鲜花"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="绿植盆栽"
                                },
                            }
                        },
                        #endregion

                        #region 租赁
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ZuLin),
                            Code="zulin",
                            Name="租赁",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="机械设备租赁"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="办公设备租赁"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="庆典会展租赁"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="其他租赁"
                                },
                            }
                        },
                        #endregion

                        #region 食品
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ShiPin),
                            Code="shipin",
                            Name="食品",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="酒类"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="茶叶"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="土特产"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="休闲食品"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="方便食品"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="肉制品"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="海鲜类"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="果蔬类"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="礼品卡"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="其他食品"
                                },
                            }
                        },
                        #endregion

                        #region 餐饮
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.CanYin),
                            Code="canyin",
                            Name="餐饮",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="中餐"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="西餐"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="日韩/东南亚"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="火锅"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="海鲜"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="自助"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="蛋糕/甜点/冰淇淋"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="其他"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="快餐/外卖"
                                },
                            }
                        },
                        #endregion

                        #region 美发/美体
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.MeiFaMeiTi),
                            Code="MeiFaMeiTi",
                            Name="美发/美体",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="美体塑身"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="美发"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="丰胸"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="美容美甲"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="纹身"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="脱毛"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="除疤痕"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="面部美容"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="瘦脸"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="男士美容"
                                },
                            }
                        },
                        #endregion
  
                        #region 娱乐休闲
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.YuLeXiuXian),
                            Code="YuLeXiuXian",
                            Name="娱乐休闲",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="KTV"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="迪厅舞厅"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="酒吧"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="网吧"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="游戏厅"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="夜总会"
                                },
                            }
                        },
                        #endregion

                        #region 运动健身
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.YunDongJianShen),
                            Code="YunDongJianShen",
                            Name="运动健身",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="健身/舞蹈"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="瑜伽馆"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="舍宾"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="跆拳道馆"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="拳击"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="武术"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="游泳"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="羽毛球"
                                },
                            }
                        },
                        #endregion

                        #region 户外
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.HuWaiYundong),
                            Code="huwaiyundong",
                            Name="户外",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="滑雪场"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="溜冰场"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="攀岩"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="骑马"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="卡丁车"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="滑翔/热气球"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="蹦极"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="潜水"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="漂流"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="野外生存/拓展"
                                },
                            }
                        },
                        #endregion

                        #region 专科医院
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ZhuanKeYiYuan),
                            Code="zhuankeyiyuan",
                            Name="专科医院",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="皮肤病"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="妇科医院"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="不孕不育"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="男科"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="脑科"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="骨科"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="口腔"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="眼科"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="整形美容"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="其他特色专科"
                                },
                            }
                        },
                        #endregion

                        #region 其他生活服务
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.QiTaShengHuoFuWu),
                            Code="QiTaShengHuoFuWu",
                            Name="其他生活服务",
                            BigType=Infomation.Core.YellowPageBigType.ShengHuo,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="干洗店"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="殡葬"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="其他"
                                },
                            }
                        },
                        #endregion
                        #endregion

                        #region 商务服务
                        #region 印刷包装
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.YinShua),
                            Code="yinshua",
                            Name="印刷包装",
                            BigType=Infomation.Core.YellowPageBigType.ShangWu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="不干胶印刷"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="无碳复写"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="包装袋印刷"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="纸类印刷"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="防伪印刷"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="丝网印刷"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="数码印刷"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="包装"
                                },
                            }
                        },
                        #endregion

                        #region 喷绘招牌
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.PenHui),
                            Code="penhui",
                            Name="喷绘招牌",
                            BigType=Infomation.Core.YellowPageBigType.ShangWu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="喷绘"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="招牌制作"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="吸塑"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="广告招牌"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="led制作"
                                },
                            }
                        },
                        #endregion

                        #region 设计策划
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.SheJiCeHua),
                            Code="SheJiCeHua",
                            Name="设计策划",
                            BigType=Infomation.Core.YellowPageBigType.ShangWu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="名片设计"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="平面设计"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="广告策划"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="工业设计"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="品牌策划"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="店面设计"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="装潢设计"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="动画设计"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="影视制作"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="vi设计"
                                },
                            }
                        },
                        #endregion

                        #region 广告传媒
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ChuanMei),
                            Code="chuanmei",
                            Name="广告传媒",
                            BigType=Infomation.Core.YellowPageBigType.ShangWu,
                            Parent=yellowCategory,
                        },
                        #endregion

                        #region 网络维护及布线
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.WangLuoWeiHu),
                            Code="WangLuoWeiHu",
                            Name="网络维护及布线",
                            BigType=Infomation.Core.YellowPageBigType.ShangWu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="绘合布线"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="系统集成"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="安防监控"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="IT外包"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="电脑组装"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="网络维护"
                                },
                            }
                        },
                        #endregion

                        #region 网站建设/推广
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.WangZhan),
                            Code="wangzhan",
                            Name="网站建设/推广",
                            BigType=Infomation.Core.YellowPageBigType.ShangWu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="网站建设"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="网站域名"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="网站推广"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="服务器租用"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="主机托管"
                                },
                            }
                        },
                        #endregion

                        #region 制卡
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ZhiKa),
                            Code="zhika",
                            Name="制卡",
                            BigType=Infomation.Core.YellowPageBigType.ShangWu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="智能卡"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="PVC卡"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="人像证卡"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="纸卡"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="金属卡"
                                },
                            }
                        },
                        #endregion

                        #region 翻译/速记
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.FanYi),
                            Code="fanyi",
                            Name="翻译/速记",
                            BigType=Infomation.Core.YellowPageBigType.ShangWu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="笔译"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="口译"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="同声传译"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="本地化翻译"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="速记"
                                },
                            },
                            #region 标签
                            TagCollection=new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="英语",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="日语",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="韩语",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="法语",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="德语",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="小语种",
                                    ObjectTypeId=null
                                },
                            }
                            #endregion
                        },
                        #endregion

                        #region 咨询服务
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ZiXunFuWu),
                            Code="ZiXunFuWu",
                            Name="咨询服务",
                            BigType=Infomation.Core.YellowPageBigType.ShangWu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="人才/职介"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="户口咨询"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="心理咨询"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="企业公关"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="调查清债"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="起名/风水"
                                },
                            }
                        },
                        #endregion

                        #region 货运专线
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.HuoYun),
                            Code="huoyun",
                            Name="货运专线",
                            BigType=Infomation.Core.YellowPageBigType.ShangWu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="国内货运专线"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="国际货运专线"
                                },
                            }
                        },
                        #endregion

                        #region 物流服务
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.WuLiu),
                            Code="wuliu",
                            Name="物流服务",
                            BigType=Infomation.Core.YellowPageBigType.ShangWu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="国际货运"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="国内货运"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="全国零担"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="物流专线"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="航空运输"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="仓储"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="进出口报关"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="货运代理"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="托运"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="空车配货"
                                },
                            }
                        },
                        #endregion

                        #region 快递
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.KuaiDi),
                            Code="kuaidi",
                            Name="快递",
                            BigType=Infomation.Core.YellowPageBigType.ShangWu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="同城快递"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="国内快递"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="国际快递"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="货物快递"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="小件速递"
                                },
                            }
                        },
                        #endregion
                        #endregion

                        #region 维修/装修
                        #region 家电维修
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.JiaDianWeiXiu),
                            Code="JiaDianWeiXiu",
                            Name="家电维修",
                            BigType=Infomation.Core.YellowPageBigType.WeiXiuZhuangXiu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="空调维修",
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="手机维修"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="冰箱维修"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="热水器维修"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="电视维修"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="洗衣机维修"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="微波炉维修"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="数码维修"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="抽油烟机维修"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="燃气灶维修"
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="饮水机维修"
                                },
                                new ObjectType()
                                {
                                    Id=12,
                                    Name="音响/功放维修"
                                },
                                new ObjectType()
                                {
                                    Id=13,
                                    Name="电磁炉维修"
                                },
                                new ObjectType()
                                {
                                    Id=14,
                                    Name="其它家电维修"
                                },
                            },
                            #region 标签
                            TagCollection=new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="创维",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="长虹",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="康佳",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="海信",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="TCL",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="飞利浦",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="海尔",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="东芝",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="松下",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="三星",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="索尼",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="三洋",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="LG",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="JVC",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="厦华",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="日立",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="夏普",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="大金",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="三星",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="海信",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=21,
                                    Name="开利",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=22,
                                    Name="科龙",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=23,
                                    Name="格兰仕",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=24,
                                    Name="美的",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=25,
                                    Name="格力",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=26,
                                    Name="海尔",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=27,
                                    Name="春兰",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=28,
                                    Name="奥克斯",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=29,
                                    Name="日立",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=30,
                                    Name="中央",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=31,
                                    Name="志高",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=32,
                                    Name="LG",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=33,
                                    Name="TCL",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=34,
                                    Name="三菱",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=35,
                                    Name="澳柯玛",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=36,
                                    Name="长虹",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=37,
                                    Name="松下",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=38,
                                    Name="伊莱克斯",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=39,
                                    Name="三洋",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=40,
                                    Name="惠而浦",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=41,
                                    Name="三星",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=42,
                                    Name="索尼",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=43,
                                    Name="佳能",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=44,
                                    Name="富士",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=45,
                                    Name="松下",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=46,
                                    Name="卡西欧",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=47,
                                    Name="柯达",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=48,
                                    Name="尼康",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=49,
                                    Name="奥林巴斯",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=50,
                                    Name="爱国者",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=51,
                                    Name="JVC",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=52,
                                    Name="美能达",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=53,
                                    Name="理光",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=54,
                                    Name="宾得",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=55,
                                    Name="步步高dvd",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=56,
                                    Name="新科dvd",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=57,
                                    Name="万利达dvd",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=58,
                                    Name="金正dvd",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=59,
                                    Name="海尔",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=60,
                                    Name="小天鹅",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=61,
                                    Name="惠而浦",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=62,
                                    Name="松下",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=63,
                                    Name="三星",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=64,
                                    Name="荣事达",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=65,
                                    Name="日立",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=66,
                                    Name="小鸭",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=67,
                                    Name="金羚",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=68,
                                    Name="西门子",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=69,
                                    Name="三洋",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=70,
                                    Name="LG",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=71,
                                    Name="TCL",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=72,
                                    Name="夏普",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=73,
                                    Name="伊莱克斯",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=74,
                                    Name="博世",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=75,
                                    Name="三星",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=76,
                                    Name="诺基亚",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=77,
                                    Name="苹果",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=78,
                                    Name="摩托罗拉",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=79,
                                    Name="索爱",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=80,
                                    Name="夏普",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=81,
                                    Name="LG",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=82,
                                    Name="多普达",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=83,
                                    Name="联想",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=84,
                                    Name="安吉尔",
                                    ObjectTypeId=11
                                },
                                new InfoTag()
                                {
                                    Id=85,
                                    Name="美的",
                                    ObjectTypeId=11
                                },
                                new InfoTag()
                                {
                                    Id=86,
                                    Name="沁园",
                                    ObjectTypeId=11
                                },
                                new InfoTag()
                                {
                                    Id=87,
                                    Name="司迈特",
                                    ObjectTypeId=11
                                },
                                new InfoTag()
                                {
                                    Id=88,
                                    Name="浪木",
                                    ObjectTypeId=11
                                },
                                new InfoTag()
                                {
                                    Id=89,
                                    Name="澳柯玛",
                                    ObjectTypeId=11
                                },
                                new InfoTag()
                                {
                                    Id=90,
                                    Name="比力奇",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=91,
                                    Name="阿里斯顿",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=92,
                                    Name="万家乐",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=93,
                                    Name="史密斯",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=94,
                                    Name="樱花",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=95,
                                    Name="海尔",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=96,
                                    Name="美的",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=97,
                                    Name="太阳能",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=98,
                                    Name="万和",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=99,
                                    Name="林内",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=100,
                                    Name="博世",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=101,
                                    Name="松下",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=102,
                                    Name="华帝",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=103,
                                    Name="帅康",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=104,
                                    Name="前锋",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=105,
                                    Name="格力",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=106,
                                    Name="方太",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=107,
                                    Name="西门子",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=108,
                                    Name="澳柯玛",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=109,
                                    Name="新飞",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=110,
                                    Name="容声",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=111,
                                    Name="西门子",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=112,
                                    Name="海尔",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=113,
                                    Name="伊莱克斯",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=114,
                                    Name="科龙",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=115,
                                    Name="松下",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=116,
                                    Name="小天鹅",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=117,
                                    Name="美菱",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=118,
                                    Name="三星",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=119,
                                    Name="海信",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=120,
                                    Name="东芝",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=121,
                                    Name="华凌",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=122,
                                    Name="TCL",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=123,
                                    Name="澳柯玛",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=124,
                                    Name="美的",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=125,
                                    Name="荣事达",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=126,
                                    Name="LG",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=127,
                                    Name="上菱",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=128,
                                    Name="格兰仕",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=129,
                                    Name="美的",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=130,
                                    Name="松下",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=131,
                                    Name="海尔",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=132,
                                    Name="LG",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=133,
                                    Name="三洋",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=134,
                                    Name="三星",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=135,
                                    Name="樱花",
                                    ObjectTypeId=10
                                },
                                new InfoTag()
                                {
                                    Id=136,
                                    Name="方太",
                                    ObjectTypeId=10
                                },
                                new InfoTag()
                                {
                                    Id=137,
                                    Name="帅康",
                                    ObjectTypeId=10
                                },
                                new InfoTag()
                                {
                                    Id=138,
                                    Name="万喜",
                                    ObjectTypeId=10
                                },
                                new InfoTag()
                                {
                                    Id=139,
                                    Name="美的",
                                    ObjectTypeId=10
                                },
                                new InfoTag()
                                {
                                    Id=140,
                                    Name="雅佳",
                                    ObjectTypeId=10
                                },
                                new InfoTag()
                                {
                                    Id=141,
                                    Name="松下",
                                    ObjectTypeId=10
                                },
                                new InfoTag()
                                {
                                    Id=142,
                                    Name="普田",
                                    ObjectTypeId=10
                                },
                                new InfoTag()
                                {
                                    Id=143,
                                    Name="得力",
                                    ObjectTypeId=10
                                },
                                new InfoTag()
                                {
                                    Id=144,
                                    Name="万和",
                                    ObjectTypeId=10
                                },
                                new InfoTag()
                                {
                                    Id=145,
                                    Name="海尔",
                                    ObjectTypeId=10
                                },
                                new InfoTag()
                                {
                                    Id=146,
                                    Name="帅康",
                                    ObjectTypeId=9
                                },
                                new InfoTag()
                                {
                                    Id=147,
                                    Name="方太",
                                    ObjectTypeId=9
                                },
                                new InfoTag()
                                {
                                    Id=148,
                                    Name="老板",
                                    ObjectTypeId=9
                                },
                                new InfoTag()
                                {
                                    Id=149,
                                    Name="华帝",
                                    ObjectTypeId=9
                                },
                                new InfoTag()
                                {
                                    Id=150,
                                    Name="普田",
                                    ObjectTypeId=9
                                },
                                new InfoTag()
                                {
                                    Id=151,
                                    Name="樱花",
                                    ObjectTypeId=9
                                },
                                new InfoTag()
                                {
                                    Id=152,
                                    Name="万和",
                                    ObjectTypeId=9
                                },
                                new InfoTag()
                                {
                                    Id=153,
                                    Name="德意",
                                    ObjectTypeId=9
                                },
                                new InfoTag()
                                {
                                    Id=154,
                                    Name="美的",
                                    ObjectTypeId=9
                                },
                                new InfoTag()
                                {
                                    Id=155,
                                    Name="科宝",
                                    ObjectTypeId=9
                                },
                                new InfoTag()
                                {
                                    Id=156,
                                    Name="美的",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=157,
                                    Name="富士宝",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=158,
                                    Name="尚朋堂",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=159,
                                    Name="九阳",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=160,
                                    Name="苏泊尔",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=161,
                                    Name="万利达",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=162,
                                    Name="奔腾",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=163,
                                    Name="格兰仕",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=164,
                                    Name="爱庭",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=165,
                                    Name="乐邦",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=166,
                                    Name="容声",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=167,
                                    Name="老板",
                                    ObjectTypeId=10
                                },
                                new InfoTag()
                                {
                                    Id=168,
                                    Name="华帝",
                                    ObjectTypeId=10
                                },
                            }
                            #endregion
                        },
                        #endregion

                        #region 电脑维修
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.DianNaoWeiXiu),
                            Code="DianNaoWeiXiu",
                            Name="电脑维修",
                            BigType=Infomation.Core.YellowPageBigType.WeiXiuZhuangXiu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="台式电脑"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="服务器维修"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="笔记本维修"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="数据恢复"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="电脑显示器维修"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="硬盘维修"
                                },
                            },
                            #region Tags
                            TagCollection=new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="松下",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="清华紫光",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="LG",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="海尔",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="清华同方",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="苹果",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="方正",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="NEC",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="神舟",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="明基",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="宏基",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="东芝",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="索尼",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="联想",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="惠普",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="戴尔",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="IBM",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="三星",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="明基",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="惠普",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=21,
                                    Name="联想",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=22,
                                    Name="IBM",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=23,
                                    Name="神舟",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=24,
                                    Name="清华同方",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=25,
                                    Name="戴尔",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=26,
                                    Name="东芝",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=27,
                                    Name="宏基",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=28,
                                    Name="三星",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=29,
                                    Name="TCL",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=30,
                                    Name="清华紫光",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=31,
                                    Name="索尼",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=32,
                                    Name="松下",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=33,
                                    Name="NEC",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=34,
                                    Name="方正",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=35,
                                    Name="富士通",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=36,
                                    Name="LG",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=37,
                                    Name="海尔",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=38,
                                    Name="长城",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=39,
                                    Name="华硕",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=40,
                                    Name="夏普",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=41,
                                    Name="苹果",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=42,
                                    Name="华硕",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=43,
                                    Name="TCL",
                                    ObjectTypeId=3
                                },
                                        
                            }
                            #endregion
                        },
                        #endregion

                        #region 办公设备维修
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.BGSBWX),
                            Code="bgsbwx",
                            Name="办公设备维修",
                            BigType=Infomation.Core.YellowPageBigType.WeiXiuZhuangXiu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="打印机维修"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="复印机维修"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="传真机维修"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="印刷机维修"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="绘图仪维修"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="喷码机维修"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="集团电话维修"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="液晶屏/触摸屏维修"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="投影机维修"
                                },
                            },
                            #region 标签
                            TagCollection=new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="惠普",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="佳能",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="爱普生",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="三星",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="联想",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="兄弟",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="松下",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="东芝",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="理光",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="夏普",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="佳能",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="美能达",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="施乐",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="京瓷",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="三洋",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="松下",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="三星",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="惠普",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="佳能",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="夏普",
                                    ObjectTypeId=3
                                },
                            }
                            #endregion
                        },
                        #endregion

                        #region 家居维修
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.JiaJuWeiXiu),
                            Code="jiajuweixiu",
                            Name="家居维修",
                            BigType=Infomation.Core.YellowPageBigType.WeiXiuZhuangXiu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="家具维修"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="沙发护理"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="开锁/换锁/修锁"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="门窗维修"
                                },
                            }
                        },
                        #endregion

                        #region 装修/装饰
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ZhuangXiu),
                            Code="zhuangxiu",
                            Name="装修/装饰",
                            BigType=Infomation.Core.YellowPageBigType.WeiXiuZhuangXiu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="家庭装修"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="装饰"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="办公装修"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="场所装修"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="二手房装修"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="旧房翻新"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="工程装修"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="墙艺"
                                },
                            },
                            #region 标签
                            TagCollection=new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="服装店装修",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="餐饮装修",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="酒店装修",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="美发店装修",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="专卖店装修",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="饰品店装修",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="精品店装修",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="展厅装修",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="眼镜店装修",
                                    ObjectTypeId=4
                                },
                            }
                            #endregion
                        },
                        #endregion

                        #region 房屋维修/防水
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.FangWeiXiu),
                            Code="fangweixiu",
                            Name="房屋维修/防水",
                            BigType=Infomation.Core.YellowPageBigType.WeiXiuZhuangXiu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="水管安装/维修"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="电路维修/安装"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="防水补漏"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="暖气安装/维修"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="打孔"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="打井"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="粉刷/防腐"
                                },
                            }
                        },
                        #endregion

                        #region 建材
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.JianCai),
                            Code="jiancai",
                            Name="建材",
                            BigType=Infomation.Core.YellowPageBigType.WeiXiuZhuangXiu,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="照明灯具"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="卫浴洁具"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="地板地砖"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="门窗"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="厨房洁具"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="钢材"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="五金电料"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="油漆墙纸"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="彩钢"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="木材"
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="其他"
                                },
                            }
                        },
                        #endregion
                        #endregion

                        #region 旅游/酒店/签证
                        #region 旅行社
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.LvXingShe),
                            Code="LvXingShe",
                            Name="旅行社",
                            BigType=Infomation.Core.YellowPageBigType.LvYouXiuXian,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>() 

                        },
                        #endregion

                        #region 国内旅游线路
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.GuoNeiLvYou),
                            Code="GuoNeiLvYou",
                            Name="国内旅游线路",
                            BigType=Infomation.Core.YellowPageBigType.LvYouXiuXian,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="一日游"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="二日游"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="三日及以上"
                                },
                            }
                        },
                        #endregion

                        #region 国际旅游线路
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ChuGuoLvYou),
                            Code="ChuGuoLvYou",
                            Name="国际旅游线路",
                            BigType=Infomation.Core.YellowPageBigType.LvYouXiuXian,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="东南亚"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="日韩"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="欧洲"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="澳洲"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="非洲中东"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="美洲"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="其他"
                                },
                            },
                            #region 标签
                            TagCollection=new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="泰国",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="新加坡",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="马来西亚",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="柬埔寨",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="菲律宾",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="越南",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="印度/尼泊尔",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="普吉岛",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="巴厘岛",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="东京",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="北海道",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="首尔",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="济州岛",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="畅游多国",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="欧洲深度游",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="澳大利亚",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="新西兰",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="塞班岛",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="斐济/大溪地",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="埃及",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=21,
                                    Name="土耳其",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=22,
                                    Name="阿联酋迪拜",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=23,
                                    Name="以色列",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=24,
                                    Name="南非",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=25,
                                    Name="肯尼亚",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=26,
                                    Name="美国",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=27,
                                    Name="夏威夷",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=28,
                                    Name="关岛",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=29,
                                    Name="加拿大",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=30,
                                    Name="墨西哥",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=31,
                                    Name="巴西",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=32,
                                    Name="阿根廷",
                                    ObjectTypeId=6
                                },
                                       
                            }
                            #endregion
                        },
                        #endregion

                        #region 港澳台游
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.GangAoTaiYou),
                            Code="GangAoTaiYou",
                            Name="港澳台游",
                            BigType=Infomation.Core.YellowPageBigType.LvYouXiuXian,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="港澳旅游"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="台湾旅游"
                                },
                            }
                        },
                        #endregion

                        #region 周边游
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ZhouBianYou),
                            Code="zhoubianyou",
                            Name="周边游",
                            BigType=Infomation.Core.YellowPageBigType.LvYouXiuXian,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="一日游"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="二日游"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="三日及以上"
                                },
                            }
                        },
                        #endregion

                        #region 度假村/农家乐
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.DuJia),
                            Code="dujia",
                            Name="度假村/农家乐",
                            BigType=Infomation.Core.YellowPageBigType.LvYouXiuXian,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="周边度假村"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="温泉度假村"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="农家乐"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="采摘"
                                },
                            },
                            #region 标签
                            TagCollection=new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="草莓采摘",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="樱桃采摘",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="杨梅采摘",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="桑葚采摘",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="杏采摘",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="枇杷采摘",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="葡萄采摘",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="西瓜采摘",
                                    ObjectTypeId=4
                                },
                            }
                            #endregion
                        },
                        #endregion

                        #region 酒店预订
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.Jdyd),
                            Code="jdyd",
                            Name="酒店预订/住宿",
                            BigType=Infomation.Core.YellowPageBigType.LvYouXiuXian,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="星级酒店"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="经济型酒店"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="宾馆/旅店/招待所"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="特价住宿"
                                },
                            }
                        },
                        #endregion

                        #region 代办签证/签注
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.Visa),
                            Code="visa",
                            Name="代办签证/签注",
                            BigType=Infomation.Core.YellowPageBigType.LvYouXiuXian,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="旅游签证"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="商务工作签证"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="探亲访友签证"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="港澳台签注"
                                },
                            }
                        },
                        #endregion
                        #endregion

                        #region 公司注册/法律/财税
                        #region 工商注册
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ZhuCe),
                            Code="zhuce",
                            Name="工商注册",
                            BigType=Infomation.Core.YellowPageBigType.ZhuceFalvCaiShui,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="公司注册"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="海外公司注册"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="工商年检"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="办证咨询"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="代办审批"
                                },
                            }
                        },
                        #endregion

                        #region 法律咨询
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.Lvshi),
                            Code="lvshi",
                            Name="法律咨询",
                            BigType=Infomation.Core.YellowPageBigType.ZhuceFalvCaiShui,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="法律顾问"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="知识产权"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="法律援助"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="劳动纠纷"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="商业纠纷"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="房地产纠纷"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="诉讼代理"
                                },
                            }
                        },
                        #endregion

                        #region 财务会计/评估
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.CaiShui),
                            Code="caishui",
                            Name="财务会计/评估",
                            BigType=Infomation.Core.YellowPageBigType.ZhuceFalvCaiShui,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="会计服务"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="代理记账"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="验资"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="财务审计"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="评估"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="税务顾问"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="工程造价"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="其他财税疑难"
                                },
                            }
                        },
                        #endregion

                        #region 担保/保险/投资
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.DanBaoBaoXianTouZi),
                            Code="danbaobaoxiantouzi",
                            Name="担保/保险/投资",
                            BigType=Infomation.Core.YellowPageBigType.ZhuceFalvCaiShui,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="担保"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="保险"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="投资"
                                },
                            }
                        },
                        #endregion

                        #region 商标专利
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.ShangBiaoZhuanLi),
                            Code="ShangBiaoZhuanLi",
                            Name="商标专利",
                            BigType=Infomation.Core.YellowPageBigType.ZhuceFalvCaiShui,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="商标注册"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="商标转让"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="专项审批"
                                },
                            }
                        },
                        #endregion
                        #endregion

                        #region 便民服务
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.BianMin),
                            Code="BianMin",
                            BigType=YellowPageBigType.BianMin,
                            Name="便民服务",
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="银行",
                                    Tag="yinhang"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="金融机构",
                                    Tag="jinrongjg"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="邮局通讯",
                                    Tag="youjutx"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="家电卖场",
                                    Tag="jiadianmc"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="医院",
                                    Tag="yiyuan"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="药店",
                                    Tag="yaodian"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="书店",
                                    Tag="shudian"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="商场",
                                    Tag="shangchang"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="超市便利店",
                                    Tag="chaoshibld"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="加油站",
                                    Tag="jiayouzhan"
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="自来水/电力营业厅",
                                    Tag="zilaishui"
                                },
                            }
                        },
                        #endregion

                        #region 招商加盟
                        #region 餐饮加盟
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.CanYinJia),
                            Code="canyinjia",
                            Name="餐饮加盟",
                            BigType=Infomation.Core.YellowPageBigType.ZhaoShang,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="传统食品"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="时尚饮品"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="经典小吃"
                                },
                            }
                        },
                        #endregion

                        #region 服装加盟
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.FuZhuangJia),
                            Code="fuzhuangjia",
                            Name="服装加盟",
                            BigType=Infomation.Core.YellowPageBigType.ZhaoShang,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="女装加盟"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="男装加盟"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="内衣加盟"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="童装加盟"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="女鞋"
                                },
                                //new YellowPageCategory()
                                //{
                                //    Id=6,
                                //    Name="箱包"
                                //},
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="运动装"
                                },
                            }
                        },
                        #endregion

                        #region 礼品饰品
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.LiPinShiPin),
                            Code="lipinshipin",
                            Name="礼品饰品",
                            BigType=Infomation.Core.YellowPageBigType.ZhaoShang,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="两元店"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="韩国饰品"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="饰品加盟"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="礼品加盟"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="工艺品"
                                },
                            }
                        },
                        #endregion

                        #region 机械加盟
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.JiXieJiaGong),
                            Code="jixiejiagong",
                            Name="机械加盟",
                            BigType=Infomation.Core.YellowPageBigType.ZhaoShang,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                        },
                        #endregion

                        #region 家居/环保项目
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.JiaJuHuanBao),
                            Code="jiajuhuanbao",
                            Name="家居/环保项目",
                            BigType=Infomation.Core.YellowPageBigType.ZhaoShang,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="贴膜"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="家居"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="天然能源"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="环保材料"
                                },
                            }
                        },
                        #endregion

                        #region 教育项目
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.JiaoYuJm),
                            Code="JiaoYuJm",
                            Name="教育加盟",
                            BigType=Infomation.Core.YellowPageBigType.ZhaoShang,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                        },
                        #endregion

                        #region 美容保健
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.MeiRongBaoJian),
                            Code="meirongbaojian",
                            Name="美容保健",
                            BigType=Infomation.Core.YellowPageBigType.ZhaoShang,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="化妆品"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="美容SPA"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="养生"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="健康"
                                },
                            }
                        },
                        #endregion

                        #region 干洗加盟
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.GanXiJm),
                            Code="ganxijm",
                            Name="干洗加盟",
                            BigType=Infomation.Core.YellowPageBigType.ZhaoShang,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                        },
                        #endregion

                        #region 建材加盟
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.JianCaiJm),
                            Code="jiancaijm",
                            Name="建材加盟",
                            BigType=Infomation.Core.YellowPageBigType.ZhaoShang,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                        },
                        #endregion

                        #region 鞋加盟
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.XieJm),
                            Code="xiejm",
                            Name="鞋加盟",
                            BigType=Infomation.Core.YellowPageBigType.ZhaoShang,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                        },
                        #endregion 

                        #region 箱包加盟
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.XiangBaoJm),
                            Code="xiangbaojm",
                            Name="箱包加盟",
                            BigType=Infomation.Core.YellowPageBigType.ZhaoShang,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>(),
                            TagCollection=new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="女包",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="钱包",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="背包",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="拉杆箱",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="腰包",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="手包",
                                    ObjectTypeId=null
                                },
                            }
                        },
                        #endregion

                        #region 其他加盟
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.QiTaJiaMeng),
                            Code="qitajiameng",
                            Name="其他加盟",
                            BigType=Infomation.Core.YellowPageBigType.ZhaoShang,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                        },
                        #endregion
                        #endregion

                        #region 婚庆服务
                        #region 婚庆
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.HunQing),
                            Code="hunqing",
                            Name="婚庆",
                            BigType=Infomation.Core.YellowPageBigType.HunQing,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="婚庆公司"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="婚庆用品"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="婚车租赁"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="婚庆策划"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="婚庆酒店"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="彩妆造型"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="婚纱礼服"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="司仪督导"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="婚礼跟拍"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="其他婚庆服务"
                                },
                            }
                        },
                        #endregion

                        #region 摄影摄像
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.SheYing),
                            Code="sheying",
                            Name="摄影摄像",
                            BigType=Infomation.Core.YellowPageBigType.HunQing,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="婚纱摄影"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="儿童摄影"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="艺术摄影"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="商业摄影"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="个人写真"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="摄像录像"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="彩扩冲印"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="相框相册制作"
                                },
                            }
                        },
                        #endregion
      
                        #region 礼仪庆典
                        new YellowPageCategory()
                        {
                            Id=Convert.ToByte(YellowPageType.QingDian),
                            Code="qingdian",
                            Name="礼仪庆典",
                            BigType=Infomation.Core.YellowPageBigType.HunQing,
                            Parent=yellowCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="展览展会"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="庆典公司"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="场地布置"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="乐队演出"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="活动策划"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="礼仪模特"
                                },
                            }
                        },
                        #endregion              
                        #endregion
                    }.Select(item=>item as InfoCategory);
                    _categories.Add(yellowCategory);
                    #endregion

                    #region 宠物
                    var petCategory = new PetCategory()
                    {
                        Code = "ChongWu",
                        Name = "宠物"
                    };
                    petCategory.Children = new List<PetCategory>()
                    {
                        #region 宠物狗
                        new PetCategory()
                        {
                            Code="dog",
                            Name="宠物狗",
                            Parent=petCategory,
                            Singleton=PetDog.Singleton,
                            //L:大型,M:中型,S:小型
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="哈士奇",
                                    ObjectTypeId=null,
                                    Tag="M"
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="藏獒",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="松狮",
                                    ObjectTypeId=null,
                                    Tag="M"
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="金毛",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="博美犬",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="吉娃娃",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="德国牧羊犬",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="苏格兰牧羊犬",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="雪纳瑞",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="拉布拉多",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="比熊",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="可卡",
                                    ObjectTypeId=null,
                                    Tag="M"
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="大麦町犬",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="贵宾",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="高加索犬",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="蝴蝶犬",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="沙皮犬",
                                    ObjectTypeId=null,
                                    Tag="M"
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="灵提",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="泰迪熊",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="古牧",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=21,
                                    Name="萨摩耶",
                                    ObjectTypeId=null,
                                    Tag="M"
                                },
                                new InfoTag()
                                {
                                    Id=22,
                                    Name="大白熊",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=23,
                                    Name="阿拉斯加",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=24,
                                    Name="边境牧羊犬",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=25,
                                    Name="罗威纳",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=26,
                                    Name="圣伯纳",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=27,
                                    Name="斗牛犬",
                                    ObjectTypeId=null,
                                    Tag="M"
                                },
                                new InfoTag()
                                {
                                    Id=28,
                                    Name="喜乐蒂",
                                    ObjectTypeId=null,
                                    Tag="M"
                                },
                                new InfoTag()
                                {
                                    Id=29,
                                    Name="柯基犬",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=30,
                                    Name="京巴",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=31,
                                    Name="巴哥",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=32,
                                    Name="约克夏",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=33,
                                    Name="西高地",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=34,
                                    Name="腊肠",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=35,
                                    Name="杜宾犬",
                                    ObjectTypeId=null,
                                    Tag="L"
                                },
                                new InfoTag()
                                {
                                    Id=36,
                                    Name="比格犬",
                                    ObjectTypeId=null,
                                    Tag="M"
                                },
                                new InfoTag()
                                {
                                    Id=37,
                                    Name="西施犬",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=38,
                                    Name="银狐犬",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                                new InfoTag()
                                {
                                    Id=39,
                                    Name="其他品种",
                                    ObjectTypeId=null,
                                    Tag="S"
                                },
                            }
                        },
                        #endregion
                        #region 宠物猫
                        new PetCategory()
                        {
                            Code="cat",
                            Name="宠物猫",
                            Parent=petCategory,
                            Singleton=PetCat.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="波斯猫",
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="加菲猫",
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="折耳猫",
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="短毛猫",
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="其他",
                                },
                            }
                        },
                        #endregion
                        #region 花鸟鱼虫
                        new PetCategory()
                        {
                            Code="huaniao",
                            Name="花鸟鱼虫",
                            Parent=petCategory,
                            Singleton=PetBird.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="观赏鱼"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "玩赏鸟"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "奇石盆景"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "其他小宠"
                                },
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="盆景",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="锦鲤",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="七彩神仙",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="接吻鱼",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="罗汉鱼",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="孔雀鱼",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="龙鱼",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="红鲫鱼",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="中国金鱼",
                                    ObjectTypeId=1,
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="鹦鹉",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="八哥",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="文鸟",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="白玉鸟",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="珍珠鸟",
                                    ObjectTypeId=2,
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="奇石",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="根雕",
                                    ObjectTypeId=3,
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="兔子",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="龟",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="仓鼠",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="荷兰猪",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=21,
                                    Name="龙猫",
                                    ObjectTypeId=4,
                                },
                                new InfoTag()
                                {
                                    Id=22,
                                    Name="花卉",
                                    ObjectTypeId=3,
                                },
                            }
                        },
                        #endregion
                        #region 宠物用品/食品
                        new PetCategory()
                        {
                            Code="shipin",
                            Name="宠物用品/食品",
                            Parent=petCategory,
                            Singleton=PetFood.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="狗粮"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "狗用品"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "猫粮"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "猫用品"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "玩具"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "服饰"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "其他"
                                },
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="宠物玩具",
                                    ObjectTypeId=5,
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="宠物服饰",
                                    ObjectTypeId=6,
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="其他用品",
                                    ObjectTypeId=null,
                                },
                            }
                        },
                        #endregion
                        #region 宠物店/服务
                        new PetCategory()
                        {
                            Code="cwhuwu",
                            Name="宠物店/服务",
                            Parent=petCategory,
                            Singleton=PetService.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="宠物医院"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "宠物美容"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "宠物摄影"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "宠物配种"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "宠物寄养"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "宠物托运"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "其他"
                                },
                            }
                        },
                        #endregion
                        #region 宠物赠送/领养
                        new PetCategory()
                        {
                            Code="cwzengsong",
                            Name="宠物赠送/领养",
                            Parent=petCategory,
                            Singleton=PetGive.Singleton
                        },
                        #endregion
                    }.Select(item=>item as InfoCategory);
                    _categories.Add(petCategory);
                    #endregion

                    #region 票务/卡券
                    var ticketCategory = new TicketCategory()
                    {
                        Code = "PiaoWu",
                        Name = "票务/卡券"
                    };
                    ticketCategory.Children = new List<TicketCategory>()
                    {
                        #region 火车票
                        new TicketCategory()
                        {
                            Code="huochepiao",
                            Name="火车票",
                            Parent=ticketCategory,
                            Singleton=TicketTrain.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="硬座"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "软座"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "硬卧"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "软卧"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "站票"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "一等座"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "二等座"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "座票"
                                },
                                new ObjectType()
                                {
                                    Id = 9,
                                    Name = "卧铺"
                                },
                            }
                        },
                        #endregion
                        #region 特价机票
                        new TicketCategory()
                        {
                            Code="jipiao",
                            Name="特价机票",
                            Parent=ticketCategory,
                            Singleton=TicketAirplane.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="国际机票"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "国内机票"
                                },
                            }
                        },
                        #endregion

                        //new TicketCategory()
                        //{
                        //    Code="",
                        //    Name="电影票",
                        //    Parent=ticketCategory,
                        //    //Singleton=
                        //},
                        //new TicketCategory()
                        //{
                        //    Code="",
                        //    Name="体育赛事",
                        //    Parent=ticketCategory,
                        //    //Singleton=
                        //},
                        #region 演出门票/展览
                        new TicketCategory()
                        {
                            Code="piao",
                            Name="演出门票/展览",
                            Parent=ticketCategory,
                            Singleton=TicketPerform.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="演唱会"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="音乐会"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="话剧歌剧"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="电影票"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="少儿剧场"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="魔术杂技"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="舞蹈芭蕾"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="综合演出"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="戏曲"
                                },
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="童话剧",
                                    ObjectTypeId=5
                                },
                            }
                        },
                        #endregion
                        #region 消费券/健身卡
                        new TicketCategory()
                        {
                            Code="kaquan",
                            Name="消费券/健身卡",
                            Parent=ticketCategory,
                            Singleton=TicketCard.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="优惠卡"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "消费券"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "健身卡"
                                },
                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "购物卡"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "游泳卡"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "其他"
                                },
                            }
                        },
                        #endregion
                        #region 游乐园/景点票
                        new TicketCategory()
                        {
                            Code="youle",
                            Name="游乐园/景点票",
                            Parent=ticketCategory,
                            Singleton=TicketPleasure.Singleton,
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="动物园",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="温泉",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="其他",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="游乐园",
                                    ObjectTypeId=null
                                },
                                //new InfoTag()
                                //{
                                //    Id=5,
                                //    Name="极地海洋世界",
                                //    ObjectTypeId=null
                                //},
                                //new InfoTag()
                                //{
                                //    Id=6,
                                //    Name="宋城",
                                //    ObjectTypeId=null
                                //},
                            }
                        },
                        #endregion
                        #region 其他票务
                        new TicketCategory()
                        {
                            Code="qtpiaowu",
                            Name="其他票务",
                            Parent=ticketCategory,
                            Singleton=TicketOther.Singleton
                        }
                        #endregion
                    }.Select(item=>item as InfoCategory);
                    _categories.Add(ticketCategory);
                    #endregion

                    #region 教育培训
                    var eduCategory = new EduCategory()
                    {
                        Code = "JiaoYu",
                        Name = "教育培训"
                    };
                    eduCategory.Children = new List<EduCategory>()
                    {
                        #region 家教
                        new EduCategory()
                        {
                            Code="fudao",
                            Name="家教",
                            Parent=eduCategory,
                            Singleton=EduTutor.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="小学家教"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "初中家教"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "中考家教"
                                },

                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "高中家教"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "高考冲刺"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "素质/特长辅导"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "小升初家教"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "奥数"
                                },
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="初中数学",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="初中语文",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="初中化学",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="初中家教",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="初中物理",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="初中英语",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="全科",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="初中奥数",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="钢琴辅导",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="美术家教",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="小学数学",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="小学奥数",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="小学语文",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="小学英语",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="高中奥数",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="高中语文",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="高中数学",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="高中英语",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="高中物理",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="高中化学",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=21,
                                    Name="高考语文",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=22,
                                    Name="高考数学",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=23,
                                    Name="高考英语",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=24,
                                    Name="高考物理",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=25,
                                    Name="高考化学",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=26,
                                    Name="体育辅导",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=27,
                                    Name="全科",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=28,
                                    Name="初中地理",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=29,
                                    Name="初中政治",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=30,
                                    Name="初中历史",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=31,
                                    Name="初中生物",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=32,
                                    Name="初中全科",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=33,
                                    Name="高中地理",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=34,
                                    Name="高中政治",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=35,
                                    Name="高中历史",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=36,
                                    Name="高中生物",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=37,
                                    Name="高中全科",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=38,
                                    Name="高考地理",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=39,
                                    Name="高考政治",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=40,
                                    Name="高考历史",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=41,
                                    Name="高考生物",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=42,
                                    Name="高考全科",
                                    ObjectTypeId=5
                                },
                                new InfoTag()
                                {
                                    Id=43,
                                    Name="中考语文",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=44,
                                    Name="中考数学",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=45,
                                    Name="中考英语",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=46,
                                    Name="中考物理",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=47,
                                    Name="中考化学",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=48,
                                    Name="中考地理",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=49,
                                    Name="中考政治",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=50,
                                    Name="中考历史",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=51,
                                    Name="中考生物",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=52,
                                    Name="中考全科",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=53,
                                    Name="英语",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=54,
                                    Name="数学",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=55,
                                    Name="语文",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=56,
                                    Name="全科",
                                    ObjectTypeId=7
                                },
                            }
                        },
                        #endregion
                        #region 留学
                        new EduCategory()
                        {
                            Code="liuxue",
                            Name="留学",
                            Parent=eduCategory,
                            Singleton=EduAbroad.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="移民"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "其它留学"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "出国劳务"
                                },

                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "美国留学"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "加拿大留学"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "新加坡留学"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "日本留学"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "澳洲留学"
                                },
                                new ObjectType()
                                {
                                    Id = 9,
                                    Name = "新西兰留学"
                                },
                                new ObjectType()
                                {
                                    Id = 10,
                                    Name = "英国留学"
                                },
                                new ObjectType()
                                {
                                    Id = 11,
                                    Name = "韩国留学"
                                },
                                new ObjectType()
                                {
                                    Id = 12,
                                    Name = "德国留学"
                                },
                                new ObjectType()
                                {
                                    Id = 13,
                                    Name = "法国留学"
                                },
                                new ObjectType()
                                {
                                    Id = 14,
                                    Name = "西班牙留学"
                                },
                                new ObjectType()
                                {
                                    Id = 15,
                                    Name = "留学/移民签证"
                                },
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="加拿大移民",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="马来西亚留学",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="俄罗斯留学",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="荷兰留学",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="新加坡签证",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="越南签证",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="韩国签证",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="新西兰签证",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="技术移民",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="投资移民",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="美国移民",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="澳大利亚移民",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="新加坡移民",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="新西兰移民",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="澳洲移民",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="高考移民",
                                    ObjectTypeId=1
                                },
                            }
                        },
                        #endregion
                        #region 移民
                        //new EduCategory()
                        //{
                        //    Code="",
                        //    Name="移民",
                        //    Parent=eduCategory,
                        //    //Singleton=
                        //},
                        #endregion
                        #region 留学/移民签证
                        //new EduCategory()
                        //{
                        //    Code="",
                        //    Name="留学/移民签证",
                        //    Parent=eduCategory,
                        //    //Singleton=
                        //},
                        #endregion
                        #region 婴幼儿教育
                        new EduCategory()
                        {
                            Code="youjiao",
                            Name="婴幼儿教育",
                            Parent=eduCategory,
                            Singleton=EduBaby.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="学前教育"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "亲子教育"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "幼儿园"
                                },

                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "胎教"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "智力开发"
                                },
                            },
                            TagCollection=new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="日托"
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="全托"
                                }
                            }
                        },
                        #endregion
                        #region 外语培训
                        new EduCategory()
                        {
                            Code="waiyu",
                            Name="外语培训",
                            Parent=eduCategory,
                            Singleton=EduLanguage.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="英语培训"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "英语口语"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "英语听力"
                                },

                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "日语"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "韩语"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "法语"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "德语"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "俄语"
                                },
                                new ObjectType()
                                {
                                    Id = 9,
                                    Name = "西班牙语"
                                },
                                new ObjectType()
                                {
                                    Id = 10,
                                    Name = "意大利语"
                                },
                        
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="SAT培训",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="GMAT培训",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="雅思口语",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="商务英语口语",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="少儿英语口语",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="疯狂英语口语",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="托福口语",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="外贸英语口语",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="英语翻译",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="新概念英语",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="雅思培训",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="托福培训",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="少儿英语",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="商务英语",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="英语自考",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="四六级",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="GRE／GMAT",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="SAT／LSAT",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="BETS",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="考研英语",
                                    ObjectTypeId=1
                                },
                            }
                        },
                        #endregion
                        #region 学历教育
                        new EduCategory()
                        {
                            Code="xueli",
                            Name="学历教育",
                            Parent=eduCategory,
                            Singleton=EduEducation.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="学历认证"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "二学历"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "在职研究生"
                                },

                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "成人教育"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "自考"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "远程教育"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "网络教育"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "专升本"
                                },
                                new ObjectType()
                                {
                                    Id = 9,
                                    Name = "成人高考"
                                },
                            }
                        },
                        #endregion
                        #region 职业技能培训
                        new EduCategory()
                        {
                            Code="zhiyepeix",
                            Name="职业技能培训",
                            Parent=eduCategory,
                            Singleton=EduProfession.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="会计培训"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "报关员培训"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "教师培训"
                                },

                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "资格认证"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "营养师培训"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "心理咨询师培训"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "导游培训"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "汽车维修培训"
                                },
                                new ObjectType()
                                {
                                    Id = 9,
                                    Name = "策划师培训"
                                },
                                new ObjectType()
                                {
                                    Id = 10,
                                    Name = "其它培训"
                                },
                                new ObjectType()
                                {
                                    Id = 11,
                                    Name = "厨师培训"
                                },
                                new ObjectType()
                                {
                                    Id = 12,
                                    Name = "美容美发"
                                },
                                new ObjectType()
                                {
                                    Id = 13,
                                    Name = "技能培训"
                                },
                                new ObjectType()
                                {
                                    Id = 14,
                                    Name = "公务员培训"
                                },
                                new ObjectType()
                                {
                                    Id = 15,
                                    Name = "摄影培训"
                                },
                                new ObjectType()
                                {
                                    Id = 16,
                                    Name = "人力资源师"
                                },
                        
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="注册会计师",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="会计电算化",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="初级会计师",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="中级会计师",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="助理会计师",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="高级会计师",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="电工培训",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="调酒师培训",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="插花培训",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="美甲培训",
                                    ObjectTypeId=12
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="美发培训",
                                    ObjectTypeId=12
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="美容培训",
                                    ObjectTypeId=12
                                },
                            }
                        },
                        #endregion
                        #region IT培训
                        new EduCategory()
                        {
                            Code="jisuanji",
                            Name="IT培训",
                            Parent=eduCategory,
                            Singleton=EduIT.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="软件工程师"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "网络工程师"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "动漫/游戏"
                                },

                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "网络营销"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "电脑维修培训"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "计算机等级考试"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "数据库培训"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "IT认证"
                                },
                                new ObjectType()
                                {
                                    Id = 9,
                                    Name = "电子商务"
                                },
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="动画培训",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="网络安全",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="软件测试",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="微软认证",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="思科认证",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="国际IT认证",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="华为认证",
                                    ObjectTypeId=8
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="游戏设计",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="动漫设计",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="影视动画",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="3DMAX",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="maya",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="SQL Sever",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="Oracle",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="mysql",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="access数据库",
                                    ObjectTypeId=7
                                },

                                new InfoTag()
                                {
                                    Id=17,
                                    Name="vb 数据库",
                                    ObjectTypeId=7
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="网络技术",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=19,
                                    Name="操作系统",
                                    ObjectTypeId=2
                                },
                                new InfoTag()
                                {
                                    Id=20,
                                    Name="软件开发",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=21,
                                    Name="UML",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=22,
                                    Name="c语言",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=23,
                                    Name="Java",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=24,
                                    Name="php培训",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=25,
                                    Name="asp培训",
                                    ObjectTypeId=1
                                },
                                new InfoTag()
                                {
                                    Id=26,
                                    Name="计算机一级",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=27,
                                    Name="计算机二级",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=28,
                                    Name="计算机三级",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=29,
                                    Name="计算机四级",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=30,
                                    Name="全国计算机等级考试",
                                    ObjectTypeId=6
                                },
                                new InfoTag()
                                {
                                    Id=31,
                                    Name="SEM培训",
                                    ObjectTypeId=4
                                },
                                new InfoTag()
                                {
                                    Id=32,
                                    Name="SEO培训",
                                    ObjectTypeId=4
                                },
                            }
                        },
                        #endregion
                        #region 设计培训
                        new EduCategory()
                        {
                            Code="shejipeixun",
                            Name="设计培训",
                            Parent=eduCategory,
                            Singleton=EduDesign.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="平面设计"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "网页设计"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "建筑设计"
                                },

                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "室内设计"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "服装设计"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "模具设计"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "其它设计"
                                },
                            }
                        },
                        #endregion
                        #region 管理/MBA
                        new EduCategory()
                        {
                            Code="mba",
                            Name="管理/MBA",
                            Parent=eduCategory,
                            Singleton=EduMBA.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="MBA培训"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "企业管理"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "项目管理"
                                },

                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "财务管理"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "行政管理"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "酒店管理"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "工商管理"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "物流管理"
                                },
                                new ObjectType()
                                {
                                    Id = 9,
                                    Name = "物业管理"
                                },
                                new ObjectType()
                                {
                                    Id = 10,
                                    Name = "工程管理"
                                },
                            },
                            //培训模式.
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="基础班",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="强化提高班",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="模考冲刺班",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="MBA面试",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="在职班",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="长期班",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="精品班",
                                    ObjectTypeId=null
                                },
                            }
                        },
                        #endregion
                        #region 文艺/体育
                        new EduCategory()
                        {
                            Code="techang",
                            Name="文艺/体育",
                            Parent=eduCategory,
                            Singleton=EduSpecial.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="美术培训"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "dj培训"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "舞蹈培训"
                                },

                                new ObjectType()
                                {
                                    Id = 4,
                                    Name = "表演培训"
                                },
                                new ObjectType()
                                {
                                    Id = 5,
                                    Name = "声乐培训"
                                },
                                new ObjectType()
                                {
                                    Id = 6,
                                    Name = "书法培训"
                                },
                                new ObjectType()
                                {
                                    Id = 7,
                                    Name = "其他培训"
                                },
                                new ObjectType()
                                {
                                    Id = 8,
                                    Name = "球类培训"
                                },
                                new ObjectType()
                                {
                                    Id = 9,
                                    Name = "瑜伽培训"
                                },
                                new ObjectType()
                                {
                                    Id = 10,
                                    Name = "棋类培训"
                                },
                                new ObjectType()
                                {
                                    Id = 11,
                                    Name = "跆拳道培训"
                                },
                                new ObjectType()
                                {
                                    Id = 12,
                                    Name = "武术培训"
                                },
                                new ObjectType()
                                {
                                    Id = 13,
                                    Name = "乐器培训"
                                },
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="肚皮舞培训",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="拉丁舞培训",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="爵士舞培训",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="钢管舞培训",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="民族舞培训",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="街舞培训",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="少儿舞蹈培训",
                                    ObjectTypeId=3
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="古筝培训",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=9,
                                    Name="钢琴培训",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=10,
                                    Name="吉他培训",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=11,
                                    Name="小提琴培训",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=12,
                                    Name="二胡培训",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=13,
                                    Name="萨克斯",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=14,
                                    Name="电子琴培训",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=15,
                                    Name="古琴培训",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=16,
                                    Name="琵琶",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=17,
                                    Name="笛子",
                                    ObjectTypeId=13
                                },
                                new InfoTag()
                                {
                                    Id=18,
                                    Name="其它乐器",
                                    ObjectTypeId=13
                                },
                            }
                        },
                        #endregion
                        #region 其他教育培训
                        new EduCategory()
                        {
                            Code="peixunqita",
                            Name="其他教育培训",
                            Parent=eduCategory,
                            Singleton=EduOther.Singleton
                        }
                        #endregion
                    }.Select(item=>item as InfoCategory);
                    _categories.Add(eduCategory);
                    #endregion

                    #region 交友征婚
                    var friendCategory = new FriendCategory()
                    {
                        Code = "JiaoYou",
                        Name = "交友征婚"
                    };
                    friendCategory.Children = new List<FriendCategory>()
                    {
                        new FriendCategory()
                        {
                            Code="nvyou",
                            Name="异性交友",
                            Parent=friendCategory,
                            Singleton=FriendSex.Singleton
                        },
                        new FriendCategory()
                        {
                            Code="xingqu",
                            Name="兴趣交友",
                            Parent=friendCategory,
                            Singleton=FriendInterest.Singleton
                        },
                        new FriendCategory()
                        {
                            Code="laoxiang",
                            Name="同乡会",
                            Parent=friendCategory,
                            Singleton=FriendHome.Singleton
                        },
                        new FriendCategory()
                        {
                            Code="jinengjiaohuan",
                            Name="技能交换",
                            Parent=friendCategory,
                            Singleton=FriendSkill.Singleton
                        },
                        new FriendCategory()
                        {
                            Code="huodong",
                            Name="驴友/活动/聚会",
                            Parent=friendCategory,
                            Singleton=FriendActivity.Singleton,
                            ObjectTypeCollection = new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="驴友"
                                },
                                new ObjectType()
                                {
                                    Id = 2,
                                    Name = "聚会"
                                },
                                new ObjectType()
                                {
                                    Id = 3,
                                    Name = "活动"
                                },
                            },
                            TagCollection = new List<InfoTag>()
                            {
                                new InfoTag()
                                {
                                    Id=1,
                                    Name="自助游",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=2,
                                    Name="徒步",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=3,
                                    Name="驾车游",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=4,
                                    Name="杀人游戏",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=5,
                                    Name="单身聚会",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=6,
                                    Name="公益活动",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=7,
                                    Name="周末活动",
                                    ObjectTypeId=null
                                },
                                new InfoTag()
                                {
                                    Id=8,
                                    Name="团购/打折",
                                    ObjectTypeId=null
                                },
                            }
                        }
                    }.Select(item=>item as InfoCategory);
                    _categories.Add(friendCategory);
                    #endregion

                    #region 求职招聘
                    var jobCategory = new JobCategory()
                    {
                        Code = "ZhaoPin|QiuZhi",//ZhaoPin或QiuZhi
                        Name = "招聘|求职"//招聘或求职
                    };
                    jobCategory.Children = new List<JobCategory>()
                    {
                        #region 销售
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.Yewu),
                            Name="销售",
                            Code="yewu",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="销售代表",
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="销售助理",
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="销售经理/主管",
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="销售总监",
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="电话销售",
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="销售支持",
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="房产经纪人",
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="保险经纪人",
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="汽车销售",
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="医药代表",
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="医疗器械销售",
                                },
                                new ObjectType()
                                {
                                    Id=12,
                                    Name="网络销售",
                                },
                                new ObjectType()
                                {
                                    Id=13,
                                    Name="渠道专员",
                                },
                            }
                        },
                        #endregion

                        #region 客服
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.Kefu),
                            Name="客服",
                            Code="kefu",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="电话客服",
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="客服专员/助理",
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="客服经理/主管",
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="售前/售后服务",
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="客户关系管理",
                                },
                            }
                        },
                        #endregion

                        #region 人事/行政/后勤
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.Renli),
                            Name="人事/行政/后勤",
                            Code="renli",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="前台/接待",
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="人事专员/助理",
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="人事经理/主管",
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="行政专员/助理",
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="行政经理/主管",
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="薪酬/绩效/员工关系",
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="后勤",
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="猎头顾问",
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="经理助理/秘书",
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="文员",
                                },
                            }
                        },
                        #endregion

                        #region 财务/审计/统计
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.CaiwuShenji),
                            Name="财务/审计/统计",
                            Code="caiwushenji",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="税务专员",
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="财务总监/经理",
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="会计",
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="出纳",
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="审计",
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="统计员",
                                },
                            }
                        },
                        #endregion

                        #region 普工/技工/生产
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.ShengchanKaifa),
                            Name="普工/技工/生产",
                            Code="shengchankaifa",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="制冷/水暖工"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="普工"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="电工"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="钣金工"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="油漆工"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="工艺设计"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="切割/焊工"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="综合维修工"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="车床/磨床/铣床"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="铲车/叉车工"
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="木工"
                                },
                                new ObjectType()
                                {
                                    Id=12,
                                    Name="钳工"
                                },
                                new ObjectType()
                                {
                                    Id=13,
                                    Name="锅炉工"
                                },
                                new ObjectType()
                                {
                                    Id=14,
                                    Name="缝纫工"
                                },
                                new ObjectType()
                                {
                                    Id=15,
                                    Name="质量管理"
                                },
                                new ObjectType()
                                {
                                    Id=16,
                                    Name="化验/检验"
                                },
                                new ObjectType()
                                {
                                    Id=17,
                                    Name="技术工程师"
                                },
                                new ObjectType()
                                {
                                    Id=18,
                                    Name="设备管理维护"
                                },
                                new ObjectType()
                                {
                                    Id=19,
                                    Name="厂长/副厂长"
                                },
                                new ObjectType()
                                {
                                    Id=20,
                                    Name="总工程师"
                                },
                                new ObjectType()
                                {
                                    Id=21,
                                    Name="计划调度"
                                },
                                new ObjectType()
                                {
                                    Id=22,
                                    Name="车间主任"
                                },
                                new ObjectType()
                                {
                                    Id=23,
                                    Name="铸造/锻造/注塑/模具工"
                                },
                            }
                        },
                        #endregion

                        #region 餐饮/酒店/旅游
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.LvyouJiudian),
                            Name="餐饮/酒店/旅游",
                            Code="lvyoujiudian",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="配菜/打荷"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="大堂经理/领班"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="厨师"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="后厨"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="服务员"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="传菜员"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="洗碗工"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="面点师"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="迎宾/接待"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="导游/计调"
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="旅游顾问"
                                },
                                new ObjectType()
                                {
                                    Id=12,
                                    Name="餐饮/酒店管理"
                                },
                            }
                        },
                        #endregion

                        #region 美容/美发/保健/健身
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.MeirongJianshen),
                            Name="美容/美发/保健/健身",
                            Code="meirongjianshen",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="美容店长"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="美容助理/学徒"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="美发助理/学徒"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="宠物美容"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="发型师"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="洗头工"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="美容师"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="瑜伽/舞蹈老师"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="推拿按摩"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="美容/瘦身顾问"
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="运动/健身教练"
                                },
                                new ObjectType()
                                {
                                    Id=12,
                                    Name="足疗保健"
                                },
                                new ObjectType()
                                {
                                    Id=13,
                                    Name="化妆师"
                                },
                                new ObjectType()
                                {
                                    Id=14,
                                    Name="美甲师"
                                },
                            }
                        },
                        #endregion

                        #region 零售/促销
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.ChaoshiShangye),
                            Name="零售/促销",
                            Code="chaoshishangye",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="招商经理"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="理货员/陈列员"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="店长/卖场经理"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="促销/导购员"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="营业员"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="收银员"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="防损员"
                                },
                            }
                        },
                        #endregion

                        #region 家政保洁/安保
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JiazhengBaojie),
                            Name="家政保洁/安保",
                            Code="jiazhengbaojie",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="保安"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="保洁"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="保姆"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="月嫂"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="育婴师"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="钟点工"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="洗衣工"
                                },
                            }
                        },
                        #endregion

                        #region 司机
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.Siji),
                            Name="司机",
                            Code="siji",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="商务司机"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="客运司机"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="货运司机"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="班车司机"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="出租车司机"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="特种车司机"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="驾校教练/陪练"
                                },
                            }
                        },
                        #endregion

                        #region 市场营销/公关媒介
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.ShiChang),
                            Name="市场营销/公关媒介",
                            Code="shichang",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="市场拓展"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="市场调研"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="市场策划/企划"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="市场总监/经理/主管"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="公关媒介专员/经理"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="会务会展专员/经理"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="品牌经理"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="市场专员/助理"
                                },
                            }
                        },
                        #endregion

                        #region 广告/设计/咨询
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.GuangGao),
                            Name="广告/设计/咨询",
                            Code="guanggao",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="广告文案"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="广告创意"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="广告设计/制作"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="店面/展览设计"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="装修装潢设计"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="多媒体/动画设计"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="家具/家居用品设计"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="服装设计"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="平面设计"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="工艺/珠宝设计"
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="咨询师"
                                },
                            }
                        },
                        #endregion

                        #region 教育培训
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JiaoyuPeixun),
                            Name="教育培训",
                            Code="jiaoyupeixun",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="教师/助教"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="家教"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="幼教"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="培训师"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="教学/教务管理"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="教育产品开发"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="学术研究/科研"
                                },
                            }
                        },
                        #endregion

                        #region 法律
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.FalvZixun),
                            Name="法律",
                            Code="falvzixun",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="合规管理"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="法务"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="律师/法律顾问"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="产权/专利顾问"
                                },
                            }
                        },
                        #endregion

                        #region 翻译
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.FanYi),
                            Name="翻译",
                            Code="fanyi",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="英语翻译"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="日语翻译"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="韩语翻译"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="法语翻译"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="俄语翻译"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="德语翻译"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="小语种翻译"
                                },
                            }
                        },
                        #endregion

                        #region 编辑/出版/印刷
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.XiezuoChuban),
                            Name="编辑/出版/印刷",
                            Code="xiezuochuban",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="总编/主编"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="校对/录入"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="出版/发行"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="排版/印刷"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="装订/烫金"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="编辑/记者/撰稿人"
                                },
                            }
                        },
                        #endregion

                        #region 汽车
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.Qiche),
                            Name="汽车",
                            Code="qiche",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="4S店管理"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="检验检测"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="汽车修理"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="汽车美容"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="汽车设计工程师"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="装配工艺工程师"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="汽车机械工程师"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="汽车电子工程师"
                                },
                            }
                        },
                        #endregion

                        #region 计算机/互联网/通信
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.Jisuanji),
                            Name="计算机/互联网/通信",
                            Code="jisuanji",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="网络安全工程师"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="项目经理"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="软件工程师"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="程序员"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="硬件工程师"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="游戏设计/开发"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="技术总监/经理"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="技术支持/维护"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="数据库管理/DBA"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="网站运营"
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="系统架构师"
                                },
                                new ObjectType()
                                {
                                    Id=12,
                                    Name="质量工程师"
                                },
                                new ObjectType()
                                {
                                    Id=13,
                                    Name="网页设计/制作"
                                },
                                new ObjectType()
                                {
                                    Id=14,
                                    Name="语音/视频/图形"
                                },
                                new ObjectType()
                                {
                                    Id=15,
                                    Name="产品经理/专员"
                                },
                                new ObjectType()
                                {
                                    Id=16,
                                    Name="通信技术工程师"
                                },
                                new ObjectType()
                                {
                                    Id=17,
                                    Name="网站编辑"
                                },
                                new ObjectType()
                                {
                                    Id=18,
                                    Name="网络管理员"
                                },
                                new ObjectType()
                                {
                                    Id=19,
                                    Name="测试"
                                },
                            }
                        },
                        #endregion

                        #region 建筑/房产/装修/物业
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.FangchanJianzhu),
                            Name="建筑/房产/装修/物业",
                            Code="fangchanjianzhu",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="给排水/制冷/暖通"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="工程监理"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="物业管理"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="工程项目管理"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="土木/土建工程师"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="造价师/预算师"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="道路桥梁技术"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="房地产开发/策划"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="测绘/测量"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="物业维修"
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="园林/景观设计"
                                },
                                new ObjectType()
                                {
                                    Id=12,
                                    Name="建筑师"
                                },
                            }
                        },
                        #endregion

                        #region 金融/银行/证券/投资
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JinrongTouzi),
                            Name="金融/银行/证券/投资",
                            Code="jinrongtouzi",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="信贷管理/资信评估"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="证券经理"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="银行经理/主任"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="银行会计/柜员"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="投资/理财顾问"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="证券/期货经纪人"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="外汇/基金/国债经理"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="融资经理"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="风险管理/控制"
                                },
                            }
                        },
                        #endregion

                        #region 医疗/制药/医疗器械
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.YiyuanYiliao),
                            Name="医疗/制药/医疗器械",
                            Code="yiyuanyiliao",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="心理医生"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="药剂师"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="护士/护理"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="美容整形师"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="宠物护理/兽医"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="医药研发/生产/注册"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="医疗器械研发/维修"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="医疗管理"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="营养师"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="验光师"
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="医生"
                                },
                            }
                        },
                        #endregion

                        #region 电子/仪表仪器/机械
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JixieYiqi),
                            Name="电子/仪表仪器/机械",
                            Code="jixieyiqi",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="自动化工程师"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="电子/电器工程师"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="电气/电路工程师"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="机电/机械工程师"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="仪器/仪表/计量"
                                },
                            }
                        },
                        #endregion

                        #region 保险
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JinrongBaoxian),
                            Name="保险",
                            Code="jinrongbaoxian",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="保险顾问"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="保险精算师"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="保险内勤"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="项目经理/主管"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="保险核保/理赔"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="保险产品开发"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="保险续期管理"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="契约管理"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="保险培训师"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="储备经理人"
                                },
                            }
                        },
                        #endregion

                        #region 贸易/采购/商务
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.ShangwuMaoyi),
                            Name="贸易/采购/商务",
                            Code="shangwumaoyi",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="采购员"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="报关员"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="外贸专员"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="外贸经理"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="采购经理"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="业务跟单"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="商务专员/经理"
                                },
                            }
                        },
                        #endregion

                        #region 仓储/物流
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.WuliuCangchu),
                            Name="仓储/物流",
                            Code="wuliucangchu",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="押运员"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="调度员"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="物流专员"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="物流经理"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="仓库管理员"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="装卸/搬运工"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="海运/空运操作员"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="供应链管理"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="单证员"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="快递员"
                                },
                            }
                        },
                        #endregion

                        #region 影视/娱乐/KTV
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.WentiYingshi),
                            Name="影视/娱乐/KTV",
                            Code="wentiyingshi",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="主持人"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="调酒师"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="音响师"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="摄影师"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="模特"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="礼仪"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="演员"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="酒吧服务员"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="影视经纪人"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="影视制作"
                                },
                            }
                        },
                        #endregion

                        #region 其他职能
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.Qita),
                            Name="其他职能",
                            Code="qita",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="其他职位"
                                }
                            }
                        },
                        #endregion

                        #region 兼职-计算机/网络
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JianZhiJisuanji),
                            Name="计算机/网络",
                            Code="JianZhiJisuanji",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="网站建设"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="网页设计"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="网站推广"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="程序员"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="录入员"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="游戏代练"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="电脑维修"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="seo优化/分销"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="多媒体制作"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="论坛管理员"
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="软件界面设计"
                                },
                                new ObjectType()
                                {
                                    Id=12,
                                    Name="其他网络兼职"
                                },
                                
                            }
                        },
                        #endregion

                        #region 兼职-图形/影像/设计
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JianZhiPingMian),
                            Name="图形/影像/设计",
                            Code="JianZhiPingMian",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="LOGO设计"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="装潢设计"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="CAD设计"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="工业设计"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="摄影摄像"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="图像处理"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="影视处理"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="插画师"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="其他设计兼职"
                                },
                            }
                        },
                        #endregion

                        #region 兼职-翻译/编辑
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JianZhiYuyanWenzi),
                            Name="翻译/编辑",
                            Code="JianZhiYuyanWenzi",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="编辑"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="撰稿人"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="校对排版"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="外文翻译"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="口译"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="口语陪练"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="字幕翻译"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="数据整理"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="写手"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="解说员"
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="兼职打字/录入"
                                },
                                new ObjectType()
                                {
                                    Id=12,
                                    Name="其他翻译编辑兼职"
                                },
                            }
                        },
                        #endregion

                        #region 兼职-销售/促销
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JianZhiXiaoshouCuxiao),
                            Name="销售/促销",
                            Code="JianZhiXiaoshouCuxiao",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="业务员"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="电话销售"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="校园代理"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="小时工"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="招生代理"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="发单员"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="促销员"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="营业员"
                                },
                                new ObjectType()
                                {
                                    Id=9,
                                    Name="文秘"
                                },
                                new ObjectType()
                                {
                                    Id=10,
                                    Name="保险经纪人"
                                },
                                new ObjectType()
                                {
                                    Id=11,
                                    Name="网络销售"
                                },
                                new ObjectType()
                                {
                                    Id=12,
                                    Name="其他销售兼职"
                                },
                            }
                        },
                        #endregion

                        #region 兼职-客服/市场调查
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JianZhiKefuShichang),
                            Name="客服/市场调查",
                            Code="JianZhiKefuShichang",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="电话客服"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="电话回访"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="售后服务"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="话务员"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="问卷调查员"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="市场调查员"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="呼叫中心人员"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="其他客服兼职"
                                },
                            }
                        },
                        #endregion

                        #region 兼职-财务/法律
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JianZhiCaiwuFalv),
                            Name="财务/法律",
                            Code="JianZhiCaiwuFalv",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="会计"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="财务咨询"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="律师"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="咨询员"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="其他财务法律兼职"
                                },
                                
                            }
                        },
                        #endregion

                        #region 兼职-教育培训
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JianZhiJiaoyuPeixun),
                            Name="教育培训",
                            Code="JianZhiJiaoyuPeixun",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="家教"
                                },
                                 new ObjectType()
                                {
                                    Id=2,
                                    Name="教师"
                                },
                                 new ObjectType()
                                {
                                    Id=3,
                                    Name="舞蹈老师"
                                },
                                 new ObjectType()
                                {
                                    Id=4,
                                    Name="健身教练"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="汽车陪练"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="其他教育培训兼职"
                                },
                            }
                        },
                        #endregion

                        #region 兼职-餐饮/服务/旅游
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JianZhiCanyinFuwu),
                            Name="餐饮/服务/旅游",
                            Code="JianZhiCanyinFuwu",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="酒吧KTV"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="餐厅服务员"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="送餐员"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="快递员"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="家政保洁"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="钟点工"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="导游"
                                },
                                new ObjectType()
                                {
                                    Id=8,
                                    Name="其他服务兼职"
                                },
                            }
                        },
                        #endregion

                        #region 兼职-礼仪/演艺
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JianZhiLiyiYanyi),
                            Name="礼仪/演艺",
                            Code="JianZhiLiyiYanyi",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="群众演员"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="礼仪"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="模特"
                                },
                                new ObjectType()
                                {
                                    Id=4,
                                    Name="歌手"
                                },
                                new ObjectType()
                                {
                                    Id=5,
                                    Name="主持人"
                                },
                                new ObjectType()
                                {
                                    Id=6,
                                    Name="婚庆司仪"
                                },
                                new ObjectType()
                                {
                                    Id=7,
                                    Name="其他演出兼职"
                                },
                            }
                        },
                        #endregion

                        #region 兼职-加工制作
                        new JobCategory()//这个类别考虑取消不要了.
                        {
                            Id=Convert.ToByte(JobType.JianZhiJiagongZhizuo),
                            Name="加工制作",
                            Code="JianZhiJiagongZhizuo",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="手工制作"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="编织"
                                },
                                new ObjectType()
                                {
                                    Id=3,
                                    Name="其他加工制作兼职"
                                },
                            }
                        },
                        #endregion

                        #region 兼职-学生兼职/实习
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JianZhiXuesheng),
                            Name="学生兼职/实习",
                            Code="JianZhiXuesheng",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="学生兼职"
                                },
                                new ObjectType()
                                {
                                    Id=2,
                                    Name="学生实习"
                                },
                            }
                        },
                        #endregion

                        #region 兼职-其他兼职
                        new JobCategory()
                        {
                            Id=Convert.ToByte(JobType.JianZhiQita),
                            Name="其他兼职",
                            Code="JianZhiQita",
                            Parent=jobCategory,
                            ObjectTypeCollection=new List<ObjectType>()
                            {
                                new ObjectType()
                                {
                                    Id=1,
                                    Name="其他兼职工作"
                                },
                            }
                        }
                        #endregion
                    }.Select(item=>item as InfoCategory);
                    _categories.Add(jobCategory);
                    #endregion
                }
                return _categories;
            }
        }

        public static TCategory GetCategory<TCategory>()
            where TCategory : InfoCategory
        {
            return Categories.FirstOrDefault(item => (item is TCategory)) as TCategory;
        }

        
        public static InfoCategory GetCategory(IInfo info)
        {
            if (info is YellowPage)
            {
                var yp = info as YellowPage;
                return  GetCategory(yp.YellowPageType);
            }
            if (info is Recruit)
            {
                var recruit = info as Recruit;
                return GetCategory(recruit.JobType);
            }
            if (info is JobSeek)
            {
                var jobSeek = info as JobSeek;
                return GetCategory(jobSeek.JobType);
            }

            InfoCategory infoCategory=null;
            if (info is ICar)
            {
                infoCategory = GetCategory<CarCategory>();
            }
            if (info is IPet)
            {
                infoCategory = GetCategory<PetCategory>();
            }
            if (info is IHouse)
            {
                infoCategory = GetCategory<HouseCategory>();
            }
            if (info is IFriend)
            {
                infoCategory = GetCategory<FriendCategory>();
            }
            if (info is IEducation)
            {
                infoCategory = GetCategory<EduCategory>();
            }
            if (info is ITicket)
            {
                infoCategory = GetCategory<TicketCategory>();
            }
            if (info is ISale)
            {
                infoCategory = GetCategory<SaleCategory>();
            }
            //return infoCategory.Children.Where(item => item.Singleton != null && item.Singleton.GetType() == info.GetType());
            return infoCategory.Children.FirstOrDefault(item => item.Singleton != null && item.Singleton.GetType() == info.GetType());
        }

        public static YellowPageCategory GetCategory(YellowPageType ypType)
        {
            var category = GetCategory<YellowPageCategory>();
            //var children = category.Children as IEnumerable<YellowPageCategory>;
            var children = category.Children.Select(item=>item as YellowPageCategory);
            return children.FirstOrDefault(item => item.YellowPageType == ypType);
        }
        public static IEnumerable<YellowPageCategory> GetCategory(YellowPageBigType BigType)
        {
            var category = GetCategory<YellowPageCategory>();
            //var children=category.Children as IEnumerable<YellowPageCategory>;
            var children = category.Children.Select(item=>item as YellowPageCategory);
            return children.Where(item => item.BigType == BigType);
        }
        public static JobCategory GetCategory(JobType jobType)
        {
            var category = GetCategory<JobCategory>();
            //var children = category.Children as IEnumerable<JobCategory>;
            var children = category.Children.Select(item => item as JobCategory);//.net 3.5不能直接as IEnumerable<JobCategory>
            return children.FirstOrDefault(item => item.JobType == jobType);
        }

        #region 主要为Ajax传输服务
        public IEnumerable<JobCategory> GetParentJobCategories()
        {
            var category = GetCategory<JobCategory>();
            //var jobCategories=category.Children as IEnumerable<JobCategory>;
            var jobCategories = category.Children.Select(item=>item as JobCategory);
            var list=new List<JobCategory>();
            foreach(var item in jobCategories)
            {
                list.Add(new JobCategory()
                {
                    Id=item.Id,
                    Name=item.Name
                });
            }
            return list;
        }
        public JobCategory GetChildCategory(int jobType)
        {
            var category = GetCategory<JobCategory>();
            //var children = category.Children as IEnumerable<JobCategory>;
            var children = category.Children.Select(item=>item as JobCategory);
            return children.FirstOrDefault(item =>Convert.ToInt32(item.JobType) == jobType);
        }
        #endregion
    }
}
