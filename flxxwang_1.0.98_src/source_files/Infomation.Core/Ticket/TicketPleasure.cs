using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;
using Framework.Extensions;

namespace Infomation.Core
{
    /// <summary>
    /// 游乐
    /// </summary>
    [Table(Name = "Info_TicketPleasure")]
    public class TicketPleasure:TicketBase<TicketPleasure>
    {
        public string Title
        {
            get;
            set;
        }
        /// <summary>
        /// 1:转让,2:求购.
        /// </summary>
        public byte Type
        {
            get;
            set;
        }
        public int Price
        {
            get;
            set;
        }
        /// <summary>
        /// 有效期.
        /// </summary>
        public DateTime? ExpiryDate
        {
            get;
            set;
        }
        public string Content
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
        public bool IsBiz
        {
            get;
            set;
        }

        public string TypeName
        {
            get
            {
                if (this.Type == 1)
                {
                    return "转让";
                }
                else
                {
                    return "求购";
                }
            }
        }

        private string _tagsName;
        public string TagsName
        {
            get
            {
                if (_tagsName == null)
                {
                    _tagsName = string.Empty;
                    var tag1 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag1);
                    if (tag1 != null)
                    {
                        _tagsName += "," + tag1.Name;
                    }
                    var tag2 = this.TagCollection.FirstOrDefault(item => item.Id == this.Tag2);
                    if (tag2 != null)
                    {
                        _tagsName += "," + tag2.Name;
                    }
                    if (!string.IsNullOrWhiteSpace(_tagsName))
                    {
                        _tagsName = _tagsName.Substring(1);
                    }
                }
                return _tagsName;
            }
        }

        #region InfoBase 重写成员.
        private static List<InfoTag> _tagCollection;
        public override List<InfoTag> TagCollection
        {
            get
            {
                if (_tagCollection == null)
                {
                    var ticketCategory = InfoCategory.GetCategory<TicketCategory>();
                    var category = ticketCategory.Children.FirstOrDefault(item => item.Singleton == TicketPleasure.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="动物园",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="温泉",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="其他",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="游乐园",
                    //        ObjectTypeId=0
                    //    },
                    //    //new InfoTag()
                    //    //{
                    //    //    Id=5,
                    //    //    Name="极地海洋世界",
                    //    //    ObjectTypeId=0
                    //    //},
                    //    //new InfoTag()
                    //    //{
                    //    //    Id=6,
                    //    //    Name="宋城",
                    //    //    ObjectTypeId=0
                    //    //},
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion

        protected override DataAccess<TicketPleasure, int> GetProvider()
        {
            return new TicketPleasureDataAccess();
        }
    }
}
