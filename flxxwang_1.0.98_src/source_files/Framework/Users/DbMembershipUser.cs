using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;

namespace Framework.Users
{
    public class DbMembershipUser : System.Web.Security.MembershipUser
    {
        // Fields
        private string _Comment;
        private DateTime _CreationDate;
        private string _Email;
        private bool _IsApproved;
        private bool _IsLockedOut;
        private DateTime _LastActivityDate;
        private DateTime _LastLockoutDate;
        private DateTime _LastLoginDate;
        private DateTime _LastPasswordChangedDate;
        private string _PasswordQuestion;
        private string _ProviderName;
        private object _ProviderUserKey;
        private string _UserName;


        public override string Comment
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
        public override DateTime CreationDate
        {
            get
            {
                return this._CreationDate.ToLocalTime();
            }
        }
        public override string Email
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
        public override bool IsApproved
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
        public override bool IsLockedOut
        {
            get
            {
                return this._IsLockedOut;
            }
        }
        public new bool IsOnline
        {
            get
            {
                TimeSpan span = new TimeSpan(0, Membership.UserIsOnlineTimeWindow, 0);
                DateTime time = DateTime.UtcNow.Subtract(span);
                return (this.LastActivityDate.ToUniversalTime() > time);
            }
        }
        public override DateTime LastActivityDate
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
        public override DateTime LastLockoutDate
        {
            get
            {
                return this._LastLockoutDate.ToLocalTime();
            }
        }
        public override DateTime LastLoginDate
        {
            get
            {
                return this._LastLoginDate.ToLocalTime();
            }
            set
            {
                this._LastLoginDate = value.ToUniversalTime();
            }
        }
        public override DateTime LastPasswordChangedDate
        {
            get
            {
                return this._LastPasswordChangedDate.ToLocalTime();
            }
        }
        public new virtual string PasswordQuestion
        {
            get
            {
                return this._PasswordQuestion;
            }
        }
        public override string ProviderName
        {
            get
            {
                return this._ProviderName;
            }
        }
        public override object ProviderUserKey
        {
            get
            {
                return this._ProviderUserKey;
            }
        }
        public override string UserName
        {
            get
            {
                return this._UserName;
            }
        }



        public DbMembershipUser(string providerName, string name, object providerUserKey, string email, string passwordQuestion, string comment, bool isApproved, bool isLockedOut, DateTime creationDate, DateTime lastLoginDate, DateTime lastActivityDate, DateTime lastPasswordChangedDate, DateTime lastLockoutDate)
        {
            if ((providerName == null) || (Membership.Providers[providerName] == null))
            {
                throw new ArgumentException("Membership_provider_name_invalid", "providerName");
            }
            if (name != null)
            {
                name = name.Trim();
            }
            if (email != null)
            {
                email = email.Trim();
            }
            if (passwordQuestion != null)
            {
                passwordQuestion = passwordQuestion.Trim();
            }
            this._ProviderName = providerName;
            this._UserName = name;
            this._ProviderUserKey = providerUserKey;
            this._Email = email;
            this._PasswordQuestion = passwordQuestion;
            this._Comment = comment;
            this._IsApproved = isApproved;
            this._IsLockedOut = isLockedOut;
            this._CreationDate = creationDate.ToUniversalTime();
            this._LastLoginDate = lastLoginDate.ToUniversalTime();
            this._LastActivityDate = lastActivityDate.ToUniversalTime();
            this._LastPasswordChangedDate = lastPasswordChangedDate.ToUniversalTime();
            this._LastLockoutDate = lastLockoutDate.ToUniversalTime();
        }
        public override string GetPassword()
        {
            //return base.GetPassword();
            return Membership.Providers[this._ProviderName].GetPassword(UserName, null);
        }
        public override bool ChangePassword(string oldPassword, string newPassword)
        {
            if (!Membership.Providers[this._ProviderName].ChangePassword(this._UserName, oldPassword, newPassword))
            {
                return false;
            }
            return true;
        }
        public override bool ChangePasswordQuestionAndAnswer(string password, string newPasswordQuestion, string newPasswordAnswer)
        {
            throw new NotImplementedException();
            //return base.ChangePasswordQuestionAndAnswer(password, newPasswordQuestion, newPasswordAnswer);
        }

    }
}
