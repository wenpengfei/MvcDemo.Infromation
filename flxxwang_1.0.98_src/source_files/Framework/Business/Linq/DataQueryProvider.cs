using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using System.Reflection;
using System.Data.Common;

namespace Framework.Data.Linq
{
    public class DataQueryProvider : IQueryProvider
    {
        public IQueryable CreateQuery(Expression expression)
        {
            Type elementType = TypeSystem.GetElementType(expression.Type);
            try
            {
                return (IQueryable)Activator.CreateInstance(typeof(DataQuery<>).MakeGenericType(elementType), new object[] { this, expression });
            }
            catch (System.Reflection.TargetInvocationException tie)
            {
                throw tie.InnerException;
            }
        }

        // Queryable's collection-returning standard query operators call this method.
        public IQueryable<TResult> CreateQuery<TResult>(Expression expression)
        {
            return new DataQuery<TResult>(this, expression);
        }

        public object Execute(Expression expression)
        {
            //return DataQueryContext.Execute(expression,false);
            return DataQueryContext.Execute<object>(expression);
        }

        // Queryable's "single value" standard query operators call this method.
        // It is also called from QueryableTerraServerData.GetEnumerator().
        public TResult Execute<TResult>(Expression expression)
        {
            //bool IsEnumerable = (typeof(TResult).Name == "IEnumerable`1");

            var obj = DataQueryContext.Execute<TResult>(expression);
            var resultType = typeof(TResult);
            
            if (resultType.IsValueType || resultType==typeof(string))
            {
                return DataConvert.Convert<TResult>(obj);//例如求平均数,TResult可能是double,而实际得到的结果为int,int不能直接强制转换为double.
            }
            return (TResult)obj;
        }

        
    }
}
