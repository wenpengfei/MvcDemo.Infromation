using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Infomation.Core
{
    public class WebUtils
    {
        private static bool? _isLocal;
        public static bool IsLocal
        {
            get
            {
                if (_isLocal == null)
                {
                    //_isLocal = HttpContext.Current.Request.IsLocal;

                    //_isLocal = true;//申请广告时再改回去.

                    var url = HttpContext.Current.Request.Url.ToString().ToLower();
                    if (url.StartsWith("http://localhost") || url.StartsWith("http://127.0.0.1"))
                    {
                        _isLocal = true;
                    }
                    else
                    {
                        _isLocal = false;
                    }
                }
                return _isLocal.Value;
            }
        }
        public static void ShowAd()
        {
            _isLocal = false;
        }
        public static void HidAd()
        {
            _isLocal = true;
        }
    }
}
