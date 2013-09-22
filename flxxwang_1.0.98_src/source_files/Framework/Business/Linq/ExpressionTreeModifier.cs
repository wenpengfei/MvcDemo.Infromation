using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace Framework.Data.Linq
{
    //作用:处理select new{}、First、FirstOrDefault等表达式.如from obj in Lovewall.Entities select new{A=obj.Id}
    internal class ExpressionTreeModifier : ExpressionVisitor
    {
        private IQueryable queryable;

        internal ExpressionTreeModifier(IQueryable queryable)
        {
            this.queryable = queryable;
        }

        internal Expression CopyAndModify(Expression expression)
        {
            return this.Visit(expression);
        }
        protected override Expression VisitConstant(ConstantExpression node)
        {
            if (node.Type.Name == "DataQuery`1")
            {
                return Expression.Constant(this.queryable);//把DataQuery<TResult>变为Executor<TResult>.node为DataQuery<TResult>

            }
            return node;
            //return base.VisitConstant(node);//by lls.2012.1.31
        }
        protected override Expression VisitMethodCall(MethodCallExpression node)//by lls
        {
            //Select、First、FirstOrDefault不要移除.Select要处理from obj in ... select new{}这种匿名对象,First、FirstOrDefault要将select top 1 查出来的数据转成一个实体(而不再是一个集合).
            //OrderBy、OrderByDescending、ThenBy、ThenByDescending不用移除,理论上移除不移除均可,但最好不要移除，以确保排序是正确的.
            if (node.Method.Name=="Where"//移除Where.其实移除和不移除应该都是一样的.例如where obj.Id>10,取出来的记录Id都是大于10的,取出来后再执行一下where obj.Id>10结果还是一样的.
                ||node.Method.Name == "Skip"//必须移除Skip
                || node.Method.Name == "Take"//必须移除Take
                || node.Method.Name == "GroupBy"//移除GroupBy,未验证,不会发生这种情况.
                || node.Method.Name == "Count"//移除Count,未验证,不会发生这种情况.
                || node.Method.Name == "Sum"//移除Count,未验证,不会发生这种情况.
                || node.Method.Name == "Min"//移除Count,未验证,不会发生这种情况.
                || node.Method.Name == "Max"//移除Count,未验证,不会发生这种情况.
                || node.Method.Name == "Average"//移除Count,未验证,不会发生这种情况.
                )
            {
                return base.Visit(node.Arguments[0]);
            }
            //if (node.Arguments[0].Type.Name == "DataQuery`1")
            //{
            //    return base.Visit(node.Arguments[0]);
            //}
            return base.VisitMethodCall(node);
        }
    }
}
