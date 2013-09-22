using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.IO;
using System.Diagnostics;
using System.Text.RegularExpressions;

namespace Framework.Net
{
    public class Mail
    {
        private static string mailFrom = "469494794@qq.com";

        public static bool Exist(string email, string hostname = null, int smtpPort = 25)
        {
            string cmdTxt = null;
            TcpClient tcp = null;
            NetworkStream stream = null;
            try
            {
                hostname = GetMailServer(email);
                tcp = new TcpClient(hostname, smtpPort);
                stream = tcp.GetStream();
                var connInfo = ReadString(stream);
                if (!connInfo.StartsWith("220"))
                {
                    throw new Exception("请求连接时出错～～");
                }
                cmdTxt = String.Format("helo {0}", hostname);
                if (!Command(stream, cmdTxt, "250"))
                {
                    throw new Exception("helo命令出错～～");
                }

                cmdTxt = String.Format("mail from:{0}", mailFrom);
                if (!Command(stream, cmdTxt, "250"))
                {
                    throw new Exception("设置发送邮箱出错");
                }
                cmdTxt = String.Format("rcpt to:{0}", email);
                //if (!Command(stream, cmdTxt, "250"))
                //{
                //    throw new Exception("设置收信邮箱出错");
                //}
                var exist = Command(stream, cmdTxt, "250");
                WriteString(stream, "quit");
                return exist;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (tcp != null)
                {
                    tcp.Close();
                }
            }
        }

        //smtpServer,如:smtp.qq.com
        public static bool Exist(string email, string smtpServer, string userName, string password, int smtpPort = 25)
        {
            string cmdTxt = null;
            TcpClient tcp = null;
            NetworkStream stream = null;
            try
            {

                tcp = new TcpClient(smtpServer, smtpPort);
                stream = tcp.GetStream();
                var connInfo = ReadString(stream);
                if (!connInfo.StartsWith("220"))
                {
                    throw new Exception("请求连接时出错～～");
                }
                cmdTxt = String.Format("ehlo {0}", smtpServer);
                if (!Command(stream, cmdTxt, "250"))
                {
                    throw new Exception("ehlo命令出错～～");
                }
                // 验证
                cmdTxt = "auth login";
                if (!Command(stream, cmdTxt, "334"))
                {
                    throw new Exception("验证时发生错误");
                }
                // 用户名
                if (!Command(stream,ToBase64(userName), "334"))
                    throw new Exception("用户名无效");
                // 密码
                if (!Command(stream,ToBase64(password), "235"))
                    throw new Exception("密码无效");


                cmdTxt = String.Format("mail from:{0}", userName+"@qq.com");//mail from address must be same as authorization user
                if (!Command(stream, cmdTxt, "250"))
                {
                    throw new Exception("设置发送邮箱出错");
                }
                cmdTxt = String.Format("rcpt to:{0}", email);
                //if (!Command(stream, cmdTxt, "250"))
                //{
                //    throw new Exception("设置收信邮箱出错");
                //}
                var exist = Command(stream, cmdTxt, "250");
                WriteString(stream, "quit");
                return exist;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (tcp != null)
                {
                    tcp.Close();
                }
            }
        }

        private static string GetMailServer(string email)
        {
            var strDomain = email.Split('@')[1];
            ProcessStartInfo info = new ProcessStartInfo();
            info.UseShellExecute = false;
            info.RedirectStandardInput = true;
            info.RedirectStandardOutput = true;
            info.FileName = "nslookup";
            info.CreateNoWindow = true;
            info.Arguments = "-type=mx " + strDomain;
            Process ns = Process.Start(info);
            StreamReader sout = ns.StandardOutput;

            Regex reg = new Regex(@"mail exchanger = (?<mailServer>[^\s]+)");
            string strResponse = "";
            while ((strResponse = sout.ReadLine()) != null)
            {
                Match amatch = reg.Match(strResponse);   // Match  表示单个正则表达式匹配的结果。

                if (reg.Match(strResponse).Success)
                {
                    return amatch.Groups["mailServer"].Value;   //获取由正则表达式匹配的组的集合

                }
            }
            return null;
        }

        private static void WriteString(NetworkStream netStream, string str)
        {
            str = str + "\r\n"; // 加入换行符

            // 将命令行转化为byte[]
            byte[] bWrite = Encoding.Default.GetBytes(str.ToCharArray());

            // 由于每次写入的数据大小是有限制的，那么我们将每次写入的数据长度定在７５个字节，一旦命令长度超过了７５，就分步写入。
            int start = 0;
            int length = bWrite.Length;
            int page = 0;
            int size = 75;
            int count = size;
            try
            {
                if (length > 75)
                {
                    // 数据分页
                    if ((length / size) * size < length)
                        page = length / size + 1;
                    else
                        page = length / size;
                    for (int i = 0; i < page; i++)
                    {
                        start = i * size;
                        if (i == page - 1)
                            count = length - (i * size);
                        netStream.Write(bWrite, start, count);// 将数据写入到服务器上
                    }
                }
                else
                    netStream.Write(bWrite, 0, bWrite.Length);
            }
            catch (Exception)
            {
                // 忽略错误
            }
        }

        private static string ReadString(NetworkStream netStream)
        {
            return new StreamReader(netStream, Encoding.Default).ReadLine();
        }

        private static bool Command(NetworkStream netStream, string command, string state)
        {
            string sp = null;
            bool success = false;
            try
            {
                //addMsg(command);
                WriteString(netStream, command);// 写入命令
                sp = ReadString(netStream);// 接受返回信息
                //addMsg(sp);
                if (sp.IndexOf(state) != -1)// 判断状态码是否正确
                    success = true;
            }
            catch (Exception)
            {
            }
            return success;
        }

        private static string ToBase64(string str)
        {
            try
            {
                byte[] by = Encoding.Default.GetBytes(str.ToCharArray());
                str = Convert.ToBase64String(by);
            }
            catch (Exception)
            {
                // 忽略错误
            }
            return str;
        }
    }
}
