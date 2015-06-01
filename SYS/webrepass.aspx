<%@ Page Language="C#" AutoEventWireup="true" CodeFile="webrepass.aspx.cs" Inherits="SYS_webrepass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
         body{ margin:0; padding:0;}
           #login{margin:auto;margin-top:10%;background:url(IMG/修改密码/password_bg.png) center center no-repeat;width:600px;height:360px; font-family:微软雅黑; }
            #La{ color:#017f81 }
            body{ background-color:#e5e5e5}
            
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="login">
   <div id="La" ><asp:Label ID="txtName" runat="server" Text="Label"                      
            style=" position:absolute;  margin-top: 94px;  margin-left: 229px; height: 26px; width: 203px;"></asp:Label></div>
        
    <input id="txtPassOld" type="password" runat="server"      
            style="position:absolute; margin-top: 127px; margin-left: 229px; height: 30px; width: 205px; font-size:25px; background-color:White; border:none "/>
          <input id="txtPass" type="password" runat="server"                                   
            style="position:absolute; margin-top: 172px; margin-left: 229px; height: 30px; width: 205px;font-size:25px;  background-color:transparent;border:none "/>
          <input id="txtPassRe" type="password" runat="server"                         
            style="position:absolute; margin-top: 216px; margin-left: 229px; height: 30px; width: 205px;font-size:25px;  background-color:transparent;border:none "/>        
            &nbsp;
            <input type="image"  src="IMG/修改密码/button_queding1.jpg"  id="btnLogin" runat="server"
            onmousemove="this.src='IMG/修改密码/button_queding2.jpg'" onmouseout="this.src='IMG/修改密码/button_queding1.jpg'" onserverclick="btnLogin_Click"
            style="position:absolute; margin-top: 260px; margin-left: 180px; height: 34px; width: 94px; /*top: 400px; left: 560px;*/" />
            <input type="image" id="Button1"  src="IMG/修改密码/button_quxiao1.png" onmousemove="this.src='IMG/修改密码/button_quxiao1.png'" onmouseout="this.src='IMG/修改密码/button_quxiao2.png'"onserverclick="Button1_Click" 
            style="position:absolute; margin-top: 260px; margin-left: 340px; height: 34px; width: 94px; /*top: 400px; left: 770px;*/" />

     </div>
            &nbsp;</form>
           <span>&nbsp;</span>
</body>
</html>
