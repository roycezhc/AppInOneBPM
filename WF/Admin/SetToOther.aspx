<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_Admin_SetToOther" CodeFile="SetToOther.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main">
  <div class="titnav">
     <dl><dt><b>委托授权给他人</b></dt></dl>
  </div>
  <div>&nbsp;</div>
  <div class="form">
     <dl><dt>&nbsp;</dt><dd><selStaff:wucSelStaff ID="wucSelStaff1" runat="server" /></dd></dl>
  </div>
  <div>&nbsp;</div>
  <div class="tool">
      
    <p><span><asp:Button ID="Button1" runat="server" Text="确定选择" 
            onclick="Button1_Click" /></span></p>
  </div>
</div>
</asp:Content>

