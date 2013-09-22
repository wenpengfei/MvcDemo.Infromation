using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core.Extensions
{
    public static class EducationExtensions
    {
        public static string DisplayName(this Education edu)
        {
            string displayName = string.Empty;
            switch (edu)
            {
                case Education.None:
                    displayName = "不限 ";
                    break;
                case Education.A:
                    displayName = "技校 ";
                    break;
                case Education.B:
                    displayName = "高中";
                    break;
                case Education.C:
                    displayName = "中专";
                    break;
                case Education.D:
                    displayName = "大专";
                    break;
                case Education.E:
                    displayName = "本科";
                    break;
                case Education.F:
                    displayName = "硕士";
                    break;
                case Education.G:
                    displayName = "博士";
                    break;
                //case Education.H:
                //    displayName = "技校";
                //    break;
                default:
                    break;
            }
            return displayName;
        }
    }
}
