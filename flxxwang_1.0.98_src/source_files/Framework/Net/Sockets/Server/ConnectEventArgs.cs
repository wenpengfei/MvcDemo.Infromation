using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;

namespace Framework.Net.Sockets.Server
{
    public class ConnectEventArgs:EventArgs
    {
        public IAsyncResult AsyncResult;
        //public SocketException Error;
        public Exception Error;
    }
}
