using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
namespace Framework.Users
{
    public class RoleDataAccess : DataAccess<Role, int>
    {
        public override List<Role> Insert(List<Role> instances)
        {
            throw new NotImplementedException();
        }
    }
}
