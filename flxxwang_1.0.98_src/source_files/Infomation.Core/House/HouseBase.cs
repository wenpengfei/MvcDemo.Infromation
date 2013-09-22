using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public class HouseBase<TYPE>:InfoBase<TYPE>,IHouse
        where TYPE : HouseBase<TYPE>, new()
    {
        private string _titleDisplay;
        public override string TitleDisplay
        {
            get 
            {
                if (_titleDisplay == null)
                {
                    if (this is HouseBed)
                    {
                        var house=this as HouseBed;
                        _titleDisplay = "(床位)"+house.Title;
                    }
                    else if (this is HouseRent)
                    {
                        var house = this as HouseRent;
                        _titleDisplay = house.Title;
                    }
                    else if (this is HouseShare)
                    {
                        var house = this as HouseShare;
                        _titleDisplay = "(单间出租)" + house.Title;
                    }
                    else if (this is HouseOffice)
                    {
                        var house = this as HouseOffice;
                        if (house.Type == 1)
                        {
                            _titleDisplay = "(出租)"+house.Title;
                        }
                        else if (house.Type == 2)
                        {
                            _titleDisplay = "(求租)" + house.Title;
                        }
                        else if (house.Type == 3)
                        {
                            _titleDisplay = "(出售)" + house.Title;
                        }
                        else if (house.Type == 4)
                        {
                            _titleDisplay = "(求购)" + house.Title;
                        }
                    }
                    else if (this is HouseOther)
                    {
                        var house = this as HouseOther;
                        if (house.Type == 1)
                        {
                            _titleDisplay = "(出租)" + house.Title;
                        }
                        else if (house.Type == 2)
                        {
                            _titleDisplay = "(求租)" + house.Title;
                        }
                        else if (house.Type == 3)
                        {
                            _titleDisplay = "(转让)" + house.Title;
                        }
                        else if (house.Type == 4)
                        {
                            _titleDisplay = "(求购)" + house.Title;
                        }
                        else if (house.Type == 5)
                        {
                            _titleDisplay = "(出售)" + house.Title;
                        }
                    }
                    else if (this is HouseSecond)
                    {
                        var house = this as HouseSecond;
                        if (house.Type == 1)
                        {
                            _titleDisplay = "(出售)"+house.Title;
                        }
                        else if (house.Type == 2)
                        {
                            _titleDisplay = "(求购)" + house.Title;
                        }
                    }
                    else if (this is HouseShop)
                    {
                        var house = this as HouseShop;
                        if (house.Type == 1)
                        {
                            _titleDisplay = "(出售)"+house.Title;
                        }
                        else if (house.Type == 2)
                        {
                            _titleDisplay = "(求购)" + house.Title;
                        }
                        else if (house.Type == 3)
                        {
                            _titleDisplay = "(出租)" + house.Title;
                        }
                        else if (house.Type == 4)
                        {
                            _titleDisplay = "(求租)" + house.Title;
                        }
                        else if (house.Type == 5)
                        {
                            _titleDisplay = "(转让)" + house.Title;
                        }
                    }
                    else if (this is HouseShort)
                    {
                        var house = this as HouseShort;
                        if (house.Type == 1)
                        {
                            _titleDisplay = "(出租)"+house.Title;
                        }
                        else if (house.Type == 2)
                        {
                            _titleDisplay = "(求租)" + house.Title;
                        }
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
        /// 是否经纪人.
        /// </summary>
        public bool IsBiz
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
        /// 信息来源
        /// </summary>
        public long? Source
        {
            get;
            set;
        }

        #region InfoBase 重写成员.

        #endregion
    }
}
