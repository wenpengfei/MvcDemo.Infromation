using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Framework.Common.JsHelper
{
    public static class DialogParametersExtensions
    {
        public static string ToJson(this DialogParameters dialogParameters,PromptType promptType)
        {
            string json = "{";
            if (string.IsNullOrWhiteSpace(dialogParameters.Title))
            {
                if (promptType == PromptType.Alert)
                {
                    json += "title:'提示'";
                }
                if (promptType == PromptType.Succeed)
                {
                    json += "title:'成功'";
                }
                if (promptType == PromptType.Error)
                {
                    json += "title:'错误'";
                }
                if (promptType == PromptType.Confirm)
                {
                    json += "title:'确认'";
                }
                if (promptType == PromptType.Win)
                {
                    json += "title:'窗口'";
                }
            }
            else
            {
                json += "title:'" + dialogParameters.Title + "'";
            }

            if (!string.IsNullOrEmpty(dialogParameters.Message))
            {
                json += ",message:'" + dialogParameters.Message + "'";
            }

            if (dialogParameters.Width.HasValue)
            {
                json += ",width:" + dialogParameters.Width + "";
            }

            if (dialogParameters.Height.HasValue)
            {
                json += ",height:" + dialogParameters.Height + "";
            }

            if (dialogParameters.AllowRightMenu.HasValue)
            {
                json += ",allowRightMenu:"+dialogParameters.AllowRightMenu.ToString().ToLower()+"";
            }
            if (dialogParameters.AllowSelect.HasValue)
            {
                json += ",allowSelect:"+dialogParameters.AllowSelect.ToString().ToLower()+"";
            }
            if (dialogParameters.AutoClose.HasValue)
            {
                json += ",autoClose:"+dialogParameters.AutoClose.ToString().ToLower()+"";
            }
            if (!string.IsNullOrWhiteSpace(dialogParameters.Btn))
            {
                json += ",btn:" + dialogParameters.Btn + "";
            }
            if (dialogParameters.CancelTxt != null)
            {
                json += ",cancelTxt:'" + dialogParameters.CancelTxt + "'";
            }
            if (dialogParameters.CloseBtn.HasValue)
            {
                json += ",closeBtn:" + dialogParameters.CloseBtn.ToString().ToLower() + "";
            }
            if (dialogParameters.CloseTxt != null)
            {
                json += ",closeTxt:'" + dialogParameters.CloseTxt + "'";
            }
            if (dialogParameters.DragOut.HasValue)
            {
                json += ",dragOut:" + dialogParameters.DragOut.ToString().ToLower() + "";
            }
            if (dialogParameters.FixPosition.HasValue)
            {
                json += ",fixPosition:" + dialogParameters.FixPosition.ToString().ToLower() + "";
            }
            if (!string.IsNullOrWhiteSpace(dialogParameters.IcoCls))
            {
                json += ",icoCls:'" + dialogParameters.IcoCls + "'";
            }
            if (dialogParameters.Iframe.HasValue)
            {
                json += ",iframe:" + dialogParameters.Iframe.ToString().ToLower() + "";
            }
            if (dialogParameters.MaskAlpha.HasValue)
            {
                json += ",maskAlpha:" + dialogParameters.MaskAlpha + "";
            }
            if (!string.IsNullOrWhiteSpace(dialogParameters.MaskAlphaColor))
            {
                json += ",maskAlphaColor:'" + dialogParameters.MaskAlphaColor + "'";
            }
            if (dialogParameters.MaxBtn.HasValue)
            {
                json += ",maxBtn:" + dialogParameters.MaxBtn.ToString().ToLower() + "";
            }
            if (dialogParameters.MaxTxt != null)
            {
                json += ",maxTxt:'" + dialogParameters.MaxTxt + "'";
            }
            if (dialogParameters.MinBtn.HasValue)
            {
                json += ",minBtn:" + dialogParameters.MinBtn.ToString().ToLower() + "";
            }
            if (dialogParameters.MinTxt != null)
            {
                json += ",minTxt:'" + dialogParameters.MinTxt + "'";
            }
            if (!string.IsNullOrWhiteSpace(dialogParameters.MsgCls))
            {
                json += ",msgCls:'" + dialogParameters.MsgCls + "'";
            }
            if (dialogParameters.OKTxt != null)
            {
                json += ",okTxt:'" + dialogParameters.OKTxt + "'";
            }
            if (dialogParameters.ShowMask.HasValue)
            {
                json += ",showMask:" + dialogParameters.ShowMask.ToString().ToLower() + "";
            }
            if (dialogParameters.ShowShadow.HasValue)
            {
                json += ",showShadow:" + dialogParameters.ShowShadow.ToString().ToLower() + "";
            }
            if (!string.IsNullOrWhiteSpace(dialogParameters.SlideCfg))
            {
                json += ",slideCfg:" + dialogParameters.SlideCfg + "";
            }
            if (dialogParameters.TitleBar.HasValue)
            {
                json += ",titleBar:" + dialogParameters.TitleBar.ToString().ToLower() + "";
            }
            if (dialogParameters.UseSlide.HasValue)
            {
                json += ",useSlide:" + dialogParameters.UseSlide.ToString().ToLower() + "";
            }
            if (dialogParameters.WinAlpha.HasValue)
            {
                json += ",winAlpha:" + dialogParameters.WinAlpha + "";
            }
            //if (!string.IsNullOrWhiteSpace(dialogParameters.WinPos))
            //{
            //    json += ",winPos:'" + dialogParameters.WinPos + "'";
            //}
            if (dialogParameters.WinPos != WinPos.Center)//默认为页面中间
            {
                switch (dialogParameters.WinPos)
                {
                    case WinPos.Bottom:
                        json += ",winPos:'b'";
                        break;
                    case WinPos.Left:
                        json += ",winPos:'l'";
                        break;
                    case WinPos.LeftBottom:
                        json += ",winPos:'lb'";
                        break;
                    case WinPos.LeftTop:
                        json += ",winPos:'lt'";
                        break;
                    case WinPos.Right:
                        json += ",winPos:'r'";
                        break;
                    case WinPos.RightBottom:
                        json += ",winPos:'rb'";
                        break;
                    case WinPos.RightTop:
                        json += ",winPos:'rt'";
                        break;
                    case WinPos.Top:
                        json += ",winPos:'t'";
                        break;
                    default:
                        break;
                }
            }
            json += "}";
            return json;
        }
        
    }
}