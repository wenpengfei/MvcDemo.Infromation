
/*
* GetToolTips JavaScript Library v1.0.0
* By:bruttle
* email:hangfei1234@163.com
* Date: 2009-08-20
*/

var isFrameComplete = false;

var is_cur_window_load_complete = false;

if (document.all) {
    window.attachEvent('onload', SetCurWindowLoadComplete);   //IE中
}
else {
    window.addEventListener('load', SetCurWindowLoadComplete, false);    //firefox
}

function SetCurWindowLoadComplete() {
    is_cur_window_load_complete = true;
}

function GetCookieValue() {
    var arr = document.cookie.match(new RegExp("closetooltip=([^&;]+)"));
    if (arr != null) { return decodeURI(arr[1]); }
    return "";
}

function SetTipsCookie() {
    document.cookie = "closetooltip=1;domain=.58.com;";
}

function QuanToBan(val) {
    if (!val || val == '') {
        return;
    }
    var result = "";
    for (var i = 0; i < val.length; i++) {
        if (val.charCodeAt(i) == 12288) {
            result += String.fromCharCode(val.charCodeAt(i) - 12256);
            continue;
        }
        if (val.charCodeAt(i) > 65280 && val.charCodeAt(i) < 65375)
        { result += String.fromCharCode(val.charCodeAt(i) - 65248); }
        else { result += String.fromCharCode(val.charCodeAt(i)); }
    }
    return result;
}

function getElementPositionX(elemID) {
    var offsetTrail = elemID;
    var offsetLeft = 0;
    while (offsetTrail) {
        offsetLeft += offsetTrail.offsetLeft;
        offsetTrail = offsetTrail.offsetParent;
    }
    if (navigator.userAgent.indexOf("Mac") != -1 &&
        typeof (document.body.leftMargin) != "undefined") {
        offsetLeft += document.body.leftMargin;
    }
    return offsetLeft;
}

function getElementPositionY(elemID) {
    var offsetTrail = elemID;
    var offsetTop = 0;
    while (offsetTrail) {
        offsetTop += offsetTrail.offsetTop;
        offsetTrail = offsetTrail.offsetParent;
    }
    if (navigator.userAgent.indexOf("Mac") != -1 &&
        typeof (document.body.leftMargin) != "undefined") {
        offsetTop += document.body.topMargin;
    }
    return offsetTop + elemID.clientHeight + 4;
}

var docEle = function() {
    return document.getElementById(arguments[0]) || false;
}

function HideSelectedItem(itemID) {
    if (itemID != null && itemID != '') {
        var arr = itemID.split('|');
        var i = 0;
        if (arr.length > 0 && arr[0] == '0') {
            i = 2;
        }
        for (; i < arr.length; i++) {
            if (docEle(arr[i])) docEle(arr[i]).style.display = 'none';
        }
    }
}

function ShowSelectedItem(itemID) {
    if (itemID != null && itemID != '') {
        var arr = itemID.split('|');
        var i = 0;
        if (arr.length > 0 && arr[0] == '0') {
            i = 2;
        }
        for (; i < arr.length; i++) {
            if (docEle(arr[i])) docEle(arr[i]).style.display = 'inline';
        }
    }
}

function GetToolTipWindow(tooltipWindowID, inputbox, tooptipType, cityid, selid, showhot) {
    var arr = tooltipWindowID.split('|');
    if (arr.length > 1 && arr[1] == '1') {
        this.tooltipWindowID = arr[0];
        this.showInstruction = true;
    } else {
        this.tooltipWindowID = tooltipWindowID;
        this.showInstruction = false;
    }
    this.inputbox = inputbox;
    this.tooptipType = tooptipType;
    this.cityid = cityid;
    if (selid) {
        this.selid = selid;
    }
    else {
        this.selid = '';
    }
    this.notHideTips = false;
    this.buttonID = '';
    if (showhot) {
        this.showhot = true;
    }
    else {
        this.showhot = false;
    }
}

function GetToolTipInfoData(tooltipWindowID, inputbox, tooltipType, cityid, selid, showInstruction, buttonID, showhot) {
    if (document.frames) {
        document.frames['tooltipcontentframe'].GetToolTipInfoData(tooltipWindowID, inputbox, tooltipType, cityid, QuanToBan(document.getElementById(inputbox.split('|')[0]).value), selid, showInstruction, buttonID, showhot);
    }
    else {
        document.getElementById('tooltipcontentframe').contentWindow.GetToolTipInfoData(tooltipWindowID, inputbox, tooltipType, cityid, QuanToBan(document.getElementById(inputbox.split('|')[0]).value), selid, showInstruction, buttonID, showhot);
    }
}

function FilterHtml(val) {
    if (val && val != '') {
        return val.replace(/(<cite.*?>.*?<.cite>)/ig, '').replace(/(<.*?>)/ig, '');
    }
    return '';
}

function SetMouseOver(obj, toolWindowID) {
    var wins = docEle(toolWindowID);
    if (!wins) { return; }
    var lis = wins.getElementsByTagName('li');
    var i = 0;
    if (lis && lis.length > 0) {
        for (; i < lis.length; i++) {
            lis[i].className = 'unselected';
        }
    }
    obj.className = 'selected';
}

function SetToolTipData(contentData, tooltipWindowID, inputbox, tooltipType, selid, showInstruction, buttonID, showhot) {
    var arr1 = selid.split('|');
    if (arr1.length > 1 && arr1[0] == '0') {
        if (docEle(arr1[1])) {
            docEle(arr1[1]).value = FilterHtml(contentData);
        }
    }
    var iframe = document.getElementById("frm" + tooltipWindowID);
    if (contentData != '') {
        var arr = contentData.split('|');
        var i = 0;
        if (docEle(tooltipWindowID)) { docEle(tooltipWindowID).style.display = 'block'; } else { return; }
        var obj = document.getElementById(tooltipWindowID).getElementsByTagName('ul');
        var result = "";
        var clsName = '';
        var re;
        var hot = '';
        for (i = 0; i < arr.length; i++) {
            re = new RegExp("^(.+?)##", "ig");
            clsName = 'unselected';
            hot = '';
            if (re.test(arr[i])) {
                hot = RegExp.$1;
            }
            arr[i] = arr[i].replace(re, '');
            if (showhot && hot != '') {
                result += "<li class='" + clsName + "' onmouseover=\"SetMouseOver(this,'" + tooltipWindowID + "')\" onmouseout=\"this.className='unselected'\" onmousedown=\"SetInputValue(this,'" + inputbox + "','" + tooltipWindowID + "','" + selid + "','" + buttonID + "');return false\"><span class='tool_r'>约&nbsp;" + hot + "&nbsp;条</span>";
            }
            else {
                result += "<li class='" + clsName + "' onmouseover=\"SetMouseOver(this,'" + tooltipWindowID + "')\" onmouseout=\"this.className='unselected'\" onmousedown=\"SetInputValue(this,'" + inputbox + "','" + tooltipWindowID + "','" + selid + "','" + buttonID + "');return false\">";
            }
            if (showInstruction) {
                var tempArr = arr[i].split('@@');
                if (tempArr.length > 1) {
                    result = result + "<a href='javascript:void(0)'>" + tempArr[0] + "<cite>" + tempArr[1] + "</cite></a>";
                }
                else {
                    result = result + "<a href='javascript:void(0)'>" + arr[i] + "</a>";
                }
            }
            else {
                result = result + "<a href='javascript:void(0)'>" + arr[i] + "</a>";
            }
            result += "</li>";
        }
        obj[0].innerHTML = result;
        if (selid && selid != '') {
            HideSelectedItem(selid);
        }
        iframe.style.width = document.getElementById(tooltipWindowID).clientWidth + "px";
        iframe.style.height = document.getElementById(tooltipWindowID).clientHeight + "px";
    }
    else {
        if (docEle(tooltipWindowID)) {
            docEle(tooltipWindowID).style.display = 'none'; var obj = document.getElementById(tooltipWindowID).getElementsByTagName('ul');
            obj[0].innerHTML = "";
            if (selid && selid != '') {
                ShowSelectedItem(selid);
            }
        } else {
            if (selid && selid != '') {
                ShowSelectedItem(selid);
            } return;
        }
    }
}

function SetInputValue1(obj, inputbox, tooltipWindowID, selid, buttonID) {
    var val = '';
    if (obj) {
        obj = obj.getElementsByTagName('a');
        if (obj.length > 0) {
            obj = obj[0];
        }
    }
    val = obj.innerHTML;
    if (val && val != '') {
        val = FilterHtml(val);
    }
    var arr = inputbox.split('|');
    if (arr.length > 1) {
        if (docEle(arr[0])) docEle(arr[0]).value = val;
        if (docEle(arr[1])) {
            if (obj.innerHTML.match(/<cite.*?>(.*?)<.cite>/ig) && obj.innerHTML.match(/<cite.*?>(.*?)<.cite>/ig).length > 0) {
                docEle(arr[1]).value = obj.innerHTML.match(/<cite.*?>(.*?)<.cite>/ig)[0].replace(/(<.*?>)/ig, '');
            }
            else {
                docEle(arr[1]).value = '';
            }
        }
    }
    else {
        if (docEle(inputbox)) {
            if (docEle(inputbox)) docEle(inputbox).value = val;
        }
    }
}

function SetInputValue(obj, inputbox, tooltipWindowID, selid, buttonID) {
    SetInputValue1(obj, inputbox, tooltipWindowID, selid, buttonID);
    if (docEle(tooltipWindowID)) docEle(tooltipWindowID).style.display = 'none';
    if (buttonID != '' && docEle(buttonID)) docEle(buttonID).click();
    if (selid && selid != '') {
        ShowSelectedItem(selid);
    }
}

GetToolTipWindow.prototype = {
    openToolTipWindow: function() {
        var input = document.getElementById(this.inputbox.split('|')[0]);
        var m = this.tooltipWindowID + "mask";
        var tooltipid = this.tooltipWindowID;
        var selid = this.selid;
        this.closeToolTipWindow();
        var newDiv = document.createElement("div");
        newDiv.id = this.tooltipWindowID;
        newDiv.style.position = "absolute";
        newDiv.style.zIndex = "9999";
        newDiv.style.display = 'none';
        newDiv.style.top = getElementPositionY(input) + "px";
        newDiv.style.left = getElementPositionX(input) + "px";
        newDiv.innerHTML = "<ul></ul>";
        document.body.appendChild(newDiv);

        var iframe = document.createElement("iframe");
        iframe.id = "frm" + tooltipid;
        iframe.style.position = "absolute";
        iframe.style.top = 0;
        iframe.style.left = 0;
        iframe.style.zIndex = -1;
        iframe.style.width = newDiv.clientWidth + "px";
        iframe.style.height = newDiv.clientHeight + "px";
		iframe.setAttribute("border",0);
		iframe.setAttribute("frameborder",0,0);
		iframe.setAttribute("scrolling","no",0);
        iframe.src = "";
        newDiv.appendChild(iframe);

//        var newA = document.createElement("a");
//        newA.href = "#";
//        newA.innerHTML = "关闭";
//        newA.className = "closewindow";
//        newA.onclick = function() {
//            SetTipsCookie()
//            if (selid && selid != '') {
//                ShowSelectedItem(selid);
//            }
//            if (docEle(tooltipid)) document.body.removeChild(docEle(tooltipid));
//            if (docEle(m)) document.body.removeChild(docEle(m));
//            return false;
//        }
//        newDiv.appendChild(newA);
    },
    GetContentData: function() {
        if (!isFrameComplete || !is_cur_window_load_complete) {
            return;
        }
        if (GetCookieValue('closetooltip') == '1' && !this.notHideTips) {
            return;
        }
        var evt = null;
        if (document.all)
            evt = window.event;
        else
            evt = arguments.callee.caller.arguments[0];
        if (evt != null) {
            switch (evt.keyCode) {
                case 13:
                    var temp = docEle(this.tooltipWindowID);
                    if (temp && temp.style.display != 'none') {
                        var list = temp.getElementsByTagName('li');
                        var i = 0;
                        if (list.length > 0) {
                            for (i = 0; i < list.length; i++) {
                                if (list[i].className && list[i].className == 'selected') {
                                    SetInputValue1(list[i], this.inputbox, '', '', '');
                                }
                            }
                        }
                    }
                    if (this.selid && this.selid != '') {
                        ShowSelectedItem(this.selid);
                    }
                    this.closeToolTipWindow();
                    if (this.buttonID != '' && docEle(this.buttonID)) docEle(this.buttonID).click();
                    return;
                case 38:
                    var temp = docEle(this.tooltipWindowID);
                    if (temp && temp.style.display != 'none') {
                        var list = temp.getElementsByTagName('li');
                        var i = 0;
                        var hasselected = false;
                        if (list.length > 0) {
                            for (i = 0; i < list.length; i++) {
                                if (list[i].className && list[i].className == 'selected') {
                                    hasselected = true;
                                    list[i].className = 'unselected';
                                    if (i > 0) {
                                        list[i - 1].className = 'selected';
                                        if (docEle(this.inputbox.split('|')[0])) {
                                            if (list[i - 1]) {
                                                SetInputValue1(list[i - 1], this.inputbox, '', '', '');
                                            }
                                            docEle(this.inputbox.split('|')[0]).focus();
                                        }
                                        return;
                                    }
                                    else {
                                        list[list.length - 1].className = 'selected';
                                        if (docEle(this.inputbox.split('|')[0])) {
                                            if (list[list.length - 1]) {
                                                SetInputValue1(list[list.length - 1], this.inputbox, '', '', '');
                                            }
                                            docEle(this.inputbox.split('|')[0]).focus();
                                        }
                                        return;
                                    }
                                }
                            }
                            if (!hasselected) {
                                list[list.length - 1].className = 'selected';
                                if (docEle(this.inputbox.split('|')[0])) {
                                    if (docEle(this.inputbox.split('|')[0])) {
                                        if (list[list.length - 1]) {
                                            SetInputValue1(list[list.length - 1], this.inputbox, '', '', '');
                                        }
                                        docEle(this.inputbox.split('|')[0]).focus();
                                    }
                                    docEle(this.inputbox.split('|')[0]).focus();
                                }
                                return;
                            }
                        }
                    }
                    return;
                case 40:
                    var temp = docEle(this.tooltipWindowID);
                    if (temp && temp.style.display != 'none') {
                        var list = temp.getElementsByTagName('li');
                        var i = 0;
                        var hasselected = false;
                        if (list.length > 0) {
                            for (i = 0; i < list.length; i++) {
                                if (list[i].className && list[i].className == 'selected') {
                                    hasselected = true;
                                    list[i].className = 'unselected';
                                    if (i < list.length - 1) {
                                        list[i + 1].className = 'selected';
                                        if (docEle(this.inputbox.split('|')[0])) {
                                            if (list[i + 1]) {
                                                SetInputValue1(list[i + 1], this.inputbox, '', '', '');
                                            }
                                            docEle(this.inputbox.split('|')[0]).focus();
                                        }
                                        return;
                                    }
                                    else {
                                        list[0].className = 'selected';
                                        if (docEle(this.inputbox.split('|')[0])) {
                                            if (list[0]) {
                                                SetInputValue1(list[0], this.inputbox, '', '', '');
                                            }
                                            docEle(this.inputbox.split('|')[0]).focus();
                                        }
                                        return;
                                    }
                                }
                            }
                            if (!hasselected) {
                                list[0].className = 'selected';
                                if (docEle(this.inputbox.split('|')[0])) {
                                    if (list[0]) {
                                        SetInputValue1(list[0], this.inputbox, '', '', '');
                                    }
                                    docEle(this.inputbox.split('|')[0]).focus();
                                }
                                return;
                            }
                        }
                    }
                    return;
            }
        }
        if (document.getElementById(this.inputbox.split('|')[0]).value == '') {
            if (this.selid && this.selid != '') {
                ShowSelectedItem(this.selid);
            }
            this.closeToolTipWindow();
            return;
        }
        if (!docEle(this.tooltipWindowID))
            this.openToolTipWindow();
        GetToolTipInfoData(this.tooltipWindowID, this.inputbox, this.tooptipType, this.cityid, this.selid, this.showInstruction, this.buttonID, this.showhot);
    },
    closeToolTipWindow: function() {
        if (this.selid && this.selid != '') {
            ShowSelectedItem(this.selid);
        }
        var m = this.tooltipWindowID + "mask";
        if (docEle(this.tooltipWindowID)) document.body.removeChild(docEle(this.tooltipWindowID));
        if (docEle(m)) document.body.removeChild(docEle(m));
    },
    setNothideTips: function() {
        this.notHideTips = true;
    },
    setSearchButton: function(buttonID) {
        this.buttonID = buttonID;
    },
    getSearchURL: function() {
        var url = window.location.href;
        if (document.getElementById(this.inputbox.split('|')[0]).value != '') {
            if (url.match(/key=[^&]+/ig)) {
                url = url.replace(/key=[^&]+/ig, 'key=' + encodeURI(document.getElementById(this.inputbox.split('|')[0]).value));
            }
            else {
                if (url.indexOf('?') > 0) {
                    url = url + '&key=' + encodeURI(document.getElementById(this.inputbox.split('|')[0]).value);
                }
                else {
                    url = url + '?key=' + encodeURI(document.getElementById(this.inputbox.split('|')[0]).value);
                }
            }
        }
        return url;
    }
};

function stateChangeIE(_frame) {
    if (_frame.readyState == "complete") {
        isFrameComplete = true;
    }
}
function stateChangeFirefox(_frame) {
    isFrameComplete = true;
}
document.write("<iframe src='http://js.my.58.com/GetToolTipInfo.html' style='display:none' onreadystatechange='stateChangeIE(this)' onload='stateChangeFirefox(this)' width='0px' height='0px' id='tooltipcontentframe' name='tooltipcontentframe'></iframe> ");