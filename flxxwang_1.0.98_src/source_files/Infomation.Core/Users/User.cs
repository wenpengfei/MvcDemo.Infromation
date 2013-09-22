using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Users;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    [Table(Name = "Fr_Users")]
    public class User : UserBase<User, Profile>
    {
        public override User Insert()
        {
            if (User.RecordCount(u => u.UserName == this.UserName) > 0)
            {
                return null;//用户名已存在.
            }
            return base.Insert();
        }
    }
}
