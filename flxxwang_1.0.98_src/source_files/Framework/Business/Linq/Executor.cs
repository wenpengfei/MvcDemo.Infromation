using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Framework.Extensions;
using System.Collections;

namespace Framework.Data.Linq
{
    public class Executor<T>:IEnumerable<T>
    {
        private DataTable dt = null;
        private List<T> Entities = null;
        public Executor(DataTable dt)
        {
            this.dt = dt;
            if (typeof(T).IsValueType || typeof(T) == typeof(string))
            {
                this.Entities = new List<T>();
                var colIndex = 0;
                if (dt.Columns[0].ColumnName.ToLower() == "rownumber")//groupby...skip...take
                {
                    colIndex = 1;
                }
                foreach (DataRow dr in dt.Rows)
                {
                    this.Entities.Add(DataConvert.Convert<T>(dr[colIndex]));
                }
            }
            else if (typeof(T).Name == "IGrouping`2")
            {//from obj in Lovewall.Entities group obj by obj.Content into g select g;
                this.Entities = new List<T>();
                foreach (DataRow dr in dt.Rows)
                {
                    var grouping = Activator.CreateInstance(typeof(Grouping<,>).MakeGenericType(typeof(T).GetGenericArguments()), dr);
                    this.Entities.Add((T)grouping);
                }
            }
            else
            {
                this.Entities = this.dt.ToEntities<T>();
            }
        }


        public IEnumerator<T> GetEnumerator()
        {
            foreach (var model in this.Entities)
            {
                yield return model;
            }
        }

        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            return this.GetEnumerator();//可能会出错.
        }
    }
}
