<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Post/JobSeekMasterPage.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="PostScript" runat="server">
<script type="text/javascript">
    function post() {
        var job = new JobSeek();
        FillData(job);
        job.Id = -1;
        job.DateCreated = new Date().toJson(true);
        job.DateModified = job.DateCreated;

        gsInfo.postResume(function (result) {
            if (result) {
                if (job.ResumeId == -1 && $f.isObject(result)) {
                    job.ResumeId = result.Id;
                }
                job.Insert(onSuccess, onFailed);
            }
            else {
                onFinished();
            }
        });
    }
</script>
</asp:Content>
