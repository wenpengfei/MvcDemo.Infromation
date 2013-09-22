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
    public class SaleComputerDataAccess : DataAccess<SaleComputer, int>
    {
        //public override SaleComputer Insert(SaleComputer instance)
        //{
        //    SaleComputer computer = instance as SaleComputer;

        //    string sql = "INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag1,Tag2,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source)" +
        //                                "VALUES (@Type,@Title,@District,@ObjectType,@Tag1,@Tag2,@Quality,@Price,@Pictures,@Content,@IsBiz,@ContactPerson,@Phone,@QQOrMSN,@UserId,@CityId,@RegionId,@CircleId,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@Type", DbType.Byte, computer.Type);
        //    db.AddInParameter(cmd, "@Title", DbType.String, computer.Title);
        //    db.AddInParameter(cmd, "@District", DbType.String, computer.District);
        //    db.AddInParameter(cmd, "@ObjectType", DbType.Byte, computer.ObjectType);
        //    db.AddInParameter(cmd, "@Tag1", DbType.Byte, computer.Tag1);
        //    db.AddInParameter(cmd, "@Tag2", DbType.Byte, computer.Tag2);
        //    db.AddInParameter(cmd, "@Quality", DbType.Byte, computer.Quality);
        //    db.AddInParameter(cmd, "@Price", DbType.Int32, computer.Price);
        //    db.AddInParameter(cmd, "@Pictures", DbType.String, computer.Pictures);

        //    db.AddInParameter(cmd, "@Content", DbType.String, computer.Content);
        //    db.AddInParameter(cmd, "@IsBiz", DbType.Boolean, computer.IsBiz);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, computer.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, computer.Phone);
        //    db.AddInParameter(cmd, "@QQOrMSN", DbType.String, computer.QQOrMSN);

        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, computer.UserId);
        //    db.AddInParameter(cmd, "@CityId", DbType.Int16, computer.CityId);
        //    db.AddInParameter(cmd, "@RegionId", DbType.Int32, computer.RegionId);
        //    db.AddInParameter(cmd, "@CircleId", DbType.Int32, computer.CircleId);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, computer.Source);

        //    computer.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return computer;
        //}

        public override List<SaleComputer> Insert(List<SaleComputer> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (Type,Title,District,ObjectType,Tag1,Tag2,Quality,Price,Pictures,[Content],IsBiz,ContactPerson,Phone,QQOrMSN,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@Type" + i + ",@Title" + i + ",@District" + i + ",@ObjectType" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@Quality" + i + ",@Price" + i + ",@Pictures" + i + ",@Content" + i + ",@IsBiz" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@QQOrMSN" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var computer = instances.ElementAt(i);
                db.AddInParameter(cmd, "@Type"+i, DbType.Byte, computer.Type);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, computer.Title);
                db.AddInParameter(cmd, "@District" + i, DbType.String, computer.District);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, computer.ObjectType);
                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, computer.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, computer.Tag2);
                db.AddInParameter(cmd, "@Quality" + i, DbType.Byte, computer.Quality);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, computer.Price);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, computer.Pictures);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, computer.Content);
                db.AddInParameter(cmd, "@IsBiz" + i, DbType.Boolean, computer.IsBiz);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, computer.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, computer.Phone);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, computer.QQOrMSN);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, computer.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, computer.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, computer.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, computer.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, computer.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, computer.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, computer.TId);
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
