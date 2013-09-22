using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Framework.Extensions;
namespace Infomation.Core.Extensions
{
    public static class ObjectExtension
    {
        public static List<string> PictureList(this object Instance)
        {
            //var collection = Instance.GetType().GetProperties().Where(p => p.Name == "PictureList");
            //if (collection.Count() > 0)
            //{
            //    var p = collection.ElementAt(0);
            //    var pic = p.GetValue(Instance, null);
            //    return (pic as List<string>);
            //}
            //throw new Exception("没有PictureList属性.");

            //var pictureList = (Instance as dynamic).PictureList;
            var pictureList = Instance.GetValue("PictureList");
            return pictureList as List<string>;
            
        }

        public static string Conver(this object Instance)
        {
            var list = PictureList(Instance);
            if (list.Count() == 0)
            {
                return "/content/fenlei/Images/noimg.gif";
            }
            else
            {
                return list.ElementAt(0);
            }
        }

        public static string PriceToString(this object Instance)
        {
            //var collection = Instance.GetType().GetProperties().Where(p => p.Name == "Price");
            //if (collection.Count() > 0)
            //{
            //    var p = collection.ElementAt(0);
            //    var val = p.GetValue(Instance, null);
            //    if (val == null)
            //    {
            //        return null;
            //    }
            //    int price = System.Convert.ToInt32(val);
            //    if (price == 0)
            //    {
            //        return "面议";
            //    }
            //    else
            //    {
            //        return "<b class='pri'>" + price + "</b> 元";
            //    }
            //}
            //throw new Exception("没有Price属性.");

            var val = Instance.GetValue("Price");
            if(val==null)
            {
                return null;
            }
            int price = System.Convert.ToInt32(val);
            if (price == 0)
            {
                return "面议";
            }
            else
            {
                return "<b class='pri'>" + price + "</b> 元";
            }
        }

        public static string QualityToString(this object Instance)
        {
            var val = Instance.GetValue("Quality");
            if (val == null)
            {
                return null;
            }
            int Quality = Convert.ToInt32(val);
            if (Quality == 100)
            {
                return "全新";
            }
            return Quality + " 成新";
        }
    }
}
