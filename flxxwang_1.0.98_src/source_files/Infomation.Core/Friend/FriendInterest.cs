using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 兴趣交友.
    /// </summary>
    [Table(Name = "Info_FriendInterest")]
    public class FriendInterest:FriendBase<FriendInterest>
    {
        public string Interest
        {
            get;
            set;
        }
        public bool? Sex
        {
            get;
            set;
        }
        public byte? Age
        {
            get;
            set;
        }
        /// <summary>
        /// QQ或MSN
        /// </summary>
        public string QQOrMSN
        {
            get;
            set;
        }

        public string Title
        {
            get
            {
                return this.Interest;
            }
        }

        public string SexName
        {
            get
            {
                if (this.Sex == true)
                {
                    return "男";
                }
                else if (this.Sex == false)
                {
                    return "女";
                }
                return null;
            }
        }

        #region InfoBase 重写成员.
        #endregion
        protected override DataAccess<FriendInterest, int> GetProvider()
        {
            return new FriendInterestDataAccess();
        }
    }
}
