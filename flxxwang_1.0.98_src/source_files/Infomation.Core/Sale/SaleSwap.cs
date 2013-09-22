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
    /// 物品交换.
    /// </summary>
    [Table(Name = "Info_SaleSwap")]
    public class SaleSwap:SaleBase<SaleSwap>
    {
        /// <summary>
        /// 我有.
        /// </summary>
        public string Title
        {
            get;
            set;
        }
        /// <summary>
        /// 想换.
        /// </summary>
        public string Want
        {
            get;
            set;
        }
        /// <summary>
        /// 成色
        /// </summary>
        public byte Quality
        {
            get;
            set;
        }
        /// <summary>
        /// 是否经纪人.
        /// </summary>
        public bool IsBiz
        {
            get;
            set;
        }

        private string _qualityName;
        public string QualityName
        {
            get
            {
                if (_qualityName == null)
                {
                    _qualityName = ToQualityName(this.Quality);
                }
                return _qualityName;
            }
        }

        #region InfoBase 重写成员.
        #endregion

        protected override DataAccess<SaleSwap, int> GetProvider()
        {
            return new SaleSwapDataAccess();
        }
    }
}
