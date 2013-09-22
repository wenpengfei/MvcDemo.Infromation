using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Reflection;
using System.Data.Linq;
using System.Linq.Expressions;
using Framework.Extensions;
using Framework.Data.Linq;
using System.Data.Linq.Mapping;
using Framework.WebControls.Mvc;

namespace Framework.Data
{
    public abstract class DataAccess<TModel, TKey>
        where TModel : ModelBase<TModel, TKey>, new()
    {
        private Database _db;
        //public virtual Database db
        public Database db
        {
            get
            {
                if (_db == null)
                {
                    var customAttributes = typeof(TModel).GetCustomAttributes(typeof(System.Data.Linq.Mapping.DatabaseAttribute), false);
                    if (customAttributes.Length > 0)
                    {
                        var dbName = (customAttributes[0] as System.Data.Linq.Mapping.DatabaseAttribute).Name;
                        if (!(string.IsNullOrEmpty(dbName)||string.IsNullOrEmpty(dbName.Trim())))
                        {
                            _db = DatabaseFactory.CreateDatabase(dbName);
                        }
                    }
                    if (_db == null)
                    {
                        _db = DatabaseManager.CreateDatabase();
                    }
                }
                return _db;
            }
        }

        private static string _tableName;
        public virtual string TableName
        {
            get
            {
                if (_tableName == null)
                {
                    _tableName = ((System.Data.Linq.Mapping.TableAttribute)
                      typeof(TModel).GetCustomAttributes(typeof(System.Data.Linq.Mapping.TableAttribute), false)[0]).Name;
                }
                return _tableName;
            }
        }

        private static string _primaryKeyName;
        public virtual string PrimaryKeyName
        {
            get
            {
                if (_primaryKeyName == null)
                {
                    PropertyInfo primaryProperty = typeof(TModel).GetProperties().FirstOrDefault((property) =>
                    {
                        var attributes = (ColumnAttribute[])property.GetCustomAttributes(typeof(ColumnAttribute), true);
                        var attrPrimary = attributes.FirstOrDefault(attr => attr.IsPrimaryKey);
                        return attrPrimary != null;
                    });
                    _primaryKeyName = primaryProperty.Name;
                }
                return _primaryKeyName;
            }
        }

        private static IEnumerable<KeyValuePair<string, Type>> _dbTableFields;
        public virtual IEnumerable<KeyValuePair<string, Type>> DbTableFields
        {
            get
            {
                if (_dbTableFields == null)
                {
                    string sql = "select top 1 * from " + TableName + "";
                    DbCommand cmd = db.GetSqlStringCommand(sql);
                    DataTable dt = db.ExecuteDataSet(cmd).Tables[0];
                    Dictionary<string,Type> dic = new Dictionary<string, Type>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        dic.Add(col.ColumnName, col.DataType);
                    }
                    _dbTableFields = dic;
                }
                return _dbTableFields;

            }
        }

        #region 插入
        public virtual TModel Insert(TModel instance)
        {
            if (instance == null)
            {
                return null;
            }
            var collection = this.Insert(new List<TModel>(){instance});
            return collection.First();
        }

        public abstract List<TModel> Insert(List<TModel> instances);
        #endregion

        #region 删除
        public virtual TModel Delete(TModel instance)
        {
            if (instance == null)
            {
                return null;
            }
            string sql = "delete from " + TableName + " where " + PrimaryKeyName + "=@" + PrimaryKeyName + "";

            DbType PrimaryType = typeof(TKey).ToDbType();
            object PrimaryValue = instance.GetValue(PrimaryKeyName) ?? DBNull.Value;


            DbCommand cmd = db.GetSqlStringCommand(sql);
            db.AddInParameter(cmd, "@" + PrimaryKeyName, PrimaryType, PrimaryValue);
            db.ExecuteNonQuery(cmd);

            //return (TModel)instance;
            return instance;
        }

        public virtual List<TModel> Delete(List<TModel> instances)
        {
            if (instances == null)
            {
                return null;
            }

            //List<TModel> Ret = new List<TModel>();

            if (instances.Count() > 0)
            {
                string sql = "delete from " + TableName + " where " + PrimaryKeyName + " in (";

                string temp = "";
                foreach (var obj in instances)
                {
                    if (obj == null)
                    {
                        continue;
                    }
                    temp += "," + obj.GetValue(PrimaryKeyName);
                    //Ret.Add(obj as TModel);
                }
                if (!(string.IsNullOrEmpty(temp)||string.IsNullOrEmpty(temp.Trim())))
                {
                    temp = temp.Substring(1);

                    sql += temp + ")";

                    DbCommand cmd = db.GetSqlStringCommand(sql);
                    db.ExecuteNonQuery(cmd);
                }
            }
            return instances.ToList();
        }

        public virtual int Delete(TKey PrimaryKey)
        {
            string sql = "delete from "+TableName+" where "+PrimaryKeyName+"=@"+PrimaryKeyName+"";
            
                DbCommand cmd = db.GetSqlStringCommand(sql);
                db.AddInParameter(cmd, "@" + PrimaryKeyName, typeof(TKey).ToDbType(), PrimaryKey);
                return db.ExecuteNonQuery(cmd);
            
            
        }

        public virtual int DeleteAll()
        {
            string sql = "delete from "+TableName+"";
            
                DbCommand cmd = db.GetSqlStringCommand(sql);
                return db.ExecuteNonQuery(cmd);
            
        }

        public virtual int DeleteAll(Expression<Func<TModel, bool>> predicate)
        {
            var strWhere = predicate.ToWhere(null);
            var sql = "delete from " + TableName + " where " + strWhere + "";
            return db.ExecuteNonQuery(CommandType.Text, sql);
        }
        #endregion

        #region 更新
        public virtual TModel Update(TModel instance)
        {
            DbCommand cmd = db.GetSqlStringCommand("a");//随便赋一个，因为参数不能为空

            string sql = "update " + TableName + " set ";
            PropertyInfo[] Properties = instance.GetType().GetProperties();

            var Fields = DbTableFields;
            string temp = "";

            foreach (var property in Properties)
            {
                if (property.Name.ToLower() == PrimaryKeyName.ToLower())
                {
                    continue;
                }
                foreach (var obj in Fields)
                {
                    //如果属性没有相应的数据库字段则不处理
                    if (obj.Key.Equals(property.Name, StringComparison.OrdinalIgnoreCase))
                    {
                        if (property.CanWrite&&property.CanRead)
                        {
                            temp += "," + property.Name + "=@" + property.Name + "";
                            var pValue = property.GetValue(instance, null);// instance.GetValue(property);
                            if (pValue == null || !pValue.GetType().IsEnum)
                            {
                                db.AddInParameter(cmd, "@" + property.Name, instance.GetPropertyDbType(property), pValue);
                            }
                            else
                            {
                                db.AddInParameter(cmd, "@" + property.Name, DbType.Int32, Convert.ToInt32(pValue));
                            }

                        }
                        break;
                    }
                }
            }
            if (temp != "")
            {
                temp = temp.Substring(1);
                sql += temp;
                sql += " where " + PrimaryKeyName + "=@" + PrimaryKeyName + "";

                db.AddInParameter(cmd, "@" + PrimaryKeyName, typeof(TKey).ToDbType(), instance.GetValue(PrimaryKeyName) ?? DBNull.Value);
                cmd.CommandText = sql;
                db.ExecuteNonQuery(cmd);

            }

            //return (TModel)instance;
            return instance;
        }

        public virtual List<TModel> Update(List<TModel> instances)
        {
            DbCommand cmd = db.GetSqlStringCommand("a");//随便赋一个，因为参数不能为空

            var sqlUpdate = string.Empty;
            for (var i=0;i<instances.Count();i++)
            {
                var instance = instances.ElementAt(i);
                string sql = "update " + TableName + " set ";
                PropertyInfo[] Properties = instance.GetType().GetProperties();

                var Fields = DbTableFields;
                string temp = "";

                foreach (var property in Properties)
                {
                    if (property.Name.ToLower() == PrimaryKeyName.ToLower())
                    {
                        continue;
                    }
                    foreach (var obj in Fields)
                    {
                        //如果属性没有相应的数据库字段则不处理
                        if (obj.Key.Equals(property.Name, StringComparison.OrdinalIgnoreCase))
                        {
                            if (property.CanWrite && property.CanRead)
                            {
                                temp += "," + property.Name + "=@" + property.Name + ""+i+"";
                                var pValue = property.GetValue(instance, null); //instance.GetValue(property);
                                if (pValue == null || !pValue.GetType().IsEnum)
                                {
                                    db.AddInParameter(cmd, "@" + property.Name+i, instance.GetPropertyDbType(property), pValue);
                                }
                                else
                                {
                                    db.AddInParameter(cmd, "@" + property.Name+i, DbType.Int32, Convert.ToInt32(pValue));
                                }

                            }
                            break;
                        }
                    }
                }
                if (temp != "")
                {
                    temp = temp.Substring(1);
                    sql += temp;
                    sql += " where " + PrimaryKeyName + "=@" + PrimaryKeyName + ""+i+"";
                    db.AddInParameter(cmd, "@" + PrimaryKeyName+i, typeof(TKey).ToDbType(), instance.GetValue(PrimaryKeyName) ?? DBNull.Value);
                    sqlUpdate += ";" + sql;
                    //cmd.CommandText = sql;
                    //db.ExecuteNonQuery(cmd);

                }

            }
            if (!(string.IsNullOrEmpty(sqlUpdate)||string.IsNullOrEmpty(sqlUpdate)))
            {
                sqlUpdate = sqlUpdate.Substring(1);
                cmd.CommandText = sqlUpdate;
                db.ExecuteNonQuery(cmd);
            }
            //return instances.Select(item=>(TModel)item);
            return instances;
        }
        #endregion

        #region Select
        public virtual TModel Select(TKey PrimaryKey)
        {
            string sql = "select * from " + TableName + " where " + PrimaryKeyName + "=@" + PrimaryKeyName + "";
            DbCommand cmd = db.GetSqlStringCommand(sql);
            db.AddInParameter(cmd, "@" + PrimaryKeyName, typeof(TKey).ToDbType(), PrimaryKey);
            DataTable dt = db.ExecuteDataSet(cmd).Tables[0];
            if (dt.Rows.Count < 1)
            {
                return null;
            }
            var Objects = dt.ToEntities<TModel>();
            return Objects.FirstOrDefault();
        }

        public virtual TModel Select(string SqlQuery)
        {
            DbCommand cmd = db.GetSqlStringCommand(SqlQuery);
            DataTable dt = db.ExecuteDataSet(cmd).Tables[0];
            var Objects = dt.ToEntities<TModel>();
            return Objects.FirstOrDefault();
        }

        public virtual TModel Select(Expression<Func<TModel, bool>> predicate, Ordered<TModel, TKey> orderBy = null)
        {
            var strWhere = predicate.ToWhere(null);
            var sqlQuery = "select top 1 * from " + TableName + " where " + strWhere + "";
            if (orderBy != null)
            {
                sqlQuery += " " + orderBy.OrderBySql + "";
            }
            return Select(sqlQuery);
        }

        public virtual TModel Select(Dictionary<string, string> condition, Ordered<TModel, TKey> orderBy = null)
        {
            var sqlQuery = "select * from "+TableName+"";
            sqlQuery += this.ToSql(condition, orderBy);
            return this.Select(sqlQuery);
        }
        #endregion
        
        #region SelectAll
        public virtual List<TModel> SelectAll(int? Skip=null, int? Take = null)
        {
            string sqlQuery = string.Empty;
            DbCommand cmd = null;
            DataTable dt = null;
            if (Skip == null && Take == null)
            {
                sqlQuery = "select * from " + TableName + "";
                cmd = db.GetSqlStringCommand(sqlQuery);
                dt = db.ExecuteDataSet(cmd).Tables[0];
                return dt.ToEntities<TModel>();
            }

            string sql = "select * from";
            sql += "(";
            sql += "select ROW_NUMBER() Over(order by ["+PrimaryKeyName+"]) as RowNumber,* from "+TableName+"";
            sql += ") t1 where t1.RowNumber";
            if (Skip != null && Take != null)
            {
                var rowNumberStart = Skip + 1;
                var rowNumberEnd = Skip + Take;
                sql += " between " + rowNumberStart + " and " + rowNumberEnd + "";
            }
            else if (Skip != null && Take == null)
            {
                var rowNumberStart = Skip;
                sql += ">" + rowNumberStart + "";
            }
            else
            {
                var rowNumberEnd = Take + 1;
                sql += "<" + rowNumberEnd + "";
            }

            cmd = db.GetSqlStringCommand(sql);
            dt = db.ExecuteDataSet(cmd).Tables[0];
            return dt.ToEntities<TModel>();

        }

        public virtual List<TModel> SelectAll(string SqlQuery, int? Skip = null, int? Take = null)
        {
            DbCommand cmd = null;
            DataTable dt = null;
            if (Skip == null && Take == null)
            {
                cmd = db.GetSqlStringCommand(SqlQuery);
                dt = db.ExecuteDataSet(cmd).Tables[0];
                return dt.ToEntities<TModel>();
            }

            SqlQuery = SqlQuery.Trim();

            string OrderBy = SqlQuery.GetOrderBy();
            if (string.IsNullOrEmpty(OrderBy)||string.IsNullOrEmpty(OrderBy.Trim()))
            {
                OrderBy = "order by [" + PrimaryKeyName + "] ";
            }
            string sql = "select * from";
            sql += "(";
            sql += "select top 100 percent ROW_NUMBER() Over(" + OrderBy + ") as RowNumber,* from";
            sql += "(";
            sql += "select top 100 percent " + SqlQuery.Substring(6);
            sql += ") t0";
            sql += ") t1 where t1.RowNumber";
            if (Skip!=null&&Take != null)
            {
                var rowNumberStart = Skip + 1;
                var rowNumberEnd = Skip + Take;
                sql += " between " + rowNumberStart + " and " + rowNumberEnd + "";
            }
            else if (Skip != null && Take == null)
            {
                var rowNumberStart = Skip;
                sql += ">" + rowNumberStart + "";
            }
            else
            {
                var rowNumberEnd = Take+1;
                sql += "<" + rowNumberEnd + "";
            }

            cmd = db.GetSqlStringCommand(sql);
            dt = db.ExecuteDataSet(cmd).Tables[0];

            return dt.ToEntities<TModel>();
        }

        public virtual List<TModel> SelectAll(Expression<Func<TModel, bool>> predicate, Ordered<TModel, TKey> orderBy = null, int? Skip=null, int? Take = null)
        {
            var sqlQuery = predicate.ToSql();
            if (orderBy != null)
            {
                sqlQuery += " " + orderBy.OrderBySql + "";
            }
            return SelectAll(sqlQuery, Skip, Take);
        }

        public virtual List<TModel> SelectAll(Dictionary<string, string> condition,Ordered<TModel, TKey> orderBy = null, int? Skip = null, int? Take = null)
        {
            var sqlQuery = "select * from " + TableName + "";
            sqlQuery += this.ToSql(condition, orderBy);
            return this.SelectAll(sqlQuery,Skip,Take);
        }
        #endregion

        #region SelectTop
        public virtual List<TModel> SelectTop(int ItemCount, Ordered<TModel, TKey> orderBy = null)
        {
            string sqlQuery = "select top " + ItemCount + " * from " + TableName + "";
            if (orderBy != null)
            {
                sqlQuery += " " + orderBy.OrderBySql + "";
            }
            DbCommand cmd = db.GetSqlStringCommand(sqlQuery);
            DataTable dt = db.ExecuteDataSet(cmd).Tables[0];
            var Objects = dt.ToEntities<TModel>();
            return Objects;
        }

        public virtual List<TModel> SelectTop(string SqlQuery, int ItemCount)
        {//如果使用select top n,SqlQuery有Order By时，嵌套时要同时指定top，这样反而很麻烦。
            return SelectAll(SqlQuery, 0, ItemCount);
        }

        public virtual List<TModel> SelectTop(Expression<Func<TModel, bool>> predicate, int ItemCount, Ordered<TModel, TKey> orderBy = null)
        {
            var strWhere = predicate.ToWhere(null);
            var sqlQuery = "select top "+ItemCount+" * from " + TableName + " where " + strWhere + "";
            if (orderBy != null)
            {
                sqlQuery += " " + orderBy.OrderBySql + "";
            }
            return SelectAll(sqlQuery);
        }

        public virtual List<TModel> SelectTop(Dictionary<string, string> condition, int ItemCount, Ordered<TModel, TKey> orderBy = null)
        {
            var sqlQuery = "select * from " + TableName + "";
            sqlQuery += this.ToSql(condition, orderBy);
            return this.SelectTop(sqlQuery, ItemCount);
        }
        #endregion

        #region SelectPaging
        public virtual PagedList<TModel> SelectPaging(int PageSize, int PageIndex, int? TotalCount = null)
        {
            int RowNumberStart = PageSize * PageIndex + 1;

            int RowNumberEnd = PageSize * PageIndex + PageSize;

            string sql = "select * from";
            sql += "(";
            sql += "select ROW_NUMBER() Over(order by [" + PrimaryKeyName + "]) as RowNumber,* from " + TableName + "";
            sql += ") t1 where t1.RowNumber between  " + RowNumberStart + " and " + RowNumberEnd + "";
            if (TotalCount == null)
            {
                sql += ";select count(*) from " + TableName + "";
            }

            DbCommand cmd = db.GetSqlStringCommand(sql);
            DataSet ds = db.ExecuteDataSet(cmd);
            var Objects = ds.Tables[0].ToEntities<TModel>();
            if (TotalCount == null)
            {
                TotalCount = Convert.ToInt32(ds.Tables[1].Rows[0][0]);
            }
            return new PagedList<TModel>(Objects, PageIndex + 1, PageSize, TotalCount.Value);
        }

        public virtual PagedList<TModel> SelectPaging(string SqlQuery, int PageSize, int PageIndex, int? TotalCount = null)
        {
            SqlQuery = SqlQuery.Trim();

            int RowNumberStart = PageSize * PageIndex + 1;
            int RowNumberEnd = PageSize * PageIndex + PageSize;
            string OrderBy = SqlQuery.GetOrderBy();
            if (string.IsNullOrEmpty(OrderBy)||string.IsNullOrEmpty(OrderBy.Trim()))
            {
                OrderBy = "order by [" + PrimaryKeyName + "] ";
            }
            string sql = "select * from";
            sql += "(";
            sql += "select top 100 percent ROW_NUMBER() Over(" + OrderBy + ") as RowNumber,* from";
            sql += "(";
            sql += "select top 100 percent " + SqlQuery.Substring(6);
            sql += ") t0";
            sql += ") t1 where t1.RowNumber between " + RowNumberStart + " and " + RowNumberEnd + "";

            if (TotalCount == null)
            {
                string temp = "select top 100 percent " + SqlQuery.Substring(6);
                string sqlTotal = "select COUNT(*) from";
                sqlTotal += "(";
                sqlTotal += "select top 100 percent * from";
                sqlTotal += "(";
                sqlTotal += temp;
                sqlTotal += ") t0";
                sqlTotal += ") t1";
                sql += ";" + sqlTotal + "";
            }
            DbCommand cmd = db.GetSqlStringCommand(sql);

            DataSet ds = db.ExecuteDataSet(cmd);
            var Objects = ds.Tables[0].ToEntities<TModel>();
            if (TotalCount == null)
            {
                TotalCount = Convert.ToInt32(ds.Tables[1].Rows[0][0]);
            }
            return new PagedList<TModel>(Objects, PageIndex + 1, PageSize, TotalCount.Value);
        }

        public virtual PagedList<TModel> SelectPaging(Expression<Func<TModel, bool>> predicate, int PageSize, int PageIndex, Ordered<TModel, TKey> orderBy = null, int? TotalCount = null)
        {
            var sqlQuery = predicate.ToSql();
            if (orderBy != null)
            {
                sqlQuery += " " + orderBy.OrderBySql + "";
            }

            sqlQuery = sqlQuery.Trim();

            int RowNumberStart = PageSize * PageIndex + 1;
            int RowNumberEnd = PageSize * PageIndex + PageSize;
            string OrderBy = sqlQuery.GetOrderBy();
            if (string.IsNullOrEmpty(OrderBy)||string.IsNullOrEmpty(OrderBy.Trim()))
            {
                OrderBy = "order by [" + PrimaryKeyName + "] ";
            }
            string sql = "select * from";
            sql += "(";
            sql += "select top 100 percent ROW_NUMBER() Over(" + OrderBy + ") as RowNumber,* from";
            sql += "(";
            sql += "select top 100 percent " + sqlQuery.Substring(6);
            sql += ") t0";
            sql += ") t1 where t1.RowNumber between " + RowNumberStart + " and " + RowNumberEnd + "";

            if (TotalCount == null)
            {
                string temp = "select top 100 percent " + sqlQuery.Substring(6);
                string sqlTotal = "select COUNT(*) from";
                sqlTotal += "(";
                sqlTotal += "select top 100 percent * from";
                sqlTotal += "(";
                sqlTotal += temp;
                sqlTotal += ") t0";
                sqlTotal += ") t1";
                sql += ";" + sqlTotal + "";
            }
            DbCommand cmd = db.GetSqlStringCommand(sql);

            DataSet ds = db.ExecuteDataSet(cmd);
            var Objects = ds.Tables[0].ToEntities<TModel>();
            if (TotalCount == null)
            {
                TotalCount = Convert.ToInt32(ds.Tables[1].Rows[0][0]);
            }
            return new PagedList<TModel>(Objects, PageIndex + 1, PageSize, TotalCount.Value);
        }

        public virtual PagedList<TModel> SelectPaging(Dictionary<string, string> condition, int PageSize, int PageIndex,Ordered<TModel, TKey> orderBy = null, int? TotalCount = null)
        {
            var sqlQuery = "select * from " + TableName + "";
            sqlQuery += this.ToSql(condition,orderBy);
            return this.SelectPaging(sqlQuery, PageSize, PageIndex, TotalCount);
        }
        #endregion

        #region RecordCount
        public virtual int RecordCount()
        {
            string sql = "select count(*) from " + TableName + "";
            DbCommand cmd = db.GetSqlStringCommand(sql);
            return (int)db.ExecuteScalar(cmd);
        }
        public virtual int RecordCount(string SqlQuery)
        {
            SqlQuery = SqlQuery.Trim();
            SqlQuery = "select top 100 percent " + SqlQuery.Substring(6);

            string sql = "select COUNT(*) from";
            sql += "(";
            sql += "select top 100 percent * from";
            sql += "(";
            sql += SqlQuery;
            sql += ") t0";
            sql += ") t1";

            DbCommand cmd = db.GetSqlStringCommand(sql);
            return (int)db.ExecuteScalar(cmd);
        }
        public virtual int RecordCount(Expression<Func<TModel, bool>> predicate)
        {
            var sqlQuery = "select count(*) from " + TableName + " where "+predicate.ToWhere(null)+"";
            return (int)db.ExecuteScalar(CommandType.Text,sqlQuery);
        }
        public virtual int RecordCount(Dictionary<string, string> condition)
        {
            var sqlQuery = "select * from " + TableName + "";
            sqlQuery += this.ToSql(condition,null);
            return this.RecordCount(sqlQuery);
        }
        #endregion

        #region Helper
        private string ToSql(Dictionary<string, string> condition, Ordered<TModel, TKey> orderBy)
        {
            var sql = string.Empty;
            if (condition!=null||condition.Count>0)
            {
                var bWhere = false;
                foreach (var kv in condition)
                {
                    if (!bWhere)
                    {
                        sql += " where";
                        bWhere = true;
                    }
                    sql += " " + kv.Key + "" + kv.Value + "";
                }
            }
            if (orderBy != null)
            {
                sql += " " + orderBy.OrderBySql + "";
            }
            return sql;
        }
        #endregion
    }
}
