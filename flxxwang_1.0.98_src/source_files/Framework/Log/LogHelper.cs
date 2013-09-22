﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Framework
{
    public class LogHelper   
    {     
        public static readonly log4net.ILog loginfo = log4net.LogManager.GetLogger("loginfo");   //选择<logger name="loginfo">的配置 
   
        public static readonly log4net.ILog logerror = log4net.LogManager.GetLogger("logerror");   //选择<logger name="logerror">的配置 

        static LogHelper()
        {
            SetConfig();
        }

        public static void SetConfig()   
        {   
            log4net.Config.XmlConfigurator.Configure();   
        }   
  
        public static void SetConfig(FileInfo configFile)   
        {   
            log4net.Config.XmlConfigurator.Configure(configFile);    
        }   
  
        public static void WriteLog(string info)   
        {   
            if(loginfo.IsInfoEnabled)   
            {   
                loginfo.Info(info);   
            }   
        }   
  
        public static void WriteLog(string info,Exception ex)   
        {   
            if(logerror.IsErrorEnabled)   
            {   
                logerror.Error(info,ex);   
            }   
        }   
    }
}
