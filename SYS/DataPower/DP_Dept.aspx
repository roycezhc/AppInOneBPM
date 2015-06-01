<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_DataPower_DP_DEPT" CodeFile="DP_Dept.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/JScript/CkTreeSel.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<script type="text/javascript">
    $(function () {
        Chx.CkTreeSel.Paras.tvID = "tvDept";
        Chx.CkTreeSel.Paras.UnCheckedParent = false;
        Chx.CkTreeSel.initEvents();
    });
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
    <div style="height:300px; overflow:auto; text-align:left;">
        <asp:TreeView ID="tvDept" runat="server">
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