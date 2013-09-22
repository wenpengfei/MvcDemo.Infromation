using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace Framework.Data
{
    public class SavingEventArgs : CancelEventArgs
    {
        public SavingEventArgs(SaveAction action,object data)
        {
            this.Action = action;
            this.Data = data;
        }
        public SaveAction Action
        {
            get;
            internal set;
        }
        public object Data
        {
            get;
            internal set;
        }
    }
    public class SavedEventArgs : EventArgs
    {
        public SavedEventArgs(SaveAction action,object data)
        {
            this.Action = action;
            this.Data = data;
        }
        public SaveAction Action
        {
            get;
            internal set;
        }
        public object Data
        {
            get;
            internal set;
        }
    }
    public enum SaveAction
    {
        None,
        Insert,
        Update,
        Delete
    }
}
