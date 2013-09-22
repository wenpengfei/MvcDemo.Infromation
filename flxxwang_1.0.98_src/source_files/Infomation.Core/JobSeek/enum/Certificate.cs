using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Infomation.Core
{
    /// <summary>
    /// 证书
    /// </summary>
   public class Certificate
    {
       public string Id
       {
           get;
           set;
       }
       /// <summary>
       /// 证书名称
       /// </summary>
       public string Name
       {
           get;
           set;
       }
       /// <summary>
       /// 发证机构
       /// </summary>
       public string CertOrg
       {
           get;
           set;
       }
       public int CertYear
       {
           get;
           set;
       }
       public int CertMonth
       {
           get;
           set;
       }
       /// <summary>
       /// 证书照片路径.
       /// </summary>
       public string CertPic
       {
           get;
           set;
       }
    }
}
