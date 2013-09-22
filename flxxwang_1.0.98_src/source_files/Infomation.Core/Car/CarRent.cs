//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using Framework.Data;
//using Infomation.Core.Data;

//namespace Infomation.Core
//{
//    /// <summary>
//    ///租车信息.(租车已放入黄页)
//    /// </summary>
//    //public class CarRent : CarBase<CarRent>
//    //{
//    //    public byte ObjectType
//    //    {
//    //        get;
//    //        set;
//    //    }
//    //    public int Price
//    //    {
//    //        get;
//    //        set;
//    //    }
//    //    #region InfoBase 重写成员.
//    //    private static List<ObjectType> _objectTypeCollection;
//    //    public override List<ObjectType> ObjectTypeCollection
//    //    {
//    //        get
//    //        {
//    //            if (_objectTypeCollection == null)
//    //            {
//    //                _objectTypeCollection = new List<ObjectType>()
//    //                {
//    //                    new ObjectType()
//    //                    {
//    //                        Id=1,
//    //                        Name="租车行"
//    //                    },
//    //                    new ObjectType()
//    //                    {
//    //                        Id = 2,
//    //                        Name = "旅游租车"
//    //                    },
//    //                    new ObjectType()
//    //                    {
//    //                        Id = 3,
//    //                        Name = "商务租车"
//    //                    },
//    //                    new ObjectType()
//    //                    {
//    //                        Id = 4,
//    //                        Name = "司机"
//    //                    },
//    //                };
//    //            }
//    //            return _objectTypeCollection;
//    //        }
//    //    }

//    //    private static List<InfoTag> _tagCollection;
//    //    public override List<InfoTag> TagCollection
//    //    {
//    //        get
//    //        {
//    //            if (_tagCollection == null)
//    //            {
//    //                _tagCollection = new List<InfoTag>();
//    //            }
//    //            return _tagCollection;
//    //        }
//    //    }
//    //    #endregion
//    //    protected override DataAccess<CarRent, int> GetProvider()
//    //    {
//    //        return new CarRentDataAccess();
//    //    }
//    //}
//}
