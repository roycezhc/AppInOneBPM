<%@ Page Language="C#" Title="首页" AutoEventWireup="true" 
MasterPageFile="~/Themes/Main/Base.master" Inherits="CRM_Main" CodeFile="Main.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %><%@ Import Namespace="AgileFrame.Core" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<script type="text/javascript">
    function addLinkToTab(me) {
        parent.addLinkToTab($(me));
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <asp:ScriptManager ID="smDetail" runat="server">
    </asp:ScriptManager>
    <div class="main">
              <div class="indexMainPanel">
                  <h3><a><%=m_SName%></a> 您好！</h3>
                  <ul>
                      <li>今天你需要联系客户 <%=toDayConCount > 0 ? ("<a>" + toDayConCount + "</a>" + " 位，请按时完成。") : ("<a>" + toDayConCount + "</a>" + " 位，赶快去<a href=\"Customer\\CustHighSeas.aspx\" style=\"color:green;\">公海</a>捞客户吧！")%></li>
                      <li>过期未联系客户 <a><%=expiredCount %></a> 位，<%=expiredCount > 0 ? "请及时处理，否则系统将自动丢回公海。" : "请保持哦！"%></li>
                  </ul>
              </div>
              <div id="showCanDo" class="indexPanel" runat="server">
              <h3>您还可以：</h3>
              <dl id="sysMange" runat="server">
              <dt>系统管理:</dt>
              <dd>
              <a href="../../HR/STAFF/STAFFManageMulti.aspx">人员管理</a>
              </dd>
              </dl>
              <dl>
              <dt>客户管理:</dt>
              <dd>
                    <a href="CustHighSeas.aspx" data="{key:'kehuguanli'}" onclick="addLinkToTab(this);return false;">客户资料公海</a>
                    <a href="CustomerInformationManagement.aspx?SID=<%=m_SID %>" data="{key:'kehuguanli'}" onclick="addLinkToTab(this);return false;">客户资料管理</a>
                    <a href="CustomerInformationManagement.aspx?SID=<%=m_SID %>&ToDay=1" data="{key:'kehulianxi'}" onclick="addLinkToTab(this);return false;">今天需联系客户</a>
              </dd>
              </dl>
              </div>
    </div>
</asp:Content>
