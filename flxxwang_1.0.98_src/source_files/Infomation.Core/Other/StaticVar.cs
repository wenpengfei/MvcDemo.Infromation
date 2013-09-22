using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public class StaticVar
    {
        public static List<IInfo> RecentInfos = new List<IInfo>();

        public static List<Dictionary<string, object>> RecentCatchInfos = new List<Dictionary<string, object>>();
    }
}
