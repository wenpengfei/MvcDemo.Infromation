using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;
using Framework;

namespace Infomation.Core.Data
{
    public class PetDogDataAccess : DataAccess<PetDog, int>
    {
        //public override PetDog Insert(PetDog instance)
        //{
        //    PetDog dog = instance as PetDog;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,Tag1,Tag2,Sex,Age,AgeUnit,Bacterin,Descent,Price,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@Tag1,@Tag2,@Sex,@Age,@AgeUnit,@Bacterin,@Descent,@Price,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, dog.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, dog.Title);
        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, dog.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, dog.Tag2);
        //    db.AddInParameter(cmd, "@Sex", DbType.Boolean, dog.Sex);
        //    db.AddInParameter(cmd, "@Age", DbType.Byte, dog.Age);
        //    db.AddInParameter(cmd, "@AgeUnit", DbType.String, dog.AgeUnit);
        //    db.AddInParameter(cmd, "@Bacterin", DbType.String, dog.Bacterin);
        //    db.AddInParameter(cmd, "@Descent", DbType.Boolean, dog.Descent);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, dog.Price);

        //    db.AddInParameter(cmd, "@Content", DbType.String, dog.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, dog.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, dog.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, dog.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, dog.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, dog.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, dog.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, dog.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, dog.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, dog.Source);

        //    dog.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return dog;
        //}

        public override List<PetDog> Insert(List<PetDog> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,Tag1,Tag2,Sex,Age,AgeUnit,Bacterin,Descent,Price,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@Sex" + i + ",@Age" + i + ",@AgeUnit" + i + ",@Bacterin" + i + ",@Descent" + i + ",@Price" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var dog = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, dog.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, dog.Title);
                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, dog.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, dog.Tag2);
                db.AddInParameter(cmd, "@Sex" + i, DbType.Boolean, dog.Sex);
                db.AddInParameter(cmd, "@Age" + i, DbType.Byte, dog.Age);
                db.AddInParameter(cmd, "@AgeUnit" + i, DbType.String, dog.AgeUnit);
                db.AddInParameter(cmd, "@Bacterin" + i, DbType.String, dog.Bacterin);
                db.AddInParameter(cmd, "@Descent" + i, DbType.Boolean, dog.Descent);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, dog.Price);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, dog.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, dog.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, dog.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, dog.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, dog.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, dog.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, dog.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, dog.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, dog.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, dog.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, dog.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, dog.TId);
            }
            var ds = db.ExecuteDataSet(cmd);
            for (var i = 0; i < instances.Count(); i++)
            {
                var instance = instances.ElementAt(i);
                instance.Id = Convert.ToInt32(ds.Tables[i].Rows[0][0]);
            }
            return instances;
        }
    }
}
