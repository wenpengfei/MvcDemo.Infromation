using System;
using System.Net;
using System.Collections.Generic;

using System.Linq;
using System.Linq.Expressions;
namespace Framework.Linq
{
    public static class MyEnumerableExtensions
    {
        public static IEnumerable<GroupResult> GroupByMany<TElement>(
            this IEnumerable<TElement> elements,
            params Func<TElement, object>[] groupSelectors)
        {   //使用方法:
            //var result = customers.GroupByMany(c => c.Country, c => c.City);
            if (groupSelectors.Length > 0)
            {
                var selector = groupSelectors.First();
                
                //reduce the list recursively until zero
                var nextSelectors = groupSelectors.Skip(1).ToArray();
                
                return
                    elements.GroupBy(selector).Select(
                        g => new GroupResult
                        {
                            Key = g.Key,
                            Count = g.Count(),
                            Items = g,
                            SubGroups = g.GroupByMany(nextSelectors)
                        });
            }
            else
                return null;
        }

    }
}
