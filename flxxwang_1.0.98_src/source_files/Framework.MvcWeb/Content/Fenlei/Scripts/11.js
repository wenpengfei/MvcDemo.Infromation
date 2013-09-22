var is_date_window_load_complete = false; CalendarClass = function () {
    var o = this; var GGS_cal_curdate = new Date();
    var GGS_cal_curyear = GGS_cal_curdate.getFullYear();
    var GGS_cal_curmonth = GGS_cal_curdate.getMonth();
    var GGS_cal_curday = GGS_cal_curdate.getDate();
    var GGS_cal_robj = null;
    o.obj = null;
    o.isDaysToCome = false;
    o.fullformat = "false";
    o.AppendText = function (pObj, text, className, mYear, mMonth, mDay) {
        mYear = parseInt(mYear, 10); mMonth = parseInt(mMonth, 10);
        mDay = parseInt(mDay, 10); rMonth = mMonth + 1; var divObj = document.createElement("DIV"); 
        if (className) {
            divObj.className = className;
        } divObj.appendChild(document.createTextNode(text)); pObj.appendChild(divObj);
        var curyear = parseInt(GGS_cal_curyear, 10); var curmonth = parseInt(GGS_cal_curmonth, 10) + 1;
        var curday = parseInt(GGS_cal_curday, 10); if (o.isDaysToCome) {
            if (curyear + '-' + (curmonth < 10 ? curmonth : curmonth) + '-' + (curday < 10 ? curday : curday) < mYear + '-' + (rMonth < 10 ? rMonth : rMonth) + '-' + (mDay < 10 ? mDay : mDay) || mYear + '-' + (rMonth < 10 ? rMonth : rMonth) + '-' + (mDay < 10 ? mDay : mDay) < '1998-07-10') { divObj.style.cursor = "pointer"; return; } 
        }
        if (divObj.className != "GGS_cal_weekday") {
            divObj.onmouseover = function () {
                this.className = "GGS_cal_sltday"; this.title = mYear + "年" + rMonth + "月" + mDay + "日"; o.$("GGS_cal_date").innerHTML = mYear + '-' + (rMonth < 10 ? rMonth : rMonth) + '-' + (mDay < 10 ? mDay : mDay);
            }; divObj.onmousedown = function () {
                this.className = 'GGS_cal_slt2day';
            }; divObj.onmouseout = function () {
                var curClass = (GGS_cal_curyear == mYear && GGS_cal_curmonth == mMonth && GGS_cal_curday == mDay) ? 'GGS_cal_curday' : 'GGS_cal_day';
                this.className = curClass;
            }; divObj.onclick = function () {
                if (rMonth < 10 && o.fullformat == "true") { rMonth = "0" + rMonth; }
                if (mDay < 10 && o.fullformat == "true") { mDay = "0" + mDay; } if (GGS_cal_robj instanceof Array && GGS_cal_robj.length == 3) { GGS_cal_robj[0].value = mYear; GGS_cal_robj[1].value = rMonth; GGS_cal_robj[2].value = mDay; } else { GGS_cal_robj.value = (mYear + "-" + rMonth + "-" + mDay); } o.ColClose();
            }; divObj.style.cursor = "pointer";
        }
    }, o.GetOffsetPos = function (element) { var posTop = 0, posLeft = 0; do { posTop += element.offsetTop || 0; posLeft += element.offsetLeft || 0; element = element.offsetParent; } while (element); return [posLeft, posTop]; }, o.TurnMonth = function (sign) {
        var curMonth = parseInt(o.$("GGS_cal_month").innerHTML, 10) - 1; var curYear = parseInt(o.$("GGS_cal_year").innerHTML, 10); if (sign == 0) { if (curMonth <= 0) { curMonth = 11; curYear--; } else { curMonth--; } } else if (sign == 1) { if (curMonth >= 11) { curMonth = 0; curYear++; } else { curMonth++; } } o.SetDate(curYear, curMonth);
    }, o.TurnYear = function (sign) { var curMonth = parseInt(o.$("GGS_cal_month").innerHTML, 10) - 1; var curYear = parseInt(o.$("GGS_cal_year").innerHTML, 10); if (sign == 0) { if (curYear > 1) curYear--; } else if (sign == 1) { curYear++; } o.SetDate(curYear, curMonth); }, o.ColClose = function () {
        if (o.$("GGS_cal_ibg") != null && o.$("GGS_cal") != null) { 
    o.$("GGS_cal_ibg").style.display = "none"; o.$("GGS_cal").style.display = "none"; } }, o.SetDate = function (mYear, mMonth) {
        mYear = parseInt(mYear, 10); mMonth = parseInt(mMonth, 10); var firstDay = new Date(mYear, mMonth, 1); var lastDay = new Date(((mMonth == 11) ? (mYear + 1) : mYear), ((mMonth == 11) ? 0 : (mMonth + 1)), 0); o.$("GGS_cal_year").innerHTML = mYear; o.$("GGS_cal_month").innerHTML = mMonth + 1; var dayIndex = 1; 
        var con = o.$("GGS_cal_days"); con.innerHTML = ""; for (var i = 0; i <= 41; i++) {
            if (i > (firstDay.getDay() + lastDay.getDate() - 1)) break; if (i >= firstDay.getDay()) { var curClass = (GGS_cal_curyear == mYear && GGS_cal_curmonth == mMonth && GGS_cal_curday == dayIndex) ? 'GGS_cal_curday' : 'GGS_cal_day'; o.AppendText(con, dayIndex, curClass, mYear, mMonth, dayIndex); dayIndex++; } else { 
            o.AppendText(con, '', 'GGS_cal_weekday'); } 
        } var cal = o.$("GGS_cal"); var ibg = o.$("GGS_cal_ibg"); ibg.style.height = cal.offsetHeight;
    }, o.isDateString = function (sDate) {
        if (sDate[0] == "undefined" || sDate[1] == "undefined" || sDate[2] == "undefined" || sDate[0] == "" || sDate[1] == "" || sDate[2] == "") { return false; } sDate = sDate[0] + '-' + sDate[1] + '-' + sDate[2]; var iaMonthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]; var iaDate = new Array(3); var year, month, day; if (arguments.length != 1) {
            return false;
        }
        iaDate = sDate.toString().split("-"); 
        if (iaDate.length != 3) return false; if (iaDate[1].length > 2 || iaDate[2].length > 2) { return false; } if (isNaN(iaDate[0]) || isNaN(iaDate[1]) || isNaN(iaDate[2])) { return false; } year = parseFloat(iaDate[0]); month = parseFloat(iaDate[1]); day = parseFloat(iaDate[2]); if (year < 1900 || year > 2100) { return false; } 
        if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) { iaMonthDays[1] = 29; } if (month < 1 || month > 12) { return false; } if (day < 1 || day > iaMonthDays[month - 1]) { return false; } return true;
    }, o.IniCal = function () {
        if (arguments.length < 1) { alert("无参数传入！"); return false; } if (arguments.length == 1) {
            GGS_cal_robj = arguments[0]; if (arguments[0].value != "") var sltDate = arguments[0].value.split("-");
        } else if (arguments.length == 3) {
            GGS_cal_robj = [arguments[0], arguments[1], arguments[2]];
            if (arguments[0].value != "" && arguments[1].value != "" && arguments[2].value != "") { var sltDate = [arguments[0].value, arguments[1].value, arguments[2].value]; } 
        } if (o.$("GGS_cal_ibg") == null) {
            var f = document.createElement("IFRAME"); f.id = "GGS_cal_ibg"; f.border = 0; f.frameborder = 0; f.scrolling = "no"; document.body.appendChild(f);
        } var objPos = o.GetOffsetPos(arguments[0]); var divobj; var cal = o.$("GGS_cal"); if (cal != null) { divobj = cal; divobj.style.display = "block"; divobj.style.top = (parseInt(objPos[1]) + parseInt(arguments[0].offsetHeight) + 8) + "px"; divobj.style.left = parseInt(objPos[0]) + "px"; } else { divobj = document.createElement("div"); divobj.innerHTML = o.GetStyle.getHtml(0); divobj.style.display = "block"; divobj.style.position = "absolute"; if (navigator.userAgent.indexOf("FireFox") != -1) { divobj.style.width = "233px"; } else { divobj.style.width = "233px"; } divobj.style.top = (parseInt(objPos[1]) + parseInt(arguments[0].offsetHeight) + 8) + "px"; divobj.style.left = parseInt(objPos[0]) + "px"; divobj.id = "GGS_cal"; document.body.appendChild(divobj); } o.SetDate((arguments[0].value == "" || !o.isDateString(sltDate)) ? GGS_cal_curyear : parseInt(sltDate[0], 10), (arguments[0].value == "" || !o.isDateString(sltDate)) ? GGS_cal_curmonth : parseInt(sltDate[1], 10) - 1); var GGS_cal_curyear2 = parseInt(GGS_cal_curyear, 10); var GGS_cal_curmonth2 = parseInt(GGS_cal_curmonth, 10) + 1; GGS_cal_curmonth2 = GGS_cal_curmonth2 < 10 ? GGS_cal_curmonth2 : GGS_cal_curmonth2; var GGS_cal_curday2 = parseInt(GGS_cal_curday, 10); GGS_cal_curday2 = GGS_cal_curday2 < 10 ? GGS_cal_curday2 : GGS_cal_curday2; o.$("GGS_cal_date").innerHTML = (arguments[0].value == "" || !o.isDateString(sltDate)) ? GGS_cal_curyear2 + '-' + GGS_cal_curmonth2 + '-' + GGS_cal_curday2 : sltDate[0] + '-' + sltDate[1] + '-' + sltDate[2]; var ibg = o.$("GGS_cal_ibg"); ibg.style.display = "block"; ibg.style.top = (parseInt(objPos[1]) + parseInt(arguments[0].offsetHeight) + 8) + "px"; ibg.style.left = parseInt(objPos[0]) + "px"; ibg.style.height = divobj.offsetHeight;
    }, o.$ = function (id) { return document.getElementById(id); }, o.loadCss = function (file, id) {
        var cssTag = document.getElementById(id); var head = document.getElementsByTagName("head").item(0); if (cssTag) {
            head.removeChild(cssTag);
        } css = document.createElement("link"); css.href = file + ".css"; css.rel = "stylesheet";
        css.type = "text/css"; if (id != null) { css.id = id; } head.appendChild(css);
    }, o.GetStyle = {
        getHtml: function (num) {
            var htmls = { t_0: '<table border=\'0\' cellpadding=\'0\' cellspacing=\'0\'><tr><td class=\'rl_b1\'>' + '<table border=\'0\' class=\'f12\' width=\'100%\' cellpadding=\'2\' cellspacing=\'0\'>' + '<tr align=\'center\' bgcolor=\'#d4e4f1\'>' + '<td><b class=\'nyr\'><span id=\'GGS_cal_date\'>2007-1-19</span></b></td>' + '<td width=\'25\'><a href=\'javascript:' + o.obj + '.ColClose();\'><img src=\'/Content/Fenlei/images/icoclose.gif\' border=\'0\'></a></td>' + '</tr>' + '</table>' + '<table width=\'231\' border=\'0\' cellpadding=\'0\' cellspacing=\'0\' class=\'f12\' bgcolor=\'#ffffff\'>' + '<tr align=\'center\' height=\'20\'>' + '<td><a href=\'javascript:' + o.obj + '.TurnYear(0);\'><img border=\'0\' src=\'/Content/Fenlei/images/icoal1.gif\' width=\'14\' height=\'13\' alt=\'上一年\'></a></td>' + '<td colspan=\'2\'><b class=\'ny\'><span id=\'GGS_cal_year\'>2007</span></b>年</td>' + '<td><a href=\'javascript:' + o.obj + '.TurnYear(1);\'><img border=\'0\' src=\'/Content/Fenlei/images/icoal2.gif\' width=\'14\' height=\'13\' alt=\'下一年\'></a></td>' + '<td><a href=\'javascript:' + o.obj + '.TurnMonth(0);\'><img border=\'0\' src=\'/Content/Fenlei/images/icoal1.gif\' width=\'14\' height=\'13\' alt=\'上一月\'></a></td>' + '<td><b class=\'ny\'><span id=\'GGS_cal_month\'>1</span></b>月</td>' + '<td><a href=\'javascript:' + o.obj + '.TurnMonth(1);\'><img border=\'0\' src=\'/Content/Fenlei/images/icoal2.gif\' width=\'14\' height=\'13\' alt=\'下一月\'></a></td>' + '</tr>' + '<tr align=\'center\' height=\'20\' bgcolor=\'#d4e4f1\'>' + '<td width=\'32\'><font color=\'#ff0066\'>日</font></td>' + '<td width=\'32\'>一</td>' + '<td width=\'32\'>二</td>' + '<td width=\'32\'>三</td>' + '<td width=\'33\'>四</td>' + '<td width=\'32\'>五</td>' + '<td width=\'33\'><font color=\'#ff0066\'>六</font></td>' + '</tr>' + '<tr><table border=\'0\' cellpadding=\'0\' cellspacing=\'0\'>' + '<div id=\'GGS_cal_days\' class=\'clearfix\'></div>' + '<div style=\'clear:both\'></div>' + '</table></tr>' + '</table>' + '</td></tr></table>', t_1: "2", t_2: "3"
            }; 
            return eval("htmls.t_" + num);
        }, getCss: function (num) {
            var csss = { t_0: "/Content/Fenlei/css/jscss/calendarcss", t_1: "2", t_2: "3" }; o.loadCss(csss.t_0);
        } 
    }; 
    o.GetStyle.getCss(0);
}; var CGA = new CalendarClass(); CGA.obj = "CGA"; var interval_id = 0; function Calendar(id, fullformat) {
    if (!is_date_window_load_complete) {
        window.clearInterval(interval_id); if (fullformat && fullformat == "true") {
            interval_id = window.setInterval("Calendar('" + id + "','true')", 200);
        } else {
            interval_id = window.setInterval("Calendar('" + id + "','false')", 200);
        } return;
    }
    if (is_date_window_load_complete) {
        window.clearInterval(interval_id); var B = document.getElementById(id);
        if (fullformat == 'true') { CGA.fullformat = 'true'; } else { CGA.fullformat = 'false'; } CGA.IniCal(B);
    } 
}
$(document).ready(function() {is_date_window_load_complete = true;});