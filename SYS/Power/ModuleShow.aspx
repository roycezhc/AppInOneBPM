<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="ModuleShow.aspx.cs" Inherits="SYS_Power_ModuleShow" %>
<%@ Import Namespace="AgileFrame.Core" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {

        var checker = new formChecker({ btnIDS: 'btnOK,_btnOK' });
    });

    function setpageDir(me) {
        var txt = $(me).parent().parent().next().find("input");
        if (txt.val() == "") {
            txt.val(me.value);
        }
    }

    function selTablePage(me) {
        var result = window.showModalDialog('../bill/billsel.aspx?r=' + Math.random(), 'newwindow', 'dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;');if (!result) {result = window.returnValue;}//jin-shenjian chrome刷新父画面
        if (result == undefined || result == '') return;
        var obj = eval(result);
        var hidUrl = $("input[id$='hidPageUrl']");
        var txtUrl = $("input[id$='txtPageUrl']");
        hidUrl.val("bill/billlist.aspx?billid=" + obj.ID);
        txtUrl.val("bill/billlist.aspx?billid=" + obj.ID);
    }
</script>
<style type="text/css">
.form dl dd input{width:300px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" style=" vertical-align:middle;">
<div class="titnav">
  <dl><dt><b><%=LanguageService.GetLanguageString("SystemMenuShow", "系统菜单预览")%></b></dt>
  <dd></dd></dl>

</div>

    <iframe src="<%=showPage %>" style="width:100%;height:500px"></iframe>

 </div>
</asp:Content>


