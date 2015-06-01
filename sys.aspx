<%@ Page Title="主页" Language="C#" AutoEventWireup="true" Inherits="_sys" CodeFile="sys.aspx.cs" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
    <div>
        <div style="background-color:Silver; padding:5px;">
            <h3>
                <font color="red">持久层与数据库的差异：</font>     
            </h3>
            <%=errStr %>
        </div><br />
        <div style="background-color:Silver; padding:5px;">
            <h3>
                <font color="red">数据库差异对比工具：</font>     
            </h3>
        <asp:Button ID="btnOut" Text="导出本地数据库XML" runat="server" />
        <br /><br />
        <input type=file />选择对比数据库XML源一
        <br />
        <input type=file />选择对比数据库XML源二
        <br />
        <asp:Button ID="btnCheck" Text="启动对比" runat="server" />
        </div>
    </div>
    </form>
</body>
</html>
