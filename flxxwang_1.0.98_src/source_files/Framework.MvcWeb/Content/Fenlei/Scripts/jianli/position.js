//document.domain = "58.com";
function PosCateIndexInit() {
    if ($("#hidSPCN").val() != "") { $("#selPosCate").find("span").text($("#hidSPCN").val()); }
    $("#selPosCate").click(function() {
        if ($("#divPosCate").css("display") == "none") {
            var h = $("#hidPC").val();
            if (h == 0) {
                pushDPList(0, 1);
            } else {
                pushDPList(h, 2, $("#hidPCN").val());
            }
            $("#divPosCate").show();
            $("#divPosCateU").show();
        }
    });
}
function fillDPList(cataData, id, dp, name) {
    var str = "<table cellpadding='0' cellspacing='0' width='100%'>";
    if (dp == 2) {
        str += "<tr><td colspan='3' class='linetwo'><a href='javascript:setPosCateValue(" + id + ",\"" + name + "\", 2);'>" + name + "</a> &nbsp; &nbsp; <a href='javascript:pushDPList(0, 1);' class='blacklink'>[返回选择其他类别]</a></td></tr>";
    }
    for (var i = 0; i < cataData.length; i++) {
        if (i % 3 == 0) {
            str += "<tr><td><a href='javascript:setPosCateValue(" + cataData[i].id + ",\"" + cataData[i].name + "\"," + cataData[i].dp + ");'>" + cataData[i].name + "</a></td>";
        } else if (i % 3 == 2) {
            str += "<td><a href='javascript:setPosCateValue(" + cataData[i].id + ",\"" + cataData[i].name + "\"," + cataData[i].dp + ");'>" + cataData[i].name + "</a></td></tr>";
        } else {
            str += "<td><a href='javascript:setPosCateValue(" + cataData[i].id + ",\"" + cataData[i].name + "\"," + cataData[i].dp + ");'>" + cataData[i].name + "</a></td>";
        }
    }
    if (dp == 2) {
        if (str.lastIndexOf("</tr>") != (str.length - 5)) {
            str += "</tr>";
        }
    } else {
        if (str.lastIndexOf("</tr>") != (str.length - 5)) {
            str += "<td><a class='blacklink' href='javascript:clearPosCateValue();'>[不限]</a></td></tr>";
        } else {
            str += "<tr><td><a class='blacklink' href='javascript:clearPosCateValue();'>[不限]</a></td></tr>";
        }
    }
    str += "</table>";
    $("#divPosCate").html(str); 
    DivSetVisible(true);
}
function pushDPList(id, dp, name) {
    var src = document.createElement("script");
    src.type = "text/javascript";
    src.src = "http://010.zp.com/ajax/getdispposcatelist/?pcid=" + id + "&dp=" + dp + "&name=" + encodeURIComponent(name);
    document.body.appendChild(src);
}
function setPosCateValue(id, name, dp) {
    if (dp == 2) {
        $("#selPosCate").find("span").text(name);
        $("#hidSPC").val(id);
        $("#hidSPCN").val(name);
        $("#divPosCate").hide();
        $("#divPosCateU").hide();
        DivSetVisible(false);
        $("#Title2").val(name);
    } else {
        $("#hidPC").val(id);
        $("#hidPCN").val(name);
        pushDPList(id, 2, name);
    }
}
function clearPosCateValue(n) {
    $("#selPosCate").find("span").text('请选择职位类别');
    $("#hidSPC").val(0);
    $("#hidPC").val(0);
    $("#hidPCN").val('');
    $("#divPosCate").hide();
    $("#divPosCateU").hide();
    DivSetVisible(false);
}
function DivSetVisible(state) {
    var DivRef = document.getElementById("divPosCate");
    var IfrRef = document.getElementById("DivShim");
    if (state) {
        DivRef.style.display = "block";
        IfrRef.style.width = DivRef.offsetWidth;
        IfrRef.style.height = DivRef.offsetHeight;
        IfrRef.style.top = DivRef.style.top;
        IfrRef.style.left = DivRef.style.left;
        IfrRef.style.zIndex = DivRef.style.zIndex - 1;
        IfrRef.style.display = "block";
    } else {
        DivRef.style.display = "none";
        IfrRef.style.display = "none";
    }
}