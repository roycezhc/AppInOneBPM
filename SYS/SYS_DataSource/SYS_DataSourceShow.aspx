<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_DATASOURCEShow" CodeFile="SYS_DATASOURCEShow.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" id="divC" runat="server">
    <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=SYS_DATASOURCE.Attribute.ID.ZhName %>：</dt><%--自动标识--%>
               <dd>
                
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_DATASOURCE.Attribute.SourceConnectString.ZhName %>：</dt><%--数据源连接字符串--%>
               <dd>
                
                    <asp:Label id="txtSourceConnectString" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_DATASOURCE.Attribute.SourceType.ZhName %>：</dt><%--数据源类型--%>
               <dd>
                
                    <asp:Label id="txtSourceType" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_DATASOURCE.Attribute.SourceName.ZhName %>：</dt><%--数据源简称--%>
               <dd>
                
                    <asp:Label id="txtSourceName" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>