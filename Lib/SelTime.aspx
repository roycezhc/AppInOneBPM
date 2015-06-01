<%@ Page Language="C#" StylesheetTheme="" AutoEventWireup="true" Inherits="Lib_SelTime" CodeFile="SelTime.aspx.cs" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>时间选择</title>
    <base target="_self" />
    <script src="JQuery/jquery.min.js" type="text/javascript"></script>
    <style type="text/css">
    .x-btn input{border:solid 1px #789; background:#eee;color:#666;}
    </style>
</head>
<body style=" width:100%; text-align:center;">
<script type="text/javascript">
    window.onload = function() {
        try {
            var str = window.dialogArguments;
            if (str && str != "") {
                var arr1 = str.split(' ');
                if (arr1[0].indexOf('日') != -1) {
                    arr1[0] = arr1[0].replace('日', '');
                    if (arr1[0].indexOf('月') != -1) {
                        arr1[0] = arr1[0].replace('月', '-');
                    }
                    if (arr1[0].indexOf('年') == -1) {
                        arr1[0] = new Date().getFullYear() + '年' + arr1[0];
                    }
                    arr1[0] = arr1[0].replace('年', '-');
                }
                document.getElementById("SimpleDateTime1_txtDate").value = arr1[0];
                if (arr1.length > 1) {
                    var arr2 = arr1[1].split(':');
                    document.getElementById("SimpleDateTime1_selHour").value = arr2[0];
                    if (arr2.length > 1) {
                        //                alert(parseInt(parseInt(arr2[1]) / 5));
                        var i1 = (parseInt(parseInt(arr2[1]) / 5)) * 5;
                        document.getElementById("SimpleDateTime1_selMinute").value = i1;
                        //                
                        //                if ('00,05,10,15,20,25,30,35,40,45,50,55'.indexOf(arr2[1]) == -1) {
                        //                    document.getElementById("SimpleDateTime1_selMinute").value = '00';
                        //                }
                        //                else
                        //                    document.getElementById("SimpleDateTime1_selMinute").value = arr2[1];
                    }
                }
            }
            //            
            //            document.getElementById("SimpleDateTime1_selMinute").style.display = 'none';
            //            document.getElementById("SimpleDateTime1_selHour").style.display = 'none';
            //            
        } catch (e) {
            alert(e.description);
        }
    }
   
</script>
    <form id="form1" runat="server">
    <input id="hidOld" type="hidden" runat="server" />
    <div style="margin:20px auto auto auto;width:400px;padding:20px;font-size:12px;border:solid 1px #ddd;">
    <div>
    <fieldset style="">
    <legend>请选择</legend>
    <WebCtrl:SimpleDateTime ID="SimpleDateTime1" runat="server" />
    </fieldset>
    </div>
    <div style="margin-top:50px;">
    <a href="#" class="x-btn"><span>
        <asp:Button ID="btnOK" runat="server" Text="确定" onclick="btnOK_Click" /></span></a>
    <a href="#" class="x-btn"><span>
        <input id="btnCancel" type="button" value="取消" onclick="window.close();" /></span></a>
    </div>
    </div>
    <script src="MyDP/seldate.js" type="text/javascript"></script>
    </form>
</body>
</html>
