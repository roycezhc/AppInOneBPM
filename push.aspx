<%@ Page Language="C#" AutoEventWireup="true" CodeFile="push.aspx.cs" Inherits="push" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     Alert:<input id="txtAlert" type="text" runat="server" value="测试" /><br><br>
     Sound:<input id="txtSound" type="text" runat="server" value ="default" /><br><br>
     Badge:<input id="txtBadge" type="text" runat="server" value ="1"/><br><br>
     自定义名称1：<input id="txtName1" type="text" runat="server" value="kind" />  自定义值1：<input id="txtVaule1" type="text" runat="server" value="1" /><br><br>
     自定义名称2：<input id="txtName2" type="text" runat="server" value="page"/>  自定义值2：<input id="txtVaule2" type="text" runat="server" value="2" /><br><br>
     自定义名称3：<input id="txtName3" type="text" runat="server" value="total"/>  自定义值3：<input id="txtVaule3" type="text" runat="server" value="3" /><br><br>
     <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
        <br><br>
    </div>
    </form>
</body>
</html>
