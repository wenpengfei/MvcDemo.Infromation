using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public class YellowPageCategory:InfoCategory
    {
        public byte Id
        {
            get;
            set;
        }
        public YellowPageBigType BigType
        {
            get;
            set;
        }
        public YellowPageType YellowPageType
        {
            get
            {
                return (YellowPageType)Id;
            }
        }
    }
}
