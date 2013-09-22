using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;

namespace Infomation.Core.Data
{
    public class CompanyTradeDataAccess:DataAccess<CompanyTrade,int>
    {

        public override List<CompanyTrade> Insert(List<CompanyTrade> instances)
        {
            throw new NotImplementedException();
        }
    }
}
