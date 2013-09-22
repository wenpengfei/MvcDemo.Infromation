using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace Framework.Data.Linq
{
    public class FirstHandler : IMethodHandler
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

        private string _where;
        public string Where
        {
            get
            {
                if (_where == null)
                {
                    if (this.Node.Arguments.Count>1)
                    {
                        var lambdaExpression = (LambdaExpression)((UnaryExpression)(Node.Arguments[1])).Operand;
                        _where= lambdaExpression.ToWhere("t" + this.Context.tIndex);
                    }
                }
                return _where;
            }
        }
        internal FirstHandler(MethodCallExpression node, DataQueryContext context)
        {
            this.Node = node;
            this.Context = context;
        }

        private string _sql = null;
        public override string ToString()
        {
            if (_sql == null)
            {
                _sql = "top 1 *";
            }
            return _sql;
        }
    }
}
