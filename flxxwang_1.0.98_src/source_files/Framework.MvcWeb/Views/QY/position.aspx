<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<List<Recruit>>" %>
<%@ Import Namespace="Infomation.Core" %>
<%@ Import Namespace="Infomation.Core.Extensions" %>
<%@ Import Namespace="Framework.Utility" %>
<!DOCTYPE html>

<html>
<head runat="server">
    <title>职位</title>
    <link type="text/css" rel="stylesheet" href="/Content/Fenlei/Css/position/windows20110528.css" />
    <script type="text/javascript" src="/Content/Fenlei/Scripts/qy/common.js"></script>

    <script src="/Scripts/jquery-1.5.1.min.js" type="text/javascript"></script>

    <script type="text/javascript" src="/Scripts/MicrosoftAjax.js"></script>

    <script src="/Scripts/framework/framework.js" type="text/javascript"></script>
    <script src="/Scripts/framework/cookie.js" type="text/javascript"></script>
    <script src="/Content/Fenlei/Scripts/Infomation.js?v20120501" type="text/javascript"></script>

</head>
<body>
    <%
        var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
    %>
    <div>
        <div class="infolist" id="main">
			<style type="text/css">
			    .daohang{height:34px;border-bottom:1px solid #f1f1f1;position:relative}
			    .daohang ul{position:absolute;left:15px;top:7px;}
			    .daohang li{border:1px solid #f1f1f1;padding:5px 12px;height:16px;line-height:16px;float:left;font-size:12px;margin-right:3px;}
			    .daohang li.selected{border-bottom-color:#fff;}
			    .daohang li.selected a{color:#000;font-weight:bold}
		    </style>
	         <div class="daohang">
        	    <ul>
            	    <li <%=this.ViewData["type"].ToString().ToLower()=="full"?"class='selected'":""%>><a href="<%=Url.Action("position", "qy", new {id=routeData.Values["id"],type="full" })%>">全职招聘</a></li>
                    <li <%=this.ViewData["type"].ToString().ToLower()=="part"?"class='selected'":""%>><a href="<%=Url.Action("position", "qy", new {id=routeData.Values["id"],type="part" })%>">兼职招聘</a></li>
                </ul>
            </div>
            <%
                if (this.ViewData["type"].ToString().ToLower() == "full")
                {
                    var recruitList = this.Model.Where(item => item.WorkType == WorkType.Full);
                    %>
                    <table cellspacing="0" cellpadding="0" border="0" id="tb_list" style="width: 100%;">
			            <tbody>
				            <tr class="c_title">
					            <td> 职位名</td>
					            <td align="center">人数</td>
					            <td align="center">学历要求</td>
					            <td align="center"> 薪资水平</td>
					            <td align="center">工作地点</td>
					            <td align="right">更新时间</td>
				            </tr>
                            <%
                                foreach (var item in recruitList)
                                {
                                    %>
                                    <tr> 
					                    <td>
						                    <a class="t" target="_blank" href="<%=Url.Action("Detail","ZhaoPin",new{city= CookieManager.GetCookie("city"), smallcategory=item.JobType.ToString(),id=item.Id}) %>"><%=item.JobName %></a> 
					                    </td>
					                    <td align="center"><%=item.RecruitCount %></td>
					                    <td align="center"><%=item.Education.DisplayName()%></td> 
					                    <td align="center"> <%=item.Wage %></td>
					                    <td align="center"><%=item.CityName %></td>
					                    <td align="right"><%=item.DateModified.ToString("yyyy-MM-dd") %></td>
					                </tr>
                                    <%
                                }
                            %>
                        </tbody> 
		            </table>
                    <%
                }
            %>
		    

            <%
                if (this.ViewData["type"].ToString().ToLower() == "part")
                {
                    var recruitList = this.Model.Where(item => item.WorkType == WorkType.Part);
                    %>
                    <table cellspacing="0" cellpadding="0" border="0" id="tb_list" style="width: 100%;">
			            <tbody>
				            <tr class="c_title">
					            <td> 职位名</td>
					            <td align="center">人数</td>
					            <td align="center">性别要求</td>
					            <td align="center"> 薪资水平</td>
					            <td align="center">工作地点</td>
					            <td align="right">更新时间</td>
				            </tr>
                            <%
                                foreach (var item in recruitList)
                                {
                                    %>
                                    <tr> 
					                    <td>
						                    <a class="t" target="_blank" href="<%=Url.Action("Detail","ZhaoPin",new{smallcategory=item.JobType.ToString(),id=item.Id}) %>"><%=item.JobName %></a> 
					                    </td>
					                    <td align="center"><%=item.RecruitCount %></td>
					                    <td align="center"><%=item.SexRequire==null?"不限":(item.SexRequire==true?"男":"女")%></td> 
					                    <td align="center"> <%=item.WageMin %>元/天</td>
					                    <td align="center"><%=item.CityName %></td>
					                    <td align="right"><%=item.DateModified.ToString("yyyy-MM-dd") %></td>
					                </tr>
                                    <%
                                }
                            %>
                        </tbody> 
		            </table>
                    <%
                }
            %>
		</div>
    </div>
</body>
</html>
