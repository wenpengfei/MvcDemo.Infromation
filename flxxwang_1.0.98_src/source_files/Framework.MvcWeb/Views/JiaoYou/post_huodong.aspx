<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/FriendMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.IFriend>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="Rows" runat="server">
<script type="text/javascript" src="/Content/Fenlei/Scripts/11.js"></script>
<script type="text/javascript">Gca = new CalendarClass(); Gca.obj = "Gca"; </script>
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 类 别： </td> 
    <td> 
        <select name="ObjectType" id="ObjectType" f="{0}">  
            <%--<option value='0' > 驴友</option>  
            <option value='1' > 聚会</option>  
            <option value='2' selected> 活动</option>--%> 
            <%
                foreach (var item in FriendActivity.Singleton.ObjectTypeCollection)
                {
                    %>
                    <option value='<%=item.Id %>'><%=item.Name %></option>
                    <%
                }
             %> 
        </select> &nbsp; &nbsp; 
        <b class="red">*</b> 场 地：<input class="text1" type="text" id="Adress" f="{0}" name="Adress" value=''  maxLength=20 /> <span id="Adress_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 开始时间： </td> 
    <td> 
        <input type="text" class="text2" id="Time" f="{0}" name="Time" value='' onclick="Gca.IniCal(this); $.j.CalClickAfter(this);" readonly /> 
        结束时间：<input type="text" class="text2" id="EndTime" f="{0}" name="EndTime" value='' onclick="Gca.IniCal(this); $.j.CalClickAfter(this);" readonly /> 
        <span id="Time_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> 选择标签： </td> 
    <td> 
        <ul class="tag3" id="tagul"> 
            <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="94"  />自助游</li>
            <li><input name="Tag" id="Tag_1" type="checkbox" value="95"  />徒步</li>
            <li><input name="Tag" id="Tag_2" type="checkbox" value="96"  />驾车游</li>
            <li><input name="Tag" id="Tag_3" type="checkbox" value="97"  />杀人游戏</li>
            <li><input name="Tag" id="Tag_4" type="checkbox" value="98"  />单身聚会</li>
            <li><input name="Tag" id="Tag_5" type="checkbox" value="99"  />公益活动</li>
            <li><input name="Tag" id="Tag_6" type="checkbox" value="101"  />周末活动</li>
            <li><input name="Tag" id="Tag_7" type="checkbox" value="92"  />团购/打折</li>--%>
            <%
                foreach (var item in FriendActivity.Singleton.TagCollection)
                {
                    %>
                        <li><input name="Tag" id="Tag_<%=item.Id %>" type="checkbox" value="<%=item.Id %>"/><%=item.Name %></li>
                    <%    
                }
            %>
        </ul> <span id="infotag_Tip"></span> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var friend = new FriendActivity();
        friend.ObjectType = parseInt($("#ObjectType").val(), 10);
        friend.Address = $("#Adress").val()
        var d = new Date();
        var s = $("#Time").val();
        d.setYear(parseInt(s.split("-")[0], 10));
        d.setMonth(parseInt(s.split("-")[1] - 1, 10)); //setMonth(0~11)
        d.setDate(parseInt(s.split("-")[2], 10));
        d.setHours(0, 0, 0, 0);
        friend.StartTime = d.toJson(true);

        d = new Date();
        s = $("#EndTime").val();
        d.setYear(parseInt(s.split("-")[0], 10));
        d.setMonth(parseInt(s.split("-")[1] - 1, 10)); //setMonth(0~11)
        d.setDate(parseInt(s.split("-")[2], 10));
        d.setHours(0, 0, 0, 0);
        friend.EndTime = d.toJson(true);

        var Tags = $(':checkbox[name="Tag"]:checked');
        if (Tags.length >= 1) {
            friend.Tag1 = parseInt($(Tags[0]).val(), 10);
        }
        if (Tags.length >= 2) {
            friend.Tag2 = parseInt($(Tags[1]).val(), 10);
        }

        FillData(friend);
        friend.Id = -1;
        friend.DateCreated = new Date().toJson(true);
        friend.DateModified = friend.DateCreated;
        friend.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#Time").formValidator({ tipid: "Time_Tip", onfocus: "请输入开始时间", q2b: true }).inputValidator({ onerror: "请输入开始时间" }).regexValidator({ regexp: "^\\d{0,4}-\\d{1,2}-\\d{0,4}$", onerror: "开始时间输入不正确" }).compareValidator({ desid: "EndTime", operateor: "<=", onerror: "结束时间必须大于起始时间", datatype: "date" }).groupValidator({ groupName: "l1", nextgroupid: "EndTime" });
        $("#EndTime").formValidator({ tipid: "Time_Tip", onfocus: "请输入结束时间", q2b: true }).inputValidator({ onerror: "请输入结束时间" }).regexValidator({ regexp: "^\\d{0,4}-\\d{1,2}-\\d{0,4}$", onerror: "结束时间输入不正确" }).compareValidator({ desid: "Time", operateor: ">=", onerror: "结束时间必须大于起始时间", datatype: "date" }).groupValidator({ groupName: "l1", nextgroupid: "Time" });
        $("#Adress").formValidator({ tipid: "Adress_Tip", onfocus: "如：世贸天街，植物园", q2b: true }).inputValidator({ onerror: "请输入场地" }).regexValidator({ regexp: "\\S+#^(.){2,20}$#^([^\\s]\\s{0,6}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6}|\\s)))+$", onerror: "请输入场地#场地不足2个字#场地里不能输入电话" });
    });
</script>
</asp:Content>
