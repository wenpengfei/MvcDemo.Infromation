using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;

namespace Framework.Common
{
    public class CircleDataAccess : DataAccess<Circle, short>
    {
        //public override string TableName
        //{
        //    get { return "Fr_Circle"; }
        //}

        //public override string PrimaryKeyName
        //{
        //    get { return "Id"; }
        //}

        public override List<Circle> Insert(List<Circle> instances)
        {
            throw new NotImplementedException();
        }
    }
}
