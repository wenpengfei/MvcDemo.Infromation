using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Framework.Extensions;

namespace Infomation.Core
{
    public abstract class SaleBase<TYPE> : InfoBase<TYPE>,ISale
        where TYPE : SaleBase<TYPE>, new()
    {
        private string _titleDisplay;
        public override string TitleDisplay
        {
            get 
            {
                if (_titleDisplay == null)
                {
                    if (this is SaleArt
                        || this is SaleAthletics
                        || this is SaleBaby
                        || this is SaleBook
                        || this is SaleClothing
                        || this is SaleCommunication
                        ||this is SaleComputer
                        || this is SaleDigital
                        || this is SaleElectric
                        || this is SaleEquipment
                        || this is SaleFacial
                        || this is SaleGame
                        || this is SaleHome
                        || this is SaleMobile
                        || this is SaleOffice
                        || this is SaleOther
                        || this is SaleService)
                    {
                        //var sale = this as dynamic;
                        var type =Convert.ToInt32(this.GetValue("Type"));
                        var title = this.GetValue("Title");
                        if (type == 1)
                        {
                            _titleDisplay = "(转让)"+title;
                        }
                        else if (type == 2)
                        {
                            _titleDisplay = "(求购)" + title;
                        }
                    }
                    else if (this is SaleMobileNumber)
                    {
                        var sale = this as SaleMobileNumber;
                        _titleDisplay = "(转让)" + sale.Number;
                    }
                    //else if (this is SaleSex)
                    //{
                    //    var sale = this as SaleSex;
                    //    _titleDisplay = sale.Title;
                    //}
                    else if (this is SaleSwap)
                    {
                        var sale = this as SaleSwap;
                        _titleDisplay = "" + sale.Title + " - 想换" + sale.Want + "";
                    }
                }
                if (_titleDisplay == null)
                {
                    _titleDisplay = string.Empty;
                }
                return _titleDisplay;
            }
        }
        /// <summary>
        /// 小区.
        /// </summary>
        public string District
        {
            get;
            set;
        }
        public int Price
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
        /// <summary>
        /// QQ或MSN
        /// </summary>
        public string QQOrMSN
        {
            get;
            set;
        }
        /// <summary>
        /// 信息来源
        /// </summary>
        public long? Source
        {
            get;
            set;
        }

        protected string ToQualityName(int Quality)
        {
            if (Quality == 0)//没有设置成色.
            {
                return string.Empty;
            }
            else if (Quality <= 60)
            {
                return "6成以下";
            }
            if (Quality == 100)
            {
                return "全新";
            }
            else if (Quality.ToString().EndsWith("0"))
            {
                return Quality.ToString().Substring(0, 1) + "成新";
            }
            else
            {
                return Quality.ToString() + "成新";
            }
        }
    }
}
