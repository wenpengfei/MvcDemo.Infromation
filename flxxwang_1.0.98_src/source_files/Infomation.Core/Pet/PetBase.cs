using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    public class PetBase<TYPE> : InfoBase<TYPE>,IPet
        where TYPE : PetBase<TYPE>, new()
    {
        private string _titleDisplay;
        public override string TitleDisplay
        {
            get 
            {
                if (_titleDisplay == null)
                {
                    if (this is PetBird)
                    {
                        var pet = this as PetBird;
                        if (pet.Type == 1)
                        {
                            _titleDisplay = "(转让)"+pet.Title;
                        }
                        else if (pet.Type == 2)
                        {
                            _titleDisplay = "(求购)" + pet.Title;
                        }
                    }
                    else if (this is PetCat)
                    {
                        var pet = this as PetCat;
                        if (pet.Type == 1)
                        {
                            _titleDisplay = "(转让)" + pet.Title;
                        }
                        else if (pet.Type == 2)
                        {
                            _titleDisplay = "(求购)" + pet.Title;
                        }
                    }
                    else if (this is PetDog)
                    {
                        var pet = this as PetDog;
                        if (pet.Type == 1)
                        {
                            _titleDisplay = "(转让)" + pet.Title;
                        }
                        else if (pet.Type == 2)
                        {
                            _titleDisplay = "(求购)" + pet.Title;
                        }
                    }
                    else if (this is PetFood)
                    {
                        var pet = this as PetFood;
                        if (pet.Type == 1)
                        {
                            _titleDisplay = "(转让)" + pet.Title;
                        }
                        else if (pet.Type == 2)
                        {
                            _titleDisplay = "(求购)" + pet.Title;
                        }
                    }
                    else if (this is PetGive)
                    {
                        var pet = this as PetGive;
                        if (pet.Type == 1)
                        {
                            _titleDisplay = "(赠送)" + pet.Title;
                        }
                        else if (pet.Type == 2)
                        {
                            _titleDisplay = "(领养)" + pet.Title;
                        }
                    }
                    else if (this is PetService)
                    {
                        var pet=this as PetService;
                        _titleDisplay = pet.Title;
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

        #region InfoBase 重写成员.

        #endregion
    }
}
