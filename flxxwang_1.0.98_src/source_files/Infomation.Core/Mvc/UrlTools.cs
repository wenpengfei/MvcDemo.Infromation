using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Routing;
using System.Web.Mvc;

namespace Infomation.Core.Mvc
{
    public static class UrlTools
    {
        public static string AddRouteValue(this UrlHelper Url, RouteData routeData, string key, object value)
        {
            //var Values = new RouteValueDictionary(routeData.Values);

            //Values[key] = value;
            //foreach (string item in Url.RequestContext.HttpContext.Request.QueryString)
            //{
            //    if (item == key)
            //    {
            //        continue;
            //    }
            //    Values[item] = Url.RequestContext.HttpContext.Request.QueryString[item];
            //}

            var Values = routeData.AddRouteValue(key, value);
            return Url.Action(null, null, Values);
        }

        public static string RemoveRouteValue(this UrlHelper Url, RouteData routeData, string key)
        {
            //var Values = new RouteValueDictionary(routeData.Values);
            //var route= routeData.Route as System.Web.Routing.Route;
            //if (route != null && route.Defaults.ContainsKey(key))
            //{
            //    Values[key] = route.Defaults[key];
            //}
            //else
            //{
            //    Values.Remove(key);
            //}
            //foreach (string item in Url.RequestContext.HttpContext.Request.QueryString)
            //{
            //    if (item == key)
            //    {
            //        continue;
            //    }
            //    Values[item] = Url.RequestContext.HttpContext.Request.QueryString[item];
            //}

            var Values = routeData.RemoveRouteValue(key);
            return Url.Action(null, null, Values);
        }

        public static string AddRouteValues(this UrlHelper Url, RouteData routeData, object addRouteValues)
        {
            //var Values = new RouteValueDictionary(routeData.Values);

            //var properties = addRouteValues.GetType().GetProperties();
            //foreach (var p in properties)
            //{
            //    Values[p.Name] = p.GetValue(addRouteValues, null);
            //}
            //foreach (string item in Url.RequestContext.HttpContext.Request.QueryString)
            //{
            //    if (Values.ContainsKey(item))
            //    {
            //        continue;
            //    }
            //    Values[item] = Url.RequestContext.HttpContext.Request.QueryString[item];
            //}

            var Values = routeData.AddRouteValues(addRouteValues);
            return Url.Action(null, null, Values);
        }

        public static string RemoveRouteValues(this UrlHelper Url, RouteData routeData, string[] keys)
        {
            //var Values = new RouteValueDictionary(routeData.Values);
            //var route = routeData.Route as System.Web.Routing.Route;
            //foreach (var key in keys)
            //{
            //    if (route != null && route.Defaults.ContainsKey(key))
            //    {
            //        Values[key] = route.Defaults[key];
            //    }
            //    else
            //    {
            //        Values.Remove(key);
            //    }
            //}
            //foreach (string item in Url.RequestContext.HttpContext.Request.QueryString)
            //{
            //    if (keys.Contains(item))
            //    {
            //        continue;
            //    }
            //    Values[item] = Url.RequestContext.HttpContext.Request.QueryString[item];
            //}

            var Values = routeData.RemoveRouteValues(keys);
            return Url.Action(null, null, Values);
        }


        ///////////////
        public static RouteValueDictionary AddRouteValue(this RouteData routeData, string key, object value)
        {
            var Values = new RouteValueDictionary(routeData.Values);

            Values[key] = value;
            //foreach (string item in Url.RequestContext.HttpContext.Request.QueryString)
            foreach (string item in HttpContext.Current.Request.QueryString)
            {
                if (item == key)
                {
                    continue;
                }
                //Values[item] = Url.RequestContext.HttpContext.Request.QueryString[item];
                Values[item] = HttpContext.Current.Request.QueryString[item];
            }
            //return Url.Action(null, null, Values);
            return Values;
        }

        public static RouteValueDictionary RemoveRouteValue(this RouteData routeData, string key)
        {
            var Values = new RouteValueDictionary(routeData.Values);
            var route = routeData.Route as System.Web.Routing.Route;
            if (route != null && route.Defaults.ContainsKey(key))
            {
                Values[key] = route.Defaults[key];
            }
            else
            {
                Values.Remove(key);
            }
            //foreach (string item in Url.RequestContext.HttpContext.Request.QueryString)
            foreach (string item in HttpContext.Current.Request.QueryString)
            {
                if (item == key)
                {
                    continue;
                }
                //Values[item] = Url.RequestContext.HttpContext.Request.QueryString[item];
                Values[item] = HttpContext.Current.Request.QueryString[item];
            }
            //return Url.Action(null, null, Values);
            return Values;
        }

        public static RouteValueDictionary AddRouteValues(this RouteData routeData, object addRouteValues)
        {
            var Values = new RouteValueDictionary(routeData.Values);

            var properties = addRouteValues.GetType().GetProperties();
            foreach (var p in properties)
            {
                Values[p.Name] = p.GetValue(addRouteValues, null);
            }
            //foreach (string item in Url.RequestContext.HttpContext.Request.QueryString)
            foreach (string item in HttpContext.Current.Request.QueryString)
            {
                if (Values.ContainsKey(item))
                {
                    continue;
                }
                //Values[item] = Url.RequestContext.HttpContext.Request.QueryString[item];
                Values[item] = HttpContext.Current.Request.QueryString[item];
            }
            //return Url.Action(null, null, Values);
            return Values;
        }

        public static RouteValueDictionary RemoveRouteValues(this RouteData routeData, string[] keys)
        {
            var Values = new RouteValueDictionary(routeData.Values);
            var route = routeData.Route as System.Web.Routing.Route;
            foreach (var key in keys)
            {
                if (route != null && route.Defaults.ContainsKey(key))
                {
                    Values[key] = route.Defaults[key];
                }
                else
                {
                    Values.Remove(key);
                }
            }
            //foreach (string item in Url.RequestContext.HttpContext.Request.QueryString)
            foreach (string item in HttpContext.Current.Request.QueryString)
            {
                if (keys.Contains(item))
                {
                    continue;
                }
                //Values[item] = Url.RequestContext.HttpContext.Request.QueryString[item];
                Values[item] = HttpContext.Current.Request.QueryString[item];
            }
            //return Url.Action(null, null, Values);
            return Values;
        }
    }
}
