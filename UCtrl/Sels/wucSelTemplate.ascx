<%@ Control Language="C#" AutoEventWireup="true" Inherits="UCtrl_wucSelTemplate" CodeFile="wucSelTemplate.ascx.cs" %>
<span>
    <%=LeftText %>
    <input id="txtTABLE_NAME" class="selshowinput" readonly="readonly" style="width:70%;float:left;" runat="server" type="text" />
    <input id="hidTABLE_ID" type="hidden"  runat="server"/>
    <input id="btnSelDept" runat="server" class="sel" type="button" onclick="selDept(this);" value="" style="float:left;" />
</span>