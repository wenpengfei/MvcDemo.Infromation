using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Extensions;

namespace Infomation.Core
{
    public class FriendBase<TYPE> : InfoBase<TYPE>,IFriend
        where TYPE : FriendBase<TYPE>, new()
    {
        private string _titleDisplay;
        public override string TitleDisplay
        {
            get 
            {
                if (_titleDisplay == null)
                {
                    if (this is FriendActivity
                        ||this is FriendHome
                        ||this is FriendSkill)
                    {
                        //var friend=this as dynamic;
                        //_titleDisplay = friend.Title;
                        _titleDisplay = this.GetValue("Title") as string;
                    }
                    else if (this is FriendInterest)
                    {
                        var friend = this as FriendInterest;
                        _titleDisplay = friend.Interest;
                    }
                    else if(this is FriendSex)
                    {
                        var friend = this as FriendSex;
                        _titleDisplay = friend.Purpose;
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
        /// 信息来源
        /// </summary>
        public long? Source
        {
            get;
            set;
        }
    }
}
