if (!$f) {
    $f = {};
}
$f.db = {
    executeNonQuery: function (commandText, success, error, complete, context) {
        this._post(commandText, success, error, complete, context, 1);
    },
    executeScalar: function (commandText, success, error, complete, context) {
        this._post(commandText, success, error, complete, context, 2);
    },
    executeDataTable: function (commandText, success, error, complete, context) {
        this._post(commandText, success, error, complete, context, 3);
    },
    executeDataSet: function (commandText, success, error, complete, context) {
        this._post(commandText, success, error, complete, context, 4);
    },
    _post: function (commandText, success, error, complete, context, option) {
        $.ajax({
            url: "/ajax/db",
            data: { cmd: commandText, option: option },
            type: 'post',
            dataType: 'json', //html
            success: success,
            error: error
        });
    }
};

$f.model = function (_type, data) {
    if (_type != null) {
        if (_type.indexOf(".") == -1) {
            this["_type"] = $f.model.namespace + "." + _type;
        }
        else {
            this["_type"] = _type;
        }
        if (_type.indexOf(",") == -1) {
            if ($f.model.assembly != null) {
                this["_type"] = this["_type"] + "," + $f.model.assembly;
            }
        }
    }
    this._ignoreP = false;

    for (var key in data) {
        //if (this[key] != data[key]) {//null==undefined
        if (data[key] != null && typeof (data[key]) == 'object') {
            this[key] = $f.clone(data[key]); // data[key].Clone();
        }
        else {
            this[key] = data[key];
        }
        //}
    }

    this.Insert = function (success, error, complete, context) {
        this._post("Insert", null, success, error, complete, context);
    };
    this.Delete = function (success, error, complete, context) {
        this._post("Delete", null, success, error, complete, context);
    };
    this.Update = function (success, error, complete, context) {
        this._post("Update", null, success, error, complete, context);
    };

    this.DeleteByPrimaryKey = function (primaryKey, success, error, complete, context) {
        this._post("DataDelete", [primaryKey], success, error, complete, context);
    };
    this.DeleteByPrimaryKeyList = function (primaryKeyList, success, error, complete, context) {
        this._post("DataDelete", [primaryKeyList], success, error, complete, context);
    };
    this.DeleteAll = function (success, error, complete, context) {
        this._post("DataDeleteAll", null, success, error, complete, context);
    };

    this.Select = function (primaryKey, success, error, complete, context) {
        this._post("DataSelect", [primaryKey], success, error, complete, context);
    };

    this.SelectBySql = function (commandText, success, error, complete, context) {
        this._post("DataSelect", [commandText], success, error, complete, context);
    };
    this.SelectAll = function (success, error, complete, context) {
        this._post("DataSelectAll", null, success, error, complete, context);
    };
    this.SelectAllBySql = function (commandText, success, error, complete, context) {
        this._post("DataSelectAll", [commandText], success, error, complete, context);
    };
    this.SelectAllBySkipTake = function (Skip, Take, success, error, complete, context) {
        this._post("DataSelectAll", [Skip, Take], success, error, complete, context);
    };
    this.SelectAllBySqlSkipTake = function (commandText, Skip, Take, success, error, complete, context) {
        this._post("DataSelectAll", [commandText, Skip, Take], success, error, complete, context);
    };

    this.SelectTop = function (itemCount, success, error, complete, context) {
        this._post("DataSelectTop", [itemCount], success, error, complete, context);
    };
    this.SelectTopBySql = function (commandText, itemCount, success, error, complete, context) {
        this._post("DataSelectTop", [commandText, itemCount], success, error, complete, context);
    };

    this.SelectPaging = function (pageSize, pageIndex, success, error, complete, context) {
        this._post("DataSelectPaging", [pageSize, pageIndex], success, error, complete, context);
    };

    this.RecordCount = function (success, error, complete, context) {
        this._post("DataRecordCount", null, success, error, complete, context);
    };
    this.RecordCountBySql = function (commandText, success, error, complete, context) {
        this._post("DataRecordCount", [commandText], success, error, complete, context);
    };
    this._post = function (method, param, success, error, complete, context) {
        var settings = {
            url: "/ajax",
            data: { json: $f.toJson(this), m: method, p: $f.toJson(param) },
            type: 'post',
            dataType: 'json', //html
            success: success,
            error: error,
            complete: complete
        };
        if (context != undefined) {
            settings.context = context;
        }
        $.ajax(settings);
    }
};
$f.model.namespace = null;
$f.model.assembly = null;