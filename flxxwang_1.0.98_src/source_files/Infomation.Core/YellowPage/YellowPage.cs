using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using Framework.Common;
using System.Data.Common;
using System.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 黄页.
    /// </summary>
    [Table(Name = "Info_YellowPage")]
    public class YellowPage:InfoBase<YellowPage>,IYellowPage
    {
        public YellowPageType YellowPageType
        {
            get;
            set;
        }
        public string Title
        {
            get;
            set;
        }
        public override string TitleDisplay
        {
            get 
            { 
                return this.Title; 
            }
        }
        public byte? ObjectType
        {
            get;
            set;
        }

        #region Tag
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
        public byte? Tag3
        {
            get;
            set;
        }
        public byte? Tag4
        {
            get;
            set;
        }
        public byte? Tag5
        {
            get;
            set;
        }
        public byte? Tag6
        {
            get;
            set;
        }
        public byte? Tag7
        {
            get;
            set;
        }
        public byte? Tag8
        {
            get;
            set;
        }
        public byte? Tag9
        {
            get;
            set;
        }
        public byte? Tag10
        {
            get;
            set;
        }
        public byte? Tag11
        {
            get;
            set;
        }
        public byte? Tag12
        {
            get;
            set;
        }
        #endregion

        public string Address
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
        public string QQOrMSN
        {
            get;
            set;
        }
        /// <summary>
        /// 类型为租车时使用.
        /// </summary>
        public int? Price
        {
            get;
            set;
        }
        /// <summary>
        /// 其他电话.
        /// </summary>
        public string Phone2
        {
            get;
            set;
        }
        /// <summary>
        /// 信息来源
        /// </summary>
        public long? Source
        {
            get;
            set;
        }
        //private Company _company;
        //public Company Company
        //{
        //    get
        //    {
        //        if (_company == null)
        //        {
        //            if (this.UserId != null)
        //            {
        //                _company = Company.SelectByUserId(this.UserId.Value);
        //            }
        //        }
        //        return _company;
        //    }
        //}

        #region InfoBase 重写成员.
        private List<ObjectType> _objectTypeCollection;//不能为静态,与YellowPageType有关.
        public override List<ObjectType> ObjectTypeCollection
        {
            get
            {
                if (_objectTypeCollection == null)
                {
                    _objectTypeCollection = this.Category.ObjectTypeCollection;
                    //var yellowPageCategory = InfoCategory.GetCategory(this.YellowPageType);
                    //_objectTypeCollection = yellowPageCategory.ObjectTypeCollection;
                    //if (yellowPageCategory.Children == null)
                    //{
                    //    _objectTypeCollection = new List<ObjectType>();
                    //}
                    //else
                    //{
                    //    _objectTypeCollection = new List<ObjectType>(
                    //        yellowPageCategory.Children.Select(item =>
                    //        {
                    //            var category = item as YellowPageCategory;
                    //            return new ObjectType()
                    //            {
                    //                Id = category.Id,
                    //                Name = category.Name
                    //            };
                    //        })
                    //        );
                    //}
                }
                return _objectTypeCollection;
            }
        }

        private List<InfoTag> _tagCollection;//不能为静态,与YellowPageType有关.
        public override List<InfoTag> TagCollection
        {
            get
            {
                if (_tagCollection == null)
                {
                    _tagCollection = this.Category.TagCollection;
                    //var yellowPageCategory = InfoCategory.GetCategory(this.YellowPageType);
                    //_tagCollection = yellowPageCategory.TagCollection;
                }
                return _tagCollection;
            }
        }
        #endregion

        //public override YellowPage GetEmpty()
        //{
        //    return this;
        //}

        public Dictionary<int?,int> DataRecordCount(City city, YellowPageType yellowPageType)
        {
            var sqlQuery = "select RegionId,COUNT(*) Total from " + TableName + " where CityId=" + city.Id + " and YellowPageType="+Convert.ToInt32(yellowPageType)+" group by RegionId";
            DbCommand cmd = DataAccess.db.GetSqlStringCommand(sqlQuery);
            DataTable dt = DataAccess.db.ExecuteDataSet(cmd).Tables[0];
            Dictionary<int?, int> dic=new Dictionary<int?,int>();
            foreach (DataRow dr in dt.Rows)
            {
                int? RegionId = null;
                if (dr["RegionId"] != DBNull.Value)
                {
                    RegionId = Convert.ToInt32(dr["RegionId"]);
                }
                dic[RegionId] = Convert.ToInt32(dr["Total"]);
            }
            return dic;
        }
        public static Dictionary<int?, int> RecordCount(City city, YellowPageType yellowPageType)
        {
            return new YellowPage().DataRecordCount(city, yellowPageType);
        }
        //public override Dictionary<int?, int> InfoCount
        //{
        //    get
        //    {
        //        throw new PropertyAccessException();
        //    }
        //}
        private static Dictionary<YellowPageType, Dictionary<int, int>> _infoCount;
        public new Dictionary<YellowPageType, Dictionary<int, int>> InfoCount
        {
            get
            {
                if (_infoCount == null)
                {
                    _infoCount = new Dictionary<YellowPageType, Dictionary<int, int>>();
                }
                return _infoCount;
            }
        }
        protected override DataAccess<YellowPage, int> GetProvider()
        {
            return new YellowPageDataAccess();
        }
    }
}
