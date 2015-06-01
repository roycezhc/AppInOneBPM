<%@ Control Language="C#" AutoEventWireup="true" Inherits="UCtrl_wucSelStaff" CodeFile="wucSelStaff.ascx.cs" %>
<span>
    <%=LeftText %>
    <input id="txtStaff_NAME"  class="selshowinput" readonly="readonly"  runat="server" type="text" style="width:70%;float:left;" />
    <input id="hidStaff_ID" type="hidden"  runat="server"/>
    <input id="btnSelStaff" runat="server" class="sel" type="button" onclick="selStaff(this);" value="" style="float:right;" />
</span>