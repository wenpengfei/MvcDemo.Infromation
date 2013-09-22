using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Profile;
using System.Configuration;
using System.Data.Common;
using System.Web.Security;
using System.Data;

namespace Framework.Users
{
    public class DbProfileProvider : System.Web.Profile.ProfileProvider
    {
        private string connStringName;
        private string tablePrefix;
        private string parmPrefix;
        private string applicationName;

        //public DbProfileProvider()
        //{
        //    //
        //    //TODO: 在此处添加构造函数逻辑
        //    //
        //}
        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            if (config == null)
                throw new ArgumentNullException("config");

            if (string.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "MyProvider");
            }

            if (string.IsNullOrEmpty(name))
                name = "DbProfileProvider";

            base.Initialize(name, config);

            // Connection String
            if (config["connectionStringName"] == null)
            {
                config["connectionStringName"] = "Blog";
            }
            connStringName = config["connectionStringName"];
            config.Remove("connectionStringName");

            // Table Prefix
            if (config["tablePrefix"] == null)
            {
                config["tablePrefix"] = "";
            }
            tablePrefix = config["tablePrefix"];
            config.Remove("tablePrefix");

            // Parameter character
            if (config["parmPrefix"] == null)
            {
                config["parmPrefix"] = "@";
            }
            parmPrefix = config["parmPrefix"];
            config.Remove("parmPrefix");

            // Application Name
            if (config["applicationName"] == null)
            {
                config["applicationName"] = "Blog";
            }
            applicationName = config["applicationName"];
            config.Remove("applicationName");

        }

        private void InitProvider(string connStringName, out DbProviderFactory provider, out DbConnection conn, out DbCommand cmd)
        {
            string connString = ConfigurationManager.ConnectionStrings[connStringName].ConnectionString;
            string providerName = ConfigurationManager.ConnectionStrings[connStringName].ProviderName;
            provider = DbProviderFactories.GetFactory(providerName);

            conn = provider.CreateConnection();
            conn.ConnectionString = connString;

            cmd = conn.CreateCommand();
        }

        public override int DeleteInactiveProfiles(ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate)
        {

            throw new NotImplementedException("DeleteInactiveProfiles");
        }

        public override int DeleteProfiles(string[] usernames)
        {
            DbProviderFactory provider = null;
            DbConnection conn = null;
            DbCommand cmd = null;
            try
            {
                InitProvider(connStringName, out provider, out conn, out cmd);
                cmd.CommandType = CommandType.Text;
                //cmd.CommandText = sqlQuery;
                conn.Open();
                int DeleteCount = 0;

                foreach (string username in usernames)
                {
                    object UserId = Membership.GetUser(username).ProviderUserKey;
                    string sqlQuery = "delete from " + tablePrefix + "Profiles where UserId=@UserId";
                    if (parmPrefix != "@")
                        sqlQuery = sqlQuery.Replace("@", parmPrefix);

                    cmd.Parameters.Clear();

                    DbParameter dpUserId = provider.CreateParameter();
                    dpUserId.ParameterName = parmPrefix + "UserId";
                    dpUserId.Value = UserId;
                    cmd.Parameters.Add(dpUserId);

                    cmd.CommandText = sqlQuery;
                    cmd.ExecuteNonQuery();
                    DeleteCount++;
                }
                return DeleteCount;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                    conn = null;
                }
            }
        }

        public override int DeleteProfiles(ProfileInfoCollection profiles)
        {
            throw new NotImplementedException("DeleteProfiles");
        }

        public override ProfileInfoCollection FindInactiveProfilesByUserName(ProfileAuthenticationOption authenticationOption, string usernameToMatch, DateTime userInactiveSinceDate, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException("FindInactiveProfilesByUserName");
        }

        public override ProfileInfoCollection FindProfilesByUserName(ProfileAuthenticationOption authenticationOption, string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException("FindProfilesByUserName");
        }

        public override ProfileInfoCollection GetAllInactiveProfiles(ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException("GetAllInactiveProfiles");
        }

        public override ProfileInfoCollection GetAllProfiles(ProfileAuthenticationOption authenticationOption, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException("GetAllProfiles");
        }

        public override int GetNumberOfInactiveProfiles(ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate)
        {
            throw new NotImplementedException("GetNumberOfInactiveProfiles");
        }

        public override string ApplicationName
        {
            get
            {
                throw new NotImplementedException("ApplicationName");
            }
            set
            {
                throw new NotImplementedException("ApplicationName");
            }
        }

        public override SettingsPropertyValueCollection GetPropertyValues(SettingsContext context, SettingsPropertyCollection collection)
        {
            string username = (string)context["UserName"];//当前访问用户
            bool isAuthenticated = (bool)context["IsAuthenticated"];//匿名用户还是正式用户

            object UserId = Membership.GetUser(username).ProviderUserKey;

            DbProviderFactory provider = null;
            DbConnection conn = null;
            DbCommand cmd = null;
            try
            {
                InitProvider(connStringName, out provider, out conn, out cmd);
                cmd.CommandType = CommandType.Text;
                //cmd.CommandText = sqlQuery;
                conn.Open();

                SettingsPropertyValueCollection svc = new SettingsPropertyValueCollection();
                foreach (SettingsProperty prop in collection)
                {
                    SettingsPropertyValue pv = new SettingsPropertyValue(prop);
                    //sqlQuery = "select PropertyValue from " + tablePrefix + "Profiles where UserId=@UserId and PropertyName=@PropertyName";
                    string sqlQuery = "select " + pv.Property.Name + " from " + tablePrefix + "Profile where UserId=@UserId ";
                    if (parmPrefix != "@")
                    {
                        sqlQuery = sqlQuery.Replace("@", parmPrefix);
                    }

                    cmd.Parameters.Clear();

                    DbParameter DpUserId = provider.CreateParameter();
                    DpUserId.ParameterName = parmPrefix + "UserId";
                    DpUserId.Value = UserId;
                    cmd.Parameters.Add(DpUserId);

                    //DbParameter DpPropertyName = provider.CreateParameter();
                    //DpPropertyName.ParameterName = parmPrefix + "PropertyName";
                    //DpPropertyName.Value = pv.Property.Name;
                    //cmd.Parameters.Add(DpPropertyName);

                    cmd.CommandText = sqlQuery;
                    pv.PropertyValue = cmd.ExecuteScalar();

                    svc.Add(pv);
                }
                return svc;
            }
            //catch (Exception ex)//使用了finally，如果不catch则不会抛出错误
            //{
            //    throw new Exception(ex.StackTrace);
            //}
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                    conn = null;
                }
            }



            //DbProviderFactory provider = DbAgent.DbProvider;
            //string sqlQuery = "";
            //SettingsPropertyValueCollection svc = new SettingsPropertyValueCollection();
            //foreach (SettingsProperty prop in collection)
            //{
            //    SettingsPropertyValue pv = new SettingsPropertyValue(prop);
            //    sqlQuery = "select " + pv.Property.Name + " from " + tablePrefix + "Profile where UserId=@UserId ";
            //    if (parmPrefix != "@")
            //    {
            //        sqlQuery = sqlQuery.Replace("@", parmPrefix);
            //    }
            //    DbParameter DpUserId = provider.CreateParameter();
            //    DpUserId.ParameterName = parmPrefix + "UserId";
            //    DpUserId.Value = UserId;
            //    List<DbParameter> list = new List<DbParameter>();
            //    list.Add(DpUserId);
            //    pv.PropertyValue = DbAgent.GetScala(sqlQuery, list);
            //    svc.Add(pv);
            //}
            //return svc;
        }

        public override void SetPropertyValues(SettingsContext context, SettingsPropertyValueCollection collection)
        {
            string username = (string)context["UserName"];
            bool isAuthenticated = (bool)context["IsAuthenticated"];
            object UserId = Membership.GetUser(username).ProviderUserKey;

            //string connString = ConfigurationManager.ConnectionStrings[connStringName].ConnectionString;
            //string providerName = ConfigurationManager.ConnectionStrings[connStringName].ProviderName;
            //DbProviderFactory provider = DbProviderFactories.GetFactory(providerName);
            //DbConnection conn = provider.CreateConnection();
            //conn.ConnectionString = connString;
            //string sqlQuery = "";
            //DbCommand cmd = conn.CreateCommand();
            ////cmd.CommandText = sqlQuery;
            //cmd.CommandType = CommandType.Text;
            //conn.Open();
            //try
            //{
            //    foreach (SettingsPropertyValue pv in collection)
            //    {
            //        //HttpContext.Current.Response.Write(pv.Property.Name + "：" + pv.PropertyValue + "<br>");
            //        sqlQuery = "delete from " + tablePrefix + "Profiles where UserId=@UserId and  PropertyName=@PropertyName";
            //        if (parmPrefix != "@")
            //            sqlQuery = sqlQuery.Replace("@", parmPrefix);
            //        cmd.Parameters.Clear();
            //        DbParameter DpUserId = provider.CreateParameter();
            //        DpUserId.ParameterName = parmPrefix + "UserId";
            //        DpUserId.Value = UserId;
            //        cmd.Parameters.Add(DpUserId);
            //        DbParameter DpPropertyName = provider.CreateParameter();
            //        DpPropertyName.ParameterName = parmPrefix + "PropertyName";
            //        DpPropertyName.Value = pv.Property.Name;
            //        cmd.Parameters.Add(DpPropertyName);
            //        cmd.CommandText = sqlQuery;
            //        cmd.ExecuteNonQuery();
            //        //cmd.Parameters.Clear();
            //        sqlQuery = "INSERT INTO " + tablePrefix + "Profiles (UserId, PropertyName, PropertyValue) VALUES (@UserId, @PropertyName, @PropertyValue)";
            //        DbParameter DpPropertyValue = provider.CreateParameter();
            //        DpPropertyValue.ParameterName = parmPrefix + "PropertyValue";
            //        DpPropertyValue.Value = (pv.PropertyValue == null) ? DBNull.Value : pv.PropertyValue;
            //        cmd.Parameters.Add(DpPropertyValue);
            //        cmd.CommandText = sqlQuery;
            //        cmd.ExecuteNonQuery();
            //        cmd.Parameters.Clear();
            //    }
            //}
            //catch (Exception ex)
            //{
            //    throw new Exception(ex.StackTrace);
            //}
            //finally
            //{
            //    if (conn != null)
            //    {
            //        conn.Close();
            //        conn = null;
            //    }
            //}



            ///////////////////////////////////
            DbProviderFactory provider = null;
            DbConnection conn = null;
            DbCommand cmd = null;
            DbDataReader dr = null;
            try
            {
                InitProvider(connStringName, out provider, out conn, out cmd);
                cmd.CommandType = CommandType.Text;
                //cmd.CommandText = sqlQuery;
                conn.Open();

                string sqlExsist = "select * from " + tablePrefix + "Profile where UserId=" + parmPrefix + "UserId";

                DbParameter DpUserId = provider.CreateParameter();
                DpUserId.ParameterName = parmPrefix + "UserId";
                DpUserId.Value = UserId;

                cmd.Parameters.Add(DpUserId);

                cmd.CommandText = sqlExsist;

                dr = cmd.ExecuteReader();

                if (!dr.HasRows)
                {
                    dr.Close();//,如果不关闭，下面Command执行会出现错误：已有打开的与此 Command 相关联的 DataReader，必须首先将它关闭
                    dr = null;

                    cmd.Parameters.Clear();

                    string Fields = "";
                    string Values = "";
                    string sqlQuery = "";
                    foreach (SettingsPropertyValue pv in collection)
                    {
                        Fields += "," + pv.Property.Name + "";
                        Values += "," + parmPrefix + "" + pv.Property.Name + "";

                        DbParameter param = provider.CreateParameter();
                        param.ParameterName = parmPrefix + pv.Property.Name;


                        //无法解决DefaultValue的问题,所以只好忽略此设置。(如果默认值也设置了，同时程序也赋值了，应该使用程序中的赋值，现在也办法解决。)
                        //if (pv.Property.DefaultValue != null)//发现此条件总是为真
                        //if(pv.UsingDefaultValue)//发现此条件总是为假
                        //{
                        //pv.PropertyValue = pv.Property.DefaultValue;
                        //pv.PropertyValue = Convert.ChangeType(pv.Property.DefaultValue, pv.Property.PropertyType);
                        //HttpContext.Current.Response.Write(pv.Property.DefaultValue);
                        //HttpContext.Current.Response.Write(pv.Property.PropertyType);
                        //}

                        param.Value = (pv.PropertyValue == null) ? DBNull.Value : pv.PropertyValue;

                        cmd.Parameters.Add(param);
                    }
                    if (Fields != "")
                    {
                        Fields = Fields.Substring(1);
                        Values = Values.Substring(1);
                        cmd.Parameters.Add(DpUserId);
                        sqlQuery = "insert into " + tablePrefix + "Profile (" + Fields + ",UserId) values (" + Values + "," + parmPrefix + "UserId)";

                        cmd.CommandText = sqlQuery;
                        cmd.ExecuteNonQuery();

                    }
                }
                else
                {
                    cmd.Parameters.Clear();

                    string sqlQuery = "";

                    foreach (SettingsPropertyValue pv in collection)
                    {
                        sqlQuery += "," + pv.Property.Name + "=" + parmPrefix + "" + pv.Property.Name + "";
                        DbParameter param = provider.CreateParameter();
                        param.ParameterName = parmPrefix + pv.Property.Name;
                        param.Value = (pv.PropertyValue == null) ? DBNull.Value : pv.PropertyValue;
                        cmd.Parameters.Add(param);

                    }
                    if (sqlQuery != "")
                    {
                        sqlQuery = sqlQuery.Substring(1);
                        cmd.Parameters.Add(DpUserId);

                        sqlQuery = "update " + tablePrefix + "Profile set " + sqlQuery + " where UserId=" + parmPrefix + "UserId";
                        cmd.ExecuteNonQuery();

                    }
                }
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                    conn = null;
                }
                if (dr != null)
                {
                    dr.Close();
                    dr = null;
                }
            }


            //List<DbParameter> list = new List<DbParameter>();

            //if (DbAgent.IsEmpty(sqlExsist, listExist))
            //{
            //    string Fields = "";
            //    string Values = "";
            //    sqlQuery = "";
            //    list.Clear();
            //    foreach (SettingsPropertyValue pv in collection)
            //    {
            //        Fields += "," + pv.Property.Name + "";
            //        Values += "," + parmPrefix + "" + pv.Property.Name + "";

            //        DbParameter param = provider.CreateParameter();
            //        param.ParameterName = parmPrefix + pv.Property.Name;


            //        //无法解决DefaultValue的问题,所以只好忽略此设置。(如果默认值也设置了，同时程序也赋值了，应该使用程序中的赋值，现在也办法解决。)
            //        //if (pv.Property.DefaultValue != null)//发现此条件总是为真
            //        //if(pv.UsingDefaultValue)//发现此条件总是为假
            //        //{
            //        //pv.PropertyValue = pv.Property.DefaultValue;
            //        //pv.PropertyValue = Convert.ChangeType(pv.Property.DefaultValue, pv.Property.PropertyType);
            //        //HttpContext.Current.Response.Write(pv.Property.DefaultValue);
            //        //HttpContext.Current.Response.Write(pv.Property.PropertyType);
            //        //}


            //        param.Value = (pv.PropertyValue == null) ? DBNull.Value : pv.PropertyValue;

            //        list.Add(param);
            //    }
            //    if (Fields != "")
            //    {
            //        Fields = Fields.Substring(1);
            //        Values = Values.Substring(1);

            //        list.Add(DpUserId);
            //        sqlQuery = "insert into " + tablePrefix + "Profile (" + Fields + ",UserId) values (" + Values + "," + parmPrefix + "UserId)";
            //        DbAgent.ExecuteSql(sqlQuery, list);
            //    }

            //}
            //else
            //{
            //    sqlQuery = "";
            //    list.Clear();
            //    foreach (SettingsPropertyValue pv in collection)
            //    {
            //        sqlQuery += "," + pv.Property.Name + "=" + parmPrefix + "" + pv.Property.Name + "";
            //        DbParameter param = provider.CreateParameter();
            //        param.ParameterName = parmPrefix + pv.Property.Name;
            //        param.Value = (pv.PropertyValue == null) ? DBNull.Value : pv.PropertyValue;
            //        list.Add(param);

            //    }
            //    if (sqlQuery != "")
            //    {
            //        sqlQuery = sqlQuery.Substring(1);
            //        list.Add(DpUserId);
            //        sqlQuery = "update " + tablePrefix + "Profile set " + sqlQuery + " where UserId=" + parmPrefix + "UserId";
            //        DbAgent.ExecuteSql(sqlQuery, list);
            //    }
            //}


        }

    }
}
