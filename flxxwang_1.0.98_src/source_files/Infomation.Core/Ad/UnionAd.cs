using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework;
using Framework.Data;

namespace Infomation.Core
{
    /// <summary>
    /// <para>Google、Baidu等联盟广告代码. </para>
    /// <para>-------------------------------------</para>
    /// <para>开发合作：分类信息网(flxxwang.com)、淘金分类信息网(taojen.com)</para>
    /// <para>草根人物(caogenrenwu.com)、网购中心(wanggouzhongxin.com)</para>
    /// <para>网络CD(wangluocd.com)</para>
    /// </summary>
    public class UnionAd:ModelBase<UnionAd,int>
    {
        public int Id
        {
            get;
            set;
        }
        public string Name
        {
            get;
            set;
        }
        public string Size
        {
            get;
            set;
        }
        public string Code
        {
            get;
            set;
        }
        public byte Union
        {
            get;
            set;
        }

        private static List<UnionAd> _ads;
        public static List<UnionAd> Ads
        {
            get
            {
                if (_ads == null)
                {
                    _ads = UnionAd.SelectAll();
                }
                return _ads;
            }
        }

        private static List<UnionAd> _baiduAds;
        public static List<UnionAd> BaiduAds
        {
            get
            {
                if (_baiduAds == null)
                {
                    _baiduAds = Ads.Where(ad=>ad.Union==1).ToList();
                }
                return _baiduAds;
            }
        }
        private static List<UnionAd> _googleAds;
        public static List<UnionAd> GoogleAds
        {
            get
            {
                if (_googleAds == null)
                {
                    _googleAds = Ads.Where(ad => ad.Union == 2).ToList();
                }
                return _googleAds;
            }
        }
        public static UnionAd Baidu_300_250
        {
            get
            {
                return BaiduAds.FirstOrDefault(ad => ad.Size == "300*250");
            }
        }
        public static UnionAd Baidu_336_280
        {
            get
            {
                return BaiduAds.FirstOrDefault(ad => ad.Size == "336*280");
            }
        }
        
        public static UnionAd Baidu_160_600
        {
            get
            {
                return BaiduAds.FirstOrDefault(ad => ad.Size == "160*600");
            }
        }
        public static UnionAd Baidu_728_90
        {
            get
            {
                return BaiduAds.FirstOrDefault(ad => ad.Size == "728*90");
            }
        }
        public static UnionAd Baidu_960_90
        {
            get
            {
                return BaiduAds.FirstOrDefault(ad => ad.Size == "960*90");
            }
        }

        public static UnionAd Google_160_600
        {
            get
            {
                return GoogleAds.FirstOrDefault(ad => ad.Size == "160*600");
            }
        }
        public static UnionAd Google_300_250
        {
            get
            {
                return GoogleAds.FirstOrDefault(ad => ad.Size == "300*250");
            }
        }
        public static UnionAd Google_336_280
        {
            get
            {
                return GoogleAds.FirstOrDefault(ad => ad.Size == "336*280");
            }
        }
        public static UnionAd Google_728_90
        {
            get
            {
                return GoogleAds.FirstOrDefault(ad => ad.Size == "728*90");
            }
        }
        protected override DataAccess<UnionAd, int> GetProvider()
        {
            throw new NotImplementedException();
        }
    }
}
