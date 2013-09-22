using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace Framework.Data.Linq
{
    public class AggregateHandler : IMethodHandler
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
        internal AggregateHandler(MethodCallExpression node,DataQueryContext context)
        {
            this.Node = node;
            this.Context = context;
        }
        private string _sql = null;
        public override string ToString()
        {
            if (_sql == null)
            {
                if (Node.Method.Name == "Count")
                {
                    _sql = "count(*)";
                }
                else
                {
                    var methodName = Node.Method.Name;
                    if (methodName == "Average")
                    {
                        methodName = "Avg";
                    }
                    var lambdaExpression = (LambdaExpression)((UnaryExpression)(Node.Arguments[1])).Operand;
                    var me = lambdaExpression.Body as MemberExpression;
                    var memberName = me.Member.Name;
                    var mce = Node.Arguments[0] as MethodCallExpression;
                    lambdaExpression = (LambdaExpression)((UnaryExpression)(mce.Arguments[1])).Operand;
                    if (lambdaExpression.Body.NodeType == ExpressionType.New)//如var query= from obj in Employee where obj.Id>0 select new{A=obj.Id,B=obj.TrueName};var q=query.Sum(item=>item.A);这里new即为这种情况.计算sum时用数据库中Id字段.
                    {
                        var newExp = lambdaExpression.Body as NewExpression;
                        var index = newExp.Members.Select(item => item.Name).ToList().IndexOf(memberName);
                        var fieldMember = newExp.Arguments[index] as MemberExpression;
                        _sql = "" + methodName + "(" + fieldMember.Member.Name + ")";
                    }
                    else
                    {
                        _sql = "" + methodName + "(" + memberName + ")";
                    }
                }
            }
            return _sql;
        }
    }
}
