using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Framework
{
    public class DataConvert
    {
        public static TResult Convert<TResult>(object data)
        {
            var result = Convert(data, typeof(TResult));
            return (TResult)result;
        }

        public static object Convert(object data, Type returnType)
        {
            object result = null;
            switch (Type.GetTypeCode(returnType))
            {
                case TypeCode.Boolean:
                    result = System.Convert.ToBoolean(data);
                    break;
                case TypeCode.Byte:
                    result = System.Convert.ToByte(data);
                    break;
                case TypeCode.Char:
                    result = System.Convert.ToChar(data);
                    break;
                case TypeCode.DateTime:
                    result = System.Convert.ToDateTime(data);
                    break;
                case TypeCode.Decimal:
                    result = System.Convert.ToDecimal(data);
                    break;
                case TypeCode.Double:
                    result = System.Convert.ToDouble(data);
                    break;
                case TypeCode.Int16:
                    result = System.Convert.ToInt16(data);
                    break;
                case TypeCode.Int32:
                    result = System.Convert.ToInt32(data);
                    break;
                case TypeCode.Int64:
                    result = System.Convert.ToInt64(data);
                    break;
                case TypeCode.String:
                    result = System.Convert.ToString(data);
                    break;
                //case TypeCode.Object:
                //    break;

                default:
                    if (returnType == typeof(Guid))
                    {
                        result = (Guid)data;
                    }
                    //else
                    //{

                    //}
                    break;
            }

            return result;
        }
    }
}
