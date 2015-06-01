<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_FORMShow" CodeFile="FORMShow.aspx.cs" %>
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
               <dt><%=TF_FORM.Attribute.FORM_ID.ZhName %>：</dt><%--FORM_ID--%>
               <dd>
                
                    <asp:Label id="txtFORM_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_FORM.Attribute.F_NAME.ZhName %>：</dt><%--F_NAME--%>
               <dd>
                
                    <asp:Label id="txtF_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_FORM.Attribute.TB_ID.ZhName %>：</dt><%--主表ID--%>
               <dd>
                
                    <asp:Label id="txtTB_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_FORM.Attribute.TPL_EDIT.ZhName %>：</dt><%--TPL_EDIT--%>
               <dd>
                
                    <asp:Label id="txtTPL_EDIT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_FORM.Attribute.TPL_SHOW.ZhName %>：</dt><%--TPL_SHOW--%>
               <dd>
                
                    <asp:Label id="txtTPL_SHOW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_FORM.Attribute.TPL_PRINT.ZhName %>：</dt><%--TPL_PRINT--%>
               <dd>
                
                    <asp:Label id="txtTPL_PRINT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_FORM.Attribute.TPL_LIST.ZhName %>：</dt><%--TPL_LIST--%>
               <dd>
                
                    <asp:Label id="txtTPL_LIST" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_FORM.Attribute.TB_IDS.ZhName %>：</dt><%--其他关联表ID--%>
               <dd>
                
                    <asp:Label id="txtTB_IDS" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>