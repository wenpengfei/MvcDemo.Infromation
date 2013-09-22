using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Collections.Specialized;
using System.Data.Common;
using System.Threading;
using Framework.Data;
using System.Runtime.Serialization;
using System.Linq.Expressions;
using System.Collections;
using Framework.Business;
using Framework.Data.Linq;
using System.Data;
using Framework.WebControls.Mvc;
using System.Diagnostics;

namespace Framework
{
    /*注意:..net 3.5中页面上调用带默认参数的方法并且没有给默认参数赋值是会报编译错误,在.cs中写没问题.*/

    /// <summary>
    /// 注意事项：1、子类中最好不要重写有关增、删、改的方法，最好在DataAccess的子类中重写
    /// (如果子类中重写则不会自动引发OnAnySaving和OnAnySaved事件，需要手动引发，在DataAccess的子类中重写则会自动引发)
    /// </summary>
    /// <typeparam name="TYPE"></typeparam>
    /// <typeparam name="KEY"></typeparam>
    [Serializable]
    [DataContract]//使用DataContractJsonSerializer系列化时需要,如果去掉ModelBase中的属性名会系列化为"<属性名>k__BackingField"这种样子.
    //public abstract class ModelBase<TYPE, KEY> : IDataErrorInfo, INotifyPropertyChanged, IChangeTracking, IDisposable, IModel,IModel<TYPE,KEY>
    //    where TYPE : ModelBase<TYPE, KEY>, new()
    public abstract class ModelBase<TModel, TKey> :INotifyPropertyChanged,IModel
    where TModel : ModelBase<TModel, TKey>, new()
    {
        #region 说明
        //除Find和FindAll外，不推荐使用static方法，因为static方法还没有定义相关事件，如Saving、Saved事件。
        //分页问题？？？
        #endregion

        public ModelBase()
        {
            //_Provider = GetProvider();//反序列化时，构造函数有时不会被调用.
        }
        public TModel MemberwiseClone()
        {
            return this.MemberwiseClone() as TModel;
        }
        public static Ordered<TModel, Key> OrderBy<Key>(Expression<Func<TModel, Key>> keySelector)
        {
            var me = keySelector.Body as MemberExpression;
            if (me != null && me.NodeType == ExpressionType.MemberAccess)
            {
                var sql = "order by " + me.Member.Name + " asc";
                var orderBy = new Ordered<TModel, Key>();
                orderBy.OrderBySql = sql;
                return orderBy;
            }
            throw new Exception("排序表达式错误");
        }

        public static Ordered<TModel, Key> OrderByDescending<Key>(Expression<Func<TModel, Key>> keySelector)
        {
            var me = keySelector.Body as MemberExpression;
            if (me != null && me.NodeType == ExpressionType.MemberAccess)
            {
                var sql = "order by " + me.Member.Name + " desc";
                var orderBy = new Ordered<TModel, Key>();
                orderBy.OrderBySql = sql;
                return orderBy;
            }
            throw new Exception("排序表达式错误");
        }

        #region 属性
        //protected bool IsAuthenticated
        //{
        //    get
        //    {
        //        return Thread.CurrentPrincipal.Identity.IsAuthenticated;
        //    }
        //}

        private static readonly DataQuery<TModel> _DataQuery = new DataQuery<TModel>();//Linq查询的入口.
        public static readonly IQueryable<TModel> Entities =from item in _DataQuery select item;//Linq查询的入口.

        public IQueryable<TModel> Query
        {
            get
            {
                return Entities;
            }
        }

        [NonSerialized]
        private static TModel _singleton = new TModel();
        /// <summary>
        /// 表示空对象.
        /// </summary>
        public static TModel Singleton
        {
            get
            {
                return _singleton;
            }
        }
        public virtual TModel GetSingleton()
        {
            return Singleton;
        }
        /// <summary>
        /// 查询记录集时，保存ROW_NUMBER.
        /// </summary>
        [DataMember]//如果去掉，使用DataContractJsonSerializer系列化时不会被系列化.
        public Int64 RowNumber
        {
            get;
            internal set;
        }
        #endregion

        [NonSerialized]
        private DataAccess<TModel, TKey> _dataAccess;
        public DataAccess<TModel, TKey> DataAccess
        {
            get
            {
                if (_dataAccess == null)
                {
                    _dataAccess = GetProvider();
                }
                return _dataAccess;
            }
        }

        private static string _tableName;
        public string TableName
        {
            get
            {
                if (_tableName == null)
                {
                    _tableName = new TModel().DataAccess.TableName;
                }
                return _tableName;
            }
        }

        private static string _primaryKeyName;
        public static string PrimaryKeyName
        {
            get
            {
                if (_primaryKeyName == null)
                {
                    _primaryKeyName = new TModel().DataAccess.PrimaryKeyName;
                }
                return _primaryKeyName;
            }
        }

        protected abstract DataAccess<TModel, TKey> GetProvider();//只允许在构造函数中使用一次:_Provider = GetProvider();
        //如果多次使用，子类都new一个DataAccess,使得定阅的事件无效。

        public static bool IsNullOrSingleton(TModel instance)
        {
            return instance == null || instance == Singleton;
        }
        public static bool IsSingleton(TModel instance)
        {
            return instance == Singleton;
        }

        #region 增、删、改

        #region 插入
        public virtual TModel Insert()
        {
            RaiseSaving(this, SaveAction.Insert);
            if (!EventSaving.Cancel)
            {
                TModel instance = DataAccess.Insert(this as TModel);
                RaiseSaved(instance, SaveAction.Insert);
                return instance;
                //注意：经测试，不能返回(TYPE)this,否则可能会出现错误："由于以前的函数求值超时，函数求值被禁用。必须继续执行才能重新启用函数求值",
                //出现这种情况的根本原因是：DataAccess.Insert()中，可能会对传入的对象赋值新的对象，如,在DataAccess.Insert()中这样：
                //Post post=instance as Post;//post是this (instance是DataAccess.Insert()中的参数this)
                //post=new Post();或者 post=Select(post.PostId);//关键就在这里，如果发生这种情况,post已经被赋新值了，已经不是this了。
                //retu post//post已经不是this了。
            }
            return (TModel)this;
        }
        public virtual List<TModel> DataInsert(List<TModel> instances)
        {
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }

            foreach (var item in instances)
            {
                //item.RaiseSaving(item, SaveAction.Insert);
                RaiseSaving(item, SaveAction.Insert);
            }

            var retList = instances.Where(item => item.EventSaving.Cancel).ToList();

            var collection = instances.Where(item => !item.EventSaving.Cancel).ToList();
            collection= DataAccess.Insert(collection);
            foreach (var item in collection)
            {
                RaiseSaved(item, SaveAction.Insert);
                retList.Add(item);
            }

            return retList;
        }
        #endregion

        #region 更新
        public virtual TModel Update()
        {
            RaiseSaving(this, SaveAction.Update);
            if (!EventSaving.Cancel)
            {
                TModel instance = DataAccess.Update(this as TModel);
                RaiseSaved(this, SaveAction.Update);
                return instance;//注意：不能返回(TYPE)this。
            }
            return (TModel)this;
        }

        public virtual List<TModel> DataUpdate(List<TModel> instances)
        {
            return DataAccess.Update(instances);
        }
        #endregion

        #region 删除
        public virtual TModel Delete()
        {
            RaiseSaving(this, SaveAction.Delete);
            if (!EventSaving.Cancel)
            {
                TModel instance = DataAccess.Delete(this as TModel);
                RaiseSaved(this, SaveAction.Delete);
                return instance;//注意：不能返回(TYPE)this。
            }
            return (TModel)this;
        }
        public virtual List<TModel> DataDelete(List<TModel> instances)
        {
            if (instances == null || instances.Count == 0)
            {
                return instances;
            }
            foreach (var model in instances)
            {
                RaiseSaving(model, SaveAction.Delete);
            }
            //RaiseSaving(instances, SaveAction.Delete);
            var Ret = DataAccess.Delete(instances);
            foreach (var model in Ret)
            {
                RaiseSaved(model, SaveAction.Delete);
            }
            //RaiseSaved(instances, SaveAction.Delete);
            return Ret;
        }
        public virtual int DataDelete(TKey PrimaryKey)
        {
            RaiseSaving(null, SaveAction.Delete);
            var Ret = DataAccess.Delete(PrimaryKey);
            RaiseSaved(null, SaveAction.Delete);
            return Ret;
        }
        
        public virtual int DataDelete(object[] PrimaryKeys)//该方法主要为Ajax调用提供方便.
        {
            if (PrimaryKeys == null||PrimaryKeys.Length==0)
            {
                return 0;
            }

            var assets = PrimaryKeys.Select(item => item is TKey);
            Debug.Assert(assets.Where(item => item == false).Count() == 0);

            var keys = PrimaryKeys.Select(item => (TKey)item).ToList();
            var ids=string.Empty;
            foreach(var key in keys)
            {
                if (key is string)
                {
                    ids += ",'" + key + "'";
                }
                else
                {
                    ids += "," + key + "";
                }
            }
            ids=ids.Substring(1);
            var sql="delete from "+TableName+" where "+PrimaryKeyName+" in ("+ids+")";
            return DataAccess.db.ExecuteNonQuery(CommandType.Text, sql);
        }

        public virtual int DataDeleteAll()
        {
            RaiseSaving(null, SaveAction.Delete);
            var Ret = DataAccess.DeleteAll();
            RaiseSaved(null, SaveAction.Delete);
            return Ret;
        }

        public virtual int DataDeleteAll(Expression<Func<TModel, bool>> predicate)
        {
            RaiseSaving(null, SaveAction.Delete);
            var Ret = DataAccess.DeleteAll(predicate);
            RaiseSaved(null, SaveAction.Delete);
            return Ret;
        }
        
        #endregion

        #endregion

        #region 查询

        #region Select
        public virtual TModel DataSelect(TKey PrimaryKey)
        {
            var model=DataAccess.Select(PrimaryKey);
            RaiseQueried(model);
            return model;
        }
        public virtual TModel DataSelect(string SqlQuery)
        {
            var model=DataAccess.Select(SqlQuery);
            RaiseQueried(model);
            return model;
        }
        public virtual TModel DataSelect(Expression<Func<TModel, bool>> expression, Ordered<TModel, TKey> orderBy/* = null*/)
        {
            var model=DataAccess.Select(expression,orderBy);
            RaiseQueried(model);
            return model;
        }
        public virtual TModel DataSelect(Expression<Func<TModel, bool>> expression)
        {
            return this.DataSelect(expression, null);
        }
        public virtual TModel DataSelect(Dictionary<string, string> condition, Ordered<TModel, TKey> orderBy/* = null*/)
        {
            var model=DataAccess.Select(condition,orderBy);
            RaiseQueried(model);
            return model;
        }
        public virtual TModel DataSelect(Dictionary<string, string> condition)
        {
            return this.DataSelect(condition, null);
        }
        #endregion

        #region SelectAll
        public virtual List<TModel> DataSelectAll(int? Skip/*=null*/, int? Take/* = null*/)
        {
            var models=DataAccess.SelectAll(Skip, Take);
            foreach (var model in models)
            {
                RaiseQueried(model);
            }
            //RaiseQueried(new QueriedEventArgs(models));
            return models;
        }
        public virtual List<TModel> DataSelectAll()
        {
            int? skip = null;
            int? take = null;
            return this.DataSelectAll(skip, take);
        }
        public virtual List<TModel> DataSelectAll(int? Skip)
        {
            return this.DataSelectAll(Skip, null);
        }
        public virtual List<TModel> DataSelectAll(string SqlQuery, int? Skip/* = null*/, int? Take/* = null*/)
        {
            var models=DataAccess.SelectAll(SqlQuery, Skip, Take);
            foreach (var model in models)
            {
                RaiseQueried(model);
            }
            //RaiseQueried(new QueriedEventArgs(models));
            return models;
        }
        public virtual List<TModel> DataSelectAll(string SqlQuery)
        {
            return this.DataSelectAll(SqlQuery, null, null);
        }
        public virtual List<TModel> DataSelectAll(string SqlQuery, int? Skip)
        {
            return this.DataSelectAll(SqlQuery, Skip, null);
        }

        public virtual List<TModel> DataSelectAll(Expression<Func<TModel, bool>> predicate, Ordered<TModel, TKey> orderBy/* = null*/, int? Skip/* = null*/, int? Take/* = null*/)
        {
            var models=DataAccess.SelectAll(predicate, orderBy,Skip, Take);
            foreach (var model in models)
            {
                RaiseQueried(model);
            }
            //RaiseQueried(new QueriedEventArgs(models));
            return models;
        }
        public virtual List<TModel> DataSelectAll(Expression<Func<TModel, bool>> predicate)
        {
            return this.DataSelectAll(predicate, null, null, null);
        }
        public virtual List<TModel> DataSelectAll(Expression<Func<TModel, bool>> predicate, Ordered<TModel, TKey> orderBy)
        {
            return this.DataSelectAll(predicate, orderBy, null, null);
        }
        public virtual List<TModel> DataSelectAll(Expression<Func<TModel, bool>> predicate, Ordered<TModel, TKey> orderBy, int? Skip)
        {
            return this.DataSelectAll(predicate, orderBy, Skip, null);
        }


        public virtual List<TModel> DataSelectAll(Dictionary<string, string> condition,Ordered<TModel, TKey> orderBy/* = null*/, int? Skip/* = null*/, int? Take/* = null*/)
        {
            var models=DataAccess.SelectAll(condition,orderBy, Skip, Take);
            foreach (var model in models)
            {
                RaiseQueried(model);
            }
            //RaiseQueried(new QueriedEventArgs(models));
            return models;
        }
        public virtual List<TModel> DataSelectAll(Dictionary<string, string> condition)
        {
            return this.DataSelectAll(condition, null, null, null);
        }
        public virtual List<TModel> DataSelectAll(Dictionary<string, string> condition, Ordered<TModel, TKey> orderBy)
        {
            return this.DataSelectAll(condition, orderBy, null, null);
        }
        public virtual List<TModel> DataSelectAll(Dictionary<string, string> condition, Ordered<TModel, TKey> orderBy, int? Skip)
        {
            return this.DataSelectAll(condition, orderBy, Skip, null);
        }
        #endregion

        #region SelectTop
        public virtual List<TModel> DataSelectTop(int ItemCount, Ordered<TModel, TKey> orderBy/* = null*/)
        {
            var models=DataAccess.SelectTop(ItemCount,orderBy);
            foreach (var model in models)
            {
                RaiseQueried(model);
            }
            //RaiseQueried(new QueriedEventArgs(models));
            return models;
        }
        public virtual List<TModel> DataSelectTop(int ItemCount)
        {
            return this.DataSelectTop(ItemCount,null);
        }
        public virtual List<TModel> DataSelectTop(string SqlQuery, int ItemCount)
        {
            var models=DataAccess.SelectTop(SqlQuery, ItemCount);
            foreach (var model in models)
            {
                RaiseQueried(model);
            }
            //RaiseQueried(new QueriedEventArgs(models));
            return models;
        }
        public virtual List<TModel> DataSelectTop(Expression<Func<TModel, bool>> predicate, int ItemCount, Ordered<TModel, TKey> orderBy/* = null*/)
        {
            var models=DataAccess.SelectTop(predicate, ItemCount,orderBy);
            foreach (var model in models)
            {
                RaiseQueried(model);
            }
            //RaiseQueried(new QueriedEventArgs(models));
            return models;
        }
        public virtual List<TModel> DataSelectTop(Expression<Func<TModel, bool>> predicate, int ItemCount)
        {
            return this.DataSelectTop(predicate, ItemCount, null);
        }
        public virtual List<TModel> DataSelectTop(Dictionary<string, string> condition, int ItemCount, Ordered<TModel, TKey> orderBy/* = null*/)
        {
            var models=DataAccess.SelectTop(condition, ItemCount,orderBy);
            foreach (var model in models)
            {
                RaiseQueried(model);
            }
            //RaiseQueried(new QueriedEventArgs(models));
            return models;
        }
        public virtual List<TModel> DataSelectTop(Dictionary<string, string> condition, int ItemCount)
        {
            return this.DataSelectTop(condition, ItemCount, null);
        }
        #endregion

        #region SelectPaging
        public virtual PagedList<TModel> DataSelectPaging(int PageSize, int PageIndex, int? TotalCount/* = null*/)
        {
            var models=DataAccess.SelectPaging(PageSize, PageIndex,TotalCount);
            foreach (var model in models)
            {
                RaiseQueried(model);
            }
            //RaiseQueried(new QueriedEventArgs(models));
            return models;
        }
        public virtual PagedList<TModel> DataSelectPaging(int PageSize, int PageIndex)
        {
            return this.DataSelectPaging(PageSize, PageIndex, null);
        }
        public virtual PagedList<TModel> DataSelectPaging(string SqlQuery, int PageSize, int PageIndex, int? TotalCount/* = null*/)
        {
            var models=DataAccess.SelectPaging(SqlQuery,PageSize,PageIndex,TotalCount);
            foreach (var model in models)
            {
                RaiseQueried(model);
            }
            //RaiseQueried(new QueriedEventArgs(models));
            return models;
        }
        public virtual PagedList<TModel> DataSelectPaging(string SqlQuery, int PageSize, int PageIndex)
        {
            return this.DataSelectPaging(SqlQuery, PageSize, PageIndex,null);
        }
        public virtual PagedList<TModel> DataSelectPaging(Expression<Func<TModel, bool>> predicate, int PageSize, int PageIndex, Ordered<TModel, TKey> orderBy/* = null*/, int? TotalCount/* = null*/)
        {
            var models=DataAccess.SelectPaging(predicate, PageSize, PageIndex,orderBy,TotalCount);
            foreach (var model in models)
            {
                RaiseQueried(model);
            }
            //RaiseQueried(new QueriedEventArgs(models));
            return models;
        }
        public virtual PagedList<TModel> DataSelectPaging(Expression<Func<TModel, bool>> predicate, int PageSize, int PageIndex)
        {
            return this.DataSelectPaging(predicate, PageSize, PageIndex, null, null);
        }
        public virtual PagedList<TModel> DataSelectPaging(Expression<Func<TModel, bool>> predicate, int PageSize, int PageIndex, Ordered<TModel, TKey> orderBy)
        {
            return this.DataSelectPaging(predicate, PageSize, PageIndex, orderBy, null);
        }

        public virtual PagedList<TModel> DataSelectPaging(Dictionary<string, string> condition, int PageSize, int PageIndex,Ordered<TModel, TKey> orderBy/* = null*/, int? TotalCount/* = null*/)
        {
            var models=DataAccess.SelectPaging(condition, PageSize, PageIndex,orderBy, TotalCount);
            foreach (var model in models)
            {
                RaiseQueried(model);
            }
            //RaiseQueried(new QueriedEventArgs(models));
            return models;
        }
        public virtual PagedList<TModel> DataSelectPaging(Dictionary<string, string> condition, int PageSize, int PageIndex)
        {
            return this.DataSelectPaging(condition, PageSize, PageIndex, null, null);
        }
        public virtual PagedList<TModel> DataSelectPaging(Dictionary<string, string> condition, int PageSize, int PageIndex, Ordered<TModel, TKey> orderBy)
        {
            return this.DataSelectPaging(condition, PageSize, PageIndex, orderBy, null);
        }
        #endregion

        #region RecordCount
        public virtual int DataRecordCount()
        {
            return DataAccess.RecordCount();
        }
        public virtual int DataRecordCount(string SqlQuery)
        {
            return DataAccess.RecordCount(SqlQuery);
        }
        public virtual int DataRecordCount(Expression<Func<TModel, bool>> predicate)
        {
            return DataAccess.RecordCount(predicate);
        }
        public virtual int DataRecordCount(Dictionary<string, string> condition)
        {
            return DataAccess.RecordCount(condition);
        }
        #endregion

        #endregion
        //////////////////////////////////////////////////////////

        //////////////////////////////////////////////////////////
        #region 静态方法
        #region 插入
        public static TModel Insert(TModel instance)
        {
            return instance.Insert();
        }
        public static List<TModel> Insert(List<TModel> instances)
        {
            TModel Instance = new TModel();
            return Instance.DataInsert(instances);
        }
        #endregion

        #region 更新
        public static TModel Update(TModel instance)
        {
            return instance.Update();
        }

        public static List<TModel> Update(List<TModel> instances)
        {
            TModel Instance = new TModel();
            return Instance.DataUpdate(instances);
        }
        #endregion

        #region 删除
        public static TModel Delete(TModel instance)
        {
            return instance.Delete();
        }
        public static List<TModel> Delete(List<TModel> instances)
        {
            TModel Instance = new TModel();
            return Instance.DataDelete(instances);

        }
        public static int Delete(TKey PrimaryKey)
        {
            TModel Instance = new TModel();
            return Instance.DataDelete(PrimaryKey);
        }
        
        public static int DeleteAll()
        {
            TModel Instance = new TModel();
            return Instance.DataDeleteAll();
        }
        public static int DeleteAll(Expression<Func<TModel, bool>> predicate)
        {
            TModel Instance = new TModel();
            return Instance.DataDeleteAll(predicate);
        }
        #endregion

        #region 查询

        #region Select
        public static TModel Select(TKey PrimaryKey)
        {
            TModel Instance = new TModel();
            return Instance.DataSelect(PrimaryKey);
        }
        public static TModel Select(string SqlQuery)
        {
            TModel Instance = new TModel();
            return Instance.DataSelect(SqlQuery);
        }
        public static TModel Select(Expression<Func<TModel, bool>> predicate, Ordered<TModel, TKey> orderBy/* = null*/)
        {
            TModel Instance = new TModel();
            return Instance.DataSelect(predicate,orderBy);
        }
        public static TModel Select(Expression<Func<TModel, bool>> predicate)
        {
            return Select(predicate, null);
        }


        public static TModel Select(Dictionary<string, string> condition, Ordered<TModel, TKey> orderBy/* = null*/)
        {
            TModel Instance = new TModel();
            return Instance.DataSelect(condition,orderBy);
        }
        public static TModel Select(Dictionary<string, string> condition)
        {
            return Select(condition, null);
        }
        #endregion

        #region SelectAll
        public static List<TModel> SelectAll(int? Skip/*=null*/, int? Take/* = null*/)
        {
            TModel Instance = new TModel();
            return Instance.DataSelectAll(Skip, Take);
        }
        public static List<TModel> SelectAll()
        {
            int? skip = null;
            int? take = null;
            return SelectAll(skip, take);
        }
        public static List<TModel> SelectAll(int? Skip)
        {
            return SelectAll(Skip, null);
        }
        public static List<TModel> SelectAll(string SqlQuery, int? Skip/* = null*/, int? Take/* = null*/)
        {
            TModel Instance = new TModel();
            return Instance.DataSelectAll(SqlQuery, Skip, Take);
        }
        public static List<TModel> SelectAll(string SqlQuery)
        {
            return SelectAll(SqlQuery, null, null);
        }
        public static List<TModel> SelectAll(string SqlQuery, int? Skip)
        {
            return SelectAll(SqlQuery, Skip, null);
        }


        public static List<TModel> SelectAll(Expression<Func<TModel, bool>> predicate, Ordered<TModel, TKey> orderBy/* = null*/, int? Skip/* = null*/, int? Take/* = null*/)
        {
            return new TModel().DataSelectAll(predicate, orderBy,Skip, Take);
        }
        public static List<TModel> SelectAll(Expression<Func<TModel, bool>> predicate)
        {
            return SelectAll(predicate, null, null, null);
        }
        public static List<TModel> SelectAll(Expression<Func<TModel, bool>> predicate, Ordered<TModel, TKey> orderBy)
        {
            return SelectAll(predicate, orderBy, null, null);
        }
        public static List<TModel> SelectAll(Expression<Func<TModel, bool>> predicate, Ordered<TModel, TKey> orderBy, int? Skip)
        {
            return SelectAll(predicate, orderBy, Skip, null);
        }

        public static List<TModel> SelectAll(Dictionary<string, string> condition,Ordered<TModel, TKey> orderBy/* = null*/, int? Skip/* = null*/, int? Take/* = null*/)
        {
            return new TModel().DataSelectAll(condition,orderBy, Skip,Take);
        }
        public static List<TModel> SelectAll(Dictionary<string, string> condition)
        {
            return SelectAll(condition, null, null, null);
        }
        public static List<TModel> SelectAll(Dictionary<string, string> condition, Ordered<TModel, TKey> orderBy)
        {
            return SelectAll(condition, orderBy, null, null);
        }
        public static List<TModel> SelectAll(Dictionary<string, string> condition, Ordered<TModel, TKey> orderBy, int? Skip)
        {
            return SelectAll(condition, orderBy, Skip, null);
        }
        #endregion

        #region SelectTop
        public static List<TModel> SelectTop(int ItemCount, Ordered<TModel, TKey> orderBy/* = null*/)
        {
            TModel Instance = new TModel();
            return Instance.DataSelectTop(ItemCount,orderBy);
        }
        public static List<TModel> SelectTop(int ItemCount)
        {
            return SelectTop(ItemCount, null);
        }

        public static List<TModel> SelectTop(string SqlQuery, int ItemCount)
        {
            TModel Instance = new TModel();
            return Instance.DataSelectTop(SqlQuery, ItemCount);
        }
        public static List<TModel> SelectTop(Expression<Func<TModel, bool>> predicate, int ItemCount, Ordered<TModel, TKey> orderBy/* = null*/)
        {
            return new TModel().DataSelectTop(predicate, ItemCount,orderBy);
        }
        public static List<TModel> SelectTop(Expression<Func<TModel, bool>> predicate, int ItemCount)
        {
            return SelectTop(predicate, ItemCount, null);
        }
        public static List<TModel> SelectTop(Dictionary<string, string> condition, int ItemCount, Ordered<TModel, TKey> orderBy/* = null*/)
        {
            return new TModel().DataSelectTop(condition,ItemCount,orderBy);
        }
        public static List<TModel> SelectTop(Dictionary<string, string> condition, int ItemCount)
        {
            return SelectTop(condition, ItemCount, null);
        }
        #endregion

        #region SelectPaging
        public static PagedList<TModel> SelectPaging(int PageSize, int PageIndex, int? TotalCount/* = null*/)
        {
            TModel Instance = new TModel();
            return Instance.DataSelectPaging(PageSize, PageIndex,TotalCount);
        }
        public static PagedList<TModel> SelectPaging(int PageSize, int PageIndex)
        {
            return SelectPaging(PageSize, PageIndex, null);
        }
        public static PagedList<TModel> SelectPaging(string SqlQuery, int PageSize, int PageIndex, int? TotalCount/* = null*/)
        {
            TModel Instance = new TModel();
            return Instance.DataSelectPaging(SqlQuery,PageSize, PageIndex, TotalCount);
        }
        public static PagedList<TModel> SelectPaging(string SqlQuery, int PageSize, int PageIndex)
        {
            return SelectPaging(SqlQuery, PageSize, PageIndex, null);
        }

        public static PagedList<TModel> SelectPaging(Expression<Func<TModel, bool>> predicate, int PageSize, int PageIndex, Ordered<TModel, TKey> orderBy/* = null*/, int? TotalCount/* = null*/)
        {
            return new TModel().DataSelectPaging(predicate, PageSize, PageIndex,orderBy,TotalCount);
        }
        public static PagedList<TModel> SelectPaging(Expression<Func<TModel, bool>> predicate, int PageSize, int PageIndex)
        {
            return SelectPaging(predicate, PageSize, PageIndex, null, null);
        }
        public static PagedList<TModel> SelectPaging(Expression<Func<TModel, bool>> predicate, int PageSize, int PageIndex, Ordered<TModel, TKey> orderBy)
        {
            return SelectPaging(predicate, PageSize, PageIndex, orderBy, null);
        }

        public static PagedList<TModel> SelectPaging(Dictionary<string, string> condition, int PageSize, int PageIndex,Ordered<TModel, TKey> orderBy/* = null*/, int? TotalCount/* = null*/)
        {
            return new TModel().DataSelectPaging(condition,PageSize,PageIndex,orderBy, TotalCount);
        }
        public static PagedList<TModel> SelectPaging(Dictionary<string, string> condition, int PageSize, int PageIndex)
        {
            return SelectPaging(condition, PageSize, PageIndex, null, null);
        }
        public static PagedList<TModel> SelectPaging(Dictionary<string, string> condition, int PageSize, int PageIndex, Ordered<TModel, TKey> orderBy)
        {
            return SelectPaging(condition, PageSize, PageIndex, orderBy, null);
        }
        #endregion

        #region RecordCount
        public static int RecordCount()
        {
            TModel Instance = new TModel();
            return Instance.DataRecordCount();
        }
        public static int RecordCount(string SqlQuery)
        {
            TModel Instance = new TModel();
            return Instance.DataRecordCount(SqlQuery);
        }
        public static int RecordCount(Expression<Func<TModel, bool>> predicate)
        {
            return new TModel().DataRecordCount(predicate);
        }
        public static int RecordCount(Dictionary<string, string> condition)
        {
            return new TModel().DataRecordCount(condition);
        }
        #endregion

        #endregion

        #endregion
        //////////////////////////////////////////////////////////

        #region 事件

        //public event EventHandler<SavedEventArgs> Saving;
        //[NonSerialized]
        //private SavingEventArgs EventSaving = new SavingEventArgs(SaveAction.None);//反序列化时不会被执行.
        [NonSerialized]
        private SavingEventArgs _eventSaving;
        private SavingEventArgs EventSaving
        {
            get
            {
                if (_eventSaving == null)
                {
                    _eventSaving = new SavingEventArgs(SaveAction.None,null);
                }
                return _eventSaving;
            }
        }
        //public event CancelEventHandler Saving;
        public event EventHandler<SavingEventArgs> Saving;
        public event EventHandler<SavedEventArgs> Saved;
        /// <summary>
        /// 任何对象保存(增、删、改)之前均会自动引发该事件。（如果子类重写有关保存数据的方法，则不会自动引发，此时需要手动引发。在DataAccess的子类中重写会自动引发）
        /// </summary>
        public static event EventHandler<SavingEventArgs> AnySaving;
        /// <summary>
        /// 任何对象保存(增、删、改)完成后均会自动引发该事件。（如果子类重写有关保存数据的方法，则不会自动引发，此时需要手动引发。在DataAccess的子类中重写会自动引发）
        /// </summary>
        public static event EventHandler<SavedEventArgs> AnySaved;

        protected void RaiseSaving(ModelBase<TModel,TKey> data, SaveAction action)
        {
            //OnSaving(businessObject, action);
            if (Saving != null)
            {
                EventSaving.Action = action;
                //Saving(businessObject, new SavingEventArgs(action));
                Saving(this, EventSaving);//使用EventSaving，则Saving中可以提供取消保存操作。
            }

            //OnAnySaving(businessObject, action);
            //实现数据在任何改动之前都会被捕捉到，如：如果数据是保存在数据库中的，则数据库中的数据在任何变动之前都会被捕获到。
            if (AnySaving != null)
            {
                AnySaving(this, new SavingEventArgs(action,data));
            }
        }

        protected void RaiseSaved(ModelBase<TModel, TKey> data, SaveAction action)
        {
            if (this.Saved != null)
            {
                Saved(this, new SavedEventArgs(action,data));

            }
            //OnSaved(businessObject, action);
            //OnAnySaved(businessObject, action);
            //实现数据的任何改动都会被捕捉到，如：如果数据是保存在数据库中的，则数据库中的数据有任保变化都会被捕获到。
            //使用场景：如缓存，如果一旦内容被修改则可在此事件中更新缓存的内容，以便缓存中的内容总是最新的。
            if (AnySaved != null)
            {
                AnySaved(this, new SavedEventArgs(action,data));

            }
        }

        //查询事件:
        public event EventHandler<QueriedEventArgs> Queried;
        public static event EventHandler<QueriedEventArgs> AnyQueried;
        protected void RaiseQueried(ModelBase<TModel, TKey> data)
        {
            if (Queried != null)
            {
                Queried(this,new QueriedEventArgs(data));
            }
            if (AnyQueried != null)
            {
                AnyQueried(this, new QueriedEventArgs(data));
            }
        }
        
        #endregion

        #region INotifyPropertyChanged 成员
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }
        #endregion

        #region IModel 成员
        public IModel InsertEx()
        {
            Debug.Assert(this is TModel);
            return this.Insert();
        }
        public List<IModel> InsertEx(List<IModel> instances)
        {
            if (instances == null)
            {
                return null;
            }
            var arguments = instances.GetType().GetGenericArguments();
            Debug.Assert(this is TModel && arguments[0] == typeof(TModel));
            var list= this.DataInsert(instances.Select(item => item as TModel).ToList());
            return list.Select(item => item as IModel).ToList();
        }
        public IModel UpdateEx()
        {
            Debug.Assert(this is TModel);
            return this.Update();
        }

        public List<IModel> UpdateEx(List<IModel> instances)
        {
            if (instances == null)
            {
                return null;
            }
            var arguments=instances.GetType().GetGenericArguments();
            Debug.Assert(this is TModel&&arguments[0] == typeof(TModel));
            var list= this.DataUpdate(instances.Select(item=>item as TModel).ToList());
            return list.Select(item => item as IModel).ToList();
        }

        public IModel DeleteEx()
        {
            Debug.Assert(this is TModel);
            return this.Delete();
        }

        public List<IModel> DeleteEx(List<IModel> instances)
        {
            if (instances == null)
            {
                return null;
            }
            var arguments = instances.GetType().GetGenericArguments();
            Debug.Assert(this is TModel&&arguments[0] == typeof(TModel));
            var result = this.DataDelete(instances.Select(item => item as TModel).ToList());
            return result.Select(item => item as IModel).ToList();
        }

        public int DeleteEx(object PrimaryKey)
        {
            Debug.Assert(this is TModel&&PrimaryKey is TKey);
            return this.DataDelete((TKey)PrimaryKey);
        }

        public int DeleteEx(object[] PrimaryKeys)
        {
            Debug.Assert(this is TModel);
            return this.DataDelete(PrimaryKeys);
        }

        public int DeleteAllEx()
        {
            Debug.Assert(this is TModel);
            return this.DataDeleteAll();
        }

        public IModel SelectEx(object PrimaryKey)
        {
            Debug.Assert(this is TModel&&PrimaryKey is TKey);
            return this.DataSelect((TKey)PrimaryKey);
        }

        public IModel SelectEx(string SqlQuery)
        {
            Debug.Assert(this is TModel);
            return this.DataSelect(SqlQuery);
        }

        public IModel SelectEx(Dictionary<string, string> condition)
        {
            Debug.Assert(this is TModel);
            return this.DataSelect(condition);
        }

        public List<IModel> SelectAllEx(int? Skip/* = null*/, int? Take/* = null*/)
        {
            Debug.Assert(this is TModel);
            var result= this.DataSelectAll(Skip, Take);
            return result.Select(item => item as IModel).ToList();
        }
        public List<IModel> SelectAllEx()
        {
            int? skip = null;
            int? take = null;
            return this.SelectAllEx(skip, take);
        }
        public List<IModel> SelectAllEx(int? Skip)
        {
            return this.SelectAllEx(Skip, null);
        }
        public List<IModel> SelectAllEx(string SqlQuery, int? Skip/* = null*/, int? Take/* = null*/)
        {
            Debug.Assert(this is TModel);
            var result=this.DataSelectAll(SqlQuery, Skip, Take);
            return result.Select(item => item as IModel).ToList();
        }
        public List<IModel> SelectAllEx(string SqlQuery)
        {
            return this.SelectAllEx(SqlQuery, null, null);
        }
        public List<IModel> SelectAllEx(string SqlQuery, int? Skip)
        {
            return this.SelectAllEx(SqlQuery, Skip, null);
        }

        public List<IModel> SelectAllEx(Dictionary<string, string> condition, int? Skip/* = null*/, int? Take/* = null*/)
        {
            Debug.Assert(this is TModel);
            var result = this.DataSelectAll(condition,null, Skip, Take);
            return result.Select(item => item as IModel).ToList();
        }
        public List<IModel> SelectAllEx(Dictionary<string, string> condition)
        {
            return SelectAllEx(condition, null, null);
        }
        public List<IModel> SelectAllEx(Dictionary<string, string> condition, int? Skip)
        {
            return SelectAllEx(condition, Skip, null);
        }

        public List<IModel> SelectTopEx(int ItemCount)
        {
            Debug.Assert(this is TModel);
            var result = this.DataSelectTop(ItemCount);
            return result.Select(item => item as IModel).ToList();
        }

        public List<IModel> SelectTopEx(string SqlQuery, int ItemCount)
        {
            Debug.Assert(this is TModel);
            var result = this.DataSelectTop(SqlQuery,ItemCount);
            return result.Select(item => item as IModel).ToList();
        }

        public List<IModel> SelectTopEx(Dictionary<string, string> condition, int ItemCount)
        {
            Debug.Assert(this is TModel);
            var result = this.DataSelectTop(condition, ItemCount);
            return result.Select(item => item as IModel).ToList();
        }

        public PagedList<IModel> SelectPagingEx(int PageSize, int PageIndex, int? TotalCount/* = null*/)
        {
            Debug.Assert(this is TModel);
            var result = this.DataSelectPaging(PageSize, PageIndex, TotalCount);
            return new PagedList<IModel>(result.Select(item=>item as IModel), result.CurrentPageIndex, result.PageSize, result.TotalItemCount);
            
        }
        public PagedList<IModel> SelectPagingEx(int PageSize, int PageIndex)
        {
            return this.SelectPagingEx(PageSize, PageIndex, null);
        }

        public PagedList<IModel> SelectPagingEx(string SqlQuery, int PageSize, int PageIndex, int? TotalCount/* = null*/)
        {
            Debug.Assert(this is TModel);
            var result = this.DataSelectPaging(SqlQuery,PageSize, PageIndex, TotalCount);
            return new PagedList<IModel>(result.Select(item => item as IModel), result.CurrentPageIndex, result.PageSize, result.TotalItemCount);
        }
        public PagedList<IModel> SelectPagingEx(string SqlQuery, int PageSize, int PageIndex)
        {
            return this.SelectPagingEx(SqlQuery, PageSize, PageIndex, null);
        }

        public PagedList<IModel> SelectPagingEx(Dictionary<string, string> condition, int PageSize, int PageIndex, int? TotalCount/* = null*/)
        {
            Debug.Assert(this is TModel);
            var result = this.DataSelectPaging(condition, PageSize, PageIndex,null, TotalCount);
            return new PagedList<IModel>(result.Select(item => item as IModel), result.CurrentPageIndex, result.PageSize, result.TotalItemCount);
        }
        public PagedList<IModel> SelectPagingEx(Dictionary<string, string> condition, int PageSize, int PageIndex)
        {
            return this.SelectPagingEx(condition, PageSize, PageIndex, null);
        }
        public int RecordCountEx()
        {
            Debug.Assert(this is TModel);
            return this.DataRecordCount();
        }

        public int RecordCountEx(string SqlQuery)
        {
            Debug.Assert(this is TModel);
            return this.DataRecordCount(SqlQuery);
        }

        public int RecordCountEx(Dictionary<string, string> condition)
        {
            Debug.Assert(this is TModel);
            return this.DataRecordCount(condition);
        }
        #endregion
    }
}
