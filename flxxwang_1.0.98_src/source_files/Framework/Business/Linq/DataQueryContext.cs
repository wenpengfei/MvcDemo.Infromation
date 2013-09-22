using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using System.Diagnostics;
using System.Data;
using System.Collections;
using System.Data.Linq.Mapping;
using System.Reflection;
using Framework.Extensions;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace Framework.Data.Linq
{
    internal class DataQueryContext : ExpressionVisitor
    {
        internal int tIndex = 0;

        private List<IMethodHandler> MethodList =new List<IMethodHandler>();

        private string overOrderby = null;

        private static string ToSql(List<IMethodHandler> methods, int index, string tableName, string primaryKey, string innerSql, DataQueryContext context)
        {
            if (methods.Count == 0)
            {
                return null;
            }

            if (methods[0] is GroupByHandler)
            {
                var tableAlias = "t" + context.tIndex + "";
                context.tIndex++;
                var groupByHandler = methods[0] as GroupByHandler;
                var selectHandler = methods[1] as SelectHandler;
                var lambdaExpression = ((UnaryExpression)selectHandler.Node.Arguments[1]).Operand as LambdaExpression;
                var field = "" + tableAlias + "." + groupByHandler + "";
                context.overOrderby = groupByHandler.ToString();
                if (lambdaExpression.Body is MethodCallExpression)
                {
                    var mce = lambdaExpression.Body as MethodCallExpression;
                    if (mce.Arguments.Count == 2)
                    {
                        var me = (mce.Arguments[1] as LambdaExpression).Body as MemberExpression;
                        field = "" + mce.Method.Name + "(" + tableAlias + "." + me.Member.Name + ") [value]";
                    }
                    else
                    {
                        field = "" + mce.Method.Name + "(*) [value]";//如count
                    }
                    context.overOrderby = "[value]";
                }

                string sql = "select " + field + " from (" + innerSql + ") " + tableAlias + " group by " + tableAlias + "." + groupByHandler + " ";
                return sql;
            }
            if (methods[0] is SkipHandler)
            {
                var skipHandler = methods[0] as SkipHandler;
                TakeHandler takeHandler = null;
                if (methods.Count > 1 && methods[1] is TakeHandler)
                {
                    takeHandler = methods[1] as TakeHandler;

                }
                var tableAlias = "t" + context.tIndex + "";
                context.tIndex++;
                var _orderby = context.overOrderby;
                if (string.IsNullOrEmpty(_orderby)||string.IsNullOrEmpty(_orderby.Trim()))
                {
                    _orderby = primaryKey;
                }
                var innerQuery = innerSql;
                if (string.IsNullOrEmpty(innerQuery)||string.IsNullOrEmpty(innerQuery.Trim()))
                {
                    innerQuery = tableName;
                }
                else
                {
                    innerQuery = "(" + innerSql + ")";
                }
                var sql = "select ROW_NUMBER() Over(order by " + tableAlias + "." + _orderby + ") as RowNumber,* from "+innerQuery+" " + tableAlias + "";
                tableAlias = "t" + context.tIndex + "";
                context.tIndex++;
                sql = "select * from (" + sql + ") " + tableAlias + " where " + tableAlias + ".RowNumber";
                if (skipHandler != null && takeHandler != null)
                {
                    var skip = Convert.ToInt32(skipHandler.ToString());
                    var take = Convert.ToInt32(takeHandler.ToString());
                    int rowNumberStart = skip + 1;
                    int rowNumberEnd = skip + take;
                    sql += " between " + rowNumberStart + " and " + rowNumberEnd + "";
                }
                else if (skipHandler != null && takeHandler == null)
                {
                    var skip = Convert.ToInt32(skipHandler.ToString());
                    int rowNumberStart = skip;
                    sql += "> " + rowNumberStart + "";
                }
                else
                {
                    var take = Convert.ToInt32(takeHandler.ToString());
                    int rowNumberEnd = take + 1;
                    sql += "< " + rowNumberEnd + "";
                }
                return sql;
            }
            if (methods[0] is TakeHandler)
            {
                var takeHandler = methods[0] as TakeHandler;
                var tableAlias = "t" + context.tIndex + "";
                context.tIndex++;
                var _orderby = context.overOrderby;
                if (string.IsNullOrEmpty(_orderby)||string.IsNullOrEmpty(_orderby.Trim()))
                {
                    _orderby = primaryKey;
                }
                var innerQuery = innerSql;
                if (string.IsNullOrEmpty(innerQuery)||string.IsNullOrEmpty(innerQuery.Trim()))
                {
                    innerQuery = tableName;
                }
                else
                {
                    innerQuery = "("+innerSql+")";
                }
                var sql = "select ROW_NUMBER() Over(order by " + _orderby + ") as RowNumber,* from "+innerQuery+" " + tableAlias + "";
                tableAlias = "t" + context.tIndex + "";
                context.tIndex++;
                sql = "select * from (" + sql + ") " + tableAlias + " where " + tableAlias + ".RowNumber";
                var take = Convert.ToInt32(takeHandler.ToString());
                int rowNumberEnd = take + 1;
                sql += "< " + rowNumberEnd + "";
                return sql;
            }

            var where = string.Empty;
            //where
            //context.WhereList.Reverse();
            var whereList = methods.Where(node => node is WhereHandler);
            if (whereList.Count() > 0)
            {
                for (var i = 0; i < whereList.Count(); i++)
                {
                    if (i > 0)
                    {
                        where += " and";
                    }
                    where += " " + whereList.ElementAt(i);
                }
            }

            var firstHandler = methods.FirstOrDefault(node => node is FirstHandler);
            
            if (firstHandler != null)
            {
                var _first = firstHandler as FirstHandler;
                if (!string.IsNullOrWhiteSpace(_first.Where))//如Lovewall.Entities.FirstOrDefault(item=>item.Id==100);
                {
                    if (!string.IsNullOrWhiteSpace(where))
                    {
                        where += " and";
                    }
                    where += " " + _first.Where;
                }
            }

            //order by
            var orderby = string.Empty;
            //调整Order顺序(将多个OrderBy之间倒序.OrderBy与ThenBy间顺序保持不变),如:
            //"orderby A descending,B orderby C"调整后sql变为"order by C asc,A desc,B asc"
            var orderbyList = methods.Where(node => node is OrderByHandler||node is ThenByHandler).ToList();
            List<List<IMethodHandler>> orderByArray = new List<List<IMethodHandler>>();
            List<IMethodHandler> orderGroup = null;
            for (var i=0;i<orderbyList.Count;i++)
            {
                var order = orderbyList[i];
                if (order is OrderByHandler)
                {
                    orderGroup = new List<IMethodHandler>();
                    orderGroup.Add(order);
                    if (i == orderbyList.Count - 1)
                    {
                        orderByArray.Add(orderGroup);
                    }
                }
                else if (order is ThenByHandler)
                {
                    orderGroup.Add(order);
                    orderByArray.Add(orderGroup);
                }
            }
            orderByArray.Reverse();

            foreach (var array in orderByArray)
            {
                foreach (var order in array)
                {
                    orderby += ","+order+"";
                }
            }
            if (!string.IsNullOrWhiteSpace(orderby))
            {
                orderby = orderby.Substring(1);
            }

            //if (orderbyList.Count() > 0)
            //{
            //    for (var i = 0; i < orderbyList.Count(); i++)
            //    {
            //        orderby += orderbyList.ElementAt(i);
            //        if (i < orderbyList.Count() - 1)
            //        {
            //            orderby += ",";
            //        }
            //    }
            //}

            if (!string.IsNullOrWhiteSpace(orderby))
            {
                context.overOrderby = orderby;
            }

            var having = string.Empty;
            var havingList = methods.Where(node => node is HavingHandler);
            if (havingList.Count() > 0)
            {//未实现

            }

            var sqlQuery = string.Empty;
            //var _fields = "*";
            var _fields = "top 100 percent *"; //如:var query = from obj in Lovewall.Entities orderby obj.Id descending select new { A = obj.Id, B = obj.Content, C = obj.DateCreated };var q=query.Count();//执行Count()出现嵌套查询，所以用top 100 percent *,否则出错
            if (string.IsNullOrWhiteSpace(context.overOrderby))//context.overOrderby未设置过,说明是嵌套查询中的最底层.
            {
                context.overOrderby = primaryKey;//按照系统的Linq to Sql是表中全部字段,如select ROW_NUMBER() Over(order by t0.Id,t0.Content) as RowNumber,这里只用主键排序就够了.
            }
            var aggregateHandler = methods.FirstOrDefault(node => node is AggregateHandler);
            //var firstHandler = methods.FirstOrDefault(node => node is FirstHandler);
            if (aggregateHandler != null)
            {
                _fields = "" + aggregateHandler.ToString() + " as [value]";
                context.overOrderby = "[value]";
            }
            else if (firstHandler != null)
            {
                _fields = firstHandler.ToString();
                context.overOrderby = null;//取firstHandler,返回值是一个实体,不可能是一个集合,所以不可能再查询了.
            }

            var _tableAlias = "t" + context.tIndex + "";
            context.tIndex++;

            _fields = _fields.ToLower();
            sqlQuery = "select ";
            sqlQuery += _fields;
            sqlQuery += " from ";
            var _from = tableName;
            if (index > 0 && !string.IsNullOrWhiteSpace(innerSql))
            {
                _from = "(" + innerSql + ")";
            }
            sqlQuery += "" + _from + " " + _tableAlias + "";
            if (!string.IsNullOrWhiteSpace(where))
            {
                sqlQuery += " where " + where + "";
            }
            if (!_fields.StartsWith("count(") && !_fields.StartsWith("min(") && !_fields.StartsWith("max(") && !_fields.StartsWith("sum(") && !_fields.StartsWith("avg("))
            {
                if (!string.IsNullOrWhiteSpace(orderby))
                {
                    sqlQuery += " order by " + _tableAlias + "." + orderby + "";
                }
            }
            return sqlQuery;
        }

        private static string ExecuteMethod(List<List<IMethodHandler>> array, int index, string tableName, string primaryKey, DataQueryContext context)
        {
            string sqlQuery = null;
            for (var i = 0; i < array.Count; i++)
            {
                sqlQuery= ToSql(array[i], i, tableName, primaryKey, sqlQuery,context);
            }
            return sqlQuery;
        }

        internal static object Execute<TResult>(Expression expression)
        {
            bool isEnumerable = (typeof(TResult).Name == "IEnumerable`1");
            var returnType = typeof(TResult);

            if (!(expression is MethodCallExpression))
                throw new InvalidProgramException("No query over the data source was specified.");
            DataQueryContext context = new DataQueryContext();
            context.Translate(expression);

            var modelType = GetModelType(expression);
            var tableName = GetTableName(modelType);
            PropertyInfo primaryProperty = modelType.GetProperties().FirstOrDefault((property) =>
                {
                    var attributes = (ColumnAttribute[])property.GetCustomAttributes(typeof(ColumnAttribute), false);
                    var attrPrimary = attributes.FirstOrDefault(attr => attr.IsPrimaryKey);
                    return attrPrimary != null;
                });
            var primaryKey = primaryProperty.Name;
            

            context.MethodList.Reverse();
            var array = new List<List<IMethodHandler>>();

            var _list = new List<IMethodHandler>();
            for (var i = 0; i < context.MethodList.Count; i++)
            {
                var node = context.MethodList[i];
                if (node is GroupByHandler)//GroupByHandler后面必然是SelectHandler,所以在SelectHandler时添加.
                {
                    continue;
                }
                if (node is SkipHandler)
                {
                    if (_list.Count > 0)
                    {
                        array.Add(_list);
                    }
                    _list = new List<IMethodHandler>();
                    _list.Add(node);
                    if (!(i < context.MethodList.Count - 1 && (context.MethodList[i + 1] is TakeHandler)))
                    {
                        array.Add(_list);
                        _list = new List<IMethodHandler>();
                    }
                }
                else if (node is TakeHandler)
                {
                    var lastNode = _list.LastOrDefault();
                    if (lastNode != null && (lastNode is SkipHandler))
                    {
                        _list.Add(node);
                        array.Add(_list);
                        _list = new List<IMethodHandler>();
                    }
                    else
                    {
                        if (_list.Count > 0)
                        {
                            array.Add(_list);
                        }
                        _list = new List<IMethodHandler>();
                        _list.Add(node);
                        array.Add(_list);
                        _list = new List<IMethodHandler>();

                    }
                }
                else if (node is SelectHandler)
                {
                    var mce = node.Node.Arguments[0] as MethodCallExpression;
                    if (mce != null && mce.Method.Name == "GroupBy")
                    {
                        //如:
                        //group obj by obj.Content into g select g.Min(item=>item.Id);
                        //group obj by obj.Content into g select g;
                        if (_list.Count > 0)
                        {
                            array.Add(_list);
                        }
                        _list = new List<IMethodHandler>();
                        _list.Add(new GroupByHandler(mce, context));
                        _list.Add(node);
                        array.Add(_list);
                        _list = new List<IMethodHandler>();
                    }
                    else
                    {
                        if (_list.Count > 0)
                        {
                            array.Add(_list);
                        }
                        _list = new List<IMethodHandler>();
                    }
                }
                else
                {
                    _list.Add(node);
                    if (i == context.MethodList.Count - 1)
                    {
                        array.Add(_list);
                    }
                }
            }

            var sqlQuery = string.Empty;
            if (array.Count == 0)
            {
                sqlQuery = "select * from " + tableName + "";
            }
            else
            {
                sqlQuery = ExecuteMethod(array, 0, tableName, primaryKey, context);
            }

            Database db = null;
            var customAttributes = modelType.GetCustomAttributes(typeof(System.Data.Linq.Mapping.DatabaseAttribute), false);
            if (customAttributes.Length > 0)
            {
                var dbName = (customAttributes[0] as System.Data.Linq.Mapping.DatabaseAttribute).Name;
                if (!string.IsNullOrWhiteSpace(dbName))
                {
                    db = DatabaseFactory.CreateDatabase(dbName);
                }
            }
            if (db == null)
            {
                db = DatabaseManager.CreateDatabase();
            }

            var ds = db.ExecuteDataSet(CommandType.Text, sqlQuery);
            var dt = ds.Tables[0];
            //if (dt.Rows.Count == 1 && dt.Columns.Count == 1)//聚合查询,如Count(*)

            var colIndex = 0;
            if (dt.Columns[0].ColumnName.ToLower() == "rownumber")//groupby...skip...take
            {
                colIndex = 1;
            }

            if (returnType.IsValueType || returnType == typeof(string))//聚合查询,如Count(*)
            {
                return dt.Rows[0][colIndex];
            }
            //returnType可能是匿名对象,如select new{},然后FirstOrDefault,对于匿名对象,returnType.GetGenericArguments()数量等于匿名对象的属性个数.

            //if (returnType == modelType)//如First、FirstOrDefault只查询第一条,结果是一个实体,不是集合.
            //{
            //    return dt.ToEntities<TResult>().FirstOrDefault();
            //}
            //if (!isEnumerable)//如First、FirstOrDefault只查询第一条,结果是一个实体,不是集合.
            //{

            //}
            //var executor = Activator.CreateInstance(typeof(Executor<>).MakeGenericType(modelType), dt);//executor是IEnumerable<TModel>
            Type genericType = null;
            if (isEnumerable)
            {
                //var genericTypeArray = returnType.GetGenericArguments();
                //if (genericTypeArray.Length > 0)
                //{
                //    genericType = genericTypeArray[0];
                //}
                genericType = returnType.GetGenericArguments()[0];
            }
            else//如First、FirstOrDefault只查询第一条,结果是一个实体,不是集合.
            {
                genericType = returnType;
            }
            if (genericType.Name.StartsWith("<>") && genericType.Name.Contains("AnonymousType"))//匿名类型.如select new{A=obj.Id}
            {
                genericType = modelType;//DataTable要转成modelType的集合,没办法转成匿名类型的集合.
            }
            var executor = Activator.CreateInstance(typeof(Executor<>).MakeGenericType(genericType), dt);//executor是IEnumerable<TResult>
            if (genericType.IsValueType 
                || genericType == typeof(string)
                || genericType.Name == "IGrouping`2")
            {
                return executor;
            }
            //对executor(已从数据库中取出的数据)进一步处理,如实现new{}运算、实现排序等,如from obj in Employee.Enities where obj.Id>0 select new{A=obj.Id,B=obj.TrueName}
            var enumerator = executor as IEnumerable;
            var q = enumerator.AsQueryable();
            ExpressionTreeModifier treeCopier = new ExpressionTreeModifier(q);
            Expression newExpressionTree = treeCopier.CopyAndModify(expression);
            if (isEnumerable)
            {
                return q.Provider.CreateQuery(newExpressionTree);
            }
            else
            {
                return q.Provider.Execute(newExpressionTree);//如First、FirstOrDefault
            }
        }

        private static Type GetModelType(Expression expression)
        {
            if (expression.Type.Name == "DataQuery`1")
            {
                return expression.Type.GetGenericArguments()[0];
            }
            var me = expression as MethodCallExpression;
            return GetModelType(me.Arguments[0]);
        }

        public void Translate(Expression expression)
        {
            if (expression.NodeType == ExpressionType.Constant &&
                (expression as ConstantExpression).Type != typeof(object))
            {
                return;
            }

            this.Visit(Evaluator.PartialEval(expression));
        }

        protected override Expression VisitMethodCall(MethodCallExpression node)
        {
            if (node.Method.DeclaringType == typeof(Queryable))
            {
                switch (node.Method.Name)
                {
                    case "Select":
                        this.MethodList.Add(new SelectHandler(node,this));
                        this.Visit(node.Arguments[0]);
                        break;
                    case "GroupBy":
                        this.MethodList.Add(new GroupByHandler(node,this));
                        this.Visit(node.Arguments[0]);
                        break;
                    case "Join":
                        break;
                    case "SelectMany":
                        break;
                    case "Where":
                        this.MethodList.Add(new WhereHandler(node,this));
                        this.Visit(node.Arguments[0]);
                        break;
                    case "OrderBy":
                    case "OrderByDescending":
                        this.MethodList.Add(new OrderByHandler(node, this));
                        this.Visit(node.Arguments[0]);
                        break;
                    case "ThenBy":
                    case "ThenByDescending":
                        this.MethodList.Add(new ThenByHandler(node,this));
                        this.Visit(node.Arguments[0]);
                        break;
                    case "Count":
                        this.MethodList.Add(new AggregateHandler(node,this));
                        this.Visit(node.Arguments[0]);
                        break;
                    case "Sum":
                    case "Min":
                    case "Max":
                    case "Average":
                        this.MethodList.Add(new AggregateHandler(node,this));
                        this.Visit(node.Arguments[0]);
                        break;
                    case "Skip":
                        this.MethodList.Add(new SkipHandler(node,this));
                        this.Visit(node.Arguments[0]);
                        break;
                    case "Take":
                        this.MethodList.Add(new TakeHandler(node,this));
                        this.Visit(node.Arguments[0]);
                        break;
                    case "Any":
                    case "All":
                    case "Contains":
                        //暂时不处理,查询出来后exector执行ExpressionTreeModifier处理掉.(未验证)
                        //对应SQL:EXISTS
                        this.Visit(node.Arguments[0]);
                        break;
                    case "Distinct":
                        //暂时不处理,查询出来后exector执行ExpressionTreeModifier处理掉.(未验证)
                        //对应SQL:DISTINCT
                        this.Visit(node.Arguments[0]);
                        break;
                    case "First":
                    case "FirstOrDefault":
                        this.MethodList.Add(new FirstHandler(node,this));
                        this.Visit(node.Arguments[0]);
                        break;
                    default:
                        this.Visit(node.Arguments[0]);
                        break;
                }
            }
            else
            {

                throw new NotSupportedException(string.Format("The method '{0}' is not supported", node.Method.Name));
            }

            return node;
        }

        private static string GetTableName(Type tableType)
        {
            return ((System.Data.Linq.Mapping.TableAttribute)
                      tableType.GetCustomAttributes(typeof(System.Data.Linq.Mapping.TableAttribute), false)[0]).Name;
        }
    }
}
