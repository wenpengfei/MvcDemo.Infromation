using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace Framework
{
    public class Ordered<TModel, KEY>//KEY即为排序字段的类型
    {
        internal string OrderBySql
        {
            get;
            set;
        }
        public Ordered<TModel, Key> OrderBy<Key>(Expression<Func<TModel, Key>> keySelector)
        {
            var me = keySelector.Body as MemberExpression;
            if (me != null && me.NodeType == ExpressionType.MemberAccess)
            {
                var orderBy = new Ordered<TModel, Key>();
                orderBy.OrderBySql = this.OrderBySql + "," + me.Member.Name + " asc";
                return orderBy;
            }
            throw new Exception("排序表达式错误");
        }

        public Ordered<TModel, Key> OrderByDescending<Key>(Expression<Func<TModel, Key>> keySelector)
        {
            var me = keySelector.Body as MemberExpression;
            if (me != null && me.NodeType == ExpressionType.MemberAccess)
            {
                var orderBy = new Ordered<TModel, Key>();
                orderBy.OrderBySql = this.OrderBySql + "," + me.Member.Name + " desc";
                return orderBy;
            }
            throw new Exception("排序表达式错误");
        }
        public override string ToString()
        {
            return this.OrderBySql;
        }
    }
}
