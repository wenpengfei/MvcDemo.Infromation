using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    [Table(Name = "Info_CompanySize")]
    /// <summary>
    /// 公司规模.
    /// </summary>
    public class CompanySize:ModelBase<CompanySize,int>
    {
        [Column(IsPrimaryKey = true)]
        public byte Id
        {
            get;
            set;
        }
        public int Min
        {
            get;
            set;
        }
        public int Max
        {
            get;
            set;
        }
        public string DisplayName
        {
            get
            {
                if (this.Max < this.Min)
                {
                    return this.Min + "人以上";
                }
                return ""+this.Min+"-"+this.Max+"人";
            }
        }

        private static IEnumerable<CompanySize> _sizes;
        public static IEnumerable<CompanySize> Sizes
        {
            get
            {
                if (_sizes == null)
                {
                    _sizes = CompanySize.SelectAll();
                }
                return _sizes;
            }
        }
        protected override Framework.Data.DataAccess<CompanySize, int> GetProvider()
        {
            return new CompanySizeDataAccess();
        }
    }
}
