<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/SaleBaseMasterPage.master" Inherits="System.Web.Mvc.ViewPage<Infomation.Core.ISale>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="PublishCount" runat="server">
</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="Rows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 供 求： </td> 
    <td class="checkpb">  
        <label> <input class="base" onclick="change1(this)" type="radio" name="type" id="type_0" f="{0}" value='0' checked /><span>提供帮助</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <label> <input class="base" onclick="change1(this)" type="radio" name="type" id="type_1" f="{0}" value='1'  /><span>需要帮助</span></label>&nbsp;&nbsp;&nbsp;&nbsp;  
        <span id="type_Tip"></span> 
    </td> 
</tr> 
<tr> 
    <td class="t"> <b class="red">*</b> 标 题： </td> 
    <td> <input type="text" name="Title" id="Title" value='' class="text1"  maxLength=25 /> <span id="Title_Tip"></span> </td> 
</tr>
<tr id="trprice"> 
    <td class="t"> 收 费： </td> 
    <td class="checkpb"> 
        <input class="text3 gray" type="text" id="MinPrice" f="{0}元" name="MinPrice" value='面议'  Except='面议'  maxLength=5/> 元<span id="MinPrice_Tip"></span> 
    </td> 
</tr> 
<tr id="trxiaoqu"> 
    <td class="t"> 所在小区： </td> 
    <td> 
        <input class="text2" type="text" id="xiaoqu" name="quanjuxiaoqu" value='' 
        Except='null'  maxLength=30/> 
        <span id="xiaoqu_Tip"></span> 
        <input type="hidden" name="xiaoqu" id="hidxiaoqu" value='' />
        <input type="hidden" name="gongjiaoxian" id="gongjiaoxian" value='' />
        <input type="hidden" name="gongjiaozhan" id="gongjiaozhan" value='' />
        <input type="hidden" name="ditiexian" id="ditiexian" value='' />
        <input type="hidden" name="ditiezhan" id="ditiezhan" value='' />
        <input type="hidden" name="daxue" id="daxue" value='' /> 
        <input type="hidden" name="dizhi" id="dizhi" value='' class="text1" /> 
    </td> 
</tr>

</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="OtherRows" runat="server">
<tr> 
    <td class="t"> <b class="red">*</b> 标签： </td> 
    <td> <input type="text" name="biaoqian" id="biaoqian" value='' class="text2"  maxLength=20 /> &nbsp; <a href="javascript:void(showtaglist());">参考标签&raquo;</a> <span id="biaoqian_Tip"></span> </td> 
</tr> 
<tr id="trBiaoqian" style="display:none;"> 
    <td class="t"> </td> 
    <td id="tdBiaoqian"> 
        <div class="tagbox"> 
            <span class="tagboxclose">
                <a name="close" href="javascript:void(showtaglist());">X</a>
            </span> 
            <span>生活类：</span> 
                <a href="#">做菜</a>　 
                <a href="#">化妆</a>　 
                <a href="#">投资</a>　 
                <a href="#">开网店</a>　 
                <a href="#">旅游</a>　 
                <a href="#">手工</a>　 
                <a href="#">服饰搭配</a>　 
                <a href="#">人际交流</a>　 
                <a href="#">幽默</a>　 
                <a href="#">礼仪</a>　 
                <a href="#">十字绣</a>　 
                <a href="#">礼品建议</a>　 
                <a href="#">恋爱</a>　 
                <a href="#">聊天</a>　 
                <a href="#">购物</a>　 
                <a href="#">网游</a>　 
                <a href="#">笑话</a>　 
                <a href="#">倾诉</a>　 
                <a href="#">陪聊</a>　 
                <a href="#">旅游</a>　 
                <a href="#">写作</a>　 
                <a href="#">翻译</a>　 
                <a href="#">软文</a>　 
                <a href="#">论文</a>　 
                <a href="#">广告</a>　 
                <a href="#">打字</a>　 
                <hr /> <span>技术类：</span> <a href="#">电脑</a>　 <a href="#">CAD</a>　 <a href="#">网站</a>　 <a href="#">软件</a>　 <a href="#">wordpress</a>　 <a href="#">翻墙</a>　 <a href="#">discuz</a>　 <a href="#">系统</a>　 <a href="#">语言</a>　 <a href="#">苹果越狱</a>　 <a href="#">代写电脑配置单</a>　 <a href="#">图片处理</a>　 <a href="#">手工</a>　 <a href="#">广告</a>　 <a href="#">营销</a>　 <a href="#">宣传</a>　 <a href="#">微博</a>　 <a href="#">推广</a>　 <a href="#">seo</a>　 <a href="#">策划</a> <hr /> <span>其他类：</span> <a href="#">行善</a>　 <a href="#">慈善</a>　 <a href="#">帮助需要的人</a>　 <a href="#">捐助</a>　 <a href="#">聊天</a>　 <a href="#">测梦</a>　 <a href="#">万字</a> </div>  </td> </tr>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var sale = new SaleService();
        sale.Type = parseInt(getRadioValue("type"), 10) + 1;
        sale.Title = $("#Title").val();
        sale.Price = $("#MinPrice").val();
        if (sale.Price == "" || sale.Price == "面议") {
            sale.Price = 0;
        }
        else {
            sale.Price = parseInt(sale.Price, 10);
        }
        sale.District = $("#xiaoqu").val();
        sale.Tags = $("#biaoqian").val();
        BaseFillData(sale);
        sale.Id = -1;
        sale.DateCreated = new Date().toJson(true);
        sale.DateModified = sale.DateCreated;
        sale.Insert(onSuccess, onFailed);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#ContentLabel").text("详细描述");
        $("#IsBiz").css("display", "none");
        $("#spIsBiz").css("display", "none");
        initTagEvent();
        $('#xiaoqu').bind('keyup', function () { $('#dizhi').val(''); });
        $("#Title").formValidator({ tipid: "Title_Tip", onfocus: "6-25个字，不能填写电话和特殊符号<br/>标题将被展示在详情页和列表页最醒目的位置", q2b: true }).inputValidator({ onerror: "请输入标题" }).regexValidator({ regexp: "^[\\s\\S]*$#^[\\s\\S]{6,}$#^(.){6,25}$", onerror: "请输入标题#标题不足6个字#6-25个字，不能填写电话和特殊符号！" }).functionValidator({ fun: function (val, elem) { return $.formValidator.checkTitle(val); }, onerror: "标题太过简单" });
        $("#MinPrice").formValidator({ tipid: "MinPrice_Tip", onfocus: "只能填写数字", q2b: true, 'defaultvalue': '面议' }).inputValidator({ onerror: "请正确填写价格" }).regexValidator({ regexp: "^\\S+$#^[1-9]\\d{0,4}$", onerror: "请正确填写价格#价格为整数，且不能为0" });
        $("#xiaoqu").formValidator({ tipid: "xiaoqu_Tip", onfocus: "1~30个字，不能填写电话和特殊符号", 'empty': true, q2b: true, 'empty': true }).inputValidator({ onerror: "请输入物品所在小区" }).regexValidator({ regexp: "^((?!电话|手机|联系方式|号码).)*$", onerror: "小区里不能填写电话" }).functionValidator({ fun: function (val, elem) { $('#tooltip1div').hide(); var r = $.formValidator.IsNum(val); return !r; }, onerror: "小区不能为纯数字" });
        $('#biaoqian').formValidator({ tipid: 'biaoqian_Tip', onfocus: "", q2b: true }).regexValidator({ regexp: "^\\S+$#^((\\d|[\\u4e00-\\u9fa5]|[a-zA-Z]|[，,])){1,20}$", onerror: "请输入标签#标签最大只允许输入20个字" });
    });
    //    function toChange() { var index = $.c.common.getRadioIndex('type'); switch (index) { case 0: $('#pdv').show(); break; case 1: $('#pdv').hide(); break; } }
    function showtaglist() { if ($('#tdBiaoqian:visible').length > 0) { $('#trBiaoqian').hide(); $('#tdBiaoqian').hide(); } else { $('#trBiaoqian').show(); $('#tdBiaoqian').show(); } } function initTagEvent() { var obj = $('#trBiaoqian a[name!="close"]'); obj.each(function (i, n) { $(n).attr('href', 'javascript:void(0);'); }); var _maxlength = $('#biaoqian').attr('maxlength'); obj.click(function () { var maxlen = 30; if (!isNaN(_maxlength)) { maxlen = parseInt(_maxlength); } var _val = $('#biaoqian').val(); var curlen = _val.length; var str = $(this).html(); var newlen = curlen + str.length; if (newlen < maxlen) { if (_val.length == 0) { $('#biaoqian').val(str); } else { $('#biaoqian').val($('#biaoqian').val() + ',' + str); } } }); }
</script>
</asp:Content>
