using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Infomation.Core
{
    /// <summary>
    /// 工作经验
    /// </summary>
    [DataContract]
    public class WorkExperience
    {
        [DataMember]
        public string Id
        {
            get;
            set;
        }
        [DataMember]
        public string CompanyName
        {
            get;
            set;
        }
        [DataMember]
        public JobType JobType
        {
            get;
            set;
        }
        /// <summary>
        /// 小职位
        /// </summary>
        [DataMember]
        public byte? ObjectType
        {
            get;
            set;
        }
        /// <summary>
        /// 职位名称
        /// </summary>
        [DataMember]
        public string JobName
        {
            get;
            set;
        }
        /// <summary>
        /// 薪资.
        /// </summary>
        [DataMember]
        public int WageMin
        {
            get;
            set;
        }
        /// <summary>
        /// 薪资.
        /// </summary>
        [DataMember]
        public int WageMax
        {
            get;
            set;
        }
        [DataMember]
        public short StartYear
        {
            get;
            set;
        }
        [DataMember]
        public byte StartMonth
        {
            get;
            set;
        }
        [DataMember]
        public short EndYear
        {
            get;
            set;
        }
        [DataMember]
        public byte EndMonth
        {
            get;
            set;
        }
        /// <summary>
        /// 工作内容
        /// </summary>
        [DataMember]
        public string WorkContent
        {
            get;
            set;
        }
        
        private string _jobTypeName;
        [DataMember]
        public string JobTypeName
        {
            get
            {
                if (_jobTypeName == null)
                {
                    var category = InfoCategory.GetCategory(this.JobType);
                    if (category != null)
                    {
                        _jobTypeName = category.Name;
                    }
                }
                return _jobTypeName;
            }
            private set
            {
                _jobTypeName = value;
            }
        }
        private string _wage;
        [DataMember]
        public string Wage
        {
            get
            {
                if (this.WageMax == 0 && this.WageMin == 0)
                {
                    return "面议";
                }
                if (this.WageMax < this.WageMin)
                {
                    return this.WageMin + "元以上/月";
                }
                return this.WageMin + "-" + this.WageMax + "元/月";
            }
            private set//使能被系列化
            {
                _wage = value;
            }
        }
    }
}
