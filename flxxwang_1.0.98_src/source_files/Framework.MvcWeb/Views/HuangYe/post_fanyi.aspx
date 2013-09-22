<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/post/post.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Infomation.Core.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Main" runat="server">
<%var ViewTag = ViewData["ViewTag"] as ViewTag;%>
<table cellpadding="0" cellspacing="0" class="box1" id="formTb"> 
    <tr> 
        <td class="t"> <b class="red">*</b> 标 题： </td> 
        <td> <input type="text" qtb="true" name="Title" id="Title" f="{0}" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 服务类型： </td> 
        <td class="checkpb">  
            <%
                foreach (var item in ViewTag.Interface.ObjectTypeCollection)
                {
                    %>
                        <input type="checkbox" value='<%=item.Id %>' name="ObjectType" id="ObjectType_<%=item.Id %>" /><%=item.Name %>
                        <%--input的id不能省,否则表单验证会报错--%>
                    <%    
                }
            %>  
            <span id="ObjectType_Tip"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 语 种： </td> 
        <td class="checkpb">  
            <%--<input f="{0}" id="fuwuleixing_1" type="checkbox" value='1' name="fuwuleixing"  />英语  
            <input f="{0}" id="fuwuleixing_2" type="checkbox" value='2' name="fuwuleixing"  />日语  
            <input f="{0}" id="fuwuleixing_3" type="checkbox" value='3' name="fuwuleixing"  />韩语  
            <input f="{0}" id="fuwuleixing_4" type="checkbox" value='4' name="fuwuleixing"  />法语  
            <input f="{0}" id="fuwuleixing_5" type="checkbox" value='5' name="fuwuleixing"  />德语  
            <input f="{0}" id="fuwuleixing_6" type="checkbox" value='6' name="fuwuleixing"  />小语种--%> 
            <%
                //foreach (var item in YellowPageCategory.Tags)
                foreach (var item in ViewTag.Interface.TagCollection)
                {
                    %>
                        <input type="checkbox" value='<%=item.Id %>' name="fuwuleixing"/><%=item.Name %>
                    <%    
                }
            %>
            <span id="fuwuleixing_Tip"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 营业时间： </td> 
        <td> 
            <input class="text2 gray" name="yingyeshijian" type="text" id="yingyeshijian" f="{0}" value='08:00-24:00'  Except='08:00-24:00'  maxLength=11 /> 
            <span id="yingyeshijian_Tip"></span> 
        </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 地址： </td> 
        <td> <input class="text1" type="text" id="dizhi" f="{0}" name="dizhi" value=''  maxLength=50 /><span id="dizhi_Tip"></span> </td> 
    </tr> 
    <tr> 
        <td class="t"> 公交： </td> 
        <td> <input type="text" class="text1" id="gongjiao" f="{0}" name="gongjiao" value=''   /><span id="gongjiao_Tip"></span> </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 补充说明： </td> 
        <td> <textarea name="Content" class="textarea2" id="Content"  maxLength=2000></textarea> <span id="Content_Tip"></span> </td> 
    </tr> 
    <tr>
        <td class="t"> </td> 
        <td>
            <div id="uploadPic" value=""></div> 
            <script type="text/javascript">
                $info.Uploader.init();
            </script>
        </td>
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 联系人： </td> 
        <td> <input type="text" name="goblianxiren" id="goblianxiren" value='' class="text2"  maxLength=6 /> <span id="goblianxiren_Tip"></span> </td> 
    </tr> 
    <tr> 
        <td class="t"> <b class="red">*</b> 手机或电话： </td> 
        <td> <input class="text2" type="text" id="Phone" name="Phone" value=''   /> <span id="Phone_Tip"></span> </td> 
    </tr>
    <tr>
        <td class="t">QQ或MSN：</td>
        <td><input class="text2" type="text" qtb="true" value='' id="IM" name="IM" /> <span id="IM_Tip"></span></td>
    </tr>    
    <tr> 
        <td class="t"> </td> 
        <td> <input type="submit" id="fabu" class="fabu1" value="　　发布　　" ct="submit" />  </td> 
    </tr> 
</table>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var yp = new YellowTranslate();
        yp.Title = $("#Title").val();

        var ObjectTypes = $(':checkbox[name="ObjectType"]:checked');
        if (ObjectTypes.length >= 1) {
            yp.ObjectType1 = parseInt($(ObjectTypes[0]).val(), 10);
        }
        if (ObjectTypes.length >= 2) {
            yp.ObjectType2 = parseInt($(ObjectTypes[1]).val(), 10);
        }
        if (ObjectTypes.length >= 3) {
            yp.ObjectType3 = parseInt($(ObjectTypes[2]).val(), 10);
        }
        if (ObjectTypes.length >= 4) {
            yp.ObjectType4 = parseInt($(ObjectTypes[3]).val(), 10);
        }
        if (ObjectTypes.length >= 5) {
            yp.ObjectType5 = parseInt($(ObjectTypes[4]).val(), 10);
        }

        var Tags = $(':checkbox[name="fuwuleixing"]:checked');
        if (Tags.length >= 1) {
            yp.Tag1 = parseInt($(Tags[0]).val(), 10);
        }
        if (Tags.length >= 2) {
            yp.Tag2 = parseInt($(Tags[1]).val(), 10);
        }
        if (Tags.length >= 3) {
            yp.Tag3 = parseInt($(Tags[2]).val(), 10);
        }
        if (Tags.length >= 4) {
            yp.Tag4 = parseInt($(Tags[3]).val(), 10);
        }
        if (Tags.length >= 5) {
            yp.Tag5 = parseInt($(Tags[4]).val(), 10);
        }
        if (Tags.length >= 6) {
            yp.Tag6 = parseInt($(Tags[5]).val(), 10);
        }

        yp.BusTime = $("#yingyeshijian").val();
        yp.Address = $("#dizhi").val();
        yp.Bus = $("#gongjiao").val();
        yp.Content = $("#Content").val();
        yp.ContactPerson = $("#goblianxiren").val();
        yp.Phone = $("#Phone").val();
        yp.QQOrMSN = $("#IM").val();
        yp.Id = -1;
        yp.DateCreated = new Date().toJson(true);
        yp.DateModified = yp.DateCreated;
        yp.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $().ready(function () {
        $.c.user.unlogin("login");
//        $.formValidator.initConfig({ formid: "aspnetForm", errorfocus: true, btnid: 'fabu', fun: function () {
//            setFabuState(true);
//            post();
//            return false;
//        }
//        });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.IsSimple(val); }, onerror: '标题太过简单' });
        $(':checkbox[name="ObjectType"]').formValidator({ tipid: 'ObjectType_Tip', onfocus: '' }).inputValidator({ min: 1, onerror: '服务类型是必选项', type: 'checkbox' });
        $(':checkbox[name="fuwuleixing"]').formValidator({ tipid: 'fuwuleixing_Tip', onfocus: '' }).inputValidator({ min: 1, onerror: '语种是必选项', type: 'checkbox' });
        $('#yingyeshijian').formValidator({ tipid: 'yingyeshijian_Tip', onfocus: '请按格式输入，如：08:00-24:00', q2b: true, 'defaultvalue': '08:00-24:00' }).regexValidator({ regexp: "\\d{2,2}:\\d{2,2}-\\d{2,2}:\\d{2,2}", onerror: "请按格式输入，如：08:00-18:00" });
        $('#dizhi').formValidator({ tipid: 'dizhi_Tip', onfocus: '请填写详细地址', q2b: true }).regexValidator({ regexp: "\\S+#^(.){2,50}$#^([^\\s]\\s{0,3}(?!([0-9０１２３４５６７８９零一二三四五六七八九壹贰叁肆伍陆柒捌玖]{6})))+$#^[\\w\\[\\]\\(\\)\\{\\}\\.\\s,\\-\\*，。（）【】“”—‘’\\u4e00-\\u9fa5]*$", onerror: "请输入地址#地址不足2个字#地址里不能填写电话#地址里不能填写电话" });
        $('#Content').formValidator({ tipid: 'Content_Tip', onfocus: '10~2000个字之间，不能填写电话、QQ等联系方式或特殊符号，否则信息将会被删除' }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{10,}$#^([\\s\\S]){10,2000}$", onerror: "请填写补充说明#补充说明不足10个字#补充说明应在10~2000个字之间，不能填写电话、QQ等联系方式" }).functionValidator({ fun: function (val, elem) { return $.formValidator.IsSimple(val); }, onerror: '内容太过简单' });
        $('#goblianxiren').formValidator({ tipid: 'goblianxiren_Tip', onfocus: '2~6个字，不能填写电话和联系方式', q2b: true }).regexValidator({ regexp: "\\S+#^(.){2,6}$#^[\\w\\d\\s\\u4e00-\\u9fa5]*$", onerror: "请输入联系人#联系人不足2个字#联系人不能填写特殊符号" });
        $('#Phone').formValidator({ tipid: 'Phone_Tip', onfocus: '请正确填写电话号码，分机可以用“-”分开。', q2b: true }).regexValidator({ regexp: "(^(0\\d{2,3})?-?([2-9]\\d{6,7})(-\\d{1,5})?$)|(^((\\(\\d{3}\\))|(\\d{0}))?(13|14|15|18)\\d{9}$)|(^(400|800)\\d{7}(-\\d{1,5})?$)|(^(95013)\\d{6,8}$)", onerror: "电话填写错误。<br/>请参照格式填写：87654321-001或138********" });
        $('#IM').formValidator({ tipid: 'IM_Tip', onfocus: '只能填写一个qq或msn。<br>格式如：123456 或 myname@flxxwang.com', q2b: true, 'empty': true }).regexValidator({ regexp: "(^[1-9]\\d{4,9}$)|(^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$)", onerror: "QQ或MSN输入错误" });
    }); 
</script>
</asp:Content>
