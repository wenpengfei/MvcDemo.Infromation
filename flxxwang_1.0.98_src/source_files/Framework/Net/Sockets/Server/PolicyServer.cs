using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.IO;
using System.Net;

namespace Framework.Net.Sockets.Server
{
    //见帮助文档:Network Security Access Restrictions in Silverlight
    public class PolicyServer
    {
        private Socket m_listener;
        private byte[] m_policy;

        // pass in the path of an XML file containing the socket policy
        public PolicyServer(string policyFile,int Port)
        {
            // Load the policy file
            FileStream policyStream = new FileStream(policyFile, FileMode.Open);

            m_policy = new byte[policyStream.Length];
            policyStream.Read(m_policy, 0, m_policy.Length);

            policyStream.Close();


            // Create the Listening Socket
            //m_listener = new Socket(AddressFamily.InterNetworkV6, SocketType.Stream, ProtocolType.Tcp);
            m_listener = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

            // Put the socket into dual mode to allow a single socket 
            // to accept both IPv4 and IPv6 connections
            // Otherwise, server needs to listen on two sockets,
            // one for IPv4 and one for IPv6
            // NOTE: dual-mode sockets are supported on Vista and later

            //m_listener.SetSocketOption(SocketOptionLevel.IPv6, (SocketOptionName)27, 0);

            //m_listener.Bind(new IPEndPoint(IPAddress.IPv6Any, 943));

            //Flash使用843端口,Silverlight使用943端口.
            //m_listener.Bind(new IPEndPoint(IPAddress.Any, 943));
            m_listener.Bind(new IPEndPoint(IPAddress.Any, Port));

            m_listener.Listen(10);

            m_listener.BeginAccept(new AsyncCallback(OnConnection), null);
        }

        // Called when we receive a connection from a client
        public void OnConnection(IAsyncResult res)
        {
            Socket client = null;

            try
            {
                client = m_listener.EndAccept(res);
            }
            catch (SocketException)
            {
                return;
            }

            // handle this policy request with a PolicyConnection
            PolicyConnection pc = new PolicyConnection(client, m_policy);

            // look for more connections
            m_listener.BeginAccept(new AsyncCallback(OnConnection), null);
        }

        public void Close()
        {
            m_listener.Close();
        }
    }
}
