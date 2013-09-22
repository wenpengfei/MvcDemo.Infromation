using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;

namespace Infomation.Core.Data
{
    public class CompanyTypeDataAccess:DataAccess<CompanyType,int>
    {
        public override List<CompanyType> Insert(List<CompanyType> instances)
        {
            throw new NotImplementedException();
        }
    }
}
