using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Collections.Specialized;
using System.Data.Common;
using System.Configuration;
using System.Data;
using System.Configuration.Provider;

namespace Framework.Users
{
    public class DbRoleProvider : System.Web.Security.RoleProvider
    {
        private string connStringName;
        private string tablePrefix;
        private string parmPrefix;
        private string applicationName;
        //public DbRoleProvider()
        //{
        //    //
        //    //TODO: 在此处添加构造函数逻辑
        //    //
        //}
        public override void Initialize(string name, NameValueCollection config)
        {
            if (config == null)
            {
                throw new ArgumentNullException("config");
            }

            if (String.IsNullOrEmpty(name))
            {
                name = "DbRoleProvider";
            }

            if (String.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "Generic Database Membership Provider");
            }

            base.Initialize(name, config);

            if (config["connectionStringName"] == null)
            {
                // default to Blog
                config["connectionStringName"] = "WebFrameConnectionString";
            }
            connStringName = config["connectionStringName"];
            config.Remove("connectionStringName");

            if (config["tablePrefix"] == null)
            {
                // default
                config["tablePrefix"] = "";
            }
            tablePrefix = config["tablePrefix"];
            config.Remove("tablePrefix");

            if (config["parmPrefix"] == null)
            {
                // default
                config["parmPrefix"] = "@";
            }
            parmPrefix = config["parmPrefix"];
            config.Remove("parmPrefix");

            if (config["applicationName"] == null)
            {
                // default to Blog
                config["applicationName"] = "WebFrame";
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

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
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

                string sqlQuery = "";

                foreach (string user in usernames)
                {
                    object UserId = Membership.GetUser(user).ProviderUserKey;
                    foreach (string role in roleNames)
                    {
                        sqlQuery = "SELECT [Id] FROM " + tablePrefix + "Roles " +
                                        "WHERE Role = " + parmPrefix + "role";

                        cmd.Parameters.Clear();

                        DbParameter dpRole = provider.CreateParameter();
                        dpRole.ParameterName = parmPrefix + "role";
                        dpRole.Value = role;
                        cmd.Parameters.Add(dpRole);

                        //int RoleID = Convert.ToInt32(DbAgent.GetScala(sqlQuery, list));
                        cmd.CommandText = sqlQuery;
                        int RoleID = Convert.ToInt32(cmd.ExecuteScalar());

                        sqlQuery = "INSERT INTO " + tablePrefix + "UserRoles (UserId, RoleId) " +
                                            "VALUES (" + parmPrefix + "uID, " + parmPrefix + "rID)";

                        cmd.Parameters.Clear();

                        DbParameter dpUserID = provider.CreateParameter();
                        dpUserID.ParameterName = parmPrefix + "uID";
                        dpUserID.Value = UserId;
                        cmd.Parameters.Add(dpUserID);

                        DbParameter dpRoleID = provider.CreateParameter();
                        dpRoleID.ParameterName = parmPrefix + "rID";
                        dpRoleID.Value = RoleID;
                        cmd.Parameters.Add(dpRoleID);

                        cmd.CommandText = sqlQuery;
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
            }
        }

        public override string ApplicationName
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public override void CreateRole(string roleName)
        {
            if (RoleExists(roleName))
            {
                throw new Exception("角色已存在");
            }

            DbProviderFactory provider = null;
            DbConnection conn = null;
            DbCommand cmd = null;

            try
            {
                InitProvider(connStringName, out provider, out conn, out cmd);
                cmd.CommandType = CommandType.Text;
                //cmd.CommandText = sqlQuery;
                conn.Open();

                string sqlQuery = "INSERT INTO " + tablePrefix + "Roles (role) VALUES (" + parmPrefix + "role)";

                cmd.CommandText = sqlQuery;

                cmd.Parameters.Clear();

                DbParameter dpRole = provider.CreateParameter();
                dpRole.ParameterName = parmPrefix + "role";
                dpRole.Value = roleName;

                cmd.Parameters.Add(dpRole);
                int Count = cmd.ExecuteNonQuery();
                if (Count != 1)
                {
                    throw new ProviderException("创建角色出错");
                }
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

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
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

                string sqlQuery = "delete from " + tablePrefix + "Roles where Role=" + parmPrefix + "role";
                cmd.Parameters.Clear();
                DbParameter dpRole = provider.CreateParameter();
                dpRole.ParameterName = parmPrefix + "role";
                dpRole.Value = roleName;

                cmd.Parameters.Add(dpRole);
                cmd.CommandText = sqlQuery;
                int Count = cmd.ExecuteNonQuery();
                if (Count == 1)
                {
                    return true;
                }
                return false;
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

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            List<string> users = new List<string>();

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

                string sqlQuery = "SELECT u.UserName " +
                                                 "FROM " + tablePrefix + "Users u " +
                                                 "INNER JOIN " + tablePrefix + "UserRoles ur " +
                                                 "ON u.[Id] = ur.UserId " +
                                                 "INNER JOIN " + tablePrefix + "Roles r " +
                                                 "ON ur.RoleId = r.[Id] " +
                                                 "WHERE r.Role  = " + parmPrefix + "role AND u.UserName LIKE " + parmPrefix + "name";
                cmd.CommandText = sqlQuery;

                DbParameter dpRole = provider.CreateParameter();
                dpRole.ParameterName = parmPrefix + "role";
                dpRole.Value = roleName;
                cmd.Parameters.Add(dpRole);


                DbParameter dpName = provider.CreateParameter();
                dpName.ParameterName = parmPrefix + "name";
                dpName.Value = usernameToMatch + "%";
                cmd.Parameters.Add(dpName);

                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (!dr.IsDBNull(0))
                        users.Add(dr.GetString(0));
                }
                return users.ToArray();

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
        }

        public override string[] GetAllRoles()
        {
            List<string> roles = new List<string>();

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

                string sqlQuery = "SELECT role FROM " + tablePrefix + "Roles";

                cmd.CommandText = sqlQuery;

                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    if (!dr.IsDBNull(0))
                        roles.Add(dr.GetString(0));
                }
                return roles.ToArray();
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
        }

        public override string[] GetRolesForUser(string username)
        {
            List<string> roles = new List<string>();

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

                string sqlQuery = "SELECT r.role " +
                                                "FROM " + tablePrefix + "Roles r " +
                                                "INNER JOIN " + tablePrefix + "UserRoles ur " +
                                                "ON r.[Id] = ur.RoleId " +
                                                "INNER JOIN " + tablePrefix + "Users u " +
                                                "ON ur.UserId = u.[Id] " +
                                                "WHERE u.UserName = " + parmPrefix + "name";

                DbParameter dpName = provider.CreateParameter();
                dpName.ParameterName = parmPrefix + "name";
                dpName.Value = username;

                cmd.Parameters.Add(dpName);

                cmd.CommandText = sqlQuery;
                dr = cmd.ExecuteReader();


                while (dr.Read())
                {
                    if (!dr.IsDBNull(0))
                        roles.Add(dr.GetString(0));
                }
                return roles.ToArray();
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
        }

        public override string[] GetUsersInRole(string roleName)
        {
            List<string> users = new List<string>();

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

                string sqlQuery = "SELECT u.UserName " +
                                                "FROM " + tablePrefix + "Users u " +
                                                "INNER JOIN " + tablePrefix + "UserRoles ur " +
                                                "ON u.[Id] = ur.UserId " +
                                                "INNER JOIN " + tablePrefix + "Roles r " +
                                                "ON ur.RoleId = r.[Id] " +
                                                "WHERE r.Role  = " + parmPrefix + "role";

                cmd.Parameters.Clear();
                DbParameter dpRole = provider.CreateParameter();
                dpRole.ParameterName = parmPrefix + "role";
                dpRole.Value = roleName;
                cmd.Parameters.Add(dpRole);

                cmd.CommandText = sqlQuery;
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    if (!dr.IsDBNull(0))
                        users.Add(dr.GetString(0));

                }
                return users.ToArray();
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
        }

        public override bool IsUserInRole(string username, string roleName)
        {
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

                string sqlQuery = "SELECT r.[Id] " +
                                                "FROM " + tablePrefix + "Roles r " +
                                                "INNER JOIN " + tablePrefix + "UserRoles ur " +
                                                "ON r.[Id] = ur.RoleId " +
                                                "INNER JOIN " + tablePrefix + "Users u " +
                                                "ON ur.UserId = u.[Id] " +
                                                "WHERE u.UserName = @name AND r.role = @role";
                if (parmPrefix != "@")
                    sqlQuery = sqlQuery.Replace("@", parmPrefix);

                cmd.Parameters.Clear();

                DbParameter dpName = provider.CreateParameter();
                dpName.ParameterName = parmPrefix + "name";
                dpName.Value = username;
                cmd.Parameters.Add(dpName);

                DbParameter dpRole = provider.CreateParameter();
                dpRole.ParameterName = parmPrefix + "role";
                dpRole.Value = roleName;
                cmd.Parameters.Add(dpRole);

                cmd.CommandText = sqlQuery;
                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    return true;
                }
                return false;

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
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
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


                string sqlQuery = "";

                foreach (string user in usernames)
                {
                    object UserId = Membership.GetUser(user).ProviderUserKey;
                    foreach (string role in roleNames)
                    {
                        sqlQuery = "SELECT [Id] FROM " + tablePrefix + "Roles " +
                                          "WHERE Role = " + parmPrefix + "role";

                        cmd.Parameters.Clear();

                        DbParameter dpRole = provider.CreateParameter();
                        dpRole.ParameterName = parmPrefix + "role";
                        dpRole.Value = role;
                        cmd.Parameters.Add(dpRole);

                        cmd.CommandText = sqlQuery;
                        int RoleID = Convert.ToInt32(cmd.ExecuteScalar());

                        sqlQuery = "DELETE FROM " + tablePrefix + "UserRoles " +
                                                          "WHERE UserId = " + parmPrefix + "uID AND RoleId = " + parmPrefix +
                                                          "rID";
                        cmd.Parameters.Clear();

                        DbParameter dpUserID = provider.CreateParameter();
                        dpUserID.ParameterName = parmPrefix + "uID";
                        dpUserID.Value = UserId;
                        cmd.Parameters.Add(dpUserID);


                        DbParameter dpRoleID = provider.CreateParameter();
                        dpRoleID.ParameterName = parmPrefix + "rID";
                        dpRoleID.Value = RoleID;
                        cmd.Parameters.Add(dpRoleID);

                        cmd.CommandText = sqlQuery;
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
            }
        }

        public override bool RoleExists(string roleName)
        {
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

                string sqlQuery = "SELECT roleID FROM " + tablePrefix + "Roles " +
                                                "WHERE role = " + parmPrefix + "role";

                DbParameter dpRole = provider.CreateParameter();
                dpRole.ParameterName = parmPrefix + "role";
                dpRole.Value = roleName;
                cmd.Parameters.Add(dpRole);

                cmd.CommandText = sqlQuery;
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    return true;
                }
                return false;
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
        }
    }
}
