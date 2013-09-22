using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace Framework.Data.Linq
{
    public class HavingHandler
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
        internal HavingHandler(MethodCallExpression node, DataQueryContext context)
        {
            this.Node = node;
            this.Context = context;
        }

        private string _sql = null;
        public override string ToString()
        {
            if (_sql == null)
            {
                //_sql= //未实现
            }
            return _sql;
        }
    }
}
