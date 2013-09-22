using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Framework.Web.Script.Serialization
{
    [Serializable]
    [DataContract]
    public class JsonAnalysis
    {
        [DataMember]
        public string _type//不要用__type,json字符串中如果包含__type,那么在使有DataContractJsonSerializer时只能序列化为__type指定的类型，序列化其他类类型会报错.
        {
            get;
            set;
        }
        /// <summary>
        /// 忽略属性
        /// </summary>
        [DataMember]
        public bool _ignoreP
        {
            get;
            set;
        }
        
    }
}
