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
    public class YellowPageDataAccess : DataAccess<YellowPage, int>
    {
        public override List<YellowPage> Insert(List<YellowPage> instances)
        {
            if (instances == null||instances.Count()==0)
            {
                return instances;
            }
            var sql = string.Empty;
            for (var i = 0; i < instances.Count(); i++)
            {
                sql += ";INSERT INTO " + TableName + " (YellowPageType,Title,ObjectType,Tag1,Tag2,Tag3,Tag4,Tag5,Tag6,Tag7,Tag8,Tag9,Tag10,Tag11,Tag12,Address,Price,[Content],ContactPerson,Phone,Phone2,QQOrMSN,Pictures,UserId,CityId,RegionId,CircleId,Source,Sequence,TId)" +
                                            "VALUES (@YellowPageType" + i + ",@Title" + i + ",@ObjectType" + i + ",@Tag1_" + i + ",@Tag2_" + i + ",@Tag3_" + i + ",@Tag4_" + i + ",@Tag5_" + i + ",@Tag6_" + i + ",@Tag7_" + i + ",@Tag8_" + i + ",@Tag9_" + i + ",@Tag10_" + i + ",@Tag11_" + i + ",@Tag12_" + i + ",@Address" + i + ",@Price" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Phone2_" + i + ",@QQOrMSN" + i + ",@Pictures" + i + ",@UserId" + i + ",@CityId" + i + ",@RegionId" + i + ",@CircleId" + i + ",@Source" + i + ",@Sequence"+i+",@TId"+i+")";
                sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
            }
            sql = sql.Substring(1);

            DbCommand cmd = db.GetSqlStringCommand(sql);

            for (var i = 0; i < instances.Count(); i++)
            {
                var yp = instances.ElementAt(i);
                db.AddInParameter(cmd, "@YellowPageType"+i, DbType.Byte, yp.YellowPageType);
                db.AddInParameter(cmd, "@Title" + i, DbType.String, yp.Title);
                db.AddInParameter(cmd, "@ObjectType" + i, DbType.Byte, yp.ObjectType);

                db.AddInParameter(cmd, "@Tag1_" + i, DbType.Byte, yp.Tag1);
                db.AddInParameter(cmd, "@Tag2_" + i, DbType.Byte, yp.Tag2);
                db.AddInParameter(cmd, "@Tag3_" + i, DbType.Byte, yp.Tag3);
                db.AddInParameter(cmd, "@Tag4_" + i, DbType.Byte, yp.Tag4);
                db.AddInParameter(cmd, "@Tag5_" + i, DbType.Byte, yp.Tag5);
                db.AddInParameter(cmd, "@Tag6_" + i, DbType.Byte, yp.Tag6);
                db.AddInParameter(cmd, "@Tag7_" + i, DbType.Byte, yp.Tag7);
                db.AddInParameter(cmd, "@Tag8_" + i, DbType.Byte, yp.Tag8);
                db.AddInParameter(cmd, "@Tag9_" + i, DbType.Byte, yp.Tag9);
                db.AddInParameter(cmd, "@Tag10_" + i, DbType.Byte, yp.Tag10);
                db.AddInParameter(cmd, "@Tag11_" + i, DbType.Byte, yp.Tag11);
                db.AddInParameter(cmd, "@Tag12_" + i, DbType.Byte, yp.Tag12);
                db.AddInParameter(cmd, "@Address" + i, DbType.String, yp.Address);
                db.AddInParameter(cmd, "@Price" + i, DbType.Int32, yp.Price);

                db.AddInParameter(cmd, "@Content" + i, DbType.String, yp.Content);
                db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, yp.ContactPerson);
                db.AddInParameter(cmd, "@Phone" + i, DbType.String, yp.Phone);
                db.AddInParameter(cmd, "@Phone2_" + i, DbType.String, yp.Phone2);
                db.AddInParameter(cmd, "@QQOrMSN" + i, DbType.String, yp.QQOrMSN);
                db.AddInParameter(cmd, "@Pictures" + i, DbType.String, yp.Pictures);

                db.AddInParameter(cmd, "@UserId" + i, DbType.Int32, yp.UserId);
                db.AddInParameter(cmd, "@CityId" + i, DbType.Int16, yp.CityId);
                db.AddInParameter(cmd, "@RegionId" + i, DbType.Int32, yp.RegionId);
                db.AddInParameter(cmd, "@CircleId" + i, DbType.Int32, yp.CircleId);
                db.AddInParameter(cmd, "@Source" + i, DbType.Int64, yp.Source);
                db.AddInParameter(cmd, "@Sequence" + i, DbType.Int16, yp.Sequence);db.AddInParameter(cmd, "@TId" + i, DbType.Int16, yp.TId);
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
