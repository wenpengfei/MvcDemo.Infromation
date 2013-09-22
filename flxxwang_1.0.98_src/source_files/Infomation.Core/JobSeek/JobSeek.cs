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
    /// 求职.
    /// </summary>
    [Table(Name = "Info_JobSeek")]
    public class JobSeek : InfoBase<JobSeek>,IJobSeek
    {
        public override string TitleDisplay
        {
            get 
            { 
                return this.Resume.Name; 
            }
        }
        public JobType JobType
        {
            get;
            set;
        }
        public byte? ObjectType
        {
            get;
            set;
        }
        public WorkType WorkType
        {
            get;
            set;
        }
        public string JobName
        {
            get;
            set;
        }
        /// <summary>
        /// 薪资.
        /// </summary>
        public int WageMin
        {
            get;
            set;
        }
        /// <summary>
        /// 薪资.
        /// </summary>
        public int WageMax
        {
            get;
            set;
        }
        /// <summary>
        /// 根括自己.
        /// </summary>
        public string AboutMe
        {
            get;
            set;
        }
        public int ResumeId
        {
            get;
            set;
        }

        public override string Phone
        {
            get
            {
                if (this.Resume != null)
                {
                    return this.Resume.Phone;
                }
                return null;
            }
            set
            {
                throw new PropertyAccessException();
            }
        }

        /// <summary>
        /// 信息来源
        /// </summary>
        public long? Source
        {
            get;
            set;
        }

        private Resume _resume;
        public Resume Resume
        {
            get
            {
                if (_resume == null)
                {
                    _resume = Infomation.Core.Resume.Select(this.ResumeId);
                }
                return _resume;
            }
            //set//主要在抓取程序中使用,提高性能.
            //{
            //    _resume = value;
            //}
        }

        private string _wage;
        public string Wage
        {
            get
            {
                if (this.WageMax == 0 && this.WageMin == 0)
                {
                    return "面议";
                }
                if (this.WageMax < this.WageMin)
                {
                    return this.WageMin + "元以上/月";
                }
                return this.WageMin + "-" + this.WageMax + "元/月";
            }
            private set//使能被系列化
            {
                _wage = value;
            }
        }

        #region InfoBase 重写成员.
        private List<ObjectType> _objectTypeCollection;//不能为静态,与JobType有关.
        public override List<ObjectType> ObjectTypeCollection
        {
            get
            {
                if (_objectTypeCollection == null)
                {
                    _objectTypeCollection = this.Category.ObjectTypeCollection;
                    //if (this.Category.Children == null)
                    //{
                    //    _objectTypeCollection = new List<ObjectType>();
                    //}
                    //else
                    //{
                    //    _objectTypeCollection = new List<ObjectType>(
                    //       this.Category.Children.Select(item =>
                    //       {
                    //           var jobCategory = item as JobCategory;
                    //           return new ObjectType()
                    //           {
                    //               Id = jobCategory.Id,
                    //               Name = jobCategory.Name
                    //           };
                    //       })
                    //       );
                    //}
                }
                return _objectTypeCollection;
            }
        }
        #endregion

        public Dictionary<int?,int> DataRecordCount(City city, JobType jobType)
        {
            var sqlQuery = "select RegionId,COUNT(*) Total from " + TableName + " where CityId=" + city.Id + " and JobType="+Convert.ToInt32(jobType)+" group by RegionId";
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
        public static Dictionary<int?, int> RecordCount(City city, JobType jobType)
        {
            return new JobSeek().DataRecordCount(city, jobType);
        }

        private static Dictionary<JobType, Dictionary<int, int>> _infoCount;
        public new Dictionary<JobType, Dictionary<int, int>> InfoCount
        {
            get
            {
                if (_infoCount == null)
                {
                    _infoCount = new Dictionary<JobType, Dictionary<int, int>>();
                }
                return _infoCount;
            }
        }
        protected override DataAccess<JobSeek, int> GetProvider()
        {
            return new JobSeekDataAccess();
        }
    }
}
