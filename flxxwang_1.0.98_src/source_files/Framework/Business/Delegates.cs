using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Framework.Data
{
    //class Delegates
    //{
    //}
    //定义委托时要注意，不要定义多个委托名不同而参数相同的托，这是因为如果参数相同，此时若主程序不同的方法分别使用了这种参数相同而委托名不同的委托，
    //则客户程序使程序中调用主程序中具有多个方法名相同的函数时，由于主程序中的函名相同，委托名不同，客户程序用delegate时编译器就不没法知道该调用主程序中的哪个函数，
    //此时编译就通不过了。

    //如果硬要这样做，就得避免主程序的函数名相同
    //public delegate string SelectPrimaryKeys(int PageSize, int PageIndex);
    //public delegate string QueryCondition<T>(T obj);
    //public delegate string GenerateSqlForSelectCurrentPage<T>(int PageSize, int PageIndex, T obj);
    //public delegate string GenerateSql();
    //public delegate string QueryExtPropertiesCondition();
}
