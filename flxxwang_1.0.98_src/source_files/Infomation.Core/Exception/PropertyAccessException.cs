using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public class PropertyAccessException:Exception
    {
        public PropertyAccessException()
        {
        }
        public override string Message
        {
            get
            {
                return "该属性不可访问";
            }
        }
    }
}
