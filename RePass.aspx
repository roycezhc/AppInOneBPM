<%@ Page Title="管理平台登录"  StylesheetTheme="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="RePass" CodeFile="RePass.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
    <link href="Themes/Index/Index.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    body{ background:none;}
    #login .form dl{clear:both;line-height:30px;height:30px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <div id="login-p">
<div id="login">
   <div id="l-left"></div>
   <div id="l-right" class="form">
         <h3 title="企业管理平台基础版"><%=SiteName%>密码修改</h3>
         
         <dl><dt>用户名：</dt><dd><span><asp:Literal ID="txtName" runat="server"></asp:Literal></span></dd></dl>
         <dl><dt>旧密码：</dt><dd><span><input id="txtPassOld" type="password" runat="server" /></span></dd></dl>
         <dl><dt>新密码：</dt><dd><span><input id="txtPass" type="password" runat="server" /></span></dd></dl>
         <dl><dt>再次输入：</dt><dd><span><input id="txtPassRe" type="password" runat="server" /></span></dd></dl>
         <dl class="btn">
            <dt>&nbsp;</dt>
            <dd>
             <span><asp:Button ID="btnLogin" runat="server" Text="确定修改" onclick="btnLogin_Click"/></span>
             <span><asp:Button ID="Button1" runat="server" Text="取消" onclick="Button1_Click" /></span>
            </dd>
         </dl>
         <div class="clear"></div>
   </div>
    <div class="clear"></div>
</div><a href="TestLogin.aspx">-</a></div>
</asp:Content>

