<%@ Control Language="C#" AutoEventWireup="true" Inherits="UCtrl_wucSelStaffs" CodeFile="wucSelStaffs.ascx.cs" %>
<div class="seluser">
<input id="hidStaffIDS" type="hidden" runat="server" />
<ol>
<asp:Literal ID="litEmps" runat="server"></asp:Literal>
</ol><a href="#" onclick="selEmps(this,'<%=dirPre %>','<%=selMore %>');">请选择</a>
</div>