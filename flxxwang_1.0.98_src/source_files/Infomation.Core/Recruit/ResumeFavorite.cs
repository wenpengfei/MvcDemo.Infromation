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
    /// 下载的简历/收藏的简历
    /// </summary>
    [Table(Name = "Info_ResumeFavorite")]
    public class ResumeFavorite:ModelBase<ResumeFavorite,int>
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
        public int ResumeId
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
        public List<ResumeFavorite> DataSelectAllByUserId(int UserId)
        {
            return DataSelectAll(item=>item.UserId==UserId);
        }
        public ResumeFavorite DataSelect(int UserId,int ResumeId)
        {
            return DataSelect(item=>item.UserId==UserId&&item.ResumeId==ResumeId);
        }

        public static List<ResumeFavorite> SelectAllByUserId(int UserId)
        {
            return new ResumeFavorite().DataSelectAllByUserId(UserId);
        }

        public static ResumeFavorite Select(int UserId, int ResumeId)
        {
            return new ResumeFavorite().DataSelect(UserId, ResumeId);
        }
        protected override Framework.Data.DataAccess<ResumeFavorite, int> GetProvider()
        {
            return new ResumeFavoriteDataAccess();
        }
    }
}
