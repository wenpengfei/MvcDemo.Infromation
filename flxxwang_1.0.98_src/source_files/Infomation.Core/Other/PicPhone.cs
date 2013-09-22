using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq.Mapping;
using Framework;
using Infomation.Core.Data;

namespace Infomation.Core
{
    /// <summary>
    /// 图片与电话号码的映射.
    /// </summary>
    [Table(Name = "Info_PicPhone")]
    public class PicPhone : ModelBase<PicPhone, int>
    {
        [Column(IsPrimaryKey = true)]
        public int Id
        {
            get;
            set;
        }
        public string Pic
        {
            get;
            set;
        }
        public string Phone
        {
            get;
            set;
        }

        protected override Framework.Data.DataAccess<PicPhone, int> GetProvider()
        {
            return new PicPhoneDataAccess();
        }
    }
}
