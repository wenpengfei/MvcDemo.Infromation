using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Framework.Data
{
    public class QueriedEventArgs : EventArgs
    {
        public QueriedEventArgs(object data)
        {
            this.Data = data;
        }
        public object Data
        {
            get;
            internal set;
        }
    }
}
