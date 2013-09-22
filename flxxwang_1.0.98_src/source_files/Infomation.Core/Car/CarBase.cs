using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Infomation.Core.Mvc;
using System.Web.Routing;
using Framework.Extensions;

namespace Infomation.Core
{
    public class CarBase<TYPE>:InfoBase<TYPE>,ICar
        where TYPE : CarBase<TYPE>,new()
    {
        public string Title
        {
            get;
            set;
        }
        private string _titleDisplay;
        public override string TitleDisplay
        {
            get 
            {
                if (_titleDisplay == null)
                {
                    if (this is CarAccompany
                        ||this is CarService)
                    {
                        _titleDisplay=this.Title;
                    }
                    else if (this is CarBuy)
                    {
                        _titleDisplay = "(求购)" + this.Title;
                    }
                    else if (this is CarSecondHand)
                    {
                        _titleDisplay = "(出售)" + this.Title;
                    }
                    else if (this is CarBicycle
                        || this is CarFitting
                        || this is CarMotor)
                    {
                        //var car = this as dynamic;
                        var type = Convert.ToInt32(this.GetValue("Type"));
                        if (type == 1)
                        {
                            _titleDisplay = "(转让)" + this.Title;
                        }
                        else if (type == 2)
                        {
                            _titleDisplay = "(求购)" + this.Title;
                        }
                    }
                    else if (this is Carpool)
                    {
                        var car = this as Carpool;
                        if (car.Type == 1)
                        {
                            _titleDisplay = "(有车)" + this.Title;
                        }
                        else if (car.Type == 2)
                        {
                            _titleDisplay = "(无车)" + this.Title;
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
        /// 补充说明.
        /// </summary>
        public string Content
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
    }
}
