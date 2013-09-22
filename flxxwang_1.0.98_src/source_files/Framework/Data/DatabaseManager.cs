using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using Microsoft.Practices.EnterpriseLibrary.Data.Oracle;

namespace Framework.Data
{
    public class DatabaseManager
    {
        public static string ConnectionString = null;//如果有值,则不使用配置文件中的连接字符串.例如,用户可以手动从界面上输入连接字符串.
        //不管任何地方，数据库对象都由此处来创建，以便统一管理。
        public static Database CreateDatabase()
        {
            var db= DatabaseFactory.CreateDatabase();
            if (ConnectionString == null)
            {
                return db;
            }
            else
            {
                if (db is SqlDatabase)
                {
                    return new SqlDatabase(ConnectionString);
                }
                else if (db is OracleDatabase)
                {
                    return new OracleDatabase(ConnectionString);
                }
            }
            return null;
        }
    }
}
