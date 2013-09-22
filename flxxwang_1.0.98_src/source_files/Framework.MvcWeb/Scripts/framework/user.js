if (!$f) {
    $f = {};
}
$f.users = {
    user: function User(_type) {
        $f.model.apply(this, [_type]);
        this.UserId = null;
        this.UserName = null;

        this.Comment = null;
        this.CreationDate = null;

        this.Email = null;
        this.IsApproved = null;
        this.IsLockedOut = null;
        this.IsOnline = null;
        this.LastActivityDate = null;
        this.LastLockoutDate = null;
        this.LastLoginDate = null;

        this.LastPasswordChangedDate = null;
        this.PasswordQuestion = null;
        this.ProviderName = null;

        this.Profile = null;
        this.InputNewPassword = null;
        this.InputOldPassword = null;
        this.InputNewPasswordAnswer = null;
        this.InputNewPasswordQuestion = null;

        this.login = function (success, error, complete, context) {
            this._post("Login", null, success, error, complete, context);
        };
        this.changePassword = function (success, error, complete, context) {
            this._post("ChangePassword", null, success, error, complete, context);
        };
    },
    profileCommon: function ProfileCommon() {
        $f.model.apply(this, ["Framework.Users.ProfileCommon"]);
        this.RealName = null;
        this.Sex = null;
        this.Nickname = null;
        this.Birthday = null;
        this.PhotoURL = null;
        this.Address = null;
        this.CountryId = null;
        this.ProvinceId = null;
        this.CityId = null;
        this.PhoneMain = null;
        this.PhoneFax = null;
        this.PhoneMobile = null;
        this.AboutMe = null;
        this.PostCode = null;
        this.WebSite = null;
        this.QQ = null;
        this.IP = null;
        this.DateCreated = null;
        this.DateModified = null;

        this.Common = null;
    }
}
