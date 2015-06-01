<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_FIELD_DBTYPEShow2" CodeFile="DBTYPEShow.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
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
               <dt><%=TF_FIELD_DBTYPE.Attribute.TYPE_ID.ZhName %>£º</dt><%--TYPE_ID--%>
               <dd>
                
                    <asp:Label id="txtTYPE_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_FIELD_DBTYPE.Attribute.TYPE_NAME.ZhName %>£º</dt><%--TYPE_NAME--%>
               <dd>
                
                    <asp:Label id="txtTYPE_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_FIELD_DBTYPE.Attribute.DB_TYPE.ZhName %>£º</dt><%--DB_TYPE--%>
               <dd>
                
                    <asp:Label id="txtDB_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_FIELD_DBTYPE.Attribute.CTRL_TYPES.ZhName %>£º</dt><%--CTRL_TYPES--%>
               <dd>
               
                    <asp:Label id="txtCTRL_TYPES" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>