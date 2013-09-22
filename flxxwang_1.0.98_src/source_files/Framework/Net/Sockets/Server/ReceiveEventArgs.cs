using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;

namespace Framework.Net.Sockets.Server
{
    public class ReceiveEventArgs:EventArgs
    {
        public IAsyncResult AsyncResult;
        public string Msg;
        //public SocketException Error;
        public Exception Error;
        public ClientWrapper Client;

        public int ReceiveByteCount;//套接字参数中获取的.
        public int ClientSetByteCount;//客户端设置的字节数
        public int ReceivedBufferLength;

        public int ReceiveString;//收到的消息,不一定是期望的.
        
    }
}
