<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>UpdateKeyword</title>
</head>
<body>
    <div>
    <%
        var success=Convert.ToBoolean(ViewData["Success"]);
        if (success)
        {
            %>
            更新成功
            <%
        }
        else
        {
            Html.BeginForm();
            %>
            <input type="submit" value="更新关键字统计" />
            <%
            Html.EndForm();
        }
    %>
    </div>
</body>
</html>
