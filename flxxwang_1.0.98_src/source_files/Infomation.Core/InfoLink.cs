using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public class InfoLinkXX
    {
        public string Text
        {
            get;
            set;
        }
        public string Url
        {
            get;
            set;
        }
        public string ToolTip
        {
            get;
            set;
        }
        private string _target = "_blank";
        public string Target
        {
            get
            {
                return _target;
            }
            set
            {
                _target = value;
            }
        }
    }
}
