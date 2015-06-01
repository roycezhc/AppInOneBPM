<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_Default" CodeFile="Default.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/jsPlugin/tabs/tabs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="tabs">
   <div>
      <a href="#"><b>表单管理</b></a>
      <%--<a href="#"><b>表单界面</b></a>--%>
      <a href="#"><b>物理表管理</b></a>
   </div>
   <div>
      <div style="height:600px;"><iframe src="Index.aspx" id="Iframe1" frameborder="0"></iframe></div>
     <%-- <div style="height:600px;"><iframe src="BillSet.aspx?BillID=0" id="Iframe2" frameborder="0"></iframe></div>--%>
      <div style="height:600px;"><iframe src="IndexTB.aspx" id="Iframe3" frameborder="0"></iframe></div>
   </div>
</div>
</asp:Content>

