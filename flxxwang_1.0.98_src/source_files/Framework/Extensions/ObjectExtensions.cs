using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace Framework.Extensions
{
    public static class ObjectExtensions
    {
        public static object GetValue(this object Instance, string memberName)
        {
            //return Instance.GetType().GetProperty(PropertyName).GetValue(Instance, null);

            var type = Instance.GetType();
            //var properties = type.GetProperties();
            var properties = type.GetProperties(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance);
            var property = properties.FirstOrDefault(item => item.Name == memberName);
            if (property != null)
            {
                return property.GetValue(Instance, null);
            }
            //var fields = type.GetFields();
            var fields = type.GetFields(BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance);
            var filed = fields.FirstOrDefault(item => item.Name == memberName);
            if (filed != null)
            {
                return filed.GetValue(Instance);
            }
            return null;
            //throw new Exception(type+"没有成员"+memberName);

            //var p = Instance.GetType().GetProperty(memberName);
            //if (p != null)
            //{
            //    return p.GetValue(Instance, null);
            //}
            //return null;
        }
        public static void SetValue(this object Instance, string memberName, object Value)
        {
            var type = Instance.GetType();
            var properties = type.GetProperties();
            var property = properties.FirstOrDefault(item => item.Name == memberName);
            if (property != null)
            {
                if (property.CanWrite)
                {
                    property.SetValue(Instance, Value, null);
                }
                return;
            }
            var fields = type.GetFields();
            var filed = fields.FirstOrDefault(item => item.Name == memberName);
            if (filed != null)
            {
                filed.SetValue(Instance,Value);
                return;
            }
            return;
            //throw new Exception(type + "没有成员" + memberName);

            //Instance.GetType().GetProperty(PropertyName).SetValue(Instance, Value, null);
        }
        //public static object GetValue(this object Instance, PropertyInfo Property)
        //{
        //    //return instance.GetType().GetProperty(Property.Name).GetValue(instance, null);
        //    return Property.GetValue(Instance, null);
        //}
        public static bool ContainsProperty(this object Instance, string memberName)
        {
            var type = Instance.GetType();
            var properties = type.GetProperties();
            var property = properties.FirstOrDefault(item => item.Name == memberName);
            if (property != null)
            {
                return true;
            }
            var fields = type.GetFields();
            var filed = fields.FirstOrDefault(item => item.Name == memberName);
            if (filed != null)
            {
                return true;
            }
            return false;
            //return Instance.GetType().GetProperty(PropertyName) != null;
        }

        //类似js中的join().[1,2,3].Join(",")=>1,2,3 by liliesheng 2012-7-16
        public static string Join(this IEnumerable<object> collection, string separator)
        {
            if (collection == null || collection.Count() == 0)
            {
                return string.Empty;
            }
            var str = string.Empty;
            foreach (var item in collection)
            {
                str += separator + item;
            }
            var len = 0;
            if (separator != null)
            {
                len = separator.Length;
            }
            str = str.Substring(len);
            return str;
        }
    }
}
