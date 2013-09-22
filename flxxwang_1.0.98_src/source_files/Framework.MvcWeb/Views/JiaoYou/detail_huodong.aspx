<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FriendDetail.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Info" runat="server">
<%
    var ViewTag = ViewData["ViewTag"] as ViewTag;
    var friend = ViewTag.Info as FriendActivity;
%>
<ul class="info">

    <%
        var tag1 = friend.TagCollection.FirstOrDefault(item => item.Id == friend.Tag1);
        var tag2 = friend.TagCollection.FirstOrDefault(item => item.Id == friend.Tag2);
        if (tag1 != null)
        {
            %>
            <li><i class="z">标签：</i>
                <a href="#"><%=tag1.Name %></a>
                <%
                if (tag2 != null)
                {
                    %>
                    &nbsp;<a href="#"><%=tag2.Name %></a>
                    <%
                }
                %>
            </li>

            <%
        }
    %>
    <li><i class="z">开始时间：</i><%=friend.StartTime==null?"随时":friend.StartTime.Value.ToString("yyyy-M-d") %></li>
    <li><i class="z">结束时间：</i><%=friend.EndTime==null?"随时":friend.EndTime.Value.ToString("yyyy-M-d") %></li>
    <%
        var objType = friend.ObjectTypeCollection.FirstOrDefault(item => item.Id == friend.ObjectType);
        if (objType != null)
        {
            %>
            <li><i class="z">类别：</i><a href="<%=Url.Action(friend.Category.Code, friend.Category.Parent.Code, new { objecttype=objType.Id }) %>"><%=objType.Name %></a></li>
            <%
        }
    %>
    <li><i class="z">场地：</i><%=friend.Address %></li>
</ul>
</asp:Content>
