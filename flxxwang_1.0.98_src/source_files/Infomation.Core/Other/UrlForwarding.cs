using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using System.Web;

namespace Infomation.Core
{
    public class UrlForwarding
    {
        private static Dictionary<string, string> _forwardings;
        public static Dictionary<string, string> Forwardings
        {
            get
            {
                if (_forwardings == null)
                {
                    _forwardings = new Dictionary<string, string>();
                    var filePath=HttpContext.Current.Server.MapPath("/Content/ConfigFile/UrlForwarding.xml");
                    var root= XElement.Load(filePath);
                    var elements = root.Elements("Forwarding");
                    foreach (var elem in elements)
                    {
                        _forwardings.Add(elem.Attribute("QueryString").Value, elem.Attribute("Redirect").Value);
                    }
                }
                return _forwardings;
            }
        }
    }
}
