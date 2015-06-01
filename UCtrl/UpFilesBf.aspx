<%@ Page Language="C#" AutoEventWireup="true" Inherits="UCtrl_UpFilesBf" CodeFile="UpFilesBf.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>文件上传</title>
<script src="../Lib/JQuery/jquery.min.js" type="text/javascript"></script>
<script src="../Lib/JScript/MyJsCore.js" type="text/javascript"></script>
<script type="text/javascript">
    var pDivID = "";
    function valueChg(el,divID) {
        pDivID = divID;
        var str = el.value.toLowerCase();
        var lawfiles = parent.getLawFiles_UpBf(divID).toLowerCase(); //  
        //alert(lawfiles);
        if (isLawFile(str, lawfiles)) {
            var path = window.parent.getPrePath_UpBf(pDivID);//var sss = new String();sss.toLowerCase
            if (path == "") {
                alert("未配置好文件存放路径，将会放在跟目录下。");
            }
            $("#hidPrePath").val(path);
            window.parent.showWindow_UpBf(400, 50, pDivID);
            $("input[id$='btnUpload']").trigger("click");
        } else {
            alert("请选择适合的文件，如：" + lawfiles);
        }
    }

function AddFileToParent(name,DivID) {
    window.document.close();
    window.parent.AddFile_UpBf(name, DivID);
  
}

function closeBarWindow(DivID) {
   window.document.close();
   window.parent.closeBarWindow_UpBf(DivID);
   
}
function addFile(el) {
    var file = $("input[id$='FileUpload1']");
    file.trigger("click");
}

</script>
</head>
<body style="text-align:left;margin:0;padding:0;background:#eee;font-size:12px;">
    <form id="form1" runat="server">
    <asp:Button ID="btnUpload" runat="server" Text="上传" Visible="true"  OnClick="btnUpload_Click" CausesValidation="false" Height="20px"/>
    <asp:FileUpload ID="FileUpload1" runat="server" style="background:#999;border:solid 1px #669;margin-left:-3px;float:left;width:200px;" />
    <input id="hidPrePath" name="PrePath" type="hidden" style="float:left;"/><span style="padding:5px 0 0 15px;float:left;">(上传附件最大为10M)</span>
    </form>
</body>
</html>
