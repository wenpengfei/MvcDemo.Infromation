using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using Framework;
using System.Web.Mvc;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 公司信息.
    /// </summary>
    [Table(Name = "Info_Company")]
    public class Company:ModelBase<Company,int>
    {
        [Column(IsPrimaryKey = true)]
        public int Id
        {
            get;
            set;
        }
        public int? UserId
        {
            get;
            set;
        }
        public string CompanyName
        {
            get;
            set;
        }
        /// <summary>
        /// 公司别称.
        /// </summary>
        public string CompanyName2
        {
            get;
            set;
        }
        /// <summary>
        /// 行业.
        /// </summary>
        public byte TradeId
        {
            get;
            set;
        }

        private CompanyTrade _trade;
        public CompanyTrade Trade
        {
            get
            {
                if (_trade == null)
                {
                    _trade = CompanyTrade.Trades.FirstOrDefault(item => item.Id == this.TradeId);
                }
                return _trade;
            }
        }
        /// <summary>
        /// 公司性质.
        /// </summary>
        public byte TypeId
        {
            get;
            set;
        }

        private CompanyType _type;
        public CompanyType Type
        {
            get
            {
                if (_type == null)
                {
                    _type = CompanyType.Types.FirstOrDefault(item => item.Id == this.TypeId);
                }
                return _type;
            }
        }
        /// <summary>
        /// 公司规模.
        /// </summary>
        public byte SizeId
        {
            get;
            set;
        }
        private CompanySize _size;
        public CompanySize Size
        {
            get
            {
                if (_size == null)
                {
                    _size = CompanySize.Sizes.FirstOrDefault(item => item.Id == this.SizeId);
                }
                return _size;
            }
        }

        public string Email
        {
            get;
            set;
        }
        public string Address
        {
            get;
            set;
        }
        /// <summary>
        /// 公司简介.
        /// </summary>
        public string Content
        {
            get;
            set;
        }
        public string ContactPerson
        {
            get;
            set;
        }
        /// <summary>
        /// 固定电话.
        /// </summary>
        public string Phone
        {
            get;
            set;
        }
        /// <summary>
        /// 移动电话.
        /// </summary>
        public string Mobile
        {
            get;
            set;
        }
        public DateTime DateCreated
        {
            get;
            set;
        }
        public DateTime DateModified
        {
            get;
            set;
        }
        /// <summary>
        /// 信息来源
        /// </summary>
        public long? Source
        {
            get;
            set;
        }

        private string _url;
        public string Url(UrlHelper urlHelper)
        {
            if (_url == null)
            {
                _url = urlHelper.Action("Index", "QY", new { id = this.Id });
                //_url = urlHelper.Action("Index", "QY", new { id = this.UserId });
            }
            return _url;
        }

        protected override DataAccess<Company, int> GetProvider()
        {
            return new CompanyDataAccess();
        }
    }
}
