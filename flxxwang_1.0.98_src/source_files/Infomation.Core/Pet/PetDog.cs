using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    [Table(Name = "Info_PetDog")]
    public class PetDog:PetBase<PetDog>
    {
        /// <summary>
        /// 1:转让,2:求购.
        /// </summary>
        public byte Type
        {
            get;
            set;
        }
        public string Title
        {
            get;
            set;
        }
        public byte? Tag1
        {
            get;
            set;
        }
        public byte? Tag2
        {
            get;
            set;
        }
        public bool Sex
        {
            get;
            set;
        }
        /// <summary>
        /// 求购时为null.
        /// </summary>
        public byte? Age
        {
            get;
            set;
        }
        /// <summary>
        /// 年龄计量单位.
        /// </summary>
        public string AgeUnit
        {
            get;
            set;
        }
        /// <summary>
        /// 求购时为null.
        /// </summary>
        public int? Price
        {
            get;
            set;
        }
        /// <summary>
        /// 疫苗情况.
        /// </summary>
        public string Bacterin
        {
            get;
            set;
        }
        /// <summary>
        /// 有无血统证明.
        /// </summary>
        public bool? Descent
        {
            get;
            set;
        }
        /// <summary>
        /// 补充说明.
        /// </summary>
        public string Content
        {
            get;
            set;
        }

        #region InfoBase 重写成员.
        private static List<InfoTag> _tagCollection;
        public override List<InfoTag> TagCollection
        {
            get
            {
                if (_tagCollection == null)
                {
                    var petCategory = InfoCategory.GetCategory<PetCategory>();
                    var category = petCategory.Children.FirstOrDefault(item => item.Singleton == PetDog.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="哈士奇",
                    //        ObjectTypeId=0,
                    //        Tag="M"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="藏獒",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="松狮",
                    //        ObjectTypeId=0,
                    //        Tag="M"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="金毛",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="博美犬",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="吉娃娃",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="德国牧羊犬",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="苏格兰牧羊犬",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=9,
                    //        Name="雪纳瑞",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=10,
                    //        Name="拉布拉多",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=11,
                    //        Name="比熊",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=12,
                    //        Name="可卡",
                    //        ObjectTypeId=0,
                    //        Tag="M"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=13,
                    //        Name="大麦町犬",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=14,
                    //        Name="贵宾",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=15,
                    //        Name="高加索犬",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=16,
                    //        Name="蝴蝶犬",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=17,
                    //        Name="沙皮犬",
                    //        ObjectTypeId=0,
                    //        Tag="M"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=18,
                    //        Name="灵提",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=19,
                    //        Name="泰迪熊",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=20,
                    //        Name="古牧",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=21,
                    //        Name="萨摩耶",
                    //        ObjectTypeId=0,
                    //        Tag="M"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=22,
                    //        Name="大白熊",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=23,
                    //        Name="阿拉斯加",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=24,
                    //        Name="边境牧羊犬",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=25,
                    //        Name="罗威纳",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=26,
                    //        Name="圣伯纳",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=27,
                    //        Name="斗牛犬",
                    //        ObjectTypeId=0,
                    //        Tag="M"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=28,
                    //        Name="喜乐蒂",
                    //        ObjectTypeId=0,
                    //        Tag="M"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=29,
                    //        Name="柯基犬",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=30,
                    //        Name="京巴",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=31,
                    //        Name="巴哥",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=32,
                    //        Name="约克夏",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=33,
                    //        Name="西高地",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=34,
                    //        Name="腊肠",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=35,
                    //        Name="杜宾犬",
                    //        ObjectTypeId=0,
                    //        Tag="L"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=36,
                    //        Name="比格犬",
                    //        ObjectTypeId=0,
                    //        Tag="M"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=37,
                    //        Name="西施犬",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=38,
                    //        Name="银狐犬",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=39,
                    //        Name="其他品种",
                    //        ObjectTypeId=0,
                    //        Tag="S"
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion

        protected override DataAccess<PetDog, int> GetProvider()
        {
            return new PetDogDataAccess();
        }
    }
}
