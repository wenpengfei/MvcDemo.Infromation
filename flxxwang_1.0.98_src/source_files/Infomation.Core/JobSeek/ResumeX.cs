using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using Framework.Common;
using Framework;

namespace Infomation.Core
{
    /// <summary>
    /// 简历.
    /// </summary>
    public class ResumeX : ModelBase<Resume, int>
    {
        public int Id
        {
            get;
            set;
        }
        public int UserId
        {
            get;
            set;
        }
        public WorkType WorkType
        {
            get;
            set;
        }
        /// <summary>
        /// 简历名称.
        /// </summary>
        public string Name
        {
            get;
            set;
        }
        public int ObjectType
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

        public int RecentJobType
        {
            get;
            set;
        }
        public string RecentJobName
        {
            get;
            set;
        }
        /// <summary>
        /// 薪资.
        /// </summary>
        public int RecentWageMin
        {
            get;
            set;
        }
        /// <summary>
        /// 薪资.
        /// </summary>
        public int RecentWageMax
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
        /// <summary>
        /// 姓名.
        /// </summary>
        public string RealName
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
        /// 学历.
        /// </summary>
        public int Education
        {
            get;
            set;
        }
        /// <summary>
        /// 工作年限.
        /// </summary>
        public int WorkYearStart
        {
            get;
            set;
        }
        /// <summary>
        /// 工作年限.
        /// </summary>
        public int WorkYearEnd
        {
            get;
            set;
        }
        /// <summary>
        /// 出生年月.
        /// </summary>
        public DateTime BirthDay
        {
            get;
            set;
        }
        public string Phone
        {
            get;
            set;
        }
        public string Email
        {
            get;
            set;
        }

        /// <summary>
        /// 现居住地(城市).
        /// </summary>
        public int NowCityId
        {
            get;
            set;
        }
        /// <summary>
        /// 现居住地(区域).
        /// </summary>
        public int? NowRegionId
        {
            get;
            set;
        }
        /// <summary>
        /// 现居住地(商圈).
        /// </summary>
        public int? NowCircleId
        {
            get;
            set;
        }
        public DateTime DateCreated
        {
            get;
            set;
        }
        public DateTime DateModified
        {
            get;
            set;
        }
        public City NowCity
        {
            get
            {
                return City.GetCity(NowCityId);
            }
        }
        public Circle NowCircle
        {
            get
            {
                if (this.NowCircleId != null)
                {
                    return Circle.GetCircle(this.NowCircleId.Value);
                }
                return Circle.Singleton;
            }
        }
        public Region NowRegion
        {
            get
            {
                if (this.NowRegionId != null)
                {
                    return Region.GetRegion(this.NowRegionId.Value);
                }
                return Region.Singleton;
            }
        }
        public string Wage
        {
            get
            {
                if (this.WageMax == 0 && this.WageMin == 0)
                {
                    return "面议";
                }
                return this.WageMin + "-" + this.WageMax+"元/月";
            }
        }
        
        public List<Resume> DataSelectAllByUserId(int UserId)
        {
            string sqlQuery = "select * from "+Provider.TableName+" where UserId="+UserId+"";
            return DataSelectAll(sqlQuery);
        }
        public static List<Resume> SelectAllByUserId(int UserId)
        {
            Resume resume = new Resume();
            return resume.DataSelectAllByUserId(UserId);
        }
        protected override DataAccess<Resume, int> GetProvider()
        {
            return new ResumeDataAccess();
        }
    }
}
