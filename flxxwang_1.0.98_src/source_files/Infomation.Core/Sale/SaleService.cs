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
    /// 创意服务交易.
    /// </summary>
    [Table(Name = "Info_SaleService")]
    public class SaleService:SaleBase<SaleService>
    {
        public string Title
        {
            get;
            set;
        }
        /// <summary>
        /// 1:转让,2:求购
        /// </summary>
        public byte Type
        {
            get;
            set;
        }
        public string Tags
        {
            get;
            set;
        }

        #region InfoBase 重写成员.
        #endregion

        protected override DataAccess<SaleService, int> GetProvider()
        {
            return new SaleServiceDataAccess();
        }
    }
}
