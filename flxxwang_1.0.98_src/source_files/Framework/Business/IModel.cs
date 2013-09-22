using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using Framework.Data;
using System.Linq.Expressions;
using Framework.WebControls.Mvc;

namespace Framework
{
    public interface IModel
    {
        string TableName
        {
            get;
        }

        #region 增、删、改

        #region 插入
        IModel InsertEx();
        List<IModel> InsertEx(List<IModel> instances);
        #endregion

        #region 更新
        IModel UpdateEx();

        List<IModel> UpdateEx(List<IModel> instances);
        #endregion

        #region 删除
        IModel DeleteEx();
        List<IModel> DeleteEx(List<IModel> instances);
        int DeleteEx(object PrimaryKey);

        int DeleteEx(object[] PrimaryKeys);

        int DeleteAllEx();

        //int DeleteAllEx(Expression<Func<IModel, bool>> predicate);

        #endregion

        #endregion

        #region 查询

        #region Select
        IModel SelectEx(object PrimaryKey);
        IModel SelectEx(string SqlQuery);
        //IModel SelectEx(Expression<Func<IModel, bool>> expression, Ordered<IModel, object> orderBy = null);
        IModel SelectEx(Dictionary<string, string> condition/*, Ordered<IModel, object> orderBy = null*/);
        #endregion

        #region SelectAll
        List<IModel> SelectAllEx(int? Skip/* = null*/, int? Take/* = null*/);
        List<IModel> SelectAllEx();
        List<IModel> SelectAllEx(int? Skip);

        List<IModel> SelectAllEx(string SqlQuery, int? Skip/* = null*/, int? Take/* = null*/);
        List<IModel> SelectAllEx(string SqlQuery);
        List<IModel> SelectAllEx(string SqlQuery, int? Skip);
        //List<IModel> SelectAllEx(Expression<Func<IModel, bool>> predicate, Ordered<IModel, object> orderBy = null, int? Skip = null, int? Take = null);
        List<IModel> SelectAllEx(Dictionary<string, string> condition, /*Ordered<IModel, object> orderBy = null,*/ int? Skip/* = null*/, int? Take/* = null*/);
        List<IModel> SelectAllEx(Dictionary<string, string> condition /*Ordered<IModel, object> orderBy = null,*/);
        List<IModel> SelectAllEx(Dictionary<string, string> condition, /*Ordered<IModel, object> orderBy = null,*/ int? Skip);
        #endregion

        #region SelectTop
        List<IModel> SelectTopEx(int ItemCount/*, Ordered<IModel, object> orderBy = null*/);
        List<IModel> SelectTopEx(string SqlQuery, int ItemCount);
        //List<IModel> SelectTopEx(Expression<Func<IModel, bool>> predicate, int ItemCount, Ordered<IModel, object> orderBy = null);
        List<IModel> SelectTopEx(Dictionary<string, string> condition, int ItemCount/*, Ordered<IModel, object> orderBy = null*/);
        #endregion

        #region SelectPaging
        PagedList<IModel> SelectPagingEx(int PageSize, int PageIndex, int? TotalCount/* = null*/);
        PagedList<IModel> SelectPagingEx(int PageSize, int PageIndex);
        PagedList<IModel> SelectPagingEx(string SqlQuery, int PageSize, int PageIndex, int? TotalCount/* = null*/);
        PagedList<IModel> SelectPagingEx(string SqlQuery, int PageSize, int PageIndex);
        //PagedList<IModel> SelectPagingEx(Expression<Func<IModel, bool>> predicate, int PageSize, int PageIndex, Ordered<IModel, object> orderBy = null, int? TotalCount = null);
        PagedList<IModel> SelectPagingEx(Dictionary<string, string> condition, int PageSize, int PageIndex, /*Ordered<IModel, object> orderBy = null,*/ int? TotalCount/* = null*/);
        PagedList<IModel> SelectPagingEx(Dictionary<string, string> condition, int PageSize, int PageIndex /*Ordered<IModel, object> orderBy = null,*/);
        #endregion

        #region RecordCount
        int RecordCountEx();
        int RecordCountEx(string SqlQuery);
        //int RecordCountEx(Expression<Func<IModel, bool>> predicate);
        int RecordCountEx(Dictionary<string, string> condition);
        #endregion

        #endregion









        //IModel InsertEx();
        //IModel DeleteEx();
        //IModel UpdateEx();

        //IEnumerable<IModel> UpdateEx(IEnumerable<IModel> instances);

        //int DeleteEx(object PrimaryKey);
        //int DeleteAllEx();

        //IModel SelectEx(object PrimaryKey);
        //IModel SelectEx(string SqlQuery);
        //IModel SelectEx(IEnumerable<System.Data.Common.DbParameter> DbParameters);
        //IModel SelectEx(string SqlQuery, IEnumerable<System.Data.Common.DbParameter> DbParameters);
        //IModel SelectEx(Expression<Func<IModel, bool>> predicate);

        //List<IModel> SelectAllEx();
        //List<IModel> SelectAllEx(string SqlQuery);
        //List<IModel> SelectAllEx(int Skip, int Take);
        //List<IModel> SelectAllEx(string SqlQuery, int Skip, int Take);
        //List<IModel> SelectAllEx(Expression<Func<IModel, bool>> predicate);
        //List<IModel> SelectAllEx(Expression<Func<IModel, bool>> predicate, int Skip, int Take);

        //List<IModel> SelectTopEx(int ItemCount);
        //List<IModel> SelectTopEx(string SqlQuery, int ItemCount);
        //List<IModel> SelectTopEx(Expression<Func<IModel, bool>> predicate, int ItemCount);

        //PagedList<IModel> SelectPagingEx(int PageSize, int PageIndex);
        //PagedList<IModel> SelectPagingEx(Expression<Func<IModel, bool>> predicate, int PageSize, int PageIndex);

        //int RecordCountEx(string SqlQuery);
        //int RecordCountEx();
        //int RecordCount(Expression<Func<IModel, bool>> predicate);
    }
}
