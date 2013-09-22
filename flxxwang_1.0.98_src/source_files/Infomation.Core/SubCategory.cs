using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public class SubCategory
    {
        public int Id
        {
            get;
            set;
        }
        public int ParentId
        {
            get;
            set;
        }
        public string Name
        {
            get;
            set;
        }
        
    }
}
