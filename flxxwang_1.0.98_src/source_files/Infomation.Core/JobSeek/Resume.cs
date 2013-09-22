using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework;
using Framework.Common;
using Framework.Web.Script.Serialization;
using Infomation.Core.Data;
using System.Runtime.Serialization;
using Infomation.Core.Extensions;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    [Table(Name = "Info_Resume")]
    [DataContract]
    public class Resume:ModelBase<Resume,int>
    {
        [Column(IsPrimaryKey = true)]
        [DataMember]
        public int Id
        {
            get;
            set;
        }
        [DataMember]
        public int? UserId
        {
            get;
            set;
        }
        /// <summary>
        /// 简历类型：全职或兼职
        /// </summary>
        [DataMember]
        public WorkType ResumeType
        {
            get;
            set;
        }
        /// <summary>
        /// 简历名称
        /// </summary>
        [DataMember]
        public string Name
        {
            get;
            set;
        }
        [DataMember]
        public JobType JobType
        {
            get;
            set;
        }
        /// <summary>
        /// 小职位
        /// </summary>
        [DataMember]
        public byte? ObjectType
        {
            get;
            set;
        }
        /// <summary>
        /// 职位名称
        /// </summary>
        [DataMember]
        public string JobName
        {
            get;
            set;
        }
        /// <summary>
        /// 薪资.
        /// </summary>
        [DataMember]
        public int WageMin
        {
            get;
            set;
        }
        /// <summary>
        /// 薪资.
        /// </summary>
        [DataMember]
        public int WageMax
        {
            get;
            set;
        }
        /// <summary>
        /// 根括自己.
        /// </summary>
        [DataMember]
        public string AboutMe
        {
            get;
            set;
        }
        /// <summary>
        /// 姓名.
        /// </summary>
        [DataMember]
        public string RealName
        {
            get;
            set;
        }
        [DataMember]
        public bool? Sex
        {
            get;
            set;
        }
        public string Pictures
        {
            get;
            set;
        }
        public List<string> PictureList
        {
            get
            {
                if (!string.IsNullOrEmpty(Pictures))
                {
                    return Pictures.Split(new char[] { '|' }).ToList();
                }
                return new List<string>();
            }
        }
        private string _sexName;
        [DataMember]
        public string SexName
        {
            get
            {
                if (_sexName == null)
                {
                    if (this.Sex != null)
                    {
                        _sexName = this.Sex==true ? "男" : "女";
                    }
                }
                return _sexName;
            }
            private set//使能被系列化
            {
                _sexName = value;
            }
        }
        /// <summary>
        /// 出生年月.
        /// </summary>
        [DataMember]
        public DateTime? BirthDay
        {
            get;
            set;
        }
        private byte? _age;
        [DataMember]
        public byte? Age
        {
            get
            {
                if (_age == null)
                {
                    if (this.BirthDay != null)
                    {
                        _age =Convert.ToByte(DateTime.Now.Year - this.BirthDay.Value.Year);
                    }
                }
                return _age;
            }
            private set////使能被系列化
            {
                _age = value;
            }
        }
        /// <summary>
        /// 学历.
        /// </summary>
        [DataMember]
        public Education Education
        {
            get;
            set;
        }

        private string _educationName;
        [DataMember]
        public string EducationName
        {
            get
            {
                if (_educationName == null)
                {
                    _educationName = this.Education.DisplayName();
                }
                return _educationName;
            }
            private set
            {
                _educationName = value;
            }
        }
        /// <summary>
        /// 工作年限.
        /// </summary>
        [DataMember]
        public byte WorkYearStart
        {
            get;
            set;
        }
        /// <summary>
        /// 工作年限.
        /// </summary>
        [DataMember]
        public byte WorkYearEnd
        {
            get;
            set;
        }
        [DataMember]
        public string Phone
        {
            get;
            set;
        }
        [DataMember]
        public string Email
        {
            get;
            set;
        }
        /// <summary>
        /// 现居住地(城市).
        /// </summary>
        [DataMember]
        public short NowCityId
        {
            get;
            set;
        }
        /// <summary>
        /// 现居住地(区域).
        /// </summary>
        [DataMember]
        public short? NowRegionId
        {
            get;
            set;
        }
        /// <summary>
        /// 现居住地(商圈).
        /// </summary>
        [DataMember]
        public short? NowCircleId
        {
            get;
            set;
        }
        [DataMember]
        public PublicState PublicState
        {
            get;
            set;
        }
        /// <summary>
        /// 教育背景
        /// </summary>
        [DataMember]
        public string EduBackgrounds
        {
            get;
            set;
        }

        private List<EduBackground> _eduBackgroundList;
        /// <summary>
        /// 获取教育背景列表
        /// </summary>
        [DataMember]
        public List<EduBackground> EduBackgroundList
        {
            get
            {
                if (_eduBackgroundList == null)
                {
                    _eduBackgroundList=JsonHelper.Deserialize<List<EduBackground>>(EduBackgrounds);
                    if (_eduBackgroundList == null)
                    {
                        _eduBackgroundList = new List<EduBackground>();
                    }
                }
                return _eduBackgroundList;
            }
        }
        /// <summary>
        /// 工作经验
        /// </summary>
        [DataMember]
        public string WorkExperiences
        {
            get;
            set;
        }

        private List<WorkExperience> _workExperienceList;
        /// <summary>
        /// 获取工作经验列表
        /// </summary>
        [DataMember]
        public List<WorkExperience> WorkExperienceList
        {
            get
            {
                if (_workExperienceList == null)
                {
                    _workExperienceList=JsonHelper.Deserialize<List<WorkExperience>>(WorkExperiences);
                    if (_workExperienceList == null)
                    {
                        _workExperienceList = new List<WorkExperience>();
                    }
                }
                return _workExperienceList;
            }
        }

        private WorkExperience _currentJob;
        [DataMember]
        public WorkExperience CurrentJob
        {
            get
            {
                if (_currentJob == null)
                {
                    _currentJob = this.WorkExperienceList.OrderByDescending(item => item.EndYear).OrderByDescending(item => item.EndMonth).FirstOrDefault();
                }
                return _currentJob;
            }
            private set
            {
                _currentJob = value;
            }
        }
        /// <summary>
        /// 证书
        /// </summary>
        [DataMember]
        public string Certificates
        {
            get;
            set;
        }

        private List<Certificate> _certificateList;
        /// <summary>
        /// 获取证书列表
        /// </summary>
        [DataMember]
        public List<Certificate> CertificateList
        {
            get
            {
                if (_certificateList == null)
                {
                    _certificateList=JsonHelper.Deserialize<List<Certificate>>(Certificates);
                    if (_certificateList == null)
                    {
                        _certificateList = new List<Certificate>();
                    }
                }
                return _certificateList;
            }
        }
        /// <summary>
        /// 语言能力
        /// </summary>
        [DataMember]
        public string LanguageSkills
        {
            get;
            set;
        }

        private List<LanguageSkill> _languageSkillList;
        /// <summary>
        /// 获取语言能力列表
        /// </summary>
        [DataMember]
        public List<LanguageSkill> LanguageSkillList
        {
            get
            {
                if (_languageSkillList == null)
                {
                    _languageSkillList=JsonHelper.Deserialize<List<LanguageSkill>>(LanguageSkills);
                    if (_languageSkillList == null)
                    {
                        _languageSkillList = new List<LanguageSkill>();
                    }
                }
                return _languageSkillList;
            }
        }
        [DataMember]
        public DateTime DateCreated
        {
            get;
            set;
        }
        [DataMember]
        public DateTime DateModified
        {
            get;
            set;
        }
        private City _nowCity;
        [DataMember]
        public City NowCity
        {
            get
            {
                if (_nowCity == null)
                {
                    _nowCity = City.GetCity(NowCityId);
                }
                return _nowCity;
            }
            private set//使能被系列化
            {
                _nowCity = value;
            }
        }

        private Circle _nowCircle;
        [DataMember]
        public Circle NowCircle
        {
            get
            {
                if (_nowCircle == null)
                {
                    if (this.NowCircleId != null)
                    {
                        _nowCircle=Circle.GetCircle(this.NowCircleId.Value);
                    }
                }
                if (_nowCircle == null)
                {
                    _nowCircle = Circle.Singleton;
                }
                return _nowCircle;
            }
            private set//使能被系列化
            {
                _nowCircle = value;
            }
        }

        private Region _nowRegion;
        [DataMember]
        public Region NowRegion
        {
            get
            {
                if (_nowRegion == null)
                {
                    if (this.NowRegionId != null)
                    {
                        _nowRegion=Region.GetRegion(this.NowRegionId.Value);
                    }
                    return Region.Singleton;
                }
                if (_nowRegion == null)
                {
                    _nowRegion = Region.Singleton;
                }
                return _nowRegion;
            }
            private set//使能被系列化
            {
                _nowRegion = value;
            }
        }

        private string _wage;
        public string Wage
        {
            get
            {
                if (this.WageMax == 0 && this.WageMin == 0)
                {
                    return "面议";
                }
                if (this.WageMax < this.WageMin)
                {
                    return this.WageMin + "元以上/月";
                }
                return this.WageMin + "-" + this.WageMax + "元/月";
            }
            private set//使能被系列化
            {
                _wage=value;
            }
        }
        private string _jobTypeName;
        [DataMember]
        public string JobTypeName
        {
            get
            {
                if (_jobTypeName == null)
                {
                    var category = InfoCategory.GetCategory(this.JobType);
                    if (category != null)
                    {
                        _jobTypeName = category.Name;
                    }
                }
                return _jobTypeName;
            }
            private set
            {
                _jobTypeName = value;
            }
        }
        /// <summary>
        /// 空余时间，对兼职有效.
        /// </summary>
        [DataMember]
        public string FreeTimes
        {
            get;
            set;
        }

        private List<FreeTime> _freeTimeList;
        /// <summary>
        /// 空余时间，对兼职有效.
        /// </summary>
        [DataMember]
        public List<FreeTime> FreeTimeList
        {
            get
            {
                if (_freeTimeList == null)
                {
                    _freeTimeList=JsonHelper.Deserialize<List<FreeTime>>(this.FreeTimes);
                    if (_freeTimeList == null)
                    {
                        _freeTimeList = new List<FreeTime>();
                    }
                }
                return _freeTimeList.OrderBy(item=>item.Day).ToList();
            }
        }

        /// <summary>
        /// 对兼职有效,true:学生,false:社会人才
        /// </summary>
        [DataMember]
        public bool? IsStudent
        {
            get;
            set;
        }

        private string _workYears;
        public string WorkYears
        {
            get
            {
                if (_workYears == null)
                {
                    if (this.WorkYearStart == 0 && this.WorkYearEnd == 0)
                    {
                        _workYears = "无工作经验";
                    }
                    else if (this.WorkYearStart > this.WorkYearEnd)
                    {
                        _workYears = this.WorkYearStart + "年以上";
                    }
                    else
                    {
                        _workYears = this.WorkYearStart + "-" + this.WorkYearEnd + "年";
                    }
                }
                return _workYears;
            }
        }
        /// <summary>
        /// 信息来源
        /// </summary>
        public long? Source
        {
            get;
            set;
        }

        public List<Resume> DataSelectAllByUserId(int UserId)
        {
            string sqlQuery = "select * from " + DataAccess.TableName + " where UserId=" + UserId + "";
            return DataSelectAll(sqlQuery);
        }
        public Resume DataSelect(int UserId, WorkType ResumeType)
        {
            var list=DataSelectAllByUserId(UserId);
            return list.FirstOrDefault(item => item.ResumeType == ResumeType);
        }
        public Resume DataSelect(int UserId, int ResumeType)//为ajax服务,json不识别枚举类型.
        {
            var list = DataSelectAllByUserId(UserId);
            return list.FirstOrDefault(item =>Convert.ToInt32(item.ResumeType) == ResumeType);
        }
        public static List<Resume> SelectAllByUserId(int UserId)
        {
            Resume resume = new Resume();
            return resume.DataSelectAllByUserId(UserId);
        }
        public static Resume Select(int UserId, WorkType ResumeType)
        {
            Resume resume = new Resume();
            return resume.DataSelect(UserId, ResumeType);
        }

        protected override Framework.Data.DataAccess<Resume, int> GetProvider()
        {
           return new ResumeDataAccess();
        }
    }
}
