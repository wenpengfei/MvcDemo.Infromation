<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/HouseDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>
<%@ Import Namespace="Framework.Extensions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var routeData = (HttpContext.Current.Handler as MvcHandler).RequestContext.RouteData;
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var house = ViewTag.Info as HouseShop;
%>
<ul class="info">
    <li><i class="z">区域：</i>
        <%
            if (house.RegionId != null)
            {
                %>
                <a href="<%=Url.Action(routeData.Values["smallcategory"].ToString(), new { region = house.RegionId.Value }) %>"><%=house.RegionName %></a>&nbsp;
                <%
            }
                    if (house.CircleId != null)
                    {
                        %>
                        <a href="<%=Url.Action(routeData.Values["smallcategory"].ToString(),new{region=house.RegionId.Value,circle=house.CircleId.Value}) %>"><%=house.CircleName %></a>&nbsp;
                        <%
                    }
        %>
    </li>
    <li><i class="z">地段：</i>
    <%=house.District1 %>
    <%
        if (!string.IsNullOrWhiteSpace(house.District2))
        {
            %>
            或<%=house.District2 %>
            <%
        }
    %>
    </li>
    <li><i class="z">情况：</i>
    <%=ViewTag.ObjectType==null?string.Empty:ViewTag.ObjectType.Name %>
    <%
        if (house.Type == 1 || house.Type == 3 || house.Type == 5) {
            if (!string.IsNullOrWhiteSpace(house.Management))
            {
                %>
                （历史经营<%=house.Management %>）
                <%
            }
        }
    %>
    </li>
    <li><i class="z">面积：</i>
    <%
        if (house.Type == 2 || house.Type == 4)
        {
            %>
            <%=house.Area + "-" + house.Area2%>㎡
            <%
        }
        else
        {
            %>
            <%=house.Area%>㎡
            <%            
        }
    %>
    </li>

    <%
        if (house.Type == 3)//出租
        {
                
            if(house.Price==0)
            {
                %>
                <li><i class="z">租金：</i>面议</li>
                <%
            }
            else
            {
                %>
                <li><i class="z">租金：</i><em class="redfont"><%=house.Price%></em><%=house.PriceUnit %></li>
                <%
            }
                
        }
        if (house.Type == 4)//求租
        {
            if(house.Price==0||house.Price2==0)
            {
                %>
                <li><i class="z">租金：</i>面议</li>
                <%
            }
            %>
            <li><i class="z">租金：</i><em class="redfont"><%=house.Price+"-"+house.Price2 %></em><%=house.PriceUnit %></li>
            <%
        }
        if (house.Type == 5)//转让
        {
            if (house.PriceTransfer == null||house.PriceTransfer==0)
            {
                %>
                <li><i class="z">转让费：</i>面议(租金
                <%
                if (house.Price == 0)
                {
                    %>
                    面议
                    <%
                }
                else
                {
                    %>
                    <%=house.Price %><%=house.PriceUnit %>
                    <%
                }
                %>
                )</li>
                <%
            }
            else
            {
                %>
                <li><i class="z">转让费：</i><%=house.PriceTransfer %>万元(租金
                <%
                if (house.Price == 0)
                {
                    %>
                    面议
                    <%
                }
                else
                {
                    %>
                    <%=house.Price %><%=house.PriceUnit %>
                    <%
                }
                %>
                )</li>
                <%
            }
        }
        if (house.Type == 2)//求购
        {
            if(house.Price==0||house.Price2==0)
            {
                %>
                <li><i class="z">售价：</i>面议</li>
                <%
            }
            %>
            <li><i class="z">售价：</i><em class="redfont"><%=house.Price+"-"+house.Price2 %></em>万元</li>
            <%
        }
        if (house.Type == 1)//出售
        {
            if(house.Price==0)
            {
                %>
                <li><i class="z">售价：</i>面议</li>
                <%
            }
            else
            {
                %>
                <li><i class="z">售价：</i><em class="redfont"><%=house.Price%></em>万元</li>
                <%
            }
        }
    %>
   
</ul>
</asp:Content>
