<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_BillView" CodeFile="BillView.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Lib/MyDP/seldate.js" type="text/javascript"></script>
    <script src="../../BILL/lib/billEdit.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="warn">
    <asp:Literal ID="litWarn" runat="server"></asp:Literal>
</div>
<div class="tblist">
<table>
    <asp:Literal ID="litList" runat="server"></asp:Literal>
    </table>
</div>
<div class="tbill" style="width:620px;">
    <input id="hidAppPath" type="hidden" runat="server" />
   <table>
       <caption>某某某表单</caption>
       <asp:Literal ID="litView" runat="server"></asp:Literal>
   </table>
</div>
</asp:Content>

