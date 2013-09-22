//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using Framework.Data;
//using System.Data.Common;
//using System.Data;
//using Framework;

//namespace Infomation.Core.Data
//{
//    //租车已放入黄页
//    //public class CarRentDataAccess : DataAccess<CarRent, int>
//    //{
//    //    public override string TableName
//    //    {
//    //        get { return "Info_CarRent"; }
//    //    }

//    //    public override string PrimaryKeyName
//    //    {
//    //        get { return "Id"; }
//    //    }

//    //    public override CarRent Insert(CarRent instance)
//    //    {
//    //        CarRent car = instance as CarRent;

//    //        string sql = "INSERT INTO " + TableName + " (Title,ObjectType,Price,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,Pictures,UserId,CityId,RegionId,CircleId)" +
//    //                                    "VALUES (@Title,@ObjectType,@Price,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@Pictures,@UserId,@CityId,@RegionId,@CircleId)";
//    //        sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

//    //        DbCommand cmd = db.GetSqlStringCommand(sql);
//    //        db.AddInParameter(cmd, "@Title", DbType.String, car.Title);
//    //        db.AddInParameter(cmd, "@ObjectType", DbType.Byte, car.ObjectType);
//    //        db.AddInParameter(cmd, "@Price", DbType.Int32, car.Price);

//    //        db.AddInParameter(cmd, "@Content", DbType.String, car.Content);
//    //        db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, car.IsBiz);
//    //        db.AddInParameter(cmd, "@ContactPerson", DbType.String, car.ContactPerson);
//    //        db.AddInParameter(cmd, "@Phone", DbType.String, car.Phone);
//    //        db.AddInParameter(cmd, "@QQOrMSN", DbType.String, car.QQOrMSN);
//    //        db.AddInParameter(cmd, "@Pictures", DbType.String, car.Pictures);

//    //        db.AddInParameter(cmd, "@UserId", DbType.Int32, car.UserId);
//    //        db.AddInParameter(cmd, "@CityId", DbType.Int16, car.CityId);
//    //        db.AddInParameter(cmd, "@RegionId", DbType.Int32, car.RegionId);
//    //        db.AddInParameter(cmd, "@CircleId", DbType.Int32, car.CircleId);

//    //        car.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

//    //        return car;
//    //    }
//    }
//}
