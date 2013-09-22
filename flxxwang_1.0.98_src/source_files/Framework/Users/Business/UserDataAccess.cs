using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Web.Security;
using System.Data.Common;
using Framework.WebControls.Mvc;
using Framework.Extensions;

namespace Framework.Users
{
    public class UserBaseDataAccess<TUser,TProfile> : DataAccess<TUser, int>
        where TUser:UserBase<TUser,TProfile>,new()
        where TProfile:ProfileBase<TProfile>,new()
    {
        public override TUser Insert(TUser instance)
        {
            var user = instance;
            MembershipCreateStatus Status;
            //var u = Membership.CreateUser(user.UserName, null, user.Email, user.PasswordQuestion, null, user.IsApproved, null, out Status);
            //用ajax提交到.ashx,Membership.CreateUser不会运用自定义MembershipProvider,用System.Web.Security.Membership.Provider就可以了。
            var u = System.Web.Security.Membership.Provider.CreateUser(user.UserName, user.InputNewPassword, user.Email, user.PasswordQuestion, user.InputNewPasswordAnswer, user.IsApproved, null, out Status);
            user.Id = Convert.ToInt32(u.ProviderUserKey);
            //user.Profile = new TProfile() { UserId = user.Id };
            //user.Profile.Common = new ProfileCommon() { UserId = user.Id };
            //user.Profile.Insert();
            if (user.Profile != null)
            {
                user.Profile.UserId = user.Id;
                if (user.Profile.Common != null)
                {
                    user.Profile.Common.UserId = user.Id;
                }
                user.Profile.Insert();
            }
            return user;
        }
        public override List<TUser> Insert(List<TUser> instances)
        {
            if (instances == null)
            {
                return null;
            }
            var collection = new List<TUser>();
            foreach (var user in instances)
            {
                var u = this.Insert(user);
                collection.Add(u);
            }
            return collection;
        }
        public override TUser Update(TUser instance)
        {
            var user = (TUser)instance;
            base.Update(instance);
            if (user.Profile != null)
            {
                var exist = ProfileBase<TProfile>.Select(user.Id);
                if (exist == null)
                {
                    user.Profile.UserId = user.Id;
                    user.Profile.Insert();
                }
                user.Profile.Update();
            }
            else
            {
                user.Profile.Delete();
            }
            MembershipUser u = null;
            if (!string.IsNullOrWhiteSpace(user.InputNewPassword))
            {
                u = Membership.GetUser(user.Id);
                u.ChangePassword(user.InputOldPassword, user.InputNewPassword);
            }
            if (!string.IsNullOrWhiteSpace(user.InputNewPasswordQuestion))
            {
                if (u == null)
                {
                    u = Membership.GetUser(user.Id);
                }
                u.ChangePasswordQuestionAndAnswer(u.GetPassword(), user.InputNewPasswordQuestion, user.InputNewPasswordAnswer);
            }
            return user;
        }
        public override List<TUser> Update(List<TUser> instances)
        {
            foreach (var user in instances)
            {
                this.Update(user);
            }
            return instances;
        }

        public override List<TUser> Delete(List<TUser> list)
        {
            var profileCommonList = new List<ProfileCommon>();
            var profileList=new List<TProfile>();
            foreach (var user in list)
            {
                if (user != null && user.Profile != null)
                {
                    profileList.Add(user.Profile);
                    if(user.Profile.Common!=null)
                    {
                        profileCommonList.Add(user.Profile.Common);
                    }
                }
            }
            ProfileCommon.Delete(profileCommonList);
            new TProfile().DataDelete(profileList);

            return base.Delete(list);
        }
        public override int Delete(int PrimaryKey)
        {
            var user = new TUser().DataSelect(PrimaryKey);
            if (user.Profile != null)
            {
                if (user.Profile.Common != null)
                {
                    user.Profile.Common.Delete();
                }
                user.Profile.Delete();
            }
            return base.Delete(PrimaryKey);
        }
        public override TUser Delete(TUser instance)
        {
            var user = instance;
            if (user.Profile != null)
            {
                if (user.Profile.Common != null)
                {
                    user.Profile.Common.Delete();
                }
                user.Profile.Delete();
            }
            return base.Delete(instance);
        }
        public override int DeleteAll()
        {
            var users = new TUser().DataSelectAll();
            foreach (var user in users)
            {
                if (user.Profile != null)
                {
                    if (user.Profile.Common != null)
                    {
                        user.Profile.Common.Delete();
                    }
                    user.Profile.Delete();
                }
            }
            return base.DeleteAll();
        }
        public override int DeleteAll(System.Linq.Expressions.Expression<Func<TUser, bool>> predicate)
        {
            var users = new TUser().DataSelectAll(predicate);
            foreach (var user in users)
            {
                if (user.Profile != null)
                {
                    if (user.Profile.Common != null)
                    {
                        user.Profile.Common.Delete();
                    }
                    user.Profile.Delete();
                }
            }
            return base.DeleteAll(predicate);
        }
        
        public override TUser Select(int PrimaryKey)
        {
            var user=base.Select(PrimaryKey);
            user.Profile = ProfileBase<TProfile>.Select(user.Id);
            return user;
        }
        public override TUser Select(string SqlQuery)
        {
            var user= base.Select(SqlQuery);
            user.Profile = ProfileBase<TProfile>.Select(user.Id);
            return user;
        }
        public override TUser Select(System.Linq.Expressions.Expression<Func<TUser, bool>> predicate, Ordered<TUser, int> orderBy = null)
        {
            var user= base.Select(predicate, orderBy);
            user.Profile = ProfileBase<TProfile>.Select(user.Id);
            return user;
        }
        public override List<TUser> SelectAll(int? Skip = null, int? Take = null)
        {
            var users= base.SelectAll(Skip, Take);
            SetProfile(users);
            return users;
        }
        public override List<TUser> SelectAll(string SqlQuery, int? Skip = null, int? Take = null)
        {
            var users= base.SelectAll(SqlQuery, Skip, Take);
            SetProfile(users);
            return users;
        }
        public override List<TUser> SelectAll(System.Linq.Expressions.Expression<Func<TUser, bool>> predicate, Ordered<TUser, int> orderBy = null, int? Skip = null, int? Take = null)
        {
            var users= base.SelectAll(predicate, orderBy, Skip, Take);
            SetProfile(users);
            return users;
        }
        public override PagedList<TUser> SelectPaging(int PageSize, int PageIndex, int? TotalCount = null)
        {
            var users= base.SelectPaging(PageSize, PageIndex, TotalCount);
            SetProfile(users);
            return users;
        }
        public override PagedList<TUser> SelectPaging(System.Linq.Expressions.Expression<Func<TUser, bool>> predicate, int PageSize, int PageIndex, Ordered<TUser, int> orderBy = null, int? TotalCount = null)
        {
            var users= base.SelectPaging(predicate, PageSize, PageIndex, orderBy, TotalCount);
            SetProfile(users);
            return users;
        }
        public override List<TUser> SelectTop(int ItemCount, Ordered<TUser, int> orderBy = null)
        {
            var users= base.SelectTop(ItemCount, orderBy);
            SetProfile(users);
            return users;
        }
        public override List<TUser> SelectTop(string SqlQuery, int ItemCount)
        {
            var users= base.SelectTop(SqlQuery, ItemCount);
            SetProfile(users);
            return users;
        }
        public override List<TUser> SelectTop(System.Linq.Expressions.Expression<Func<TUser, bool>> predicate, int ItemCount, Ordered<TUser, int> orderBy = null)
        {
            var users= base.SelectTop(predicate, ItemCount, orderBy);
            SetProfile(users);
            return users;
        }
        

        private void SetProfile(IEnumerable<TUser> users)
        {
            if (users == null||users.Count()==0)
            {
                return;
            }
            var userIdList = users.Select(item => item.Id).Distinct();
            var profiles = ProfileBase<TProfile>.SelectAll(item=>userIdList.Contains(item.UserId));
            foreach (var user in users)
            {
                if (user == null)
                {
                    continue;
                }
                user.Profile = profiles.FirstOrDefault(item => item.UserId == user.Id);
            }
        }
    }
}
