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
    /// 其他.
    /// </summary>
    [Table(Name = "Info_CarOther")]
    public class CarOther:CarBase<CarOther>
    {
        public int Price
        {
            get;
            set;
        }
        #region InfoBase 重写成员.
        #endregion
        protected override DataAccess<CarOther, int> GetProvider()
        {
            return new CarOtherDataAccess();
        }
    }
}
