using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 二手摩托车.
    /// </summary>
   [Table(Name = "Info_CarMotor")]
   public class CarMotor:CarBase<CarMotor>
    {
       /// <summary>
       /// 1:转让,2:求购
       /// </summary>
       public byte Type
       {
           get;
           set;
       }
       /// <summary>
       /// 成色
       /// </summary>
       public byte Quality
       {
           get;
           set;
       }
       public int Price
       {
           get;
           set;
       }
       public byte Tag1
       {
           get;
           set;
       }
       /// <summary>
       /// 品牌
       /// </summary>
       //public int BrandId
       //{
       //    get;
       //    set;
       //}
       public byte ObjectType
       {
           get;
           set;
       }
       /// <summary>
       /// 排量.
       /// </summary>
       public string Exhaust
       {
           get;
           set;
       }
       public string Color
       {
           get;
           set;
       }
       /// <summary>
       /// 购车时间.(类型为转让时使用)
       /// </summary>
       public short? BuyTime
       {
           get;
           set;
       }
       /// <summary>
       /// 行驶里程.(类型为转让时使用)
       /// </summary>
       public int? Rundistance
       {
           get;
           set;
       }

       private string _tagName;
       public string TagName
       {
           get
           {
               if (_tagName == null)
               {
                   var tag = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag1);
                   if (tag != null)
                   {
                       _tagName = tag.Name;
                   }
                   if(_tagName==null)
                   {
                       _tagName = string.Empty;
                   }
               }
               return _tagName;
           }
       }

       private string _qualityName;
       public string QualityName
       {
           get
           {
               if (_qualityName == null)
               {
                   if (this.Quality == 100)
                   {
                       _qualityName = "全新";
                   }
                   else if (this.Quality.ToString().EndsWith("0"))
                   {
                       _qualityName = this.Quality.ToString().Substring(0, 1);
                   }
                   else
                   {
                       _qualityName = this.Quality.ToString();
                   }
                   _qualityName += "成新";
               }
               return _qualityName;
           }
       }

       private ObjectType _brand;
       public ObjectType Brand
       {
           get
           {
               if (_brand == null)
               {
                   _brand = this.ObjectTypeCollection.FirstOrDefault(item => item.Id == this.ObjectType);
               }
               return _brand;
           }
       }

       #region InfoBase 重写成员.
       private static List<ObjectType> _objectTypeCollection;
       public override List<ObjectType> ObjectTypeCollection
       {
           get
           {
               if (_objectTypeCollection == null)
               {
                   var carCategory = InfoCategory.GetCategory<CarCategory>();
                   var category = carCategory.Children.FirstOrDefault(item => item.Singleton == CarMotor.Singleton);
                   if (category != null)
                   {
                       _objectTypeCollection = category.ObjectTypeCollection;
                   }
                   //_objectTypeCollection = new List<ObjectType>()
                   // {
                   //     new ObjectType()
                   //     {
                   //         Id=1,
                   //         Name="阿普利亚"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 2,
                   //         Name = "本田"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 3,
                   //         Name = "宝马"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 4,
                   //         Name = "比亚乔"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 5,
                   //         Name = "春兰"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 6,
                   //         Name = "长铃"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 7,
                   //         Name = "春风"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 8,
                   //         Name = "川崎"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 9,
                   //         Name = "大阳"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 10,
                   //         Name = "丰田"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 11,
                   //         Name = "光阳"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 12,
                   //         Name = "豪爵"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 13,
                   //         Name = "豪爵铃木"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 14,
                   //         Name = "哈雷"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 15,
                   //         Name = "豪光"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 16,
                   //         Name = "黄河川崎"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 17,
                   //         Name = "华日"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 18,
                   //         Name = "洪都"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 19,
                   //         Name = "金城"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 20,
                   //         Name = "金城铃木"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 21,
                   //         Name = "嘉陵"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 22,
                   //         Name = "嘉陵本田"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 23,
                   //         Name = "建设"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 24,
                   //         Name = "建设雅马哈"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 25,
                   //         Name = "金舰"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 26,
                   //         Name = "吉利"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 27,
                   //         Name = "力帆"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 28,
                   //         Name = "隆鑫"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 29,
                   //         Name = "铃木"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 30,
                   //         Name = "凌云"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 31,
                   //         Name = "南方"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 32,
                   //         Name = "钱江"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 33,
                   //         Name = "轻骑"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 34,
                   //         Name = "轻骑铃木"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 35,
                   //         Name = "轻骑木兰"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 36,
                   //         Name = "三铃"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 37,
                   //         Name = "五羊本田"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 38,
                   //         Name = "新大洲"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 39,
                   //         Name = "新大洲本田"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 40,
                   //         Name = "幸福"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 41,
                   //         Name = "雅马哈"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 42,
                   //         Name = "宗申"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 43,
                   //         Name = "其他"
                   //     },
                   //     new ObjectType()
                   //     {
                   //         Id = 44,
                   //         Name = "不限"
                   //     },
                   // };
               }
               return _objectTypeCollection;
           }
       }

       private static List<InfoTag> _tagCollection;
       public override List<InfoTag> TagCollection
       {
           get
           {
               if (_tagCollection == null)
               {
                   var carCategory = InfoCategory.GetCategory<CarCategory>();
                   var category = carCategory.Children.FirstOrDefault(item => item.Singleton == CarMotor.Singleton);
                   if (category != null)
                   {
                       _tagCollection = category.TagCollection;
                   }
                   //_tagCollection = new List<InfoTag>()
                   //{
                   //    new InfoTag()
                   //    {
                   //        Id=1,
                   //        Name="弯梁车",
                   //        ObjectTypeId=0
                   //    },
                   //    new InfoTag()
                   //    {
                   //        Id=2,
                   //        Name="踏板车",
                   //        ObjectTypeId=0
                   //    },
                   //    new InfoTag()
                   //    {
                   //        Id=3,
                   //        Name="骑式车",
                   //        ObjectTypeId=0
                   //    },
                   //    new InfoTag()
                   //    {
                   //        Id=4,
                   //        Name="太子车",
                   //        ObjectTypeId=0
                   //    },
                   //    new InfoTag()
                   //    {
                   //        Id=5,
                   //        Name="迷你车",
                   //        ObjectTypeId=0
                   //    },
                   //    new InfoTag()
                   //    {
                   //        Id=6,
                   //        Name="越野摩托",
                   //        ObjectTypeId=0
                   //    },
                   //    new InfoTag()
                   //    {
                   //        Id=7,
                   //        Name="沙滩车",
                   //        ObjectTypeId=0
                   //    },
                   //    new InfoTag()
                   //    {
                   //        Id=8,
                   //        Name="大排量",
                   //        ObjectTypeId=0
                   //    },
                   //    new InfoTag()
                   //    {
                   //        Id=9,
                   //        Name="公路赛车",
                   //        ObjectTypeId=0
                   //    },
                   //    new InfoTag()
                   //    {
                   //        Id=10,
                   //        Name="三轮摩托",
                   //        ObjectTypeId=0
                   //    },
                   //};
               }
               return _tagCollection;
           }
       }
       #endregion
       protected override DataAccess<CarMotor, int> GetProvider()
       {
           return new CarMotorDataAccess();
       }
    }
}
