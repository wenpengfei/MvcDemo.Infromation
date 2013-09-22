using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Framework.Extensions
{
    public static class EnumExtensions
    {
        public static bool TryParse<TEnum>(this string value, bool ignoreCase, out TEnum result) where TEnum : struct
        {//.net 4才有TryParse,所以这里扩展一个.
            result=default(TEnum);
            if(string.IsNullOrEmpty(value))
            {
                return false;
            }
            var names = Enum.GetNames(typeof(TEnum));
            var values= Enum.GetValues(typeof(TEnum));
            for (var i = 0; i < names.Length; i++)
            {
                var name = names[i];
                //if (name.ToLower() == value.ToLower())
                if(string.Compare(name,value,ignoreCase)==0)
                {
                    result = (TEnum)values.GetValue(i);
                    return true;
                }
            }
            return false;
        }
    }
}
