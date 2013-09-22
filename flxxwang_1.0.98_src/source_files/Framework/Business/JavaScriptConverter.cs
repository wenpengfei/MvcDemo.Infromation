using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Script.Serialization;
using System.Reflection;

namespace Framework.Web.Script.Serialization
{
    //该类通用，支持的类型在子类中重写SupportedTypes即可.
    public abstract class JavaScriptConverter : System.Web.Script.Serialization.JavaScriptConverter
    {//因为存在循环引用，所以要自定义这么一个转换器。
        public override object Deserialize(IDictionary<string, object> dictionary, Type type, JavaScriptSerializer serializer)
        {
            object instance = Activator.CreateInstance(type);
            PropertyInfo[] Properties = instance.GetType().GetProperties();
            foreach (var obj in dictionary)
            {
                foreach (var property in Properties)
                {
                    if (property.Name == obj.Key)//c#与javascript都大小写敏感的，所以不用区分大小写
                    {
                        if (property.CanWrite)
                        {
                            property.SetValue(instance, obj.Value, null);
                        }
                    }
                }
            }

            return instance;
        }

        public override IDictionary<string, object> Serialize(object obj, JavaScriptSerializer serializer)
        {
            IDictionary<string, object> result = new Dictionary<string, object>();
            PropertyInfo[] Properties = obj.GetType().GetProperties();
            foreach (var property in Properties)
            {
                if (property.CanRead)
                {
                    //Provider含有大量的信息：db、DbTableFields等，这些信息我们都不需要。

                    if (property.Name == "Provider" && property.PropertyType.ToString().StartsWith("Framework.Data.DataAccess`2"))
                    {//property.PropertyType.BaseType是System.Object
                        continue;
                    }
                    if (property.Name == "Item" && property.DeclaringType.ToString().StartsWith("Framework.ModelBase`2"))
                    {//调试发现，泛型类中都有一个Item属性，如果不去掉，会出现一个错误：参数计数不匹配
                        continue;
                    }
                    if (property.PropertyType.BaseType.FullName.StartsWith(typeof(ModelBase<,>).FullName))//目的,暂时不想系列化复杂类型,因为复杂类型容易形成循环引用，从而引发错误。
                    {
                        continue;
                    }
                    result[property.Name] = property.GetValue(obj, null);
                }
            }

            return result;
        }

        public override IEnumerable<Type> SupportedTypes
        {//子类可以重写，以支持任何自定义类型。
            get 
            {
                //yield return typeof(IModel);//没用
                throw new NotImplementedException();
            }
        }
    }
}
