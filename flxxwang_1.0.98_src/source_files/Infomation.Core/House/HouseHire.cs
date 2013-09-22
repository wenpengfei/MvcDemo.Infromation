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
    /// 房屋求租.
    /// </summary>
    [Table(Name = "Info_HouseHire")]
    public class HouseHire : HouseBase<HouseHire>
    {
        public string Title
        {
            get;
            set;
        }
        public string District1
        {
            get;
            set;
        }
        public string District2
        {
            get;
            set;
        }
        
        public bool HouseType1
        {
            get;
            set;
        }
        public bool HouseType2
        {
            get;
            set;
        }
        public bool HouseType3
        {
            get;
            set;
        }
        public bool HouseType4
        {
            get;
            set;
        }
        public bool HouseType5
        {
            get;
            set;
        }
        public bool Room1
        {
            get;
            set;
        }
        public bool Room2
        {
            get;
            set;
        }
        public bool Room3
        {
            get;
            set;
        }
        public bool Room4
        {
            get;
            set;
        }
        public bool Room5
        {
            get;
            set;
        }
        public bool FitType1
        {
            get;
            set;
        }
        public bool FitType2
        {
            get;
            set;
        }
        public bool FitType3
        {
            get;
            set;
        }
        public bool FitType4
        {
            get;
            set;
        }
        public int Price1
        {
            get;
            set;
        }
        public int Price2
        {
            get;
            set;
        }
        /// <summary>
        /// 付款方式，如押一付三.
        /// </summary>
        public string PayWay
        {
            get;
            set;
        }

        /// <summary>
        /// 是否有床.
        /// </summary>
        public bool Bed
        {
            get;
            set;
        }
        /// <summary>
        /// 是否有热水器.
        /// </summary>
        public bool WaterHeater
        {
            get;
            set;
        }
        /// <summary>
        /// 是否有洗衣机.
        /// </summary>
        public bool WashingMachine
        {
            get;
            set;
        }
        /// <summary>
        /// 是否有空调.
        /// </summary>
        public bool AirConditioner
        {
            get;
            set;
        }
        /// <summary>
        /// 是否有电冰箱.
        /// </summary>
        public bool Icebox
        {
            get;
            set;
        }
        /// <summary>
        /// 是否有电视.
        /// </summary>
        public bool Television
        {
            get;
            set;
        }
        /// <summary>
        /// 是否有宽带.
        /// </summary>
        public bool Broadband
        {
            get;
            set;
        }

        #region InfoBase 重写成员.
        
        #endregion

        protected override DataAccess<HouseHire, int> GetProvider()
        {
            return new HouseHireDataAccess();
        }
    }
}
