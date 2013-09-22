using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace Framework.Data.Linq
{
    public class WhereHandler : IMethodHandler
    {
        public MethodCallExpression Node
        {
            get;
            set;
        }
        private DataQueryContext Context
        {
            get;
            set;
        }
        internal WhereHandler(MethodCallExpression node, DataQueryContext context)
        {
            this.Node = node;
            this.Context = context;
        }

        private string _sql = null;
        public override string ToString()
        {
            if (_sql == null)
            {
                var lambdaExpression = (LambdaExpression)((UnaryExpression)(Node.Arguments[1])).Operand;
                _sql = lambdaExpression.ToWhere("t"+this.Context.tIndex);
            }
            return _sql;
        }
    }
}
