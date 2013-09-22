using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework;
using Infomation.Core.Data;
using System.Data.Common;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 申请职位.
    /// </summary>
    [Table(Name = "Info_JobApply")]
    public class JobApply:ModelBase<JobApply,int>
    {
        [Column(IsPrimaryKey = true)]
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
        public int ResumeId
        {
            get;
            set;
        }
        /// <summary>
        /// 招聘信息Id
        /// </summary>
        public int RecruitId
        {
            get;
            set;
        }
        /// <summary>
        /// 招聘方UserId.
        /// </summary>
        public int RecruitUserId
        {
            get;
            set;
        }
        /// <summary>
        /// 招聘方公司Id.
        /// </summary>
        public int CompanyId
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
        private Resume _resume;
        public Resume Resume
        {
            get
            {
                if (_resume == null)
                {
                    _resume = Resume.Select(this.ResumeId);
                }
                return _resume;
            }
        }

        private Recruit _recruit;
        public Recruit Recruit
        {
            get
            {
                if (_recruit == null)
                {
                    _recruit = Recruit.Select(this.RecruitId);
                }
                return _recruit;
            }
        }

        private Company _company;
        public Company Company
        {
            get
            {
                if (_company == null)
                {
                    _company = Company.Select(this.CompanyId);
                }
                return _company;
            }
        }

        public List<JobApply> DataSelectAllByUserId(int UserId)
        {
            return DataSelectAll(item=>item.UserId==UserId);
        }
        public List<JobApply> DataSelectAllByRecruitUserId(int RecruitUserId)
        {
            return DataSelectAll(item=>item.RecruitUserId==RecruitUserId);
        }
        public List<JobApply> DataSelectAllByRecruitId(int RecruitId)
        {
            return DataSelectAll(item=>item.RecruitId==RecruitId);
        }
        public JobApply DataSelect(int UserId, int RecruitId)
        {
            return DataSelect(item=>item.UserId==UserId&&item.RecruitId==RecruitId);
        }

        public static List<JobApply> SelectAllByUserId(int UserId)
        {
            return new JobApply().DataSelectAllByUserId(UserId);
        }
        public static List<JobApply> SelectAllByRecruitUserId(int RecruitUserId)
        {
            return new JobApply().DataSelectAllByRecruitUserId(RecruitUserId);
        }
        public static List<JobApply> SelectAllByRecruitId(int RecruitId)
        {
            return new JobApply().DataSelectAllByRecruitId(RecruitId);
        }
        public static JobApply Select(int UserId, int RecruitId)
        {
            return new JobApply().DataSelect(UserId, RecruitId);
        }
        protected override Framework.Data.DataAccess<JobApply, int> GetProvider()
        {
            return new JobApplyDataAccess();
        }
    }
}
