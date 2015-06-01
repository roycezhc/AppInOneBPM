<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="BILL_BillEdit" CodeFile="BillEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Lib/JScript/formCheck.js" type="text/javascript"></script>
 <script src="../Lib/MyDP/selDate.js" type="text/javascript"></script>
  <script src="lib/billEdit.js" type="text/javascript"></script>
 <script type="text/javascript">


     $(function () {
         var checker = new formChecker({ formID: "divForm", btnIDS: 'btnOK,btnSave' });
     });


     function selFileChg(me) {

     }

     function closeMe(me) {
         //alert(window.location);
         if (window.location == undefined || window.location.href == undefined || window.location.href.toString().indexOf("modlg=1") != -1) {
             window.close();
         } else {
             window.location.href = '<%=backUrl %>';
         }
     }
       
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main">
    <input id="hidAppPath" type="hidden" runat="server"/>
<input id="hidDetailRows" type="hidden" runat="server" />
   <div class="titnav">
        <dl><dt><b>单据提交</b></dt></dl>
     </div>
     
   <div class="warn">
    <asp:Label ID="litWarn" runat="server" Text=""></asp:Label>
   </div>
   <div class="tbill" id="divForm">
       <table>
        <tbody>
           <asp:Literal ID="litBillForm" runat="server"></asp:Literal></tbody>
       </table>
    </div>

   <div class="tool">
        <p><span><asp:Button ID="btnSave" runat="server" Text="确定保存"
                        onclick="btnOK_Click"/></span>
            <span id="sp_Back" runat="server"><input onclick="closeMe(this);" lang="CloseWin" value="取消" type="button" /></span>
        </p>
  </div>
</div>
</asp:Content>

