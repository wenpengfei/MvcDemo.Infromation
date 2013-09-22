using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace Framework.Data.Linq
{
    public class Grouping<TKey, TElement> : IGrouping<TKey, TElement>
    {
        private DataRow dr = null;
        private string groupbyField = null;
        private string tableName = null;
        private List<TElement> Entities = null;
        private int colIndex = 0;
        public Grouping(DataRow dr)
        {
            this.dr = dr;
            if (dr.Table.Columns[0].ColumnName.ToLower() == "rownumber")//groupby...skip...take
            {
                this.colIndex = 1;
            }
            this.groupbyField = dr.Table.Columns[colIndex].ColumnName;
            this.tableName = ((System.Data.Linq.Mapping.TableAttribute)typeof(TElement).GetCustomAttributes(typeof(System.Data.Linq.Mapping.TableAttribute), false)[0]).Name;
        }
        public TKey Key
        {
            get 
            {
                return DataConvert.Convert<TKey>(dr[colIndex]);
            }
        }

        public IEnumerator<TElement> GetEnumerator()
        {
            if (this.Entities == null)
            {

                var sqlQuery = "select * from " + tableName + " where " + groupbyField + "";
                if(this.Key==null)
                {
                    sqlQuery += "is null";
                }
                if (typeof(TKey).IsValueType)
                {
                    sqlQuery += "=" + Key + "";
                }
                else//string类型
                {
                    var k = this.Key.ToString().Replace("'", "''");
                    sqlQuery += "='" + k + "'";
                }
                Database db = null;
                var customAttributes=typeof(TElement).GetCustomAttributes(typeof(System.Data.Linq.Mapping.DatabaseAttribute), false);
                if (customAttributes.Length > 0)
                {
                    var dbName=(customAttributes[0] as System.Data.Linq.Mapping.DatabaseAttribute).Name;
                    if(!(string.IsNullOrEmpty(dbName)||string.IsNullOrEmpty(dbName)))
                    {
                        db = DatabaseFactory.CreateDatabase(dbName);
                    }
                }
                if (db == null)
                {
                    db = DatabaseManager.CreateDatabase();
                }
                var ds = db.ExecuteDataSet(CommandType.Text, sqlQuery);
                var dt = ds.Tables[0];
                this.Entities = dt.ToEntities<TElement>();
            }
            
            foreach (var item in this.Entities)
            {
                yield return item;
            }
        }

        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            return this.GetEnumerator();
        }
    }
}
