using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Extensions;

namespace Infomation.Core.Manage
{
    public class KeywordStatUpdate
    {
        List<KeywordStat> statList = new List<KeywordStat>();
        List<Keyword> keywordList = null;

        public void Update()
        {
            KeywordStat.DeleteAll();

            keywordList = Keyword.SelectAll();

            Update<CarAccompany>();
            Update<CarBicycle>();
            Update<CarBuy>();
            Update<CarFitting>();
            Update<CarMotor>();
            Update<CarOther>();
            Update<Carpool>();
            Update<CarSecondHand>();
            Update<CarService>();


            Update<PetBird>();
            Update<PetCat>();
            Update<PetDog>();
            Update<PetFood>();
            Update<PetGive>();
            Update<PetService>();


            Update<HouseHire>();
            Update<HouseOffice>();
            Update<HouseRent>();
            Update<HouseSecond>();
            Update<HouseShop>();
            Update<HouseShort>();
            Update<HouseOther>();
            Update<HouseShare>();
            Update<HouseBed>();


            Update<FriendActivity>();
            Update<FriendHome>();
            Update<FriendInterest>();
            Update<FriendSex>();
            Update<FriendSkill>();


            Update<EduAbroad>();
            Update<EduBaby>();
            Update<EduDesign>();
            Update<EduEducation>();
            Update<EduIT>();
            Update<EduLanguage>();
            Update<EduMBA>();
            Update<EduOther>();
            Update<EduProfession>();
            Update<EduSpecial>();
            Update<EduTutor>();

            Update<TicketAirplane>();
            Update<TicketCard>();
            Update<TicketOther>();
            Update<TicketPerform>();
            Update<TicketPleasure>();
            Update<TicketTrain>();


            Update<SaleArt>();
            Update<SaleAthletics>();
            Update<SaleBaby>();
            Update<SaleBook>();
            Update<SaleClothing>();
            Update<SaleCommunication>();
            Update<SaleComputer>();
            Update<SaleDigital>();
            Update<SaleElectric>();
            Update<SaleEquipment>();
            Update<SaleFacial>();
            Update<SaleGame>();
            Update<SaleHome>();
            Update<SaleMobile>();
            Update<SaleMobileNumber>();
            Update<SaleOffice>();
            Update<SaleOther>();
            Update<SaleService>();
            //Update<SaleSex>();
            Update<SaleSwap>();


            Update<Recruit>();
            Update<JobSeek>();
            Update<YellowPage>();

            foreach (var stat in statList)
            {
                stat.Insert();
            }
        }

        private void Update<TModel>()
           where TModel : InfoBase<TModel>, new()
        {
            var _info = new TModel();
            var maxId = 0;
            var totalCount = _info.DataRecordCount();
            var pageSize = 100;
            var pageTotal = totalCount / pageSize + 1;


            for (var i = 0; i < pageTotal; i++)
            {
                var list = _info.DataSelectTop(item => item.Id > maxId, pageSize);
                if (list.Count == 0)
                {
                    break;
                }
                foreach (var info in list)
                {
                    var parentCode = info.Category.Parent.Code;
                    var keyword = keywordList.FirstOrDefault(item => item.ParentCode == parentCode);
                    if (keyword == null)
                    {
                        keyword = Keyword.Insert(new Keyword() { ParentCode = parentCode });
                    }
                    IncreaseKeywordStat(info, keyword);

                    //////////////
                    var code = info.Category.Code;
                    keyword = keywordList.FirstOrDefault(item => item.ParentCode == parentCode && item.Code == code);
                    if (keyword == null)
                    {
                        keyword = Keyword.Insert(new Keyword() { ParentCode = parentCode, Code = code });
                    }
                    IncreaseKeywordStat(info, keyword);

                    /////////////
                    var objType = info.GetValue("ObjectType");
                    if (objType != null)
                    {
                        byte typeId = Convert.ToByte(objType);
                        if (typeId > 0)
                        {
                            keyword = keywordList.FirstOrDefault(item => item.ParentCode == parentCode && item.Code == code && item.ObjType == typeId);
                            if (keyword == null)
                            {
                                keyword = Keyword.Insert(new Keyword() { ParentCode = parentCode, Code = code, ObjType = typeId });
                            }
                            IncreaseKeywordStat(info, keyword);
                        }
                    }

                    /////////////
                    IncreaseKeywordTagStat(info, info.GetValue("Tag"));
                    IncreaseKeywordTagStat(info, info.GetValue("Tag1"));
                    IncreaseKeywordTagStat(info, info.GetValue("Tag2"));
                    IncreaseKeywordTagStat(info, info.GetValue("Tag3"));
                    IncreaseKeywordTagStat(info, info.GetValue("Tag4"));
                    IncreaseKeywordTagStat(info, info.GetValue("Tag5"));
                    IncreaseKeywordTagStat(info, info.GetValue("Tag6"));
                    IncreaseKeywordTagStat(info, info.GetValue("Tag7"));
                    IncreaseKeywordTagStat(info, info.GetValue("Tag8"));
                    IncreaseKeywordTagStat(info, info.GetValue("Tag9"));
                    IncreaseKeywordTagStat(info, info.GetValue("Tag10"));
                    IncreaseKeywordTagStat(info, info.GetValue("Tag11"));
                    IncreaseKeywordTagStat(info, info.GetValue("Tag12"));
                }
                maxId = list.Select(item => item.Id).Max();
            }
        }

        private void IncreaseKeywordTagStat<TModel>(TModel info, object tagId)
            where TModel : InfoBase<TModel>, new()
        {
            var parentCode = info.Category.Parent.Code;
            var code = info.Category.Code;

            if (tagId != null)
            {
                var tagCollection = info.GetValue("TagCollection") as IEnumerable<InfoTag>;
                if (tagCollection != null)
                {
                    var tag = tagCollection.FirstOrDefault(item => item.Id == Convert.ToByte(tagId));
                    if (tag != null)
                    {
                        var keyword = keywordList.FirstOrDefault(item => item.ParentCode == parentCode && item.Code == code && item.ObjType == tag.ObjectTypeId && item.Tag == (byte?)tagId);
                        if (keyword == null)
                        {
                            keyword = Keyword.Insert(new Keyword() { ParentCode = parentCode, Code = code, ObjType = tag.ObjectTypeId, Tag = (byte?)tagId });
                        }
                        IncreaseKeywordStat(info, keyword);
                    }
                }
            }
        }

        private void IncreaseKeywordStat<TModel>(TModel info, Keyword keyword)
            where TModel : InfoBase<TModel>, new()
        {

            var keywordStat = statList.FirstOrDefault(item => item.KeywordId == keyword.Id && item.CityId == info.CityId);
            if (keywordStat == null)
            {
                keywordStat = new KeywordStat()
                {
                    KeywordId = keyword.Id,
                    CityId = info.CityId,
                    Total = 1
                };
                statList.Add(keywordStat);
            }
            else
            {
                keywordStat.Total++;
            }

        }
    }
}
