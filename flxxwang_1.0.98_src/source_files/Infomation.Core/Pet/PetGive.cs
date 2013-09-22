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
    /// 宠物赠送.
    /// </summary>
    [Table(Name = "Info_PetGive")]
    public class PetGive:PetBase<PetGive>
    {
        /// <summary>
        /// 1:赠送,2:领养.
        /// </summary>
        public byte Type
        {
            get;
            set;
        }
        public string Title
        {
            get;
            set;
        }
        /// <summary>
        /// 补充说明.
        /// </summary>
        public string Content
        {
            get;
            set;
        }

        public string TypeName
        {
            get
            {
                if (this.Type == 1)
                {
                    return "赠送";
                }
                else if(this.Type == 2)
                {
                    return "领养";
                }
                return null;
            }
        }

        #region InfoBase 重写成员.
        #endregion

        protected override DataAccess<PetGive, int> GetProvider()
        {
            return new PetGiveDataAccess();
        }
    }
}
