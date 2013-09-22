using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Framework.Seo
{
    public enum SearchEngine
    {
        /// <summary>
        /// 不是搜索引擎.
        /// </summary>
        None=0,
        /// <summary>
        /// 是搜索引擎，但不确定是哪个搜索引擎.
        /// </summary>
        //Unknown=1,
        Baidu=2,
        Google=3,
        Sogou=4,
        Soso=5,
        Jike=6,
        Bing=7
        //YanDex=8,
        //Yodao=9,
        //Easou=10,
        //Ahrefs=11,
        //Career=12,
        //Ezooms=13,
        //Msn=14
    }
}
