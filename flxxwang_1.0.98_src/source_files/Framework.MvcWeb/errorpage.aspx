<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="errorpage.aspx.cs" Inherits="Framework.MvcWeb.errorpage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="/Scripts/jquery-ui-1.9m6/jquery-1.6.2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        出错了,<a href="/">返回<%=SiteInfo.Name%>主页</a>
        <br /><br />热门城市:
        <ul>
            <li><a href='/bj' target='_self'>北京</a></li>
            <li><a href='/sh' target='_self'>上海</a></li>
            <li><a href='/gz' target='_self'>广州</a></li>
            <li><a href='/sz' target='_self'>深圳</a></li>
            <li><a href='/cd' target='_self'>成都</a></li>
            <li><a href='/cs' target='_self'>长沙</a></li>
            <li><a href='/hz' target='_self'>杭州</a></li>
            <li><a href='/jn' target='_self'>济南</a></li>
            <li><a href='/su' target='_self'>苏州</a></li>
            <li><a href='/tj' target='_self'>天津</a></li>
            <li><a href='/wh' target='_self'>武汉</a></li>
            <li><a href='/fz' target='_self'>福州</a></li>
            <li><a href='/cq' target='_self'>重庆</a></li>
            <li><a href='/sjz' target='_self'>石家庄</a></li>
            <li><a href='/ty' target='_self'>太原</a></li>
            <li><a href='/sy' target='_self'>沈阳</a></li>
            <li><a href='/dl' target='_self'>大连</a></li>
            <li><a href='/cc' target='_self'>长春</a></li>
            <li><a href='/jl' target='_self'>吉林</a></li>
            <li><a href='/hrb' target='_self'>哈尔滨</a></li>
            <li><a href='/nj' target='_self'>南京</a></li>
            <li><a href='/wx' target='_self'>无锡</a></li>
            <li><a href='/hz' target='_self'>杭州</a></li>
            <li><a href='/nb' target='_self'>宁波</a></li>
            <li><a href='/wz' target='_self'>温州</a></li>
            <li><a href='/sx' target='_self'>绍兴</a></li>
            <li><a href='/jh' target='_self'>金华</a></li>
            <li><a href='/hf' target='_self'>合肥</a></li>
            <li><a href='/fz' target='_self'>福州</a></li>
            <li><a href='/qd' target='_self'>青岛</a></li>
            <li><a href='/zz' target='_self'>郑州</a></li>
            <li><a href='/dg' target='_self'>东莞</a></li>
            <li><a href='/cd' target='_self'>成都</a></li>
            <li><a href='/gy' target='_self'>贵阳</a></li>
            <li><a href='/haikou' target='_self'>海口</a></li>
            <li><a href='/km' target='_self'>昆明</a></li>
            <li><a href='/xa' target='_self'>西安</a></li>
            <li><a href='/yiwu' target='_self'>义乌</a></li>
        </ul>
    </div>
    </form>
    <script type="text/javascript">
        $(function () {
            location.href = "/";
        });
    </script>
</body>
</html>
