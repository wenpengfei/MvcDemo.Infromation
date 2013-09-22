using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Framework.Common.JsHelper
{
    public class TjWindow
    {
        #region Alert
        public static void Alert(string message, Control control = null, bool ajax = false)
        {
            DialogParameters dialogParameters = new DialogParameters()
            {
                Message = message,
            };
            Alert(dialogParameters,control,ajax);
        }
        public static void Alert(string title, string message, Control control = null, bool ajax = false)
        {
            DialogParameters dialogParameters = new DialogParameters()
            {
                Message = message,
                Title = title
            };
            Alert(dialogParameters,control,ajax);
        }
        public static void Alert(DialogParameters dialogParameters, Control control = null, bool ajax = false)
        {
            string json = dialogParameters.ToJson(PromptType.Alert);
            string script = "ymPrompt.alert(" + json + ");";
            RegisterStartupScript(script,control,ajax);
        }
        #endregion

        #region Succeed
        public static void Succeed(string message, Control control = null, bool ajax = false)
        {
            DialogParameters dialogParameters = new DialogParameters()
            {
                Message=message,
            };
            Succeed(dialogParameters,control,ajax);
        }
        public static void Succeed(string title, string message, Control control = null, bool ajax = false)
        {
            DialogParameters dialogParameters = new DialogParameters()
            {
                Message = message,
                Title=title
            };
            Succeed(dialogParameters,control,ajax);
        }
        public static void Succeed(DialogParameters dialogParameters, Control control = null, bool ajax = false)
        {
            string json = dialogParameters.ToJson(PromptType.Succeed);
            string script = "ymPrompt.succeedInfo(" + json + ");";
            RegisterStartupScript(script,control,ajax);
        }
        #endregion

        #region Error
        public static void Error(string message, Control control = null, bool ajax = false)
        {
            DialogParameters dialogParameters = new DialogParameters()
            {
                Message=message
            };
            Error(dialogParameters,control,ajax);
        }
        public static void Error(string title, string message, Control control = null, bool ajax = false)
        {
            DialogParameters dialogParameters = new DialogParameters()
            {
                Title=title,
                Message=message
            };
            Error(dialogParameters,control,ajax);
        }
        public static void Error(DialogParameters dialogParameters, Control control = null, bool ajax = false)
        {
            string json = dialogParameters.ToJson(PromptType.Error);;
            string script = "ymPrompt.errorInfo(" + json + ");";
            RegisterStartupScript(script,control,ajax);
        }
        #endregion

        #region Confirm
        public static void Confirm(string message, Control control = null, bool ajax = false)
        {
            DialogParameters dialogParameters = new DialogParameters()
            {
                Message = message,
            };
            Confirm(dialogParameters,control,ajax);
        }
        public static void Confirm(string message, string title, Control control = null, bool ajax = false)
        {
            DialogParameters dialogParameters = new DialogParameters()
            {
                Message = message,
                Title=title
            };
            Confirm(dialogParameters,control,ajax);
        }
        public static void Confirm(DialogParameters dialogParameters, Control control = null, bool ajax = false)
        {
            string json = dialogParameters.ToJson(PromptType.Confirm);
            string script = "ymPrompt.confirmInfo(" + json + ");";
            RegisterStartupScript(script,control,ajax);
        }
        #endregion

        #region Win
        public static void Win(string message, Control control = null, bool ajax = false)
        {
            DialogParameters dialogParameters = new DialogParameters()
            {
                Message = message,
            };
            Win(dialogParameters,control,ajax);
        }
        public static void Win(string message, string title, Control control = null, bool ajax = false)
        {
            DialogParameters dialogParameters = new DialogParameters()
            {
                Message = message,
                Title=title
            };
            Win(dialogParameters,control,ajax);
        }
        public static void Win(DialogParameters dialogParameters, Control control = null, bool ajax = false)
        {
            string json = dialogParameters.ToJson(PromptType.Win);
            string script = "ymPrompt.win(" + json + ");";
            RegisterStartupScript(script,control,ajax);
        }
        #endregion

        #region Helper
        public static void RegisterStartupScript(string script,Control control=null,bool ajax=false)
        {
            Page page = HttpContext.Current.CurrentHandler as Page;
            if (page == null)
            {
                return;
            }
            if (ajax)
            {
                if (control != null)
                {
                    ScriptManager.RegisterStartupScript(control, page.GetType(), Guid.NewGuid().ToString(), script, true);
                }
            }
            else
            {
                ClientScriptManager cs = page.ClientScript;
                cs.RegisterStartupScript(page.GetType(), Guid.NewGuid().ToString(), script, true);
            }
        }
        #endregion
    }
    
}