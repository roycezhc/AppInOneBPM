<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModuleManage_Index.aspx.cs" Inherits="SYS_Power_ModulIndex" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>应用系统域索引</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:10px; margin-top:30px">
        应用系统域:
        </div>
    <div style="margin-left:50px">
    <% foreach(SYS_APP app1 in dic_app.Values){ %>
        <a href='ModuleManage.aspx?appid=<%=app1._APP_ID %>' target="_parent"><%=app1._APP_NAME%> - <%=app1.APP_LABEL%></a>
        <br /><br />
    <%} %>
        <%--
        <a href="ModuleManage_CRM.aspx" target="_parent"><%=dic_module["1"]%></a>
        <br /><br />
        <a href="ModuleManage_WEC.aspx" target="_parent"><%=dic_module["2"]%></a>
        <br /><br />
        <a href="ModuleManage_WECDetail.aspx" target="_parent"><%=dic_module["3"]%></a>
        <br /><br />--%>
    </div>
    </form>
</body>
</html>
