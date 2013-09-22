using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Infomation.Core.Mvc;
using Framework.Common;
using System.Data.Common;
using Framework;

namespace Infomation.Core
{
    public interface IInfo:IModel
    {
        #region IInfo 成员属性，子类无需重写.
        int Id
        {
            get;
            set;
        }
        int? UserId
        {
            get;
            set;
        }
        int? TId
        {
            get;
            set;
        }
        string Keywords
        {
            get;
            set;
        }
        short Sequence
        {
            get;
        }
        string TitleDisplay
        {
            get;
        }
        string ContactPerson
        {
            get;
            set;
        }
        string Phone
        {
            get;
            set;
        }
        
        /// <summary>
        /// 城市Id
        /// </summary>
        short CityId
        {
            get;
            set;
        }
        City City
        {
            get;
        }
        string CityName
        {
            get;
        }
        short? RegionId
        {
            get;
            set;
        }
        Region Region
        {
            get;
        }
        string RegionName
        {
            get;
        }

        short? CircleId
        {
            get;
            set;
        }
        Circle Circle
        {
            get;
        }
        string CircleName
        {
            get;
        }
        
        DateTime DateCreated
        {
            get;
            set;
        }
        DateTime DateModified
        {
            get;
            set;
        }

        string Pictures
        {
            get;
            set;
        }

        List<string> PictureList
        {
            get;
        }

        short BaiduSpiderTotal
        {
            get;
            set;
        }
        short GoogleSpiderTotal
        {
            get;
            set;
        }
        short SogouSpiderTotal
        {
            get;
            set;
        }
        short OtherSpiderTotal
        {
            get;
            set;
        }
        #endregion

        Dictionary<int?, int> DataRecordCount(City city);

        [Obsolete()]
        List<IInfo> SelectPaging(int? CityId, int? RegionId, int? CircleId, bool? IsBiz, int? ObjectType, int? MinPrice, int? MaxPrice, string KeyWord, DateTime? StartTime, DateTime? EndTime, bool? IsPic, int PageSize, int PageIndex);
        [Obsolete()]
        int RecordCount(int? CityId, int? RegionId, int? CircleId, bool? IsBiz, int? ObjectType, int? MinPrice, int? MaxPrice, string KeyWord, DateTime? StartTime, DateTime? EndTime, bool? IsPic);

        //List<IInfo> SelectPaging(int? CityId, int? RegionId, int? CircleId, IEnumerable<DbParameter> DbParameters, int PageSize, int PageIndex, string sqlQuery = null);

        #region IInfo成员,子类可重写
        
        InfoDetail Detail
        {
            get;
        }

        List<ActionLink> SameCircleLinks
        {
            get;
        }

        List<IInfo> RecentOthers(int count);

        /// <summary>
        /// 指定搜索时要搜索的字段.
        /// </summary>
        /// <returns></returns>
        List<string> KeyWordSearchFields();

        string PageTitle
        {
            get;
        }

        string PageDescription
        {
            get;
        }

        string PageKeywords
        {
            get;
        }

        List<ActionLink> InfoPath
        {
            get;
        }

        List<ActionLink> CityLinks
        {
            get;
        }

        List<ActionLink> FriendLinks
        {
            get;
        }
        
        #endregion

        InfoCategory Category
        {
            get;
        }

        List<ObjectType> ObjectTypeCollection
        {
            get;
        }
        List<InfoTag> TagCollection
        {
            get;
        }

        ActionLink Link
        {
            get;
        }

        ActionLink PostLink
        {
            get;
        }

        ActionLink ParentLink
        {
            get;
        }

        ActionLink ListLink
        {
            get;
        }

        Dictionary<int, int> InfoCount
        {
            get;
        }
    }
}
