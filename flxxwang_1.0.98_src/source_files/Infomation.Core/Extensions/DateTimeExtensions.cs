using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core.Extensions
{
    public static class DateTimeExtensions
    {
        public static string ToPublishTimeString(this DateTime dateTime)
        {
            var nowDate = DateTime.Now;
            var totalSeconds=nowDate.Subtract(dateTime).TotalSeconds;
            if (totalSeconds < 60)
            {
                return Convert.ToInt32(totalSeconds) + "秒";
            }
            var totalMinutes = nowDate.Subtract(dateTime).TotalMinutes;
            if (totalMinutes < 60)
            {
                return Convert.ToInt32(totalMinutes) + "分";
            }
            var totalHours = nowDate.Subtract(dateTime).TotalHours;
            if (totalHours < 24)
            {
                return Convert.ToInt32(totalHours) + "小时";
            }
            return Convert.ToInt32(nowDate.Subtract(dateTime).TotalDays) + "天";
        }
    }
}
