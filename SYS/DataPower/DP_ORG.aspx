<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_DataPower_DP_ORG" CodeFile="DP_ORG.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<script type="text/javascript">


</script>
<div class="main">
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="tool hide">
        <ol>
        <li>
            <asp:CheckBox ID="ckAll" runat="server" Text="拥有所有机构范围权限" />
        </li>
        </ol>
        </div>
    <div style="height:300px; overflow:auto; text-align:left;"">
        <asp:TreeView ID="tvORG" runat="server">
        </asp:TreeView>
    </div>
    
    <div class="tool">
        <ol>
            <li><span><asp:Button ID="btnSave" runat="server" Text="确定保存" 
                    onclick="btnSave_Click" /></span></li>
            
        </ol>
    </div>
</div>
</asp:Content>