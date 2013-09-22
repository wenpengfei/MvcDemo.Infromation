using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using Framework.Data;
using System.Data.Linq.Mapping;
namespace Framework.Users
{
    //public class User:UserBase<User,ProfileCommon>
    //{
    //    protected override DataAccess<User, int> GetProvider()
    //    {
    //        return new UserDataAccess();
    //    }
    //}
    
    public class UserBase<TUser,TProfile>:ModelBase<TUser,int>
        where TUser:UserBase<TUser,TProfile>,new()
        where TProfile:ProfileBase<TProfile>,new()
    {
        //private int _UserId;

        private string _Comment;
        private DateTime _CreationDate;
        private string _Email;
        private bool _IsApproved;
        private bool _IsLockedOut;
        private DateTime _LastActivityDate;
        private DateTime? _LastLockoutDate;
        private DateTime? _LastLoginDate;
        private DateTime? _LastPasswordChangedDate;
        private string _PasswordQuestion;
        private string _ProviderName;
        private string _UserName;

        //public int UserId
        //{
        //    get
        //    {
        //        return this._UserId;
        //    }
        //    set
        //    {
        //        this._UserId = value;
        //    }
        //}

        [Column(IsPrimaryKey = true)]
        public int Id
        {
            get;
            set;
        }
        public string UserName
        {
            get
            {
                return this._UserName;
            }
            set
            {
                this._UserName = value;
            }
        }
        public string Comment
        {
            get
            {
                return this._Comment;
            }
            set
            {
                this._Comment = value;
            }
        }
        public DateTime CreationDate
        {
            get
            {
                return this._CreationDate.ToLocalTime();
            }
            set
            {
                this._CreationDate = value;
            }
        }
        public string Email
        {
            get
            {
                return this._Email;
            }
            set
            {
                this._Email = value;
            }
        }
        public bool IsApproved
        {
            get
            {
                return this._IsApproved;
            }
            set
            {
                this._IsApproved = value;
            }
        }
        public bool IsLockedOut
        {
            get
            {
                return this._IsLockedOut;
            }
            set
            {
                _IsLockedOut = value;
            }
        }
        public bool IsOnline
        {
            get
            {
                TimeSpan span = new TimeSpan(0, Membership.UserIsOnlineTimeWindow, 0);
                DateTime time = DateTime.UtcNow.Subtract(span);
                return (this.LastActivityDate.ToUniversalTime() > time);
            }
        }
        public DateTime LastActivityDate
        {
            get
            {
                return this._LastActivityDate.ToLocalTime();
            }
            set
            {
                this._LastActivityDate = value.ToUniversalTime();
            }
        }
        public DateTime? LastLockoutDate
        {
            get
            {
                if (this._LastLockoutDate == null)
                {
                    return null;
                }
                return this._LastLockoutDate.Value.ToLocalTime();
            }
            set
            {
                this._LastLockoutDate = value;
            }
        }
        public DateTime? LastLoginDate
        {
            get
            {
                if (this._LastLoginDate == null)
                {
                    return null;
                }
                return this._LastLoginDate.Value.ToLocalTime();
            }
            set
            {
                if (value.HasValue)
                {
                    this._LastLoginDate = value.Value.ToUniversalTime();
                }
                else
                {
                    this._LastLoginDate = null;
                }
            }
        }
        public DateTime? LastPasswordChangedDate
        {
            get
            {
                if (this._LastPasswordChangedDate == null)
                {
                    return null;
                }
                return this._LastPasswordChangedDate.Value.ToLocalTime();
            }
            set
            {
                _LastPasswordChangedDate = value;
            }
        }
        public string PasswordQuestion
        {
            get
            {
                return this._PasswordQuestion;
            }
            set
            {
                this._PasswordQuestion = value;
            }
        }
        public string ProviderName
        {
            get
            {
                return this._ProviderName;
            }
            set
            {
                _ProviderName = value;
            }
        }

        #region 2011.10.6
        public TProfile Profile
        {
            get;
            set;
        }
        /// <summary>
        /// 用户注册、登陆或修改密码时输入的新密码.
        /// </summary>
        public string InputNewPassword
        {
            get;
            set;
        }
        public string InputOldPassword
        {
            get;
            set;
        }
        /// <summary>
        /// 用户修改密码时输入的对问题的回答.
        /// </summary>
        public string InputNewPasswordAnswer
        {
            get;
            set;
        }
        public string InputNewPasswordQuestion
        {
            get;
            set;
        }
        //public int Login()
        //{
        //   var b= Membership.ValidateUser(this.UserName, this.InputNewPassword);
        //   if (b)
        //   {
        //       return Convert.ToInt32(Membership.GetUser(this.UserName).ProviderUserKey);
        //   }
        //   return -1;
        //}
        public TUser Login()
        {
            var b = Membership.ValidateUser(this.UserName, this.InputNewPassword);
            if (b)
            {
                //return Convert.ToInt32(Membership.GetUser(this.UserName).ProviderUserKey);
                var user = this.DataSelectByUserName(this.UserName);
                user.InputOldPassword = null;
                user.InputNewPassword = null;
                user.InputNewPasswordAnswer = null;
                return user;
            }
            return null;
        }
        public bool ChangePassword()
        {
            return Membership.GetUser(this.Id).ChangePassword(this.InputOldPassword, this.InputNewPassword);
        }
        public TUser DataSelectByUserName(string UserName)
        {
            return this.DataSelect(item => item.UserName == UserName);
        }
        public static TUser SelectByUserName(string UserName)
        {
            return new TUser().DataSelectByUserName(UserName);
        }
        #endregion
        protected override DataAccess<TUser, int> GetProvider()
        {
            return new UserBaseDataAccess<TUser,TProfile>();
            //throw new NotImplementedException();
        }
       
    }
}
