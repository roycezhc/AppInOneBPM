<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_tabShow.aspx.cs" Inherits="Ec_tabShow" %>
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
               <dt><%=Ec_tab.Attribute.Tabid.ZhName %>：</dt><%--Tabid--%>
               <dd>
               
                    <asp:Label id="txtTabid" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_tab.Attribute.Name.ZhName %>：</dt><%--模块名--%>
               <dd>
               
                    <asp:Label id="txtName" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_tab.Attribute.Presence.ZhName %>：</dt><%--Presenc--%>
               <dd>
               
                    <asp:Label id="txtPresence" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_tab.Attribute.Tabsequence.ZhName %>：</dt><%--Tabsequ--%>
               <dd>
               
                    <asp:Label id="txtTabsequence" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_tab.Attribute.Tablabel.ZhName %>：</dt><%--选项卡标签--%>
               <dd>
               
                    <asp:Label id="txtTablabel" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_tab.Attribute.Modifiedby.ZhName %>：</dt><%--Modifie--%>
               <dd>
               
                    <asp:Label id="txtModifiedby" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_tab.Attribute.Modifiedtime.ZhName %>：</dt><%--修改时间--%>
               <dd>
               
                    <asp:Label id="txtModifiedtime" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_tab.Attribute.Customized.ZhName %>：</dt><%--定制--%>
               <dd>
               
                    <asp:Label id="txtCustomized" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_tab.Attribute.Reportable.ZhName %>：</dt><%--Reporta--%>
               <dd>
               
                    <asp:Label id="txtReportable" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>