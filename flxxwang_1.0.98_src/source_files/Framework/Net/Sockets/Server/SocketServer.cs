using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.Net;
using Framework.Extensions;
using System.IO;
using System.Threading;

namespace Framework.Net.Sockets.Server
{
    public class SocketServer
    {
        public int Port
        {
            get;
            set;
        }

        public int backlog
        {
            get;
            set;
        }

        public List<ClientWrapper> ClientList
        {
            get;
            private set;
        }

        public Socket socket
        {
            get;
            private set;
        }

        private int BUFFER_SIZE = 1024;//以字节为单位
        public int BufferSize
        {
            get
            {
                return BUFFER_SIZE;
            }
            set
            {
                BUFFER_SIZE = value;
            }
        }

        #region 事件及其引发
        public event EventHandler<ConnectEventArgs> Connected;
        public event EventHandler<SendEventArgs> Sended;
        public event EventHandler<ReceiveEventArgs> Received;

        public void RaiseConnected(object sender, ConnectEventArgs args)
        {
            if (Connected != null)
            {
                Connected(sender, args);
            }
        }
        public void RaiseSended(object sender, SendEventArgs args)
        {
            if (Sended != null)
            {
                Sended(sender, args);
            }
        }
        public void RaiseReceived(object sender, ReceiveEventArgs args)
        {
            if (Received != null)
            {
                Received(sender, args);
            }
        }
        #endregion

        public SocketServer()
        {
            
        }
        public bool IsRunning
        {
            get
            {
                if (socket != null && socket.Connected)
                {
                    return true;
                }
                return false;
            }
        }
        public void Listen()
        {
            ClientList = new List<ClientWrapper>();

            PolicyServer ps1 = new PolicyServer("PolicyFile.xml", 843);//对于Flash应该是用843
            PolicyServer ps2 = new PolicyServer("PolicyFile.xml", 943);//对于Silverlight用943 (好像843也行)

            socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            socket.Bind(new IPEndPoint(IPAddress.Any, Port));
            socket.Listen(backlog);

            socket.BeginAccept(new AsyncCallback(ConnectComplate), null);
        }

        void ConnectComplate(IAsyncResult result)
        {

            ClientWrapper client = new ClientWrapper();
            Exception Error = null;
            try
            {
                client.Socket = socket.EndAccept(result);
                if (client.Socket.Connected)
                {
                    client.Buffer = new byte[BufferSize];
                    ClientList.Add(client);

                    client.Socket.BeginReceive(client.Buffer, 0, client.Buffer.Length, SocketFlags.None, new AsyncCallback(ReceiveComplte), client);


                    //client.Socket.BeginReceive(client.Buffer, 0, 4, SocketFlags.None, new AsyncCallback(ReceiveComplte), client);
                    //if (IsReceiveMessageLength)
                    //{
                        //client.Socket.BeginReceive(client.Buffer, 0, 4, SocketFlags.None, new AsyncCallback(ReceiveComplte), client);
                    //}
                    //else
                    //{
                    //    client.Socket.BeginReceive(client.Buffer, 0, MesssageLength, SocketFlags.None, new AsyncCallback(ReceiveComplte), client);
                    //}
                }
                socket.BeginAccept(new AsyncCallback(ConnectComplate), null);

            }
            catch (Exception ex)
            {
                Error = ex;
            }



            //if (Connected != null)
            //{
            //    Connected(this, new ConnectEventArgs()
            //    {
            //        AsyncResult = result,
            //        Error = Error
            //    });
            //}
            RaiseConnected(this, new ConnectEventArgs()
            {
                AsyncResult = result,
                Error = Error
            });


            ////通知客户端状态(压币或开奖)，客户端在进入游戏时需要获取此值
            //Infomation info = new Infomation() { IsPress = (GState == GameState.Press), IsOpen = (GState == GameState.Open) };
            ////JsonConverter converter=new 
            //string Jstring = JsonConvert.SerializeObject(info);
            //byte[] buffer = Encoding.UTF8.GetBytes(Jstring);
            //if (buffer.Length > ConstParameter.BUFFER_SIZE)
            //{
            //    //此时应该报错 (暂不处理)
            //}

            //client.Socket.BeginSend(buffer, 0, buffer.Length, SocketFlags.None, new AsyncCallback(SendComplete), client);

            //要用一个没有数据的Buffer接收


        }

        void ReceiveComplte(IAsyncResult result)
        {
            ClientWrapper client = result.AsyncState as ClientWrapper;
            List<string> msgArray = new List<string>();
            Exception Error = null;

            int ReceiveByteCount = -1;
            int msglen = -1;
            int ReceivedBufferLength = client.Buffer.Length;
            try
            {
                ReceiveByteCount = client.Socket.EndReceive(result);//当客户端刷新时此处会引起异常。
                //ReceiveString = Encoding.UTF8.GetString(client.Buffer, 0, ReceiveByteCount);//如果不考虑Flash这样的客户端，使用此句即可。
                //ReceiveString = Encoding.UTF8.GetString(client.Buffer, 4, ReceiveByteCount-4);//考虑Flash版前4个字节用来存放消息长度。


                string TestString = Encoding.UTF8.GetString(client.Buffer, 0, ReceiveByteCount);
                if (TestString.StartsWith("<policy-file-request/>"))
                {
                    Error = new Exception("<policy-file-request/>");

                    FileStream policyStream = new FileStream("PolicyFile.xml", FileMode.Open);

                    byte[] m_policy = new byte[policyStream.Length];
                    policyStream.Read(m_policy, 0, m_policy.Length);

                    policyStream.Close();

                    //client.Socket.BeginSend(m_policy, 0, m_policy.Length, SocketFlags.None, new AsyncCallback(SendComplete), list);
                    client.Socket.BeginSend(m_policy, 0, m_policy.Length, SocketFlags.None, null, null);
                    client.Socket.Close();
                    ClientList.Remove(client);
                }
                else
                {
                    msgArray = GetStringArray(client.Buffer, 0);

                    //byte[] Buf = new byte[client.Buffer.Length];
                    //for (int i = 0; i < client.Buffer.Length; i++)
                    //{
                    //    Buf[i] = client.Buffer[i];
                    //}
                    //msgArray = GetStringArray(Buf,0);

                    //string sep = Encoding.UTF8.GetString(client.Buffer, 0, 4);
                    //string[] temp = TestString.Split(new string[] { sep }, StringSplitOptions.RemoveEmptyEntries);
                    //foreach (var str in temp)
                    //{
                    //    msgArray.Add(str);
                    //}
                    //string[] b = temp;

                    //msgArray.Add(TestString.Replace(sep, ""));
                    


                    //byte[] temp = new byte[4];
                    //temp[0] = client.Buffer[0];
                    //temp[1] = client.Buffer[1];
                    //temp[2] = client.Buffer[2];
                    //temp[3] = client.Buffer[3];
                    //msglen = temp.ToInt32();
                    //Msg = Encoding.UTF8.GetString(client.Buffer, 4, msglen);//考虑Flash版前4个字节用来存放消息长度。

                    client.Buffer = new byte[client.Buffer.Length];
                    client.Socket.BeginReceive(client.Buffer, 0, client.Buffer.Length, SocketFlags.None, new AsyncCallback(ReceiveComplte), client);
                }
            }
            catch (Exception ex)
            {
                Error = ex;

                //ClientList.Remove(client);
                //client.Socket.Close();
            }
            //if (Received != null)
            //{
            //    foreach (var str in msgArray)
            //    {
            //        Received(this, new ReceiveEventArgs()
            //        {
            //            AsyncResult = result,
            //            Msg = str,
            //            Error = Error,
            //            Client = client,
            //            ReceiveByteCount = ReceiveByteCount,
            //            ClientSetByteCount = msglen,
            //            ReceivedBufferLength = ReceivedBufferLength
            //        });
            //        //Thread.Sleep(1000);
            //    }
            //    //Received(this, new ReceiveEventArgs()
            //    //{
            //    //    AsyncResult = result,
            //    //    Msg = Msg,
            //    //    Error = Error,
            //    //    Client = client,
            //    //    ReceiveByteCount = ReceiveByteCount,
            //    //    ClientSetByteCount = msglen,
            //    //    ReceivedBufferLength = ReceivedBufferLength
            //    //});
            //}

            foreach (var str in msgArray)
            {
                //Received(this, new ReceiveEventArgs()
                //{
                //    AsyncResult = result,
                //    Msg = str,
                //    Error = Error,
                //    Client = client,
                //    ReceiveByteCount = ReceiveByteCount,
                //    ClientSetByteCount = msglen,
                //    ReceivedBufferLength = ReceivedBufferLength
                //});
                RaiseReceived(this,new ReceiveEventArgs()
                {
                    AsyncResult = result,
                    Msg = str,
                    Error = Error,
                    Client = client,
                    ReceiveByteCount = ReceiveByteCount,
                    ClientSetByteCount = msglen,
                    ReceivedBufferLength = ReceivedBufferLength
                });
            }
        }

        private List<string> GetStringArray(byte[] buffer, int offset)
        {
            List<string> strings = new List<string>();

            if (offset > buffer.Length - 4)
            {
                return strings;
            }

            byte[] temp = new byte[4];
            temp[0] = buffer[offset];
            temp[1] = buffer[offset + 1];
            temp[2] = buffer[offset + 2];
            temp[3] = buffer[offset + 3];
            int size = temp.ToInt32();
            
            if (size <= 0)
            {
                return strings;
            }
            if (size > buffer.Length)
            {
                return strings;
            }
            if (size != 0)
            {
                string str = Encoding.UTF8.GetString(buffer, offset+4, size);
                strings.Add(str);

                //MessageBox.Show(size.ToString());
                Thread.Sleep(1);//很奇怪,传到服务器上需暂停一会儿才行。不加本地运行也正常。

                List<string> list = GetStringArray(buffer, offset + 4 + size);

                foreach (var obj in list)
                {
                    strings.Add(obj);
                }
            }

            return strings;
        }

        #region 注释了的
        //private List<string> GetStringArray(byte[] buffer)
        //{
        //    List<string> strings = new List<string>();

        //    //if (offset > buffer.Length - 4)
        //    //{
        //    //    return strings;
        //    //}

        //    if (buffer.Length < 700)
        //    {
        //        return strings;
        //    }

        //    byte[] temp = new byte[4];
        //    temp[0] = buffer[0];
        //    temp[1] = buffer[1];
        //    temp[2] = buffer[2];
        //    temp[3] = buffer[3];
        //    int size = temp.ToInt32();
        //    //MessageBox.Show(size.ToString());
        //    if (size <= 0)
        //    {
        //        return strings;
        //    }
        //    if (size > buffer.Length)
        //    {
        //        return strings;
        //    }
        //    if (size != 0)
        //    {
        //        string str = Encoding.UTF8.GetString(buffer, 4, size);
        //        strings.Add(str);

        //        byte[] Buf = new byte[buffer.Length - 4 - size];
        //        for (int i = 0; i < Buf.Length; i++)
        //        {
        //            Buf[i] = buffer[i + 4+size];
        //        }
        //        List<string> list = GetStringArray(Buf);
        //        foreach (var obj in list)
        //        {
        //            strings.Add(obj);
        //        }
        //    }

        //    return strings;
        //}
        #endregion

        public void SendComplete(IAsyncResult result)
        {

            List<object> list = result.AsyncState as List<object>;

            //ClientWrapper client = result.AsyncState as ClientWrapper;

            ClientWrapper client = list[0] as ClientWrapper;
            string Msg = list[1].ToString();
            Exception Error=null;
            try
            {
                if (client.Socket.Connected)
                {
                    client.Socket.EndSend(result);
                }
            }
            catch (Exception ex)
            {
                Error = ex;
            }

            //if (Sended != null)
            //{
            //    Sended(this, new SendEventArgs()
            //    {
            //        AsyncResult=result,
            //        Msg=Msg,
            //        Error=Error
            //    });
            //}
            RaiseSended(this, new SendEventArgs()
                {
                    AsyncResult = result,
                    Msg = Msg,
                    Error = Error
                });
        }

        public virtual void Broadcast(string Msg)
        {
            if (ClientList == null||ClientList.Count()==0)//没有客户端连接
            {
                //if (Sended != null)
                //{
                //    Sended(this, new SendEventArgs()
                //    {
                //        AsyncResult = null,//为null表示没有客户端连接
                //        Msg = Msg,
                //        Error = null
                //    });
                //}
                return;
            }
            List<ClientWrapper> removes = new List<ClientWrapper>();
            foreach (var cl in ClientList)
            {
                if (cl.Socket.Connected)
                {
                    
                    //byte[] buffer = Encoding.UTF8.GetBytes(Msg);

                    byte[] buffer = AddMessageLength(Encoding.UTF8.GetBytes(Msg));//考虑Flash版获取不到消息长度，才加上。
                    //cl.Buffer = buffer;//不能这样做，接收时会取到此Buffer中的数据。因为cl内存地址不变的。此处保存buffer仅仅是为了异步回调时随cl一起传递，以便作其他处理。
                    //cl.Buffer只用于从客户端接收值
                    List<object> list = new List<object>();
                    list.Add(cl);
                    list.Add(Msg);
                    //try
                    //{
                        cl.Socket.BeginSend(buffer, 0, buffer.Length, SocketFlags.None, new AsyncCallback(SendComplete), list);
                    //}
                    //catch (Exception ex)
                    //{
                        
                    //}
                }
                else
                {
                    removes.Add(cl);
                    //ClientList.Remove(cl);//这里修改了ClientList然后又遍历ClientList就要出错，正在遍历时不要更改。
                }
            }
            foreach (var cl in removes)
            {
                ClientList.Remove(cl);
            }
        }

        public virtual void Send(ClientWrapper client, string Msg)
        {
            if (client.Socket.Connected)
            {

                //byte[] buffer = Encoding.UTF8.GetBytes(Msg);

                byte[] buffer = AddMessageLength(Encoding.UTF8.GetBytes(Msg));//考虑Flash版获取不到消息长度，才加上。

                //cl.Buffer = buffer;//不能这样做，接收时会取到此Buffer中的数据。因为cl内存地址不变的。此处保存buffer仅仅是为了异步回调时随cl一起传递，以便作其他处理。
                //cl.Buffer只用于从客户端接收值
                List<object> list = new List<object>();
                list.Add(client);
                list.Add(Msg);

                client.Socket.BeginSend(buffer, 0, buffer.Length, SocketFlags.None, new AsyncCallback(SendComplete), list);
            }
            else
            {
                ClientList.Remove(client);
            }
        }

        public virtual void Send(IEnumerable<ClientWrapper> clients, string Msg)
        {
            foreach (var cl in clients)
            {
                if (cl.Socket.Connected)
                {

                    //byte[] buffer = Encoding.UTF8.GetBytes(Msg);

                    byte[] buffer = AddMessageLength(Encoding.UTF8.GetBytes(Msg));//考虑Flash版获取不到消息长度，才加上。
                    //cl.Buffer = buffer;//不能这样做，接收时会取到此Buffer中的数据。因为cl内存地址不变的。此处保存buffer仅仅是为了异步回调时随cl一起传递，以便作其他处理。
                    //cl.Buffer只用于从客户端接收值
                    List<object> list = new List<object>();
                    list.Add(cl);
                    list.Add(Msg);
                    cl.Socket.BeginSend(buffer, 0, buffer.Length, SocketFlags.None, new AsyncCallback(SendComplete), list);
                }
                else
                {
                    ClientList.Remove(cl);
                }
            }
        }

        public byte[] AddMessageLength(byte[] buffer)
        {//Flash版不有从参数中得到消息长度
            byte[] retBuffer = new byte[buffer.Length + 4];
            for (int i = buffer.Length-1; i >= 0; i--)
            {
                retBuffer[i + 4] = buffer[i];
            }
            byte[] msglen = buffer.Length.ToByteArray();
            for (int i = 0; i < 4; i++)
            {
                retBuffer[i] = msglen[i];
            }
            return retBuffer;
        }

        public void Close()
        {//此方法目前还有错误，若想停止，直接把程序关掉好了。
            //throw new NotImplementedException("请直接关闭程序");
            //if (socket != null)
            //{
            //    socket.Shutdown(SocketShutdown.Both);//见MSDN Socket:Close 方法
            //    socket.Close();
            //    //socket.Dispose();
                
            //    //socket = null;
            //}
            //if (ClientList != null)
            //{
            //    ClientList.Clear();
            //    ClientList = null;
            //}
        }
    }
}
