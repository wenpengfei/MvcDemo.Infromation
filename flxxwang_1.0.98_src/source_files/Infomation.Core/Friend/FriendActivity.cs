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
    /// 驴友/活动/聚会
    /// </summary>
    [Table(Name = "Info_FriendActivity")]
    public class FriendActivity:FriendBase<FriendActivity>
    {
        public string Title
        {
            get;
            set;
        }
        public byte ObjectType
        {
            get;
            set;
        }
        /// <summary>
        /// 场地.
        /// </summary>
        public string Address
        {
            get;
            set;
        }
        public DateTime? StartTime
        {
            get;
            set;
        }
        public DateTime? EndTime
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

        #region InfoBase 重写成员.
        private static List<ObjectType> _objectTypeCollection;
        public override List<ObjectType> ObjectTypeCollection
        {
            get
            {
                if (_objectTypeCollection == null)
                {
                    var friendCategory = InfoCategory.GetCategory<FriendCategory>();
                    var category = friendCategory.Children.FirstOrDefault(item => item.Singleton == FriendActivity.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                    //_objectTypeCollection = new List<ObjectType>()
                    //{
                    //    new ObjectType()
                    //    {
                    //        Id=1,
                    //        Name="驴友"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 2,
                    //        Name = "聚会"
                    //    },
                    //    new ObjectType()
                    //    {
                    //        Id = 3,
                    //        Name = "活动"
                    //    },
                    //};
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
                    var friendCategory = InfoCategory.GetCategory<FriendCategory>();
                    var category = friendCategory.Children.FirstOrDefault(item => item.Singleton == FriendActivity.Singleton);
                    if (category != null)
                    {
                        _tagCollection = category.TagCollection;
                    }
                    //_tagCollection = new List<InfoTag>()
                    //{
                    //    new InfoTag()
                    //    {
                    //        Id=1,
                    //        Name="自助游",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=2,
                    //        Name="徒步",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=3,
                    //        Name="驾车游",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=4,
                    //        Name="杀人游戏",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=5,
                    //        Name="单身聚会",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=6,
                    //        Name="公益活动",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=7,
                    //        Name="周末活动",
                    //        ObjectTypeId=0
                    //    },
                    //    new InfoTag()
                    //    {
                    //        Id=8,
                    //        Name="团购/打折",
                    //        ObjectTypeId=0
                    //    },
                    //};
                }
                return _tagCollection;
            }
        }
        #endregion

        protected override DataAccess<FriendActivity, int> GetProvider()
        {
            return new FriendActivityDataAccess();
        }
    }
}
