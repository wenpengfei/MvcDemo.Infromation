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
    /// 技能交换.
    /// </summary>
    [Table(Name = "Info_FriendSkill")]
    public class FriendSkill:FriendBase<FriendSkill>
    {
        public string Title
        {
            get;
            set;
        }
        public bool Sex
        {
            get;
            set;
        }
        public byte Age
        {
            get;
            set;
        }
        public string MySkill
        {
            get;
            set;
        }
        public string WantSkill
        {
            get;
            set;
        }
        public bool IsBiz
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
        #region InfoBase 重写成员.
        #endregion
        protected override DataAccess<FriendSkill, int> GetProvider()
        {
            return new FriendSkillDataAccess();
        }
    }
}
