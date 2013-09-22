using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Users;
using Framework;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    [Table(Name = "Info_Profile")]
    public class Profile:ProfileBase<Profile>//ModelBase<Profile,int>
    {
        /// <summary>
        /// 信用.
        /// </summary>
        public int? Credit
        {
            get;
            set;
        }
        /// <summary>
        /// 积分.
        /// </summary>
        public int? Point
        {
            get;
            set;
        }
        /// <summary>
        /// 认证.
        /// </summary>
        public string Auth
        {
            get;
            set;
        }
        //注册推广使用
        public int? TId
        {
            get;
            set;
        }
        protected override Framework.Data.DataAccess<Profile, int> GetProvider()
        {
            return new ProfileDataAccess();
        }
    }
}
