using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Framework.Extensions
{
    public static class DataTypeExtensions
    {
        public static DbType ToDbType(this Type type)
        {
            DbType dbt;
            //try
            //{
                if (type.Name.StartsWith("Nullable"))//值可空类型
                {
                    dbt = (DbType)Enum.Parse(typeof(DbType), type.GetGenericArguments()[0].Name);
                }
                else
                {
                    dbt = (DbType)Enum.Parse(typeof(DbType), type.Name);
                }
            //}
            //catch
            //{
            //    //dbt = DbType.Object;
            //    //throw new Exception(type.ToString() + "无法转换为DbType类型");
            //    return DbType.String;//不要转换为 DbType.Object
                
            //}
            return dbt;
        }

        //public static Type ToType(this DbType dbtype)
        //{
        //    Type toReturn = typeof(DBNull);
        //    switch (dbtype)
        //    {
        //        case DbType.UInt64:
        //            toReturn = typeof(UInt64);
        //            break;
        //        case DbType.Int64:
        //            toReturn = typeof(Int64);
        //            break;
        //        case DbType.Int32:
        //            toReturn = typeof(Int32);
        //            break;
        //        case DbType.UInt32:
        //            toReturn = typeof(UInt32);
        //            break;
        //        case DbType.Single:
        //            toReturn = typeof(float);
        //            break;
        //        case DbType.Date:
        //        case DbType.DateTime:
        //        case DbType.Time:
        //            toReturn = typeof(DateTime);
        //            break;
        //        case DbType.String:
        //        case DbType.StringFixedLength:
        //        case DbType.AnsiString:
        //        case DbType.AnsiStringFixedLength:
        //            toReturn = typeof(string);
        //            break;
        //        case DbType.UInt16:
        //            toReturn = typeof(UInt16);
        //            break;
        //        case DbType.Int16:
        //            toReturn = typeof(Int16);
        //            break;
        //        case DbType.SByte:
        //        case DbType.Byte:
        //            toReturn = typeof(byte);
        //            break;
        //        case DbType.Object:
        //            toReturn = typeof(object);
        //            break;
        //        case DbType.VarNumeric:
        //        case DbType.Decimal:
        //            toReturn = typeof(decimal);
        //            break;
        //        case DbType.Currency:
        //            toReturn = typeof(double);
        //            break;
        //        case DbType.Binary:
        //            toReturn = typeof(byte[]);
        //            break;
        //        case DbType.Double:
        //            toReturn = typeof(Double);
        //            break;
        //        case DbType.Guid:
        //            toReturn = typeof(Guid);
        //            break;
        //        case DbType.Boolean:
        //            toReturn = typeof(bool);
        //            break;
        //    }
        //    return toReturn;
        //}
    }
}
