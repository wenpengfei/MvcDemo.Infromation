using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 黄页中的翻译.
    /// </summary>
    [Table(Name = "Info_YellowTranslate")]
    public class YellowTranslate:InfoBase<YellowTranslate>,IYellowPage
    {
        public string Title
        {
            get;
            set;
        }
        public override string TitleDisplay
        {
            get 
            { 
                return this.Title; 
            }
        }
        public byte ObjectType1
        {
            get;
            set;
        }
        public byte? ObjectType2
        {
            get;
            set;
        }
        public byte? ObjectType3
        {
            get;
            set;
        }
        public byte? ObjectType4
        {
            get;
            set;
        }
        public byte? ObjectType5
        {
            get;
            set;
        }

        public byte Tag1
        {
            get;
            set;
        }
        public byte? Tag2
        {
            get;
            set;
        }
        public byte? Tag3
        {
            get;
            set;
        }
        public byte? Tag4
        {
            get;
            set;
        }
        public byte? Tag5
        {
            get;
            set;
        }
        public byte? Tag6
        {
            get;
            set;
        }
        /// <summary>
        /// 营业时间.
        /// </summary>
        public string BusTime
        {
            get;
            set;
        }
        public string Address
        {
            get;
            set;
        }
        /// <summary>
        /// 公交.
        /// </summary>
        public string Bus
        {
            get;
            set;
        }
        /// <summary>
        /// 补充说明.
        /// </summary>
        public string Content
        {
            get;
            set;
        }
        public string QQOrMSN
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
        protected override DataAccess<YellowTranslate, int> GetProvider()
        {
            return new YellowTranslateDataAccess();
        }
    }
}
