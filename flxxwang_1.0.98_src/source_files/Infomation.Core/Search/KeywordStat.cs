using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    [Table(Name = "Info_KeywordStat")]
    public class KeywordStat:ModelBase<KeywordStat,int>
    {
        [Column(IsPrimaryKey = true)]
        public int Id
        {
            get;
            set;
        }
        public int KeywordId
        {
            get;
            set;
        }
        public short CityId
        {
            get;
            set;
        }
        public int Total
        {
            get;
            set;
        }
        public List<KeywordStat> DataSelectAll(IEnumerable<int> KeywordIds,int CityId)
        {
            if (KeywordIds == null || KeywordIds.Count() == 0)
            {
                return new List<KeywordStat>();
            }
            var keys = string.Empty;
            foreach (var key in KeywordIds)
            {
                keys += "," + key;
            }
            keys = keys.Substring(1);
            var sqlQuery = "select * from " + TableName + " where KeywordId in (" + keys + ") and CityId="+CityId+"";
            return base.DataSelectAll(sqlQuery);
        }
        public static List<KeywordStat> SelectAll(IEnumerable<int> KeywordIds, int CityId)
        {
            return new KeywordStat().DataSelectAll(KeywordIds, CityId);
        }
        protected override DataAccess<KeywordStat, int> GetProvider()
        {
            return new KeywordStatDataAccess();
        }
    }
}
