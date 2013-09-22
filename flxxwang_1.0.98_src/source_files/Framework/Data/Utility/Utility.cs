using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace Framework.Utility
{
    public class ControlsUtility
    {
        /// <summary>
        /// 下拉框中的项带有颜色，此功能通常用来通过下拉框选择颜色。
        /// </summary>
        /// <param name="DDL"></param>
        public static void BindDropDownListColor(DropDownList DDL)
        {
            DDL.Items.Clear();

            ListItem li0 = new ListItem();
            li0.Text = "选择字体颜色．．．"; li0.Value = "";
            DDL.Items.Add(li0);

            ListItem li1 = new ListItem();
            li1.Text = "古董白"; li1.Value = "#FAEBD7"; li1.Attributes["style"] = "color:#FAEBD7";//通过生成的HTML代码分析发现这样做的。 //li1.Attributes["color"]="#FAEBD7";
            DDL.Items.Add(li1);

            ListItem li2 = new ListItem();
            li2.Text = "浅绿色"; li2.Value = "#00FFFF"; li2.Attributes["style"] = "color:#00FFFF";
            DDL.Items.Add(li2);

            ListItem li3 = new ListItem();
            li3.Text = "碧绿色"; li3.Value = "#7FFFD4"; li3.Attributes["style"] = "color:#7FFFD4";
            DDL.Items.Add(li3);

            ListItem li4 = new ListItem();
            li4.Text = "桔黄色"; li4.Value = "#FFE4C4"; li4.Attributes["style"] = "color:#FFE4C4";
            DDL.Items.Add(li4);

            ListItem li5 = new ListItem();
            li5.Text = "黑色"; li5.Value = "#000000"; li5.Attributes["style"] = "color:#000000";
            DDL.Items.Add(li5);

            ListItem li6 = new ListItem();
            li6.Text = "蓝色"; li6.Value = "#0000FF"; li6.Attributes["style"] = "color:#0000FF";
            DDL.Items.Add(li6);

            ListItem li7 = new ListItem();
            li7.Text = "紫罗兰色"; li7.Value = "#8A2BE2"; li7.Attributes["style"] = "color:#8A2BE2";
            DDL.Items.Add(li7);

            ListItem li8 = new ListItem();
            li8.Text = "古董白"; li8.Value = "#FAEBD7"; li8.Attributes["style"] = "color:#FAEBD7";
            DDL.Items.Add(li8);

            ListItem li9 = new ListItem();
            li9.Text = "浅绿色"; li9.Value = "#00FFFF"; li9.Attributes["style"] = "color:#00FFFF";
            DDL.Items.Add(li9);

            ListItem li10 = new ListItem();
            li10.Text = "碧绿色"; li10.Value = "#7FFFD4"; li10.Attributes["style"] = "color:#7FFFD4";
            DDL.Items.Add(li10);

            ListItem li11 = new ListItem();
            li11.Text = "桔黄色"; li11.Value = "#FFE4C4"; li11.Attributes["style"] = "color:#FFE4C4";
            DDL.Items.Add(li11);

            ListItem li12 = new ListItem();
            li12.Text = "褐色"; li12.Value = "#A52A2A"; li12.Attributes["style"] = "color:#A52A2A";
            DDL.Items.Add(li12);

            ListItem li13 = new ListItem();
            li13.Text = "巧可力色"; li13.Value = "#D2691E"; li13.Attributes["style"] = "color:#D2691E";
            DDL.Items.Add(li13);

            ListItem li14 = new ListItem();
            li14.Text = "菊兰色"; li14.Value = "#6495ED"; li14.Attributes["style"] = "color:#6495ED";
            DDL.Items.Add(li14);

            ListItem li15 = new ListItem();
            li15.Text = "珊瑚色"; li15.Value = "#FF7F50"; li15.Attributes["style"] = "color:#FF7F50";
            DDL.Items.Add(li15);

            ListItem li16 = new ListItem();
            li16.Text = "暗蓝色"; li16.Value = "#00008B"; li16.Attributes["style"] = "color:#00008B";
            DDL.Items.Add(li16);

            ListItem li17 = new ListItem();
            li17.Text = "亮肉色"; li17.Value = "#FFA07A"; li17.Attributes["style"] = "color:#FFA07A";
            DDL.Items.Add(li17);

            ListItem li18 = new ListItem();
            li18.Text = "红色"; li18.Value = "#FF0000"; li18.Attributes["style"] = "color:#FF0000";
            DDL.Items.Add(li18);

            ListItem li19 = new ListItem();
            li19.Text = "绿色"; li19.Value = "#00FF00"; li19.Attributes["style"] = "color:#00FF00";
            DDL.Items.Add(li19);

            ListItem li120 = new ListItem();
            li120.Text = "间暗蓝色"; li120.Value = "#7B68EE"; li120.Attributes["style"] = "color:#7B68EE";
            DDL.Items.Add(li120);

            ListItem li121 = new ListItem();
            li121.Text = "黄金"; li121.Value = "#ff8800"; li121.Attributes["style"] = "color:#ff8800";
            DDL.Items.Add(li121);

            ListItem li122 = new ListItem();
            li122.Text = "春草"; li122.Value = "#50b000"; li122.Attributes["style"] = "color:#50b000";
            DDL.Items.Add(li122);

            ListItem li123 = new ListItem();
            li123.Text = "卡布"; li123.Value = "#CCAA00"; li123.Attributes["style"] = "color:#CCAA00";
            DDL.Items.Add(li123);

            ListItem li124 = new ListItem();
            li124.Text = "橄榄"; li124.Value = "#008800"; li124.Attributes["style"] = "color:#008800";
            DDL.Items.Add(li124);

            ListItem li125 = new ListItem();
            li125.Text = "篮紫"; li125.Value = "#8800FF"; li125.Attributes["style"] = "color:#8800FF";
            DDL.Items.Add(li125);

            ListItem li126 = new ListItem();
            li126.Text = "夜幕"; li126.Value = "#111111"; li126.Attributes["style"] = "color:#111111";
            DDL.Items.Add(li126);

            ListItem li127 = new ListItem();
            li127.Text = "紫金"; li127.Value = "#FF88FF"; li127.Attributes["style"] = "color:#FF88FF";
            DDL.Items.Add(li127);

            ListItem li128 = new ListItem();
            li128.Text = "咖啡"; li128.Value = "#880000"; li128.Attributes["style"] = "color:#880000";
            DDL.Items.Add(li128);

            ListItem li129 = new ListItem();
            li129.Text = "海洋"; li129.Value = "#0088FF"; li129.Attributes["style"] = "color:#0088FF";
            DDL.Items.Add(li129);

            ListItem li130 = new ListItem();
            li130.Text = "流金"; li130.Value = "#AAAA00"; li130.Attributes["style"] = "color:#AAAA00";
            DDL.Items.Add(li130);

            ListItem li131 = new ListItem();
            li131.Text = "发紫"; li131.Value = "#FF00FF"; li131.Attributes["style"] = "color:#FF00FF";
            DDL.Items.Add(li131);

            ListItem li132 = new ListItem();
            li132.Text = "过蓝"; li132.Value = "#8888FF"; li132.Attributes["style"] = "color:#8888FF";
            DDL.Items.Add(li132);

            ListItem li133 = new ListItem();
            li133.Text = "暗示"; li133.Value = "#FF0088"; li133.Attributes["style"] = "color:#FF0088";
            DDL.Items.Add(li133);

        }
        /// <summary>
        /// 给通过BindDropDownListColor()设置颜色的下拉框恢复颜色。当只在页面不是回执时通过BindDropDownListColor()函数绑定下拉框时，当页面回发时颜色会消失，此时可在页面回执时调用此函数恢复颜色。
        /// </summary>
        /// <param name="DDL"></param>
        public static void RecoverDropdownlistColor(DropDownList DDL)//恢复颜色，配合BindDropDownListColor()使用。
        {
            for (int i = 0; i < DDL.Items.Count; i++)
            {
                DDL.Items[i].Attributes["style"] = "color:" + DDL.Items[i].Value;
            }
        }
    }
}
