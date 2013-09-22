using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using System.Data.Common;
using System.Data;
using Framework;
using Framework.Extensions;

namespace Infomation.Core.Data
{
    public class CompanyDataAccess : DataAccess<Company, int>
    {
        //public override Company Insert(Company instance)
        //{
            
        //    Company company = instance as Company;
        //    if (company.UserId != null)
        //    {
        //        Company ExistCompany = Company.Select(item=>item.UserId==company.UserId);
        //        if (ExistCompany != null)
        //        {
        //            ExistCompany.CompanyName = company.CompanyName;
        //            ExistCompany.CompanyName2 = company.CompanyName2;
        //            ExistCompany.TradeId = company.TradeId;
        //            ExistCompany.TypeId = company.TypeId;
        //            ExistCompany.SizeId = company.SizeId;
        //            ExistCompany.Email = company.Email;
        //            ExistCompany.Address = company.Address;
        //            ExistCompany.Content = company.Content;
        //            ExistCompany.ContactPerson = company.ContactPerson;
        //            ExistCompany.Phone = company.Phone;
        //            ExistCompany.Mobile = company.Mobile;
        //            ExistCompany.Source = company.Source;
        //            ExistCompany.DateModified = DateTime.Now;
        //            return ExistCompany.Update();
        //        }
        //    }
        //    string sql = "INSERT INTO " + TableName + " (UserId,CompanyName,CompanyName2,TradeId,TypeId,SizeId,Email,Address,[Content],ContactPerson,Phone,Mobile,Source)" +
        //                                "VALUES (@UserId,@CompanyName,@CompanyName2,@TradeId,@TypeId,@SizeId,@Email,@Address,@Content,@ContactPerson,@Phone,@Mobile,@Source)";
        //    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";

        //    DbCommand cmd = db.GetSqlStringCommand(sql);
        //    db.AddInParameter(cmd, "@UserId", DbType.Int32, company.UserId);
        //    db.AddInParameter(cmd, "@CompanyName", DbType.String, company.CompanyName);
        //    db.AddInParameter(cmd, "@CompanyName2", DbType.String, company.CompanyName2);
        //    db.AddInParameter(cmd, "@TradeId", DbType.Byte, company.TradeId);

        //    db.AddInParameter(cmd, "@TypeId", DbType.Byte, company.TypeId);
        //    db.AddInParameter(cmd, "@SizeId", DbType.Byte, company.SizeId);
        //    db.AddInParameter(cmd, "@Email", DbType.String, company.Email);
        //    db.AddInParameter(cmd, "@Address", DbType.String, company.Address);

        //    db.AddInParameter(cmd, "@Content", DbType.String, company.Content);
        //    db.AddInParameter(cmd, "@ContactPerson", DbType.String, company.ContactPerson);
        //    db.AddInParameter(cmd, "@Phone", DbType.String, company.Phone);
        //    db.AddInParameter(cmd, "@Mobile", DbType.String, company.Mobile);
        //    db.AddInParameter(cmd, "@Source", DbType.Int64, company.Source);

        //    company.Id = Convert.ToInt32(db.ExecuteScalar(cmd));

        //    return company;
        //}

        public override List<Company> Insert(List<Company> instances)
        {
            if (instances == null || instances.Count() == 0)
            {
                return instances;
            }
            var userIdList=instances.Where(item=>item.UserId!=null).Select(item=>item.UserId);
            var userids = string.Empty;
            foreach (var item in userIdList)
            {
                userids += "," + item;
            }
            
            //var existList = Company.SelectAll(item => item.UserId != null && userIdList.Contains(item.Id));
            List<Company> existList = new List<Company>();
            if (!string.IsNullOrWhiteSpace(userids))
            {
                userids = userids.Substring(1);
                existList = Company.SelectAll("select * from Info_Company where UserId in (" + userids + ")");
            }
            //var insertList=instances.Where(item => !existList.Contains(item));////////////////////
            var insertList = instances.Where(item => existList.FirstOrDefault(exist => exist.UserId != null && exist.UserId == item.UserId) == null).ToList();//必须要ToList,因为Enumerable中的元素修改后会被移除.

            //var updateList = new List<Company>();
            foreach (var exist in existList)
            {
                var company = instances.First(item => item.UserId == exist.UserId);
                exist.CompanyName = company.CompanyName;
                exist.CompanyName2 = company.CompanyName2;
                exist.TradeId = company.TradeId;
                exist.TypeId = company.TypeId;
                exist.SizeId = company.SizeId;
                exist.Email = company.Email;
                exist.Address = company.Address;
                exist.Content = company.Content;
                exist.ContactPerson = company.ContactPerson;
                exist.Phone = company.Phone;
                exist.Mobile = company.Mobile;
                exist.Source = company.Source;
                exist.DateModified = DateTime.Now;
                //updateList.Add(exist);
            }
            var haveUpdatedCollection= Company.Update(existList);

            if (insertList!=null&&insertList.Count() > 0)
            {
                string sql = string.Empty;
                for (var i = 0; i < insertList.Count(); i++)
                {
                    sql += ";INSERT INTO " + TableName + " (UserId,CompanyName,CompanyName2,TradeId,TypeId,SizeId,Email,Address,[Content],ContactPerson,Phone,Mobile,Source)" +
                                                "VALUES (@UserId" + i + ",@CompanyName" + i + ",@CompanyName2_" + i + ",@TradeId" + i + ",@TypeId" + i + ",@SizeId" + i + ",@Email" + i + ",@Address" + i + ",@Content" + i + ",@ContactPerson" + i + ",@Phone" + i + ",@Mobile" + i + ",@Source" + i + ")";
                    sql += " ;SELECT SCOPE_IDENTITY() as newIDValue ";
                }
                sql = sql.Substring(1);

                DbCommand cmd = db.GetSqlStringCommand(sql);

                for (var i = 0; i < insertList.Count(); i++)
                {
                    var company = insertList.ElementAt(i);
                    db.AddInParameter(cmd, "@UserId"+i, DbType.Int32, company.UserId);
                    db.AddInParameter(cmd, "@CompanyName" + i, DbType.String, company.CompanyName);
                    db.AddInParameter(cmd, "@CompanyName2_" + i, DbType.String, company.CompanyName2);
                    db.AddInParameter(cmd, "@TradeId" + i, DbType.Byte, company.TradeId);

                    db.AddInParameter(cmd, "@TypeId" + i, DbType.Byte, company.TypeId);
                    db.AddInParameter(cmd, "@SizeId" + i, DbType.Byte, company.SizeId);
                    db.AddInParameter(cmd, "@Email" + i, DbType.String, company.Email);
                    db.AddInParameter(cmd, "@Address" + i, DbType.String, company.Address);

                    db.AddInParameter(cmd, "@Content" + i, DbType.String, company.Content);
                    db.AddInParameter(cmd, "@ContactPerson" + i, DbType.String, company.ContactPerson);
                    db.AddInParameter(cmd, "@Phone" + i, DbType.String, company.Phone);
                    db.AddInParameter(cmd, "@Mobile" + i, DbType.String, company.Mobile);
                    db.AddInParameter(cmd, "@Source" + i, DbType.Int64, company.Source);
                }
                var ds = db.ExecuteDataSet(cmd);
                for (var i = 0; i < insertList.Count(); i++)
                {
                    var instance = insertList.ElementAt(i);
                    instance.Id = Convert.ToInt32(ds.Tables[i].Rows[0][0]);
                }
            }
            var retList = new List<Company>();
            foreach (var item in haveUpdatedCollection)
            {
                retList.Add(item);
            }
            foreach (var item in insertList)
            {
                retList.Add(item);
            }
            return retList;
        }
    }
}
