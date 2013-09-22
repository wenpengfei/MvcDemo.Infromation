using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;
using Framework.Extensions;
using System.Reflection;
using System.Collections;

namespace Framework.Data.Linq
{
    //http://www.cnblogs.com/Airfeeling/archive/2011/09/14/1320397.html
    //public class baseEntity
    //{
    //    internal string whereStr;
    //}
    //public class UserId : baseEntity
    //{
    //    public string Id { get; set; }
    //    public string Pws { get; set; }
    //    public int? LoginCount { get; set; }
    //}
    public static class LambdaToSql
    {
        public static bool In<T>(this T obj, IEnumerable<T> array)
        {
            return true;
        }
        public static bool NotIn<T>(this T obj, IEnumerable<T> array)
        {
            return true;
        }
        public static bool Like(this string str, string likeStr)
        {
            return true;
        }
        public static bool NotLike(this string str, string likeStr)
        {
            return true;
        }

        public static string ToWhere(this LambdaExpression predicate, string tableAlias)//tableAlias:表别名
        {
            if (predicate.Body is BinaryExpression)
            {
                var be = predicate.Body as BinaryExpression;
                var strWhere = LambdaToSql.BinarExpressionProvider(be.Left, be.Right, be.NodeType,tableAlias);
                return strWhere;
            }
            else
            {
                string strWhere = string.Empty;
                if ((predicate.Body is MemberExpression) && ((predicate.Body as MemberExpression).Expression.NodeType == ExpressionType.MemberAccess) && (predicate.Body.Type == typeof(bool)))//如item=>item.IsBiz.但不包括:item=>isBiz (isBiz为变量,编译器会自动生成一个类将isBiz括起来,访问时属于MemberAccess)
                {
                    MemberExpression me = predicate.Body as MemberExpression;
                    string tablePrefix = null;
                    if (!(string.IsNullOrEmpty(tableAlias)||string.IsNullOrEmpty(tableAlias.Trim())))
                    {
                        tablePrefix = tableAlias + ".";
                    }
                    strWhere = "("+tablePrefix+"" + me.Member.Name + "=1)";
                }
                else
                {
                    var val=LambdaToSql.ExpressionRouter(predicate.Body,tableAlias);
                    if (val == null)
                    {
                        strWhere = "null";
                    }
                    else
                    {
                        strWhere = val.ToString();
                    }
                }
                return strWhere;
            }
        }
        
        public static string ToSql<T>(this Expression<Func<T, bool>> predicate) where T : IModel, new()//by lls
        {
            var tabName = new T().TableName;
            var strWhere = predicate.ToWhere(null);
            var sqlQuery = "select * from " + tabName + " where " + strWhere + "";
            return sqlQuery;
        }

        public static string BinarExpressionProvider(Expression left, Expression right, ExpressionType type, string tableAlias)
        {
            string tablePrefix = null;
            if (!(string.IsNullOrEmpty(tableAlias)||string.IsNullOrEmpty(tableAlias.Trim())))
            {
                tablePrefix = tableAlias + ".";
            }

            string sb = "(";
            //先处理左边
            if ((left is MemberExpression) && (left.Type == typeof(bool)) && (type == ExpressionType.And || type == ExpressionType.AndAlso || type == ExpressionType.Or || type == ExpressionType.OrElse))//by lls
            {
                MemberExpression me = left as MemberExpression;
                sb += "("+tablePrefix+"" + me.Member.Name + "=1)";
            }
            else
            {
                sb += ExpressionRouter(left,tableAlias);
            }

            sb += ExpressionTypeCast(type);

            //再处理右边
            if ((right is MemberExpression) && (right.Type == typeof(bool)) && (type == ExpressionType.And || type == ExpressionType.AndAlso || type == ExpressionType.Or || type == ExpressionType.OrElse))//by lls
            {
                MemberExpression me = right as MemberExpression;
                sb += "(" + tablePrefix + "" + me.Member.Name + "=1)";
            }
            else
            {
                var val = ExpressionRouter(right,tableAlias);
                //if (tmpStr == "null")
                if (val == null)
                {
                    if (sb.EndsWith(" ="))
                        sb = sb.Substring(0, sb.Length - 2) + " is null";
                    else if (sb.EndsWith("<>"))
                        sb = sb.Substring(0, sb.Length - 2) + " is not null";
                }
                else
                {
                    sb += val;
                }
            }
            
            return sb += ")";
        }


        //返回值只有3种可能:null、ValueType和string
        private static object GetConstantExpressionValue(ConstantExpression constExp, string memberName1 = null, string memberName2 = null, string memberName3 = null, string memberName4 = null, string memberName5 = null, string memberName6 = null, string memberName7 = null, string memberName8 = null)
        {
            //var constValue = constExp.Type.GetFields().First().GetValue(constExp.Value);//编译器会自动生成一个类将变量包起来,所以要这样才能获取值.
            //object constValue = null;
            //if (constExp.Type.GetFields().Count() == 0)//变量是在类中的成员变量
            //{
            //    constValue = constExp.Value.GetValue(memberName1);
            //}
            //else//变量是局部变量,会自动生成一个类将变量包起来.
            //{
            //    constValue = constExp.Type.GetField(memberName1).GetValue(constExp.Value);//编译器会自动生成一个类将变量包起来,所以要这样才能获取值.
            //}

            //var constValue = constExp.Type.GetField(memberName1, BindingFlags.Public|BindingFlags.NonPublic|BindingFlags.Instance).GetValue(constExp.Value);

            //var constValue = constExp.Type.GetProperty(memberName1, BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance).GetValue(constExp.Value,null);

            var constValue=constExp.Value.GetValue(memberName1);

            if (memberName2 != null)
            {
                constValue = constValue.GetValue(memberName2);
            }
            if (memberName3 != null)
            {
                constValue = constValue.GetValue(memberName3);
            }
            if (memberName4 != null)
            {
                constValue = constValue.GetValue(memberName4);
            }
            if (memberName5 != null)
            {
                constValue = constValue.GetValue(memberName5);
            }
            if (memberName6 != null)
            {
                constValue = constValue.GetValue(memberName6);
            }
            if (memberName7 != null)
            {
                constValue = constValue.GetValue(memberName7);
            }
            if (memberName8 != null)
            {
                constValue = constValue.GetValue(memberName8);
            }

            if (constValue == null)
            {
                //return "null";
                return null;
            }
            else if (constValue is ValueType)
            {
                if (constValue is bool)
                {
                    return Convert.ToInt32(constValue);
                }
                return constValue;
            }
            else if (constValue is string || constValue is DateTime || constValue is char)
            {
                return string.Format("'{0}'", constValue.ToString().Replace("'", "''"));//by lls,防sql注入.
            }
            return constValue;//constValue可能是一个实例对象.调用实例的方法时,MethodInfo.Invoke时要获取实体对象.
        }


        public static object ExpressionRouter(Expression exp, string tableAlias)//返回值只有3种可能:null、ValueType和string
        {
            string tablePrefix = null;
            if (!string.IsNullOrWhiteSpace(tableAlias))
            {
                tablePrefix = tableAlias + ".";
            }

            string sb = string.Empty;
            if (exp is BinaryExpression)
            {
                BinaryExpression be = ((BinaryExpression)exp);
                return BinarExpressionProvider(be.Left, be.Right, be.NodeType,tableAlias);
            }
            else if (exp is MemberExpression)
            {
                MemberExpression me = exp as MemberExpression;
                if (me.Expression.NodeType == ExpressionType.Constant)//如item=>item.Id==id;//id就是ExpressionType.Constant,这个id编译器会自动生成一个类将它包起来.
                {
                    return GetConstantExpressionValue(me.Expression as ConstantExpression, me.Member.Name);
                }
                else if (me.Expression is MemberExpression)
                {
                    var me2 = me.Expression as MemberExpression;
                    if (me2.Expression.NodeType == ExpressionType.Constant)
                    {
                        return GetConstantExpressionValue(me2.Expression as ConstantExpression, me2.Member.Name, me.Member.Name);//如item=>item.Id==a.id;
                    }
                    else if (me2.Expression is MemberExpression)
                    {
                        var me3 = me2.Expression as MemberExpression;
                        if (me3.Expression.NodeType == ExpressionType.Constant)
                        {
                            return GetConstantExpressionValue(me3.Expression as ConstantExpression, me3.Member.Name, me2.Member.Name, me.Member.Name);//如item=>item.Id==a.b.id;
                        }
                        else if (me3.Expression is MemberExpression)
                        {
                            var me4 = me3.Expression as MemberExpression;
                            if (me4.Expression.NodeType == ExpressionType.Constant)
                            {
                                return GetConstantExpressionValue(me4.Expression as ConstantExpression, me4.Member.Name, me3.Member.Name, me2.Member.Name, me.Member.Name);//如item=>item.Id==a.b.c.id;
                            }
                            else if (me4.Expression is MemberExpression)
                            {
                                var me5 = me4.Expression as MemberExpression;
                                if (me5.Expression.NodeType == ExpressionType.Constant)
                                {
                                    return GetConstantExpressionValue(me5.Expression as ConstantExpression, me5.Member.Name, me4.Member.Name, me3.Member.Name, me2.Member.Name, me.Member.Name);//如item=>item.Id==a.b.c.d.id;
                                }
                                else if (me5.Expression is MemberExpression)
                                {
                                    var me6 = me5.Expression as MemberExpression;
                                    if (me6.Expression.NodeType == ExpressionType.Constant)
                                    {
                                        return GetConstantExpressionValue(me6.Expression as ConstantExpression, me6.Member.Name, me5.Member.Name, me4.Member.Name, me3.Member.Name, me2.Member.Name, me.Member.Name);//如item=>item.Id=a.b.c.d.e.id;
                                    }
                                    else if (me6.Expression is MemberExpression)
                                    {
                                        var me7 = me6.Expression as MemberExpression;
                                        if (me7.Expression.NodeType == ExpressionType.Constant)
                                        {
                                            return GetConstantExpressionValue(me7.Expression as ConstantExpression, me7.Member.Name, me6.Member.Name, me5.Member.Name, me4.Member.Name, me3.Member.Name, me2.Member.Name, me.Member.Name);//如item=>item.Id=a.b.c.d.e.f.id;
                                        }
                                        else if (me7.Expression is MemberExpression)
                                        {
                                            var me8 = me7.Expression as MemberExpression;
                                            if (me8.Expression.NodeType == ExpressionType.Constant)
                                            {
                                                return GetConstantExpressionValue(me8.Expression as ConstantExpression, me8.Member.Name, me7.Member.Name, me6.Member.Name, me5.Member.Name, me4.Member.Name, me3.Member.Name, me2.Member.Name, me.Member.Name);//如item=>item.Id=a.b.c.d.e.f.g.id;
                                            }
                                            else
                                            {
                                                throw new Exception("属性访问超过了8级");//8级应该已经足够多了,也可继续扩展级数.
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                return tablePrefix + me.Member.Name;//me.Expression.NodeType ==ExpressionType.MemberAccess
            }
            else if (exp is NewArrayExpression)//如item => item.Content.In(new string[]{"aa","bb"})中new string[]{"aa","bb"}就是NewArrayExpression
            {
                NewArrayExpression ae = ((NewArrayExpression)exp);
                StringBuilder tmpstr = new StringBuilder();
                foreach (Expression ex in ae.Expressions)
                {
                    tmpstr.Append(ExpressionRouter(ex, tableAlias));
                    tmpstr.Append(",");
                }
                return tmpstr.ToString(0, tmpstr.Length - 1);
            }
            else if (exp is MethodCallExpression)
            {
                MethodCallExpression mce = (MethodCallExpression)exp;

                if (mce.Method.Name == "Contains")//by lls
                {
                    if (mce.Object != null)//如item.TrueName.Contains("张三")
                    {
                        //var memberName = (mce.Object as dynamic).Member.Name;//by lls
                        var memberName = mce.Object.GetValue("Member").GetValue("Name");//by lls
                        return string.Format("({0} like '%{1}%')", tablePrefix + memberName, (mce.Arguments[0] as ConstantExpression).Value.ToString().Replace("'", "''"));//by lls
                    }
                    else//如var array=new int[]{1,2,3};item=>array.Contains(item.Id)
                    {
                        var constExp = mce.Arguments[0] as ConstantExpression;
                        var values = constExp.Value as IEnumerable;
                        var strIn = string.Empty;
                        foreach (var val in values)
                        {
                            if (val.GetType().IsValueType)
                            {
                                strIn += "," + val;
                            }
                            else
                            {
                                strIn += ",'" + val + "'";//val为string类型
                            }
                        }
                        if (!string.IsNullOrWhiteSpace(strIn))
                        {
                            strIn = strIn.Substring(1);
                            strIn = "(" + strIn + ")";
                            var memberExp = mce.Arguments[1] as MemberExpression;
                            return string.Format("({0} in {1})", tablePrefix + memberExp.Member.Name, strIn);
                        }
                        else
                        {
                            return "(0 = 1)";
                        }
                    }
                }
                else if (mce.Method.Name == "StartsWith")//by lls
                {
                    //var memberName = (mce.Object as dynamic).Member.Name;//by lls
                    var memberName = mce.Object.GetValue("Member").GetValue("Name");//by lls
                    return string.Format("({0} like '{1}%')", tablePrefix + memberName, (mce.Arguments[0] as ConstantExpression).Value.ToString().Replace("'", "''"));//by lls
                }
                else if (mce.Method.Name == "EndsWith")//by lls
                {
                    //var memberName = (mce.Object as dynamic).Member.Name;//by lls
                    var memberName = mce.Object.GetValue("Member").GetValue("Name");//by lls
                    return string.Format("({0} like '%{1}')", tablePrefix + memberName, (mce.Arguments[0] as ConstantExpression).Value.ToString().Replace("'", "''"));//by lls
                }
                else if (mce.Method.Name == "Like")
                {
                    return string.Format("({0} like {1})", ExpressionRouter(mce.Arguments[0], tableAlias), ExpressionRouter(mce.Arguments[1], tableAlias));
                }
                else if (mce.Method.Name == "NotLike")
                {
                    return string.Format("({0} Not like {1})", ExpressionRouter(mce.Arguments[0], tableAlias), ExpressionRouter(mce.Arguments[1], tableAlias));
                }
                else if (mce.Method.Name == "In")
                {
                    var strIn=ExpressionRouter(mce.Arguments[1], tableAlias);
                    if (string.IsNullOrEmpty(strIn.ToString().Trim()))
                    {
                        return "0=1";
                    }
                    else
                    {
                        return string.Format("{0} In {1}", ExpressionRouter(mce.Arguments[0], tableAlias), strIn);
                    }
                    
                }
                else if (mce.Method.Name == "NotIn")
                {
                    var strIn = ExpressionRouter(mce.Arguments[1], tableAlias);
                    if (string.IsNullOrWhiteSpace(strIn.ToString()))
                    {
                        return "0=1";
                    }
                    else
                    {
                        return string.Format("{0} Not In {1}", ExpressionRouter(mce.Arguments[0], tableAlias), strIn);
                    }
                }
                else if (mce.Method.Name == "IsNullOrEmpty" || mce.Method.Name == "IsNullOrWhiteSpace")//by lls
                {
                    return string.Format("({0} is null or {0}='')", ExpressionRouter(mce.Arguments[0], tableAlias));
                }
                //else if(mce.Method.Name.StartsWith("To")&&Enum.GetNames(typeof(TypeCode)).Contains(mce.Method.Name.Substring(2)))//如Convert.ToInt32()等
                else//获取方法调用的返回值.如Convert.ToInt32("10")
                {
                    object[] parameters = null;
                    for (var i = 0; i < mce.Arguments.Count; i++)
                    {
                        if (parameters == null)
                        {
                            parameters = new object[mce.Arguments.Count];
                        }
                        var param = ExpressionRouter(mce.Arguments[i], tableAlias);//data为方法的参数值.
                        if (param is string && param != null && param.ToString().StartsWith("'") && param.ToString().EndsWith("'"))
                        {
                            //还原字符串(还原单引号)
                            param = param.ToString().Substring(1);//去掉开始单引号
                            param = param.ToString().Substring(0, param.ToString().Length - 1);//去掉结束单引号
                            param = param.ToString().Replace("''", "'");
                        }
                        parameters[i] = param;

                    }

                    object val = null;
                    if (mce.Method.IsStatic)
                    {
                        val = mce.Method.Invoke(null, parameters);
                    }
                    else
                    {
                        var me = mce.Object as MemberExpression;
                        var constExp = me.Expression as ConstantExpression;
                        var instance = GetConstantExpressionValue(constExp, me.Member.Name);
                        val = mce.Method.Invoke(instance, parameters);
                    }

                    if (val == null)
                    {
                        return null;
                    }
                    if (val is string)
                    {
                        return val.ToString().Replace("'", "''");
                    }
                    return val;//val是ValueType,不要.ToString(),否则判断类型时会把ValueType当作string处理.
                }
            }
            else if (exp is ConstantExpression)
            {
                ConstantExpression ce = ((ConstantExpression)exp);
                if (ce.Value == null)
                {
                    //return "null";
                    return null;
                }
                else if (ce.Value is ValueType)
                {
                    if (ce.Value is bool)
                    {
                        //return Convert.ToInt32(ce.Value).ToString();
                        return Convert.ToInt32(ce.Value);
                    }
                    //return ce.Value.ToString();
                    return ce.Value;
                }
                else if (ce.Value is string || ce.Value is DateTime || ce.Value is char)
                {
                    //return string.Format("'{0}'", ce.Value.ToString());
                    return string.Format("'{0}'", ce.Value.ToString().Replace("'", "''"));//by lls,防sql注入.
                }
                else if (ce.Value is IEnumerable)
                {
                    var values = ce.Value as IEnumerable;
                    var strIn = string.Empty;
                    foreach (var val in values)
                    {
                        if (val.GetType().IsValueType)
                        {
                            strIn += "," + val;
                        }
                        else
                        {
                            strIn += ",'" + val + "'";//val为string类型
                        }
                    }
                    if (!string.IsNullOrWhiteSpace(strIn))
                    {
                        strIn = strIn.Substring(1);
                        strIn = "(" + strIn + ")";
                    }
                    return strIn;
                }
            }
            else if (exp is UnaryExpression)
            {
                UnaryExpression ue = ((UnaryExpression)exp);
                //return ExpressionRouter(ue.Operand);
                if (ue.NodeType == ExpressionType.Not && (ue.Operand is MemberExpression) && ue.Operand.Type == typeof(bool))
                {
                    return "(" + ExpressionRouter(ue.Operand, tableAlias) + "=0)";
                }
                //return ExpressionTypeCast(ue.NodeType) + ExpressionRouter(ue.Operand, tableAlias);
                var typeCast = ExpressionTypeCast(ue.NodeType);
                var val = ExpressionRouter(ue.Operand, tableAlias);
                if (typeCast == null && val == null)//null+null=""
                {
                    return null;
                }
                return typeCast + val;
            }
           
            return null;
        }

        static string ExpressionTypeCast(ExpressionType type)
        {
            switch (type)
            {
                case ExpressionType.And:
                case ExpressionType.AndAlso:
                    return " AND ";
                case ExpressionType.Equal:
                    return " =";
                case ExpressionType.GreaterThan:
                    return " >";
                case ExpressionType.GreaterThanOrEqual:
                    return ">=";
                case ExpressionType.LessThan:
                    return "<";
                case ExpressionType.LessThanOrEqual:
                    return "<=";
                case ExpressionType.NotEqual:
                    return "<>";
                case ExpressionType.Or:
                case ExpressionType.OrElse:
                    return " Or ";
                case ExpressionType.Add:
                case ExpressionType.AddChecked:
                    return "+";
                case ExpressionType.Subtract:
                case ExpressionType.SubtractChecked:
                    return "-";
                case ExpressionType.Divide:
                    return "/";
                case ExpressionType.Multiply:
                case ExpressionType.MultiplyChecked:
                    return "*";
                case ExpressionType.Not://by lls
                    return "Not";
                default:
                    return null;
            }
        }
    }
}
