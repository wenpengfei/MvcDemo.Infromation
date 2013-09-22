using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core.Extensions
{
    public static class YellowPageTypeExtensions
    {
        public static string DisplayName(this YellowPageBigType BigType)
        {
            if (BigType == YellowPageBigType.ShengHuo)
            {
                return "生活服务";
            }
            if (BigType == YellowPageBigType.ShangWu)
            {
                return "商务服务";
            }
            if (BigType == YellowPageBigType.WeiXiuZhuangXiu)
            {
                return "维修/装修";
            }
            if (BigType == YellowPageBigType.LvYouXiuXian)
            {
                return "旅游/住宿";
            }
            if (BigType == YellowPageBigType.ZhuceFalvCaiShui)
            {
                return "公司注册/法律/财税";
            }
            if (BigType == YellowPageBigType.BianMin)
            {
                return "便民服务";
            }
            if (BigType == YellowPageBigType.ZhaoShang)
            {
                return "招商加盟";
            }
            if (BigType == YellowPageBigType.HunQing)
            {
                return "婚庆服务";
            }
            return null;
        }

        public static string DisplayName(this YellowPageType SmallType)
        {
            return InfoCategory.GetCategory(SmallType).Name;
        }
    }
}
