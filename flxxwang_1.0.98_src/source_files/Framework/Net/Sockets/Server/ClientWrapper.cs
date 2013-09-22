using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;

namespace Framework.Net.Sockets.Server
{
    public class ClientWrapper
    {
        public Socket Socket;
        public byte[] Buffer;// = new byte[ConstParameter.BUFFER_SIZE];
        //说明：Buffer只允许用来从客户端接收值，除此之外不得对其值进行设置
        public object Tag;//保存任何用户自定的数据。有时需自定义，如：保存用户登陆状态，如果用户没有登陆，就不必向客户端发送某些消息。
    }
}
