<%@ Control Language="C#" AutoEventWireup="true" Inherits="UCtrl_Sels_wucSelStation" CodeFile="wucSelStation.ascx.cs" %>
<span><input id="txtDEPT_NAME" readonly="readonly" style="width:70%;float:left;" runat="server" type="text" />
<input id="hidStation_ID" type="hidden"  runat="server"/>
<input id="btnSelStation" runat="server" class="sel" type="button" onclick="selStation(this);" value="" style="float:left;" /></span>