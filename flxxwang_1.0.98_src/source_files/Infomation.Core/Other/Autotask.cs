using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using Framework;
using Framework.Data;
using Infomation.Core.Data;

namespace Infomation.Core
{
    [Database(Name="FrameworkWest")]
    [Table(Name="Info_Autotask")]
    public class Autotask:ModelBase<Autotask,int>
    {
        [Column(IsPrimaryKey=true)]
        public int Id
        {
            get;
            set;
        }
        public Action Action
        {
            get;
            set;
        }
        public State State
        {
            get;
            set;
        }
        public string Content
        {
            get;
            set;
        }
        public DateTime DealStart
        {
            get;
            set;
        }
        public DateTime DateCreated
        {
            get;
            set;
        }
        protected override DataAccess<Autotask, int> GetProvider()
        {
           return new AutotaskDataAccess();
        }
    }
}
