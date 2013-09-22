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
    public class PetBirdDataAccess : DataAccess<PetBird, int>
    {
        //public override PetBird Insert(PetBird instance)
        //{
        //    PetBird bird = instance as PetBird;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,ObjectType,Tag,Price,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@ObjectType,@Tag,@Price,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, bird.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, bird.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, bird.ObjectType);
        //    db.AddInParameter(cmd, "@Tag", DbType.Byte, bird.Tag);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, bird.Price);

        //    db.AddInParameter(cmd, "@Content", DbType.String, bird.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, bird.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, bird.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, bird.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, bird.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, bird.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, bird.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, bird.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, bird.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, bird.Source);

        //    bird.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return bird;
        //}

        public override List<PetBird> Insert(List<PetBird> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,ObjectType,Tag,Price,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                             "VALUES (@Type" + i + ",@Title" + i + ",@ObjectType" + i + ",@Tag" + i + ",@Price" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);
            for (var i = 0; i < instances.Count(); i++)
            {
                var bird = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, bird.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, bird.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, bird.ObjectType);
                db.AddInParameter(cmd, "@Tag" + i, DbType.Byte, bird.Tag);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, bird.Price);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, bird.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, bird.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, bird.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, bird.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, bird.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, bird.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, bird.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, bird.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, bird.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, bird.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, bird.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, bird.TId);
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
