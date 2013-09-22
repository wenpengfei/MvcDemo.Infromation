using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 公司性质.
    /// </summary>
    [Table(Name = "Info_CompanyType")]
    public class CompanyType:ModelBase<CompanyType,int>
    {
        [Column(IsPrimaryKey = true)]
        public byte Id
        {
            get;
            set;
        }
        public string Name
        {
            get;
            set;
        }

        private static IEnumerable<CompanyType> _types;
        public static IEnumerable<CompanyType> Types
        {
            get
            {
                if (_types == null)
                {
                    _types = CompanyType.SelectAll();
                }
                return _types;
            }
        }

        protected override Framework.Data.DataAccess<CompanyType, int> GetProvider()
        {
            return new CompanyTypeDataAccess();
        }
    }
}
