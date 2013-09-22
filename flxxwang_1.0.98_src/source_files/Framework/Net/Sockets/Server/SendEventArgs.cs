using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;

namespace Framework.Net.Sockets.Server
{
    public class SendEventArgs:EventArgs
    {
        public IAsyncResult AsyncResult;
        public string Msg;
        //public SocketException Error;
        public Exception Error;
    }
}
