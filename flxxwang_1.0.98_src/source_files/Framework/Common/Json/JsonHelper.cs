using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Text;
using System.Data;
using System.Web.Script.Serialization;
using Microsoft.Web.Preview.Script.Serialization.Converters;
using System.Reflection;
using Framework.Extensions;

namespace Framework.Web.Script.Serialization
{
    public class JsonHelper
    {
        //DateTime.MinValue和DateTime.MaxValue序列化时会出错，所以转成对应下面这两个时间.
        private static DateTime MinDate = new DateTime(1753, 1, 1);
        private static DateTime MaxDate = new DateTime(9999, 12, 31);

        public static string Serialize(object entity)
        {
            if (entity == null)
            {
                return null;
            }
            if (entity is DataTable)
            {
                return SerializeDataTable(entity as DataTable);
            }
            if (entity is DataSet)
            {
                return SerializeDataSet(entity as DataSet);
            }

            DataContractJsonSerializer json = new DataContractJsonSerializer(entity.GetType());
            foreach(var property in entity.GetType().GetProperties())
            {
                if (property.CanRead)
                {
                    var val = property.GetValue(entity, null);
                    if (val != null&&val.GetType() == typeof(DateTime)&&property.CanWrite)
                    {
                        var date=Convert.ToDateTime(val);
                        if (date == DateTime.MinValue)
                        {
                            property.SetValue(entity, MinDate, null);
                        }
                        else if (date == DateTime.MaxValue)
                        {
                            property.SetValue(entity, MaxDate, null);
                        }
                    }
                }
            }
            using (MemoryStream stream = new MemoryStream())
            {
                json.WriteObject(stream, entity);
                string szJson = Encoding.UTF8.GetString(stream.ToArray());
                if (szJson.StartsWith("{"))//如果与[开头，说明是一个数组，如[1,2,"a","b"]
                {
                    szJson = szJson.Substring(1);
                    szJson = "{\"_type\":\"" + entity.GetType().ToString() + "\"," + szJson + "";
                    //不要用__type,json字符串中如果包含__type,那么在使有DataContractJsonSerializer时只能反序列化为__type指定的类型，序列化其他类类型会报错.
                }
                return szJson;
            }
        }

        public static object Deserialize(string json, Type type)
        {
            if (json == null)
            {
                return null;
            }
            using (MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json)))
            {
                DataContractJsonSerializer serializer = new DataContractJsonSerializer(type);
                return serializer.ReadObject(ms);
            }
        }
        //public static object Deserialize(string json, Type type, IEnumerable<Type> knownTypes)
        //{
        //    if (json == null)
        //    {
        //        return null;
        //    }
        //    using (MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json)))
        //    {
        //        DataContractJsonSerializer serializer = new DataContractJsonSerializer(type, knownTypes);
        //        return serializer.ReadObject(ms);
        //    }
        //}
        public static T Deserialize<T>(string json)
            //where T : new()
        {
            if (string.IsNullOrEmpty(json)||string.IsNullOrEmpty(json.Trim()))
            {
                return default(T);
            }
            using (MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json)))
            {
                DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(T));
                return (T)serializer.ReadObject(ms);
            }

        }

        private static IEnumerable<string> _assemblies;
        private static IEnumerable<string> Assemblies
        {
            get
            {
                if (_assemblies == null)
                {
                    var list = new List<string>();
                    //Assembly[] ass = AppDomain.CurrentDomain.GetAssemblies();//获取已经加载的所有程序集
                    //foreach (Assembly assembly in ass)
                    //{
                    //    if (assembly.IsDynamic)//如果是动态程序集，则执行assembly.Location就出错了.
                    //    {
                    //        continue;
                    //    }
                    //    if (string.IsNullOrEmpty(assembly.Location))
                    //        continue;
                    //    string filename = System.IO.Path.GetFileName(assembly.Location);
                    //    string extension = System.IO.Path.GetExtension(filename);
                    //    string dll = filename.Replace(extension, "");

                    //    list.Add(dll);
                    //}
                    //_assemblies = list;

                    //上面这种遍历方式经测试完成正确，不过遍历出的程序集很多,为了提高性能,最好向下面这样手动指定可能存在的程序集,可能性最大的排在最前.
                    list.Add("Infomation.Core");
                    list.Add("Framework.MvcWeb");
                    list.Add("Framework");
                    list.Add("Framework.Users");
                    _assemblies = list;
                }
                return _assemblies;
            }
        }

        public static object Deserialize(string json)
        {
            if (json == null)
            {
                return null;
            }


            //var __typeName = "{\"__type\":";
            //if (!json.StartsWith(__typeName))
            //{
            //    return null;
            //}

            //var __type = json.Substring(__typeName.Length + 1);
            //__type=__type.Substring(0,__type.IndexOf("\""));
            //var type = Type.GetType(__type); 
            //if (type == null&&!__type.Contains(","))
            //{//如果是跨程序集进行反射但又没有指定程序集时则会为null,此时则遍历程序集,遍历这种方式性能可能会有点低，所以设置type时最好指定程序集,如"Infomation.Core.SaleOffice,Infomation.Core".
            //    foreach (var assembly in Assemblies)
            //    {
            //        type = Type.GetType(__type + "," + assembly);
            //        if (type != null)//构建功
            //        {
            //            break;
            //        }
            //    }
            //}

            //json = json.Substring(__typeName.Length+1+__type.Length+1);
            //if (json.StartsWith(","))
            //{
            //    json = "{" + json.Substring(1);
            //}
            //else
            //{
            //    json = "{" + json;
            //}

            //JsonAnalysis jsonAnalysis = Deserialize<JsonAnalysis>(json);
            //var jsonAnalysisType =Type.GetType("Framework.Web.Script.Serialization.JsonAnalysis,Framework");
            var jsonAnalysis = Deserialize(json, typeof(JsonAnalysis)) as JsonAnalysis;
            if (string.IsNullOrWhiteSpace(jsonAnalysis._type))
            {
                return null;
            }
            var type = Type.GetType(jsonAnalysis._type);
            if (type == null && !jsonAnalysis._type.Contains(","))
            {//如果是跨程序集进行反射但又没有指定程序集时则会为null,此时则遍历程序集,遍历这种方式性能可能会有点低，所以设置type时最好指定程序集,如"Infomation.Core.SaleOffice,Infomation.Core".
                foreach (var assembly in Assemblies)
                {
                    type = Type.GetType(jsonAnalysis._type + "," + assembly);
                    if (type != null)//构建功
                    {
                        break;
                    }
                }
            }
            if (jsonAnalysis._ignoreP)
            {
                return Activator.CreateInstance(type);
            }

            using (MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(json)))
            {
                DataContractJsonSerializer serializer = new DataContractJsonSerializer(type);
                return serializer.ReadObject(ms);
            }
           
        }

        private static string SerializeDataTable(DataTable dt)
        {
            if (dt == null)
            {
                return null;
            }

            string json = string.Empty;

            json += "{\"__type\":\"System.Data.DataTable\",\"rows\":[" + SerializeDataRows(dt.Rows) + "]}";

            return json;
        }

        private static string SerializeDataSet(DataSet ds)
        {
            if (ds == null)
            {
                return null;
            }
            string tables = string.Empty;
            foreach (DataTable table in ds.Tables)
            {
                tables += ",{\"__type\":\"System.Data.DataTable\",\"rows\":["+SerializeDataRows(table.Rows)+"]}";
            }
            if (!string.IsNullOrWhiteSpace(tables))
            {
                tables = tables.Substring(1);
            }

            tables="{\"__type\":\"System.Data.DataSet\",\"tables\":["+tables+"]}";

            return tables;
        }

        private static string SerializeDataRows(DataRowCollection rows)
        {
            if (rows == null)
            {
                return null;
            }
            string json = string.Empty;
            foreach (DataRow dr in rows)
            {
                json +=","+SerializeDataRow(dr);
            }
            if (!string.IsNullOrWhiteSpace(json))
            {
                json = json.Substring(1);
            }
            return json;
        }

        private static string SerializeDataRow(DataRow dr)
        {
            if (dr == null)
            {
                return null;
            }
            JavaScriptSerializer javaScriptSerializer = new JavaScriptSerializer();
            DataRowConverter drConverter = new DataRowConverter();
            return javaScriptSerializer.Serialize(drConverter.Serialize(dr, null));
        }
    }
}