using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Text.RegularExpressions;
using System.Configuration.Provider;
using System.Data.Common;
using System.Web.Profile;
using System.Data;
using System.Security.Cryptography;
using Framework.Security;
using System.Configuration;

namespace Framework.Users
{
    public class DbMembershipProvider : System.Web.Security.MembershipProvider
    {
        private string connStringName;
        private string tablePrefix;
        private string parmPrefix;
        private string applicationName;
        private MembershipPasswordFormat passwordFormat;
        //public DbMembershipProvider()
        //{
        //    //
        //    //TODO: 在此处添加构造函数逻辑
        //    //
        //}
        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            if (config == null)
            {
                throw new ArgumentNullException("config");
            }

            if (String.IsNullOrEmpty(name))
            {
                name = "DbMembershipProvider";
            }

            if (Type.GetType("Mono.Runtime") != null)
            {
                // Mono dies with a "Unrecognized attribute: description" if a description is part of the config.
                if (!string.IsNullOrEmpty(config["description"]))
                {
                    config.Remove("description");
                }
            }
            else
            {
                if (string.IsNullOrEmpty(config["description"]))
                {
                    config.Remove("description");
                    config.Add("description", "Generic Database Membership Provider");
                }
            }

            base.Initialize(name, config);

            // Connection String
            if (config["connectionStringName"] == null)
            {
                config["connectionStringName"] = "WebFrameConnectionString";
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
                config["applicationName"] = "WebFrame";
            }
            applicationName = config["applicationName"];
            config.Remove("applicationName");

            //Password Format
            if (config["passwordFormat"] == null)
            {
                config["passwordFormat"] = "Encrypted";
                passwordFormat = MembershipPasswordFormat.Encrypted;
            }
            else if (String.Compare(config["passwordFormat"], "clear", true) == 0)
            {
                passwordFormat = MembershipPasswordFormat.Clear;
            }
            else if (String.Compare(config["passwordFormat"], "Encrypted", true) == 0)
            {
                passwordFormat = MembershipPasswordFormat.Encrypted;
            }
            else
            {
                passwordFormat = MembershipPasswordFormat.Hashed;
            }
            config.Remove("passwordFormat");

            // Throw an exception if unrecognized attributes remain
            if (config.Count > 0)
            {
                string attr = config.GetKey(0);
                if (!String.IsNullOrEmpty(attr))
                    throw new ProviderException("Unrecognized attribute: " + attr);
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

        private void InitProvider(string connStringName, out DbProviderFactory provider, out DbConnection conn, out DbCommand cmd)
        {
            string connString = ConfigurationManager.ConnectionStrings[connStringName].ConnectionString;
            string providerName = ConfigurationManager.ConnectionStrings[connStringName].ProviderName;
            provider = DbProviderFactories.GetFactory(providerName);

            conn = provider.CreateConnection();
            conn.ConnectionString = connString;

            cmd = conn.CreateCommand();
        }

        public override bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            //throw new NotImplementedException("暂时不能更改密码");
            
            if (newPassword.Length < this.MinRequiredPasswordLength)
            {
                throw new ArgumentException("密码太短");
            }
            int num3 = 0;
            for (int i = 0; i < newPassword.Length; i++)
            {
                if (!char.IsLetterOrDigit(newPassword, i))
                {
                    num3++;
                }
            }
            if (num3 < this.MinRequiredNonAlphanumericCharacters)
            {
                throw new ArgumentException("密码应至少含有" + this.MinRequiredNonAlphanumericCharacters + "个非字母数字字符");
            }

            if ((this.PasswordStrengthRegularExpression.Length > 0) && !Regex.IsMatch(newPassword, this.PasswordStrengthRegularExpression))
            {
                throw new ArgumentException("密码不符合规范");
            }

            if (!this.ValidateUser(username, oldPassword))
            {
                return false;
            }

            ValidatePasswordEventArgs e = new ValidatePasswordEventArgs(username, newPassword, false);
            this.OnValidatingPassword(e);
            if (e.Cancel)
            {
                if (e.FailureInformation != null)
                {
                    throw e.FailureInformation;
                }
                throw new ArgumentException("Membership_Custom_Password_Validation_Failure");
            }

            //string connString = ConfigurationManager.ConnectionStrings[connStringName].ConnectionString;
            //string providerName = ConfigurationManager.ConnectionStrings[connStringName].ProviderName;
            //DbProviderFactory provider = DbProviderFactories.GetFactory(providerName);

            //DbConnection conn = provider.CreateConnection();
            //conn.ConnectionString = connString;

            //DbCommand cmd = conn.CreateCommand();
            ////cmd.CommandText = sqlQuery;
            //cmd.CommandType = CommandType.Text;
            //conn.Open();

            DbProviderFactory provider = null;
            DbConnection conn = null;
            DbCommand cmd = null;

            try
            {
                InitProvider(connStringName, out provider, out conn, out cmd);
                cmd.CommandType = CommandType.Text;
                conn.Open();

                string sqlQuery = "";

                //object Id = Membership.GetUser(username).ProviderUserKey;
                //sqlQuery = "update " + tablePrefix + "Users set Password=@Password,PasswordSalt=@PasswordSalt where [Id]=@Id";

                sqlQuery = "update " + tablePrefix + "Users set Password=@Password,PasswordSalt=@PasswordSalt where [UserName]=@UserName";

                if (parmPrefix != "@")
                {
                    sqlQuery = sqlQuery.Replace("@", parmPrefix);
                }
                cmd.Parameters.Clear();


                DbParameter DpPasswordSalt = provider.CreateParameter();
                DpPasswordSalt.ParameterName = parmPrefix + "PasswordSalt";
                DpPasswordSalt.Value = DBNull.Value;

                DbParameter DpPassword = provider.CreateParameter();
                DpPassword.ParameterName = parmPrefix + "Password";
                if (passwordFormat == MembershipPasswordFormat.Hashed)
                {
                    DpPassword.Value = EncodePassword(newPassword);
                }
                else if (passwordFormat == MembershipPasswordFormat.Encrypted)
                {
                    string Key = "";
                    Random rnd = new Random(DateTime.Now.Millisecond);
                    for (int i = 0; i < 8; i++)
                    {
                        Key += rnd.Next().ToString();
                    }
                    Key = Key.Substring(0, 8);
                    Key = CryptoUtil.DESCEncrypt(Key, Key).Substring(0, 8);//产生一个比较复杂一点的8位密钥

                    DpPasswordSalt.Value = Key;
                    DpPassword.Value = CryptoUtil.DESCEncrypt(newPassword, Key);
                }
                else
                {
                    DpPassword.Value = newPassword;
                }

                cmd.Parameters.Add(DpPassword);

                cmd.Parameters.Add(DpPasswordSalt);

                //DbParameter DpUserId = provider.CreateParameter();
                //DpUserId.ParameterName = parmPrefix + "Id";
                //DpUserId.Value = Id;
                //cmd.Parameters.Add(DpUserId);

                DbParameter DpUserName = provider.CreateParameter();
                DpUserName.ParameterName = parmPrefix + "UserName";
                DpUserName.Value = username;
                cmd.Parameters.Add(DpUserName);

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

        public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
        {
            throw new NotImplementedException();
        }
        
        public override MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
        {
            if (Membership.GetUser(username) != null)
            {
                throw new Exception("用户名已存在");
            }
            MembershipUser user;

            //string sqlQuery = "INSERT INTO " + tablePrefix + "Users (userName, password, Email, PasswordQuestion,PasswordAnswer,IsApproved) VALUES (@name, @pwd, @email, @pq,@pa,@ia)";
            string sqlQuery = "INSERT INTO " + tablePrefix + "Users (userName, password, Email,PasswordSalt) VALUES (@name, @pwd, @email,@PasswordSalt)";
            if (RequiresQuestionAndAnswer)//同理，还需要其他属性，如Email是否要求唯一等。
            {
                sqlQuery = "INSERT INTO " + tablePrefix + "Users (userName, password, Email,PasswordSalt, PasswordQuestion,PasswordAnswer) VALUES (@name, @pwd, @email,@PasswordSalt, @pq,@pa)";
            }

            sqlQuery+=";SELECT SCOPE_IDENTITY() as newIDValue";

            if (parmPrefix != "@")
                sqlQuery = sqlQuery.Replace("@", parmPrefix);

            DbProviderFactory provider = null;
            DbConnection conn = null;
            DbCommand cmd = null;

            try
            {
                InitProvider(connStringName, out provider, out conn, out cmd);
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sqlQuery;
                conn.Open();


                cmd.Parameters.Clear();
                DbParameter dpName = provider.CreateParameter();
                dpName.ParameterName = parmPrefix + "name";
                dpName.Value = username;
                cmd.Parameters.Add(dpName);

                DbParameter dpPasswordSalt = provider.CreateParameter();
                dpPasswordSalt.ParameterName = parmPrefix + "PasswordSalt";
                dpPasswordSalt.Value = DBNull.Value;
                cmd.Parameters.Add(dpPasswordSalt);

                DbParameter dpPwd = provider.CreateParameter();
                dpPwd.ParameterName = parmPrefix + "pwd";
                //if (passwordFormat == MembershipPasswordFormat.Hashed)
                //    dpPwd.Value = EncodePassword(passwordFormat, password);
                //else
                //    dpPwd.Value = password;
                if (passwordFormat == MembershipPasswordFormat.Clear)
                {
                    dpPwd.Value = password;
                }
                else if (passwordFormat == MembershipPasswordFormat.Encrypted)
                {
                    string Key = "";
                    Random rnd = new Random(DateTime.Now.Millisecond);
                    for (int i = 0; i < 8; i++)
                    {
                        Key += rnd.Next().ToString();
                    }
                    Key = Key.Substring(0, 8);
                    Key = CryptoUtil.DESCEncrypt(Key, Key).Substring(0, 8);//产生一个比较复杂一点的8位密钥

                    dpPasswordSalt.Value = Key;
                    dpPwd.Value = CryptoUtil.DESCEncrypt(password, Key);
                }
                else//Hashed
                {
                    dpPwd.Value = EncodePassword(password);
                }
                cmd.Parameters.Add(dpPwd);

                DbParameter dpEmail = provider.CreateParameter();
                dpEmail.ParameterName = parmPrefix + "email";
                if (email == null)
                {
                    dpEmail.Value = DBNull.Value;
                }
                else
                {
                    dpEmail.Value = email;
                }
                cmd.Parameters.Add(dpEmail);

                if (RequiresQuestionAndAnswer)
                {
                    DbParameter dppq = provider.CreateParameter();
                    dppq.ParameterName = parmPrefix + "pq";
                    dppq.Value = passwordQuestion;
                    cmd.Parameters.Add(dppq);

                    DbParameter dppa = provider.CreateParameter();
                    dppa.ParameterName = parmPrefix + "pa";
                    dppa.Value = passwordAnswer;
                    cmd.Parameters.Add(dppa);

                }

                int iproviderUserKey = Convert.ToInt32(cmd.ExecuteScalar());

                user = GetMembershipUser(username, (object)iproviderUserKey, email, DateTime.Now);
                status = MembershipCreateStatus.Success;

                return user;
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

        public override bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            //string sqlQuery = "delete from " + tablePrefix + "Users where Id=@Id";
            string sqlQuery = "delete from " + tablePrefix + "Users where UserName=@UserName";
            if (parmPrefix != "@")
                sqlQuery = sqlQuery.Replace("@", parmPrefix);

            DbProviderFactory provider = null;
            DbConnection conn = null;
            DbCommand cmd = null;

            try
            {
                InitProvider(connStringName, out provider, out conn, out cmd);
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sqlQuery;
                conn.Open();

                if (deleteAllRelatedData)
                {
                    //删除角色
                    string[] roles = Roles.GetRolesForUser(username);
                    if (roles.Length > 0)
                        Roles.RemoveUserFromRoles(username, roles);
                    //删除Profile
                    ProfileManager.DeleteProfile(username);
                }
                //注意要选删角色和Profile再删用户。
                DbParameter dpUserName = provider.CreateParameter();
                dpUserName.ParameterName = parmPrefix + "UserName";
                dpUserName.Value = Membership.GetUser(username).ProviderUserKey;
                cmd.Parameters.Add(dpUserName);

                cmd.ExecuteNonQuery();

                return true;
            }
            catch
            {
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

        public override bool EnablePasswordReset
        {
            get { throw new NotImplementedException(); }
        }

        public override bool EnablePasswordRetrieval
        {
            get { return true; }
        }

        public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        {//对于分页功能还要加以完善
            if (pageIndex < 0)
            {
                throw new ArgumentException("PageIndex_bad", "pageIndex");
            }
            if (pageSize < 1)
            {
                throw new ArgumentException("PageSize_bad", "pageSize");
            }
            long num = ((pageIndex * pageSize) + pageSize) - 1L;
            if (num > 0x7fffffffL)
            {
                throw new ArgumentException("PageIndex_PageSize_bad", "pageIndex and pageSize");
            }
            MembershipUserCollection users = new MembershipUserCollection();
            totalRecords = 0;

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

            //string sqlQuery = "select UserId,UserName,Comment,CreateDate,Email,IsApproved,IsLockedOut,LastLockoutDate,LastLoginDate,LastPasswordChangedDate,PasswordQuestion from " + tablePrefix + "Users";
            //string sqlQuery = "select Id,UserName,Comment,CreateDate,Email,IsApproved,IsLockedOut,LastLockoutDate,LastLoginDate,LastPasswordChangedDate,PasswordQuestion from " + tablePrefix + "Users order by [Id] ASC ";

            //string sqlQuery = "select * from " + tablePrefix + "Users";
            //sqlQuery = Optimize.SelectOnlyCurrentPage(sqlQuery, pageSize, pageIndex);
                var sqlQuery = @"select * from
                                (
                                    select *, ROW_NUMBER() Over(order by [Id]) as RowNumber from Users
                                ) t0 where t0.RowNumber between @start and @end
                                ";

            if (parmPrefix != "@")
                sqlQuery = sqlQuery.Replace("@", parmPrefix);

            cmd.CommandText = sqlQuery;

            cmd.Parameters.Clear();

            DbParameter pStart = provider.CreateParameter();
            pStart.ParameterName = parmPrefix + "start";
            pStart.Value = pageSize * pageIndex + 1;
            cmd.Parameters.Add(pStart);

            DbParameter pEnd = provider.CreateParameter();
            pEnd.ParameterName = parmPrefix + "end";
            pEnd.Value = pageSize * pageIndex + pageSize;
            cmd.Parameters.Add(pEnd);

            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
            //foreach (DataRow Row in Dt.Rows)
            //{
                object ProviderUserKey = dr["Id"];
                string username = dr["UserName"].ToString();
                string Comment = dr["Comment"].ToString();
                DateTime CreationDate = Convert.ToDateTime(dr["CreateDate"]);
                string Email = dr["Email"].ToString();
                bool IsApproved = Convert.ToBoolean(dr["IsApproved"]);
                bool IsLockedOut = Convert.ToBoolean(dr["IsLockedOut"]);
                DateTime LastActivityDate = DateTime.Now;

                //if (dr["LastActivityDate"]!=DBNull)
                //{
                //    LastActivityDate = Convert.ToDateTime(dr["LastActivityDate"]);
                //}
                
                DateTime LastLockoutDate = DateTime.MinValue;
                if (dr["LastLockoutDate"] != DBNull.Value)//不用用null
                {
                    LastLockoutDate = Convert.ToDateTime(dr["LastLockoutDate"]);
                }

                DateTime LastLoginDate = DateTime.MinValue;
                if (dr["LastLoginDate"] != DBNull.Value)
                {
                    LastLoginDate = Convert.ToDateTime(dr["LastLoginDate"]);
                }

                DateTime LastPasswordChangedDate = DateTime.MinValue;
                if (dr["LastPasswordChangedDate"] != DBNull.Value)
                {
                    LastPasswordChangedDate = Convert.ToDateTime(dr["LastPasswordChangedDate"]);
                }

                string PasswordQuestion = dr["PasswordQuestion"].ToString();

                users.Add(new DbMembershipUser(this.Name, username, ProviderUserKey, Email, PasswordQuestion, Comment, IsApproved, IsLockedOut, CreationDate, LastLockoutDate, LastActivityDate, LastPasswordChangedDate, LastLockoutDate));
                totalRecords++;
            }

            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                    dr = null;
                }
                if (conn != null)
                {
                    conn.Close();
                    conn = null;
                }

            }

            return users;
        }

        public override int GetNumberOfUsersOnline()
        {
            throw new NotImplementedException();
        }

        public override string GetPassword(string username, string answer)
        {
            string sqlQuery = "select Password,PasswordSalt from " + tablePrefix + "Users where UserName=@UserName";
            if (parmPrefix != "@")
                sqlQuery = sqlQuery.Replace("@", parmPrefix);

            DbProviderFactory provider = null;
            DbConnection conn = null;
            DbCommand cmd = null;
            DbDataReader dr = null;

            try
            {
                InitProvider(connStringName, out provider, out conn, out cmd);
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sqlQuery;
                conn.Open();

                cmd.Parameters.Clear();

                DbParameter dpUserName = provider.CreateParameter();
                dpUserName.ParameterName = parmPrefix + "UserName";
                dpUserName.Value = username;
                cmd.Parameters.Add(dpUserName);

                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    string Password = dr["Password"].ToString();
                    if (passwordFormat == MembershipPasswordFormat.Encrypted)
                    {
                        string Key = dr["PasswordSalt"].ToString();
                        Password = CryptoUtil.DESCDecrypt(Password, Key);
                    }
                    else if (passwordFormat == MembershipPasswordFormat.Hashed)
                    {
                        throw new Exception("密码为单向加密，不能找回密码，只能重置密码");
                    }
                    return Password;
                }
                else
                {
                    throw new Exception("不存在该用户");
                }
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                    dr = null;
                }
                if (conn != null)
                {
                    conn.Close();
                    conn = null;
                }

            }
        }

        public override MembershipUser GetUser(string username, bool userIsOnline)
        {

            DbMembershipUser user;

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

                string sqlQuery = "select * from " + tablePrefix + "Users where UserName=@UserName";
                if (parmPrefix != "@")
                    sqlQuery = sqlQuery.Replace("@", parmPrefix);

                cmd.CommandText = sqlQuery;

                cmd.Parameters.Clear();

                DbParameter dpUserName = provider.CreateParameter();
                dpUserName.ParameterName = parmPrefix + "UserName";
                dpUserName.Value = username;

                cmd.Parameters.Add(dpUserName);

                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    object ProviderUserKey = dr["Id"];
                    string Comment = dr["Comment"].ToString();
                    DateTime CreationDate = Convert.ToDateTime(dr["CreateDate"]);
                    string Email = dr["Email"].ToString();
                    bool IsApproved = Convert.ToBoolean(dr["IsApproved"]);
                    bool IsLockedOut = Convert.ToBoolean(dr["IsLockedOut"]);
                    DateTime LastActivityDate = DateTime.Now;
                    //if (dr["LastActivityDate"]!=DBNull)
                    //{
                    //    LastActivityDate = Convert.ToDateTime(dr["LastActivityDate"]);
                    //}

                    DateTime LastLockoutDate = DateTime.MinValue;
                    if (dr["LastLockoutDate"] != DBNull.Value)//不用用null
                    {
                        LastLockoutDate = Convert.ToDateTime(dr["LastLockoutDate"]);
                    }

                    DateTime LastLoginDate = DateTime.MinValue;
                    if (dr["LastLoginDate"] != DBNull.Value)
                    {
                        LastLoginDate = Convert.ToDateTime(dr["LastLoginDate"]);
                    }

                    DateTime LastPasswordChangedDate = DateTime.MinValue;
                    if (dr["LastPasswordChangedDate"] != DBNull.Value)
                    {
                        LastPasswordChangedDate = Convert.ToDateTime(dr["LastPasswordChangedDate"]);
                    }

                    string PasswordQuestion = dr["PasswordQuestion"].ToString();

                    return new DbMembershipUser(this.Name, username, ProviderUserKey, Email, PasswordQuestion, Comment, IsApproved, IsLockedOut, CreationDate, LastLockoutDate, LastActivityDate, LastPasswordChangedDate, LastLockoutDate);
                }
                user = null;
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                    dr = null;
                }
                if (conn != null)
                {
                    conn.Close();
                    conn = null;
                }

            }
            return user;
        }

        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            DbMembershipUser user;

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

                string sqlQuery = "select * from " + tablePrefix + "Users where [Id]=@UserKey";
                if (parmPrefix != "@")
                    sqlQuery = sqlQuery.Replace("@", parmPrefix);

                cmd.CommandText = sqlQuery;

                cmd.Parameters.Clear();

                DbParameter dpUserKey = provider.CreateParameter();
                dpUserKey.ParameterName = parmPrefix + "UserKey";
                dpUserKey.Value = providerUserKey;

                cmd.Parameters.Add(dpUserKey);

                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    //object ProviderUserKey = dr["Id"];
                    string UserName=dr["UserName"].ToString();
                    string Comment = dr["Comment"].ToString();
                    DateTime CreationDate = Convert.ToDateTime(dr["CreateDate"]);
                    string Email = dr["Email"].ToString();
                    bool IsApproved = Convert.ToBoolean(dr["IsApproved"]);
                    bool IsLockedOut = Convert.ToBoolean(dr["IsLockedOut"]);
                    DateTime LastActivityDate = DateTime.Now;
                    //if (dr["LastActivityDate"]!=DBNull)
                    //{
                    //    LastActivityDate = Convert.ToDateTime(dr["LastActivityDate"]);
                    //}

                    DateTime LastLockoutDate = DateTime.MinValue;
                    if (dr["LastLockoutDate"] != DBNull.Value)//不用用null
                    {
                        LastLockoutDate = Convert.ToDateTime(dr["LastLockoutDate"]);
                    }

                    DateTime LastLoginDate = DateTime.MinValue;
                    if (dr["LastLoginDate"] != DBNull.Value)
                    {
                        LastLoginDate = Convert.ToDateTime(dr["LastLoginDate"]);
                    }

                    DateTime LastPasswordChangedDate = DateTime.MinValue;
                    if (dr["LastPasswordChangedDate"] != DBNull.Value)
                    {
                        LastPasswordChangedDate = Convert.ToDateTime(dr["LastPasswordChangedDate"]);
                    }

                    string PasswordQuestion = dr["PasswordQuestion"].ToString();

                    return new DbMembershipUser(this.Name, UserName, providerUserKey, Email, PasswordQuestion, Comment, IsApproved, IsLockedOut, CreationDate, LastLockoutDate, LastActivityDate, LastPasswordChangedDate, LastLockoutDate);
                }
                user = null;
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                    dr = null;
                }
                if (conn != null)
                {
                    conn.Close();
                    conn = null;
                }

            }
            return user;
        }

        public override string GetUserNameByEmail(string email)
        {
            throw new NotImplementedException();
        }

        public override int MaxInvalidPasswordAttempts
        {
            get { throw new NotImplementedException(); }
        }

        public override int MinRequiredNonAlphanumericCharacters
        {
            get
            {
                //要求非字母数字字符个数
                return 0;//这些属性最好在配置文件中设置，然后在Initialize()中进行设置，实现方法可以参看系统源码 SqlMembershipProvider
            }
        }

        public override int MinRequiredPasswordLength
        {
            get
            {
                return 6;//这些属性最好在配置文件中设置，然后在Initialize()中进行设置，实现方法可以参看系统源码 SqlMembershipProvider
            }
        }

        public override int PasswordAttemptWindow
        {
            get { throw new NotImplementedException(); }
        }

        public override MembershipPasswordFormat PasswordFormat
        {
            get
            {
                return passwordFormat;
            }
        }

        public override string PasswordStrengthRegularExpression
        {
            get
            {
                return String.Empty;
            }
        }

        public override bool RequiresQuestionAndAnswer
        {
            get
            {
                return false;//设为false后，CreateUserWizard控件就不会有"安全提示问题"和"安全答案"两个选项
            }
        }

        public override bool RequiresUniqueEmail
        {
            get
            {
                return true;
            }
        }

        public override string ResetPassword(string username, string answer)
        {
            throw new NotImplementedException();
        }

        public override bool UnlockUser(string userName)
        {
            throw new NotImplementedException();
        }

        public override void UpdateUser(MembershipUser user)
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

                string sqlQuery = "update " + tablePrefix + "Users set ";
                sqlQuery += "Comment=@Comment, ";
                //sqlQuery += "CreationDate=@CreationDate ";//只读属性
                sqlQuery += "Email=@Email, ";
                sqlQuery += "IsApproved=@IsApproved, ";
                //sqlQuery += "IsLockedOut=@IsLockedOut ";//只读属性
                //sqlQuery += "IsOnline=@IsOnline ";//只读属性
                //sqlQuery += "LastActivityDate=@LastActivityDate, ";//数据库中没有此字段
                //sqlQuery += "LastLockoutDate=@LastLockoutDate ";//只读属性
                sqlQuery += "LastLoginDate=@LastLoginDate ";
                //sqlQuery += "LastPasswordChangedDate=@LastPasswordChangedDate ";//只读属性
                //sqlQuery += "PasswordQuestion=@PasswordQuestion ";//只读属性

                //sqlQuery += "where [Id]=@UserKey ";
                sqlQuery += "where [UserName]=@UserName ";

                if (parmPrefix != "@")
                    sqlQuery = sqlQuery.Replace("@", parmPrefix);
                cmd.CommandText = sqlQuery;

                cmd.Parameters.Clear();

                DbParameter dpComment = provider.CreateParameter();
                dpComment.ParameterName = parmPrefix + "Comment";
                dpComment.Value = user.Comment;
                cmd.Parameters.Add(dpComment);


                DbParameter dpEmail = provider.CreateParameter();
                dpEmail.ParameterName = parmPrefix + "Email";
                dpEmail.Value = user.Email;
                cmd.Parameters.Add(dpEmail);

                DbParameter dpIsApproved = provider.CreateParameter();
                dpIsApproved.ParameterName = parmPrefix + "IsApproved";
                dpIsApproved.Value = user.IsApproved;
                cmd.Parameters.Add(dpIsApproved);

                //DbParameter dpLastActivityDate=provider.CreateParameter();
                //dpLastActivityDate.ParameterName=parmPrefix+"LastActivityDate";
                //dpLastActivityDate.Value = user.LastActivityDate;
                //if (user.LastActivityDate.Year == DateTime.MinValue.Year)
                //{
                //    dpLastActivityDate.Value = DBNull.Value;
                //}
                //cmd.Parameters.Add(dpLastActivityDate);

                DbParameter dpLastLoginDate = provider.CreateParameter();
                dpLastLoginDate.ParameterName = parmPrefix + "LastLoginDate";
                dpLastLoginDate.Value = user.LastLoginDate;
                if (user.LastLoginDate.Year == DateTime.MinValue.Year)
                {
                    dpLastLoginDate.Value = DBNull.Value;
                }
                cmd.Parameters.Add(dpLastLoginDate);

                //DbParameter dpUserId = provider.CreateParameter();
                //dpUserId.ParameterName = parmPrefix + "UserKey";
                //dpUserId.Value = user.ProviderUserKey;
                //cmd.Parameters.Add(dpUserId);

                DbParameter dpUserName = provider.CreateParameter();
                dpUserName.ParameterName = parmPrefix + "UserName";
                dpUserName.Value = user.UserName;
                cmd.Parameters.Add(dpUserName);

                cmd.ExecuteNonQuery();
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

        public override bool ValidateUser(string username, string password)
        {//登陆时验证用户名和密码是否正确

            bool validated = false;

            DbProviderFactory provider = null;
            DbConnection conn = null;
            DbCommand cmd = null;

            try
            {
                InitProvider(connStringName, out provider, out conn, out cmd);
                cmd.CommandType = CommandType.Text;
                //cmd.CommandText = sqlQuery;
                conn.Open();

                //cmd.CommandText = "SELECT * FROM " + tablePrefix + "Users WHERE UserName = " + parmPrefix + "name and Password=" + parmPrefix + "pwd";
                string sqlQuery = "SELECT * FROM " + tablePrefix + "Users WHERE UserName = " + parmPrefix + "name and (Password=" + parmPrefix + "pwd)";
                //cmd.CommandText = "SELECT * FROM " + tablePrefix + "Users WHERE UserName = " + parmPrefix + "name and (Password=" + parmPrefix + "pwd)";//提供了一个通用密码

                

                cmd.Parameters.Clear();

                DbParameter dpName = provider.CreateParameter();
                dpName.ParameterName = parmPrefix + "name";
                dpName.Value = username;
                cmd.Parameters.Add(dpName);

                if (passwordFormat == MembershipPasswordFormat.Hashed)
                {
                    password = EncodePassword(password);
                }
                else if (passwordFormat == MembershipPasswordFormat.Encrypted)
                {
                    cmd.CommandText = "select PasswordSalt from " + tablePrefix + "Users where UserName=" + parmPrefix + "name";

                    object obj = cmd.ExecuteScalar();
                    if (obj == null)
                    {//此用户名不存在。
                        return false;
                    }
                    string Key = obj.ToString();
                    password = CryptoUtil.DESCEncrypt(password, Key);
                }

                cmd.CommandText = sqlQuery;

                DbParameter dpPwd = provider.CreateParameter();
                dpPwd.ParameterName = parmPrefix + "pwd";
                dpPwd.Value = password;
                cmd.Parameters.Add(dpPwd);


                using (DbDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.HasRows)
                    {
                        validated = true;
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
            return validated;
        }

        private MembershipUser GetMembershipUser(string userName, object providerUserKey, string email, DateTime lastLogin)
        {
            MembershipUser user = new MembershipUser(
                                    Name,                       // Provider name
                                    userName,                   // Username
                                    providerUserKey,                   // providerUserKey
                                    email,                      // Email
                                    String.Empty,               // passwordQuestion
                                    String.Empty,               // Comment
                                    true,                       // isApproved
                                    false,                      // isLockedOut
                                    DateTime.Now,               // creationDate
                                    lastLogin,                  // lastLoginDate
                                    DateTime.Now,               // lastActivityDate
                                    DateTime.Now,               // lastPasswordChangedDate
                                    new DateTime(1980, 1, 1)    // lastLockoutDate
                                );
            return user;
        }

        internal string EncodePassword(string password)
        {
            //if (passwordFormat == MembershipPasswordFormat.Clear)
            //{
            //    return password;
            //}
            //else if (passwordFormat == MembershipPasswordFormat.Hashed)
            //{
            //Hashed加密，不可逆
            byte[] data = Encoding.UTF8.GetBytes(password);
            using (HashAlgorithm sha = new SHA256Managed())
            {
                byte[] encryptedBytes = sha.TransformFinalBlock(data, 0, data.Length);
                return Convert.ToBase64String(sha.Hash);
            }
            //}
            //else
            //{
            //    throw new Exception("用户只支持Hashed加密码");
            //}

            //return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
        }
        //internal string UnEncodePassword(string pass, MembershipPasswordFormat passwordFormat)
        //{
        //    throw new Exception("未实现");
        //    //if (passwordFormat == MembershipPasswordFormat.Clear)
        //    //{
        //    //    return pass;
        //    //}
        //    //else if (passwordFormat == MembershipPasswordFormat.Hashed)
        //    //{

        //    //    byte[] encodedPassword = Convert.FromBase64String(pass);
        //    //    byte[] bytes = this.DecryptPassword(encodedPassword);
        //    //    if (bytes == null)
        //    //    {
        //    //        return null;
        //    //    }
        //    //    return Encoding.Unicode.GetString(bytes, 0x10, bytes.Length - 0x10);
        //    //}
        //    //else
        //    //{
        //    //    throw new Exception("用户只支持Hashed加密码");
        //    //}
        //}
    }
}
