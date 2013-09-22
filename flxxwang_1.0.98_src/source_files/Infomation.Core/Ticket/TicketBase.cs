using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public class TicketBase<TYPE>:InfoBase<TYPE>,ITicket
        where TYPE : TicketBase<TYPE>,new()
    {
        private string _titleDisplay;
        public override string TitleDisplay
        {
            get 
            {
                if (_titleDisplay == null)
                {
                    if (this is TicketAirplane)
                    {
                        var ticket = this as TicketAirplane;
                        _titleDisplay = ticket.Title;
                    }
                    else if (this is TicketCard)
                    {
                        var ticket = this as TicketCard;
                        if (ticket.Type == 1)
                        {
                            _titleDisplay = "(转让)" + ticket.Title; ;
                        }
                        else if (ticket.Type == 2)
                        {
                            _titleDisplay = "(求购)" + ticket.Title; ;
                        }
                    }
                    else if (this is TicketOther)
                    {
                        var ticket = this as TicketOther;
                        if (ticket.Type == 1)
                        {
                            _titleDisplay = "(转让)" + ticket.Title; ;
                        }
                        else if (ticket.Type == 2)
                        {
                            _titleDisplay = "(求购)" + ticket.Title; ;
                        }
                    }
                    else if (this is TicketPerform)
                    {
                        var ticket = this as TicketPerform;
                        if (ticket.Type == 1)
                        {
                            _titleDisplay = "(转让)" + ticket.Title; ;
                        }
                        else if (ticket.Type == 2)
                        {
                            _titleDisplay = "(求购)" + ticket.Title; ;
                        }
                    }
                    else if (this is TicketPleasure)
                    {
                        var ticket = this as TicketPleasure;
                        if (ticket.Type == 1)
                        {
                            _titleDisplay = "(转让)" + ticket.Title; ;
                        }
                        else if (ticket.Type == 2)
                        {
                            _titleDisplay = "(求购)" + ticket.Title; ;
                        }
                    }
                    else if (this is TicketTrain)
                    {
                        var ticket = this as TicketTrain;
                        if (ticket.Type == 1)
                        {
                            _titleDisplay = "(转让)" + ticket.Title; ;
                        }
                        else if (ticket.Type == 2)
                        {
                            _titleDisplay = "(求购)" + ticket.Title; ;
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

        #region InfoBase 重写成员.

        #endregion
    }
}
