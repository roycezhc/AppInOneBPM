<%@ Control Language="C#" AutoEventWireup="true" Inherits="UCtrl_wucTimeInput" CodeFile="wucTimeInput.ascx.cs" %>
<span style="font-size:12px;">
<input id="txtHour" type="text" value="12"  onkeyup="isNum(this,0,24);"  runat="server" style="width:30px;" />:<input id="txtMinute" type="text" value="00"  onkeyup="isNum(this,0,59);" runat="server" style="width:30px;"/><%if (_needSecond)
                                                                                                                                                                                                                               { %>:<input id="txtSecond" type="text" value="00" onkeyup="isNum(this,0,59);" runat="server" style="width:30px;"/><%} %>
</span>