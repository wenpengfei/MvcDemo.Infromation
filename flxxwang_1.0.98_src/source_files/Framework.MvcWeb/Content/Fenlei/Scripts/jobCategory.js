//by lls
if (!$info) {
    $info = {}
}
$info.jobCategory = {
    __type: "Infomation.Core.InfoCategory",
    getParents: function (success, error, complete, context) {
        var __jobCategory = new $f.model(this.__type);
        __jobCategory._post("GetParentJobCategories", null, success, error, complete, context);
    },
    getChild: function (parentId, success, error, complete, context) {
        var __jobCategory = new $f.model(this.__type);
        __jobCategory._post("GetChildCategory", [parentId], success, error, complete, context);
            
    }
};