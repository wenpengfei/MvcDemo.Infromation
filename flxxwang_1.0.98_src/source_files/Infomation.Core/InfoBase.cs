using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Framework.Common;
using Framework.Extensions;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using Framework;
using Infomation.Core.Mvc;
using System.Web.Routing;
using System.Runtime.Serialization;
using System.Data.Linq.Mapping;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Reflection;

namespace Infomation.Core
{
    [DataContract]
    public abstract class InfoBase<TModel> : ModelBase<TModel, int>, IInfo
        where TModel : InfoBase<TModel>, new()
    {
        #region 构造函数
        public InfoBase()
        {
            //this.Saved += new EventHandler<SavedEventArgs>(OnSaved);
            //每次插入都更新关键字,这会极大地影响性能,在抓信息时更是非常非常的慢,取消更新关键字统计后速度变得非常的快.
            //慢的原因是一些查询引起的,如Keyword.Select(new { ParentCode = parentCode }),所以要尽可能地减少查询.
        }
        #endregion

        private static string _phonesRoot;
        public static string PhonesRoot
        {
            get
            {
                if (_phonesRoot == null)
                {
                    _phonesRoot = ConfigurationManager.AppSettings["PhonesFolder"];
                }
                return _phonesRoot;
            }
        }
        static InfoBase()
        {
            AnyQueried += (sender, e) =>
                {
                    if(e.Data is TModel)
                    {
                        var model = e.Data as TModel;
                        ToNumberPicUrl(model);
                    }
                };
            AnySaved += (sender, e) =>
                {
                    if (e.Action == SaveAction.Insert)
                    {
                        var model = e.Data as TModel;
                        if (model != null)
                        {
                            var source = model.GetValue("Source");
                            if (source != null)
                            {
                                Framework.WebCatch.Utils.OpenPage("http://www.taojen.com/wap/addRecentInfo?title=" + HttpUtility.UrlEncode(model.TitleDisplay) + "&category=" + HttpUtility.UrlEncode(model.Category.Name) + "");

                                if (!string.IsNullOrWhiteSpace(model.Phone)&&model.Phone.EndsWith(".bmp"))
                                {
                                    Autotask task = new Autotask()
                                    {
                                        Action = Infomation.Core.Action.下载电话图片,
                                        DealStart = DateTime.Now,
                                        State = State.任务队列,
                                        Content = model.Phone
                                    };
                                    task.Insert();
                                }
                                var Phone2 = model.GetValue("Phone2") as string;
                                if (!string.IsNullOrWhiteSpace(Phone2) && Phone2.EndsWith(".bmp"))
                                {
                                    Autotask task = new Autotask()
                                    {
                                        Action = Infomation.Core.Action.下载电话图片,
                                        DealStart = DateTime.Now,
                                        State = State.任务队列,
                                        Content = Phone2
                                    };
                                    task.Insert();
                                }
                                var QQOrMSN = model.GetValue("QQOrMSN") as string;
                                if (!string.IsNullOrWhiteSpace(QQOrMSN) && QQOrMSN.EndsWith(".bmp"))
                                {
                                    Autotask task = new Autotask()
                                    {
                                        Action = Infomation.Core.Action.下载电话图片,
                                        DealStart = DateTime.Now,
                                        State = State.任务队列,
                                        Content = QQOrMSN
                                    };
                                    task.Insert();
                                }

                            }
                            else
                            {
                                if (StaticVar.RecentInfos.Count > 10)
                                {
                                    StaticVar.RecentInfos.RemoveRange(0, StaticVar.RecentInfos.Count - 10);
                                }
                                StaticVar.RecentInfos.Add(model);
                            }
                        }
                    }
                };
        }

        private static void ToNumberPicUrl(TModel model)
        {
            if (!string.IsNullOrWhiteSpace(model.Phone)
                                && model.Phone.Contains(".")//包含"."就可以说明是图片.
                                )
            {
                model.Phone = "<img src='" + PhonesRoot + "/" + model.Phone + "' />";
            }
            var Phone2 = model.GetValue("Phone2") as string;
            if (!string.IsNullOrWhiteSpace(Phone2)
                &&Phone2.Contains("."))
            {
                model.SetValue("Phone2","<img src='" + PhonesRoot + "/" + Phone2 + "' />");
            }
            var QQOrMSN = model.GetValue("QQOrMSN") as string;
            if (!string.IsNullOrWhiteSpace(QQOrMSN)
                && QQOrMSN.Contains("."))
            {
                model.SetValue("QQOrMSN", "<img src='" + PhonesRoot + "/" + QQOrMSN + "' />");
            }
        }

        #region IInfo 成员属性，子类无需重写.
        [Column(IsPrimaryKey = true)]
        [DataMember]
        public int Id
        {
            get;
            set;
        }
        [DataMember]
        public int? UserId
        {
            get;
            set;
        }
        [DataMember]
        public int? TId
        {
            get;
            set;
        }
        public string Keywords
        {
            get;
            set;
        }

        private short? _sequence;
        public short Sequence
        {
            get
            {
                if (_sequence == null)
                {
                    if (this.ContainsProperty("Source"))
                    {
                        _sequence = 100;
                        var source = this.GetValue("Source");
                        if (source == null)
                        {
                            _sequence = 1;
                        }
                        else
                        {
                            if (!string.IsNullOrEmpty(this.ContactPerson))
                            {
                                _sequence--;
                            }
                            if (this.ContainsProperty("Address"))
                            {
                                var address = this.GetValue("Address") as string;
                                if (!string.IsNullOrEmpty(address))
                                {
                                    _sequence -= 2;
                                }
                            }
                            if (this.ContainsProperty("Phone2"))
                            {
                                var phone2 = this.GetValue("Phone2") as string;
                                if (!string.IsNullOrEmpty(phone2))
                                {
                                    _sequence -= 4;
                                }
                            }
                            if (this.ContainsProperty("QQOrMSN"))
                            {
                                var qqormsn = this.GetValue("QQOrMSN") as string;
                                if (!string.IsNullOrEmpty(qqormsn))
                                {
                                    _sequence -= 8;
                                }
                            }
                            if (!string.IsNullOrEmpty(this.Phone))
                            {
                                _sequence -= 16;
                            }
                        }
                    }
                    if (_sequence == null)
                    {
                        _sequence = 1;
                    }
                }
                return _sequence.Value;
            }
        }

        private User _user;
        [DataMember]
        public User User
        {
            get
            {
                if (_user == null)
                {
                    if (this.UserId != null)
                    {
                        _user = User.Select(UserId.Value);
                    }
                }
                return _user;
            }
            private set//使系列化时不出错.
            {
                _user = value;
            }
        }
        [DataMember]
        public string ContactPerson
        {
            get;
            set;
        }
        [DataMember]
        public virtual string Phone
        {
            get;
            set;
        }
        
        /// <summary>
        /// 城市Id
        /// </summary>
        [DataMember]
        public short CityId
        {
            get;
            set;
        }
        private City _city;
        [DataMember]
        public City City
        {
            get
            {
                if (_city == null)
                {
                    _city=City.GetCity(this.CityId);
                }
                return _city;
            }
            private set//使系列化时不出错.
            {
                _city = value;
            }
        }
        private string _cityName;
        [DataMember]
        public string CityName
        {
            get
            {
                if (_cityName == null)
                {
                    if (this.City == null)
                    {
                        _cityName = string.Empty;
                    }
                    else
                    {
                        _cityName=this.City.ShortName;
                    }
                }
                return _cityName;
            }
            private set//使系列化时不出错.
            {
                _cityName = value;
            }
        }
        [DataMember]
        public short? RegionId
        {
            get;
            set;
        }

        private Region _region;
        [DataMember]
        public Region Region
        {
            get
            {
                if (_region == null && this.RegionId != null)
                {
                    _region = Region.GetRegion(this.RegionId.Value);
                }
                return _region;
            }
            private set//使系列化时不出错.
            {
                _region = value;
            }
        }

        private string _regionName;
        [DataMember]
        public string RegionName
        {
            get
            {
                if (_regionName == null)
                {
                    if (this.Region == null)
                    {
                        _regionName = string.Empty;
                    }
                    else
                    {
                        _regionName=this.Region.Name;
                    }
                }
                return _regionName;
            }
            private set//使系列化时不出错.
            {
                _regionName = value;
            }
        }
        [DataMember]
        public short? CircleId
        {
            get;
            set;
        }
        private Circle _circle;
        [DataMember]
        public Circle Circle
        {
            get
            {
                if (_circle == null&&this.CircleId != null)
                {
                    _circle=Circle.GetCircle(this.CircleId.Value);
                }
                return _circle;
            }
            private set//使系列化时不出错.
            {
                _circle = value;
            }
        }

        private string _circleName;
        [DataMember]
        public string CircleName
        {
            get
            {
                if (_circleName == null && this.Circle != null)
                {
                    _circleName=this.Circle.Name;
                }
                return _circleName;
            }
            private set//使系列化时不出错.
            {
                _circleName = value;
            }
        }
        [DataMember]
        public DateTime DateCreated
        {
            get;
            set;
        }
        [DataMember]
        public DateTime DateModified
        {
            get;
            set;
        }
        [DataMember]
        public string Pictures
        {
            get;
            set;
        }

        private List<string> _pictureList;
        [DataMember]
        public List<string> PictureList
        {
            get
            {
                if (_pictureList == null)
                {
                    if (!string.IsNullOrEmpty(Pictures))
                    {
                        _pictureList = Pictures.Split(new char[] { '|' }).ToList();
                    }
                    else
                    {
                        _pictureList=new List<string>();
                    }
                }
                return _pictureList;
            }
            private set//使系列化时不出错.
            {
                _pictureList = value;
            }
        }

        public short BaiduSpiderTotal
        {
            get;
            set;
        }

        public short GoogleSpiderTotal
        {
            get;
            set;
        }

        public short SogouSpiderTotal
        {
            get;
            set;
        }

        public short OtherSpiderTotal
        {
            get;
            set;
        }
        #endregion

        #region 数据查询
        public List<TModel> DataRecent(bool? IsPic,int ItemCount)
        {
            var sqlQuery = "select * from "+TableName+"";
            if (IsPic == true)
            {
                sqlQuery += " where (Pictures is not null)";
            }
            else if(IsPic==false)
            {
                sqlQuery += " where (Pictures is null)";
            }
            sqlQuery += "order by [Id] desc";
            return SelectTop(sqlQuery,ItemCount);

        }
        public static List<TModel> Recent(bool? IsPic, int ItemCount)
        {
            return new TModel().DataRecent(IsPic, ItemCount);
        }
        public Dictionary<int?, int> DataRecordCount(City city)
        {
            var sqlQuery = "select RegionId,COUNT(*) Total from " + TableName + " where CityId=" + city.Id + " group by RegionId";
            DbCommand cmd = DataAccess.db.GetSqlStringCommand(sqlQuery);
            DataTable dt = DataAccess.db.ExecuteDataSet(cmd).Tables[0];
            Dictionary<int?, int> dic = new Dictionary<int?, int>();
            foreach (DataRow dr in dt.Rows)
            {
                int? RegionId = null;
                if (dr["RegionId"] != DBNull.Value)
                {
                    RegionId = Convert.ToInt32(dr["RegionId"]);
                }
                dic[RegionId] = Convert.ToInt32(dr["Total"]);
            }
            return dic;
        }
        public static Dictionary<int?,int> RecordCount(City city)
        {
            return new TModel().DataRecordCount(city);
        }
        [Obsolete()]
        public List<TModel> DataSelectPaging(int? CityId, int? RegionId, int? CircleId, bool? IsBiz, int? ObjectType, int? MinPrice, int? MaxPrice, string KeyWord, DateTime? StartTime, DateTime? EndTime, bool? IsPic, int PageSize, int PageIndex)
        {
            TModel T = new TModel();
            string sqlQuery = GetSqlQuery(CityId, RegionId, CircleId, IsBiz, ObjectType, MinPrice, MaxPrice, KeyWord, StartTime, EndTime, IsPic);
            return T.DataSelectPaging(sqlQuery, PageSize, PageIndex);
            
        }
        [Obsolete()]
        public List<IInfo> SelectPaging(int? CityId, int? RegionId, int? CircleId, bool? IsBiz, int? ObjectType, int? MinPrice, int? MaxPrice, string KeyWord, DateTime? StartTime, DateTime? EndTime, bool? IsPic, int PageSize, int PageIndex)
        {
            var collection= DataSelectPaging(CityId,  RegionId,  CircleId,  IsBiz,  ObjectType,  MinPrice,  MaxPrice, KeyWord, StartTime, EndTime, IsPic, PageSize, PageIndex);
            var list = new List<IInfo>();
            foreach (var item in collection)
            {
                list.Add(item as IInfo);
            }
            return list;
        }
        [Obsolete()]
        public int RecordCount(int? CityId, int? RegionId, int? CircleId, bool? IsBiz, int? ObjectType, int? MinPrice, int? MaxPrice, string KeyWord, DateTime? StartTime, DateTime? EndTime, bool? IsPic)
        {
            TModel T = new TModel();
            string sqlQuery = GetSqlQuery(CityId, RegionId, CircleId, IsBiz,ObjectType,MinPrice,MaxPrice,KeyWord,StartTime,EndTime,IsPic);
            return T.DataRecordCount(sqlQuery);
        }
        [Obsolete("不再使用")]
        public string GetSqlQuery(int? CityId, int? RegionId, int? CircleId, bool? IsBiz, int? ObjectType, int? MinPrice, int? MaxPrice, string KeyWord,DateTime? StartTime,DateTime? EndTime,bool? IsPic)
        {
            TModel T = new TModel();
            string sqlQuery = "select * from " + T.DataAccess.TableName + "";
            bool bWhere = false;
            
            if (CityId != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " CityId=" + CityId + "";
            }
            if (RegionId != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " RegionId=" + RegionId + "";
            }
            if (CircleId != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " CircleId=" + CircleId + "";
            }
            if (IsBiz != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " IsBiz=" + Convert.ToInt32(IsBiz) + "";
            }
            if (ObjectType != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " ObjectType=" + Convert.ToInt32(ObjectType) + "";
            }
            if (MinPrice != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " Price>=" + Convert.ToInt32(MinPrice) + "";
            }
            if (MaxPrice != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " Price<=" + Convert.ToInt32(MaxPrice) + "";
            }
            if (KeyWord != null)
            {
                var SearchFields = KeyWordSearchFields();
                if (SearchFields.Count > 0)
                {
                    string tempSql = string.Empty;
                    foreach (var field in SearchFields)
                    {
                        if (string.IsNullOrEmpty(tempSql))
                        {
                            tempSql += "" + field + " like '%" + KeyWord + "%'";
                        }
                        else
                        {
                            tempSql += " or " + field + " like '%" + KeyWord + "%'";
                        }
                    }
                    tempSql="("+tempSql+")";
                    if (!bWhere)
                    {
                        sqlQuery += " where";
                        bWhere = true;
                    }
                    else
                    {
                        sqlQuery += " and";
                    }
                    sqlQuery += tempSql;
                }

            }
            if (StartTime != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " DateCreated>='" + StartTime + "'";
            }
            if (EndTime != null)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " DateCreated<='" + EndTime + "'";
            }
            if (IsPic==true)
            {
                if (!bWhere)
                {
                    sqlQuery += " where";
                    bWhere = true;
                }
                else
                {
                    sqlQuery += " and";
                }
                sqlQuery += " (Pictures is not null)";
            }
            sqlQuery += " order by [id] desc";
            return sqlQuery;
        }

        //public List<TModel> DataSelectPaging(int? CityId, int? RegionId, int? CircleId, IEnumerable<DbParameter> DbParameters, int PageSize, int PageIndex, string sqlQuery = null)
        //{
        //    List<DbParameter> Params = new List<DbParameter>();
        //    DbParameter p = null;
            
        //    if (CityId != null)
        //    {
        //        p = this.CreateParameter();
        //        p.ParameterName = "CityId";
        //        p.Value = CityId;
        //        p.DbType = DbType.Int32;
        //        Params.Add(p);
        //    }
        //    if (RegionId != null)
        //    {
        //        p = this.CreateParameter();
        //        p.ParameterName = "RegionId";
        //        p.Value = RegionId;
        //        p.DbType = DbType.Int32;
        //        Params.Add(p);
        //    }
        //    if (CircleId != null)
        //    {
        //        p = this.CreateParameter();
        //        p.ParameterName = "CircleId";
        //        p.Value = CircleId;
        //        p.DbType = DbType.Int32;
        //        Params.Add(p);
        //    }
        //    if (DbParameters != null)
        //    {
        //        foreach (var param in DbParameters)
        //        {
        //            Params.Add(param);
        //        }
        //    }
        //    if (sqlQuery == null)
        //    {
        //        return DataSelectPaging(Params, PageSize, PageIndex);
        //    }
        //    else
        //    {
        //        return DataSelectPaging(sqlQuery, Params, PageSize, PageIndex);
        //    }
        //}

        //public List<IInfo> SelectPaging(int? CityId, int? RegionId, int? CircleId, IEnumerable<DbParameter> DbParameters, int PageSize, int PageIndex, string sqlQuery = null)
        //{
        //    var collection = DataSelectPaging(CityId, RegionId, CircleId, DbParameters, PageSize, PageIndex, sqlQuery);
        //    return new List<IInfo>(collection);
        //}

        private DbParameter CreateParameter()
        {
            return this.DataAccess.db.DbProviderFactory.CreateParameter();
        }
        #endregion

        protected override DataAccess<TModel, int> GetProvider()
        {
            throw new NotImplementedException();
        }

        private ObjectType _objType;
        private ObjectType ObjType
        {
            get
            {
                if (_objType == null)
                {
                    //if (this.ContainsProperty("ObjectTypeCollection"))
                    //{
                    //    var types = this.GetValue("ObjectTypeCollection") as IEnumerable<ObjectType>;
                    //    if (types != null)
                    //    {
                    //        if (this.ContainsProperty("ObjectType"))
                    //        {
                    //            var TypeId = Convert.ToInt32(this.GetValue("ObjectType"));
                    //            _objType = types.FirstOrDefault(item => item.Id == TypeId);
                    //        }

                    //    }
                    //}
                    if (this.ContainsProperty("ObjectType"))
                    {

                        var objType = this.GetValue("ObjectType");
                        if (objType != null)
                        {
                            var typeId = Convert.ToInt32(objType);
                            var types = this.GetValue("ObjectTypeCollection") as IEnumerable<ObjectType>;
                            if (types != null)
                            {
                                _objType = types.FirstOrDefault(item => item.Id == typeId);
                            }
                        }
                    }
                }
                //if (_ObjType == null)
                //{
                _objType = new ObjectType();
                //}
                return _objType;
            }
        }


        #region IInfo成员,子类可重写
        
        private InfoDetail _detail;
        [DataMember]
        public virtual InfoDetail Detail
        {
            get
            {
                if (_detail == null)
                {
                    _detail = new InfoDetail();
                    //标题
                    if (this.ContainsProperty("Title"))
                    {
                        _detail.Title = this.GetValue("Title") as string;
                    }

                    //内容
                    if (this.ContainsProperty("Content"))
                    {
                        _detail.Content = this.GetValue("Content") as string;
                    }

                    //成色
                    if (this.ContainsProperty("Quality"))
                    {
                        _detail.Quality = this.GetValue("Quality") as int?;
                    }

                    //价格
                    if (this.ContainsProperty("Price"))
                    {
                        _detail.Price = Convert.ToInt32(this.GetValue("Price"));
                    }

                    //类别
                    _detail.ObjectType = this.ObjType;

                    //电话
                    if (this.ContainsProperty("Phone"))
                    {
                        _detail.Phone = this.GetValue("Phone") as string;
                    }

                    //小区
                    if (this.ContainsProperty("District"))
                    {
                        _detail.District = this.GetValue("District") as string;
                    }

                    //图片
                    if (this.ContainsProperty("PictureList"))
                    {
                        _detail.PictureList = this.GetValue("PictureList") as List<string>;
                    }
                }
                return _detail;
            }
            private set//使系列化时不出错.
            {
                _detail = value;
            }
        }
        //[DataMember]
        public virtual List<ActionLink> SameCircleLinks
        {
            get
            {
                List<ActionLink> links = new List<ActionLink>();
                if (HttpContext.Current == null)//序列化类时
                {
                    return links;
                }
                var mvcHandler = HttpContext.Current.Handler as MvcHandler;
                if (mvcHandler != null)
                {
                    if (this.RegionId != null)
                    {
                        var routeValues = mvcHandler.RequestContext.RouteData.AddRouteValue("region", this.RegionId);
                        //var routeValues = HttpContext.Current.CurrentHandler as System.Web.Mvc.MvcHttpHandler;
                        links.Add(new ActionLink()
                        {
                            LinkText =this.Region.Name,
                            ControllerName = this.Category.Parent.Code,
                            ActionName = this.Category.Code,
                            RouteValues = routeValues
                        });
                    }
                    if (this.CircleId != null)
                    {
                        RouteValueDictionary routeValues = null;
                        if (this.RegionId != null)
                        {
                            routeValues = mvcHandler.RequestContext.RouteData.AddRouteValues(new { region = this.RegionId, circle = this.CircleId });
                        }
                        else
                        {
                            routeValues = mvcHandler.RequestContext.RouteData.AddRouteValue("circle",this.CircleId);
                        }

                        links.Add(new ActionLink()
                        {
                            LinkText =this.Circle.Name,
                            ControllerName = this.Category.Parent.Code,
                            ActionName = this.Category.Code,
                            RouteValues=routeValues
                        });
                    }
                }
                return links;
            }
        }

        public virtual List<IInfo> RecentOthers(int count)
        {
            string sqlQuery = "select * from " + DataAccess.TableName + " where CityId=" + this.CityId + "";
            if(this.RegionId!=null)
            {
                sqlQuery+=" and RegionId=" + this.RegionId + "";
            }
            if(this.CircleId!=null)
            {
                sqlQuery += " and CircleId=" + this.CircleId + "";
            }
            var collection = this.DataSelectTop(sqlQuery, count);
            List<IInfo> list = new List<IInfo>();
            foreach (var item in collection)
            {
                list.Add(item as IInfo);
            }
            return list;
        }

        /// <summary>
        /// 指定搜索时要搜索的字段.
        /// </summary>
        /// <returns></returns>
        public virtual List<string> KeyWordSearchFields()
        {
            List<string> list = new List<string>();
            TModel T = new TModel();
            var properties = T.GetType().GetProperties();

            var collection = properties.Where(p => p.Name == "Title");
            if (collection.Count() > 0)
            {
                list.Add(collection.ElementAt(0).Name);
            }

            collection = properties.Where(p => p.Name == "Content");
            if (collection.Count() > 0)
            {
                list.Add(collection.ElementAt(0).Name);
            }
            return list;
        }

        public virtual string PageTitle
        {
            get
            {
                string cityName = string.Empty;
                if (HttpContext.Current == null)//序列化类时
                {
                    return null;
                }
                var mvcHandler = System.Web.HttpContext.Current.Handler as System.Web.Mvc.MvcHandler;
                if (mvcHandler == null)//ajax
                {
                    return null;
                }
                var routeData = mvcHandler.RequestContext.RouteData;
                if (routeData.Values["action"].ToString().ToLower() != "detail")
                {
                    if (routeData != null)
                    {
                        var cityCode = routeData.Values["city"];
                        if (cityCode != null && !string.IsNullOrWhiteSpace(cityCode.ToString()))
                        {
                            var city = City.Cities.FirstOrDefault(item => string.Compare(cityCode.ToString(), item.Code, true) == 0);
                            if (city != null)
                            {
                                cityName = city.ShortName;
                            }
                        }
                    }
                    if (this is Recruit)
                    {
                        return "【" + cityName + "" + this.Category.Name + "招聘】 - " + cityName + "淘金网";
                    }
                    else if(this is JobSeek)
                    {
                        return "【" + cityName + "求职" + this.Category.Name + "】 - " + cityName + "淘金网";
                    }
                    return "【" + cityName + "" + this.Category.Name + "|" + cityName + "" + this.Category.Parent.Name + "】 - " + cityName + "淘金网";
                }
                else
                {
                    if (this.City != null)
                    {
                        cityName = this.City.ShortName;
                    }
                    if (this is Recruit)
                    {
                        var recruit=this as Recruit;
                        return "" + recruit.JobName + " - " + cityName + "淘金网";
                    }
                    else if (this is JobSeek)
                    {
                        var jobSeek = this as JobSeek;
                        return "" + jobSeek.Resume.RealName + " - 【" + jobSeek.Resume.RealName + "简历】 - " + cityName + "淘金网";
                    }

                    string title = this.Detail.Title;
                    if (this.Region != null)
                    {
                        title += " - " + this.Region.Name + "";
                    }
                    if (this.Circle != null)
                    {
                        title += "" + this.Circle.Name + "";
                    }
                    title += "" + this.Category.Name + " - " + cityName + "淘金网";
                    return title;
                }
            }
        }

        public virtual string PageDescription
        {
            get
            {
                string cityName = string.Empty;
                if (HttpContext.Current == null)//序列化类时
                {
                    return null;
                }
                var mvcHandler = System.Web.HttpContext.Current.Handler as System.Web.Mvc.MvcHandler;
                if (mvcHandler == null)//ajax
                {
                    return null;
                }
                var routeData = mvcHandler.RequestContext.RouteData;
                if (routeData.Values["action"].ToString().ToLower() != "detail")
                {
                    var cityCode = routeData.Values["city"];
                    if (cityCode != null && !string.IsNullOrWhiteSpace(cityCode.ToString()))
                    {
                        var city = City.Cities.FirstOrDefault(item => string.Compare(cityCode.ToString(), item.Code, true) == 0);
                        if (city != null)
                        {
                            cityName = city.ShortName;
                        }
                    }
                    if (this is Recruit)
                    {
                        return "" + this.Category.Name + "，淘金网" + cityName + "" + this.Category.Name + "招聘频道，每天免费为求职者提供上万条最新" + cityName + "招聘" + this.Category.Name + "职位信息，同时为企业提供免费发布" + cityName + "招聘" + this.Category.Name + "职位信息平台。";
                    }
                    else if (this is JobSeek)
                    {
                        return "" + this.Category.Name + "，淘金网" + cityName + "" + this.Category.Name + "频道，为求职者提供免费发布" + cityName + "求职" + this.Category.Name + "、" + cityName + "" + this.Category.Name + "简历信息的平台,同时为企业提供大量最新" + cityName + "求职" + this.Category.Name + "、" + cityName + "" + this.Category.Name + "简历信息.最好的" + cityName + "" + this.Category.Name + "信息就在淘金网" + cityName + "" + this.Category.Name + "频道.";
                    }
                    return "" + this.Category.Name + "，" + cityName + "" + this.ListLink.LinkText + "频道为您提供大量精选" + cityName + "" + this.Category.Name + "信息，在这里有大量的" + cityName + "" + this.Category.Name + "信息供您查询。-taojen.com";
                }
                else
                {
                    var description = string.Empty;
                    if (this is Recruit)
                    {
                        var recruit = this as Recruit;
                        description = recruit.JobName;
                        if (!string.IsNullOrEmpty(recruit.JobDescription))
                        {
                            description += "," + recruit.JobDescription.RemoveHtml().Left(100) + "";
                        }
                        return description;
                    }
                    else if (this is JobSeek)
                    {
                        var jobSeek = this as JobSeek;
                        description = "" + jobSeek.Resume.RealName + ",求" + jobSeek.JobName + "";
                        if (!string.IsNullOrEmpty(jobSeek.AboutMe))
                        {
                            description += "," + jobSeek.AboutMe.RemoveHtml().Left(100) + "";
                        }
                        return description;
                    }

                    description=""+this.Detail.Title+"";
                    if (!string.IsNullOrEmpty(this.Detail.Content))
                    {
                        description += ","+this.Detail.Content.RemoveHtml().Left(100)+"";
                    }
                    return description;
                }
            }
        }

        public virtual string PageKeywords
        {
            get
            {
                string cityName = string.Empty;
                if (HttpContext.Current == null)//序列化类时
                {
                    return null;
                }
                var mvcHandler = System.Web.HttpContext.Current.Handler as System.Web.Mvc.MvcHandler;
                if (mvcHandler == null)//ajax
                {
                    return null;
                }
                var routeData = mvcHandler.RequestContext.RouteData;
                if (routeData.Values["action"].ToString().ToLower() != "detail")
                {
                    var cityCode = routeData.Values["city"];
                    if (cityCode != null && !string.IsNullOrWhiteSpace(cityCode.ToString()))
                    {
                        var city = City.Cities.FirstOrDefault(item => string.Compare(cityCode.ToString(), item.Code, true) == 0);
                        if (city != null)
                        {
                            cityName = city.ShortName;
                        }
                    }
                    var array = this.Category.Name.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
                    var keys = string.Empty;
                    foreach (var item in array)
                    {
                        if (this is Recruit)
                        {
                            return ""+cityName+""+this.Category.Name+"招聘,"+cityName+"招聘"+this.Category.Name+"人员";
                        }
                        else if (this is JobSeek)
                        {
                            keys += "," + cityName + "" + item + "求职";
                        }
                        else
                        {
                            keys += "," + cityName + "" + item + "";
                        }
                    }
                    if (!string.IsNullOrEmpty(keys))
                    {
                        keys = keys.Substring(1);
                    }
                    return keys;


                }
                else 
                {
                    if (this.City != null)
                    {
                        cityName = this.City.ShortName;
                    }
                    if (this is Recruit)
                    {
                        var recruit = this as Recruit;
                        return ""+recruit.Company.CompanyName+","+recruit.Company.CompanyName+"招聘";
                    }
                    else if (this is JobSeek)
                    {
                        var jobSeek = this as JobSeek;
                        return "" + jobSeek.Resume.RealName + "," + jobSeek.Resume.Name + "简历";
                    }
                    else
                    {
                        var array = this.Category.Name.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
                        var keys = string.Empty;
                        foreach (var item in array)
                        {
                            keys += "," + cityName + "" + item + "";
                        }
                        if (!string.IsNullOrEmpty(keys))
                        {
                            keys = keys.Substring(1);
                        }
                        return keys;
                    }
                }
                
            }
        }

        public virtual List<ActionLink> InfoPath
        {
            get
            {
                if (HttpContext.Current == null)//序列化类时
                {
                    return null;
                }
                var mvcHandler = System.Web.HttpContext.Current.Handler as System.Web.Mvc.MvcHandler;
                if (mvcHandler == null)//Ajax
                {
                    return null;
                }
                var routeData = mvcHandler.RequestContext.RouteData;

                var InfoPath = new List<ActionLink>();
                //string cityName = string.Empty;
                string regionName = string.Empty;
                short? regionId = null;
                string circleName = string.Empty;
                short? circleId = null;
                if (routeData.Values["action"].ToString().ToLower() != "detail")
                {
                    //if (routeData != null)
                    //{
                        var cityCode = routeData.Values["city"];
                        this._city = City.Cities.FirstOrDefault(item => string.Compare(cityCode.ToString(), item.Code, true) == 0);
                        //if (city != null)
                        //{
                        //    cityName = city.Name;
                        //}
                    //}
                        if (routeData.Values["region"] != null)
                    {
                        short _regionid = Convert.ToInt16(routeData.Values["region"]);
                        if (_regionid > 0)
                        {
                            regionId=_regionid;
                            var region = Framework.Common.Region.GetRegion(regionId.Value);
                            regionName = region.Name;

                        }
                    }
                        if (routeData.Values["circle"] != null)
                    {
                        short _circleid = Convert.ToInt16(routeData.Values["circle"]);
                        if (_circleid > 0)
                        {
                            circleId = _circleid;
                            var circle = Framework.Common.Circle.GetCircle(circleId.Value);
                            circleName = circle.Name;

                        }
                    }
                }
                else
                {
                    //if (this.City != null)
                    //{
                    //    cityName = this.City.Name;
                    //}
                    if (this.Region != null)
                    {
                        regionName = this.Region.Name;
                        regionId = this.Region.Id;
                    }
                    if (this.Circle != null)
                    {
                        circleName = this.Circle.Name;
                        circleId = this.Circle.Id;
                    }

                }
                InfoPath.Add(new ActionLink()
                {
                    //Text = "" + cityName + "淘金信息",
                    //Url = Utils.RelativeWebRoot
                    LinkText = "" + this.City.ShortName + "淘金信息",
                    ControllerName = "Home",
                    ActionName = "Default",
                    //RouteValues = new {city=this.City.Code }
                    RouteValues=new RouteValueDictionary(new {city=this.City.Code })

                });
                //InfoPath.Add(new InfoLink()
                //{
                //    Text = ""+this.BigCategory.Name+"",
                //    Url = this.BigCategory.Url

                //});
                InfoPath.Add(this.ParentLink);

                //if (this.BigCategory.SubCategories != null)
                //{
                //    foreach (var category in this.BigCategory.SubCategories)
                //    {
                //        InfoPath.Add(new InfoLink()
                //        {
                //            Text=category.Name,
                //            Url=category.Url
                //        });
                //    }
                //}
                //InfoPath.Add(new InfoLink()
                //{
                //    Text = "" + cityName + "" + this.SmallCategory.Name + "",
                //    Url = this.SmallCategory.Url

                //});
                InfoPath.Add(this.ListLink);
                if (!string.IsNullOrWhiteSpace(regionName))
                {
                    //InfoPath.Add(new InfoLink()
                    //{
                    //    Text = "" + regionName + "" + this.SmallCategory.Name + "",
                    //    Url = ""+this.SmallCategory.Url+"?region="+regionId+""

                    //});
                    InfoPath.Add(new ActionLink()
                    {
                        LinkText=regionName+this.Category.Name,
                        ControllerName = this.ListLink.ControllerName,
                        ActionName = this.ListLink.ActionName,
                        RouteValues=new RouteValueDictionary(new{region=regionId})
                    });
                }
                if (!string.IsNullOrWhiteSpace(circleName))
                {
                    //InfoPath.Add(new InfoLink()
                    //{
                    //    Text = "" + circleName + "" + this.SmallCategory.Name + "",
                    //    Url = "" + this.SmallCategory.Url + "&&region=" + regionId + "&&circle="+circleId+""
                    //});
                    InfoPath.Add(new ActionLink()
                    {
                        LinkText = circleName + this.Category.Name,
                        ControllerName = this.ListLink.ControllerName,
                        ActionName = this.ListLink.ActionName,
                        RouteValues = new RouteValueDictionary(new { region = regionId, circle=circleId })
                    });
                }
                return InfoPath;
            }
        }
        private List<ActionLink> _cityLinks;
        public virtual List<ActionLink> CityLinks
        {
            get
            {
                if (_cityLinks == null)
                {
                    _cityLinks = new List<ActionLink>();
                    //var cities = City.SelectTop(14);
                    var rand = new Random(DateTime.Now.Millisecond);
                    //随机添加14个城市.
                    var list = City.Cities.Where(item => item.Sequence == 1).ToList();
                    var cities = new List<City>();
                    while (true)
                    {
                        if (cities.Count >= 14)
                        {
                            break;
                        }
                        var city = list[rand.Next(0, list.Count - 1)];
                        if (!string.IsNullOrEmpty(city.Code)&&!cities.Contains(city))
                        {
                            cities.Add(city);
                        }
                    }
                    foreach (var city in cities)
                    {
                        var link = new ActionLink()
                        {
                            LinkText = city.ShortName + "" + this.ListLink.LinkText + "",
                            ControllerName = this.ListLink.ControllerName,
                            ActionName = this.ListLink.ActionName,
                            RouteValues = new RouteValueDictionary(new { city = city.Code })
                        };
                        _cityLinks.Add(link);
                    }
                }
                return _cityLinks;
            }
        }
        public virtual List<ActionLink> FriendLinks
        {
            get
            {
                var list = new List<ActionLink>();
                //list.Add(new ActionLink()
                //{
                //    LinkText = "友情链接1",
                //    ControllerName = this.ListLink.ControllerName,
                //    ActionName = this.ListLink.ActionName,

                //});
                //list.Add(new ActionLink()
                //{
                //    LinkText = "友情链接2",
                //    ControllerName = this.ListLink.ControllerName,
                //    ActionName = this.ListLink.ActionName,
                //});
                return list;
            }
        }
        
        #endregion

        #region IInfo成员,没有实现，子类必须自己实现
        private InfoCategory _category;
        public InfoCategory Category
        {
            get
            {
                if (_category == null)
                {
                    if (this is Recruit)
                    {
                        var recruit = this as Recruit;
                        _category = InfoCategory.GetCategory(recruit.JobType);
                        _category.Parent.Code = "zhaopin";
                        _category.Parent.Name = "招聘";
                    }
                    else if (this is JobSeek)
                    {
                        var jobSeek = this as JobSeek;
                        _category = InfoCategory.GetCategory(jobSeek.JobType);
                        _category.Parent.Code = "qiuzhi";
                        _category.Parent.Name = "求职";
                    }
                    else if (this is YellowPage)
                    {
                        var yp = this as YellowPage;
                        _category = InfoCategory.GetCategory(yp.YellowPageType);
                    }
                    else
                    {
                        _category = InfoCategory.GetCategory(this);
                    }
                }
                return _category;
            }
        }

        private List<ObjectType> _objectTypeCollection;
        public virtual List<ObjectType> ObjectTypeCollection
        {
            get
            {
                if (_objectTypeCollection == null)
                {
                    _objectTypeCollection = new List<ObjectType>();
                }
                return _objectTypeCollection;
                //throw new NotImplementedException();
            }
        }

        private List<InfoTag> _tagCollection;
        public virtual List<InfoTag> TagCollection
        {
            get 
            {
                if (_tagCollection == null)
                {
                    _tagCollection = new List<InfoTag>();
                }
                return _tagCollection;
                //throw new NotImplementedException(); 
            }
        }
        #endregion

        private ActionLink _link;
        public ActionLink Link
        {
            get
            {
                if (_link == null)
                {
                    _link = new ActionLink()
                    {
                        LinkText=this.TitleDisplay,
                        ControllerName = this.Category.Parent.Code,
                        ActionName = "Detail",
                        RouteValues = new RouteValueDictionary(new { smallcategory = this.Category.Code, id = this.Id })
                    };
                }
                return _link;
            }
        }

        private ActionLink _postLink;
        public ActionLink PostLink
        {
            get
            {
                if (_postLink == null)
                {
                    _postLink = new ActionLink()
                    {
                        ControllerName = this.Category.Parent.Code,
                        ActionName = "Post",
                        RouteValues = new RouteValueDictionary(new { smallcategory = this.Category.Code })
                    };
                }
                return _postLink;
            }
        }

        private ActionLink _parentLink;
        public ActionLink ParentLink
        {
            get
            {
                if (_parentLink == null)
                {
                    if (HttpContext.Current == null)//序列化类时
                    {
                        return null;
                    }
                    var mvcHandler = System.Web.HttpContext.Current.Handler as System.Web.Mvc.MvcHandler;
                    if (mvcHandler == null)//ajax
                    {
                        return null;
                    }
                    var routeData = mvcHandler.RequestContext.RouteData;
                    if (routeData == null)
                    {
                        return null;
                    }
                    string cityName = null;
                    var cityCode = routeData.Values["city"];
                    if (cityCode != null && !string.IsNullOrWhiteSpace(cityCode.ToString()))
                    {
                        var city = City.Cities.FirstOrDefault(item => item.Code != null && item.Code.ToLower() == cityCode.ToString().ToLower());
                        if (city != null)
                        {
                            cityName = city.ShortName;
                        }
                    }
                    _parentLink = new ActionLink()
                    {
                        LinkText = "" + cityName + this.Category.Parent.Name,
                        ControllerName = this.Category.Parent.Code,
                        ActionName = "Index",
                    };
                }
                return _parentLink;
            }
        }

        private ActionLink _listLink;
        public ActionLink ListLink
        {
            get
            {
                if (_listLink == null)
                {
                    _listLink = new ActionLink()
                    {
                        LinkText = this.Category.Name,
                        ControllerName = this.Category.Parent.Code,
                        ActionName = this.Category.Code
                    };
                }
                return _listLink;
            }
        }

        private static Dictionary<int, int> _infoCount;
        public virtual Dictionary<int, int> InfoCount
        {
            get
            {
                if (_infoCount == null)
                {
                    _infoCount = new Dictionary<int, int>();
                }
                return _infoCount;
            }
        }


        public abstract string TitleDisplay
        {
            get;
        }
    }
}
