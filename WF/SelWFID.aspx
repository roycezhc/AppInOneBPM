<%@ Page Title="" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_SelWFID" CodeFile="SelWFID.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main">
  <div class="titnav">
     <dl><dt><b></b></dt><dd><%--<a href="FORMBaseList.aspx">&lt;&lt;返回</a>--%></dd></dl>
  </div>
  <div class="ulist">
      <ul style=" margin-left:50px;">
          <asp:Repeater ID="repType" runat="server" 
              onitemdatabound="repType_ItemDataBound">
          <ItemTemplate>
          <li><div><a><b><%#((WF_TYPE)Container.DataItem).TYPE_NAME%></b></a></div>
          <ul>
              <asp:Repeater ID="repWF" runat="server">
              <ItemTemplate>
              <li><a href="Edit.aspx?WFID=<%#((WF_INFO)Container.DataItem).WFID%>&preUrl=<%=preUrl %>">
              <%#((WF_INFO)Container.DataItem).WFCNAME%>
              </a></li>
              </ItemTemplate>
              </asp:Repeater>
          </ul>
          </li>
          </ItemTemplate>
          </asp:Repeater>
      </ul>
    <%--  <asp:RadioButtonList ID="rblWF" runat="server">
      </asp:RadioButtonList>--%>
  </div>
  <div>&nbsp;</div>
</div>
</asp:Content>

