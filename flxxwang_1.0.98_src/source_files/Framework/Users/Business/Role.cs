using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Linq.Mapping;
namespace Framework.Users
{
    [Table(Name = "Fr_Roles")]
    public class Role:ModelBase<Role, int>
    {
        [Column(IsPrimaryKey = true)]
        public int Id
        {
            get;
            set;
        }
        public string role
        {
            get;
            set;
        }

        protected override DataAccess<Role, int> GetProvider()
        {
            return new RoleDataAccess();
        }
    }
}
