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
    /// 企业所属行业.
    /// </summary>
    [Table(Name = "Info_CompanyTrade")]
    public class CompanyTrade:ModelBase<CompanyTrade,int>
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
        
        private static IEnumerable<CompanyTrade> _trades;
        public static IEnumerable<CompanyTrade> Trades
        {
            get
            {
                if (_trades == null)
                {
                    _trades = CompanyTrade.SelectAll();
                }
                return _trades;
            }
        }

        protected override Framework.Data.DataAccess<CompanyTrade, int> GetProvider()
        {
            return new CompanyTradeDataAccess();
        }
    }
}
