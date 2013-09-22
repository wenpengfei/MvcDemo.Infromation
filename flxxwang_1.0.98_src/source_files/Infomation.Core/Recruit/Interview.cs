using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework;
using System.Data.Common;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 面试邀请.
    /// </summary>
    [Table(Name = "Info_Interview")]
    public class Interview:ModelBase<Interview,int>
    {
        [Column(IsPrimaryKey = true)]
        public int Id
        {
            get;
            set;
        }
        /// <summary>
        /// 招聘方UserId
        /// </summary>
        public int UserId
        {
            get;
            set;
        }
        public int JobSeekId
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
        /// 求职方UserId
        /// </summary>
        public int ToUserId
        {
            get;
            set;
        }
        /// <summary>
        /// 面试通知内容.
        /// </summary>
        public string Content
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
        private JobSeek _jobSeek;
        public JobSeek JobSeek
        {
            get
            {
                if (_jobSeek == null)
                {
                    _jobSeek = JobSeek.Select(this.JobSeekId);
                }
                return _jobSeek;
            }
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
        public List<Interview> DataSelectAllByUserId(int UserId)
        {
            var p = DataAccess.db.DbProviderFactory.CreateParameter();
            p.ParameterName = "@UserId";
            p.Value = UserId;
            return DataSelectAll(item=>item.UserId==UserId);
        }
        public List<Interview> DataSelectAllByToUserId(int ToUserId)
        {
            var p = DataAccess.db.DbProviderFactory.CreateParameter();
            p.ParameterName = "@ToUserId";
            p.Value = ToUserId;
            return DataSelectAll(item=>item.ToUserId==ToUserId);
        }

        public static List<Interview> SelectAllByUserId(int UserId)
        {
            return new Interview().DataSelectAllByUserId(UserId);
        }
        public static List<Interview> SelectAllByToUserId(int ToUserId)
        {
            return new Interview().DataSelectAllByToUserId(ToUserId);
        }

        protected override Framework.Data.DataAccess<Interview, int> GetProvider()
        {
            return new InterviewDataAccess();
        }
    }
}
