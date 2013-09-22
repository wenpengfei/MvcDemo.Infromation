using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Extensions;

namespace Infomation.Core.Manage
{
    public class KeywordUpdate
    {
        public void Update()
        {
            Keyword.DeleteAll();

            var categories = InfoCategory.Categories;
            foreach (var parent in categories)
            {
                if (!(parent is JobCategory))
                {
                    //if (Keyword.SelectAll(new { ParentCode = parent.Code }).Count == 0)
                    if(Keyword.Select(item=>item.ParentCode==parent.Code)==null)
                    {
                        var keyword = new Keyword()
                        {
                            Key = parent.Name,
                            ParentCode = parent.Code
                        };
                        keyword.Insert();
                    }
                }

                if (parent.Children != null)
                {
                    foreach (var item in parent.Children)
                    {
                        if (string.IsNullOrWhiteSpace(item.Code))
                        {
                            continue;
                        }
                        //if (Keyword.SelectAll(new { ParentCode = parent.Code, Code = item.Code }).Count == 0)
                        if (Keyword.Select(key => key.ParentCode == parent.Code && key.Code == item.Code) == null)
                        {
                            var keyword = new Keyword()
                            {
                                ParentCode = parent.Code,
                                Code = item.Code,
                                Key = item.Name
                            };
                            keyword.Insert();
                        }
                        if (item.ObjectTypeCollection != null)
                        {
                            foreach(var objType in item.ObjectTypeCollection)
                            {
                                //if (Keyword.SelectAll(new { ParentCode = parent.Code, Code = item.Code, ObjType = objType.Id }).Count == 0)
                                if(Keyword.Select(key=>key.ParentCode==parent.Code&&key.Code==item.Code&&key.ObjType==objType.Id)==null)
                                {
                                    var keyword = new Keyword()
                                    {
                                        ParentCode = parent.Code,
                                        Code = item.Code,
                                        ObjType = objType.Id,
                                        Key = objType.Name
                                    };
                                    keyword.Insert();
                                }
                            }
                        }
                        if (item.TagCollection != null)
                        {
                            foreach (var tag in item.TagCollection)
                            {
                                //if (Keyword.SelectAll(new { ParentCode = parent.Code, Code = item.Code, ObjType = tag.ObjectTypeId,Tag=tag.Id }).Count == 0)
                                if (tag.ObjectTypeId == null)
                                {
                                    //continue;
                                }
                                if (Keyword.Select(key => key.ParentCode == parent.Code&&key.Code==item.Code&&key.ObjType==tag.ObjectTypeId&&key.Tag==tag.Id) == null)
                                {
                                    var keyword = new Keyword()
                                    {
                                        ParentCode = parent.Code,
                                        Code = item.Code,
                                        ObjType = tag.ObjectTypeId,
                                        Tag=tag.Id,
                                        Key = tag.Name
                                    };
                                    keyword.Insert();
                                }
                            }
                        }
                    }
                }
            }

            //if (Keyword.SelectAll(new { ParentCode = "ZhaoPin" }).Count == 0)
            if (Keyword.Select(item => item.ParentCode == "ZhaoPin") == null)
            {
                var keyword = new Keyword()
                {
                    Key = "招聘",
                    ParentCode = "ZhaoPin"
                };
                keyword.Insert();
            }
            //if (Keyword.SelectAll(new { ParentCode = "QiuZhi" }).Count == 0)
            if (Keyword.Select(item => item.ParentCode == "QiuZhi") == null)
            {
                var keyword = new Keyword()
                {
                    Key = "求职",
                    ParentCode = "QiuZhi"
                };
                keyword.Insert();
            }

            KeywordStat.DeleteAll();
            //KeywordStatUpdate update = new KeywordStatUpdate();
            //update.Update();//待改进，目前速度特慢，不可行
        }
    }
}
