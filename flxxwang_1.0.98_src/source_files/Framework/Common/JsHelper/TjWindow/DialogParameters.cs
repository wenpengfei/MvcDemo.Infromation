using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Framework.Common.JsHelper
{
    public class DialogParameters
    {
        /// <summary>
        /// 消息组件要显示的内容，默认为“内容”。
        /// </summary>
        public string Message
        {
            get;
            set;
        }
        /// <summary>
        /// 消息框的宽度，默认为300。
        /// </summary>
        public int? Width
        {
            get;
            set;
        }
        /// <summary>
        /// 消息框的高度，默认为185。
        /// </summary>
        public int? Height
        {
            get;
            set;
        }
        /// <summary>
        /// 消息组件标题，默认为“标题”
        /// </summary>
        public string Title
        {
            get;
            set;
        }
        ///// <summary>
        ///// 回调函数。当确定/取消/关闭按钮被点击时会触发该函数并传入点击的按钮标识。如ok代表确定，cancel代表取消，close代表关闭
        ///// </summary>
        //public string Handler
        //{
        //    get;
        //    set;
        //}
        
        /// <summary>
        /// 遮罩的颜色，默认为黑色。
        /// </summary>
        public string MaskAlphaColor
        {
            get;
            set;
        }
        /// <summary>
        /// 遮罩的透明度，默认为0.1。
        /// </summary>
        public double? MaskAlpha
        {
            get;
            set;
        }
        /// <summary>
        /// icoCls：图标类型。传入的内容为className，具体写法可以参考ymprompt.css中对图标的定义方式。默认为空。
        /// </summary>
        public string IcoCls
        {
            get;
            set;
        }
        /// <summary>
        /// 按钮定义。传入的是数组形式。每个按钮的格式为['按钮文本','按钮标识']，
        /// 如[['确定','ok'],['取消','cancel'],['关闭','close']]等。 
        /// 注意单个按钮应该是这样的：[['确定','ok']]
        /// </summary>
        public string Btn
        {
            get;
            set;
        }
        /// <summary>
        /// 设定用户点击窗口中按钮后自动关闭窗口，默认为true（设定为false后程序中可以通过调用close方法关闭）。
        /// </summary>
        public bool? AutoClose
        {
            get;
            set;
        }
        /// <summary>
        /// 设定是否弹出框随滚动条一起浮动，保持在屏幕的固定位置，默认为true
        /// </summary>
        public bool? FixPosition
        {
            get;
            set;
        }
        /// <summary>
        /// 设定是否允许拖出屏幕范围，默认为false
        /// </summary>
        public bool? DragOut
        {
            get;
            set;
        }
        /// <summary>
        /// 是否显示标题栏，默认显示。注意，如果没有标题栏需要自己在程序中控制关闭。
        /// </summary>
        public bool? TitleBar
        {
            get;
            set;
        }
        /// <summary>
        /// 是否显示遮罩层，默认为true
        /// </summary>
        public bool? ShowMask
        {
            get;
            set;
        }
        /// <summary>
        /// 弹出窗口的位置，支持8种内置位置（c,l,t,r,b,lt,rt,lb,rb）及自定义窗口坐标,默认为c。 
        /// 各参数意义：c:页面中间,l:页面左侧,t:页面顶部,r:页面右侧,b:页面底部,lt:左上角,rt:右上角,lb:左下角,rb:右下角
        /// </summary>
        //public string WinPos
        //{
        //    get;
        //    set;
        //}
        public WinPos WinPos
        {
            get;
            set;
        }
        /// <summary>
        /// 弹出窗体拖动时的透明度，默认为0.8
        /// </summary>
        public double? WinAlpha
        {
            get;
            set;
        }
        /// <summary>
        /// 是否使用iframe方法加载内容，该属性如果为true或者object，组件则尝试将message内容作为url进行加载(如果属性值为一个object，则将object的内容添加为iframe的属性，如iframe:{id:'myId',name:'myName',src:'http://www.baidu.com'}则iframe的id为myId,name为myName,src为http://www.baidu.com)。默认为false。 
        /// </summary>
        public bool? Iframe
        {
            get;
            set;
        }
        /// <summary>
        /// 是否显示关闭按钮，默认为true（显示）
        /// </summary>
        public bool? CloseBtn
        {
            get;
            set;
        }
        /// <summary>
        /// 是否启用弹出框阴影效果（IE Only），默认为false
        /// </summary>
        public bool? ShowShadow
        {
            get;
            set;
        }
        /// <summary>
        /// 是否启用弹出框的渐显渐隐效果，默认为false
        /// </summary>
        public bool? UseSlide
        {
            get;
            set;
        }
        /// <summary>
        /// 渐变效果的配置信息,参数格式为object，属性包括incerment:透明度每次增加的值，interval:变化的速度。例如：{incerment:0.3,interval:50}。该参数仅在useSlide为true时有效
        /// </summary>
        public string SlideCfg
        {
            get;
            set;
        }
        /// <summary>
        /// 关闭按钮的文本描述（鼠标放在关闭按钮上时显示），默认为“关闭”
        /// </summary>
        public string CloseTxt
        {
            get;
            set;
        }
        /// <summary>
        /// 确定按钮的文本描述，默认为“确定”
        /// </summary>
        public string OKTxt
        {
            get;
            set;
        }
        /// <summary>
        /// 取消按钮的文本描述，默认为“取消”
        /// </summary>
        public string CancelTxt
        {
            get;
            set;
        }
        public string MsgCls
        {
            get;
            set;
        }
        /// <summary>
        /// 是否显示最小化按钮，默认为false
        /// </summary>
        public bool? MinBtn
        {
            get;
            set;
        }
        /// <summary>
        /// 最小化按钮的文本描述，默认为“最小化”
        /// </summary>
        public string MinTxt
        {
            get;
            set;
        }
        /// <summary>
        /// 是否显示最大化按钮，默认为false
        /// </summary>
        public bool? MaxBtn
        {
            get;
            set;
        }
        /// <summary>
        /// 最大化按钮的文本描述，默认为“最大化”
        /// </summary>
        public string MaxTxt
        {
            get;
            set;
        }
        /// <summary>
        /// 是否允许选择消息框内容，默认为false
        /// </summary>
        public bool? AllowSelect
        {
            get;
            set;
        }
        /// <summary>
        /// 是否允许在消息框中使用右键，默认为false
        /// </summary>
        public bool? AllowRightMenu
        {
            get;
            set;
        }

    }
}