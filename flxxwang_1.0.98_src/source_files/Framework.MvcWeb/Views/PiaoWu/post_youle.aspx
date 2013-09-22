﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/TicketMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ITicket>" %>
<%@ Import Namespace="Infomation.Core"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>



<asp:Content ID="Content6" ContentPlaceHolderID="Rows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 供 求： </td> 
    <td class="checkpb">  
        <label> <input id="type_0" f="{0}" type="radio" name="type" value='1' checked /><span>转让</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input id="type_1" f="{0}" type="radio" name="type" value='2'  /><span>求购</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <span id="type_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 价 格： </td> 
    <td> <input class="text3 gray" type="text" f="{0}元" id="MinPrice" name="MinPrice" value='面议'  Except='面议'  maxLength=5/> 元<span id="MinPrice_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 补充说明： </td> 
    <td> <textarea name="Content" class="textarea2" id="Content"  maxLength=2000></textarea> <span id="Content_Tip"></span> </td> 
</tr> 
<tr> 
    <td class="t"> 选择标签： </td> 
    <td> 
        <ul class="tag3" id="tagul"> 
            <%--<li><input name="Tag" id="Tag_0" type="checkbox" value="634"  />动物园</li>
            <li><input name="Tag" id="Tag_1" type="checkbox" value="1893"  />温泉</li>
            <li><input name="Tag" id="Tag_2" type="checkbox" value="109"  />其他</li>
            <li><input name="Tag" id="Tag_3" type="checkbox" value="647"  />杭州乐园</li>
            <li><input name="Tag" id="Tag_4" type="checkbox" value="3467"  />极地海洋世界</li>
            <li><input name="Tag" id="Tag_5" type="checkbox" value="3510"  />宋城</li>--%>
            <%
                foreach (var item in TicketPleasure.Singleton.TagCollection)
                {
                    %>
                    <li><input name="Tag" id="Tag_<%=item.Id %>" type="checkbox" value="<%=item.Id %>"  /><%=item.Name %></li>
                    <%--<option value='<%=item.Id %>'><%=item.Name %></option>--%>
                    <%
                }
             %>
        </ul><span id="infotag_Tip"></span> 
    </td> 
</tr>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var ticket = new TicketPleasure();
        ticket.Title = $("#Title").val();
        ticket.Type = parseInt(getRadioValue("type"), 10);

        ticket.Price = $("#MinPrice").val();
        if (ticket.Price == "" || ticket.Price == "面议") {
            ticket.Price = 0;
        }
        else {
            ticket.Price = parseInt(ticket.Price, 10);
        }
        var Tags = $(':checkbox[name="Tag"]:checked');
        if (Tags.length >= 1) {
            ticket.Tag1 = parseInt($(Tags[0]).val(), 10);
        }
        if (Tags.length >= 2) {
            ticket.Tag2 = parseInt($(Tags[1]).val(), 10);
        }
        //        if (Tags.length >= 3) {
        //            ticket.Tag3 = parseInt($(Tags[2]).val(), 10);
        //        }
        //        if (Tags.length >= 4) {
        //            ticket.Tag4 = parseInt($(Tags[3]).val(), 10);
        //        }
        //        if (Tags.length >= 5) {
        //            ticket.Tag5 = parseInt($(Tags[4]).val(), 10);
        //        }
        //        if (Tags.length >= 6) {
        //            ticket.Tag6 = parseInt($(Tags[5]).val(), 10);
        //        }
        ticket.Content = $("#Content").val();
        FillData(ticket);
        ticket.Id = -1;
        ticket.DateCreated = new Date().toJson(true);
        ticket.DateModified = ticket.DateCreated;
        ticket.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            post();
//            return false;
//        }
//        });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#MinPrice").formValidator({ tipid: "MinPrice_Tip", onfocus: "请填写您交易时的价格！", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请正确填写价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请正确填写价格#价格为整数，且不能为0" });
        $("#Content").formValidator({ tipid: "Content_Tip", onfocus: "10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除" }).inputValidator({ onerror: "请填写补充说明" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkContent(val); }, onerror: "内容太过简单" });
    });
</script>
</asp:Content>
