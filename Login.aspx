<%@ Page Language="C#" AutoEventWireup="true" Inherits="_Login" CodeFile="Login.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Lib/JQuery/jquery.min.js" type="text/javascript"></script>    
    <script src="Lib/userAgent.js" type="text/javascript"></script>
</head>
<body>
    <form action="LoginBack.aspx">
     <input name="preUrl" type="hidden" value="<%=preUrl %>" />
     <asp:PlaceHolder ID="phLogin" runat="server"></asp:PlaceHolder>     
     <%--<div style=" margin:auto; text-align :center" >测试帐号：<br>老板：boss/123456<br>运营总监：mike/123456<br>财务总监：lucy/123456<br>超级管理员：sys/123456</div>--%>
    </form>
</body>
</html>
