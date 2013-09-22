using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using System.Data.Linq.Mapping;
using Framework.WebControls.Mvc;

namespace Framework.Users
{
    public class ProfileBase<TProfile>:ModelBase<TProfile,int>
        where TProfile:ProfileBase<TProfile>,new()
    {
        [Column(IsPrimaryKey = true)]
        public int UserId
        {
            get;
            set;
        }
        public ProfileCommon Common
        {
            get;
            set;
        }
        public override TProfile Insert()
        {
            return DataAccess.Insert(this as TProfile);
        }
        
        public override TProfile Update()
        {
            this.Common.Update();
            return base.Update();
        }
        public override List<TProfile> DataUpdate(List<TProfile> instances)
        {
            this.Common.DataUpdate(instances.Select(item => item.Common).ToList());
            return base.DataUpdate(instances);
        }

        public override TProfile DataSelect(Expression<Func<TProfile, bool>> expression, Ordered<TProfile, int> orderBy = null)
        {
            var profile= base.DataSelect(expression, orderBy);
            SetProfileCommon(profile);
            return profile;
        }
        public override TProfile DataSelect(int PrimaryKey)
        {
            var profile= base.DataSelect(PrimaryKey);
            SetProfileCommon(profile);
            return profile;
        }
        public override TProfile DataSelect(string SqlQuery)
        {
            var profile= base.DataSelect(SqlQuery);
            SetProfileCommon(profile);
            return profile;
        }
        public override List<TProfile> DataSelectAll(Expression<Func<TProfile, bool>> predicate, Ordered<TProfile, int> orderBy = null, int? Skip = null, int? Take = null)
        {
            var profiles= base.DataSelectAll(predicate, orderBy, Skip, Take);
            SetProfileCommon(profiles);
            return profiles;
        }
        public override List<TProfile> DataSelectAll(int? Skip = null, int? Take = null)
        {
            var profiles= base.DataSelectAll(Skip, Take);
            SetProfileCommon(profiles);
            return profiles;
        }
        public override List<TProfile> DataSelectAll(string SqlQuery, int? Skip = null, int? Take = null)
        {
            var profiles= base.DataSelectAll(SqlQuery, Skip, Take);
            SetProfileCommon(profiles);
            return profiles;
        }
        public override PagedList<TProfile> DataSelectPaging(Expression<Func<TProfile, bool>> predicate, int PageSize, int PageIndex, Ordered<TProfile, int> orderBy = null, int? TotalCount = null)
        {
            var profiles= base.DataSelectPaging(predicate, PageSize, PageIndex, orderBy, TotalCount);
            SetProfileCommon(profiles);
            return profiles;
        }
        public override PagedList<TProfile> DataSelectPaging(int PageSize, int PageIndex, int? TotalCount = null)
        {
            var profiles= base.DataSelectPaging(PageSize, PageIndex, TotalCount);
            SetProfileCommon(profiles);
            return profiles;
        }
        public override List<TProfile> DataSelectTop(Expression<Func<TProfile, bool>> predicate, int ItemCount, Ordered<TProfile, int> orderBy = null)
        {
            var profiles= base.DataSelectTop(predicate, ItemCount, orderBy);
            SetProfileCommon(profiles);
            return profiles;
        }
        public override List<TProfile> DataSelectTop(int ItemCount, Ordered<TProfile, int> orderBy = null)
        {
            var profiles= base.DataSelectTop(ItemCount, orderBy);
            SetProfileCommon(profiles);
            return profiles;
        }
        public override List<TProfile> DataSelectTop(string SqlQuery, int ItemCount)
        {
            var profiles= base.DataSelectTop(SqlQuery, ItemCount);
            SetProfileCommon(profiles);
            return profiles;
        }

        private void SetProfileCommon(IEnumerable<TProfile> profiles)
        {
            if (this is ProfileCommon)
            {
                return;
            }
            if (profiles == null || profiles.Count() == 0)
            {
                return;
            }
            var userIdList = profiles.Select(item => item.UserId).Distinct();
            var commons = ProfileCommon.SelectAll(item=>userIdList.Contains(item.UserId));
            foreach (var profile in profiles)
            {
                if (profile == null)
                {
                    continue;
                }
                profile.Common = commons.FirstOrDefault(item => item.UserId == profile.UserId);
            }
        }
        private void SetProfileCommon(TProfile profile)
        {
            if (this is ProfileCommon)
            {
                return;
            }
            if (profile == null)
            {
                return;
            }
            profile.Common = ProfileCommon.Select(profile.UserId);
        }

        protected override Data.DataAccess<TProfile, int> GetProvider()
        {
            throw new NotImplementedException();
        }
    }
}
