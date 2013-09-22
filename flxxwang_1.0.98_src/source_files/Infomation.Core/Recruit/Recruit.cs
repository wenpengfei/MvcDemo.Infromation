using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using Framework.Web.Script.Serialization;
using System.Data.Common;
using Framework.Common;
using System.Data;
using System.Runtime.Serialization;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 招聘信息.
    /// </summary>
    [Table(Name = "Info_Recruit")]
    [DataContract]
    public class Recruit:InfoBase<Recruit>,IRecruit
    {
        [DataMember]
        public override string TitleDisplay
        {
            get 
            {
                return this.JobName; 
            }
        }
        [DataMember]
        public int CompanyId
        {
            get;
            set;
        }
        [DataMember]
        public JobType JobType
        {
            get;
            set;
        }
        [DataMember]
        public byte ObjectType
        {
            get;
            set;
        }
        [DataMember]
        public WorkType WorkType
        {
            get;
            set;
        }
        [DataMember]
        public string JobName
        {
            get;
            set;
        }
        /// <summary>
        /// 招聘人数.
        /// </summary>
        [DataMember]
        public short RecruitCount
        {
            get;
            set;
        }
        /// <summary>
        /// 薪资.
        /// </summary>
        [DataMember]
        public int WageMin
        {
            get;
            set;
        }
        /// <summary>
        /// 薪资.
        /// </summary>
        [DataMember]
        public int WageMax
        {
            get;
            set;
        }
        /// <summary>
        /// 学历要求.
        /// </summary>
        [DataMember]
        public Education Education
        {
            get;
            set;
        }
        //public int Education
        //{
        //    get;
        //    set;
        //}
        /// <summary>
        /// 工作年限.
        /// </summary>
        [DataMember]
        public byte WorkYearStart
        {
            get;
            set;
        }
        /// <summary>
        /// 工作年限.
        /// </summary>
        [DataMember]
        public byte WorkYearEnd
        {
            get;
            set;
        }
        /// <summary>
        /// 职位要求.
        /// </summary>
        [DataMember]
        public string JobDescription
        {
            get;
            set;
        }
        /// <summary>
        /// 接收简历邮箱.
        /// </summary>
        [DataMember]
        public string RecvEmail
        {
            get;
            set;
        }
        /// <summary>
        /// 性别要求,兼职才使用该属性.
        /// </summary>
        [DataMember]
        public bool? SexRequire
        {
            get;
            set;
        }
        /// <summary>
        /// 工作时间，兼职时才使用该属性.
        /// </summary>
        [DataMember]
        public string WorkTimes
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

        private int[] _workTimeList;
        [DataMember]
        public int[] WorkTimeList
        {
            get
            {
                if (_workTimeList == null)
                {
                    if (WorkTimes != null)
                    {
                        //_workTimeList = WorkTimes.Split(new char[] { '|' }).Select(item => Convert.ToInt32(item)).ToArray();
                        _workTimeList = JsonHelper.Deserialize<int[]>(this.WorkTimes);
                    }
                    else
                    {
                        _workTimeList = new int[] { };
                    }
                }
                return _workTimeList;
            }
        }

        private string _workYear;
        [DataMember]
        public string WorkYear
        {
            get
            {
                if (_workYear == null)
                {
                    if (this.WorkYearStart == 0 && this.WorkYearEnd == 0)
                    {
                        _workYear = "不限";
                    }
                    else
                    {
                        _workYear=this.WorkYearStart + " - " + this.WorkYearEnd + " 年";
                    }
                }
                return _workYear;
            }
            private set//使系列化时不出错.
            {
                _workYear = value;
            }
        }
        private string _wage;
        [DataMember]
        public string Wage
        {
            get
            {
                if (_wage == null)
                {
                    if (this.WageMin == 0 && this.WageMax == 0)
                    {
                        _wage = "面议";
                    }
                    else
                    {
                        _wage = this.WageMin + "-" + this.WageMax + "元/月";
                    }
                }
                return _wage;
            }
            private set//使系列化时不出错.
            {
                _wage = value;
            }
        }
        private Company _company;
        [DataMember]
        public Company Company
        {
            get
            {
                if (_company == null)
                {
                    //if (this.UserId != null)
                    //{
                    //_company = Infomation.Core.Company.SelectByUserId(UserId.Value);
                    //}
                    _company = Infomation.Core.Company.Select(item=>item.Id==this.CompanyId);
                }
                return _company;
            }
            private set//使系列化时不出错.
            {
                _company = value;
            }
        }
        
        #region InfoBase 重写成员.
        private List<ObjectType> _objectTypeCollection;//不能为静态,与JobType有关.
        [DataMember]
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
                    //        this.Category.Children.Select(item =>
                    //        {
                    //            var jobCategory = item as JobCategory;
                    //            return new ObjectType()
                    //            {
                    //                Id = jobCategory.Id,
                    //                Name = jobCategory.Name
                    //            };
                    //        }
                    //            )
                    //        );
                    //}
                }
                return _objectTypeCollection;
            }
        }
        #endregion

        public Dictionary<int?, int> DataRecordCount(City city, JobType jobType)
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
        //public override Dictionary<int?, int> InfoCount
        //{
        //    get
        //    {
        //        throw new PropertyAccessException();
        //    }
        //}
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
        protected override DataAccess<Recruit, int> GetProvider()
        {
            return new RecruitDataAccess();
        }
    }
}
