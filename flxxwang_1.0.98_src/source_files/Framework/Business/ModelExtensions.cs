using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

using Framework.Extensions;
using System.Reflection;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
namespace Framework
{
    public static class ModelExtensions
    {
        internal static DbType GetPrimaryDbType(this object instance)
        {//获取ModelBase<TYPE, KEY>中KEY的DbType类型
            return instance.GetType().BaseType.GetGenericArguments()[1].ToDbType();
        }
        internal static DbType GetPropertyDbType(this object instance, string PropertyName)
        {
            return instance.GetType().GetProperty(PropertyName).PropertyType.ToDbType();
        }
        internal static DbType GetPropertyDbType(this object instance, PropertyInfo Property)
        {
            return instance.GetType().GetProperty(Property.Name).PropertyType.ToDbType();
        }

        //public static List<T> ToEntities<T>(this DataTable dt, Type ModelType)
        //{

        //}
        public static List<T> ToEntities<T>(this DataTable dt)
            //where T:new()
        {
            
            PropertyInfo[] Properties = typeof(T).GetProperties();
            List<T> list = new List<T>();
            foreach (DataRow dr in dt.Rows)
            {
                //object instance = Activator.CreateInstance(BusinessObjectType);
                //var instance = new T();
                var instance = (T)Activator.CreateInstance(typeof(T));//2012.1.21
                foreach (DataColumn col in dt.Columns)
                {
                    foreach (var property in Properties)
                    {
                        if (property.Name.ToLower() == col.ColumnName.ToLower())
                        {
                            if (property.CanWrite)
                            {
                                object colValue = dr[col];
                                
                                try
                                {
                                    property.SetValue(instance, colValue == DBNull.Value ? null : colValue, null);
                                }
                                catch(Exception ex)
                                {//比如String不能隐式转换为Uri类型

                                    //数据库中字段为null,赋给非泛型版的值类型时，并捕获不到异常(如int类型，值总是为0)
                                    //Type extype = ex.GetType();

                                    bool ExceptionHandled = false;
                                    Type colType = colValue.GetType();
                                    if (colType == typeof(string))
                                    {
                                        //string-->Uri
                                        if (property.PropertyType == typeof(Uri))
                                        {
                                            property.SetValue(instance, colValue == DBNull.Value ? null : (new Uri(colValue.ToString())), null);
                                            ExceptionHandled = true;
                                        }
                                    }

                                    if (!ExceptionHandled)
                                    {
                                        throw ex;
                                    }
                                }
                            }
                            break;
                        }
                    }
                }
                list.Add(instance);
            }
            return list;
        }

        internal static string GetOrderBy(this string SqlQuery)
        {
            SqlQuery = SqlQuery.Trim();
            string Sql = SqlQuery;
            //string OrderBy = "Order By [Id]";//下面个带KeyFieldName的方法仅这里设置为KeyFieldName,其余完全相同.
            string OrderBy = "";
            int LastBracketIndex = SqlQuery.LastIndexOf(")");
            int OrderByIndex = SqlQuery.LastIndexOf(" order by ", StringComparison.OrdinalIgnoreCase);
            if (LastBracketIndex > 0)
            {
                if (OrderByIndex > LastBracketIndex)//有order by
                {
                    Sql = SqlQuery.Substring(0, OrderByIndex);
                    OrderBy = SqlQuery.Substring(OrderByIndex).Trim();
                }
            }
            else
            {
                if (OrderByIndex > 0)//有order by
                {
                    Sql = SqlQuery.Substring(0, OrderByIndex);
                    OrderBy = SqlQuery.Substring(OrderByIndex).Trim();
                }
            }
            return OrderBy;
        }

        internal static List<DbParameter> ToDbParameters(this object Condition,Database db)
        {
            var DbParameters = new List<DbParameter>();
            var properties = Condition.GetType().GetProperties();
            foreach (var p in properties)
            {
                var para = db.DbProviderFactory.CreateParameter();
                para.ParameterName = "@" + p.Name;
                para.Value = p.GetValue(Condition, null);
                if (para.Value == null)
                {
                    para.Value = DBNull.Value;
                }
                para.DbType = Condition.GetPropertyDbType(p);
                DbParameters.Add(para);
            }
            return DbParameters;
        }

    }
}
