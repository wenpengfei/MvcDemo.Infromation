function SelectAllCheckBox(parentItem) {
    var items = document.getElementsByTagName("input");
    for (i = 0; i < items.length; i++) {
        if (items[i].type == "checkbox") {
            items[i].checked = parentItem.checked;
        }
    }
}
//删除收藏（简历,求职）的信息
function DeleteMsg(FavID, userkey) {
    if (!confirm("您确定要删除该信息吗？"))
        return;
    $.ajax({
        type: "POST",
        dataType: "html",
        url: "http://jianli.flxxwang.com/ajax/deletefavorite/",
        data: "ids=" + FavID + "&userid=" + userkey,
        success: function(msg) {
            if (msg == "OK") {
                alert("删除成功！");
                location.href = location.href;
            } else {
                alert("删除失败！");
            }
        }
    });
}
//批量删除收藏（简历,求职）的信息
function DeleteAll(userkey) {
    var flag = 0;
    var ids = ""; ;
    $("input[type=checkbox][name=cbID]").each(function() {
        if (this.checked) {
            flag = 1;
            ids += $(this).val() + ",";
        }
    });
    if (flag == 0) {
        alert("请选择要删除的信息！");
        return false;
    } else {
        ids = ids.substring(0, ids.length - 1);
        DeleteMsg(ids, userkey);
    }
}
function DeleApply(ids) {
    if (confirm('你确认要删除吗?')) {
        $.ajax({
            url: "http://jianli.flxxwang.com/ajax/delapply/",
            data: "id=" + ids,
            type: "post",
            dataType: "html",
            success: function(data) {
                if (data == "true") {
                    alert("删除成功！");
                    location.href = location.href;
                } else {
                    alert("删除失败！");
                }
            }
        });
    }
}
//批量删除
function DeleteAllApply() {
    var flag = 0;
    var ids = ""; ;
    $("input[type=checkbox][name=cbID]").each(function() {
        if (this.checked) {
            flag = 1;
            ids += $(this).val() + ",";
        }
    });
    if (flag == 0) {
        alert("请选择要删除的信息！");
        return false;
    } else {
        ids = ids.substring(0, ids.length - 1);
        DeleApply(ids);
    }
}