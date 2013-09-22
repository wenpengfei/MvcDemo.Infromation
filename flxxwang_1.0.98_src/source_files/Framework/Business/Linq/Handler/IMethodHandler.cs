using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace Framework.Data.Linq
{
    public interface IMethodHandler
    {
        MethodCallExpression Node
        {
            get;
            set;
        }
    }
}
