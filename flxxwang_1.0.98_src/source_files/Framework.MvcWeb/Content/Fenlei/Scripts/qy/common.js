function GetCookieValue(name) {
    var arr = document.cookie.match(new RegExp(name + "=([^&;]+)"));
    if (arr != null) return decodeURI(arr[1]);
    else return "";
}
function writeUserName(isNew) {
    var exp = new Date(); exp.setTime(exp.getTime() + 30 * 24 * 60 * 60 * 1000);
    document.cookie = "supportcookie=true;domain=flxxwang.com;expires=" + exp.toGMTString();
    if (!(document.cookie && document.cookie != '')) {
        document.write('<script type="text/javascript" src="http://user.flxxwang.com/userloginstate.ashx"><\/script>');
        return true;
    }
    var host = window.location.hostname;
    var hosthome = host.substr(0, host.indexOf("."));
    var outurl = escape(window.location.href);
    var str = '<a href="http://passport.flxxwang.com/login/?path=' + outurl + '" target="_self">登录</a> <a href="http://passport.flxxwang.com/reg/?city=' + hosthome + '" target="_self">注册</a>';
    try {
        if (GetCookieValue("UserName") != "") {
            var msgcount = parseInt(GetCookieValue("MsgUnReadTotal")) + parseInt(GetCookieValue("SystemUnReadTotal")) + parseInt(GetCookieValue("RequireFriendUnReadTotal")) + parseInt(GetCookieValue("CommentUnReadTotal"));
            str = GetCookieValue("UserName");
            if (msgcount > 0) {
                str += '(<span class="red"><a style="color:#F00;margin: 0px;" href="http://my.flxxwang.com/liuyanjieshou/" title="你有' + msgcount + '条未读短信息">' + msgcount + '</a></span>)';
            }
            str += ' <a href="http://my.flxxwang.com/" target="_self">用户中心</a> <a href="http://passport.flxxwang.com/logout/?path=' + outurl + '" target="_self">退出</a>';
        }
        document.write(str);
    }
    catch (e) { document.write(str);}
    return true;
}
/**
 * 分页脚本函数
 * 说明:url目前默认是最后一个参数是page.
 * 调用函数时,url中把其他的参数准备好,page参数不加即可.
 * 例如:完整的url为:http://qy.flxxwang.com/jobs/{userId}/{page}：{}中为参数
 *    那么传递的url为:http://qy.flxxwang.com/jobs/{userId}即可。
 * @param id  要显示分页的父节点ID
 * @param url
 * @param totalPage
 * @param currentPage
 * @returns
 */
var seperatePage = function( id, url, totalPage, currentPage){
	if(totalPage < 2){
		document.getElementById(id).style.display="none";
		return;
	}
	var pageStr = '';
	if(currentPage > 1){
		pageStr += '<a href="' + url + "/" + (currentPage - 1) + '">';
		pageStr += '	<span>上一页</span>';
		pageStr += '</a>';
	}
	for(var index = 1; index <= totalPage; index++){
		if(index == currentPage){
			pageStr += '<strong><span>' + index + '</span></strong>';
		} else if ( currentPage > index && currentPage-index < 5) {
			pageStr += '<a href="' + url + '/' + index + '" ><span>' + index + '</span></a>';
		} else if (currentPage < index && index - currentPage < 5) {
			pageStr += '<a href="' + url + '/' + index + '" ><span>' + index + '</span></a>';
		} else if (currentPage < index) {
			break;
		}
	}
	if(currentPage < totalPage && totalPage >1) {
		pageStr += '<a href="' + url + "/" + (currentPage + 1) + '">';
		pageStr += '	<span>下一页</span>';
		pageStr += '</a>';
	}
	document.getElementById(id).innerHTML = pageStr;
}

