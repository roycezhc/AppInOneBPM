<%@ Control Language="C#" AutoEventWireup="true" Inherits="CRM_CustomerDetailsWUControl" CodeFile="CustomerDetailsWUControl.ascx.cs" %>
<div class="CustomerDetails">
    <div class="tool">
        <div>
            &nbsp;&nbsp;<span onclick="showDetail(this)">+</span>
            &nbsp;&nbsp;<a><%=this.ThisName%></a>
            &nbsp;&nbsp;<asp:Literal ID="LiteralTool" runat="server"></asp:Literal>
        </div>
    </div>
    <div style="display:none">
        <asp:Literal ID="LiteralDataShow" runat="server"></asp:Literal>
    </div>
</div>

