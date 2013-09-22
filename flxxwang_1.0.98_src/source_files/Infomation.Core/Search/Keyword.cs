using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework;
using Framework.Data;
using Infomation.Core.Data;
using Framework.Common;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    [Table(Name = "Info_Keyword")]
    public class Keyword : ModelBase<Keyword, int>
    {
        [Column(IsPrimaryKey = true)]
        public int Id
        {
            get;
            set;
        }
        public string Key
        {
            get;
            set;
        }
        public string Code
        {
            get;
            set;
        }
        public string ParentCode
        {
            get;
            set;
        }
        public byte? ObjType
        {
            get;
            set;
        }
        public byte? Tag
        {
            get;
            set;
        }
        /// <summary>
        /// 值来自KeywordStat的Total.
        /// </summary>
        public int Total
        {
            get;
            set;
        }
        private static List<Keyword> _keywords;
        public static List<Keyword> Keywords
        {
            get
            {
                if(_keywords==null)
                {
                    _keywords=Keyword.SelectAll();
                }
                return _keywords;
            }
        }

        public List<Keyword> Search(string q, string cityCode, string category, int maxRows)//category:在指定类别中搜索,如car、house等.
        {
            var collection = Keyword.Keywords.Where(item => item.Key.Contains(q)).Take(maxRows);
            var city=City.GetCityByCode(cityCode);
            var statList = KeywordStat.SelectAll(collection.Select(item => item.Id), city.Id);
            foreach (var keyword in collection)
            {
                var stat=statList.FirstOrDefault(item=>item.KeywordId==keyword.Id);
                if(stat!=null)
                {
                    keyword.Total = stat.Total;
                }
            }
            return collection.ToList();
        }
        protected override DataAccess<Keyword, int> GetProvider()
        {
            return new SearchDataAccess();
        }
    }
}
