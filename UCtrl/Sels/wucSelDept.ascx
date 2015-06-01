<%@ Control Language="C#" AutoEventWireup="true" Inherits="UCtrl_Sels_wucSelDept"
    CodeFile="wucSelDept.ascx.cs" %>
<span>
    <%=LeftText %>
    <input id="hidOrgId" value="<%=ORG_ID %>" type="hidden" />
    <input id="hidPDeptId" value="<%= P_DEPT_ID %>" type="hidden" />
    <input id="txtDEPT_NAME" class="selshowinput" readonly="readonly" style="width: 70%;
        float: left;" runat="server" type="text" />
    <input id="hidDEPT_ID" type="hidden" runat="server" />
    <input id="btnSelDept" runat="server" class="sel" type="button" onclick="selDept(this,$(&quot;input[id$='hidOrgId']&quot;).val(),$(&quot;input[id$='hidPDeptId']&quot;).val());"
        value="" style="float: left;" />
    
</span>

