using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public class EducationBase<TYPE> : InfoBase<TYPE>,IEducation
        where TYPE : EducationBase<TYPE>, new()
    {
        public string Title
        {
            get;
            set;
        }
        public override string TitleDisplay
        {
            get { return this.Title; }
        }
        /// <summary>
        /// 补充说明.
        /// </summary>
        public string Content
        {
            get;
            set;
        }
        /// <summary>
        /// 其他电话.
        /// </summary>
        public string Phone2
        {
            get;
            set;
        }
        /// <summary>
        /// 信息来源
        /// </summary>
        public long? Source
        {
            get;
            set;
        }

        #region InfoBase 重写成员.
        
        #endregion
    }
}
