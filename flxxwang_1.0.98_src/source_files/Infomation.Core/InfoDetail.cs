using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public class InfoDetail
    {
        public string Title
        {
            get;
            set;
        }
        public string Content
        {
            get;
            set;
        }
        public int Price
        {
            get;
            set;
        }
        public int? Quality
        {
            get;
            set;
        }

        public ObjectType ObjectType
        {
            get;
            set;
        }
        public string Phone
        {
            get;
            set;
        }
        public string District
        {
            get;
            set;
        }
        
        public List<string> PictureList
        {
            get;
            set;
        }
    }
}
