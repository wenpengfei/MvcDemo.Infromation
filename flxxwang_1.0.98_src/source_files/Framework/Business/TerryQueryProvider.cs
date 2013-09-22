using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace Framework.Business
{
    public class TerryQueryProvider : IQueryProvider
    {
        public IQueryable<TElement> CreateQuery<TElement>(Expression expression)
        {
            throw new NotImplementedException();
            //return new ModelBase<TElement>(this, expression);
            
        }

        public IQueryable CreateQuery(Expression expression)
        {
            //Type elementType = TypeSystem.GetElementType(expression.Type);
            //try
            //{
            //    return (IQueryable)Activator.CreateInstance(
            //        typeof(ModelBase<>).MakeGenericType(elementType),
            //        new object[] { this, expression });
            //}
            //catch
            //{
            //    throw new Exception();
            //}

            throw new NotImplementedException();

        }

        public TResult Execute<TResult>(Expression expression)
        {
            throw new NotImplementedException();
        }

        public object Execute(Expression expression)
        {
            throw new NotImplementedException();
        }
    }
}
