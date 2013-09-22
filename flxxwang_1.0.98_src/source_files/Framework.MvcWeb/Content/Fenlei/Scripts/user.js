if (!$f) {
    $f = {};
}
$info.users = {
    user: function User() {
        $f.users.user.apply(this, ["Infomation.Core.User"]);
    },
    profile: function ProfileCommon() {
        $f.model.apply(this, ["Infomation.Core.Profile"]);
    }
};
$info.logout = function logout() {
    $f.cookie.del("userId");
    $f.cookie.del("userName");
    window.location.reload();
};
$info.isLogin = function () {
    var _userid = $f.cookie.get("userId");
    return _userid != null;
};


