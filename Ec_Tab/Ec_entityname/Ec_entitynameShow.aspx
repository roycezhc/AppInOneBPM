<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_entitynameShow.aspx.cs" Inherits="Ec_entitynameShow" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
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
               <dt><%=Ec_entityname.Attribute.Tabid.ZhName %>：</dt><%--Tabid--%>
               <dd>
               
                    <asp:Label id="txtTabid" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_entityname.Attribute.Modulename.ZhName %>：</dt><%--IsTab英文--%>
               <dd>
               
                    <asp:Label id="txtModulename" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_entityname.Attribute.Tablename.ZhName %>：</dt><%--表名--%>
               <dd>
               
                    <asp:Label id="txtTablename" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_entityname.Attribute.Fieldname.ZhName %>：</dt><%--表NAME--%>
               <dd>
               
                    <asp:Label id="txtFieldname" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_entityname.Attribute.Entityidfield.ZhName %>：</dt><%--表ID--%>
               <dd>
               
                    <asp:Label id="txtEntityidfield" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_entityname.Attribute.Remarks.ZhName %>：</dt><%--IsTab中文--%>
               <dd>
               
                    <asp:Label id="txtRemarks" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>