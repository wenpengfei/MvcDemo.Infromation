using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Framework.Common;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using Framework.Extensions;

namespace Infomation.Core
{
    public class InfoStatistics
    {
        public static void Init()
        {
            InitRecordCount();

            #region 车
            CarAccompany.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            CarBicycle.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            CarBuy.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            CarFitting.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            CarMotor.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            CarOther.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            Carpool.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            CarSecondHand.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            CarService.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            #endregion

            #region 宠物
            PetBird.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            PetCat.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            PetDog.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            PetFood.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            PetGive.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            PetService.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            #endregion

            #region 房产
            HouseHire.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            HouseOffice.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            HouseRent.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            HouseSecond.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            HouseShop.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            HouseShort.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            HouseOther.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            HouseShare.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            HouseBed.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            #endregion

            #region 交友
            FriendActivity.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            FriendHome.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            FriendInterest.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            FriendSex.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            FriendSkill.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            #endregion

            #region 教育
            EduAbroad.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            EduBaby.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            EduDesign.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            EduEducation.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            EduIT.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            EduLanguage.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            EduMBA.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            EduOther.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            EduProfession.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            EduSpecial.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            EduTutor.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            #endregion

            #region 票务
            TicketAirplane.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            TicketCard.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            TicketOther.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            TicketPerform.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            TicketPleasure.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            TicketTrain.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            #endregion

            #region 跳骚市场
            SaleArt.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleAthletics.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleBaby.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleBook.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleClothing.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleCommunication.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleComputer.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleDigital.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleElectric.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleEquipment.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleFacial.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleGame.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleHome.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleMobile.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleMobileNumber.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleOffice.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleOther.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleService.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            //SaleSex.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            SaleSwap.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            #endregion

            #region 求职、招聘、黄页
            Recruit.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            JobSeek.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            YellowPage.AnySaved += new EventHandler<SavedEventArgs>(OnAnySaved);
            #endregion
        }

        private static void OnAnySaved(object sender, SavedEventArgs e)
        {
            //var Info = sender as IInfo;
            var Info = e.Data as IInfo;
            if (Info == null)
            {
                return;
            }
            if (e.Action == SaveAction.Insert)
            {
                if (!Info.InfoCount.ContainsKey(Info.CityId))
                {
                    Info.InfoCount[Info.CityId] = 1;
                }
                else
                {
                    Info.InfoCount[Info.CityId]++;
                }
            }

            if (e.Action == SaveAction.Delete)
            {
                if (!Info.InfoCount.ContainsKey(Info.CityId))
                {
                    Info.InfoCount[Info.CityId] = 0;
                }
                else
                {
                    Info.InfoCount[Info.CityId]--;
                }
            }
        }

        private static void InitRecordCount()
        {
            #region 车
            Init(new CarAccompany());
            Init(new CarBicycle());
            Init(new CarBuy());
            Init(new CarFitting());
            Init(new CarMotor());
            Init(new CarOther());
            Init(new Carpool());
            Init(new CarSecondHand());
            Init(new CarService());
            #endregion

            #region 宠物
            Init(new PetBird());
            Init(new PetCat());
            Init(new PetDog());
            Init(new PetFood());
            Init(new PetGive());
            Init(new PetService());
            #endregion

            #region 房产
            Init(new HouseHire());
            Init(new HouseOffice());
            Init(new HouseRent());
            Init(new HouseSecond());
            Init(new HouseShop());
            Init(new HouseShort());
            Init(new HouseOther());
            Init(new HouseShare());
            Init(new HouseBed());
            #endregion

            #region 交友
            Init(new FriendActivity());
            Init(new FriendHome());
            Init(new FriendInterest());
            Init(new FriendSex());
            Init(new FriendSkill());
            #endregion

            #region 教育
            Init(new EduAbroad());
            Init(new EduBaby());
            Init(new EduDesign());
            Init(new EduEducation());
            Init(new EduIT());
            Init(new EduLanguage());
            Init(new EduMBA());
            Init(new EduOther());
            Init(new EduProfession());
            Init(new EduSpecial());
            Init(new EduTutor());
            #endregion

            #region 票务
            Init(new TicketAirplane());
            Init(new TicketCard());
            Init(new TicketOther());
            Init(new TicketPerform());
            Init(new TicketPleasure());
            Init(new TicketTrain());
            #endregion

            #region 跳骚市场
            Init(new SaleArt());
            Init(new SaleAthletics());
            Init(new SaleBaby());
            Init(new SaleBook());
            Init(new SaleClothing());
            Init(new SaleCommunication());
            Init(new SaleComputer());
            Init(new SaleDigital());
            Init(new SaleElectric());
            Init(new SaleEquipment());
            Init(new SaleFacial());
            Init(new SaleGame());
            Init(new SaleHome());
            Init(new SaleMobile());
            Init(new SaleMobileNumber());
            Init(new SaleOffice());
            Init(new SaleOther());
            Init(new SaleService());
            //Init(new SaleSex());
            Init(new SaleSwap());
            #endregion

            #region 求职、招聘、黄页
            Init(new Recruit());
            Init(new JobSeek());
            Init(new YellowPage());
            #endregion
        }

        private static void Init(IInfo info)
        {
            //var dynamicInfo = info as dynamic;
            //var TableName = dynamicInfo.DataAccess.TableName;
            var TableName = info.GetValue("DataAccess").GetValue("TableName");
            //var db = dynamicInfo.DataAccess.db as Database;
            var db = info.GetValue("DataAccess").GetValue("db") as Database;

            var cities = City.Cities;
            if (info is Recruit)
            {
                var sqlQuery = "select JobType,CityId, COUNT(*) Total from Info_Recruit group by JobType,CityId";
                DbCommand cmd = db.GetSqlStringCommand(sqlQuery);
                DataTable dt = db.ExecuteDataSet(cmd).Tables[0];

                var recruit = info as Recruit;
                foreach(var t in Enum.GetValues(typeof(JobType)))
                {
                    var jobType=(JobType)t;
                    recruit.InfoCount[jobType] = new Dictionary<int, int>();
                    foreach (var city in cities)
                    {
                        var dic = recruit.InfoCount[jobType];
                        dic[city.Id] = 0;
                    }
                }

                foreach (DataRow dr in dt.Rows)
                {
                    var jobType=(JobType)Convert.ToInt32(dr["JobType"]);
                    var cityId=Convert.ToInt32(dr["CityId"]);
                    var total=Convert.ToInt32(dr["Total"]);
                    recruit.InfoCount[jobType][cityId] = total;
                }
            }
            else if (info is JobSeek)
            {
                var sqlQuery = "select JobType,CityId, COUNT(*) Total from Info_JobSeek group by JobType,CityId";
                DbCommand cmd = db.GetSqlStringCommand(sqlQuery);
                DataTable dt = db.ExecuteDataSet(cmd).Tables[0];

                var job = info as JobSeek;
                foreach (var t in Enum.GetValues(typeof(JobType)))
                {
                    var jobType = (JobType)t;
                    job.InfoCount[jobType] = new Dictionary<int, int>();
                    foreach (var city in cities)
                    {
                        var dic = job.InfoCount[jobType];
                        dic[city.Id] = 0;
                    }
                }

                foreach (DataRow dr in dt.Rows)
                {
                    var jobType = (JobType)Convert.ToInt32(dr["JobType"]);
                    var cityId = Convert.ToInt32(dr["CityId"]);
                    var total = Convert.ToInt32(dr["Total"]);
                    job.InfoCount[jobType][cityId] = total;
                }
            }
            else if (info is YellowPage)
            {
                var sqlQuery = "select YellowPageType,CityId, COUNT(*) Total from Info_YellowPage group by YellowPageType,CityId";
                DbCommand cmd = db.GetSqlStringCommand(sqlQuery);
                DataTable dt = db.ExecuteDataSet(cmd).Tables[0];

                var yp = info as YellowPage;
                foreach (var t in Enum.GetValues(typeof(YellowPageType)))
                {
                    var yellowPageType = (YellowPageType)t;
                    yp.InfoCount[yellowPageType] = new Dictionary<int, int>();
                    foreach (var city in cities)
                    {
                        var dic = yp.InfoCount[yellowPageType];
                        dic[city.Id] = 0;
                    }
                }

                foreach (DataRow dr in dt.Rows)
                {
                    var yellowPageType = (YellowPageType)Convert.ToInt32(dr["YellowPageType"]);
                    var cityId = Convert.ToInt32(dr["CityId"]);
                    var total = Convert.ToInt32(dr["Total"]);
                    yp.InfoCount[yellowPageType][cityId] = total;
                }

            }
            else
            {
                
                var sqlQuery = "select CityId,COUNT(*) Total from "+TableName+" group by CityId";
                DbCommand cmd =db.GetSqlStringCommand(sqlQuery);
                DataTable dt = db.ExecuteDataSet(cmd).Tables[0];

                foreach (var city in cities)
                {
                    info.InfoCount[city.Id] =0;
                }

                foreach (DataRow dr in dt.Rows)
                {
                    var cityId = Convert.ToInt32(dr["CityId"]);
                    var total=Convert.ToInt32(dr["Total"]);
                    info.InfoCount[cityId] = total;
                }
            }
        }
    }
}
