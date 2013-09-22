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
    public class EduDesignDataAccess : DataAccess<EduDesign, int>
    {
        //public override EduDesign Insert(EduDesign instance)
        //{
        //    EduDesign design = instance as EduDesign;

        //    string sql = "INSERT INTO " + TableName + " (Title,ObjectType,TrainWay,Duration,[Content],ContactPerson,Phone,Address,Bus,Phone2,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Title,@ObjectType,@TrainWay,@Duration,@Content,@ContactPerson,@Phone,@Address,@Bus,@Phone2,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Title", DbType.String, design.Title);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, design.ObjectType);
        //    db.AddInParameter(cmd, "@TrainWay", DbType.String, design.TrainWay);
        //    db.AddInParameter(cmd, "@Duration", DbType.String, design.Duration);

        //    db.AddInParameter(cmd, "@Content", DbType.String, design.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, design.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, design.Phone);
        //    db.AddInParameter(cmd, "@Address", DbType.String, design.Address);
        //    db.AddInParameter(cmd, "@Bus", DbType.String, design.Bus);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, design.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, design.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, design.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, design.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, design.Source);
        //    db.AddInParameter(cmd, "@Phone2", DbType.String, design.Phone2);

        //    design.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return design;
        //}

        public override List<EduDesign> Insert(List<EduDesign> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Title,ObjectType,TrainWay,Duration,[Content],ContactPerson,Phone,Address,Bus,Phone2,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Title" + i + ",@ObjectType" + i + ",@TrainWay" + i + ",@Duration" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Address" + i + ",@Bus" + i + ",@Phone2_" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var design = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Title"+i, DbType.String, design.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, design.ObjectType);
                db.AddInParameter(cmd, "@TrainWay" + i, DbType.String, design.TrainWay);
                db.AddInParameter(cmd, "@Duration" + i, DbType.String, design.Duration);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, design.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, design.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, design.Phone);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, design.Address);
                db.AddInParameter(cmd, "@Bus" + i, DbType.String, design.Bus);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, design.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, design.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, design.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, design.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, design.Source);
                db.AddInParameter(cmd, "@Phone2_" + i, DbType.String, design.Phone2);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, design.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, design.TId);
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
