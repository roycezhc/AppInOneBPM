<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_relatedlistsShow.aspx.cs" Inherits="Ec_relatedlistsShow" %>
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
               <dt><%=Ec_relatedlists.Attribute.Relation_id.ZhName %>：</dt><%--Relatio--%>
               <dd>
               
                    <asp:Label id="txtRelation_id" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_relatedlists.Attribute.Tabid.ZhName %>：</dt><%--模块id--%>
               <dd>
               
                    <asp:Label id="txtTabid" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_relatedlists.Attribute.Related_tabid.ZhName %>：</dt><%--Related--%>
               <dd>
               
                    <asp:Label id="txtRelated_tabid" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_relatedlists.Attribute.Name.ZhName %>：</dt><%--Name--%>
               <dd>
               
                    <asp:Label id="txtName" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_relatedlists.Attribute.Sequence.ZhName %>：</dt><%--Sequenc--%>
               <dd>
               
                    <asp:Label id="txtSequence" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_relatedlists.Attribute.Label.ZhName %>：</dt><%--Label--%>
               <dd>
               
                    <asp:Label id="txtLabel" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_relatedlists.Attribute.Presence.ZhName %>：</dt><%--是否显示0显示--%>
               <dd>
               
                    <asp:Label id="txtPresence" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_relatedlists.Attribute.TabTableName.ZhName %>：</dt><%--主表名--%>
               <dd>
               
                    <asp:Label id="txtTabTableName" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_relatedlists.Attribute.ColumnName_PK.ZhName %>：</dt><%--主字段名--%>
               <dd>
               
                    <asp:Label id="txtColumnName_PK" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_relatedlists.Attribute.ColumnName_FK.ZhName %>：</dt><%--外联字段名--%>
               <dd>
               
                    <asp:Label id="txtColumnName_FK" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_relatedlists.Attribute.Related_tabTableName.ZhName %>：</dt><%--外联表名--%>
               <dd>
               
                    <asp:Label id="txtRelated_tabTableName" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>