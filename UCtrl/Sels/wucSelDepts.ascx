<%@ Control Language="C#" AutoEventWireup="true" Inherits="UCtrl_wucSelDepts" CodeFile="wucSelDepts.ascx.cs" %>
<div class="seluser">
<input id="hidDptIDS" type="hidden" runat="server" />
<ol><asp:Literal ID="litEmps" runat="server"></asp:Literal></ol><a href="#" onclick="selDpts(this,'<%=dirPre %>','<%=selMore %>');">请选择</a>
</div>