using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework;
using Framework.Data;
using System.Data.Linq.Mapping;
using Infomation.Core.Data;

namespace Infomation.Core
{
    [Table(Name = "Info_Stat_Click")]
    public class StatClick:ModelBase<StatClick,int>
    {
        [Column(IsPrimaryKey = true)]
        public int Id
        {
            get;
            set;
        }
        public string Url
        {
            get;
            set;
        }
        public string Text
        {
            get;
            set;
        }
        public string IP
        {
            get;
            set;
        }
        public string Address
        {
            get;
            set;
        }
        public DateTime DateCreated
        {
            get;
            set;
        }
        protected override DataAccess<StatClick, int> GetProvider()
        {
            return new StatClickDataAccess();
        }
    }
}
