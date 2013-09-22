using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Security.Cryptography;

namespace Framework.Security
{
    public class CryptoUtil
    {
        //加密算法
        /// <summary>
        /// DESC加密算法
        /// </summary>
        /// <param name="pToEncrypt">需加要加密的内容</param>
        /// <param name="Key">密钥,必须为8位</param>
        /// <returns></returns>
        public static string DESCEncrypt(string pToEncrypt, string Key)
        {

            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            des.Key = ASCIIEncoding.ASCII.GetBytes(Key);
            des.IV = ASCIIEncoding.ASCII.GetBytes(Key);
            byte[] ByteArray = Encrypt(pToEncrypt, des);
            return ByteArrayToString(ByteArray);



        }
        // C# to convert a string to a byte array.
        public static byte[] StringToByteArray(string str)
        {
            //System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
            //return encoding.GetBytes(str);


            byte[] ByteArray = System.Convert.FromBase64String(str);
            return ByteArray;
        }
        public static string ByteArrayToString(byte[] ByteArray)
        {
            //string str;
            //System.Text.ASCIIEncoding enc = new System.Text.ASCIIEncoding();
            //str = enc.GetString(ByteArray);
            //return str;

            string str = System.Convert.ToBase64String(ByteArray);
            return str;

        }

        //解密算法
        /// <summary>
        /// DESC解密算法
        /// </summary>
        /// <param name="pToDecrypt">要解密的内容</param>
        /// <param name="Key">密钥,必须为8位</param>
        /// <returns></returns>
        public static string DESCDecrypt(string pToDecrypt, string Key)
        {

            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            des.Key = ASCIIEncoding.ASCII.GetBytes(Key);
            des.IV = ASCIIEncoding.ASCII.GetBytes(Key);
            byte[] ByteArray = StringToByteArray(pToDecrypt);
            return Decrypt(ByteArray, des);

        }


        // Encrypt the string.(摘自MSDN)
        public static byte[] Encrypt(string PlainText, SymmetricAlgorithm key)
        {
            // Create a memory stream.
            MemoryStream ms = new MemoryStream();

            // Create a CryptoStream using the memory stream and the 
            // CSP DES key.  
            CryptoStream encStream = new CryptoStream(ms, key.CreateEncryptor(), CryptoStreamMode.Write);

            // Create a StreamWriter to write a string
            // to the stream.
            StreamWriter sw = new StreamWriter(encStream);

            // Write the plaintext to the stream.
            sw.WriteLine(PlainText);

            // Close the StreamWriter and CryptoStream.
            sw.Close();
            encStream.Close();

            // Get an array of bytes that represents
            // the memory stream.
            byte[] buffer = ms.ToArray();

            // Close the memory stream.
            ms.Close();

            // Return the encrypted byte array.
            return buffer;
        }

        // Decrypt the byte array.(摘自MSDN)
        public static string Decrypt(byte[] CypherText, SymmetricAlgorithm key)
        {
            // Create a memory stream to the passed buffer.
            MemoryStream ms = new MemoryStream(CypherText);

            // Create a CryptoStream using the memory stream and the 
            // CSP DES key. 
            CryptoStream encStream = new CryptoStream(ms, key.CreateDecryptor(), CryptoStreamMode.Read);

            // Create a StreamReader for reading the stream.
            StreamReader sr = new StreamReader(encStream);

            // Read the stream as a string.
            string val = sr.ReadLine();

            // Close the streams.
            sr.Close();
            encStream.Close();
            ms.Close();

            return val;
        }
        //加密算法
        /// <summary>
        /// RSA加密算法
        /// </summary>
        /// <param name="encryptString"></param>
        /// <returns></returns>
        public string RSAEncrypt(string encryptString)
        {
            CspParameters csp = new CspParameters();
            csp.KeyContainerName = "whaben";
            RSACryptoServiceProvider RSAProvider = new RSACryptoServiceProvider(csp);
            byte[] encryptBytes = RSAProvider.Encrypt(ASCIIEncoding.ASCII.GetBytes(encryptString), true);
            string str = "";
            foreach (byte b in encryptBytes)
            {
                str = str + string.Format("{0:x2}", b);
            }
            return str;
        }
        //解密算法
        /// <summary>
        /// RSA解密算法
        /// </summary>
        /// <param name="decryptString"></param>
        /// <returns></returns>
        public string RSADecrypt(string decryptString)
        {
            CspParameters csp = new CspParameters();
            csp.KeyContainerName = "whaben";
            RSACryptoServiceProvider RSAProvider = new RSACryptoServiceProvider(csp);
            int length = (decryptString.Length / 2);
            byte[] decryptBytes = new byte[length];
            for (int index = 0; index < length; index++)
            {
                string substring = decryptString.Substring(index * 2, 2);
                decryptBytes[index] = Convert.ToByte(substring, 16);
            }
            decryptBytes = RSAProvider.Decrypt(decryptBytes, true);
            return ASCIIEncoding.ASCII.GetString(decryptBytes);
        }
    }
}
