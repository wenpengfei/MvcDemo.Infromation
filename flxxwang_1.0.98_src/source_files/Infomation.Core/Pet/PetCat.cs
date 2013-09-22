using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Framework.Data;
using Infomation.Core.Data;
using System.Data.Linq.Mapping;

namespace Infomation.Core
{
    /// <summary>
    /// 猫
    /// </summary>
    [Table(Name = "Info_PetCat")]
    public class PetCat:PetBase<PetCat>
    {
        /// <summary>
        /// 1:转让,2:求购.
        /// </summary>
        public byte Type
        {
            get;
            set;
        }
        public string Title
        {
            get;
            set;
        }

        public byte ObjectType
        {
            get;
            set;
        }

        #region Tag
        //public byte? Tag1
        //{
        //    get;
        //    set;
        //}
        //public byte? Tag2
        //{
        //    get;
        //    set;
        //}
        //public byte? Tag3
        //{
        //    get;
        //    set;
        //}
        //public byte? Tag4
        //{
        //    get;
        //    set;
        //}
        //public byte? Tag5
        //{
        //    get;
        //    set;
        //}
        #endregion
        
        public int Price
        {
            get;
            set;
        }
        /// <summary>
        /// 补充说明.
        /// </summary>
        public string Content
        {
            get;
            set;
        }

        public string TypeName
        {
            get
            {
                if (this.Type == 1)
                {
                    return "转让";
                }
                else if (this.Type == 2)
                {
                    return "求购";
                }
                return null;
            }
        }

        #region InfoBase 重写成员.
        private static List<ObjectType> _objectTypeCollection;
        public override List<ObjectType> ObjectTypeCollection
        {
            get
            {
                if (_objectTypeCollection == null)
                {
                    var petCategory = InfoCategory.GetCategory<PetCategory>();
                    var category = petCategory.Children.FirstOrDefault(item => item.Singleton == PetCat.Singleton);
                    if (category != null)
                    {
                        _objectTypeCollection = category.ObjectTypeCollection;
                    }
                }
                return _objectTypeCollection;
            }
        }
        #endregion

        protected override DataAccess<PetCat, int> GetProvider()
        {
            return new PetCatDataAccess();
        }
    }
}
