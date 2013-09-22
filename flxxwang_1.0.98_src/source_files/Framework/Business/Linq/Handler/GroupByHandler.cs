using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace Framework.Data.Linq
{
    public class GroupByHandler : IMethodHandler
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
        internal GroupByHandler(MethodCallExpression node, DataQueryContext context)
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
                var me = lambdaExpression.Body as MemberExpression;
                //_sql = "t" + this.Context.tIndex + "." + me.Member.Name + "";
                _sql = me.Member.Name;
            }
            return _sql;
        }
    }
}
