using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;

namespace Framework
{
    [Table(Name = "Fr_Log")]
    public class Log:ModelBase<Log,int>
    {
        [Column(IsPrimaryKey = true)]
        public int Id
        {
            get;
            set;
        }
        public LogType Type
        {
            get;
            set;
        }
        public string Message
        {
            get;
            set;
        }
        public string StackTrace
        {
            get;
            set;
        }
        public string Url
        {
            get;
            set;
        }
        public DateTime DateCreated
        {
            get;
            set;
        }
        protected override Data.DataAccess<Log, int> GetProvider()
        {
            return new LogDataAccess();
        }
    }
}
