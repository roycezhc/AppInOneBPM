<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="BILL_BillList" CodeFile="BillList.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script src="../Lib/MyDP/seldate.js" type="text/javascript"></script>
    <script src="lib/billList.js" type="text/javascript"></script>
    <script src="lib/billEdit.js" type="text/javascript"></script>

    <script type="text/javascript">
        var manager = new ListManager({ valIndex: 1 });
        $(function () {
            manager.initBodyRows();
            manager.initFindDL();
            //manager.initPageSizeEvt("txtPageNum");
            //bindWinResize(40);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main">
 <input id="hidAppPath" type="hidden" runat="server"/>
 <div class="titnav">
     <input id="hidCondition" type="hidden" runat="server" />
    <dl><dt><b>单据列表</b></dt><dd>
    </dd></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal> </div>
   <div class="topfind">
   <asp:Literal ID="litFind" runat="server"></asp:Literal>
   <dl class="btn"><dt></dt><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="查询" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="清空" onclick="_topFindClear(this);"/></span>
       </dd>
   </dl>
   <div class="clear"></div>
</div>
<div class="tool">
  <ol>
      <li><span class="btn"><input power="showDetail" id="btn_Show" type="button" value="查看详细" onclick="manager.showRecord('BillShow.aspx?BillID=<%=BillID %>');" /></span></li>
      <li><span class="btn"><input power="NewStaff" id="btn_New" type="button" value="新建" onclick="manager.newRecord('BillEdit.aspx?BillID=<%=BillID %>');" /></span></li>
      <li><span class="btn"><input power="EditStaff" id="btn_Edit" type="button" value="编辑" onclick="manager.editRecord('BillEdit.aspx?BillID=<%=BillID %>');" /></span></li>
      <li><span class="btn"><input power="DeleteStaffs" id="btn_Dels" type="button" value="删除" onclick="manager.delByKeyID('BillBack.aspx?BillID=<%=BillID %>');" /></span></li>

  </ol>
</div>
<div class="tblist" id="tbList">
 <table>
     <asp:Literal ID="litList" runat="server"></asp:Literal>
 </table>
</div>

</div>
</asp:Content>

